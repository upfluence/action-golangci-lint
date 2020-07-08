# GitHub Action: Run linter onto Upfluence go project

## Release new version
After pull request was approved and merged into master
If code can work with old configuration, use same tag as before
If your code include breaking change change label and inform all Upfluence team about your changes.


## Add this acton to your go project
run command into your project directory
```bash
mkdir -p .github/workflows
```
Create file lint.yml
```yml
name: reviewdog
on: [pull_request]

jobs:
  linter:
    name: runner / golangci-lint
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v1
      - name: golangci
        uses: upfluence/action-golangci-lint@v1
        with:
          github_token: ${{ secrets.github_token }}
```
