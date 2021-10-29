Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95A43F7CA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:23:07 +0200 (CEST)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMEE-00055o-Kt
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7D-0006lQ-CX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:52 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:29575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7A-0001jw-RF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491748; x=1667027748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PnQisqF8wvDYvC7TlCLmo7Hr/56zj8ecORTw7H4Lz7w=;
 b=i2pmkmyFNdX1UPaDKOA/IHuKsl0dGo47SbdoMK8R9zCr0yqV64HEJnKK
 dQZDt+EWHl9hb0f3ELSpBYp8flneTISAkyhUz8PiaP2/Z7x6PhTzWdX0z
 73WT4bzqmB/t+DuRGAWkGcp2M21EK6l+VJSuExdDUur+ChYoWN39SFjNB
 JKGbButK45UD8QXthC12wHIsRaM3N8Y3n/C+2RO0Pcas6hZjkuWyPUnu8
 OlnwUYOsaFVMG6w8L77j2VBDolzMBhgC+yeHQoZ/mgZ0suBGFhC/9VA0c
 MYUOdR4vfIl4wWfDpCawmjpU0NxNKlE7pTEX56ICjQ6ACZe2somzj913t A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="288048071"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:15:45 +0800
IronPort-SDR: i20pklkvniUvwiihbxyOfGSXEawcRMWUoGle1phScF0Gv/U8BtI1KjExYNFq/RsuktCRPADqvI
 QMkIqhjh9pUnMzye05i0y4mUlZ1htGuVla9yTPafvPyq8aFV81DeEjkVv7llMtXJkNL8dGNkym
 fNUwuvRBcDRYuMwBY+RTjfcL9oe4NjilN5ZJ6nWL+OH3o6Lnapj3E3CyeGas1OcLOe3DNXiB2F
 At33t9qzfFTJ5roru27b5HtMDx3FVo0XjCX6DjqTtg+QxrEDzIvXn2xdQbPKGGaayfA6HfAgFX
 NhD8U/xpfOxDcf8LDdEjrz0g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:51:12 -0700
IronPort-SDR: cIZrWL/+IYNmazYwaZaTgn/tISdNXy3EF0AkRCTWk0M3oFY9yIAab8VL7rEOJYDgqy1d7/awFS
 NL+pLcB+DWmwLDYt8cTE4rFKXqXTR+KDZKQ4JJEY3styAzBpxdnBAZVa3LfGjqq3VTUq27zusA
 qx/UNX7ZaUUuN182yWW0x8ZOgKsHzHzdMfvcgTTXpoDWoHu2UNxGCayYEcpk0z7XOMCceXGZo6
 yT7mU6o5G1xw2n99B1VSenDzeUuoF8Fz0E99k8Ti5pK5mQKdH2n+Ht4tvtko2q642NAnrXsMtr
 Q5I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYcJ6tTcz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:15:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491744; x=1638083745; bh=PnQisqF8wvDYvC7TlC
 Lmo7Hr/56zj8ecORTw7H4Lz7w=; b=bPc7GsYZUC4KlAJOCEbA6sC3C4sS8myKNU
 MMYEurcVRzVB6NVcEt2V7wn0HRzcCiubnj/qNQVh3oIh2BP3mFDUnz2+oyHcp8O4
 SbZHzMIDN/10npYnznnjVKR9R3b8OPblCkOso2tQ63NqFrbf2OCQbifFpuaYhJT1
 HinEF7+IPSlSKLvLMmmEelaYWWgm9AF8PKx+BmoXdNY1Beu97CmVIhtcrwMZy7f/
 u7nQEKDiQ89zqEA0Fus6ZyOVmOdWRkjDOXsDZI8TUiuGR9FRULtuPfd9OrOI9aXy
 2bjVxBaKSQjoTsuAu63tcbDufx2xd7K0i1jcV1GWMMa4dJ3EZg4g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sixNkdq7RDzn for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:15:44 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYcB3pKYz1RtVl;
 Fri, 29 Oct 2021 00:15:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anatoly Parshintsev <kupokupokupopo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 13/18] target/riscv: Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Fri, 29 Oct 2021 17:08:12 +1000
Message-Id: <20211029070817.100529-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-8-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 target/riscv/translate.c  | 39 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b2422e3f99..325908287d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -410,6 +410,8 @@ FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
 FIELD(TB_FLAGS, XL, 13, 2)
+/* If PointerMasking should be applied */
+FIELD(TB_FLAGS, PM_ENABLED, 15, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0d1132f39d..662228c238 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -107,6 +107,24 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
                            get_field(env->mstatus_hs, MSTATUS_FS));
     }
+    if (riscv_has_ext(env, RVJ)) {
+        int priv =3D flags & TB_FLAGS_PRIV_MMU_MASK;
+        bool pm_enabled =3D false;
+        switch (priv) {
+        case PRV_U:
+            pm_enabled =3D env->mmte & U_PM_ENABLE;
+            break;
+        case PRV_S:
+            pm_enabled =3D env->mmte & S_PM_ENABLE;
+            break;
+        case PRV_M:
+            pm_enabled =3D env->mmte & M_PM_ENABLE;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
+    }
 #endif
=20
     flags =3D FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a5e6fa145d..1d57bc97b5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -36,6 +36,9 @@ static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
+/* globals for PM CSRs */
+static TCGv pm_mask[4];
+static TCGv pm_base[4];
=20
 #include "exec/gen-icount.h"
=20
@@ -83,6 +86,10 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* PointerMasking extension */
+    bool pm_enabled;
+    TCGv pm_mask;
+    TCGv pm_base;
 } DisasContext;
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -272,11 +279,20 @@ static void gen_jal(DisasContext *ctx, int rd, targ=
et_ulong imm)
 }
=20
 /*
- * Temp stub: generates address adjustment for PointerMasking
+ * Generates address adjustment for PointerMasking
  */
 static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
 {
-    return src;
+    TCGv temp;
+    if (!s->pm_enabled) {
+        /* Load unmodified address */
+        return src;
+    } else {
+        temp =3D temp_new(s);
+        tcg_gen_andc_tl(temp, src, s->pm_mask);
+        tcg_gen_or_tl(temp, temp, s->pm_base);
+        return temp;
+    }
 }
=20
 #ifndef CONFIG_USER_ONLY
@@ -622,6 +638,10 @@ static void riscv_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
     ctx->cs =3D cs;
     ctx->ntemp =3D 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv =3D tb_flags & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask =3D pm_mask[priv];
+    ctx->pm_base =3D pm_base[priv];
=20
     ctx->zero =3D tcg_constant_tl(0);
 }
@@ -735,4 +755,19 @@ void riscv_translate_init(void)
                              "load_res");
     load_val =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, loa=
d_val),
                              "load_val");
+#ifndef CONFIG_USER_ONLY
+    /* Assign PM CSRs to tcg globals */
+    pm_mask[PRV_U] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upm=
mask");
+    pm_base[PRV_U] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upm=
base");
+    pm_mask[PRV_S] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spm=
mask");
+    pm_base[PRV_S] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spm=
base");
+    pm_mask[PRV_M] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpm=
mask");
+    pm_base[PRV_M] =3D
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpm=
base");
+#endif
 }
--=20
2.31.1


