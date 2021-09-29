Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AC41C213
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:54:37 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWIO-0003Hr-QT
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtZ-0001vq-Cm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0005nN-KE
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N0nzR-1mi4xd0nTB-00wpdu; Wed, 29
 Sep 2021 11:28:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] nubus-bridge: embed the NubusBus object directly within
 nubus-bridge
Date: Wed, 29 Sep 2021 11:28:39 +0200
Message-Id: <20210929092843.2686234-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3xyjHGV2Rwq2vTo1joSr1ycR780K5KeTyKFCsQ8U+yoN39TeIZj
 Az37OYBBlf6nQkd3CK59647dMgvOpCxXJb8uqWM70jWv3sU1tZlP1cw7brwQDGQocZomU05
 W57XGBxoFygb3rhSUNf59Exwt6UiTyZPcUDh5Gz69L8hLjz692QQu2GNfpOpxdJggDM+mi1
 O3INKU6KoGtNsF7dCCsxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NG0Xb/0zORc=:TYzJV9FfJNU0eK66J+I4eQ
 BktPYhQ996BRMvpFABfTQuUZoPtLAFqHt3WGSovGpl24ohNVbq3YZ3llVkosyVn8JF/TiBzDm
 g8uoEZfdFXYUq2zbBiAUsC+HC3Sf8x56mTfqg3CnMCnbw7lLxuWNdV6/F4cIAfmnVLZTLydPv
 fc9//kA0OwKVgc58lF6fW5n9l6n16FsUbfhRv12FUeG9sAPaPlBR+pNEViexgP+tDNy1LpVYa
 uOwUwjHoOGf03iqf6mO8vIxU0nL1e5FDkwpq6zltSQJzhQJ2K6bBqUrZqcJNEvLzsbu39uUwh
 B3IUTREgoeCqthPeskz2P2rETVZkM5fcTFxJzaXzhT0vkEyUdkdsmTzLhA7gBOvEIJ0WFqOCf
 uAeB5rJ4DAnA4CXNi3yA6qTyesdYPbTCdsRBHF+1lcFCbgAUoqA8riQc/rDItejRpuFDz3RSa
 kV/w0BSn3ABxPQrOtXeIzBRK9vrlLpeUpEG2XtYTpZGJDWhBGrarg444iKtEyw7usz9fDy4yy
 AZlBY1eQ0ZANxmwabHrIGpEkSn8a12ixJsMG6YNpwsPpiHvYeRHIUSUaA5YNM013p2bcD+LD+
 h2XmzOm25PmJtZIqTPE+qAbEOsHQN7gRWmxNREQbnQyGalDcLOajUidvsyljQAoJTYX1iKh8g
 JiWOJ3T7nDDRGv06HklXpA9PN1ByAhFcTYV3ATDYNn1ghf0IJfue/LWa1RrISUnsETF1PZcy2
 oUfwtSG4DW3Oojvfx0q3RREb1QIhiMzcKF/EFA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Since nubus-bridge is a container for NubusBus then it should be embedded
directly within the bridge device using qbus_create_inplace().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-17-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h    | 2 +-
 hw/m68k/q800.c              | 2 +-
 hw/nubus/mac-nubus-bridge.c | 9 +++++----
 hw/nubus/nubus-bridge.c     | 3 ++-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 2d00d1815060..63c69a7586fc 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -63,7 +63,7 @@ struct NubusDevice {
 struct NubusBridge {
     SysBusDevice parent_obj;
 
-    NubusBus *bus;
+    NubusBus bus;
 };
 
 #endif
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9bdea1a36297..074acf4fdc75 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,7 +398,7 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
-    nubus = NUBUS_BRIDGE(dev)->bus;
+    nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index db8640eed262..a0da5a8b2faf 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -18,19 +18,20 @@ static void mac_nubus_bridge_init(Object *obj)
     MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
     NubusBridge *nb = NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    NubusBus *bus = &nb->bus;
 
     /* Macintosh only has slots 0x9 to 0xe available */
-    nb->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
-                                                   MAC_NUBUS_SLOT_NB);
+    bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                               MAC_NUBUS_SLOT_NB);
 
     /* Aliases for slots 0x9 to 0xe */
     memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              NUBUS_SLOT_BASE +
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 3b68d4435c58..1adda7f5a609 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -16,8 +16,9 @@
 static void nubus_bridge_init(Object *obj)
 {
     NubusBridge *s = NUBUS_BRIDGE(obj);
+    NubusBus *bus = &s->bus;
 
-    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
+    qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
 }
 
 static void nubus_bridge_class_init(ObjectClass *klass, void *data)
-- 
2.31.1


