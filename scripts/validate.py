#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
import tomllib
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROFILES = ("plus-efficient", "plus-economy", "plus-quality")
ROLES = ("researcher", "analyst", "maker", "verifier", "reviewer")
MODELS = {"gpt-5.6-luna", "gpt-5.6-terra", "gpt-5.6-sol"}
EFFORTS = {"low", "medium", "high", "xhigh", "max"}


def fail(message: str, errors: list[str]) -> None:
    errors.append(message)


def validate_toml(errors: list[str]) -> None:
    for profile in PROFILES:
        profile_root = ROOT / "profiles" / profile / "codex"
        config_path = profile_root / "config.toml"
        if not config_path.is_file():
            fail(f"missing {config_path.relative_to(ROOT)}", errors)
            continue
        with config_path.open("rb") as handle:
            config = tomllib.load(handle)
        if config.get("model") not in MODELS:
            fail(f"unsupported root model in {profile}", errors)
        if config.get("model_reasoning_effort") not in EFFORTS:
            fail(f"unsupported root effort in {profile}", errors)
        agents = config.get("agents", {})
        concurrency = agents.get("max_concurrent_threads_per_session")
        if not isinstance(concurrency, int) or not 1 <= concurrency <= 3:
            fail(f"{profile} concurrency must be between 1 and 3", errors)

        for role in ROLES:
            role_path = profile_root / "agents" / f"{role}.toml"
            if not role_path.is_file():
                fail(f"missing {role_path.relative_to(ROOT)}", errors)
                continue
            with role_path.open("rb") as handle:
                agent = tomllib.load(handle)
            if agent.get("name") != role:
                fail(f"role name mismatch in {role_path.relative_to(ROOT)}", errors)
            if agent.get("model") not in MODELS:
                fail(f"unsupported model in {role_path.relative_to(ROOT)}", errors)
            if agent.get("model_reasoning_effort") not in EFFORTS:
                fail(f"unsupported effort in {role_path.relative_to(ROOT)}", errors)
            if not agent.get("developer_instructions", "").strip():
                fail(f"missing instructions in {role_path.relative_to(ROOT)}", errors)


def validate_skill(errors: list[str]) -> None:
    skill_path = ROOT / "skills" / "knowledge-work-orchestrator" / "SKILL.md"
    text = skill_path.read_text(encoding="utf-8")
    match = re.match(r"^---\n(.*?)\n---\n", text, flags=re.DOTALL)
    if not match:
        fail("SKILL.md has no YAML frontmatter", errors)
        return
    frontmatter = match.group(1)
    if "name: knowledge-work-orchestrator" not in frontmatter:
        fail("SKILL.md name is invalid", errors)
    if "description:" not in frontmatter:
        fail("SKILL.md description is missing", errors)


def validate_links(errors: list[str]) -> None:
    link_pattern = re.compile(r"\[[^\]]+\]\(([^)]+)\)")
    for markdown in ROOT.rglob("*.md"):
        text = markdown.read_text(encoding="utf-8")
        for target in link_pattern.findall(text):
            clean = target.split("#", 1)[0]
            if not clean or clean.startswith(("http://", "https://", "mailto:")):
                continue
            resolved = (markdown.parent / clean).resolve()
            if not resolved.exists():
                fail(f"broken link in {markdown.relative_to(ROOT)}: {target}", errors)


def validate_assets(errors: list[str]) -> None:
    for name in ("hero.svg", "architecture.svg"):
        path = ROOT / "assets" / name
        try:
            ET.parse(path)
        except (ET.ParseError, FileNotFoundError) as exc:
            fail(f"invalid asset {name}: {exc}", errors)


def validate_required_files(errors: list[str]) -> None:
    required = (
        "README.md",
        "LICENSE",
        "NOTICE",
        "CONTRIBUTING.md",
        "CODE_OF_CONDUCT.md",
        "SECURITY.md",
        "CHANGELOG.md",
        "CITATION.cff",
        "setup.sh",
        "setup.ps1",
        ".github/workflows/validate.yml",
    )
    for relative in required:
        if not (ROOT / relative).is_file():
            fail(f"missing {relative}", errors)


def main() -> int:
    errors: list[str] = []
    validate_required_files(errors)
    validate_toml(errors)
    validate_skill(errors)
    validate_links(errors)
    validate_assets(errors)
    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print(f"Validation passed: {len(PROFILES)} profiles, {len(PROFILES) * len(ROLES)} agent definitions, skill, links, and assets.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
