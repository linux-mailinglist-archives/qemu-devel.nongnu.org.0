Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D357C40ED01
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:59:35 +0200 (CEST)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzPq-0000iJ-UJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGu-0005wG-KN
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:25 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGn-0002V0-HE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829014; x=1663365014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dtAjsGnR5SRwaxuxP6Cufy0oFkc6UtKekHPyeOMQEU=;
 b=CIPUvlQOP0mfHps8i3/wOym3nZjvp88x+cP0PHeFvmWyLqhN32VwciSI
 cMvfsX+GKybJQA3Ti8Tx16vFMeMhT/nlmvk2MqSlcetKjet/nw/FalhBv
 hAVcfPp6wrjSsOzzwZh8CNkXfHIIm0uaxcFXxs7kwSX8TjegOccGpQj+U
 0/JFosIbXkVZWhnJh36VjN2aVYEm2w/s4OrE7eQi13XYqe2BdnmLKpmCQ
 +i0exxKLrobjDbu8bxvMM0M7gYDBIJrNa8+bK8LN8ty0a4BVhYdUtCTPa
 84jEcGjb9cWabcayRkp900vBjMQeTnE0vk/YrEXlIh5I6k14RSFhaov6D g==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="180726583"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:12 +0800
IronPort-SDR: rMIscTpD1Z0p69dY/q4Mp4AMGRQtRwQa6cm2cNrDPW1chxOM//g8K1WxR+V9ljCpd7QkyRhd1D
 nQO7gIHzxTF0LNh5RoEiA0QB9TFge6vyTdRfpFhvSppm3U/a1u0YeaGctLdWQsUotzy63txabo
 6XFiAnEW2bxrvP+b3YrUCDUmyGEuqJVpa8BZm9uu0TgIqpg5Od4iFtnmxFthp3y8yQ8cTLGwSb
 HtxqcEL1KMiCAp7pwc61K66CZR1B5aivpWJzAdaTpow5a7QdqVgGyxwZEF7T0D+3x21r/omG0T
 IPBBKerYVz3xvoTVnSUmHcPL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:26:31 -0700
IronPort-SDR: Au3qC4lWpsvrnHi7JOg1ke1V1rLnwHkqg7kCozgPXlWioP+y72fXwtzRiZYRs47tV3G+12FnP9
 5hHCpmPBlBo8v2mDERWoQH+kvWzOJ5wwa4IFK+XME/Ju326MIrYQA/kc7DyYMOxcsUFOzJBt65
 MXkZBcJK/rso47r8PGu8U7iV9MBMl1v9zviHHT8LqmWV4Jc1OFmcTcyAPfR5C9IN33oeF9ate4
 zSMLvBlqyAgZzJk/bpoQ/b73/fmvUDw4RjOI/lnTKpVZMkmCJuC9OJ85cfr1GwjOLC56aZYKen
 8a4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3650xzz1Rws4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829008; x=1634421009; bh=9dtAjsGnR5SRwaxuxP
 6Cufy0oFkc6UtKekHPyeOMQEU=; b=eQAnRePJpkEC5vaCIsEoo7koWNBBJ38Kcy
 6dvn7oz8Yz6zZBpNNVK+m+SXhMlKdxfx2OkmL0rJGZuKZUL/suZsP5kSJnhSRAwb
 Dlli3TKJRTCcwY+MBzfXflsETW5OBQEzZYD5OJtPTwtMlGnceIUY1y6+h1UBl3TN
 N7VP3hEQr76jkHKiu18AeNCCxziZBERk/GT8qeLk48Kr5AFuLWgzDrQ5I/DFf8w3
 sKmkcI0szzx23MrtPePSR86gcTFsr/XlbOjxwGDpmBh7rm6LQM/UogAxE18BxAOp
 n4EPDwEnwado2oIt1HvtqjnJ82j58z7hu0NhXiu5ODtzO9WmS3pg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oN80pYqCbII5 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W301VNGz1RvlX;
 Thu, 16 Sep 2021 14:50:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 11/21] hw/intc: Upgrade the SiFive CLINT implementation to
 RISC-V ACLINT
