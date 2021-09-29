Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3041C1D8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:43:58 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW85-0005Tp-99
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtY-0001vL-Tg
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:50545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0005nE-05
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:56 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfYc4-1n2dic0zqC-00g09D; Wed, 29
 Sep 2021 11:28:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] nubus: move nubus to its own 32-bit address space
Date: Wed, 29 Sep 2021 11:28:35 +0200
Message-Id: <20210929092843.2686234-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7CvuLKVXITNH7Lgq5L2h3O9UPRpkiuY7M9OoiX1W2TvwhATG8OH
 H5HpDsEMDMsGU12DFbm3pD5ZlMGykIcRk0tsfETreQZdxhfoYkWCYW58+6B1xXSSptQ+88G
 AbbO6aNMclatxiSf3sP7Sr6lWy7MQoB/2jiNsAdt1pMvp9HnE/QnRDNP/JvMJpkeVieFPlI
 oo6iZA9kimWsUDeJGfVrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+/VBJDAUVY=:DR58mU65kRyOXBvD1ED343
 M2ahRN7JzdfnpozmRzEcksuvMnBVMcKPs9zHpgmtpewlWqlinutKxC6SXK8vlY3+znEKbDg6B
 3AeBoyyitUG7RQQbD/gm/QHXf9C++ympwaXxsPc1dIkKwuIFLXToUnIZMqyTMNlasl+w2E8wl
 mz3+bARKPcChECRV8av4TKyWQiOrecLrMZ1yciJSRIQYO0QhcudlUjB35volOb5Gk3GGXAT8g
 VrU/K1hDJJVdeZFbEoUx3E5KlvsojN8OVIEhl3k2dYLt/nAW66Ksl6hIpIR3evtU3xDo3z0YM
 zbO6araVL8PHNohH2DGnlfugrR5TlUDpetqR9UhWkKZjWyIsUebFu8JVY2TNdyJXUVkDADoj3
 xRQCLvGpN8pwGhLVRYNGWJQ1Rbz7b76TEc0Ofu9Gr8rW6lbFoYepbf+XhPcJRcq1OaPlii5kl
 /eDP35Uxrj1+Q/NDuTQjZgWTezcz3pWAmTtif2MiBWGS+k977TqGM/QPLLFCnB1aLWKMhBuuI
 uU0VHrtEN61RjVPH/YfZ2KCzQIHXzNDuZjbbmRwEfwRE8vc9znpM4qrABBkoMaYYgmPmbOyjm
 O4WooFB6ex7wUhbdKa3jDoWO5FW5mexbwPjlDP/1UT5/Rfj4aDWSqmYuPle4hyesCFJnzarnp
 ZSeeiptmpuR17zFE1nZ8yXecLUBFqx0t/F1r3XNGL4MF+7Pl1VLQCGpRfQ5R/fOmCGuCGJ4kb
 Gn3afqesF5w3gAFSaCUi3+r8iQ7lEByH5Nk9MQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to "Designing Cards and Drivers for the Macintosh Family" the Nubus
has its own 32-bit address space based upon physical slot addressing.

Move Nubus to its own 32-bit address space and then use memory region aliases
to map available slot and super slot ranges into the q800 system address
space via the Macintosh Nubus bridge.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-13-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/mac-nubus-bridge.h |  2 ++
 include/hw/nubus/nubus.h            |  6 ++++++
 hw/m68k/q800.c                      |  9 ++++-----
 hw/nubus/mac-nubus-bridge.c         | 16 ++++++++++++++--
 hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
 5 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 118d67267dd5..04451d357c50 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -23,6 +23,8 @@ struct MacNubusState {
     SysBusDevice sysbus_dev;
 
     NubusBus *bus;
+    MemoryRegion super_slot_alias;
+    MemoryRegion slot_alias;
 };
 
 #endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 343be958417a..9f9386afeda5 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -17,6 +17,9 @@
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0xe
 
