Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B2A50ACFD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:54:48 +0200 (CEST)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhZP-0008Cn-CD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJu-0008C9-P4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:46 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJr-0005V8-5l
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587922; x=1682123922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8duNus/Pa7ed2eblyFQDL4HKAgqr5/zno4/LdFcN+M=;
 b=owXXvMF1d0MoGFhzagUY6o2v5zD3+fwQHFSAeIPSfxgVzdGs7ostdFsH
 LdnQyJPGa7DGdfn81jTyIR2eEaluPBQx0G68wxjToMBrpsRs7NjKZuTZU
 N1jPrrD94hkXTZ4PFiIgpdGXPpiqdgdckL19mn+Q7urHEUzvzfx4mcEiY
 cP1nfmD/xPJtfG5v5vT+00DFJgEGZxFOkSlhls0qfn12uIXrRGiDoC+xL
 /N7vuAEgkMFkmq7/08ygq50v2KITI9MwHEKE5cYL+bQTkXd8/yu5WjTLz
 6MqlLdDGX6Cl7qSxMKKOTJ5bqj5ahB6HAKfJ3IgZfLHh2Kk0lh3WrSkXa A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483437"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:27 +0800
IronPort-SDR: lkxQ2MH/wo3o0wyf1Wq3u4Ypx6IpA1q9sfee3hYHmiVffIec9P9+3380HeSyaBH/LjG4W57g61
 j4JqEcuKidNBzraHA+oIjKCqjE30QP4PciCswdth4R3Mi3J6NSAPlTE9Fi9C6tcWrpL1jhE3F/
 YAu6gm+O3SLbyaJViFece7mEmnlQQinvKWlRqKIzymvApBdvIC9fRBNaGDL5E9W2agCb2O22f0
 7gwAeTujZsB39+iVegCdk++6rbPT0Zw/0Glm+cwbCf8YeHsb7ToaMhPucniO0TvlfZoVKonr2F
 1qGhpGmBcCBLvQTKLOEEg2Ra
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:44 -0700
IronPort-SDR: H8cKkDhW79keV8ues/Dy3xk60i2fADUWt+FgR3yskYsnhvoLQQyazWHffDTQhYEZjTpPf/WHFP
 8XzhvCshTqD4oZWzLccQUu7YjQdqxzemJh0YM8QbimdrWr+TlfRcWEUDndNhi1BvoCLyjaWtBi
 i0QkSqtEHZpHMcQkQZ15UkUBG8pQ6WAAXcFaQghuPk6HP6+NGHNhf+68SCL/A72s2A2dYKJxFk
 vaBy+hYX4s3TBA9y6Kb0TgncpJeDvEZ5l7bp68ttWYaAZR40qNx5u8xAyeEKpQm8rgoxLl2yv/
 zUc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwW71dnHz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587906; x=1653179907; bh=N8duNus/Pa7ed2ebly
 FQDL4HKAgqr5/zno4/LdFcN+M=; b=Dq6p1sOBhu8b80a5vBCqPZVocqKmJnJ700
 PZDGiBPPqxwvHlOQLof8H6ktr84fNLvkwV6Yrhgvy4dF8HROE+Lr/8fEARiyaxb1
 4DhfXgy1elE3l9ss9mXOikguVWqfnemHbo49dF4HFY4rvuJzONHZwc/X+xIsO2kl
 sUeCSvJd3YK9oiLyX7SXVWiJpmXXeJMMoK3hxFBUeUhOCg3110V34gg4ar4h0Chq
 PZLdQNrd8aiM1ARQtAThA4/26kJZD0Hd6dIOQjMbo+wSSEUA8UfA1hCClnXq+BjM
 b0DL9AVNTC1/haGNbUCu38/GUG9XmasbDKmTVE6zHFiG5zyAX1mA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p7z-Xgeo7JXI for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwW36D0Lz1SVp0;
 Thu, 21 Apr 2022 17:38:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 23/31] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
Date: Fri, 22 Apr 2022 10:36:48 +1000
Message-Id: <20220422003656.1648121-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that mtime is exposed as a memory-mapped
machine-mode read-write register. However, as QEMU uses host monotonic
timer as timer source, this makes mtime to be read-only in RISC-V
ACLINT.

This patch makes mtime to be writable by recording the time delta value
between the mtime value to be written and the timer value at the time
mtime is written. Time delta value is then added back whenever the timer
value is retrieved.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220420080901.14655-4-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/riscv_aclint.h |  1 +
 target/riscv/cpu.h             |  8 ++--
 hw/intc/riscv_aclint.c         | 71 ++++++++++++++++++++++++----------
 target/riscv/cpu_helper.c      |  4 +-
 4 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclin=
t.h
index 229bd08d25..26d4048687 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -31,6 +31,7 @@
 typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
+    uint64_t time_delta;
=20
     /*< public >*/
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ff3eee4087..5d1259d4ae 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -285,8 +285,8 @@ struct CPUArchState {
     type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
=20
     /* machine specific rdtime callback */
-    uint64_t (*rdtime_fn)(uint32_t);
-    uint32_t rdtime_fn_arg;
+    uint64_t (*rdtime_fn)(void *);
+    void *rdtime_fn_arg;
=20
     /* machine specific AIA ireg read-modify-write callback */
 #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
@@ -496,8 +496,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *en=
v);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
 uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t val=
