Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684BB071F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 05:26:37 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Fki-0000Pb-0l
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 23:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1i8FjW-0008DY-L6
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 23:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1i8FjV-0002Xt-45
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 23:25:22 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56071)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1i8FjR-0002Wd-Bu; Wed, 11 Sep 2019 23:25:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A67C06DD;
 Wed, 11 Sep 2019 23:25:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Sep 2019 23:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=a9QzAGd8q94cF9E0m0IEVXlOHM
 Ifanf4ODX9ZOV23UY=; b=atjPsIUve7oXFNYM4mKtuhaeF/oDewi8Ues99wSEL9
 BZ9YSNyb+3uRiktTxeSqkmJlnaPAaphoYz+3e632xGuv7uhBcySQNBAwBQUtjAWM
 9lfqVj+VrVQskFReEnZlc+Dyf1/IhIkodPuPwi2UerTgSXGdil27HVht+6bh2kCU
 dJdiMwk7xovstYGnUzs03UKy4w0Gt7Rw3B8ZHVBYYdbSOORle+mwRlS7VkhiqQkU
 AK6I8enXtQQHnadRdUIv+RfahDUa8WfxV2CGL9DlFyKxtPsP1pBG2uPVOO+qSi68
 PWSdrFT/vXQKMbvJPyfaWYAWpyHAmvF0By+bdMOOqbMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=a9QzAGd8q94cF9E0m
 0IEVXlOHMIfanf4ODX9ZOV23UY=; b=ht9D4HEmwdXtcpnl6ilw6t1R0HyfbTwT6
 DYTAMkUyOgJ6wQnezTrw2sp6g5Vm6ELru3SM/Vkx98Z7vAptHxHnPLfZgr6DpmX9
 w4BP4y/guBoNa2LhyCKl3dmBUOb6/Iq71mQXxvnoS61LQ0zs134quhtYbCnKprfx
 z2NQtAI9UMC7iQqNvDeZ2gT7ufcfQnIhggfUbGOldCK3HO38dKbNAbTxpFcix5Yb
 UIGrkATJ39yxGAw90f9exKATYRWdd8Q2DQmH+Trr1NPJ+tGkK4sT56aqWNvBaO6/
 29A3l1YFmOn8guF/kqomJgpsA5ZRXT9XbnGx4y4TdFnl8BirW/fmg==
X-ME-Sender: <xms:mrp5XUCavZcICbOXbefaqpKXZzz0XKq_cpbPa5Z2xQs01MuNLtBPLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:mrp5XS0a-2jCXR70IG17oikDi-yRVtddVVpY0nRlBGJW-bHt9GKjhA>
 <xmx:mrp5XaWc6YKNkDcfMC3Vf16UtUfCInUNWIh1Z4ZPdBZ7apDvOuP02A>
 <xmx:mrp5XcmP4_alGK4EFiDoJBahBtFXbaaclRWe1seCgYc5l9MKqyp1sA>
 <xmx:m7p5XU662IHsFXhBFRD70BF3jq0zg7SPOP-AwvR6E2al4xQC2c1-sw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CCC2D6005A;
 Wed, 11 Sep 2019 23:25:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Thu, 12 Sep 2019 12:55:31 +0930
Message-Id: <20190912032531.32546-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 64.147.123.21
Subject: [Qemu-devel] [PATCH v4] target-arm: Make the counter tick relative
 to cntfrq
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
Cc: Andrew Jeffery <andrew@aj.id.au>, peter.maydell@linaro.org, clg@kaod.org,
 qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow machines to configure CNTFRQ via a property if the ARM core
supports the generic timer. This is necessary on e.g. the ASPEED AST2600
SoC where the generic timer clock is run at 800MHz or above. The default
value for CNTFRQ remains at 62.50MHz (based on GTIMER_SCALE).

CNTFRQ is a read-as-written co-processor register; the property sets the
register's initial value which is used during realize() to configure the
QEMUTimers that back the generic timers. Beyond that the firmware can to
do whatever it sees fit with the CNTFRQ register though changes to the
value will not be reflected in the timers' rate.

I've tested this using an out-of-tree AST2600 SoC model (Cortex-A7) with
the SDK u-boot that sets CNTFRQ as appropriate, and by starting/running
machines with assorted ARM CPUs (palmetto-bmc with the ARM926EJ-S,
romulus-bmc with the ARM1176 and raspi2 with the Cortex-A53).

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
v4: Fix configuration for cores without a generic timer

v3: https://patchwork.ozlabs.org/patch/1160634/
Peter - I think this addresses most of your feedback. I still reach into
the QEMUTimer to fetch out scale when adjusting the nexttick
calculation, but we no longer need to update the scale member and force
a recalculation of the period.

