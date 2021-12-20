Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46447A49E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:35:18 +0100 (CET)
Received: from localhost ([::1]:56348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBKP-0005Pb-5V
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkr-0000Cq-Ld
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkl-00086m-Vu
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976307; x=1671512307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fGT8WIaozEaZVsRSWO1urNDiC1XDkG5TzrJnSci3Vmk=;
 b=a+DwvyuMDP6Eac4FirAFSP+3ccLdJ4SSMvl3zR5vyHY/35MHshls1SSv
 We0mYoV3ZMk3NBohyXP29mwTjaKZO1NfmxG3xknJ+VAxgQL2DtbEhWfIx
 Rs9BqPMQ6GYngT44NTh0h+batZ3qsxzJQrSV1AzIxeF4ljBzMbgS9Hl1a
 JZtEUb9jcOLL8JBP8e3+XVojANrxIQvbLvsKuuipST4PDYtCfFArmXp/I
 YRvT9jLauj4fAqHI1RhtYCbmf6V6t7SFCGcjvQnUuC9qLcRb+tjc+F/RF
 dyu9dfEOx9/8PG/jyDI+3rP4QSG/VcQjBk4KIQv+lElI5wToWWV0J7q5p g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661919"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:24 +0800
IronPort-SDR: t492292csqPWM4V3Tdmq/C99qPQ5df7l4X/qqZBFoJy9qa1N13rySHY9zdk9zz9O1kqyYT+Lwe
 16VDCpWKiKCp4NUVy+BgOS31aSrP/DDvWdRkwgiK2RhFRBO6DmYAABqmd+kW28MNBJbR/sjFeo
 X6f8Yp9KqN0SCnvyEj3yObASt5a8ABv5K1+3Xk49o3XkR18lQ0mWVNsC1at5b6cF+Mhy7T+FiK
 qYU5ZuNi2PS31QAefpS4nxS7yGfv60Iy3TPDKG1ad8kg8EOVyTQylb8Upgo8MpiuggRVuBVnyO
 fT7N7XiC/u1Y7CjNs85XXCK8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:13 -0800
IronPort-SDR: SxdZLuJ31v/4Y47n73BrjMdXjuXH3QKZHfsuw8PO2phByUuHw3cMj7DGRwrpKrAunGwnVt9Xf9
 LtRkOQ/Z4YiaK4uj5Eb8hYHX2uIPtzaM82yVmoRgegKrVBXvYpA4x03JQ7plIHAt8PLI1DIu5e
 CyhA6Cnoao7h8xPiedbDHOExtqQptJus2iXQmtpvaUVqs4gkFJAS1JzOnx8GRmC0qXvM9bPkWw
 UtVmV4oYXNBvaTWf0r4V1RyJkd7VFfIqF2rltUA72+3Dekm/CybXgkk8vp3hn/mKlXa6nCCCQ3
 ZvU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5q10rwz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976301; x=1642568302; bh=fGT8WIaozEaZVsRSWO
 1urNDiC1XDkG5TzrJnSci3Vmk=; b=nO38Y76YgSTFwCDWrb6KJvkL7h2xwSFtZh
 BzINwZ33zr1zz+ubCxyDuQtlasI6YvR9XMpdVwRtQXKGKRWNcfb2+PDjkaCKdAxC
 WsPODjhYR1+Og9AWX/dUev0PA0c/R8PkRlubzjF9RkA22MF5EsebHdFQLFCwJjKQ
 R7sIKHtfISJStvCnWS5GLlbkpDCEXb5NCjC7JLAX9/3E5PtqBfgOsKKT+grZXLlW
 31/Kkwv/cKzWyCC8BMIIEqEGFPRf2cZvirzKU62C+XdUBK1s8VyeHmNrdxOVAYKD
 3pVmTWJYWo9OPmnk62x2ykWvqHWqlc0/6kzbj5yQEj9LmVI2FtDg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KMbJ8ejS74iV for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:21 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5j5vvZz1RtVG;
 Sun, 19 Dec 2021 20:58:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/88] target/riscv: rvv-1.0: add translation-time vector
 context status
