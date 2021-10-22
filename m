Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9743785C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:49:35 +0200 (CEST)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduvO-0002h1-5m
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulj-0000SR-R8
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:35 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulg-00016n-JT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909971; x=1666445971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4gXm8UB4FAu5jTuLfbf6TuIDFO9o6od/N/ACPlI6XJI=;
 b=K+3M56LWtVp7bA6hIWuG0DZne4vd0RIfHq68fqwRRzuYOHvgo0aV+yI4
 XB8Mva4zik6Ct/NNYG4+zGh3teWBI60GvYgfcPUI1rxzp8HRUmgJ3nVvC
 4qF3bPckPcjt9o7jq9qcANsJzdCkvWeU+iHVmB2+9zRkh47at/SFfL9CL
 mHAB9NZQ990cZ2nxFtH6VYFXM/IdrmqzexZyjOC3odZUiDtdO0gMbokKa
 jsF/F3ATgoG0hkiMROKSCYP1NZN5P+O1u3be6UzlzkjWTHpFbvPSLU5RY
 D5zLCQbcsxuRh1z4XcXvmAklEAt1/Ln9KdN0RGchKD+eIc86p3xIrZDQW A==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="188392129"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:29 +0800
IronPort-SDR: TlEgXu+9+5PBCyz1cZ4Zp+nF9PAr/Cx9PVMsh+WOf9sG5zGiIxN5FgxRUG1Wt6QitKXYTH1ftw
 Fe9U6ILrGwEOK3I3YaImIRMibMtuLKpFYK0kMIwDeI8a9RfYQo5SxKDc4nPt9CcBmyxmjVKclv
 JRmCjCEjCPve7ZOvoD9M6VarJXZErgzGw9IqvtjHmB49LChYhVgNtgqNAWPydBNnvpLqZWYQxG
 H38H89whGvk7GzoFqMmHlgnF0hNXPLc80mXN5ZRamPkGlxMHdDUUodjMuYnjKmzzx/tDl7WpsB
 zoi21auuWsOhIetRuYQNPACa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:05 -0700
IronPort-SDR: CjhiaFVFZqY5IHDeFAbsUNSII4hK+/fKjKLOlawdeZywr6YQY15muB7PeChVs7/KLNiysVV7iO
 7OaIaKah153R7ogt1up6SbWp29Bc6d+zOvu//cXU4nhkqr38WiI58uzMEA545e9kNKo4/kxlsX
 1Rk1+fLNNyP8nUnPradjI+pNYMrrmec9uH1iM+pmNnDoS+3Z0rcxhtaJSw/d7b79EiuUlJGXjb
 M+SsiXcpmI7yy0bkNj+J5eji9P+xYNitIl01snJLlFwhw8IpbUSgwYWLtHJyJe2rR6jgAtwVYM
 /vk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSL203Mz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909969; x=1637501970; bh=4gXm8UB4FAu5jTuLfb
 f6TuIDFO9o6od/N/ACPlI6XJI=; b=dDlYTPszvPPKfe6HwHykguwW4d0CrhJtSr
 IZCMgwSy5FsWuW7HApLkgFUqSdN13aSV0mMHFn3wSZIoppb2MzWVTr3yf2SE9wGb
 bcd+o/3Po+RdCO2rXMxA4w1qwn8SFOOv/4TF3EBeac/oYyLl5ZpZ/umLb+YZ7UUM
 I1TzC/uLKxiRXhE2ZDhHEFp3p9gq+cH558Mxf0WLqSUgZszsy3EJ/3myBrzTFxov
 GbzgXwMYMChWV2NMZCv8QYSpKn5o0G9jADNWt8rfg/qqQv65BHX5e3+6TqqWwLiX
 wzMQT0fskCDvLbfhwS5hK2ob2GXvSs77LNGSsnrRDVI51jjcEk4w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wxzAp1hRMNmT for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSD2Y6jz1RtVl;
 Fri, 22 Oct 2021 06:39:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/33] target/riscv: Split misa.mxl and misa.ext
