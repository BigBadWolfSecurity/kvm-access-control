1. `sudo semodule -i module.cil`
2. `sudo ./virtual-networking.sh`
3. `sudo ./iptables.sh`

In virt-manager, my config looks like this, which you need to edit the networking xml directly.

<interface type="direct">
  <mac address="52:54:00:2f:0a:40"/>
  <source dev="left" mode="passthrough"/>
  <target dev="macvtap0"/>
  <model type="virtio"/>
  <alias name="net0"/>
  <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
</interface>
 
