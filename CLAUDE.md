# CLAUDE.md

This file provides guidance to Claude Code when creating bash, Python, and batch scripts for quick automations on your machine.

## Important
- ALL instructions within this document MUST BE FOLLOWED, these are not optional unless explicitly stated.
- DO NOT edit more code than you have to.
- DO NOT WASTE TOKENS, be succinct and concise.

## Script Creation Priority Rules
- IMMEDIATE EXECUTION: Generate scripts that run out-of-the-box with correct shebangs and permissions.
- NO CLARIFICATION: Assume defaults for interpreter versions unless specified.
- REUSABLE TEMPLATES: Provide a standard header with usage and help flags.
- FAST PROTOTYPING: Minimal boilerplate.

## When to Create a Script
- Commands you run frequently on the CLI.
- File operations, data transformations, or environment setup.
- Repetitive tasks best automated.

## Ultra-Fast Script Generation Workflow
Upon any script creation request, produce these 9 elements:
1. Create `scripts/<script_name>.<ext>` (ext: sh, py, or bat).
2. Add appropriate shebang (`#!/usr/bin/env bash`, `#!/usr/bin/env python3`, or none for bat).
3. Implement `--help` flag with usage details.
4. Include argument parsing stub.
5. Set executable permissions (`chmod +x` for sh/py).
6. Write a brief description in the header comments.
7. Add example usage in comments.
8. Update the `scripts/README.md` index.
9. (Optional) Add a test stub under `tests/`.

## Template Snippets
- Bash:
  ```bash
  #!/usr/bin/env bash
  # Description: ...
  # Usage: ./script.sh [options]
  
  while getopts "h" opt; do
    case $opt in
      h) echo "Usage: ./script.sh"; exit 0 ;;
    esac
  done
  
  # ... existing code ...
  ```
- Python:
  ```python
  #!/usr/bin/env python3
  """
  Description: ...
  
  Usage:
    script.py --help
  """
  import argparse
  
  def main():
      parser = argparse.ArgumentParser(description="...")
      parser.add_argument('--foo', help="...")
      args = parser.parse_args()
      # ... existing code ...
  
  if __name__ == "__main__":
      main()
  ```
- Batch:
  ```bat
  @echo off
  REM Description: ...
  REM Usage: script.bat [options]
  
  if "%1"=="--help" (
    echo Usage: script.bat
    exit /B 0
  )
  
  REM ... existing code ...
  ```

## Token Optimization
- Strip comments when analyzing.
- Prefer concise code over verbose logging.

## References
- Bash scripting best practices.
- Python official docs.
- Windows batch file guides.