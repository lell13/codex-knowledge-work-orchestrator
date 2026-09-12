#!/usr/bin/env bash
set -euo pipefail

target_path="${1:-}"
profile="${2:-plus-efficient}"
force="${3:-}"

if [[ -z "$target_path" ]]; then
  echo "Usage: ./setup.sh /path/to/project [plus-efficient|plus-economy|plus-quality] [--force]" >&2
  exit 1
fi

case "$profile" in
  plus-efficient|plus-economy|plus-quality) ;;
  *) echo "Unknown profile: $profile" >&2; exit 1 ;;
esac

if [[ ! -d "$target_path" ]]; then
  echo "Target directory does not exist: $target_path" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
profile_root="$script_dir/profiles/$profile/codex"
skill_root="$script_dir/skills/knowledge-work-orchestrator"
stamp="$(date +%Y%m%d-%H%M%S)"

collect_files() {
  local source_root="$1"
  local destination_root="$2"
  while IFS= read -r -d '' source_file; do
    relative="${source_file#"$source_root"/}"
    destination_file="$destination_root/$relative"
    if [[ -f "$destination_file" ]] && ! cmp -s "$source_file" "$destination_file"; then
      printf '%s -> %s\n' "$source_file" "$destination_file"
    fi
  done < <(find "$source_root" -type f -print0)
}

conflicts="$(
  collect_files "$profile_root" "$target_path/.codex"
  collect_files "$skill_root" "$target_path/.agents/skills/knowledge-work-orchestrator"
)"

if [[ -n "$conflicts" && "$force" != "--force" ]]; then
  echo "Existing files would change:" >&2
  printf '%s\n' "$conflicts" >&2
  echo "Re-run with --force to back them up and install." >&2
  exit 2
fi

install_tree() {
  local source_root="$1"
  local destination_root="$2"
  while IFS= read -r -d '' source_file; do
    relative="${source_file#"$source_root"/}"
    destination_file="$destination_root/$relative"
    mkdir -p "$(dirname "$destination_file")"
    if [[ -f "$destination_file" ]] && ! cmp -s "$source_file" "$destination_file"; then
      cp "$destination_file" "$destination_file.backup-$stamp"
    fi
    cp "$source_file" "$destination_file"
  done < <(find "$source_root" -type f -print0)
}

install_tree "$profile_root" "$target_path/.codex"
install_tree "$skill_root" "$target_path/.agents/skills/knowledge-work-orchestrator"

echo "Installed profile '$profile' in $target_path"
echo "Restart Codex in the target project to load project-scoped configuration."
