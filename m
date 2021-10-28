Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87D43DAA0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:03:50 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxZt-0006jf-6v
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHg-0000Zl-KI
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHe-00059i-DO
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396298; x=1666932298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PnQisqF8wvDYvC7TlCLmo7Hr/56zj8ecORTw7H4Lz7w=;
 b=PZU4hQIX34nSSXbyTlzqb/eyvyJlbSvzyYw06iKhJHh2bxQuGy9iV0Nd
 wJMVBOnnAPAs5PQifTTu2MOzLWw72nBhCzsqXQ0caYBxMYqpAsFsgvO71
 f+YkzmSHSkqUmXIQW94BlCEkeRt4Bo6ybQV9dZ0hrc9nTRUPhfA4a9uDA
 fkkMN91pnfwCUXydakxBIn/AzhulhPPJkIBMFghkwAu4MTqm/E4zCfiJD
 00K4pkXuE3BoORKwOBa+7GLU1Cmi/oiVdh06AgjVNRxIUVKLqHu13Q2Uv
 PtmxxvqRL5RqGYK2Mr1F9xIwKgFqwgreahOEWXGgyfSZmrqiNuM2p7g7x A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="287922979"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:57 +0800
IronPort-SDR: WQH1SIpeq9HEbgf8Az31M3Y9FyFDOIftemcAlqo0lyO1SI5ws1DY6+8nlqelVyY9ULF9YP/oxg
 wIvMqgR9APlgbxACkETcJXAcpmy2lA7sdSX3PeKYF3QFsU3AcjTTHc2HjejN8H5iClyB37kSLm
 SdslHT4B2cxVs45OPxjUlDsTf5KTO0MuYvxVeLc+TCLSwO6JCZB4QbbpnFFy7kxbTtplauH2Yl
 HqBRxnFlRp8zd0YK2DdDlseeEztZTpnlLRTdvlfajExM3l0KH2Y4pEn2TtQX6y8nSGqkcrjKYQ
 kqEYx+Nsp50KZq/V16u/V/BK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:52 -0700
IronPort-SDR: mRxkgGFBAvbNcnuVdLv7cCyQ/wMJgCbbD1KP1ox0iJI40FE0Gt00uLnFWBPHac40BhzocHQBdc
 F/i6D5IHr7JlcDWARABiEcKAM1FhC30Z2CkbClRqa2G0f2arbFvjC2Hssoy02qr86PmnZW/nL0
 rdgcscDMDiLEfeoSyX2JhCRD/NgUATCKB8jJ2K11knoFhNIoZghw7UnH/yLqNlVJ56yRBeQXlG
 PLw36/BuhKPbcfECQMAVOeuboMgF9Vv3HRHykNzpXrjrieN+CESnxrV6IGrirGwCT++JZ7+XxT
 0uw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJn3QYgz1RtVm
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396296; x=1637988297; bh=PnQisqF8wvDYvC7TlC
 Lmo7Hr/56zj8ecORTw7H4Lz7w=; b=ZASFsHr9GG1YjLcwGdhmgRAXbT0bOAtJ9r
 9a+9oz3gQkDa8VTI0SLyGduJ8lvT+OVbWtNJCZIuUDa/yKZxpAnZG656qqWsdHPi
 cA5U1JpMSVDeRPPIh0hvlPmaPShO/ITfwMfe088LCQ2Kbo6M/8jtBhRcvcA4LRN5
 91PkzbUjmcnkDTOd6b41W7+QZa+AHj3DC8aUvgRmGO7Vh8yr2b4AS81OcXkS9gjR
 pNNi/SEtZ678QCwiyi3IVptkOluGPxgBedtz7dC92Ac+qAXjt2+srVgbjXHsLdbF
 3HWRyDQ8mWByEDSQrhTY6UM0MESFZv0cy13hQLQJlc7jJuUR9JJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HvsBdfOc02tO for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:56 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJj13X1z1RtVl;
 Wed, 27 Oct 2021 21:44:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anatoly Parshintsev <kupokupokupopo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/18] target/riscv: Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Thu, 28 Oct 2021 14:43:37 +1000
Message-Id: <20211028044342.3070385-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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


