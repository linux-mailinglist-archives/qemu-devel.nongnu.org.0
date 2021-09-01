Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5E3FD145
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:23:28 +0200 (CEST)
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFuR-0007fI-0y
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFie-0005ju-Lv
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:19 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFib-00089g-TC
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462273; x=1661998273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lz817JvsSmm1aKtE4F4PmAni6XVzBF3QL4K2kU6o6zk=;
 b=V6rsW398pVaTELPAtqwnjjjafpi/shkT/h9aHK4j5ALYPCsIESx8xhMB
 HuCR2vnGlC18iw0jWCWSu/+uRJD6LSoed2+lEfMtjaV4iw5a7BxFfq3C7
 0o0HzQx3STr4TnrUI5/9pvPwlU69etmoxg6o/BGGjphuP/keqUPEzqcdP
 vRVhuirfZxJr8eRs9Xdmysu8YHA0Hf8AoKuVNmCZdNqDHyNniTgxxlUs/
 rnPUZX2vTwxlQHJNEm3zqHf7oXUmRYS5pxW/IbpY01oN6tViKimKl0Zp/
 SKGjynyammedBom8STrbXkbwg9rhaSw2XUEp0mtbwaZsv2c6NkE2nHQio g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011684"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:12 +0800
IronPort-SDR: jMIO56CADbeuo9k+GIQ2F/7eqIBG4nZEnTMs8EZe0ajgmD4EK9EWuRBrxyuFIUn11yYhKFlSyd
 6XjzrLGrysGKrIYgyHTVIesHxqNZtuHHJc5rai3aN0ucwInMO/nyXc8/kioQMWhsjJjqXuBir9
 BNZlMeOBo0iDY6EtkuqDJjX9otUpclg2bFY7J93TeyARoPah9juBZVJKpDIcZ/f8QM+rcCONx8
 wGgvoAzagOZe3QIEYo+CEX5/O9bRecYQbRIk+tcP8Y6z/Eh1hDwAd1R0tnR4O7Zv3+b36qcBZo
 RLKBz/x8PHU3+uqCFir56sLf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:00 -0700
IronPort-SDR: JeRW/UKP5ha20haDsC1ZYMm3ir9lHp4qOcnbZhGSUgsuDH+mvw2sb1Y5h4alktYmWnIVc81bs1
 qRKo5WqlrUKHrcReBGFtoSZccOfakBRZDv+wAOAeGZm1vNQbMIHwCtFdx++0CTPIUteQWrTaTS
 D1bNi65opQaL+JXD6Eqqi9XzqtDZ7pLWBPV4sMjJY2RsULKHWP2LGZqabFARIKqvw/eIDiLUOv
 LmDXwPHIlxopoLtkyLs0ifoRcDUTF5mazT4azQbDGTywTNmPtBtSCffex1j4WzS4iormkCxc41
 KWM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznbh1dpfz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462266; x=1633054267; bh=lz817Jv
 sSmm1aKtE4F4PmAni6XVzBF3QL4K2kU6o6zk=; b=f1kK0u/noPfTCatPbSO67vu
 vHDiy9tWFazQnSozVeRluBqWrXRJVdgpOowxl9pKhq7baBxoNST9UWkiCkWOevlE
 rDsL2BtbGgI5FeSRLK292nsSCtfgpaC20yl4UHLtOO0faFmvbkgic4pFNltovGQ3
 bZIzDECrbfpZWCD79U/BjiopyHFWC9EFQyNZt2jAQNTxUKFLP8tjqLmoB8/jPxj7
 Ng6w3zdYJXZXbcgSyALsFr3WzlcMqUMPjofCH4/fQOlw2w9xYDiePRQMPIlVfD9o
 GbdtjUpKg3/XC+fJX2hw/zBRUPQk3Uiiq8uxhIuGypSdMOP70qjfvzEO58vQmvA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id E_0I6AlnCFp8 for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:06 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznbT4Bj9z1Rvl9;
 Tue, 31 Aug 2021 19:11:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/33] target/riscv: Use tcg_constant_*
Date: Wed,  1 Sep 2021 12:09:35 +1000
Message-Id: <20210901020958.458454-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace uses of tcg_const_* with the allocate and free close together.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-2-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 36 ++++----------
 target/riscv/insn_trans/trans_rvf.c.inc |  3 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 65 +++++++++----------------
 3 files changed, 34 insertions(+), 70 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..20a55c92fb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -104,20 +104,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  */
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
-    TCGv_i64 t_max =3D tcg_const_i64(0xffffffff00000000ull);
-    TCGv_i64 t_nan =3D tcg_const_i64(0xffffffff7fc00000ull);
+    TCGv_i64 t_max =3D tcg_constant_i64(0xffffffff00000000ull);
+    TCGv_i64 t_nan =3D tcg_constant_i64(0xffffffff7fc00000ull);
=20
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
-    tcg_temp_free_i64(t_max);
-    tcg_temp_free_i64(t_nan);
 }
