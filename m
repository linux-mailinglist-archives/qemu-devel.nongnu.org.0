Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B241C1F2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:47:22 +0200 (CEST)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWBN-000218-6K
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVta-0001xX-1Y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0005nJ-2j
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N9MYu-1mqZQF36rU-015Jx9; Wed, 29
 Sep 2021 11:28:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] nubus: move NubusBus from mac-nubus-bridge to
 nubus-bridge
Date: Wed, 29 Sep 2021 11:28:38 +0200
Message-Id: <20210929092843.2686234-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PUN8cKMBaNIQewIMY1k+Sxcc998exwJDCWMNB8Ef5krdiSFl6UK
 GJgmR1ATWWIG+L39kaTxHmDV1BEMuEdsfRMxeyje8efqGqMlQqxP74tDjil8dVdnMRGPKxq
 8tRGwazXuP+S7s3tVFXYz/V5XJGuFjZXc7aJ8y753/aSfwCqHiWKsdgHuBvxoCujN+y+/sG
 bYRHjgeAa/T7bXOPIIIBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jcL8i+KjOoo=:4A7yEr5mOMDXon77oavvo2
 z9YzjSLAxWHNhgsfDwo2BcIMBz2Cganw8QAq69CMvrJ1vqyLxFbgExeyPUGuY2Lt8+TndcgMY
 1vjAOVDhEkGl8AFOPMy4Lw75X5PH93mimbk6uTqx7Fd5s9tm2f6Ip6Vkw5ACgVUUV2qyI0xRn
 x/7qTTpXol53S0OgRVz0kyqtNx0kGwCb9ytqa/ndaBS2IMTfTvzL2DUn1PFa7NJ/b0/MbAIvu
 X2d8FNG1387XIEORtvlKiWqym6arWB4QYYhIsyYh/4XJKyVi9NcddZ7mf2rgA2NNiGx+tzvD0
 y4uR1h8t0TUm0xgaljZ6tv6Pexsi0oOLo61kgyA7goO8KCmJHYtkLJ0TQUHUtRmcR401GfELM
 spr7AK6dbodIo3x8OgHEa40B2MOb0Gcftx31iJn5NTBqSVAM/BDQdiYOXvoaQ8BS2PqQCEdKN
 4T4tuc336aKzTas0T30nARQ7KnX4VvyuUtDLhpOA61AvZXfRpWB++5Ng0OS1VeLjC5Sv6Nq2y
 c27dmjTNn+qurCiUzMnksdIiQ6wTWaOOWMsT1dur54ctiGjBwBNmhwVSneFkOM9HpV2H0+o9c
 jQdSXXZGpue/K/AH6FWWLkQt83wvgWuIj1lWIvRdooT6ycWBlHvu7EII2nJUoA7D9RztlhVye
 E1AzJkAi1QF5bXguis7CAeGwG9IUjCzp2EmEJn3bOFJYVhacPcxh9UUTZ/e5pIFMTf4werjJF
 U1Yqdij0ep3DJginom8O2uSwRFkSIDOeKbTM9g==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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

Now that Nubus has its own address space rather than mapping directly into the
system bus, move the Nubus reference from MacNubusBridge to NubusBridge.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-16-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/mac-nubus-bridge.h |  1 -
 include/hw/nubus/nubus.h            |  2 ++
 hw/m68k/q800.c                      |  2 +-
 hw/nubus/mac-nubus-bridge.c         | 11 +++++------
 hw/nubus/nubus-bridge.c             |  9 +++++++++
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index b595e1b7ef66..70ab50ab2d67 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -22,7 +22,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(MacNubusBridge, MAC_NUBUS_BRIDGE)
 struct MacNubusBridge {
     NubusBridge parent_obj;
 
-    NubusBus *bus;
     MemoryRegion super_slot_alias;
     MemoryRegion slot_alias;
 };
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 11bcc9bb3647..2d00d1815060 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -62,6 +62,8 @@ struct NubusDevice {
 
 struct NubusBridge {
     SysBusDevice parent_obj;
+
+    NubusBus *bus;
 };
 
 #endif
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index a07912b87ca3..9bdea1a36297 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,7 +398,7 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
-    nubus = MAC_NUBUS_BRIDGE(dev)->bus;
+    nubus = NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index e241c581b575..db8640eed262 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -16,22 +16,21 @@
 static void mac_nubus_bridge_init(Object *obj)
 {
     MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
+    NubusBridge *nb = NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
-
     /* Macintosh only has slots 0x9 to 0xe available */
-    s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
-                                                  MAC_NUBUS_SLOT_NB);
+    nb->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                                   MAC_NUBUS_SLOT_NB);
 
     /* Aliases for slots 0x9 to 0xe */
     memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
-                             &s->bus->nubus_mr,
+                             &nb->bus->nubus_mr,
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
-                             &s->bus->nubus_mr,
+                             &nb->bus->nubus_mr,
                              NUBUS_SLOT_BASE +
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 95662568c518..3b68d4435c58 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -12,6 +12,14 @@
 #include "hw/sysbus.h"
 #include "hw/nubus/nubus.h"
 
+
+static void nubus_bridge_init(Object *obj)
+{
+    NubusBridge *s = NUBUS_BRIDGE(obj);
+
+    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
+}
+
 static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -22,6 +30,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nubus_bridge_info = {
     .name          = TYPE_NUBUS_BRIDGE,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = nubus_bridge_init,
     .instance_size = sizeof(NubusBridge),
     .class_init    = nubus_bridge_class_init,
 };
-- 
2.31.1


