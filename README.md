# vmware-vmmon-fix
This shell script fixes the VMware 17.x / 26.x "cannot open /dev/vmmon" error message when trying to start a virtual machine in Ubuntu.
The script is an automation of official VMware solution steps: ["Cannot open /dev/vmmon: No such file or directory" error when powering on a VM - 2146460](https://kb.vmware.com/s/article/2146460)

This error occurs in Linux systems with UEFI and BIOS Secure Boot enabled. Disabling Secure Boot in the BIOS fixes the problem, but leaves your computer vulnerable to some types of attacks.
I recommend you follow these steps to fix the error while keeping Secure Boot enabled:

# Supported & Tested environments
- Ubuntu 21.10 (tested)
- Ubuntu 22.04 (tested)
- Ubuntu 26.04 + VMware 26H1 (community confirmed)
- *Note:* It should work on other Ubuntu versions and newer VMware releases without problems.

# Steps
1. Clone this repository
2. Execute `chmod +x ./vmware-vmmon-fix.sh`
3. Execute `sudo ./vmware-vmmon-fix.sh`
4. The script will ask you to insert a password. The BIOS will ask for this password when the computer reboots and the key is enrolled.
5. Reboot the computer and follow your BIOS/MOK instructions to enroll the new key on boot.

# Persistence
When VMware is updated, the issue may reappear. You can execute this script again to sign the modules and resolve it.

# Credits
Thanks to [@MB901](https://github.com/MB901) for testing and confirming compatibility with Ubuntu 26.04 & VMware 26H1.