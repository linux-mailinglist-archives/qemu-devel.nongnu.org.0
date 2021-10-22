Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835E43784C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdut3-00055I-4B
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdult-0000bu-FF
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:47 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulq-0001BK-L4
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909982; x=1666445982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZmBoEQcaBqP9upU6L/cyleplbpuztrg5gek4KZJqoak=;
 b=rLgoPZFyk5uVf1U0ydl5LqNPKm9TPOJQX22YR6/kd406Ft22SRQGzJxf
 nXLP7x34odD+i4H2LGvSVbJbxw+kUvAVCXBq5/+F4seK8p6j9eo2W80xa
 rkAOBd/7gxVWToWRkBf4GBMkOO+cx7Q8Hhk3PAU4LgN3a5dzSfi0fzydw
 3qElJ0bicpGdLyR53KdPz3YvUTiV0r8UiB7LQp32b1g/TL5MUQzne01Vf
 53Sh5dAzbMhE/vyj1O4QQ6dFOob/QsTpZh+uWRytBord6WCQH7D8lAaq7
 9K25YEhO6eQrMLnhMGdi6bhuFVeLGyOYc9d9+bUPb1Rn8/Vx+9WLq6/D4 Q==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="295350957"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:35 +0800
IronPort-SDR: HldqZRD8werzSJPpTrkKpAn0jLs1o7BKVDN0HoO4O1BuCWU62E+u3tIVP/0dRBcPqHt+OmmBFq
 4fovJC6O1TMfINr7h6gl0kWNkY94xHp23B5RGbjNBGUEJXX1yTHGwYCa1gV8vR5PqtlDLWgOJF
 A8PuR3dLj37wnEJzM2dx7UUL25aK0m0L4wUMHF1rUJ6N+jz3LyNlcAny5Jx+udsXQ+p9hcJS49
 Fd0CNbeHBnoBx7GZkLzNS9RxlZJ+Cd6zeNZxUtdVZk1kUSFX597YWF0WgfAcyrZXt+vDVCDwbU
 HZsyE9CM/EpiutJDBhjARgkd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:10 -0700
IronPort-SDR: R0ISrLHYDO46ifk0P9d36EztzjRgKRuVPziQrOAVZgjHcN7yBwK56W14DHxOR4ys4XmAYAyeen
 a93vIu3oJL4vgTcJkHk+JyaqeRSpL51nKleLnRa/AZLJozyLfARd82jzFggnIr+/j6zdMpqsmi
 I2qXSN10fAj+uzWtLEBQxTvlEQt+MxW3lsWHRg8E+Ymx8jHS4+h1407jvHfGvYrujOsLINrMb3
 YeeplGdlXU6beyxvilTR3xIP31MSGSi54ISTujqypgShWHhzXhiBzIJWn/n8uEutT1ssi3gxTg
 fZ0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSR3GP7z1RtVp
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909974; x=1637501975; bh=ZmBoEQcaBqP9upU6L/
 cyleplbpuztrg5gek4KZJqoak=; b=eH7ySAKWxHT+qux+0k1uM+gfUrLNPvy5V8
 cuuKNVQV4NraHXr+LgrQfW/ozPmbbV79lh6iTMNVvHfYUEjrhgF2PduY0eEaYiqT
 jLFbhaeAxdzzoIipelLvF7N4LLgg+3S4xh0+0lea/0uSUuIAl27m73aBbWw8qR+j
 Bt1j44SGvH2Wb11/wS1yNqwKF9sCFd4zMtECoRfUIYYtlfakuk7ZpdmtVQrDy96r
 P7MQUmRY2Qkax51GHCDd7+TKhKIUFwbWSeTPxBOEX8hN7K1yiy7OCF3TmGy/LNDD
 QvxpBpgTJjkG64bxqgGiFKrPanklSDgvFCFrqyTrsoh1aKtkwL8Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NEltexWhWTXF for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:34 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSL2wBGz1RtVl;
 Fri, 22 Oct 2021 06:39:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/33] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
Date: Fri, 22 Oct 2021 23:37:50 +1000
Message-Id: <20211022133812.3972903-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Shortly, the set of supported XL will not be just 32 and 64,
and representing that properly using the enumeration will be
imperative.

