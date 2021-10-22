Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA224372BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:26:58 +0200 (CEST)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdox7-0006PZ-OE
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonk-00010F-8Z
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003In-Qg
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:15 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6lUk-1mcBy40SmE-008N9M; Fri, 22
 Oct 2021 09:17:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] q800: route SONIC on-board Ethernet IRQ via nubus IRQ 9 in
 classic mode
Date: Fri, 22 Oct 2021 09:17:02 +0200
Message-Id: <20211022071705.471954-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l2z/eO5tdDHyVMyqs9FC7yDJqip255oVwqcZSG9J4bFAXq8B/wf
 RQIaq9Jk+U+P1r/fgWeiRRGI2+lOthVa569MBo7ptH+e8ZwhTvYTkLf4nEe24YnpbCsmope
 MZ+qKNhnuJt30NGJn3gFiimTs/Mb9T6/rA/Ke6LUssExTwqfA9reKrotp4HL5jIJjD1CA4r
 N5fRBxNhyb/c0BdfxjLBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BmD+idIjEu4=:cVSCskPBHMhsSkuX3G3P98
 jd39JIW2U76Szf/WBGtznmRejOpIZYDD3P05X9fVn2CqzKnt/7xcVqF8Q1Esrv+1RP1RCUbdV
 HAKdeDDkP6nINu4jkaP1ecYQec+bapyy4cdrQ90rVZ9Ii7X+1oE1g/CaLAEglB4Kk4F4XrFEN
 gz6AVcjAgqFyile7Vn/Pj8R9gLgolvVJCyQomp+eccbF8cYjAPh1F17DG1hCRUE3zaclDeE3a
 e6gGl+ueCjZ8CaW0UR2O+t+vIPc8TMyUFvuIPd0JDQ+7aIT9cqm9L8cZ04pdi+CZ5LVmU+NzG
 PfBWuk8tjDFvFAoYpH2iyZ9s/2H/hIYB2uE0X1hD+NjuLlKymVeoKcpXGJ+MMn2ost8GwUant
 W6diUcqL7TeNd0tkYIORFXYfrUMHwlDiGtRW7pE3zMfvfrUjGdcGh7w2g3VZtQRE6fy46FeHq
 t0HY6z9aubBWCIXJDMRZtyETmRPr5zENm+ofLIqXYQnwdDViKoPsuYckwezVTLcql05AU/Rkf
 X9Ih6uDQ8jjxnwDibmGraPOu8VtatT7lYw2ww7kR5N+f67S0NJPV/+8IpL94Gdhb2Hvc4lBIm
 lOKDD1NRdC/G/8NqiDet6tR7S26GgfDUUgM78+r9UT696wxJLKtYRbedYBd8xO8EbqkKoNej+
 zqLCgK7Gdaiocdof+X/2e8JTRaJZNJNGZ+dZQPf/O376ZsD+9LXGTWzAZ+X6cRd1Acms=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When the hardware is operating in classic mode the SONIC on-board Ethernet IRQ is
routed to nubus IRQ 9 instead of directly to the CPU at level 3. This does not
affect the framebuffer which although it exists in slot 9, has its own
dedicated IRQ on the Quadra 800 hardware.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 57 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 0093872d8923..7a8de089f4d8 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -101,6 +101,7 @@ struct GLUEState {
     M68kCPU *cpu;
     uint8_t ipr;
     uint8_t auxmode;
+    qemu_irq irqs[1];
 };
 
 #define GLUE_IRQ_IN_VIA1       0
@@ -108,27 +109,40 @@ struct GLUEState {
 #define GLUE_IRQ_IN_SONIC      2
 #define GLUE_IRQ_IN_ESCC       3
 
+#define GLUE_IRQ_NUBUS_9       0
+
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
     GLUEState *s = opaque;
     int i;
 
-    switch (irq) {
-    case GLUE_IRQ_IN_VIA1:
-        irq = 5;
-        break;
-
-    case GLUE_IRQ_IN_VIA2:
-        irq = 1;
-        break;
-
-    case GLUE_IRQ_IN_SONIC:
-        irq = 2;
-        break;
-
-    case GLUE_IRQ_IN_ESCC:
-        irq = 3;
-        break;
+    if (s->auxmode) {
+        /* Classic mode */
+        switch (irq) {
+        case GLUE_IRQ_IN_SONIC:
+            /* Route to VIA2 instead */
+            qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
+            return;
+        }
+    } else {
+        /* A/UX mode */
+        switch (irq) {
+        case GLUE_IRQ_IN_VIA1:
+            irq = 5;
+            break;
+
+        case GLUE_IRQ_IN_VIA2:
+            irq = 1;
+            break;
+
+        case GLUE_IRQ_IN_SONIC:
+            irq = 2;
+            break;
+
+        case GLUE_IRQ_IN_ESCC:
+            irq = 3;
+            break;
+        }
     }
 
     if (level) {
@@ -186,9 +200,12 @@ static Property glue_properties[] = {
 static void glue_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
+    GLUEState *s = GLUE(dev);
 
     qdev_init_gpio_in(dev, GLUE_set_irq, 8);
     qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
+
+    qdev_init_gpio_out(dev, s->irqs, 1);
 }
 
 static void glue_class_init(ObjectClass *klass, void *data)
@@ -454,6 +471,14 @@ static void q800_init(MachineState *machine)
                                                      VIA2_NUBUS_IRQ_9 + i));
     }
 
+    /*
+     * Since the framebuffer in slot 0x9 uses a separate IRQ, wire the unused
+     * IRQ via GLUE for use by SONIC Ethernet in classic mode
+     */
+    qdev_connect_gpio_out(glue, GLUE_IRQ_NUBUS_9,
+                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                                                 VIA2_NUBUS_IRQ_9));
+
     nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
-- 
2.31.1


