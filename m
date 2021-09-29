Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B533541C20F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:53:00 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWGp-0000CE-Qa
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0001re-Il
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtT-0005ll-E1
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1OsF-1mz7LG3GW3-012qBU; Wed, 29
 Sep 2021 11:28:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] nubus-device: add romfile property for loading
 declaration ROMs
Date: Wed, 29 Sep 2021 11:28:34 +0200
Message-Id: <20210929092843.2686234-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/6Go44XtxVtAhV6TJ5xSTXUZwLeyrmnqhrO9UeNXOP65BP9mxuY
 lMjeZKjVc4vHWxoFH9O5ZPiIZyggXeVrmAJvgHlAgrW8QR3JcEr90JKJ4Wxdm+nA6VKc9D0
 AVWNUWvIINLFvHurMZoSzKmw86eM30K1u8PAz1AU3a4aZNIWdmTSu/Izfz+fWA7KZVUEiyu
 NIipFH7PAMeHqGcjMH4tA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wYpntaaVRqs=:UnTFoqEIgct6ysMnSz/WRA
 aqAkvvVo9zxNB3ntOO1e37eUGa3ZeiIDa0q599sFEiK6nODHfc2D6vbwmGQ0zgBXNqZaL6Hjm
 kjyuwXJU+qFf26V6gxj2nMD5xw/G4X9i8rnYZyFIf6MUKZUrO3ZKnUme/rta2GMW5OKOK1+Ew
 8aNDDGMGa0fVbYPZnX7hCu4DwYxycP9XrwzgJgkL8KaZxa1czZMGkAh5jHbDEiRYJ0Tzj+bGy
 myaLpetpRoFS8nWa0rURhtsglEyIuT4CelRpXo0GPUIPu8vQnirvj2sskmeyTuTsjUlrE/LwG
 Up+3A7+RYPafgVgajyd1QQ40S09aMv9lzafEv9sF5tJeMbGVcMeB6N529T1dz+q/bI12gv/fG
 8WZb4KQ8ABK5vqJ+r0XNSB40l7T4ICnoiIN+/Df3uVt/Upp4zgSTbTWsQVM0yiVpr1SzbFOx1
 O6WPOM/UHzEYjwaKSbj3J3U/hUjfAUs1lrR38E4VPqtOC1bfz9gAUHxiCxgfQPrGuK6oUb6Gs
 amFkiAZp7Jii3hzSE3qM6syo4mBWEGNpD5VV3RbrgInOP/KE5ebuC55pWbcX8POOycvoPkzmE
 0yCaclYBkJVKPMfLc0Z9bmbKLWAxaOJf91eaFZWLhFdPX6wFJQXs5Ypogr8MntsYPrE4eT49h
 WNrTH0GiRFO//3Gq3lE+agRsuLGoa2F6P2fcu0N+RREe7xuaTDFOTpCdSEI3H+G0bUt9nrpR9
 R7/QqfuoMqzlo+32YUeHdrHxD1x3E2zuZGJ0dw==
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The declaration ROM is located at the top-most address of the standard slot
space.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h |  6 ++++++
 hw/nubus/nubus-device.c  | 44 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 187ecc00a576..343be958417a 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -12,6 +12,7 @@
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
+#include "qemu/units.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0xe
@@ -38,12 +39,17 @@ struct NubusBus {
     uint16_t slot_available_mask;
 };
 
+#define NUBUS_DECL_ROM_MAX_SIZE    (128 * KiB)
+
 struct NubusDevice {
     DeviceState qdev;
 
     int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
+
+    char *romfile;
+    MemoryRegion decl_rom;
 };
 
 #endif
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index d4932d64a278..280f40e88a30 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -9,16 +9,21 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/datadir.h"
+#include "hw/loader.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 
 
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
     NubusDevice *nd = NUBUS_DEVICE(dev);
-    char *name;
+    char *name, *path;
     hwaddr slot_offset;
+    int64_t size;
+    int ret;
 
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
@@ -38,10 +43,47 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&nubus->slot_io, slot_offset,
                                 &nd->slot_mem);
     g_free(name);
+
+    /* Declaration ROM */
+    if (nd->romfile != NULL) {
+        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
+        if (path == NULL) {
+            path = g_strdup(nd->romfile);
+        }
+
+        size = get_image_size(path);
+        if (size < 0) {
+            error_setg(errp, "failed to find romfile \"%s\"", nd->romfile);
+            g_free(path);
+            return;
+        } else if (size == 0) {
+            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
+            g_free(path);
+            return;
+        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
+            error_setg(errp, "romfile \"%s\" too large (maximum size 128K)",
+                       nd->romfile);
+            g_free(path);
+            return;
+        }
+
+        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
+        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
+                               &error_abort);
+        ret = load_image_mr(path, &nd->decl_rom);
+        g_free(path);
+        if (ret < 0) {
+            error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
+            return;
+        }
+        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
+                                    &nd->decl_rom);
+    }
 }
 
 static Property nubus_device_properties[] = {
     DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
+    DEFINE_PROP_STRING("romfile", NubusDevice, romfile),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.31.1