Two places, booting and gdb, intentionally use misa_mxl_max
to emphasize the use of the reset value of misa.mxl, and not
the current cpu state.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-5-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h            |  9 ++++++++-
 hw/riscv/boot.c               |  2 +-
 semihosting/arm-compat-semi.c |  2 +-
 target/riscv/cpu.c            | 24 ++++++++++++++----------
 target/riscv/cpu_helper.c     | 12 ++++++------
 target/riscv/csr.c            | 24 ++++++++++++------------
 target/riscv/gdbstub.c        |  2 +-
 target/riscv/monitor.c        |  4 ++--
 8 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 90d11e3c2a..e23157b05c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -396,7 +396,14 @@ FIELD(TB_FLAGS, VILL, 9, 1)
 FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
=20
-bool riscv_cpu_is_32bit(CPURISCVState *env);
+#ifdef TARGET_RISCV32
+#define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
+{
+    return env->misa_mxl;
+}
+#endif
=20
 /*
  * A simplification for VLMAX
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 993bf89064..d1ffc7b56c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -35,7 +35,7 @@
=20
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return riscv_cpu_is_32bit(&harts->harts[0].env);
+    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
 }
=20
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
index 01badea99c..37963becae 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -775,7 +775,7 @@ static inline bool is_64bit_semihosting(CPUArchState =
*env)
 #if defined(TARGET_ARM)
     return is_a64(env);
 #elif defined(TARGET_RISCV)
-    return !riscv_cpu_is_32bit(env);
+    return riscv_cpu_mxl(env) !=3D MXL_RV32;
 #else
 #error un-handled architecture
 #endif
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f18bb4b21e..3d144af1ab 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,11 +108,6 @@ const char *riscv_cpu_get_trap_name(target_ulong cau=
se, bool async)
     }
 }
=20
-bool riscv_cpu_is_32bit(CPURISCVState *env)
-{
-    return env->misa_mxl =3D=3D MXL_RV32;
-}
-
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
     env->misa_mxl_max =3D env->misa_mxl =3D mxl;
@@ -249,7 +244,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid)=
;
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong=
)env->mstatus);
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
                      (target_ulong)(env->mstatus >> 32));
     }
@@ -372,10 +367,16 @@ static void riscv_cpu_reset(DeviceState *dev)
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info=
)
 {
     RISCVCPU *cpu =3D RISCV_CPU(s);
-    if (riscv_cpu_is_32bit(&cpu->env)) {
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
         info->print_insn =3D print_insn_riscv32;
-    } else {
+        break;
+    case MXL_RV64:
         info->print_insn =3D print_insn_riscv64;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
=20
@@ -634,10 +635,13 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
=20
-    if (riscv_cpu_is_32bit(env)) {
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
         return g_strdup("riscv:rv32");
-    } else {
+    case MXL_RV64:
         return g_strdup("riscv:rv64");
+    default:
+        g_assert_not_reached();
     }
 }
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 14d1d3cb72..403f54171d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -152,7 +152,7 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
=20
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t sd =3D riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_S=
D;
+    uint64_t sd =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? MSTATUS32_SD : =
MSTATUS64_SD;
     uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
                             MSTATUS64_UXL | sd;
@@ -447,7 +447,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
=20
     if (first_stage =3D=3D true) {
         if (use_background) {
-            if (riscv_cpu_is_32bit(env)) {
+            if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
                 base =3D (hwaddr)get_field(env->vsatp, SATP32_PPN) << PG=
SHIFT;
                 vm =3D get_field(env->vsatp, SATP32_MODE);
             } else {
@@ -455,7 +455,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
                 vm =3D get_field(env->vsatp, SATP64_MODE);
             }
         } else {
-            if (riscv_cpu_is_32bit(env)) {
+            if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
                 base =3D (hwaddr)get_field(env->satp, SATP32_PPN) << PGS=
HIFT;
                 vm =3D get_field(env->satp, SATP32_MODE);
             } else {
@@ -465,7 +465,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
         }
         widened =3D 0;
     } else {
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
             base =3D (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIF=
T;
             vm =3D get_field(env->hgatp, SATP32_MODE);
         } else {
@@ -558,7 +558,7 @@ restart:
         }
=20
         target_ulong pte;
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
             pte =3D address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
             pte =3D address_space_ldq(cs->as, pte_addr, attrs, &res);
@@ -678,7 +678,7 @@ static void raise_mmu_exception(CPURISCVState *env, t=
arget_ulong address,
     int page_fault_exceptions, vm;
     uint64_t stap_mode;
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         stap_mode =3D SATP32_MODE;
     } else {
         stap_mode =3D SATP64_MODE;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d0c86a300d..9c0753bc8b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -95,7 +95,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
             }
             break;
         }
-        if (riscv_cpu_is_32bit(env)) {
+        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -130,7 +130,7 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
=20
 static RISCVException ctr32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
@@ -145,7 +145,7 @@ static RISCVException any(CPURISCVState *env, int csr=
no)
=20
 static RISCVException any32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
@@ -180,7 +180,7 @@ static RISCVException hmode(CPURISCVState *env, int c=
srno)
=20
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         if (riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
@@ -486,7 +486,7 @@ static RISCVException read_mstatus(CPURISCVState *env=
, int csrno,
=20
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
     } else {
         return valid_vm_1_10_64[vm & 0xf];
@@ -510,7 +510,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW;
=20
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
@@ -522,7 +522,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
=20
     dirty =3D ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         mstatus =3D set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus =3D set_field(mstatus, MSTATUS64_SD, dirty);
@@ -795,7 +795,7 @@ static RISCVException read_sstatus(CPURISCVState *env=
, int csrno,
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         mask |=3D SSTATUS32_SD;
     } else {
         mask |=3D SSTATUS64_SD;
@@ -1006,7 +1006,7 @@ static RISCVException write_satp(CPURISCVState *env=
, int csrno,
         return RISCV_EXCP_NONE;
     }
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         vm =3D validate_vm(env, get_field(val, SATP32_MODE));
         mask =3D (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32=
_PPN);
         asid =3D (val ^ env->satp) & SATP32_ASID;
@@ -1034,7 +1034,7 @@ static RISCVException read_hstatus(CPURISCVState *e=
nv, int csrno,
                                    target_ulong *val)
 {
     *val =3D env->hstatus;
-    if (!riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         /* We only support 64-bit VSXL */
         *val =3D set_field(*val, HSTATUS_VSXL, 2);
     }
