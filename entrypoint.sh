#!/bin/sh

cd "${GITHUB_WORKSPACE}/" || exit 1

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"
export FILTER_MODE=added
export FAILED_ON_ERROR=true
export LEVEL=error
export REPORTER=github-pr-review

golangci-lint run --timeout 10m --out-format line-number --enable-all --disable wsl,gochecknoglobals,lll \
  | reviewdog -f=golangci-lint \
      -name="golangci-linter" \
      -reporter="${REPORTER}" \
      -filter-mode="${FILTER_MODE}" \
      -fail-on-error="${FAILED_ON_ERROR}" \
      -level="${LEVEL}"