=20
 static void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    TCGv_i32 helper_tmp =3D tcg_const_i32(excp);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
@@ -125,17 +121,13 @@ static void generate_exception_mtval(DisasContext *=
ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
-    TCGv_i32 helper_tmp =3D tcg_const_i32(excp);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
 static void gen_exception_debug(void)
 {
-    TCGv_i32 helper_tmp =3D tcg_const_i32(EXCP_DEBUG);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
 }
=20
 /* Wrapper around tcg_gen_exit_tb that handles single stepping */
@@ -229,7 +221,7 @@ static void gen_div(TCGv ret, TCGv source1, TCGv sour=
ce2)
      */
     cond1 =3D tcg_temp_new();
     cond2 =3D tcg_temp_new();
-    zeroreg =3D tcg_const_tl(0);
+    zeroreg =3D tcg_constant_tl(0);
     resultopt1 =3D tcg_temp_new();
=20
     tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
@@ -250,7 +242,6 @@ static void gen_div(TCGv ret, TCGv source1, TCGv sour=
ce2)
=20
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
=20
@@ -259,7 +250,7 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv sou=
rce2)
     TCGv cond1, zeroreg, resultopt1;
     cond1 =3D tcg_temp_new();
=20
-    zeroreg =3D tcg_const_tl(0);
+    zeroreg =3D tcg_constant_tl(0);
     resultopt1 =3D tcg_temp_new();
=20
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
@@ -272,7 +263,6 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv sou=
rce2)
     tcg_gen_divu_tl(ret, source1, source2);
=20
     tcg_temp_free(cond1);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
=20
@@ -282,7 +272,7 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv sour=
ce2)
=20
     cond1 =3D tcg_temp_new();
     cond2 =3D tcg_temp_new();
-    zeroreg =3D tcg_const_tl(0);
+    zeroreg =3D tcg_constant_tl(0);
     resultopt1 =3D tcg_temp_new();
=20
     tcg_gen_movi_tl(resultopt1, 1L);
@@ -302,7 +292,6 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv sour=
ce2)
=20
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
=20
@@ -310,7 +299,7 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv sou=
rce2)
 {
     TCGv cond1, zeroreg, resultopt1;
     cond1 =3D tcg_temp_new();
-    zeroreg =3D tcg_const_tl(0);
+    zeroreg =3D tcg_constant_tl(0);
     resultopt1 =3D tcg_temp_new();
=20
     tcg_gen_movi_tl(resultopt1, (target_ulong)1);
@@ -323,7 +312,6 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv sou=
rce2)
             source1);
=20
     tcg_temp_free(cond1);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
=20
@@ -384,15 +372,11 @@ static inline void mark_fs_dirty(DisasContext *ctx)=
 { }
=20
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
-    TCGv_i32 t0;
-
     if (ctx->frm =3D=3D rm) {
         return;
     }
     ctx->frm =3D rm;
-    t0 =3D tcg_const_i32(rm);
-    gen_helper_set_rounding_mode(cpu_env, t0);
-    tcg_temp_free_i32(t0);
+    gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
=20
 static int ex_plus_1(DisasContext *ctx, int nf)
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
index db1c0c9974..89f78701e7 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -200,12 +200,11 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_f=
sgnjn_s *a)
          * Replace bit 31 in rs1 with inverse in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        mask =3D tcg_const_i64(~MAKE_64BIT_MASK(31, 1));
+        mask =3D tcg_constant_i64(~MAKE_64BIT_MASK(31, 1));
         tcg_gen_nor_i64(rs2, rs2, mask);
         tcg_gen_and_i64(rs1, mask, rs1);
         tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
=20
-        tcg_temp_free_i64(mask);
         tcg_temp_free_i64(rs2);
     }
     tcg_temp_free_i64(rs1);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 83d9a285ba..a8e7272487 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -33,7 +33,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl =
*a)
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
     if (a->rs1 =3D=3D 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
-        s1 =3D tcg_const_tl(RV_VLEN_MAX);
+        s1 =3D tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 =3D tcg_temp_new();
         gen_get_gpr(s1, a->rs1);
@@ -59,13 +59,13 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vset=
vli *a)
         return false;
     }
=20
-    s2 =3D tcg_const_tl(a->zimm);
+    s2 =3D tcg_constant_tl(a->zimm);
     dst =3D tcg_temp_new();
