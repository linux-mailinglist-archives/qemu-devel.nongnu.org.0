Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63057D7EE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 03:11:40 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEhCc-0004V9-Fh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 21:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2H-0002g9-1h
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 21:00:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2D-0004na-10
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 21:00:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2899836pjf.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 18:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IpBca2GSDAyuiq2LKGBn0QfffXYjh/otz2A8zWDEpnM=;
 b=DbhKA4uDl9PAHEcwxlLVti/Eb8BxKAbF9pM4ZI2AXdI22BBWr6iF0iZc/dl86vMytV
 wXEljJ+RgYlH+k5ilQNkGY97r/u1t2Yen9YeR7pDpLycidTh/ymklIh2Pb2GogLHb8cN
 oX3lCIc02a9/L3sZjDQ3MVrMDKKWaAOj/1J5eL2xldcEGDkwp89FzX9it86NiFx6d4HN
 HK6wv881R41NJtWK/Tb9ITEsgvHYmP5tHR4s4ZxwMKo6Zq8XRl73MrMNLibYnhV4qZaF
 sS+Q1ewfYZVBYH874SqOwx8exrzYByhQ+qW1o/EbKmItnI5nv8u0tPEkN/bV5ZGGK3Hb
 IDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IpBca2GSDAyuiq2LKGBn0QfffXYjh/otz2A8zWDEpnM=;
 b=EK/zzdgaO8li4c2Vn5m33W+i4mPM6njQV7uGOGrUyORtVLn2qVyk9KwfsaAWoRilIV
 K56uGDCSIfnDHDNtvH4JUiOA8EehEcCgOu9DFbe/XrO2Mwlo8xY1Vl5v6B9RphPD0pAd
 MDUm8WA6AzSHKYZEEMTWeS2Le26otQvDJaWq/XYWtCbnyGJgEb5m1psjHhAl3cbE2tTU
 fQ+DNaCZcj0WQiJWvNZq5MP2K4wPhGDmX6kLl1nY77w7L108x06q/PozaGVktlc0Lltw
 JpfNCmJ7RZwACNrGQ2K0s6Ur1pUHJPFzkPMHm6sMfA8SxwaixhsaLAI+gr74pmJp32z5
 jyuQ==
X-Gm-Message-State: AJIora/qo8BduDzIdUXrhZ9008YiYhRU03uynbsKnQoqAwL6fIVVSEkd
 2X1oc1s6ZUtrus1L0rT2fDgxI16zjFx6xA==
X-Google-Smtp-Source: AGRyM1vSRJlqXrlErdq8LUAFhL9AhaEBNvfSCiLNsAfpFSLNZGbaNQGVCa8fw5gogFJZOY6Talc0fg==
X-Received: by 2002:a17:90b:4a83:b0:1ef:de4c:65f0 with SMTP id
 lp3-20020a17090b4a8300b001efde4c65f0mr14362896pjb.149.1658451651356; 
 Thu, 21 Jul 2022 18:00:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa797b4000000b0052b8a7f6b65sm2393631pfq.109.2022.07.21.18.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 18:00:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6  1/3] hw/intc: Move mtimer/mtimecmp to aclint
Date: Thu, 21 Jul 2022 18:00:44 -0700
Message-Id: <20220722010046.343744-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722010046.343744-1-atishp@rivosinc.com>
References: <20220722010046.343744-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Historically, The mtime/mtimecmp has been part of the CPU because
they are per hart entities. However, they actually belong to aclint
which is a MMIO device.

Move them to the ACLINT device. This also emulates the real hardware
more closely.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c         | 41 ++++++++++++++++++++++++----------
 hw/timer/ibex_timer.c          | 18 ++++++---------
 include/hw/intc/riscv_aclint.h |  2 ++
 include/hw/timer/ibex_timer.h  |  2 ++
 target/riscv/cpu.h             |  2 --
 target/riscv/machine.c         |  5 ++---
 6 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e7942c4e5a32..47f355224612 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -32,6 +32,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
+#include "migration/vmstate.h"
 
 typedef struct riscv_aclint_mtimer_callback {
     RISCVAclintMTimerState *s;
@@ -65,8 +66,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
 
-    cpu->env.timecmp = value;
-    if (cpu->env.timecmp <= rtc_r) {
+    mtimer->timecmp[hartid] = value;
+    if (mtimer->timecmp[hartid] <= rtc_r) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
@@ -77,7 +78,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     /* otherwise, set up the future timer interrupt */
     qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
-    diff = cpu->env.timecmp - rtc_r;
+    diff = mtimer->timecmp[hartid] - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
 
@@ -102,7 +103,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
         next = MIN(next, INT64_MAX);
     }
 
-    timer_mod(cpu->env.timer, next);
+    timer_mod(mtimer->timers[hartid], next);
 }
 
 /*
@@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
             qemu_log_mask(LOG_UNIMP,
@@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 0) {
             if (size == 4) {
                 /* timecmp_lo for RV32/RV64 */