Date: Fri, 17 Sep 2021 07:48:54 +1000
Message-Id: <20210916214904.734206-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The RISC-V ACLINT is more modular and backward compatible with
original SiFive CLINT so instead of duplicating the original
SiFive CLINT implementation we upgrade the current SiFive CLINT
implementation to RISC-V ACLINT implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210831110603.338681-3-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/riscv_aclint.h |  54 +++--
 hw/intc/riscv_aclint.c         | 373 +++++++++++++++++++++++----------
 hw/riscv/microchip_pfsoc.c     |   9 +-
 hw/riscv/shakti_c.c            |  11 +-
 hw/riscv/sifive_e.c            |  11 +-
 hw/riscv/sifive_u.c            |   9 +-
 hw/riscv/spike.c               |  14 +-
 hw/riscv/virt.c                |  14 +-
 8 files changed, 339 insertions(+), 156 deletions(-)

diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclin=
t.h
index 921b1561dd..229bd08d25 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -1,8 +1,9 @@
 /*
- * SiFive CLINT (Core Local Interruptor) interface
+ * RISC-V ACLINT (Advanced Core Local Interruptor) interface
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
@@ -17,17 +18,17 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
-#ifndef HW_SIFIVE_CLINT_H
-#define HW_SIFIVE_CLINT_H
+#ifndef HW_RISCV_ACLINT_H
+#define HW_RISCV_ACLINT_H
=20
 #include "hw/sysbus.h"
=20
-#define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
+#define TYPE_RISCV_ACLINT_MTIMER "riscv.aclint.mtimer"
=20
-#define SIFIVE_CLINT(obj) \
-    OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
+#define RISCV_ACLINT_MTIMER(obj) \
+    OBJECT_CHECK(RISCVAclintMTimerState, (obj), TYPE_RISCV_ACLINT_MTIMER=
)
=20
-typedef struct SiFiveCLINTState {
+typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
=20
@@ -35,28 +36,45 @@ typedef struct SiFiveCLINTState {
     MemoryRegion mmio;
     uint32_t hartid_base;
     uint32_t num_harts;
-    uint32_t sip_base;
     uint32_t timecmp_base;
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
     qemu_irq *timer_irqs;
-    qemu_irq *soft_irqs;
-} SiFiveCLINTState;
+} RISCVAclintMTimerState;
=20
-DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
+DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts,
     uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
     bool provide_rdtime);
=20
-enum {
-    SIFIVE_SIP_BASE     =3D 0x0,
-    SIFIVE_TIMECMP_BASE =3D 0x4000,
-    SIFIVE_TIME_BASE    =3D 0xBFF8
-};
+#define TYPE_RISCV_ACLINT_SWI "riscv.aclint.swi"
+
+#define RISCV_ACLINT_SWI(obj) \
+    OBJECT_CHECK(RISCVAclintSwiState, (obj), TYPE_RISCV_ACLINT_SWI)
+
+typedef struct RISCVAclintSwiState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t hartid_base;
+    uint32_t num_harts;
+    uint32_t sswi;
+    qemu_irq *soft_irqs;
+} RISCVAclintSwiState;
+
+DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
+    uint32_t num_harts, bool sswi);
=20
 enum {
-    SIFIVE_CLINT_TIMEBASE_FREQ =3D 10000000
+    RISCV_ACLINT_DEFAULT_MTIMECMP      =3D 0x0,
+    RISCV_ACLINT_DEFAULT_MTIME         =3D 0x7ff8,
+    RISCV_ACLINT_DEFAULT_MTIMER_SIZE   =3D 0x8000,
+    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ =3D 10000000,
+    RISCV_ACLINT_MAX_HARTS             =3D 4095,
+    RISCV_ACLINT_SWI_SIZE              =3D 0x4000
 };
=20
 #endif
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 31ce990d0e..f1a5d3d284 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -1,8 +1,10 @@
 /*
- * SiFive CLINT (Core Local Interruptor)
+ * RISC-V ACLINT (Advanced Core Local Interruptor)
+ * URL: https://github.com/riscv/riscv-aclint
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
  *
  * This provides real-time clock, timer and interprocessor interrupts.
  *
@@ -22,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
@@ -30,10 +33,10 @@
 #include "qemu/timer.h"
 #include "hw/irq.h"
=20
-typedef struct sifive_clint_callback {
-    SiFiveCLINTState *s;
+typedef struct riscv_aclint_mtimer_callback {
+    RISCVAclintMTimerState *s;
     int num;
-} sifive_clint_callback;
+} riscv_aclint_mtimer_callback;
=20
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
@@ -45,10 +48,11 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_=
freq)
  * Called when timecmp is written to update the QEMU timer or immediatel=
y
  * trigger timer interrupt if mtimecmp <=3D current timer value.
  */
