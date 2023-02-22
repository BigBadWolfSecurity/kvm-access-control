1. `sudo semodule -i module.cil`
2. `sudo ./virtual-networking.sh`
3. `sudo ./iptables.sh`
4. `sudo ./cipso.sh`

In virt-manager, my config looks like this, which you need to edit the networking xml directly.

`<interface type="direct">`  
  `<mac address="52:54:00:2f:0a:40"/>`  
  `<source dev="left" mode="passthrough"/>`  
  `<target dev="macvtap0"/>`  
  `<model type="virtio"/>`  
  `<alias name="net0"/>`  
  `<address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>`  
`</interface>`  

This will generate denials like the following:

```
#============= left_vm_t ==============
allow left_vm_t bare_netif_t:netif ingress;
allow left_vm_t left_packet_t:packet forward_in;
allow left_vm_t node_t:node recvfrom;

#============= right_vm_t ==============
allow right_vm_t bare_netif_t:netif ingress;
allow right_vm_t node_t:node recvfrom;
allow right_vm_t right_packet_t:packet forward_in;
```
