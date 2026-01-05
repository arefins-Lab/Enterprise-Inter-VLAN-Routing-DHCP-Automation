# Enterprise-Inter-VLAN-Routing-DHCP-Automation
This repository contains a full-scale virtual networking lab implemented using Windows Server 2022 on Hyper-V. The project demonstrates how to transform a standard server into an enterprise-grade router with multi-department isolation and automated IP management.

Project Overview:

This project demonstrates the implementation of a virtualized enterprise network using Windows Server 2022 on Hyper-V. The setup transforms a single server into a powerful core router capable of managing multiple isolated department networks via VLANs, centralized DHCP, and secure NAT for internet access.





Key Implementations:

Infrastructure Isolation: Created 3 distinct departments using VLANs 10, 20, and 30 with Layer 2 isolation on Hyper-V.

Core Routing: Configured Remote Access (RRAS) to enable seamless communication between different subnets (Inter-VLAN Routing).

Automated IP Management: Deployed a Multi-Scope DHCP Server to provide automated networking for each department.

Critical Binding Fix: Resolved DHCP listener issues across virtual interfaces using a specialized PowerShell interface binding fix.

Internet Connectivity: Implemented NAT to bridge private LAN traffic with the WAN interface for secure internet browsing.





Infrastructure as Code (Automation):

To ensure rapid deployment and eliminate manual configuration errors, I developed a Master PowerShell Script. This script automates:

Host Level: Virtual adapter creation and VLAN tagging.

Server Level: Installation of RRAS and DHCP roles.

Service Level: Full configuration of DHCP scopes, gateways, and interface bindings.






Development Logs (Commit History):

Latest Commit: feat: implement Inter-VLAN routing and multi-scope DHCP on Hyper-V

Automated VLAN adapter creation and tagging via PowerShell.

Configured RRAS for L3 Routing and NAT.

Resolved DHCP listener issues using manual IPv4 interface binding.

Verified full Inter-VLAN connectivity and WAN access.