-static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cp=
u,
-                                       int hartid,
-                                       uint64_t value,
-                                       uint32_t timebase_freq)
+static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mt=
imer,
+                                              RISCVCPU *cpu,
+                                              int hartid,
+                                              uint64_t value,
+                                              uint32_t timebase_freq)
 {
     uint64_t next;
     uint64_t diff;
@@ -57,14 +61,16 @@ static void sifive_clint_write_timecmp(SiFiveCLINTSta=
te *s, RISCVCPU *cpu,
=20
     cpu->env.timecmp =3D value;
     if (cpu->env.timecmp <=3D rtc_r) {
-        /* if we're setting an MTIMECMP value in the "past",
-           immediately raise the timer interrupt */
-        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
+        /*
+         * If we're setting an MTIMECMP value in the "past",
+         * immediately raise the timer interrupt
+         */
+        qemu_irq_raise(mtimer->timer_irqs[hartid - mtimer->hartid_base])=
;
         return;
     }
=20
     /* otherwise, set up the future timer interrupt */
-    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
+    qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
     diff =3D cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timebase=
_freq);
@@ -97,38 +103,28 @@ static void sifive_clint_write_timecmp(SiFiveCLINTSt=
ate *s, RISCVCPU *cpu,
  * Callback used when the timer set using timer_mod expires.
  * Should raise the timer interrupt line
  */
-static void sifive_clint_timer_cb(void *opaque)
+static void riscv_aclint_mtimer_cb(void *opaque)
 {
-    sifive_clint_callback *state =3D opaque;
+    riscv_aclint_mtimer_callback *state =3D opaque;
=20
     qemu_irq_raise(state->s->timer_irqs[state->num]);
 }
=20
-/* CPU wants to read rtc or timecmp register */
-static uint64_t sifive_clint_read(void *opaque, hwaddr addr, unsigned si=
ze)
+/* CPU read MTIMER register */
+static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
+    unsigned size)
 {
-    SiFiveCLINTState *clint =3D opaque;
-    if (addr >=3D clint->sip_base &&
-        addr < clint->sip_base + (clint->num_harts << 2)) {
-        size_t hartid =3D clint->hartid_base + ((addr - clint->sip_base)=
 >> 2);
-        CPUState *cpu =3D qemu_get_cpu(hartid);
-        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
-        } else if ((addr & 0x3) =3D=3D 0) {
-            return (env->mip & MIP_MSIP) > 0;
-        } else {
-            error_report("clint: invalid read: %08x", (uint32_t)addr);
-            return 0;
-        }
-    } else if (addr >=3D clint->timecmp_base &&
-        addr < clint->timecmp_base + (clint->num_harts << 3)) {
-        size_t hartid =3D clint->hartid_base +
-            ((addr - clint->timecmp_base) >> 3);
+    RISCVAclintMTimerState *mtimer =3D opaque;
+
+    if (addr >=3D mtimer->timecmp_base &&
+        addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
+        size_t hartid =3D mtimer->hartid_base +
+                        ((addr - mtimer->timecmp_base) >> 3);
         CPUState *cpu =3D qemu_get_cpu(hartid);
         CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
         if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) =3D=3D 0) {
             /* timecmp_lo */
             uint64_t timecmp =3D env->timecmp;
@@ -138,79 +134,76 @@ static uint64_t sifive_clint_read(void *opaque, hwa=
ddr addr, unsigned size)
             uint64_t timecmp =3D env->timecmp;
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
-            error_report("clint: invalid read: %08x", (uint32_t)addr);
+            qemu_log_mask(LOG_UNIMP,
+                          "aclint-mtimer: invalid read: %08x", (uint32_t=
)addr);
             return 0;
         }
-    } else if (addr =3D=3D clint->time_base) {
+    } else if (addr =3D=3D mtimer->time_base) {
         /* time_lo */
-        return cpu_riscv_read_rtc(clint->timebase_freq) & 0xFFFFFFFF;
-    } else if (addr =3D=3D clint->time_base + 4) {
+        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+    } else if (addr =3D=3D mtimer->time_base + 4) {
         /* time_hi */
-        return (cpu_riscv_read_rtc(clint->timebase_freq) >> 32) & 0xFFFF=
FFFF;
+        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFF=
FFFFF;
     }
