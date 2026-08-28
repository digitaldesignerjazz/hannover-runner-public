# Hannover Runner (Public Mirror)

Öffentlicher Spiegel des **Hannover** Self-Hosted GitHub Actions Runners für Lumina Network.

Teil von Esslinger Consulting Inc. / Nexus. Verantwortlich: CEO Sven Normen Esslinger, Esquire.

> **Sicherheitshinweis:** Der echte Runner-Token und die Registrierung bleiben im privaten Repo `digitaldesignerjazz/hannover-runner`. Dieses öffentliche Repo enthält nur die sichtbaren Artefakte: README, Registrierungsanleitung, Skripte und Workflows.

## Labels

`self-hosted`, `linux`, `x64`, `lumina`, `hannover`

## Registrierung (auf Hannover)

```bash
cd /opt/actions-runner
sudo ./svc.sh stop || true

# Token aus dem privaten Repo holen (Admin-Rechte nötig):
TOKEN=$(gh api -X POST repos/digitaldesignerjazz/hannover-runner/actions/runners/registration-token --jq .token)

sudo ./config.sh --url https://github.com/digitaldesignerjazz/hannover-runner \
  --token "$TOKEN" \
  --name hannover \
  --labels self-hosted,linux,x64,lumina,hannover \
  --unattended

sudo ./svc.sh install
sudo ./svc.sh start
```

Oder das Skript nutzen:

```bash
bash scripts/register-hannover.sh
```

## Workflows

- `lumina-runner.yml` — Backup / Restart / Start / Status (`workflow_dispatch`)
- `backup-restart-start.yml` — kombiniertes Backup + Restart + Start

## Tracking

- Issue #1 (lumina-network) — Backup, Restart, Start
- Issue #2 (lumina-network) — Runner registrieren
- Issue #3 (lumina-network) — Dieses Repo