Date: Fri, 22 Oct 2021 23:37:49 +1000
Message-Id: <20211022133812.3972903-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The hw representation of misa.mxl is at the high bits of the
misa csr.  Representing this in the same way inside QEMU
results in overly complex code trying to check that field.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-4-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h          | 15 +++----
 linux-user/elfload.c        |  2 +-
 linux-user/riscv/cpu_loop.c |  2 +-
 target/riscv/cpu.c          | 78 +++++++++++++++++++++----------------
 target/riscv/csr.c          | 44 ++++++++++++++-------
 target/riscv/gdbstub.c      |  8 ++--
 target/riscv/machine.c      | 10 +++--
 target/riscv/translate.c    | 10 +++--
 8 files changed, 100 insertions(+), 69 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f543364d51..90d11e3c2a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#include "cpu_bits.h"
=20
 #define TCG_GUEST_DEFAULT_MO 0
=20
@@ -51,9 +52,6 @@
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
 #endif
=20
-#define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
-#define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
=20
 #define RVI RV('I')
@@ -133,8 +131,12 @@ struct CPURISCVState {
     target_ulong priv_ver;
     target_ulong bext_ver;
     target_ulong vext_ver;
-    target_ulong misa;
-    target_ulong misa_mask;
+
+    /* RISCVMXL, but uint32_t for vmstate migration */
+    uint32_t misa_mxl;      /* current mxl */
+    uint32_t misa_mxl_max;  /* max mxl for this cpu */
+    uint32_t misa_ext;      /* current extensions */
+    uint32_t misa_ext_mask; /* max ext for this cpu */
=20
     uint32_t features;
=20
@@ -313,7 +315,7 @@ struct RISCVCPU {
=20
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
 {
-    return (env->misa & ext) !=3D 0;
+    return (env->misa_ext & ext) !=3D 0;
 }
=20
 static inline bool riscv_feature(CPURISCVState *env, int feature)
@@ -322,7 +324,6 @@ static inline bool riscv_feature(CPURISCVState *env, =
int feature)
 }
=20
 #include "cpu_user.h"
-#include "cpu_bits.h"
=20
 extern const char * const riscv_int_regnames[];
 extern const char * const riscv_fpr_regnames[];
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index eb32f3e2cb..f9b8261692 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1448,7 +1448,7 @@ static uint32_t get_elf_hwcap(void)
     uint32_t mask =3D MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
                     | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
=20
-    return cpu->env.misa & mask;
+    return cpu->env.misa_ext & mask;
 #undef MISA_BIT
 }
=20
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9859a366e4..e5bb6d908a 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -133,7 +133,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct t=
arget_pt_regs *regs)
     env->gpr[xSP] =3D regs->sp;
     env->elf_flags =3D info->elf_flags;
=20
-    if ((env->misa & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
+    if ((env->misa_ext & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary"=
);
         exit(EXIT_FAILURE);
     }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 11bb59ac6d..f18bb4b21e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,16 +110,13 @@ const char *riscv_cpu_get_trap_name(target_ulong ca=
use, bool async)
=20
 bool riscv_cpu_is_32bit(CPURISCVState *env)
 {
-    if (env->misa & RV64) {
-        return false;
-    }
-
-    return true;
+    return env->misa_mxl =3D=3D MXL_RV32;
 }
=20
-static void set_misa(CPURISCVState *env, target_ulong misa)
+static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
-    env->misa_mask =3D env->misa =3D misa;
+    env->misa_mxl_max =3D env->misa_mxl =3D mxl;
+    env->misa_ext_mask =3D env->misa_ext =3D ext;
 }
=20
 static void set_priv_version(CPURISCVState *env, int priv_ver)
@@ -148,9 +145,9 @@ static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
 #if defined(TARGET_RISCV32)
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
@@ -160,20 +157,20 @@ static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, RV64);
+    set_misa(env, MXL_RV64, 0);
 }
=20
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
=20
 static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
@@ -182,20 +179,20 @@ static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, RV32);
+    set_misa(env, MXL_RV32, 0);
 }