=20
-    error_report("clint: invalid read: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-mtimer: invalid read: %08x", (uint32_t)addr);
     return 0;
 }
=20
-/* CPU wrote to rtc or timecmp register */
-static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value=
,
-        unsigned size)
+/* CPU write MTIMER register */
+static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
+    uint64_t value, unsigned size)
 {
-    SiFiveCLINTState *clint =3D opaque;
+    RISCVAclintMTimerState *mtimer =3D opaque;
=20
-    if (addr >=3D clint->sip_base &&
-        addr < clint->sip_base + (clint->num_harts << 2)) {
-        size_t hartid =3D clint->hartid_base + ((addr - clint->sip_base)=
 >> 2);
-        CPUState *cpu =3D qemu_get_cpu(hartid);
-        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
-        } else if ((addr & 0x3) =3D=3D 0) {
-            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], =
value);
-        } else {
-            error_report("clint: invalid sip write: %08x", (uint32_t)add=
r);
-        }
-        return;
-    } else if (addr >=3D clint->timecmp_base &&
-        addr < clint->timecmp_base + (clint->num_harts << 3)) {
-        size_t hartid =3D clint->hartid_base +
-            ((addr - clint->timecmp_base) >> 3);
+    if (addr >=3D mtimer->timecmp_base &&
+        addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
+        size_t hartid =3D mtimer->hartid_base +
+                        ((addr - mtimer->timecmp_base) >> 3);
         CPUState *cpu =3D qemu_get_cpu(hartid);
         CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
         if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) =3D=3D 0) {
             /* timecmp_lo */
             uint64_t timecmp_hi =3D env->timecmp >> 32;
-            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase=
_freq);
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), ha=
rtid,
+                timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                mtimer->timebase_freq);
             return;
         } else if ((addr & 0x7) =3D=3D 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo =3D env->timecmp;
-            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase=
_freq);
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), ha=
rtid,
+                value << 32 | (timecmp_lo & 0xFFFFFFFF),
+                mtimer->timebase_freq);
         } else {
-            error_report("clint: invalid timecmp write: %08x", (uint32_t=
)addr);
+            qemu_log_mask(LOG_UNIMP,
+                          "aclint-mtimer: invalid timecmp write: %08x",
+                          (uint32_t)addr);
         }
         return;
-    } else if (addr =3D=3D clint->time_base) {
+    } else if (addr =3D=3D mtimer->time_base) {
         /* time_lo */
-        error_report("clint: time_lo write not implemented");
+        qemu_log_mask(LOG_UNIMP,
+                      "aclint-mtimer: time_lo write not implemented");
         return;
-    } else if (addr =3D=3D clint->time_base + 4) {
+    } else if (addr =3D=3D mtimer->time_base + 4) {
         /* time_hi */
-        error_report("clint: time_hi write not implemented");
+        qemu_log_mask(LOG_UNIMP,
+                      "aclint-mtimer: time_hi write not implemented");
         return;
     }
=20
-    error_report("clint: invalid write: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-mtimer: invalid write: %08x", (uint32_t)addr);
 }
