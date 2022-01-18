Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6C492675
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:08:19 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oDi-0001a3-Sr
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbd-0004ZN-Lo; Tue, 18 Jan 2022 07:28:57 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:48717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbb-0001uc-7F; Tue, 18 Jan 2022 07:28:57 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Ma0HM-1mmirF3ZOm-00Vug9; Tue, 18
 Jan 2022 13:28:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
Date: Tue, 18 Jan 2022 13:28:39 +0100
Message-Id: <20220118122847.636461-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:09/ZkVTYnpu/etwWOM/PzWTt8OgRgTrKqNdcfTEpKIFcgu+sbK5
 a+lE71QBba1DFIwCvdcM6yFRQ8IrDhEErw7LAvN7VCVnCagXy8avKtQrqMmA4v5PS+oCzGv
 yriCgKf02ntipqBq2YJAuE3XBCQ/laXcclY9pXrcN1TR8cd60QcndB3Hs2N3/Bft8aOHiRb
 iJMwlW9owwzA/p+d7qMKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pIkXajQg0Sw=:ihKi2+w8QBCInaq6Tw/iw3
 vTQ6tcblsykIL7oqIXSvFN1dFlj4Aze9cDjvPOu5Cvxntco1MEIJqJt0dx5oiT1+Nvz27gTgs
 hD8jLJp1l5VWhYV/Qt8yosc4q5wRezbzLrAY2PVCXJvLQO6+tZEwi/6vi9/KhKPtWTr58MwF/
 d7S3fC185E/Dy/UK84344kaz+pBVGG8Dnsq/EMDuCBMEiEB6X2IVpCXky9PNWbBq9GUnwyguG
 bH/a/X3aE/YsJKULOq3OWMDI/J+QWQZdzA1rhslDTkCRuI9+z9WfYgNOgQ7Uz010zIPhG6TbR
 pYH37M4lHKGtia6ItDpXEubRPMwacozF+4VuLJ0h3yMZL3djfufZQ6E8ubKNZsLJo++CfDtcT
 E1ZZEhusd51gEZFCNuyCUKOVq04wjbpEWBPnvo1jLBhevK71TOQ0TCv51NABdd3ELbVdEkrsG
 fhUKGdPvSFb2bfiYn4EdSLnqnpHLImaqRfQoBQUahFKxql3Ngd4TFFaH2s+YBGv8aS0snfBaS
 hjHE5UZdvrunSBkUvOBcqkrBoLAIDEiHNpNYDGGk/fJJ52QM/O+iEyNYRuZ+AhAUb7/ZmAS/P
 gIkEufSaWVmcb3dRN6MJE6DE4tjx9JjyMZsAxbVwqsr9fsZvnXpy512DtFH1F43d+U+J19wgr
 1VxyqeUw8bOAFRF2R6qvQfCbVq3ynvBW93LsKOGzdgu402Xan8nQzDs1NL0fmmybQHxs=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add the vmstate for the ETRAX timers.
This is in theory a migration compatibility break
for the 'AXIS devboard 88' CRIS machine.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211106105623.510868-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 4ba662190de3..139e5b86a447 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
@@ -64,7 +65,7 @@ struct ETRAXTimerState {
     ptimer_state *ptimer_t1;
     ptimer_state *ptimer_wd;
 
-    int wd_hits;
+    uint32_t wd_hits;
 
     /* Control registers.  */
     uint32_t rw_tmr0_div;
@@ -83,6 +84,36 @@ struct ETRAXTimerState {
     uint32_t r_masked_intr;
 };
 
+static const VMStateDescription vmstate_etraxfs = {
+    .name = "etraxfs",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
+        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
+        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
+
+        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
+        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
+        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
+        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
+        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
+        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
+        VMSTATE_UINT32(r_intr, ETRAXTimerState),
+        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static uint64_t
 timer_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -357,6 +388,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = etraxfs_timer_realize;
+    dc->vmsd = &vmstate_etraxfs;
     rc->phases.enter = etraxfs_timer_reset_enter;
     rc->phases.hold = etraxfs_timer_reset_hold;
 }
-- 
2.34.1


