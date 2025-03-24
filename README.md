# ironicbadger/nix-install-kickoff

This repository is designed to install NixOS into a VM via SSH in a fairly generic way. You will likely wish to fork this repo and modify the flake to suit your needs as this VM is currently configured with Nvidia drivers and other niceties to use as an "AI basecamp" system with a passed through GPU.

The assumptions made for the environment include:

+ Running via QEMU (tested using Proxmox)
+ Block storage for the root disk is backed by a VirtIO controller (using QEMU). The included `disko.nix` file will format the device it finds at `/dev/vda`.
+ You are passing through an Nvidia GPU (optional - see note above).

## Usage

+ Boot a VM using a minimal Nix ISO.
+ Set a password using `passwd` for the `nixos` user.
+ Execute `just install 1.2.3.4` substituing the IP address accordingly.

Once installation has concluded, and before rebooting, set a password in the installed system by:

+ `nixos-enter --root /mnt`
+ `passwd`

Then exit the "chroot" environment with `Ctrl+D` and reboot into your new system.

Automation around passwords was deliberately not included in order to keep this repo as simple as possible without resorting to any encryption libraries.

Have fun and happy Nix'ing.