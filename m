Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37914CB678
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:36:10 +0100 (CET)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe8H-0004hT-JN
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1f-0002LX-LH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1c-0001Qo-Rk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285356; x=1677821356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2t0vsEldS300M3EqufnFYimaYfcDKd82uIpaHgjF9fQ=;
 b=DeEHXgV1ECIf5O0PDhGsG+l1XfoYP/xFWYXeJFqyKEFs8pRs1okZybfM
 Iuo2RMUiZieRUBAwTl9YqxyAcum6kAAYNzZFf9lOKTTLwEQz5JUXLGPJp
 qdvrPpuZHO60g0sJOvPrzY69ZqKR0vP8VLL75eRiJ7msPAFuaX26+U1SJ
 5d/ZF2L9BBes3p1K4xFFu73cfmf1RSFDevjHB3RthwAXYszfFtrf+QFii
 Cak4zKjOxWUeq2VG7Tk8n7MZ35mVijpm2KEC/k27njxGWe2WBTehWKtGX
 Qg/RAXUcv+G3fRVYHWiEdIPY63CBDDojlDJltg3wiy7dxsEbSsZkV69Us A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="298483258"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:29:15 +0800
IronPort-SDR: D9KaY+sNb5kpdEUdWifcKyVJbCFT87kVHCFTVOKW0qPxSJRT8Ec8YRe0lsDaAQwk8Evoa0vbb9
 ZdqZAaIjbacxO7SZzNXvvQOMYbRjodz4QI7/2NQPnrzLeElUwl4/HC8xIZ35Kf5siTsiztlLZp
 vR312b++07GSUNgvbiqpLqXDlCP06ij4nfpwktMLyDHIrxhw6YOwgE/c6/HUXXtUfvwDI4Y3yQ
 nDt6y6/TtPe7zl+gMj3xwl3i1EfAiw2GZ74d4ZyVmUznU4cik3o9qdIpFuVRBkPOSwfuSleffF
 ZMJNq06cvsEt3Gkm5MwpbDKq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:38 -0800
IronPort-SDR: riJY+OGZxuXtqYwWY7qedaziR6+wf3keVfmZgSFZfrPccA4fYWGo4ob36w0HQoS7wkzsrJX0/G
 vKB51HM2VUsGu767nEMr2m4ylNS/B4s4JZjaU7OTZmhhOdIUTRbxz1q0RI9+OgI6K6iiGgIg8c
 J4vfENG7UHalZGZCcKdV26JESa8DlmkFRv1LHdmOF+YRBjjZanrAJaa416krMPd/ewa5lyiqyq
 fgsUxHvyPH+mVBHjdjYAk6EnY6LVNU+8GrfL1daySbWQ25MAnzdco+0tGu2lT9S+2EjbblkuaS
 +7Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:29:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKl3Scxz1SVp3
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:29:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285353; x=1648877354; bh=2t0vsEldS300M3Equf
 nFYimaYfcDKd82uIpaHgjF9fQ=; b=jd0noyfYtYQnXn3czEs0PA/KFREGuZrzgV
 cQdFiL/5pNUrzPgn/IKsKtwagGDZPnBxv/70YT7lvuvsdmXeRyVvw2O5EAiyEiH8
 VepLRaMNq27J+0XgcmeNZj4X096aalkQZ5qYfnWao99sxpne9kNmVd26s06qG2xe
 kQaiImIjJG13UJjNYFhXAKQH/TnO5QYKY4nWVO3Gm9Is+fY28XpFZ+7rLBWJyUrE
 mek4RpIBifLbJf7vB+UCzDUMX9INljGm+1CyiFh4PRvwVyLp7SpGAq9GL3rR/jMr
 PGJ5kHInV8ZDXhW7g+Hvh53FryTttV7OIcDGwmMnPYd1EwPjyYtg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QvcHD0znYoxI for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:29:13 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKd1QhSz1Rwrw;
 Wed,  2 Mar 2022 21:29:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 ardxwe <ardxwe@gmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/13] target/riscv: add support for zdinx
Date: Thu,  3 Mar 2022 15:28:02 +1000
Message-Id: <20220303052804.529967-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

  -- update extension check REQUIRE_ZDINX_OR_D
  -- update double float point register read/write

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                |  52 +++++
 target/riscv/insn_trans/trans_rvd.c.inc | 285 +++++++++++++++++-------
 2 files changed, 259 insertions(+), 78 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 10cf37be41..fac998a6b5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -416,6 +416,31 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int re=
g_num)
     }
 }
=20
+static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    if (reg_num =3D=3D 0) {
+        return tcg_constant_i64(0);
+    }
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+    {
+        TCGv_i64 t =3D ftemp_new(ctx);
+        tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1])=
;
+        return t;
+    }
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        return cpu_gpr[reg_num];
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
@@ -463,6 +488,33 @@ static void gen_set_fpr_hs(DisasContext *ctx, int re=
g_num, TCGv_i64 t)
     }
 }
