Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F7564379
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:28:16 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nTD-0001cC-M3
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEq-0000Se-CM
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:24 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEk-0001zT-O6
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807197; x=1688343197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUq9OCPFvXQkN1DLfjeUGk4+XsY/6I1kHELLlwatxUI=;
 b=IH5qQSQwjXHucF9Z4nHr4EDXj1AwovEZMyPvRbiFD+jk5nDyXgwxFzOW
 18yVdSggtLes9Yddfm+dR/dP7X6iL2LKomKEcm/KyiGynZXPv5p99kzdR
 81fpOXoL1Zkz8w76pf+DTti/Cq5V1PhDVTkeFTF720WDiL0r1FDMN7HqB
 wxMIxSxbWYTBcQBq8thn4L40NyaVf3+Jc8ZeT2Y1kmWGP7yiCMc5dVk/G
 avAQ7qmBm1BrbghI7hDmNxlQPCMkgxerz2FDVZRrGMWg7c5551tsGT0oI
 HmNgeCuPQFjMJvyYAwKYXDfBq2QySQq5hU6Ieb+fG1p80t/xlnKGiGJkn g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667254"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:07 +0800
IronPort-SDR: JX/DEf4psfltLT1nDKiwMbUyrw5jnjkbofr0dFZ9vN/Qw7gcKkrw8KFji19Dkau6maY91HTKM/
 uBwL6YO+r4+/3PgQhDoh2uBul9xq2vSzSiRIJwtHr/aD7vmQRO3WB13mX8hVS7aFqKLrW4B9Oi
 e+fiBh5vCPDhUSe2zohdeeheDWOegBeG1Av5I+xsGaYrzdsQwBNI1WutiyNv3QhYdhePw8T29k
 5HYP2NR2WEMkDYSn5awUV1Mt49VGsrP2i1yUQnEjcU4MOvnmBy10ofbLfyhlB01XDJCWUF/+p9
 4MYqG4B57B/V49KhMSR1XwFA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:30 -0700
IronPort-SDR: He1qo/THLKnn2WSiuAZ2DOHt7G7TOqDyQQQ7gLryNJdVQzJOsHWgKsTVR9fnHbZTtQ/q5HJ7zd
 qcba2GYfww4ELW6rdmVSKR5OUEcjXhsKdhAtrOS6v4S3pZC/TQLzhB/T6iCv8+W1U7o7xm2SR3
 z5zytAbYkcjrncwrKWO1O0rp2vtIEDLVWiWQsrX1FEvSEjCtYGdXuI6f1dX62cx2HOjvSFPscv
 wSh/l03BoGTidgVnsMIe2eNG0evNTEMBF+GW0tF/vLafOHUIvGb+9dfmqDgdYego3G7bYhCO8I
 eto=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xg50mDz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807186; x=1659399187; bh=uUq9OCPFvXQkN1DLfj
 eUGk4+XsY/6I1kHELLlwatxUI=; b=mdI5GelRbMD2XpehRj3jY4zCbN97pIZk6V
 vd0aLJjWAP7BfTjpJGoWh+EGJA4qfLvqwMH9LUeSiJAIoGyfWdZ+avCTZ0PtJz2C
 m5V4sIeW1qlO7Ykw0L+4txRw1X/5kF/Ivm1O2idtKiqM5TQOmLVkm4b0rQOJV0i5
 K14XXwAho2mFML1GBXa2DqwU4NXHQSTIbvqIdhPwD+GxtU55vLuykh+XNahZcHoj
 ueA4Oxc9nwH3/d+w0odu5cgtBsQ7VYSnWiwPsPN3FviWwQm0Wla+Uwt6asP/0mnO
 wCd5x0LAUhdb8XMRwId3Iwyy46mdsi8RDVssZAst4THvlgFiY44w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2cpsbEofOlsn for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:06 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xc06CWz1Rw4L;
 Sat,  2 Jul 2022 17:13:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 12/19] target/riscv: Support mcycle/minstret write operation
Date: Sun,  3 Jul 2022 10:12:27 +1000
Message-Id: <20220703001234.439716-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Atish Patra <atish.patra@wdc.com>

