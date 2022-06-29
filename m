Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A455FB98
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:17:39 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TpK-00029U-DD
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th0-0000fy-WF; Wed, 29 Jun 2022 05:09:10 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Tgy-0003XS-Ok; Wed, 29 Jun 2022 05:09:02 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MORR2-1oGytr3Vra-00Px6P; Wed, 29
 Jun 2022 11:08:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/11] hw/pci-host/i440fx: Remove unused parameter from
 i440fx_init()
Date: Wed, 29 Jun 2022 11:08:45 +0200
Message-Id: <20220629090849.1350227-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UW6Qo2efnOFQMuP8uIVAPpQiETGQYtE3AzDHIo8hEKTtE6rQ50l
 yNqReuLs1Hm8z1SUrxYAP7jRPf20FwclvABlTsWYBA33urNzdH99FqzKO6887N98WyH3H/3
 cnU22Um8afgH+lR4ltWrUYai7XoLawIk98O0CyVa+YU1AZ477dkp2gxwX60pC8CtDP2JfQQ
 vvVJYfgnSqmnYUn4fi/Ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QAkajim2xxQ=:Ryjfal/zWPojTfZLL22m3s
 bsm76jbIpB/VNE5LPEzRaHuDNztxgx8Joy/fO4vPX4XdRO6O8HVe+pZvdS0LYBP13Z2LSId72
 WJS7H2syW3684N9iaGtQoMt+bs341zPfMyhifP/H/lWdZOTHlWddlRSWeshBw6iNDHghIwYnO
 /yvidqT837lCDfO6XQVe4dcYdDuHeh74sU/dnc6/fCZnL8fNuiwco+UHzOYt8m85Eo89nXtAN
 mX+YxcZeQJWyKqEnMfdNdzcNhTQdTZFwx3REDAhcd410nDYMQZQFToHzkyPFfzYf0qSYQJDez
 BmgxI/OB9uCrChEV9Q4SYFXSY8VySKmHu7myIvdHmaIocM+bnVoyv8V/8jBeI32+iF3sX0Dmk
 Jxy0lIajEF7pq1wetPk7t/vLtCuRSvpoE8w6+q0YL5o+JLVb3mNBiemm8GXhF7x0sYd/OvLPk
 6Y19SyXXkv74IthA8JM8S07WN2d1c3vOeWra0v0Ec6YSIT6mip+M0Irvr4uF+0ZUlk+760Jaw
 NS0XLg80PJ4dn7IctMimWA81oHp/Ojsrn57teeGZwieR7obZwZE7KlVvbpxBwA5PGKKhNOGCJ
 fM8Y4KNsOJGMBDND2Oze8K3YrkvkKrUe+Otq4eGdL0Ft60okTJJR5cVDFTueWJwPhJLIjSRvF
 oakkGImgfMmNEhwtgY1LsfReGq3lx1qCnEWTBItpYrg1F0+oGXqOnyMIpD7NoNW3alHWirhbW
 5wIdpka0rlyMEup3FqnfZBpyCNxpg5WKrci9VQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

pi440fx_state is an out-parameter which is never read by the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220612192800.40813-1-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/pc_piix.c            | 3 ---
 hw/pci-host/i440fx.c         | 4 +---
 include/hw/pci-host/i440fx.h | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0fc2361ffeda..a234989ac363 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -82,7 +82,6 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    PCII440FXState *i440fx_state;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -203,7 +202,6 @@ static void pc_init1(MachineState *machine,
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
@@ -217,7 +215,6 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
-        i440fx_state = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
         pcms->hpet_enabled = false;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b6e..1c5ad5f918a2 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -238,7 +238,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
 }
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -264,8 +263,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     d = pci_create_simple(b, 0, pci_type);
-    *pi440fx_state = I440FX_PCI_DEVICE(d);
-    f = *pi440fx_state;
+    f = I440FX_PCI_DEVICE(d);
     f->system_memory = address_space_mem;
     f->pci_address_space = pci_address_space;
     f->ram_memory = ram_memory;
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8fda..52518dbf08e6 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,6 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.36.1