v2: https://patchwork.ozlabs.org/patch/1144389/
---
 roms/SLOF           |  2 +-
 roms/skiboot        |  2 +-
 target/arm/cpu.c    | 43 +++++++++++++++++++++++++++++++++++--------
 target/arm/cpu.h    |  3 +++
 target/arm/helper.c | 30 ++++++++++++++++++++++++++----
 5 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/roms/SLOF b/roms/SLOF
index 7bfe584e3219..ea221600a116 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 7bfe584e321946771692711ff83ad2b5850daca7
+Subproject commit ea221600a116883137ef90b2b7ab7d2472bc4f10
diff --git a/roms/skiboot b/roms/skiboot
index 261ca8e779e5..3a6fdede6ce1 160000
--- a/roms/skiboot
+++ b/roms/skiboot
@@ -1 +1 @@
-Subproject commit 261ca8e779e5138869a45f174caa49be6a274501
+Subproject commit 3a6fdede6ce117facec0108afe716cf5d0472c3f
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c144718d..8b63a27761bb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -40,6 +40,8 @@
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
+#include <inttypes.h>
+
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -976,6 +978,10 @@ static void arm_cpu_initfn(Object *obj)
     }
 }
 
+static Property arm_cpu_gt_cntfrq_property =
+            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq,
+                               (1000 * 1000 * 1000) / GTIMER_SCALE);
+
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
@@ -1172,6 +1178,11 @@ void arm_cpu_post_init(Object *obj)
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
                              &error_abort);
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
+        qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property,
+                                 &error_abort);
+    }
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -1238,14 +1249,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                           arm_gt_ptimer_cb, cpu);
-    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                           arm_gt_vtimer_cb, cpu);
-    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                          arm_gt_htimer_cb, cpu);
-    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                          arm_gt_stimer_cb, cpu);
+
+    {
+        uint64_t scale;
+
+        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+            if (!cpu->gt_cntfrq) {
+                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
+                           cpu->gt_cntfrq);
+                return;
+            }
+            scale = MAX(1, NANOSECONDS_PER_SECOND / cpu->gt_cntfrq);
+        } else {
+            scale = GTIMER_SCALE;
+        }
+
+        cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                               arm_gt_ptimer_cb, cpu);
+        cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                               arm_gt_vtimer_cb, cpu);
+        cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_htimer_cb, cpu);
+        cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_stimer_cb, cpu);
+    }
 #endif
 
     cpu_exec_realizefn(cs, &local_err);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 297ad5e47ad8..8bd576f834ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -915,6 +915,9 @@ struct ARMCPU {
 
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
+
+    /* Used to configure the generic timer input clock */
+    uint64_t gt_cntfrq;
 };
 
 void arm_cpu_post_init(Object *obj);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 507026c9154b..09975704d47f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2409,7 +2409,21 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
 
 static uint64_t gt_get_countervalue(CPUARMState *env)
 {
-    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
+    uint64_t effective;
+
+    /*
+     * Deal with quantized clock scaling by calculating the effective frequency
+     * in terms of the timer scale.
+     */
+    if (env->cp15.c14_cntfrq <= NANOSECONDS_PER_SECOND) {
+        uint32_t scale = NANOSECONDS_PER_SECOND / env->cp15.c14_cntfrq;
+        effective = NANOSECONDS_PER_SECOND / scale;
+    } else {
+        effective = NANOSECONDS_PER_SECOND;
+    }
+
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), effective,
+                    NANOSECONDS_PER_SECOND);
 }
 
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
@@ -2445,8 +2459,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
          */
-        if (nexttick > INT64_MAX / GTIMER_SCALE) {
-            nexttick = INT64_MAX / GTIMER_SCALE;
+        if (nexttick > INT64_MAX / cpu->gt_timer[timeridx]->scale) {
+            nexttick = INT64_MAX / cpu->gt_timer[timeridx]->scale;
         }
         timer_mod(cpu->gt_timer[timeridx], nexttick);
         trace_arm_gt_recalc(timeridx, irqstate, nexttick);
@@ -2680,6 +2694,14 @@ void arm_gt_stimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_SEC);
 }
 
+static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    cpu->env.cp15.c14_cntfrq =
+        cpu->gt_cntfrq ?: (1000 * 1000 * 1000) / GTIMER_SCALE;
+}
+
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* Note that CNTFRQ is purely reads-as-written for the benefit
      * of software; writing it doesn't actually change the timer frequency.
@@ -2694,7 +2716,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
       .access = PL1_RW | PL0_R, .accessfn = gt_cntfrq_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
-      .resetvalue = (1000 * 1000 * 1000) / GTIMER_SCALE,
+      .resetfn = arm_gt_cntfrq_reset,
     },
     /* overall control: mostly access permissions */
     { .name = "CNTKCTL", .state = ARM_CP_STATE_BOTH,
-- 
2.20.1