@@ -1047,7 +1047,7 @@ static RISCVException write_hstatus(CPURISCVState *=
env, int csrno,
                                     target_ulong val)
 {
     env->hstatus =3D val;
-    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) !=3D 2)=
 {
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32 && get_field(val, HSTATUS_VSXL)=
 !=3D 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN opt=
ions.");
     }
     if (get_field(val, HSTATUS_VSBE) !=3D 0) {
@@ -1215,7 +1215,7 @@ static RISCVException write_htimedelta(CPURISCVStat=
e *env, int csrno,
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         env->htimedelta =3D deposit64(env->htimedelta, 0, 32, (uint64_t)=
val);
     } else {
         env->htimedelta =3D val;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5257df0217..23429179e2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -161,7 +161,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, in=
t base_reg)
     CPURISCVState *env =3D &cpu->env;
     GString *s =3D g_string_new(NULL);
     riscv_csr_predicate_fn predicate;
-    int bitsize =3D riscv_cpu_is_32bit(env) ? 32 : 64;
+    int bitsize =3D 16 << env->misa_mxl_max;
     int i;
=20
     g_string_printf(s, "<?xml version=3D\"1.0\"?>");
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index f7e6ea72b3..7efb4b62c1 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -150,7 +150,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState =
*env)
     target_ulong last_size;
     int last_attr;
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         base =3D (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
         vm =3D get_field(env->satp, SATP32_MODE);
     } else {
@@ -220,7 +220,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
=20
-    if (riscv_cpu_is_32bit(env)) {
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         if (!(env->satp & SATP32_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
--=20
2.31.1


