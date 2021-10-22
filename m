Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2692437298
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:19:44 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdoq7-0003fh-VK
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdoni-0000xs-SQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003Ig-Gy
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McXwD-1nGjSD2wqT-00d0sN; Fri, 22
 Oct 2021 09:17:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] q800: use GLUE IRQ numbers instead of IRQ level for GLUE
 IRQs
Date: Fri, 22 Oct 2021 09:16:59 +0200
Message-Id: <20211022071705.471954-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aEuftz4U7wQrFKHD93PQ9sHxfHZ5LJn73yGBQ6iGsxp0H0BO5SZ
 nVbmiq3M0TUdsG+S94WKtucSleLf3oKH+VS10iV+Gffg+FIbyLmdD7U+ang+/2fOVsulTRq
 5gKzc8Dx3Ce5w7IBAj7rOE2Zl4pHCDf/vZSbFQzsy+lCqQ7mzIdUKLK75o8gnGN6eS0d+FF
 xM0+oH0IORdYeLC8VjfnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fjKiCSB9SfA=:noNXniquobhVjPLmbrachs
 XJ97qaPRG1RNmMBlu27wYaMY16ydcPGeljIAxpzRnbQ67fRYjTZiGa9d/0SQyHXbh90wn/Ghs
 OnC3sJp2KTTsoUMpvFeGmOqDzVq0P4lVv4rvHOqNDOO9yim8gqhVwsHecdCvaG5j7bQoRaOwH
 mGMp5sHkQxsIGOgpI/EvgiJ0F2DN+MIOlR3X3aQ/7m6TJUBeDC6rGh4/SECW3MHguZOnSSKb9
 LIEWDP8ar9fG2pEHbK6YrfvI1ggmKCfEREd56HEIIhn3vDGC+rl9lRtpxvKrw643y0w7iEZOz
 TQv8dkNP3Kmllg4LQshni8FelKhpFLZsBQuUWmPo0y2Kha+2c8EvWiLBeW6U756icVrNsa9Pa
 FKawaPG9xFJ0wIb5gmP30HMV/2SHZhBbVb10xZ8NGVodzUke2VR7tCrzydNC/awZ9mB4dttcj
 QvkOc0fzkQOhPTcZ0y2d2aXawTBM8v+HqXJrfMsCkus8kl+hDtVr0/SpaBNXHtPkmjpRjgQAE
 UomZrmywGguoAcxOzhf4g2VgnLIvfpWvcwALL6qwEaQ80Omq1QWc3B0tg6LlEDr6yMwt/N4bm
 W3vrGpMytLWGOnCTca7OKW5gpodcsj3inluWTGyOBs2idmLhYKT7ShfX8ZzZ3EeslFYmpqgLS
 WeW+8fIRE+LKSaJQYhKDxdMBuK8nRTo4CH8NqdUgS1IPeiNCcrXQgMUEsyKtaiyz5b7Y=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
corresponding CPU IRQ level accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 15f3067811e1..81c335bf16bc 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -102,11 +102,34 @@ struct GLUEState {
     uint8_t ipr;
 };
 
+#define GLUE_IRQ_IN_VIA1       0
+#define GLUE_IRQ_IN_VIA2       1
+#define GLUE_IRQ_IN_SONIC      2
+#define GLUE_IRQ_IN_ESCC       3
+
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
     GLUEState *s = opaque;
     int i;
 
+    switch (irq) {
+    case GLUE_IRQ_IN_VIA1:
+        irq = 5;
+        break;
+
+    case GLUE_IRQ_IN_VIA2:
+        irq = 1;
+        break;
+
+    case GLUE_IRQ_IN_SONIC:
+        irq = 2;
+        break;
+
+    case GLUE_IRQ_IN_ESCC:
+        irq = 3;
+        break;
+    }
+
     if (level) {
         s->ipr |= 1 << irq;
     } else {
@@ -284,7 +307,7 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(via1_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 5));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA1));
 
     adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
@@ -297,7 +320,7 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(via2_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE + VIA_SIZE);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 1));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA2));
 
     /* MACSONIC */
 
@@ -330,7 +353,7 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, SONIC_BASE);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_SONIC));
 
     memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-q800.prom",
                            SONIC_PROM_SIZE, &error_fatal);
@@ -366,7 +389,8 @@ static void q800_init(MachineState *machine)
     qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
     sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
-    qdev_connect_gpio_out(DEVICE(escc_orgate), 0, qdev_get_gpio_in(glue, 3));
+    qdev_connect_gpio_out(DEVICE(escc_orgate), 0,
+                          qdev_get_gpio_in(glue, GLUE_IRQ_IN_ESCC));
     sysbus_mmio_map(sysbus, 0, SCC_BASE);
 
     /* SCSI */
-- 
2.31.1


