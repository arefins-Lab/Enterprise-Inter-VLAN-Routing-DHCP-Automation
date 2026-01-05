# Enterprise-Inter-VLAN-Routing-DHCP-Automation
This repository contains a full-scale virtual networking lab implemented using Windows Server 2022 on Hyper-V. The project demonstrates how to transform a standard server into an enterprise-grade router with multi-department isolation and automated IP management.

Project Overview
The goal of this lab was to design a network that segments different departments using VLANs, provides centralised DHCP management, and enables secure inter-VLAN routing and Internet Access (NAT).

Key Features:
VLAN Segmentation: 
Layer 2 isolation for 3 departments (VLAN 10, 20, 30).
Router-on-a-Stick (Virtual): 
Using Hyper-V Synthetic Adapters for routing.
Multi-Scope DHCP: 
Centralised IP distribution with interface binding fix.
NAT Implementation: 
Providing WAN/Internet access to private subnets.
Automation: 
Full lab deployment via PowerShell.
Lab Implementation Steps (Sequence)


Server Role Installation
We started by enabling the core network services on Windows Server 2022.
Remote Access (RRAS): For Routing and NAT.
DHCP Server: For automated IP management.


Networking Setup
WAN & LAN Configuration: Configured static IPs for all department gateways.
Virtual Switch: Implemented a single internal virtual switch to carry all VLAN traffic.
VLAN Tagging: Created and tagged virtual adapters on the Hyper-V host to ensure traffic isolation.


DHCP & Routing Logic
DHCP Scopes: Created dedicated pools for each VLAN.
Binding Fix: Applied a critical PowerShell fix to ensure the DHCP service listens on all virtual gateway interfaces.
RRAS Initialization: Activated LAN routing to allow communication between subnets.


Automation Scripts
The entire lab can be audited or redeployed using the provided PowerShell scripts in the /scripts folder.
Master-Lab-Automation.ps1: One-stop command list for roles, DHCP, and host networking.


Troubleshooting Tips
DHCP Not Assigning IPs: Always verify if the DHCP service is bound to the VLAN gateway IP.
Ping Fails: Check Windows Firewall rules (ICMPv4) on the destination VM.
No Internet: Ensure the WAN interface in RRAS is set to "Public" mode with NAT enabled.

Development Logs (Commit History)
Latest Commit Message: feat: implement Inter-VLAN routing and multi-scope DHCP on Hyper-V
Automated VLAN adapter creation and tagging via PowerShell.
Configured RRAS for L3 Routing and NAT.
Resolved DHCP listener issues using manual IPv4 interface binding.
Verified Inter-VLAN connectivity and WAN access.