=20
-static const MemoryRegionOps sifive_clint_ops =3D {
-    .read =3D sifive_clint_read,
-    .write =3D sifive_clint_write,
+static const MemoryRegionOps riscv_aclint_mtimer_ops =3D {
+    .read =3D riscv_aclint_mtimer_read,
+    .write =3D riscv_aclint_mtimer_write,
     .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
@@ -218,66 +211,75 @@ static const MemoryRegionOps sifive_clint_ops =3D {
     }
 };
=20
-static Property sifive_clint_properties[] =3D {
-    DEFINE_PROP_UINT32("hartid-base", SiFiveCLINTState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-harts", SiFiveCLINTState, num_harts, 0),
-    DEFINE_PROP_UINT32("sip-base", SiFiveCLINTState, sip_base, 0),
-    DEFINE_PROP_UINT32("timecmp-base", SiFiveCLINTState, timecmp_base, 0=
),
-    DEFINE_PROP_UINT32("time-base", SiFiveCLINTState, time_base, 0),
-    DEFINE_PROP_UINT32("aperture-size", SiFiveCLINTState, aperture_size,=
 0),
-    DEFINE_PROP_UINT32("timebase-freq", SiFiveCLINTState, timebase_freq,=
 0),
+static Property riscv_aclint_mtimer_properties[] =3D {
+    DEFINE_PROP_UINT32("hartid-base", RISCVAclintMTimerState,
+        hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAclintMTimerState, num_harts, 1=
),
+    DEFINE_PROP_UINT32("timecmp-base", RISCVAclintMTimerState,
+        timecmp_base, RISCV_ACLINT_DEFAULT_MTIMECMP),
+    DEFINE_PROP_UINT32("time-base", RISCVAclintMTimerState,
+        time_base, RISCV_ACLINT_DEFAULT_MTIME),
+    DEFINE_PROP_UINT32("aperture-size", RISCVAclintMTimerState,
+        aperture_size, RISCV_ACLINT_DEFAULT_MTIMER_SIZE),
+    DEFINE_PROP_UINT32("timebase-freq", RISCVAclintMTimerState,
+        timebase_freq, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
-static void sifive_clint_realize(DeviceState *dev, Error **errp)
+static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
 {
-    SiFiveCLINTState *s =3D SIFIVE_CLINT(dev);
-    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
-                          TYPE_SIFIVE_CLINT, s->aperture_size);
+    RISCVAclintMTimerState *s =3D RISCV_ACLINT_MTIMER(dev);
+    int i;
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &riscv_aclint_mtimer_op=
s,
+                          s, TYPE_RISCV_ACLINT_MTIMER, s->aperture_size)=
;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
=20
     s->timer_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
=20
-    s->soft_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
-    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
+    /* Claim timer interrupt bits */
+    for (i =3D 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
+            error_report("MTIP already claimed");
+            exit(1);
+        }
+    }
 }
=20
-static void sifive_clint_class_init(ObjectClass *klass, void *data)
+static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *dat=
a)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    dc->realize =3D sifive_clint_realize;
-    device_class_set_props(dc, sifive_clint_properties);
+    dc->realize =3D riscv_aclint_mtimer_realize;
+    device_class_set_props(dc, riscv_aclint_mtimer_properties);
 }
=20
-static const TypeInfo sifive_clint_info =3D {
-    .name          =3D TYPE_SIFIVE_CLINT,
+static const TypeInfo riscv_aclint_mtimer_info =3D {
+    .name          =3D TYPE_RISCV_ACLINT_MTIMER,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
-    .instance_size =3D sizeof(SiFiveCLINTState),
-    .class_init    =3D sifive_clint_class_init,
+    .instance_size =3D sizeof(RISCVAclintMTimerState),
+    .class_init    =3D riscv_aclint_mtimer_class_init,
 };
=20
-static void sifive_clint_register_types(void)
-{
-    type_register_static(&sifive_clint_info);
-}
-
-type_init(sifive_clint_register_types)
-
 /*
- * Create CLINT device.
+ * Create ACLINT MTIMER device.
  */
-DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
+DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts,
     uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
     bool provide_rdtime)
 {
     int i;
+    DeviceState *dev =3D qdev_new(TYPE_RISCV_ACLINT_MTIMER);
+
+    assert(num_harts <=3D RISCV_ACLINT_MAX_HARTS);
+    assert(!(addr & 0x7));
+    assert(!(timecmp_base & 0x7));
+    assert(!(time_base & 0x7));
=20
-    DeviceState *dev =3D qdev_new(TYPE_SIFIVE_CLINT);
     qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
     qdev_prop_set_uint32(dev, "num-harts", num_harts);
-    qdev_prop_set_uint32(dev, "sip-base", sip_base);
     qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
     qdev_prop_set_uint32(dev, "time-base", time_base);
     qdev_prop_set_uint32(dev, "aperture-size", size);
@@ -289,7 +291,8 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr =
size,
         CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
         RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
         CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
-        sifive_clint_callback *cb =3D g_malloc0(sizeof(sifive_clint_call=
back));
+        riscv_aclint_mtimer_callback *cb =3D
+            g_malloc0(sizeof(riscv_aclint_mtimer_callback));
=20
         if (!env) {
             g_free(cb);
@@ -299,17 +302,159 @@ DeviceState *sifive_clint_create(hwaddr addr, hwad=
dr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_fr=
eq);
         }
=20
-        cb->s =3D SIFIVE_CLINT(dev);
+        cb->s =3D RISCV_ACLINT_MTIMER(dev);
         cb->num =3D i;
         env->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cb);
