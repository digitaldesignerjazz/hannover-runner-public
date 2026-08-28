# Hannover Runner — Public Registration

This public repository mirrors the **Hannover** self-hosted GitHub Actions runner for Lumina Network.

## Labels

`self-hosted`, `linux`, `x64`, `lumina`, `hannover`

## Register the runner

```bash
cd /opt/actions-runner
sudo ./svc.sh stop || true

# Registration token comes from the private repo (admin rights required):
TOKEN=$(gh api -X POST repos/digitaldesignerjazz/hannover-runner/actions/runners/registration-token --jq .token)

sudo ./config.sh --url https://github.com/digitaldesignerjazz/hannover-runner \
  --token "$TOKEN" \
  --name hannover \
  --labels self-hosted,linux,x64,lumina,hannover \
  --unattended

sudo ./svc.sh install
sudo ./svc.sh start
```

Or run the helper script:

```bash
bash scripts/register-hannover.sh
```

## Workflows

- `lumina-runner.yml` — backup / restart / start / status
- `backup-restart-start.yml` — combined backup + restart + start

## Tracking

- Issue #1 (lumina-network) — Backup, Restart, Start
- Issue #2 (lumina-network) — Runner registrieren
- Issue #3 (lumina-network) — Dieses Repo
