set dotenv-load

install-k3s:
    bash scripts/k3s-install.sh

install-cilium:
    bash scripts/cilium-install.sh

install-argo:
    bash scripts/argo-install.sh

uninstall:
    bash scripts/uninstall.sh

rotate:
    bash scripts/rotate.sh

join-agent:
    bash scripts/k3s-join-agent.sh