Date: Mon, 20 Dec 2021 14:55:52 +1000
Message-Id: <20211220045705.62174-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-8-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  5 +-
 target/riscv/cpu_helper.c               |  3 +
 target/riscv/translate.c                | 40 +++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 75 +++++++++++++++++++++----
 4 files changed, 109 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 48b8f61210..eee2a2b19e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -410,10 +410,11 @@ FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
+FIELD(TB_FLAGS, MSTATUS_HS_VS, 13, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
-FIELD(TB_FLAGS, XL, 13, 2)
+FIELD(TB_FLAGS, XL, 15, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 15, 1)
+FIELD(TB_FLAGS, PM_ENABLED, 17, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8803fe0b14..1b31d0ad47 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -111,6 +111,9 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
=20
         flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
                            get_field(env->mstatus_hs, MSTATUS_FS));
+
+        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
+                           get_field(env->mstatus_hs, MSTATUS_VS));
     }
     if (riscv_has_ext(env, RVJ)) {
         int priv =3D flags & TB_FLAGS_PRIV_MMU_MASK;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d445954dc7..8051090d2f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -62,7 +62,9 @@ typedef struct DisasContext {
     uint32_t misa_ext;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_vs;
     uint32_t mstatus_hs_fs;
+    uint32_t mstatus_hs_vs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction=
,
        which we have already installed into env->fp_status.  Or -1 for
@@ -348,6 +350,42 @@ static void mark_fs_dirty(DisasContext *ctx)
 static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
=20
+#ifndef CONFIG_USER_ONLY
+/* The states of mstatus_vs are:
+ * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
+ * We will have already diagnosed disabled state,
+ * and need to turn initial/clean into dirty.
+ */
+static void mark_vs_dirty(DisasContext *ctx)
+{
+    TCGv tmp;
+
+    if (ctx->mstatus_vs !=3D MSTATUS_VS) {
+        /* Remember the state change for the rest of the TB.  */
+        ctx->mstatus_vs =3D MSTATUS_VS;
+
+        tmp =3D tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_temp_free(tmp);
+    }
+
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs !=3D MSTATUS_VS) {
+        /* Remember the stage change for the rest of the TB. */
+        ctx->mstatus_hs_vs =3D MSTATUS_VS;
+
+        tmp =3D tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
+        tcg_temp_free(tmp);
+    }
+}
+#else
+static inline void mark_vs_dirty(DisasContext *ctx) { }
+#endif
+
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     if (ctx->frm =3D=3D rm) {
@@ -631,6 +669,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->pc_succ_insn =3D ctx->base.pc_first;
     ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs =3D tb_flags & TB_FLAGS_MSTATUS_FS;
+    ctx->mstatus_vs =3D tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver =3D env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -648,6 +687,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
     ctx->vlen =3D cpu->cfg.vlen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
+    ctx->mstatus_hs_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 17ee3babef..bc1d4a5f23 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -39,6 +39,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl =
*a)
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+    mark_vs_dirty(ctx);
=20
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
@@ -66,6 +67,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvl=
i *a)
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+    mark_vs_dirty(ctx);
=20
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
     ctx->base.is_jmp =3D DISAS_NORETURN;
@@ -154,7 +156,8 @@ typedef void gen_helper_ldst_us(TCGv_ptr, TCGv_ptr, T=
CGv,
                                 TCGv_env, TCGv_i32);
=20
 static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
-                          gen_helper_ldst_us *fn, DisasContext *s)
+                          gen_helper_ldst_us *fn, DisasContext *s,
+                          bool is_store)
 {
     TCGv_ptr dest, mask;
     TCGv base;
@@ -183,6 +186,11 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1,=
 uint32_t data,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -233,7 +241,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, =
uint8_t seq)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
 static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
@@ -286,7 +294,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, =
uint8_t seq)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
 static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
@@ -309,7 +317,7 @@ typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_pt=
r, TCGv,
=20
 static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
                               uint32_t data, gen_helper_ldst_stride *fn,