+                                  &riscv_aclint_mtimer_cb, cb);
         env->timecmp =3D 0;
=20
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIME=
R));
-        qdev_connect_gpio_out(dev, num_harts + i,
-                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT=
));
     }
=20
     return dev;
 }
+
+/* CPU read [M|S]SWI register */
+static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
+    unsigned size)
+{
+    RISCVAclintSwiState *swi =3D opaque;
+
+    if (addr < (swi->num_harts << 2)) {
+        size_t hartid =3D swi->hartid_base + (addr >> 2);
+        CPUState *cpu =3D qemu_get_cpu(hartid);
+        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) =3D=3D 0) {
+            return (swi->sswi) ? 0 : ((env->mip & MIP_MSIP) > 0);
+        }
+    }
+
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-swi: invalid read: %08x", (uint32_t)addr);
+    return 0;
+}
+
+/* CPU write [M|S]SWI register */
+static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t v=
alue,
+        unsigned size)
+{
+    RISCVAclintSwiState *swi =3D opaque;
+
+    if (addr < (swi->num_harts << 2)) {
+        size_t hartid =3D swi->hartid_base + (addr >> 2);
+        CPUState *cpu =3D qemu_get_cpu(hartid);
+        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) =3D=3D 0) {
+            if (value & 0x1) {
+                qemu_irq_raise(swi->soft_irqs[hartid - swi->hartid_base]=
);
+            } else {
+                if (!swi->sswi) {
+                    qemu_irq_lower(swi->soft_irqs[hartid - swi->hartid_b=
ase]);
+                }
+            }
+            return;
+        }
+    }
+
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-swi: invalid write: %08x", (uint32_t)addr);
+}
+
+static const MemoryRegionOps riscv_aclint_swi_ops =3D {
+    .read =3D riscv_aclint_swi_read,
+    .write =3D riscv_aclint_swi_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4
+    }
+};
+
+static Property riscv_aclint_swi_properties[] =3D {
+    DEFINE_PROP_UINT32("hartid-base", RISCVAclintSwiState, hartid_base, =
0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAclintSwiState, num_harts, 1),
+    DEFINE_PROP_UINT32("sswi", RISCVAclintSwiState, sswi, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
+{
+    RISCVAclintSwiState *swi =3D RISCV_ACLINT_SWI(dev);
+    int i;
+
+    memory_region_init_io(&swi->mmio, OBJECT(dev), &riscv_aclint_swi_ops=
, swi,
+                          TYPE_RISCV_ACLINT_SWI, RISCV_ACLINT_SWI_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &swi->mmio);
+
+    swi->soft_irqs =3D g_malloc(sizeof(qemu_irq) * swi->num_harts);
+    qdev_init_gpio_out(dev, swi->soft_irqs, swi->num_harts);
+
+    /* Claim software interrupt bits */
+    for (i =3D 0; i < swi->num_harts; i++) {
+        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
+        /* We don't claim mip.SSIP because it is writeable by software *=
/
+        if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < =
0) {
+            error_report("MSIP already claimed");
+            exit(1);
+        }
+    }
+}
+
+static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D riscv_aclint_swi_realize;
+    device_class_set_props(dc, riscv_aclint_swi_properties);
+}
+
+static const TypeInfo riscv_aclint_swi_info =3D {
+    .name          =3D TYPE_RISCV_ACLINT_SWI,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(RISCVAclintSwiState),
+    .class_init    =3D riscv_aclint_swi_class_init,
+};
+
+/*
+ * Create ACLINT [M|S]SWI device.
+ */
+DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
+    uint32_t num_harts, bool sswi)
+{
+    int i;
+    DeviceState *dev =3D qdev_new(TYPE_RISCV_ACLINT_SWI);
+
+    assert(num_harts <=3D RISCV_ACLINT_MAX_HARTS);
+    assert(!(addr & 0x3));
+
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "sswi", sswi ? true : false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i =3D 0; i < num_harts; i++) {
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+        RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
+
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(rvcpu),
+                                  (sswi) ? IRQ_S_SOFT : IRQ_M_SOFT));
+    }
+
+    return dev;
+}
+
+static void riscv_aclint_register_types(void)
+{
+    type_register_static(&riscv_aclint_mtimer_info);
+    type_register_static(&riscv_aclint_swi_info);
+}
+
+type_init(riscv_aclint_register_types)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eed9e81355..e475b6d511 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -234,9 +234,12 @@ static void microchip_pfsoc_soc_realize(DeviceState =
*dev, Error **errp)
         memmap[MICROCHIP_PFSOC_BUSERR_UNIT4].size);