=20
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
     if (a->rs1 =3D=3D 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
-        s1 =3D tcg_const_tl(RV_VLEN_MAX);
+        s1 =3D tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 =3D tcg_temp_new();
         gen_get_gpr(s1, a->rs1);
@@ -76,7 +76,6 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvl=
i *a)
     ctx->base.is_jmp =3D DISAS_NORETURN;
=20
     tcg_temp_free(s1);
-    tcg_temp_free(s2);
     tcg_temp_free(dst);
     return true;
 }
@@ -183,7 +182,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -194,7 +193,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -334,7 +332,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
     mask =3D tcg_temp_new_ptr();
     base =3D tcg_temp_new();
     stride =3D tcg_temp_new();
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     gen_get_gpr(base, rs1);
     gen_get_gpr(stride, rs2);
@@ -347,7 +345,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
     tcg_temp_free(stride);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -462,7 +459,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
     mask =3D tcg_temp_new_ptr();
     index =3D tcg_temp_new_ptr();
     base =3D tcg_temp_new();
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -475,7 +472,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -594,7 +590,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uin=
t32_t data,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     base =3D tcg_temp_new();
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -605,7 +601,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uin=
t32_t data,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -671,7 +666,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
     mask =3D tcg_temp_new_ptr();
     index =3D tcg_temp_new_ptr();
     base =3D tcg_temp_new();
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -684,7 +679,6 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -874,7 +868,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t vs2, uint32_t vm,
     data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -886,7 +880,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free(src1);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -1014,14 +1007,14 @@ static bool opivi_trans(uint32_t vd, uint32_t imm=
, uint32_t vs2, uint32_t vm,
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
     if (zx) {
-        src1 =3D tcg_const_tl(imm);
+        src1 =3D tcg_constant_tl(imm);
     } else {
-        src1 =3D tcg_const_tl(sextract64(imm, 0, 5));
+        src1 =3D tcg_constant_tl(sextract64(imm, 0, 5));
     }
     data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1032,8 +1025,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free(src1);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -1080,9 +1071,8 @@ GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
 static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t ao=
fs,
                                int64_t c, uint32_t oprsz, uint32_t maxsz=
)
 {
-    TCGv_i64 tmp =3D tcg_const_i64(c);
+    TCGv_i64 tmp =3D tcg_constant_i64(c);
     tcg_gen_gvec_rsubs(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
=20
 GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
@@ -1682,7 +1672,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
-            TCGv_i32 desc ;
+            TCGv_i32 desc;
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
@@ -1692,12 +1682,11 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vm=
v_v_x *a)
             };
=20
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, d=
ata));
+            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
             tcg_temp_free_i64(s1_i64);
         }
=20
@@ -1729,15 +1718,13 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vm=
v_v_i *a)
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
-            s1 =3D tcg_const_i64(simm);
+            s1 =3D tcg_constant_i64(simm);
             dest =3D tcg_temp_new_ptr();
-            desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, d=
ata));
+            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
-            tcg_temp_free_i64(s1);
             gen_set_label(over);
         }
         return true;
@@ -1866,7 +1853,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
-    desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1877,7 +1864,6 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -2231,12 +2217,11 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_v=
fmv_v_f *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
             dest =3D tcg_temp_new_ptr();
-            desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, d=
ata));
+            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
             gen_set_label(over);
         }
         return true;
@@ -2428,7 +2413,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr=
 *a)
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
         dst =3D tcg_temp_new();
-        desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data)=
);
+        desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2439,7 +2424,6 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr=
 *a)
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
-        tcg_temp_free_i32(desc);
         return true;
     }
     return false;
@@ -2460,7 +2444,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rm=
r *a)
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
         dst =3D tcg_temp_new();
-        desc =3D tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data)=
);
+        desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2471,7 +2455,6 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rm=
r *a)
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
-        tcg_temp_free_i32(desc);
         return true;
     }
     return false;
@@ -2636,15 +2619,13 @@ static void vec_element_loadx(DisasContext *s, TC=
Gv_i64 dest,
     tcg_temp_free_i32(ofs);
=20
     /* Flush out-of-range indexing to zero.  */
-    t_vlmax =3D tcg_const_i64(vlmax);
-    t_zero =3D tcg_const_i64(0);
+    t_vlmax =3D tcg_constant_i64(vlmax);
+    t_zero =3D tcg_constant_i64(0);
     tcg_gen_extu_tl_i64(t_idx, idx);
=20
     tcg_gen_movcond_i64(TCG_COND_LTU, dest, t_idx,
                         t_vlmax, dest, t_zero);
=20
-    tcg_temp_free_i64(t_vlmax);
-    tcg_temp_free_i64(t_zero);
     tcg_temp_free_i64(t_idx);
 }
=20
--=20
2.31.1


