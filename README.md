# Enterprise-Inter-VLAN-Routing-DHCP-Automation
This repository contains a full-scale virtual networking lab implemented using Windows Server 2022 on Hyper-V. The project demonstrates how to transform a standard server into an enterprise-grade router with multi-department isolation and automated IP management.

Project Overview
This project demonstrates the design and deployment of a virtualised enterprise network infrastructure utilising Windows Server 2022 within a Hyper-V environment. The primary objective was to build a robust system capable of handling multiple department networks through VLAN segmentation, centralized DHCP management, and secure Layer 3 routing. By leveraging RRAS (Routing and Remote Access Service), the server acts as a core router, providing both Inter-VLAN communication and secure Internet access via NAT (Network Address Translation).


Lab Implementation Journey
The implementation began with a strategic installation of essential server roles, focusing on Remote Access for routing capabilities and DHCP for automated client configuration. A critical phase of the project involved infrastructure preparation on the Hyper-V host, where multiple virtual network adapters were created and tagged with specific VLAN IDs (10, 20, 30) to ensure strict Layer 2 isolation between subnets. This setup simulates a "Router-on-a-Stick" topology within a virtualized environment.

A significant technical challenge addressed in this lab was the DHCP listening issue on virtual interfaces. Through advanced PowerShell scripting, a manual IPv4 interface binding fix was implemented, forcing the DHCP service to communicate across all gateway addresses (172.16.x.1). Finally, NAT was configured to bridge the private departmental subnets with the WAN interface, ensuring end-to-end connectivity from the local clients to the internet.


Automation & Scripting
To ensure scalability and rapid redeployment, the entire lifecycle of the lab—from role installation to complex network bindings—was automated using PowerShell. The provided scripts eliminate manual configuration errors and serve as an "Infrastructure as Code" (IaC) template for networking professionals. These scripts cover the creation of DHCP scopes, gateway options, DNS settings, and host-side virtual switch management in a logical, step-by-step sequence.


Development Logs (Commit History)
Latest Commit Message: feat: implement Inter-VLAN routing and multi-scope DHCP on Hyper-V

This milestone includes the full automation of VLAN adapter creation and tagging on the host side. It marks the successful configuration of RRAS for L3 Routing and NAT, alongside a critical fix for DHCP listener issues using manual IPv4 interface binding. The project has been fully verified for Inter-VLAN connectivity and stable WAN access across all subnets.
