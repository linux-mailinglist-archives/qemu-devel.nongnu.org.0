Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D9403CA7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:39:57 +0200 (CEST)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzg3-0003xm-T3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzc3-0004Jn-E6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzc1-0003xk-Ik
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:47 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Md6V1-1mxsiy1qmR-00aHJc; Wed, 08
 Sep 2021 17:35:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] mac_via: remove explicit viaN prefix from VIA IRQ gpios
Date: Wed,  8 Sep 2021 17:35:27 +0200
Message-Id: <20210908153529.453843-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yGzr/bd4a/VZgBiyAD73jzGd5CSekQCV4bxC8/VE6Rs/QdSo6Y1
 pwOtMS2L+eFEI3J8k3C+anZVM8gDf1du7Z6dW3xpojEZQip0ZlN8ocrGyVfKbcgeY/QUZ7j
 ZuIlKXT/B1beCGXocSSRpdfoHJhlK03F9LfbSbSPrnmlyHjbsMaculs/NzHxo/oYTn9QyAA
 ACsMbRRpcBx4OH5hn28eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Q40s29z0fc=:I4DN34RYyhnPCvcbbLpyjc
 vgtr3m5ETmQqcZKFoqiUew3uk8vv+W9gYlmODK5C6uWhjdwQKeHpeArwBrFvdngwmRSPvG7JE
 YhS2xordSyBfj3iemx50hyCt3TVDPAhZ+E5z/AirsE4E1C6isBLk/0+R9h+02TL9L/LntSrpL
 WFzOnNvlIgEnddcezmoKDamuR0KV/uNDtgVTGeey/aWBppiKWqqI0eN+XUxfOETCjAKtqB6Zv
 u8wL/HBGlh/JoSYSW2sR9CGVcAzCAl5frorC0owQEdi6pzVaaTSQJW86T2XuDhZALW97Ooi08
 7pTNDZKaZsIOzN4lVtB8QqLpF6TnHRWoSj03AW/qaAP8R/rVAV0OAkQstqkGmox4dXp2K/aOi
 PTvUDLEJzWoNGvkd0hKxV1f7+coUStrl63Zj7RYYiAdvStDFsOv5y8dkGjIU9YrunaLWyFFqU
 53z56ncObr2ehM95CXqHkTiq+aGEaHwnyBgqsh8emGDQAg9FoPUagZFXFz4/mapcry2Lbs0yK
 Nhub4tGpj8PSKJGWiI0Q31WFr1uErfwECp3T7UuziasjBkEOllh1ofOjs7XGo0cBfDu/QugeJ
 5mDr2ESNG45/zuEXutwQn0nf8rAsTTilKW6566iMXi+NwMIy4qynM2EQ8atJsGHKmktS8VeRI
 bg3FtGtkoW3Z8zYlcUbVRg0WVhIQw52OhyB2hfsdSceeTfV4XVZVwJjQulpT99CXs7ph+xNR4
 aB+rqAbDI+BPQi2NwStEDALo/judF8vbzp22rg==
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

Now that q800 VIA1 and VIA2 are completely separate devices there is no need to
add a specific device prefix to ensure that the IRQ lines remain separate.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c    | 10 ++++------
 hw/misc/mac_via.c |  9 +++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ec28e69802bb..5ba87f789c78 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -377,12 +377,10 @@ static void q800_init(MachineState *machine)
 
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in_named(via2_dev,
-                                                         "via2-irq",
-                                                         VIA2_IRQ_SCSI_BIT));
-    sysbus_connect_irq(sysbus, 1,
-                       qdev_get_gpio_in_named(via2_dev, "via2-irq",
-                                              VIA2_IRQ_SCSI_DATA_BIT));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(via2_dev,
+                                                   VIA2_IRQ_SCSI_BIT));
+    sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(via2_dev,
+                                                   VIA2_IRQ_SCSI_DATA_BIT));
     sysbus_mmio_map(sysbus, 0, ESP_BASE);
     sysbus_mmio_map(sysbus, 1, ESP_PDMA);
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 7b9f067e7104..f093f7388e5c 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1004,8 +1004,7 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
     v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
 
     adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
-    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                                 VIA1_IRQ_ADB_READY_BIT);
+    v1s->adb_data_ready = qdev_get_gpio_in(dev, VIA1_IRQ_ADB_READY_BIT);
 
     if (v1s->blk) {
         int64_t len = blk_getlength(v1s->blk);
@@ -1042,8 +1041,7 @@ static void mos6522_q800_via1_init(Object *obj)
     qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
                         TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
-    qdev_init_gpio_in_named(DEVICE(obj), via1_irq_request, "via1-irq",
-                            VIA1_IRQ_NB);
+    qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via1 = {
@@ -1136,8 +1134,7 @@ static void mos6522_q800_via2_init(Object *obj)
                           "via2", VIA_SIZE);
     sysbus_init_mmio(sbd, &v2s->via_mem);
 
-    qdev_init_gpio_in_named(DEVICE(obj), via2_irq_request, "via2-irq",
-                            VIA2_IRQ_NB);
+    qdev_init_gpio_in(DEVICE(obj), via2_irq_request, VIA2_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via2 = {
-- 
2.31.1