=20
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
=20
 static void rv32_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
@@ -203,7 +200,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 static void rv32_ibex_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
     qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
@@ -212,7 +209,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVC | RVU);
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
@@ -360,6 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
=20
     mcc->parent_reset(dev);
 #ifndef CONFIG_USER_ONLY
+    env->misa_mxl =3D env->misa_mxl_max;
     env->priv =3D PRV_M;
     env->mstatus &=3D ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause =3D 0;
@@ -388,7 +386,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
     int priv_version =3D 0;
-    target_ulong target_misa =3D env->misa;
     Error *local_err =3D NULL;
=20
     cpu_exec_realizefn(cs, &local_err);
@@ -434,8 +431,23 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
=20
     set_resetvec(env, cpu->cfg.resetvec);
=20
-    /* If only XLEN is set for misa, then set misa from properties */
-    if (env->misa =3D=3D RV32 || env->misa =3D=3D RV64) {
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        break;
+#endif
+    case MXL_RV32:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    assert(env->misa_mxl_max =3D=3D env->misa_mxl);
+
+    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
+    if (env->misa_ext =3D=3D 0) {
+        uint32_t ext =3D 0;
+
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -462,38 +474,38 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
=20
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
-            target_misa |=3D RVI;
+            ext |=3D RVI;
         }
         if (cpu->cfg.ext_e) {
-            target_misa |=3D RVE;
+            ext |=3D RVE;
         }
         if (cpu->cfg.ext_m) {
-            target_misa |=3D RVM;
+            ext |=3D RVM;
         }
         if (cpu->cfg.ext_a) {
-            target_misa |=3D RVA;
+            ext |=3D RVA;
         }
         if (cpu->cfg.ext_f) {
-            target_misa |=3D RVF;
+            ext |=3D RVF;
         }
         if (cpu->cfg.ext_d) {
-            target_misa |=3D RVD;
+            ext |=3D RVD;
         }
         if (cpu->cfg.ext_c) {
-            target_misa |=3D RVC;
+            ext |=3D RVC;
         }
         if (cpu->cfg.ext_s) {
-            target_misa |=3D RVS;
+            ext |=3D RVS;
         }
         if (cpu->cfg.ext_u) {
-            target_misa |=3D RVU;
+            ext |=3D RVU;
         }
         if (cpu->cfg.ext_h) {
-            target_misa |=3D RVH;
+            ext |=3D RVH;
         }
         if (cpu->cfg.ext_v) {
             int vext_version =3D VEXT_VERSION_0_07_1;
-            target_misa |=3D RVV;
+            ext |=3D RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
                         "Vector extension VLEN must be power of 2");
@@ -532,7 +544,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             set_vext_version(env, vext_version);
         }
=20
-        set_misa(env, target_misa);
+        set_misa(env, env->misa_mxl, ext);
     }
=20
     riscv_cpu_register_gdb_regs_for_features(cs);
@@ -708,7 +720,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *isa_str =3D g_new(char, maxlen);
     char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_=