-                uint64_t timecmp_hi = env->timecmp >> 32;
+                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     timecmp_hi << 32 | (value & 0xFFFFFFFF));
             } else {
@@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 4) {
             if (size == 4) {
                 /* timecmp_hi for RV32/RV64 */
-                uint64_t timecmp_lo = env->timecmp;
+                uint64_t timecmp_lo = mtimer->timecmp[hartid];
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     value << 32 | (timecmp_lo & 0xFFFFFFFF));
             } else {
@@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
                                               mtimer->hartid_base + i,
-                                              env->timecmp);
+                                              mtimer->timecmp[i]);
         }
         return;
     }
@@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     s->timer_irqs = g_new(qemu_irq, s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
 
+    s->timers = g_malloc0(s->num_harts * sizeof(QEMUTimer));
+    s->timecmp = g_new0(uint64_t, s->num_harts);
     /* Claim timer interrupt bits */
     for (i = 0; i < s->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
@@ -310,6 +313,18 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
     riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
 }
 
+static const VMStateDescription vmstate_riscv_mtimer = {
+    .name = "riscv_mtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
+                                  num_harts, 0,
+                                  vmstate_info_uint64, uint64_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -317,6 +332,7 @@ static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     rc->phases.enter = riscv_aclint_mtimer_reset_enter;
+    dc->vmsd = &vmstate_riscv_mtimer;
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
@@ -336,6 +352,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
 {
     int i;
     DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
+    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
 
     assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
     assert(!(addr & 0x7));
@@ -366,11 +383,11 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
 
-        cb->s = RISCV_ACLINT_MTIMER(dev);
+        cb->s = s;
         cb->num = i;
-        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+        s->timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &riscv_aclint_mtimer_cb, cb);
-        env->timecmp = 0;
+        s->timecmp[i] = 0;
 
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364daab..d8b8e4e1f602 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -60,8 +60,6 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 
 static void ibex_timer_update_irqs(IbexTimerState *s)
 {
-    CPUState *cs = qemu_get_cpu(0);
-    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t value = s->timer_compare_lower0 |
                          ((uint64_t)s->timer_compare_upper0 << 32);
     uint64_t next, diff;
@@ -73,9 +71,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Update the CPUs mtimecmp */
-    cpu->env.timecmp = value;
+    s->mtimecmp = value;
 
-    if (cpu->env.timecmp <= now) {
+    if (s->mtimecmp <= now) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -91,7 +89,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
 
-    diff = cpu->env.timecmp - now;
+    diff = s->mtimecmp - now;
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                                  muldiv64(diff,
                                           NANOSECONDS_PER_SECOND,
@@ -99,9 +97,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 
     if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         /* We overflowed the timer, just set it as large as we can */
-        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
+        timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
     } else {
-        timer_mod(cpu->env.timer, next);
+        timer_mod(s->mtimer, next);
     }
 }
 
@@ -120,11 +118,9 @@ static void ibex_timer_reset(DeviceState *dev)
 {
     IbexTimerState *s = IBEX_TIMER(dev);
 
-    CPUState *cpu = qemu_get_cpu(0);
-    CPURISCVState *env = cpu->env_ptr;
-    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+    s->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                               &ibex_timer_cb, s);
-    env->timecmp = 0;
+    s->mtimecmp = 0;
 
     s->timer_ctrl = 0x00000000;
     s->timer_cfg0 = 0x00010000;
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 26d4048687fb..693415eb6def 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -32,6 +32,8 @@ typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
     uint64_t time_delta;
+    uint64_t *timecmp;
+    QEMUTimer **timers;
 
     /*< public >*/
     MemoryRegion mmio;
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 1a0a28d5fab5..41f5c82a920b 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -33,6 +33,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
 struct IbexTimerState {
     /* <private> */
     SysBusDevice parent_obj;
+    uint64_t mtimecmp;
+    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
 
     /* <public> */
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055ac9..eb4faeaf4471 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,7 +303,6 @@ struct CPUArchState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
-    uint64_t timecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -358,7 +357,6 @@ struct CPUArchState {
     float_status fp_status;
 
     /* Fields from here on are preserved across CPU reset. */
-    QEMUTimer *timer; /* Internal timer */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index dc182ca81119..b508b042cb73 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -307,8 +307,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -359,7 +359,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
-        VMSTATE_UINT64(env.timecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
-- 
2.25.1


