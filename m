Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD0403C9E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:37:37 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzdn-0006c3-F3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbv-0003pW-JO
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:39 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbt-0003rH-UN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:39 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MzQbw-1nAAO014S0-00vOo3; Wed, 08
 Sep 2021 17:35:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] mac_via: add qdev gpios for nubus slot interrupts to VIA2
Date: Wed,  8 Sep 2021 17:35:29 +0200
Message-Id: <20210908153529.453843-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0QMuheZgK1nh6x6PizyvHG3uPoS/lIXTKnEnjcOnhOHn6WDGQcD
 rdBFX0jHR5TSh3hEfTBs25/s1Lz5qhZLrnmcZ1iQQsu9N4Znfip2xvD/EbiF4YIkNrKR/Vn
 rVTLatt5rHCCTreqIaEyUm1W6eHVldLvN3zxgyENQ3zX70ON3rqI6Lu8mkYqfNfjUgwVkRo
 4yHWJbkOn7nfpXLJl9pqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hQJSBC2qClg=:gHSSLSJQ/JPEN5d+zVicS7
 zIllxRFCqtR+2occhywOyMzuwMfqzk248RyFQdTC732uFjN75vDSUMwLchLXaazO5jUp8Gw2b
 fVIAWnqIzxRZxcbySAKR/HDoKqRYeYbQo4PbkhZVuiZjEmas3HMdlwJXbNjnsQplgBOPtuCWs
 DJkNACLmItPSrfC8ny/VZwG8WNB3InbrNYgm6OKXyk9/8lSa0PEyqK/rXVUSAqNcl2QEtvAvR
 68JvGIA2sAIKXqSs8B4MzFzDQJG3FdKpsE/vOLGuNvupHhFnTcEbRZYRvbKeoZ3KJlRD/hAXv
 ckf5WRXolUOlv8Nt5yOUI3N82jU/bOJTV5093Q2bA4tm/094uCkWFFjPO6+M/rqBh/iIADOO6
 ZQ33W1d+Jx2wGTSqXOWgVDja5gb/aQajICkT1S0awEsswzQM/Bs/hOJVpN7gEUXQNU8BtDzwm
 MniCE9q73kaw4sZb1m/29ohi6mzLrxSSWUVV97C360iFn1I/2x+ZToVl7WgM+azsS6WjPd3fG
 xz0/XU/HUOp3tNTl61kQFs44Y0SR3/0GBYv30CLqMlvDQtFZa0gGqULcy4vqM0sFKc861Fikk
 O0iFXKJh+8nEVzQqvwzLVu19ehaffshUr7u9+lNVLkGbgdGvqzIGL2+M/DuBlsgi/KZL2/HHo
 wOgw2GwiiZ4wo75gsklGc0r/P7YXaWac/lgiLjlfCBR6B7ysCvELoR0QOKHx/aVtqwRmbbjJA
 R4oafCAVEqJmYkh3jv/5jXNpzV6bwSpJ/UrXyw==
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

These will soon be required to enable nubus devices to support interrupts.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-13-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h | 10 ++++++++++
 hw/misc/mac_via.c         | 23 +++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 5168e3ce665c..4506abe5d0e3 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -93,6 +93,16 @@ struct MOS6522Q800VIA1State {
 #define VIA2_IRQ_SCSI           (1 << VIA2_IRQ_UNUSED_BIT)
 #define VIA2_IRQ_ASC            (1 << VIA2_IRQ_ASC_BIT)
 
+#define VIA2_NUBUS_IRQ_NB       7
+
+#define VIA2_NUBUS_IRQ_9        0
+#define VIA2_NUBUS_IRQ_A        1
+#define VIA2_NUBUS_IRQ_B        2
+#define VIA2_NUBUS_IRQ_C        3
+#define VIA2_NUBUS_IRQ_D        4
+#define VIA2_NUBUS_IRQ_E        5
+#define VIA2_NUBUS_IRQ_INTVIDEO 6
+
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
 OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index f093f7388e5c..d1abcd97b51d 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1123,6 +1123,26 @@ static void mos6522_q800_via2_reset(DeviceState *dev)
 
     ms->dirb = 0;
     ms->b = 0;
+    ms->dira = 0;
+    ms->a = 0x7f;
+}
+
+static void via2_nubus_irq_request(void *opaque, int irq, int level)
+{
+    MOS6522Q800VIA2State *v2s = opaque;
+    MOS6522State *s = MOS6522(v2s);
+    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+
+    if (level) {
+        /* Port A nubus IRQ inputs are active LOW */
+        s->a &= ~(1 << irq);
+        s->ifr |= 1 << VIA2_IRQ_NUBUS_BIT;
+    } else {
+        s->a |= (1 << irq);
+        s->ifr &= ~(1 << VIA2_IRQ_NUBUS_BIT);
+    }
+
+    mdc->update_irq(s);
 }
 
 static void mos6522_q800_via2_init(Object *obj)
@@ -1135,6 +1155,9 @@ static void mos6522_q800_via2_init(Object *obj)
     sysbus_init_mmio(sbd, &v2s->via_mem);
 
     qdev_init_gpio_in(DEVICE(obj), via2_irq_request, VIA2_IRQ_NB);
+
+    qdev_init_gpio_in_named(DEVICE(obj), via2_nubus_irq_request, "nubus-irq",
+                            VIA2_NUBUS_IRQ_NB);
 }
 
 static const VMStateDescription vmstate_q800_via2 = {
-- 
2.31.1