=20
+static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+        return;
+    }
+
+    if (reg_num !=3D 0) {
+        switch (get_xl(ctx)) {
+        case MXL_RV32:
+#ifdef TARGET_RISCV32
+            tcg_gen_extr_i64_i32(cpu_gpr[reg_num], cpu_gpr[reg_num + 1],=
 t);
+            break;
+#else
+            tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
+            tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
+            break;
+        case MXL_RV64:
+            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+            break;
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
index 091ed3a8ad..1397c1ce1c 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -18,6 +18,19 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#define REQUIRE_ZDINX_OR_D(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zdinx) { \
+        REQUIRE_EXT(ctx, RVD); \
+    } \
+} while (0)
+
+#define REQUIRE_EVEN(ctx, reg) do { \
+    if (ctx->cfg_ptr->ext_zdinx && (get_xl(ctx) =3D=3D MXL_RV32) && \
+        ((reg) & 0x1)) { \
+        return false; \
+    } \
+} while (0)
+
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     TCGv addr;
@@ -47,10 +60,17 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -58,10 +78,17 @@ static bool trans_fmadd_d(DisasContext *ctx, arg_fmad=
d_d *a)
 static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -69,10 +96,17 @@ static bool trans_fmsub_d(DisasContext *ctx, arg_fmsu=
b_d *a)
 static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -80,10 +114,17 @@ static bool trans_fnmsub_d(DisasContext *ctx, arg_fn=
msub_d *a)
 static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -91,12 +132,16 @@ static bool trans_fnmadd_d(DisasContext *ctx, arg_fn=
madd_d *a)
 static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -104,12 +149,16 @@ static bool trans_fadd_d(DisasContext *ctx, arg_fad=
d_d *a)
 static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -117,12 +166,16 @@ static bool trans_fsub_d(DisasContext *ctx, arg_fsu=
b_d *a)
 static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -130,12 +183,16 @@ static bool trans_fmul_d(DisasContext *ctx, arg_fmu=
l_d *a)
 static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -143,23 +200,34 @@ static bool trans_fdiv_d(DisasContext *ctx, arg_fdi=
v_d *a)
 static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_d(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
=20
 static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
 {
+    REQUIRE_FPU;
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     if (a->rs1 =3D=3D a->rs2) { /* FMOV */
-        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        dest =3D get_fpr_d(ctx, a->rs1);
     } else {
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
-                            cpu_fpr[a->rs1], 0, 63);
+        TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+        TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
+        tcg_gen_deposit_i64(dest, src2, src1, 0, 63);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -167,15 +235,22 @@ static bool trans_fsgnj_d(DisasContext *ctx, arg_fs=
gnj_d *a)
 static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+
     if (a->rs1 =3D=3D a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
+        tcg_gen_xori_i64(dest, src1, INT64_MIN);
     } else {
+        TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
         TCGv_i64 t0 =3D tcg_temp_new_i64();
-        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 63);
+        tcg_gen_not_i64(t0, src2);
+        tcg_gen_deposit_i64(dest, t0, src1, 0, 63);
         tcg_temp_free_i64(t0);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -183,15 +258,22 @@ static bool trans_fsgnjn_d(DisasContext *ctx, arg_f=
sgnjn_d *a)
 static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+
     if (a->rs1 =3D=3D a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
+        tcg_gen_andi_i64(dest, src1, ~INT64_MIN);
     } else {
+        TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
         TCGv_i64 t0 =3D tcg_temp_new_i64();
-        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT64_MIN);
-        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
+        tcg_gen_andi_i64(t0, src2, INT64_MIN);
+        tcg_gen_xor_i64(dest, src1, t0);
         tcg_temp_free_i64(t0);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -199,11 +281,15 @@ static bool trans_fsgnjx_d(DisasContext *ctx, arg_f=
sgnjx_d *a)
 static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_helper_fmin_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_helper_fmin_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -211,11 +297,15 @@ static bool trans_fmin_d(DisasContext *ctx, arg_fmi=
n_d *a)
 static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2);
=20
-    gen_helper_fmax_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
+    gen_helper_fmax_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -223,11 +313,15 @@ static bool trans_fmax_d(DisasContext *ctx, arg_fma=
x_d *a)
 static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -235,11 +329,15 @@ static bool trans_fcvt_s_d(DisasContext *ctx, arg_f=
cvt_s_d *a)
 static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_s(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -247,11 +345,14 @@ static bool trans_fcvt_d_s(DisasContext *ctx, arg_f=
cvt_d_s *a)
 static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
-    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -259,11 +360,14 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_=
d *a)
 static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
-    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -271,11 +375,14 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_=
d *a)
 static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1 | a->rs2);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
=20
-    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -283,11 +390,13 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_=
d *a)
 static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
-    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_d(dest, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -295,12 +404,14 @@ static bool trans_fclass_d(DisasContext *ctx, arg_f=
class_d *a)
 static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -308,12 +419,14 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_f=
cvt_w_d *a)
 static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -321,12 +434,15 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_=
fcvt_wu_d *a)
 static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_w(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -335,12 +451,15 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_f=
cvt_d_w *a)
 static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_wu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -350,12 +469,14 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_f=
cvt_l_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -364,12 +485,14 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_=
fcvt_lu_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -392,12 +515,15 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_f=
cvt_d_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_l(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -407,12 +533,15 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_=
fcvt_d_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_lu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
--=20
2.35.1


