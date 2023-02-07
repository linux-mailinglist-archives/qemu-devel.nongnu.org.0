Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0268D052
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7U-0006Tr-9b; Tue, 07 Feb 2023 02:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7G-0006Pq-Qp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:14 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7D-0008Qm-15
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753806; x=1707289806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4W7jSIgP3x0J1YsHMz5Loi58cLrcTjSyZLrNefVGmc=;
 b=np4H4TE14Ddn8v843JuI2Rcm0Diyr7ElTxXRpSr5LrS3iU3ad7DkSOH9
 kKZ2aUIVkOsYUuTQQ1wfypDiCPMS+WbUUfBdRNhGCX7zV76ooyfgXlqoq
 9OsSrcnY9aUVk2tJJ5CWQteSRcZZmNBoXTPt3o6YYrXhmZUXk0mpf/HWx
 cDt2yjp7NI7idnXvGnsWvdLA0EbrnnQcEbs8LRIxcReIqr3T8DXViCWTe
 BCxgTHc2l8+X7b6WotoNS0/nwhMPRrcZr3gktQ10dThQCAOskffwLnfxI
 KW3izkJzwWxYqlt62CM1Rzd20rSAfxSuWeKSHfHeSeuwamXZjPVE3fNL6 A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657470"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:02 +0800
IronPort-SDR: VJUjWim5+tRMiBDEQStmo+k0T+q6mbh6exCv8Cze4ApwzN6hDvn8aLbV0SV8WdzqUvLADdNQn+
 JMBrrHKcysGg22Uu0UCD6cj2X87K1Wy6ItqgLaOa+zpIjg75MIrqiWlvj9KtWuctblZvR7DDaN
 K/4OqXWaXnGq0gAy9vpdNWckyfqrsxKJYMOE4Lbct4L7lRsQz5LpwAITUm2Y5ISdIcbUErfCfn
 HXEr49rABkYiRuYI13BH14QwhA6Vvprmv/syw8yFe7jQTcKNC1QqPTWraTBkemsgKfGUY4nfjf
 RTs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:19 -0800
IronPort-SDR: 5kupZHiaPtgtHQZTI5pjYj8SqB0OIw/Hb53wN6tHiE3hLvBoeT+J+QccPTuCrBkpSHZJiRfoO0
 7pKz+ISL5fcjp08c4lBf4flHJdB2cY7TiBOn7Sy/wPOnHNWOnC6x/IXe3jhJbXAJd6lLJHkgkN
 o2z19RAnO9tw0uBHQ2nzMZGGlJvXNSXcbNstWV0Fwlw9MdFeSAFywPUnI/eaFqf6AIHf7jbTCi
 gCqNxyXudiuD+XDLIHdRFfuGbcmGmI3X41r1OfJnDFE4/GhcPIz1iWgAcc4nnLxruN4XNsWt3G
 REg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQd6LWyz1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753801; x=1678345802; bh=O4W7jSIgP3x0J1YsHM
 z5Loi58cLrcTjSyZLrNefVGmc=; b=jQLJB4R30W2tcvsCSm2yn4oc4P30EsPhLN
 +o2VIlOsUjI8eHZIutQ6BteaAZ+NvG/Eaw7k2sUH9GTOWxXjb6fU2HT5rN5z4VqA
 m/jkdfuoM10c3TVdxWsacsWBTu5Wm4WjDv6aKaqrrFXgrgwb7LLhrQ+E/GYduzPo
 sQePHUQ7VNskSvQdQyY5vtlxGgeBEpWpPpp8uC1F8BvbEIIXWzM00zlcwiWErv1e
 emaSjOEU/VlJR+pNpeXz4+tV+LXX6L+e/Ix+EeyNp0ad7ZUrMe9pO2S8v3w34PUr
 XcGi2JXOJSuy2JWMdqZLXOxee1y02ZqZzu/2xc7RPDE4SobibCVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lm5B8M0qeIrj for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:01 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQb6rfSz1RvLy;
 Mon,  6 Feb 2023 23:09:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/32] target/riscv: Ensure opcode is saved for all relevant
 instructions
Date: Tue,  7 Feb 2023 17:09:18 +1000
Message-Id: <20230207070943.2558857-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anup Patel <apatel@ventanamicro.com>

