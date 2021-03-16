Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88733E07B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:29:06 +0100 (CET)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHFR-0006AM-BP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3a-0006vW-MG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3Y-00041H-Hu
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:50 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmDAc-1m4NIW1RHU-00iFUB; Tue, 16 Mar 2021 22:16:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] mac_via: rename VBL timer to 60Hz timer
Date: Tue, 16 Mar 2021 22:16:29 +0100
Message-Id: <20210316211631.107417-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R1UaaEEbJtMOkT2Zoa3AxJRv8CBfFvcbHFKse1gu7Yt2oUmZL3f
 4v0YB5M7dfIZz8GlkLswTiwYK74wlol8dY/rxAEOD8pQgc3JXIlQv5NQJHbnFRV4BmPLFOs
 PJUY44r0TOBk3MgPofs0GEPDnn2FY8TWHJdZTvVELsWtZ3LWpSqDqkZEE2+ljhtWVsTzoKc
 DiFzZaL9gXJQa9vb1Bldw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WzPqQCZVQSs=:IJEQH3VUmfMx1EPyG7C5vi
 6Hu5PLD4SSPNTdTdYR5BG9GRQazs9O+6yNK3Yzg77lnPD12vAZDsKuVeYLrSUadKtD75PXid5
 +6Yx3OlUu5VKt/+wl4QFPK+VYM4PAZVg2lTfLP5dHPaJE3YPuNcabU7zALhED64fyrhvXc/Mj
 myheLGErdbw8eCx/i3wEdAMmQQgShrUk61y9V3LX5b3hdneKZlVn3cHU6EukeSoAwLwIx8K/F
 tugrPynxxev15PDexSr4aoJVQOVE0d8xHHJ6q3LVBDBkS/AW6keecl43U5YLrtlHc9ESIaiNr
 EHc44NdwDaFpJbfq0OdGhGUI3h9oIBTu8JDntCBY1vxkxjOQlBwwj7Ert9sh5L3+tkPdVQkjL
 KWSW0H08o8Vfr+53o8/pbinY87xyNw/pynpUteSk/DQYrNQe1UfeeQJlLo1yfw8aCMF1ukshN
 vQiDEbwKqA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

According to the "Guide To The Macintosh Family Hardware", the 60Hz VIA1 timer
on newer Macs such as the Quadra only exists for compatibility with old software
and is no longer synced to the VBL interval.

Rename the VBL timer to 60Hz timer to emphasise this and to prevent confusion
when the real VBL interrupt (now handled as a NuBus slot interrupt) is added in
future.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210311100505.22596-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h |  8 ++++----
 hw/misc/mac_via.c         | 41 ++++++++++++++++++++-------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index a59f0bd42235..3058b30685ae 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -17,7 +17,7 @@
 
 /* VIA 1 */
 #define VIA1_IRQ_ONE_SECOND_BIT 0
-#define VIA1_IRQ_VBLANK_BIT     1
+#define VIA1_IRQ_60HZ_BIT       1
 #define VIA1_IRQ_ADB_READY_BIT  2
 #define VIA1_IRQ_ADB_DATA_BIT   3
 #define VIA1_IRQ_ADB_CLOCK_BIT  4
@@ -25,7 +25,7 @@
 #define VIA1_IRQ_NB             8
 
 #define VIA1_IRQ_ONE_SECOND (1 << VIA1_IRQ_ONE_SECOND_BIT)
-#define VIA1_IRQ_VBLANK     (1 << VIA1_IRQ_VBLANK_BIT)
+#define VIA1_IRQ_60HZ       (1 << VIA1_IRQ_60HZ_BIT)
 #define VIA1_IRQ_ADB_READY  (1 << VIA1_IRQ_ADB_READY_BIT)
 #define VIA1_IRQ_ADB_DATA   (1 << VIA1_IRQ_ADB_DATA_BIT)
 #define VIA1_IRQ_ADB_CLOCK  (1 << VIA1_IRQ_ADB_CLOCK_BIT)