-                              DisasContext *s)
+                              DisasContext *s, bool is_store)
 {
     TCGv_ptr dest, mask;
     TCGv base, stride;
@@ -331,6 +339,11 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t =
rs1, uint32_t rs2,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -365,7 +378,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *=
a, uint8_t seq)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
 static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
@@ -409,7 +422,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *=
a, uint8_t seq)
         return false;
     }
=20
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
 static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
@@ -432,7 +445,7 @@ typedef void gen_helper_ldst_index(TCGv_ptr, TCGv_ptr=
, TCGv,
=20
 static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
                              uint32_t data, gen_helper_ldst_index *fn,
-                             DisasContext *s)
+                             DisasContext *s, bool is_store)
 {
     TCGv_ptr dest, mask, index;
     TCGv base;
@@ -456,6 +469,11 @@ static bool ldst_index_trans(uint32_t vd, uint32_t r=
s1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -490,7 +508,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a=
, uint8_t seq)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
 /*
@@ -542,7 +560,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a=
, uint8_t seq)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
 static bool st_index_check(DisasContext *s, arg_rnfvm* a)
@@ -583,6 +601,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uin=
t32_t data,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -659,6 +678,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -810,6 +830,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3F=
n *gvec_fn,
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
     }
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -861,6 +882,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -892,6 +914,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2s=
Fn *gvec_fn,
                 src1, MAXSZ(s), MAXSZ(s));
=20
         tcg_temp_free_i64(src1);
+        mark_vs_dirty(s);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1003,6 +1026,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -1026,10 +1050,10 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecG=
en2iFn *gvec_fn,
             gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                     sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
         }
-    } else {
-        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+        mark_vs_dirty(s);
+        return true;
     }
-    return true;
+    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
 }
=20
 /* OPIVI with GVEC IR */
@@ -1089,6 +1113,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
                            vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1176,6 +1201,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1255,6 +1281,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew]);                           \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1383,6 +1410,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, G=
VecGen2sFn32 *gvec_fn,
                 src1, MAXSZ(s), MAXSZ(s));
=20
         tcg_temp_free_i32(src1);
+        mark_vs_dirty(s);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1442,6 +1470,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew]);                           \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1626,6 +1655,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
                                fns[s->sew]);
             gen_set_label(over);
         }
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -1665,6 +1695,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
             tcg_temp_free_i64(s1_i64);
         }
=20
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1680,6 +1711,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
+            mark_vs_dirty(s);
         } else {
             TCGv_i32 desc;
             TCGv_i64 s1;
@@ -1699,6 +1731,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
             fns[s->sew](dest, s1, cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
+            mark_vs_dirty(s);
             gen_set_label(over);
         }
         return true;
@@ -1804,6 +1837,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1838,6 +1872,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -1916,6 +1951,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
                            vreg_ofs(s, a->rs2), cpu_env,         \
                            s->vlen / 8, s->vlen / 8, data,       \
                            fns[s->sew - 1]);                     \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                     \
         return true;                                             \
     }                                                            \
@@ -1991,6 +2027,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2106,6 +2143,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2178,6 +2216,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+            mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
             TCGv_i32 desc;
@@ -2196,6 +2235,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
+            mark_vs_dirty(s);
             gen_set_label(over);
         }
         return true;
@@ -2246,6 +2286,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2295,6 +2336,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2357,6 +2399,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data, fn);    \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2451,6 +2494,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->vlen / 8, s->vlen / 8,      \
                            data, fn);                              \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2482,6 +2526,7 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2508,6 +2553,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2681,6 +2727,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_=
s_x *a)
         tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
+        mark_vs_dirty(s);
     done:
         gen_set_label(over);
         return true;
@@ -2731,6 +2778,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
         }
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2797,6 +2845,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
         tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                              MAXSZ(s), MAXSZ(s), dest);
         tcg_temp_free_i64(dest);
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] =3D {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2823,6 +2872,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
                                  endian_ofs(s, a->rs2, a->rs1),
                                  MAXSZ(s), MAXSZ(s));
         }
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] =3D {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2860,6 +2910,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data,
                            fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
--=20
2.31.1