+#define NUBUS_SLOT_BASE       (NUBUS_SUPER_SLOT_SIZE * \
+                               (NUBUS_SUPER_SLOT_NB + 1))
+
 #define NUBUS_SLOT_SIZE       0x01000000
 #define NUBUS_FIRST_SLOT      0x0
 #define NUBUS_LAST_SLOT       0xf
@@ -33,6 +36,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 struct NubusBus {
     BusState qbus;
 
+    AddressSpace nubus_as;
+    MemoryRegion nubus_mr;
+
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 5ba87f789c78..a07912b87ca3 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -67,9 +67,6 @@
 #define ASC_BASE              (IO_BASE + 0x14000)
 #define SWIM_BASE             (IO_BASE + 0x1E000)
 
-#define NUBUS_SUPER_SLOT_BASE 0x60000000
-#define NUBUS_SLOT_BASE       0xf0000000
-
 #define SONIC_PROM_SIZE       0x1000
 
 /*
@@ -396,8 +393,10 @@ static void q800_init(MachineState *machine)
 
     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, NUBUS_SUPER_SLOT_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                    MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
+                    MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
     nubus = MAC_NUBUS_BRIDGE(dev)->bus;
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 3f075789e9b3..3af4f5d396ae 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -22,8 +22,20 @@ static void mac_nubus_bridge_init(Object *obj)
     s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
                                                   MAC_NUBUS_SLOT_NB);
 
-    sysbus_init_mmio(sbd, &s->bus->super_slot_io);
-    sysbus_init_mmio(sbd, &s->bus->slot_io);
+    /* Aliases for slots 0x9 to 0xe */
+    memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
+                             &s->bus->nubus_mr,
+                             MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
+                             MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+
+    memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
+                             &s->bus->nubus_mr,
+                             NUBUS_SLOT_BASE +
+                             MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
+                             MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+
+    sysbus_init_mmio(sbd, &s->super_slot_alias);
+    sysbus_init_mmio(sbd, &s->slot_alias);
 }
 
 static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 215fdb6b4ec2..07c279bde5c1 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -78,25 +78,42 @@ static const MemoryRegionOps nubus_super_slot_ops = {
     },
 };
 
+static void nubus_unrealize(BusState *bus)
+{
+    NubusBus *nubus = NUBUS_BUS(bus);
+
+    address_space_destroy(&nubus->nubus_as);
+}
+
 static void nubus_realize(BusState *bus, Error **errp)
 {
+    NubusBus *nubus = NUBUS_BUS(bus);
+
     if (!nubus_find()) {
         error_setg(errp, "at most one %s device is permitted", TYPE_NUBUS_BUS);
         return;
     }
+
+    address_space_init(&nubus->nubus_as, &nubus->nubus_mr, "nubus");
 }
 
 static void nubus_init(Object *obj)
 {
     NubusBus *nubus = NUBUS_BUS(obj);
 
+    memory_region_init(&nubus->nubus_mr, obj, "nubus", 0x100000000);
+
     memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
                           nubus, "nubus-super-slots",
                           (NUBUS_SUPER_SLOT_NB + 1) * NUBUS_SUPER_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr, 0x0, &nubus->super_slot_io);
 
     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
                           nubus, "nubus-slots",
                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr,
+                                (NUBUS_SUPER_SLOT_NB + 1) *
+                                NUBUS_SUPER_SLOT_SIZE, &nubus->slot_io);
 
     nubus->slot_available_mask = MAKE_64BIT_MASK(NUBUS_FIRST_SLOT,
                                                  NUBUS_SLOT_NB);
@@ -150,6 +167,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
     BusClass *bc = BUS_CLASS(oc);
 
     bc->realize = nubus_realize;
+    bc->unrealize = nubus_unrealize;
     bc->check_address = nubus_check_address;
     bc->get_dev_path = nubus_get_dev_path;
 }
-- 
2.31.1