ue);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
-                             uint32_t arg);
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                    int (*rmw_fn)(void *arg,
                                                  target_ulong reg,
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index ff082090fe..3b3ab548f6 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
=20
-static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
         timebase_freq, NANOSECONDS_PER_SECOND);
 }
=20
+static uint64_t cpu_riscv_read_rtc(void *opaque)
+{
+    RISCVAclintMTimerState *mtimer =3D opaque;
+    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) + mtimer->time_=
delta;
+}
+
 /*
  * Called when timecmp is written to update the QEMU timer or immediatel=
y
  * trigger timer interrupt if mtimecmp <=3D current timer value.
@@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_=
freq)
 static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mt=
imer,
                                               RISCVCPU *cpu,
                                               int hartid,
-                                              uint64_t value,
-                                              uint32_t timebase_freq)
+                                              uint64_t value)
 {
+    uint32_t timebase_freq =3D mtimer->timebase_freq;
     uint64_t next;
     uint64_t diff;
=20
-    uint64_t rtc_r =3D cpu_riscv_read_rtc(timebase_freq);
+    uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);
=20
     cpu->env.timecmp =3D value;
     if (cpu->env.timecmp <=3D rtc_r) {
@@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaq=
ue, hwaddr addr,
         }
     } else if (addr =3D=3D mtimer->time_base) {
         /* time_lo for RV32/RV64 or timecmp for RV64 */
-        uint64_t rtc =3D cpu_riscv_read_rtc(mtimer->timebase_freq);
+        uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
         return (size =3D=3D 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr =3D=3D mtimer->time_base + 4) {
         /* time_hi */
-        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFF=
FFFFF;
+        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
     }
=20
     qemu_log_mask(LOG_UNIMP,
@@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,
     uint64_t value, unsigned size)
 {
     RISCVAclintMTimerState *mtimer =3D opaque;
+    int i;
=20
     if (addr >=3D mtimer->timecmp_base &&
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
@@ -172,20 +179,18 @@ static void riscv_aclint_mtimer_write(void *opaque,=
 hwaddr addr,
                 /* timecmp_lo for RV32/RV64 */
                 uint64_t timecmp_hi =3D env->timecmp >> 32;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
-                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                    mtimer->timebase_freq);
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF));
             } else {
                 /* timecmp for RV64 */
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
-                                                  value, mtimer->timebas=
e_freq);
+                                                  value);
             }
         } else if ((addr & 0x7) =3D=3D 4) {
             if (size =3D=3D 4) {
                 /* timecmp_hi for RV32/RV64 */
                 uint64_t timecmp_lo =3D env->timecmp;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
-                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                    mtimer->timebase_freq);
+                    value << 32 | (timecmp_lo & 0xFFFFFFFF));
             } else {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "aclint-mtimer: invalid timecmp_hi write: =
%08x",
@@ -197,15 +202,39 @@ static void riscv_aclint_mtimer_write(void *opaque,=
 hwaddr addr,
                           (uint32_t)addr);
         }
         return;
-    } else if (addr =3D=3D mtimer->time_base) {
-        /* time_lo */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_lo write not implemented");
-        return;
-    } else if (addr =3D=3D mtimer->time_base + 4) {
-        /* time_hi */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_hi write not implemented");
+    } else if (addr =3D=3D mtimer->time_base || addr =3D=3D mtimer->time=
_base + 4) {
+        uint64_t rtc_r =3D cpu_riscv_read_rtc_raw(mtimer->timebase_freq)=
;
+
+        if (addr =3D=3D mtimer->time_base) {
+            if (size =3D=3D 4) {
+                /* time_lo for RV32/RV64 */
+                mtimer->time_delta =3D ((rtc_r & ~0xFFFFFFFFULL) | value=
) - rtc_r;
+            } else {
+                /* time for RV64 */
+                mtimer->time_delta =3D value - rtc_r;
+            }
+        } else {
+            if (size =3D=3D 4) {
+                /* time_hi for RV32/RV64 */
+                mtimer->time_delta =3D (value << 32 | (rtc_r & 0xFFFFFFF=
F)) - rtc_r;
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "aclint-mtimer: invalid time_hi write: %08=
x",
+                              (uint32_t)addr);
+                return;
+            }
+        }
+
+        /* Check if timer interrupt is triggered for each hart. */
+        for (i =3D 0; i < mtimer->num_harts; i++) {
+            CPUState *cpu =3D qemu_get_cpu(mtimer->hartid_base + i);
+            CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+            if (!env) {
+                continue;
+            }
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
+                                              i, env->timecmp);
+        }
         return;
     }
=20
@@ -315,7 +344,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, =
hwaddr size,
             continue;
         }
         if (provide_rdtime) {
-            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_fr=
eq);
+            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
=20
         cb->s =3D RISCV_ACLINT_MTIMER(dev);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 126251d5da..e1aa4f2097 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -632,8 +632,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t=
 mask, uint64_t value)
     return old;
 }
=20
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
-                             uint32_t arg)
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg)
 {
     env->rdtime_fn =3D fn;
     env->rdtime_fn_arg =3D arg;
--=20
2.35.1