mcycle/minstret are actually WARL registers and can be written with any
given value. With SBI PMU extension, it will be used to store a initial
value provided from supervisor OS. The Qemu also need prohibit the counte=
r
increment if mcountinhibit is set.

Support mcycle/minstret through generic counter infrastructure.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-8-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  23 ++++--
 target/riscv/pmu.h       |  28 +++++++
 target/riscv/csr.c       | 155 ++++++++++++++++++++++++++++-----------
 target/riscv/machine.c   |  25 ++++++-
 target/riscv/pmu.c       |  32 ++++++++
 target/riscv/meson.build |   3 +-
 6 files changed, 213 insertions(+), 53 deletions(-)
 create mode 100644 target/riscv/pmu.h
 create mode 100644 target/riscv/pmu.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 199d0d570b..5c7acc055a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -117,7 +117,7 @@ typedef struct CPUArchState CPURISCVState;
 #endif
=20
 #define RV_VLEN_MAX 1024
-#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMEVENTS 32
 #define RV_MAX_MHPMCOUNTERS 32
=20
 FIELD(VTYPE, VLMUL, 0, 3)
@@ -127,6 +127,18 @@ FIELD(VTYPE, VMA, 7, 1)
 FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
=20
+typedef struct PMUCTRState {
+    /* Current value of a counter */
+    target_ulong mhpmcounter_val;
+    /* Current value of a counter in RV32*/
+    target_ulong mhpmcounterh_val;
+    /* Snapshot values of counter */
+    target_ulong mhpmcounter_prev;
+    /* Snapshort value of a counter in RV32 */
+    target_ulong mhpmcounterh_prev;
+    bool started;
+} PMUCTRState;
+
 struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
@@ -279,13 +291,10 @@ struct CPUArchState {
=20
     target_ulong mcountinhibit;
=20
-    /* PMU counter configured values */
-    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
-
-    /* for RV32 */
-    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
+    /* PMU counter state */
+    PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
=20
-    /* PMU event selector configured values */
+    /* PMU event selector configured values. First three are unused*/
     target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
=20
     target_ulong sscratch;
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
new file mode 100644
index 0000000000..58a5bc3a40
--- /dev/null
+++ b/target/riscv/pmu.h
@@ -0,0 +1,28 @@
+/*
+ * RISC-V PMU header file.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
+                                        uint32_t target_ctr);
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
+                                  uint32_t target_ctr);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b931a3970e..d65318dcc6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpu-timers.h"
@@ -597,34 +598,28 @@ static int write_vcsr(CPURISCVState *env, int csrno=
, target_ulong val)
 }
=20
 /* User Timers and Counters */
-static RISCVException read_instret(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static target_ulong get_ticks(bool shift)
 {
+    int64_t val;
+    target_ulong result;
+
 #if !defined(CONFIG_USER_ONLY)
     if (icount_enabled()) {
-        *val =3D icount_get();
+        val =3D icount_get();
     } else {
-        *val =3D cpu_get_host_ticks();
+        val =3D cpu_get_host_ticks();
     }
 #else
-    *val =3D cpu_get_host_ticks();
+    val =3D cpu_get_host_ticks();
 #endif
-    return RISCV_EXCP_NONE;
-}
=20
-static RISCVException read_instreth(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
-{
-#if !defined(CONFIG_USER_ONLY)
-    if (icount_enabled()) {
-        *val =3D icount_get() >> 32;
+    if (shift) {
+        result =3D val >> 32;
     } else {
-        *val =3D cpu_get_host_ticks() >> 32;
+        result =3D val;
     }
-#else
-    *val =3D cpu_get_host_ticks() >> 32;
-#endif
-    return RISCV_EXCP_NONE;
+
+    return result;
 }
=20
 #if defined(CONFIG_USER_ONLY)
@@ -642,11 +637,23 @@ static RISCVException read_timeh(CPURISCVState *env=
, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *=
val)
+{
+    *val =3D get_ticks(false);
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong =
*val)
+{
+    *val =3D get_ticks(true);
+    return RISCV_EXCP_NONE;
+}
+
 #else /* CONFIG_USER_ONLY */
=20
 static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *v=
al)
 {
-    int evt_index =3D csrno - CSR_MHPMEVENT3;
+    int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
=20
     *val =3D env->mhpmevent_val[evt_index];
=20
@@ -655,7 +662,7 @@ static int read_mhpmevent(CPURISCVState *env, int csr=
no, target_ulong *val)
=20
 static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong v=
al)
 {
-    int evt_index =3D csrno - CSR_MHPMEVENT3;
+    int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
=20
     env->mhpmevent_val[evt_index] =3D val;
=20
@@ -664,55 +671,105 @@ static int write_mhpmevent(CPURISCVState *env, int=
 csrno, target_ulong val)
=20
 static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong=
 val)
 {
-    int ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
+    int ctr_idx =3D csrno - CSR_MCYCLE;
+    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
=20
-    env->mhpmcounter_val[ctr_index] =3D val;
+    counter->mhpmcounter_val =3D val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounter_prev =3D get_ticks(false);
+    } else {
+        /* Other counters can keep incrementing from the given value */
+        counter->mhpmcounter_prev =3D val;
+    }
=20
     return RISCV_EXCP_NONE;
 }
=20
 static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulon=
g val)
 {
-    int ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
+    int ctr_idx =3D csrno - CSR_MCYCLEH;
+    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
=20
-    env->mhpmcounterh_val[ctr_index] =3D val;
+    counter->mhpmcounterh_val =3D val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounterh_prev =3D get_ticks(true);
+    } else {
+        counter->mhpmcounterh_prev =3D val;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulon=
g *val,
+                                         bool upper_half, uint32_t ctr_i=
dx)
+{
+    PMUCTRState counter =3D env->pmu_ctrs[ctr_idx];
+    target_ulong ctr_prev =3D upper_half ? counter.mhpmcounterh_prev :
+                                         counter.mhpmcounter_prev;
+    target_ulong ctr_val =3D upper_half ? counter.mhpmcounterh_val :
+                                        counter.mhpmcounter_val;
+
+    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
+        /**
+         * Counter should not increment if inhibit bit is set. We can't =
really
+         * stop the icount counting. Just return the counter value writt=
en by
+         * the supervisor to indicate that counter was not incremented.
+         */
+        if (!counter.started) {
+            *val =3D ctr_val;
+            return RISCV_EXCP_NONE;
+        } else {
+            /* Mark that the counter has been stopped */
+            counter.started =3D false;
+        }
+    }
+
+    /**
+     * The kernel computes the perf delta by subtracting the current val=
ue from
+     * the value it initialized previously (ctr_val).
+     */
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        *val =3D get_ticks(upper_half) - ctr_prev + ctr_val;
+    } else {
+        *val =3D ctr_val;
+    }
=20
     return RISCV_EXCP_NONE;
 }