@@ -45,8 +45,8 @@ struct MOS6522Q800VIA1State {
     /* external timers */
     QEMUTimer *one_second_timer;
     int64_t next_second;
-    QEMUTimer *VBL_timer;
-    int64_t next_VBL;
+    QEMUTimer *sixty_hz_timer;
+    int64_t next_sixty_hz;
 };
 
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 4914cb809860..9617e04f02ef 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -297,18 +297,18 @@ enum {
     REG_EMPTY = 0xff,
 };
 
-static void via1_VBL_update(MOS6522Q800VIA1State *v1s)
+static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
 {
     MOS6522State *s = MOS6522(v1s);
 
     /* 60 Hz irq */
-    v1s->next_VBL = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
-                    16630 * 16630;
+    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
+                          16630 * 16630;
 
-    if (s->ier & VIA1_IRQ_VBLANK) {
-        timer_mod(v1s->VBL_timer, v1s->next_VBL);
+    if (s->ier & VIA1_IRQ_60HZ) {
+        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
     } else {
-        timer_del(v1s->VBL_timer);
+        timer_del(v1s->sixty_hz_timer);
     }
 }
 
@@ -325,16 +325,16 @@ static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
     }
 }
 
-static void via1_VBL(void *opaque)
+static void via1_sixty_hz(void *opaque)
 {
     MOS6522Q800VIA1State *v1s = opaque;
     MOS6522State *s = MOS6522(v1s);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
 
-    s->ifr |= VIA1_IRQ_VBLANK;
+    s->ifr |= VIA1_IRQ_60HZ;
     mdc->update_irq(s);
 
-    via1_VBL_update(v1s);
+    via1_sixty_hz_update(v1s);
 }
 
 static void via1_one_second(void *opaque)
@@ -897,12 +897,12 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 
     /*
      * If IRQs are disabled, timers are disabled, but we need to update
-     * VIA1_IRQ_VBLANK and VIA1_IRQ_ONE_SECOND bits in the IFR
+     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
      */
 
-    if (now >= s->next_VBL) {
-        ms->ifr |= VIA1_IRQ_VBLANK;
-        via1_VBL_update(s);
+    if (now >= s->next_sixty_hz) {
+        ms->ifr |= VIA1_IRQ_60HZ;
+        via1_sixty_hz_update(s);
     }
     if (now >= s->next_second) {
         ms->ifr |= VIA1_IRQ_ONE_SECOND;
@@ -933,7 +933,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
     }
 
     via1_one_second_update(v1s);
-    via1_VBL_update(v1s);
+    via1_sixty_hz_update(v1s);
 }
 
 static const MemoryRegionOps mos6522_q800_via1_ops = {
@@ -983,8 +983,8 @@ static void mac_via_reset(DeviceState *dev)
 
     adb_set_autopoll_enabled(adb_bus, true);
 
-    timer_del(v1s->VBL_timer);
-    v1s->next_VBL = 0;
+    timer_del(v1s->sixty_hz_timer);
+    v1s->next_sixty_hz = 0;
     timer_del(v1s->one_second_timer);
     v1s->next_second = 0;
 
@@ -1026,8 +1026,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                      via1_one_second,
                                                      &m->mos6522_via1);
-    m->mos6522_via1.VBL_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via1_VBL,
-                                              &m->mos6522_via1);
+    m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                                  via1_sixty_hz,
+                                                  &m->mos6522_via1);
 
     qemu_get_timedate(&tm, 0);
     m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
@@ -1116,8 +1117,8 @@ static const VMStateDescription vmstate_mac_via = {
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
-        VMSTATE_TIMER_PTR(mos6522_via1.VBL_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_VBL, MacVIAState),
+        VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
+        VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
         VMSTATE_STRUCT(mos6522_via2.parent_obj, MacVIAState, 0, vmstate_mos6522,
                        MOS6522State),
         /* RTC */
-- 
2.30.2


