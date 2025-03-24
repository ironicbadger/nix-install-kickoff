#!/usr/bin/env -S just --justfile

## nix installation
install IP:
  ssh -o "StrictHostKeyChecking no" nixos@{{IP}} 'sudo bash -c "nix-shell -p git --run \"bash -c \\\"cd /root/ && \
    ([ -d nix-install-kickoff ] && rm -rf nix-install-kickoff || true) && \
    git clone https://github.com/ironicbadger/nix-install-kickoff.git && \
    cd nix-install-kickoff && \
    sh install-nix.sh\\\"\""'

## nix updates
hostname := `hostname | cut -d "." -f 1`
[linux]
switch target_host=hostname:
  cd nix && sudo nixos-rebuild switch --flake .#{{target_host}}
