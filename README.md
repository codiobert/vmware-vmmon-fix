# vmware-vmmon-fix
This shell script fix VMWare 17.x "cannot open /dev/vmmon" error message when trying to start a virtual machine in Ubuntu.
The script is an automation for oficial VMWare solution steps: ["Cannot open /dev/vmmon: No such file or directory" error when powering on a VM - 2146460](https://kb.vmware.com/s/article/2146460)

This error occurs in Linux systems with UEFI and BIOS secure boot enabled, disabling secure boot in the BIOS fixes the problem but would leave your computer vulnerable to some types of attacks.
I recommend you follow these steps to fix the error and keep the secure boot enabled:

# Supported Ubuntu versions
- Ubuntu 21.10 (tested)
- Ubuntu 22.04 (tested)
- I have not tested this in other Ubuntu versions but it should work without problems

# Steps
1. Clone this repository
2. Execute `chmod +x ./vmware-vmmon-fix.sh`
3. Execute `sudo ./vmware-vmmon-fix.sh`
4. The script will ask you to insert a password, the BIOS will ask you for this password when the computer is rebooted and the key is applied.
5. Reboot the computer and follow your BIOS instructions for apply the new key on boot.

# Persistence
When the VMWare is updated the problem reappears, you can execute this script again to fix the problem again