=20
     /* CLINT */
-    sifive_clint_create(memmap[MICROCHIP_PFSOC_CLINT].base,
-        memmap[MICROCHIP_PFSOC_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+    riscv_aclint_swi_create(memmap[MICROCHIP_PFSOC_CLINT].base,
+        0, ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(
+        memmap[MICROCHIP_PFSOC_CLINT].base + RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
=20
     /* L2 cache controller */
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index f9f0a45651..2f084d3c8d 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -124,10 +124,13 @@ static void shakti_c_soc_state_realize(DeviceState =
*dev, Error **errp)
         SHAKTI_C_PLIC_CONTEXT_STRIDE,
         shakti_c_memmap[SHAKTI_C_PLIC].size);
=20
-    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
-        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    riscv_aclint_swi_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
+        0, 1, false);
+    riscv_aclint_mtimer_create(shakti_c_memmap[SHAKTI_C_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, 1,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
=20
     qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index a73848958e..6e95ea5896 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -207,10 +207,13 @@ static void sifive_e_soc_realize(DeviceState *dev, =
Error **errp)
         SIFIVE_E_PLIC_CONTEXT_BASE,
         SIFIVE_E_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_E_DEV_PLIC].size);
-    sifive_clint_create(memmap[SIFIVE_E_DEV_CLINT].base,
-        memmap[SIFIVE_E_DEV_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    riscv_aclint_swi_create(memmap[SIFIVE_E_DEV_CLINT].base,
+        0, ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(memmap[SIFIVE_E_DEV_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
     create_unimplemented_device("riscv.sifive.e.aon",
         memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index aaab46c43c..fc5790b8ce 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -884,9 +884,12 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
rror **errp)
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_I=
RQ));
     sifive_uart_create(system_memory, memmap[SIFIVE_U_DEV_UART1].base,
         serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_I=
RQ));
-    sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
-        memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+    riscv_aclint_swi_create(memmap[SIFIVE_U_DEV_CLINT].base, 0,
+        ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(memmap[SIFIVE_U_DEV_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 690c19c12a..79ae355ae2 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -84,7 +84,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
=20
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -227,11 +227,15 @@ static void spike_board_init(MachineState *machine)
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
=20
         /* Core Local Interruptor (timer and IPI) for each socket */
-        sifive_clint_create(
+        riscv_aclint_swi_create(
             memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size,
-            memmap[SPIKE_CLINT].size, base_hartid, hart_count,
-            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, false);
+            base_hartid, hart_count, false);
+        riscv_aclint_mtimer_create(
+            memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size +
+                RISCV_ACLINT_SWI_SIZE,
+            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
     }
=20
     /* register system main memory (actual RAM) */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index df33fd74c2..1cd7ac1546 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,7 @@ static void create_fdt(RISCVVirtState *s, const MemMa=
pEntry *memmap,
=20
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -613,11 +613,15 @@ static void virt_machine_init(MachineState *machine=
)
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
=20
         /* Per-socket CLINT */
-        sifive_clint_create(
+        riscv_aclint_swi_create(
             memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            memmap[VIRT_CLINT].size, base_hartid, hart_count,
-            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, true);
+            base_hartid, hart_count, false);
+        riscv_aclint_mtimer_create(
+            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
+                RISCV_ACLINT_SWI_SIZE,
+            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
=20
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config =3D plic_hart_config_string(hart_count);
--=20
2.31.1


