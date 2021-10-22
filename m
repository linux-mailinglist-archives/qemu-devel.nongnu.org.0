Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C94372A6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:23:13 +0200 (CEST)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdotU-0000lG-Iq
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdoni-0000wy-BD
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:32949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonf-0003Ij-8C
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4A1h-1mmvUC2sbZ-0101Mt; Fri, 22
 Oct 2021 09:17:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] q800: wire up auxmode GPIO to GLUE
Date: Fri, 22 Oct 2021 09:17:01 +0200
Message-Id: <20211022071705.471954-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vtPPTCaYqfDFm728FdnmaJdJYSPLNu/M1iIGr3s5kGeuUXAFaRu
 +zEAwi/gEgibzg0EV1if6vsAEs84dRKHTyC+n17LfD0n3f+tjG2wwB8/3oYz4b3krurbcQw
 e1Vur/3i8iG6rl2CqRVfaFFUI6zyLQyXmOknkRLQlEPQ7CBSTptwONHEuL3qYVXneE81BuF
 Iit6cjzYsfV4xUiyu2u6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UE3wqNvXPAc=:N4ia85kGWY/cZglQslzUhd
 oEmIKTMujWyGrHGmbQp90/9H600NCQ3LfJjQLhCbgkARpOrIeeZoqGsLkFx0uUEm8V4lkLTr+
 83V/dZA8tMOshKrJB9PiWPML5FgCy3gDI2Hfbg5iBUJBaZnJJC3421AfcYZ86O/UCZqsgNFGE
 ayGM7y7myFNxWU0zeYt1qZG1l9kh0LH5w/vGGMmqyARJ8rgbQw6t5cFzddqhXyrHx9k9mX+wV
 kVoD8kVN5VbUsyJBzWk3jtLVBVevnGF2PbC/Z/BciBgOlKxt/oWMCHaXskMhwdonDbuQnaKEK
 8cbOkBTGL55rJ51qmFFUBKbzotvLL/4X72FOKTbM/yXL7FMiUyDFZP3eDv5db8W9Qb4FwD6dx
 rCC0RYdfezy3iyBkftSie5y1E6DwjYpyE0W82ADXslaAiWVkp8GSEYsIB7uyCnZWGew4VZIyh
 aF7W2PfWeHLpRZ7zSkhVBdrAF3s1lK6RGXi1MhEiKDD6QlksWcnrM1OSSv+vqLLGrHu68p6ca
 Tv1zX/jhFWM3cxHxEzrOWGIiLI+wAua5J5wV3sgvz0TKqQDyO4B8jsMUexroZodF1I7M2gUTp
 mYyGuqF7PCHMI5CePy4x/1zoekx1je99KzK+q/AmvoXDo3W5rtdi3yHEyWsYgTlJKxbOnEKzE
 Zb/fjYKfTzKZZ5osFkbpNwckmGT41YV+DhYE60vvE3mTISE+9MaQTAVYoxYeg1lMquB0=
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

This enables the GLUE logic to change its CPU level IRQ routing depending upon
whether the hardware has been configured for A/UX mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 81c335bf16bc..0093872d8923 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -100,6 +100,7 @@ struct GLUEState {
     SysBusDevice parent_obj;
     M68kCPU *cpu;
     uint8_t ipr;
+    uint8_t auxmode;
 };
 
 #define GLUE_IRQ_IN_VIA1       0
@@ -145,11 +146,19 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
     m68k_set_irq_level(s->cpu, 0, 0);
 }
 
+static void glue_auxmode_set_irq(void *opaque, int irq, int level)
+{
+    GLUEState *s = GLUE(opaque);
+
+    s->auxmode = level;
+}
+
 static void glue_reset(DeviceState *dev)
 {
     GLUEState *s = GLUE(dev);
 
     s->ipr = 0;
+    s->auxmode = 0;
 }
 
 static const VMStateDescription vmstate_glue = {
@@ -158,6 +167,7 @@ static const VMStateDescription vmstate_glue = {
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(ipr, GLUEState),
+        VMSTATE_UINT8(auxmode, GLUEState),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -178,6 +188,7 @@ static void glue_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
     qdev_init_gpio_in(dev, GLUE_set_irq, 8);
+    qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
 }
 
 static void glue_class_init(ObjectClass *klass, void *data)
@@ -308,6 +319,9 @@ static void q800_init(MachineState *machine)
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA1));
+    /* A/UX mode */
+    qdev_connect_gpio_out(via1_dev, 0,
+                          qdev_get_gpio_in_named(glue, "auxmode", 0));
 
     adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
-- 
2.31.1