=20
 static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *=
val)
 {
-    int ctr_index;
+    uint16_t ctr_index;
=20
     if (csrno >=3D CSR_MCYCLE && csrno <=3D CSR_MHPMCOUNTER31) {
-        ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
+        ctr_index =3D csrno - CSR_MCYCLE;
     } else if (csrno >=3D CSR_CYCLE && csrno <=3D CSR_HPMCOUNTER31) {
-        ctr_index =3D csrno - CSR_HPMCOUNTER3 + 3;
+        ctr_index =3D csrno - CSR_CYCLE;
     } else {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    *val =3D env->mhpmcounter_val[ctr_index];
=20
-    return RISCV_EXCP_NONE;
+    return riscv_pmu_read_ctr(env, val, false, ctr_index);
 }
=20
 static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong =
*val)
 {
-    int ctr_index;
+    uint16_t ctr_index;
=20
     if (csrno >=3D CSR_MCYCLEH && csrno <=3D CSR_MHPMCOUNTER31H) {
-        ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
+        ctr_index =3D csrno - CSR_MCYCLEH;
     } else if (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_HPMCOUNTER31H) {
-        ctr_index =3D csrno - CSR_HPMCOUNTER3H + 3;
+        ctr_index =3D csrno - CSR_CYCLEH;
     } else {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    *val =3D env->mhpmcounterh_val[ctr_index];
=20
-    return RISCV_EXCP_NONE;
+    return riscv_pmu_read_ctr(env, val, true, ctr_index);
 }
=20
-
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1567,11 +1624,23 @@ static RISCVException read_mcountinhibit(CPURISCV=
State *env, int csrno,
 static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
                                           target_ulong val)
 {
+    int cidx;
+    PMUCTRState *counter;
+
     if (env->priv_ver < PRIV_VERSION_1_11_0) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
     env->mcountinhibit =3D val;
+
+    /* Check if any other counter is also monitoring cycles/instructions=
 */
+    for (cidx =3D 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
+        if (!get_field(env->mcountinhibit, BIT(cidx))) {
+            counter =3D &env->pmu_ctrs[cidx];
+            counter->started =3D true;
+        }
+    }
+
     return RISCV_EXCP_NONE;
 }
=20
@@ -3533,10 +3602,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_VLENB]    =3D { "vlenb",    vs,    read_vlenb,
                                           .min_priv_ver =3D PRIV_VERSION=
_1_12_0 },
     /* User Timers and Counters */