We should call decode_save_opc() for all relevant instructions which
can potentially generate a virtual instruction fault or a guest page
fault because generating transformed instruction upon guest page fault
expects opcode to be available. Without this, hypervisor will see
transformed instruction as zero in htinst CSR for guest MMIO emulation
which makes MMIO emulation in hypervisor slow and also breaks nested
virtualization.

Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc=
")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230120125950.2246378-5-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc     | 10 +++++++---
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 +++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 +++
 7 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 45db82c9be..5f194a447b 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -20,8 +20,10 @@
=20
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 =3D get_address(ctx, a->rs1, 0);
+    TCGv src1;
=20
+    decode_save_opc(ctx);
+    src1 =3D get_address(ctx, a->rs1, 0);
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -43,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, Me=
mOp mop)
     TCGLabel *l1 =3D gen_new_label();
     TCGLabel *l2 =3D gen_new_label();
=20
+    decode_save_opc(ctx);
     src1 =3D get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
=20
@@ -81,9 +84,10 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     MemOp mop)
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
-    TCGv src1 =3D get_address(ctx, a->rs1, 0);
-    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src1, src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
+    decode_save_opc(ctx);
+    src1 =3D get_address(ctx, a->rs1, 0);
     func(dest, src1, src2, ctx->mem_idx, mop);
=20
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
index 1397c1ce1c..6e3159b797 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -38,6 +38,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
+    decode_save_opc(ctx);
     addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEUQ);
=20
@@ -52,6 +53,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
+    decode_save_opc(ctx);
     addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUQ);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
index a1d3eb52ad..965e1f8d11 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -38,6 +38,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
=20
+    decode_save_opc(ctx);
     addr =3D get_address(ctx, a->rs1, a->imm);
     dest =3D cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
@@ -54,6 +55,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
=20
+    decode_save_opc(ctx);
     addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
index 4f8aecddc7..9248b48c36 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -36,6 +36,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp =
mop)
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv dest =3D dest_gpr(ctx, a->rd);
         TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
@@ -82,6 +83,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemO=
p mop)
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
         TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
@@ -135,6 +137,7 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d =
*a)
 static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
                     void (*func)(TCGv, TCGv_env, TCGv))
 {
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv dest =3D dest_gpr(ctx, a->rd);
         TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 5c69b88d1e..4496f21266 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,6 +261,7 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *=
a, MemOp memop)
=20
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
+    decode_save_opc(ctx);
     if (get_xl(ctx) =3D=3D MXL_RV128) {
         return gen_load_i128(ctx, a, memop);
     } else {
@@ -350,6 +351,7 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb =
*a, MemOp memop)
=20
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
+    decode_save_opc(ctx);
     if (get_xl(ctx) =3D=3D MXL_RV128) {
         return gen_store_i128(ctx, a, memop);
     } else {
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 5d07150cd0..2ad5716312 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -49,6 +49,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     REQUIRE_FPU;
     REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
+    decode_save_opc(ctx);
     t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
         TCGv temp =3D temp_new(ctx);
@@ -71,6 +72,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     REQUIRE_FPU;
     REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
+    decode_save_opc(ctx);
     t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
         TCGv temp =3D tcg_temp_new();
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/i=
nsn_trans/trans_svinval.c.inc
index 2682bd969f..f3cd7d5c0b 100644
--- a/target/riscv/insn_trans/trans_svinval.c.inc
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -28,6 +28,7 @@ static bool trans_sinval_vma(DisasContext *ctx, arg_sin=
val_vma *a)
     /* Do the same as sfence.vma currently */
     REQUIRE_EXT(ctx, RVS);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_tlb_flush(cpu_env);
     return true;
 #endif
@@ -56,6 +57,7 @@ static bool trans_hinval_vvma(DisasContext *ctx, arg_hi=
nval_vvma *a)
     /* Do the same as hfence.vvma currently */
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_tlb_flush(cpu_env);
     return true;
 #endif
@@ -68,6 +70,7 @@ static bool trans_hinval_gvma(DisasContext *ctx, arg_hi=
nval_gvma *a)
     /* Do the same as hfence.gvma currently */
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_gvma_tlb_flush(cpu_env);
     return true;
 #endif
--=20
2.39.1


