#!/usr/bin/env bash
# Registriert den Hannover-Runner auf Repo-Ebene (digitaldesignerjazz/hannover-runner).
# Labels: self-hosted, linux, x64, lumina, hannover
# Hinweis: Dieses Skript lebt im öffentlichen Spiegel; der Token kommt aus dem privaten Repo.
set -euo pipefail

REPO="digitaldesignerjazz/hannover-runner"
RUNNER_DIR="/opt/actions-runner"

cd "$RUNNER_DIR"
sudo ./svc.sh stop || true

TOKEN=$(gh api -X POST "repos/${REPO}/actions/runners/registration-token" --jq .token)

sudo ./config.sh --url "https://github.com/${REPO}" \
  --token "$TOKEN" \
  --name hannover \
  --labels self-hosted,linux,x64,lumina,hannover \
  --unattended

sudo ./svc.sh install
sudo ./svc.sh start

echo "Runner hannover registriert und gestartet auf ${REPO}."