BITS);
     for (i =3D 0; i < sizeof(riscv_exts); i++) {
-        if (cpu->env.misa & RV(riscv_exts[i])) {
+        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
             *p++ =3D qemu_tolower(riscv_exts[i]);
         }
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd3216..d0c86a300d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,7 +39,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* loose check condition for fcsr in vector extension */
-    if ((csrno =3D=3D CSR_FCSR) && (env->misa & RVV)) {
+    if ((csrno =3D=3D CSR_FCSR) && (env->misa_ext & RVV)) {
         return RISCV_EXCP_NONE;
     }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
@@ -51,7 +51,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
=20
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (env->misa & RVV) {
+    if (env->misa_ext & RVV) {
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
@@ -557,7 +557,22 @@ static RISCVException write_mstatush(CPURISCVState *=
env, int csrno,
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    *val =3D env->misa;
+    target_ulong misa;
+
+    switch (env->misa_mxl) {
+    case MXL_RV32:
+        misa =3D (target_ulong)MXL_RV32 << 30;
+        break;
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        misa =3D (target_ulong)MXL_RV64 << 62;
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+
+    *val =3D misa | env->misa_ext;
     return RISCV_EXCP_NONE;
 }
=20
@@ -583,8 +598,13 @@ static RISCVException write_misa(CPURISCVState *env,=
 int csrno,
         return RISCV_EXCP_NONE;
     }
=20
+    /*
+     * misa.MXL writes are not supported by QEMU.
+     * Drop writes to those bits.
+     */
+
     /* Mask extensions that are not supported by this hart */
-    val &=3D env->misa_mask;
+    val &=3D env->misa_ext_mask;
=20
     /* Mask extensions that are not supported by QEMU */
     val &=3D (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
@@ -601,20 +621,14 @@ static RISCVException write_misa(CPURISCVState *env=
, int csrno,
         val &=3D ~RVC;
     }
=20
-    /* misa.MXL writes are not supported by QEMU */
-    if (riscv_cpu_is_32bit(env)) {
-        val =3D (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
-    } else {
-        val =3D (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    /* If nothing changed, do nothing. */
+    if (val =3D=3D env->misa_ext) {
+        return RISCV_EXCP_NONE;
     }
=20
     /* flush translation cache */
-    if (val !=3D env->misa) {
-        tb_flush(env_cpu(env));
-    }
-
-    env->misa =3D val;
-
+    tb_flush(env_cpu(env));
+    env->misa_ext =3D val;
     return RISCV_EXCP_NONE;
 }
=20
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fe..5257df0217 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -54,10 +54,10 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_=
t *mem_buf, int n)
 static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < 32) {
-        if (env->misa & RVD) {
+        if (env->misa_ext & RVD) {
             return gdb_get_reg64(buf, env->fpr[n]);
         }
-        if (env->misa & RVF) {
+        if (env->misa_ext & RVF) {
             return gdb_get_reg32(buf, env->fpr[n]);
         }
     /* there is hole between ft11 and fflags in fpu.xml */
@@ -191,10 +191,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
 {
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
-    if (env->misa & RVD) {
+    if (env->misa_ext & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
                                  36, "riscv-64bit-fpu.xml", 0);
-    } else if (env->misa & RVF) {
+    } else if (env->misa_ext & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 16a08302da..f64b2a96c1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper =3D {
=20
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
-    .version_id =3D 2,
-    .minimum_version_id =3D 2,
+    .version_id =3D 3,
+    .minimum_version_id =3D 3,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -153,8 +153,10 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.guest_phys_fault_addr, RISCVCPU),
         VMSTATE_UINTTL(env.priv_ver, RISCVCPU),
         VMSTATE_UINTTL(env.vext_ver, RISCVCPU),
-        VMSTATE_UINTTL(env.misa, RISCVCPU),
-        VMSTATE_UINTTL(env.misa_mask, RISCVCPU),
+        VMSTATE_UINT32(env.misa_mxl, RISCVCPU),
+        VMSTATE_UINT32(env.misa_ext, RISCVCPU),
+        VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
+        VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
         VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 62214e97fa..0aa2122529 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -55,7 +55,8 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    target_ulong misa;
+    RISCVMXL xl;
+    uint32_t misa_ext;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mstatus_hs_fs;
@@ -86,7 +87,7 @@ typedef struct DisasContext {
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 {
-    return ctx->misa & ext;
+    return ctx->misa_ext & ext;
 }
=20
 #ifdef TARGET_RISCV32
@@ -96,7 +97,7 @@ static inline bool has_ext(DisasContext *ctx, uint32_t =
ext)
 #else
 static inline bool is_32bit(DisasContext *ctx)
 {
-    return (ctx->misa & RV32) =3D=3D RV32;
+    return ctx->xl =3D=3D MXL_RV32;
 }
 #endif
=20
@@ -513,7 +514,8 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled =3D false;
 #endif
-    ctx->misa =3D env->misa;
+    ctx->xl =3D env->misa_mxl;
+    ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->vlen =3D cpu->cfg.vlen;
--=20
2.31.1