-    [CSR_CYCLE]    =3D { "cycle",    ctr,    read_instret  },
-    [CSR_INSTRET]  =3D { "instret",  ctr,    read_instret  },
-    [CSR_CYCLEH]   =3D { "cycleh",   ctr32,  read_instreth },
-    [CSR_INSTRETH] =3D { "instreth", ctr32,  read_instreth },
+    [CSR_CYCLE]    =3D { "cycle",    ctr,    read_hpmcounter  },
+    [CSR_INSTRET]  =3D { "instret",  ctr,    read_hpmcounter  },
+    [CSR_CYCLEH]   =3D { "cycleh",   ctr32,  read_hpmcounterh },
+    [CSR_INSTRETH] =3D { "instreth", ctr32,  read_hpmcounterh },
=20
     /*
      * In privileged mode, the monitor will have to emulate TIME CSRs on=
ly if
@@ -3550,10 +3619,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
=20
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-    [CSR_MCYCLE]    =3D { "mcycle",    any,   read_instret  },
-    [CSR_MINSTRET]  =3D { "minstret",  any,   read_instret  },
-    [CSR_MCYCLEH]   =3D { "mcycleh",   any32, read_instreth },
-    [CSR_MINSTRETH] =3D { "minstreth", any32, read_instreth },
+    [CSR_MCYCLE]    =3D { "mcycle",    any,   read_hpmcounter, write_mhp=
mcounter},
+    [CSR_MINSTRET]  =3D { "minstret",  any,   read_hpmcounter, write_mhp=
mcounter},
+    [CSR_MCYCLEH]   =3D { "mcycleh",   any32, read_hpmcounterh, write_mh=
pmcounterh},
+    [CSR_MINSTRETH] =3D { "minstreth", any32, read_hpmcounterh, write_mh=
pmcounterh},
=20
     /* Machine Information Registers */
     [CSR_MVENDORID] =3D { "mvendorid", any,   read_mvendorid },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 99193c85bb..dc182ca811 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcfg =3D {
         VMSTATE_UINT64(env.menvcfg, RISCVCPU),
         VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
         VMSTATE_UINT64(env.henvcfg, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool pmu_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
=20
+    return cpu->cfg.pmu_num;
+}
+
+static const VMStateDescription vmstate_pmu_ctr_state =3D {
+    .name =3D "cpu/pmu",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D pmu_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(mhpmcounter_val, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState),
+        VMSTATE_BOOL(started, PMUCTRState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
-        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMC=
OUNTERS),
-        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPM=
COUNTERS),
+        VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS=
, 0,
+                             vmstate_pmu_ctr_state, PMUCTRState),
         VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVE=
NTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
new file mode 100644
index 0000000000..000fe8da45
--- /dev/null
+++ b/target/riscv/pmu.c
@@ -0,0 +1,32 @@
+/*
+ * RISC-V PMU file.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "pmu.h"
+
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
+                                        uint32_t target_ctr)
+{
+    return (target_ctr =3D=3D 0) ? true : false;
+}
+
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ct=
r)
+{
+    return (target_ctr =3D=3D 2) ? true : false;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 096249f3a3..2c1975e72c 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -30,7 +30,8 @@ riscv_softmmu_ss.add(files(
   'pmp.c',
   'debug.c',
   'monitor.c',
-  'machine.c'
+  'machine.c',
+  'pmu.c'
 ))
=20
 target_arch +=3D {'riscv': riscv_ss}
--=20
2.36.1


