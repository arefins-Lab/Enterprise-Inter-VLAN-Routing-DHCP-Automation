# Remote Access Install
Install-WindowsFeature -Name RemoteAccess, DirectAccess-VPN, Routing -IncludeManagementTools

# DHCP Role Install
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# WAN & LAN IP Configuration (Manual Guide)
# Assign IP 192.168.0.x to WAN Adapter
# Assign IPs 172.16.10.1, 172.16.20.1, 172.16.30.1 to respective LAN/VLAN Adapters

# Initialize RRAS Routing
Install-RemoteAccess -VpnType RoutingOnly

# Virtual Switch Configuration (On Host)
# Ensure a Virtual Switch named "LAN-Switch" is created in Hyper-V Manager

# VLAN Adapter Creation (On Host)
Add-VMNetworkAdapter -VMName "RRAS-EDGE01" -Name "VLAN10" -SwitchName "LAN-Switch"
Add-VMNetworkAdapter -VMName "RRAS-EDGE01" -Name "VLAN20" -SwitchName "LAN-Switch"
Add-VMNetworkAdapter -VMName "RRAS-EDGE01" -Name "VLAN30" -SwitchName "LAN-Switch"

# VLAN Tagging Configuration (On Host)
Set-VMNetworkAdapterVlan -VMName "RRAS-EDGE01" -VMNetworkAdapterName "VLAN10" -Access -VlanId 10
Set-VMNetworkAdapterVlan -VMName "RRAS-EDGE01" -VMNetworkAdapterName "VLAN20" -Access -VlanId 20
Set-VMNetworkAdapterVlan -VMName "RRAS-EDGE01" -VMNetworkAdapterName "VLAN30" -Access -VlanId 30

# DHCP Multi-Scope Setup
Add-DhcpServerv4Scope -Name "VLAN10" -StartRange 172.16.10.10 -EndRange 172.16.10.254 -SubnetMask 255.255.255.0
Add-DhcpServerv4Scope -Name "VLAN20" -StartRange 172.16.20.10 -EndRange 172.16.20.254 -SubnetMask 255.255.255.0
Add-DhcpServerv4Scope -Name "VLAN30" -StartRange 172.16.30.10 -EndRange 172.16.30.254 -SubnetMask 255.255.255.0

# Configure Gateway & DNS Options
Set-DhcpServerv4OptionValue -ScopeId 172.16.10.0 -Router 172.16.10.1 -DnsServer 8.8.8.8
Set-DhcpServerv4OptionValue -ScopeId 172.16.20.0 -Router 172.16.20.1 -DnsServer 8.8.8.8
Set-DhcpServerv4OptionValue -ScopeId 172.16.30.0 -Router 172.16.30.1 -DnsServer 8.8.8.8

# DHCP Interface Binding Fix
Set-DhcpServerv4Binding -IPAddress 172.16.10.1 -BindingState $true
Set-DhcpServerv4Binding -IPAddress 172.16.20.1 -BindingState $true
Set-DhcpServerv4Binding -IPAddress 172.16.30.1 -BindingState $true

# Restart DHCP Service
Restart-Service DHCPServer -Force

# --- TROUBLESHOOTING & VERIFICATION COMMANDS ---

# Check DHCP Service Status
Get-Service DHCPServer

# Restart DHCP Service (If IP is not assigning)
Restart-Service DHCPServer -Force

# Verify DHCP Scopes and Lease Information
Get-DhcpServerv4Scope
Get-DhcpServerv4Lease -ScopeId 172.16.10.0

# Check IPv4 Routing Table (Verify Inter-VLAN Routes)
Get-NetRoute -AddressFamily IPv4

# Verify VLAN Tagging on Host (Run on Host)
Get-VMNetworkAdapterVlan -VMName "RRAS-EDGE01"

# Test Inter-VLAN Connectivity (Ping from Server)
Test-NetConnection -ComputerName 172.16.10.10 -Port 80