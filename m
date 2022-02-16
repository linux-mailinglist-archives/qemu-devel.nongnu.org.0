Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CD4B80C0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:34:08 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDt9-0008DM-Gz
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDp5-0004xT-2j
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:55 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDp1-0006JA-Fo
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992991; x=1676528991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8NA4AOxHOKirwDWriBJ4AVXxL9ADb0JRoHJbqikHhE=;
 b=MpudgdDHWi8VTSw+/km84d6cnT6QJHLqAVdXHeBcgCOQgFl723/4jdR2
 CSjI3qiQny10LrL/ip0H/qpSlihCeAT964JVras+nywNoOVwhLvH0Q/0Z
 x+d/ydGDpI25gyLLFFCRhA0JlfDkxQOmwuAxx4iVojjdzdwPqagQnaQoZ
 78xKhjW6HT8zntl5pHsVJ8G4BMhrEmr5X1rMcC0XayalGnbB414Uf8sWp
 TGNTpP0kErWazwUYeH+SQam7C6jtVNYddHHb96Ldct1i+x4qZ8QY/7CoX
 Wxquk8KwP2ihOExpqYgzeBX7hmNW6ZJUL9gCE4ErzN7SWrjkRhyOpiqEo w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181704"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:49 +0800
IronPort-SDR: afogz5QwhRIcNED7lA+4b3YTKQGnD0u31MF6b8oSsOpfD5y1ydw2EjtYhaQgE4zeXxiLNFnu8X
 ylMESCNofEQwkAYYoeLTHJwzTr4eANEV4jNcKrFim+nJqUellsosCE1p3Q08RxFXcFdYiYflTH
 wx26WY42CNgFtpOZGCPn9wr5Fwcd9KVxG4/JTZ9oc38zpNh8O2NnOUp7DHdrLbuP80hF4JbHal
 d0EHggN2RFgyE/vVZncB2o8JKyuJICd5f5mwk+s1RN3BF451c4M1ozdtWEf/b09RPUxl5n+ugg
 IzxWEM2Dla3Sz+0DW3Q8WpzT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:37 -0800
IronPort-SDR: nyE7VcD/YbBLYZVC+chXGwFf1B1y4zZyg6jWQYgLG+HFjRRTF2dP6biWWDvO7a/f9BAOKfdhjA
 2sDS5J/n4wyixQoHf95w5lovvZ8jeIcgxmdv1Ra755wV8sz3gb3K08HfA5ODW/qPc25KMs/ZY7
 ozW6VHxTskfMJ+1AIvSJHCZLtI4/gtmqgw3pqP2wr/x0w+owzZyE8uoa/DJbqlXg7e7sh/BNnn
 YK9hiYcY0Osp9sdRbNiJ1wJPe4FwTQbM0U9oBKUZwRBNVBzVrx1ASXhUGxOcnPXC0k6rNnqo6Z
 eJo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7NY3GdZz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644992988; x=1647584989; bh=o8NA4AOxHOKirwDWri
 BJ4AVXxL9ADb0JRoHJbqikHhE=; b=kuLU1WqPqODtoVwsdBPbU/va6HLp7qCoug
 cZjPn4zQrTIpqPU/3qfL3HklX335L/G2G6cAnrgz5Xm0cerdbMciaH5w3S5VoYq2
 nHmJwfUyMis1evTdtTw1wCLYoXnCV37y37eJPlNevQhyitZKxN/xoogNp64gsTvG
 5HK7pRjwLef5gTte8IDricwqOebgPCGh6A4AQ/Lhqjmeq0n1rYltZExmXGTeQgde
 ZWt8rlv/HMYmb8xQyzAxTIq4Hr5YdpngklfOfvxVDoCnH2+g50vo5A6Uy/S6Xrva
 L8dRGvhLktm0hsY8Uc3/c76Get4p8stWIPiHmWMis7u45WaSybmA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fxha9LIusSRg for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:48 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7NR2pl8z1Rwrw;
 Tue, 15 Feb 2022 22:29:42 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 06/35] target/riscv: access configuration through cfg_ptr in
 DisasContext
Date: Wed, 16 Feb 2022 16:28:43 +1000
Message-Id: <20220216062912.319738-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
copies (in DisasContext) of some of the elements available in the
RISCVCPUConfig structure.  This commit redirects accesses to use the
cfg_ptr copied into DisasContext and removes the shallow copies.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-4-philipp.tomsich@vrull.eu>
[ Changes by AF:
 - Fixup checkpatch failures
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                  |  14 ---
 target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc   | 146 ++++++++++++++--------
 target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
 4 files changed, 97 insertions(+), 69 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 49e40735ce..f19d5cd0c0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -77,11 +77,6 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
-    bool ext_ifencei;
-    bool ext_zfh;
-    bool ext_zfhmin;
-    bool ext_zve32f;
-    bool ext_zve64f;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -99,8 +94,6 @@ typedef struct DisasContext {
      */
     int8_t lmul;
     uint8_t sew;
-    uint16_t vlen;
-    uint16_t elen;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -910,13 +903,6 @@ static void riscv_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
     ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->cfg_ptr =3D &(cpu->cfg);
-    ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
-    ctx->ext_zfh =3D cpu->cfg.ext_zfh;
-    ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
-    ctx->ext_zve32f =3D cpu->cfg.ext_zve32f;
-    ctx->ext_zve64f =3D cpu->cfg.ext_zve64f;
-    ctx->vlen =3D cpu->cfg.vlen;
-    ctx->elen =3D cpu->cfg.elen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
     ctx->mstatus_hs_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 3cd1b3f877..f1342f30f8 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -806,7 +806,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence =
*a)
=20
 static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 {
-    if (!ctx->ext_ifencei) {
+    if (!ctx->cfg_ptr->ext_ifencei) {
         return false;
     }
=20
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f85a9e83b4..275fded6e4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -74,7 +74,7 @@ static bool require_zve32f(DisasContext *s)
     }
=20
     /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve32f ? s->sew <=3D MO_32 : true;
+    return s->cfg_ptr->ext_zve32f ? s->sew <=3D MO_32 : true;
 }
=20
 static bool require_scale_zve32f(DisasContext *s)
@@ -85,7 +85,7 @@ static bool require_scale_zve32f(DisasContext *s)
     }
=20
     /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <=3D MO_16 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <=3D MO_16 : true;
 }
=20
 static bool require_zve64f(DisasContext *s)
@@ -96,7 +96,7 @@ static bool require_zve64f(DisasContext *s)
     }
=20
     /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <=3D MO_32 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <=3D MO_32 : true;
 }
=20
 static bool require_scale_zve64f(DisasContext *s)
@@ -107,7 +107,7 @@ static bool require_scale_zve64f(DisasContext *s)
     }
=20
     /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <=3D MO_16 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <=3D MO_16 : true;
 }
=20
 /* Destination vector register group cannot overlap source mask register=
. */
@@ -174,7 +174,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
     TCGv s1, dst;
=20
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
+          s->cfg_ptr->ext_zve64f)) {
         return false;
     }
=20
@@ -210,7 +211,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
     TCGv dst;
=20
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
+          s->cfg_ptr->ext_zve64f)) {
         return false;
     }
=20
@@ -248,7 +250,7 @@ static bool trans_vsetivli(DisasContext *s, arg_vseti=
vli *a)
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-    return offsetof(CPURISCVState, vreg) + reg * s->vlen / 8;
+    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlen / 8;
 }
=20
 /* check functions */
@@ -318,7 +320,8 @@ static bool vext_check_st_index(DisasContext *s, int =
vd, int vs2, int nf,
      * when XLEN=3D32. (Section 18.2)
      */
     if (get_xl(s) =3D=3D MXL_RV32) {
-        ret &=3D (!has_ext(s, RVV) && s->ext_zve64f ? eew !=3D MO_64 : t=
rue);
+        ret &=3D (!has_ext(s, RVV) &&
+                s->cfg_ptr->ext_zve64f ? eew !=3D MO_64 : true);
     }
=20
     return ret;
@@ -454,7 +457,7 @@ static bool vext_wide_check_common(DisasContext *s, i=
nt vd, int vm)
 {
     return (s->lmul <=3D 2) &&
            (s->sew < MO_64) &&
-           ((s->sew + 1) <=3D (s->elen >> 4)) &&
+           ((s->sew + 1) <=3D (s->cfg_ptr->elen >> 4)) &&
            require_align(vd, s->lmul + 1) &&
            require_vm(vm, vd);
 }
@@ -482,7 +485,7 @@ static bool vext_narrow_check_common(DisasContext *s,=
 int vd, int vs2,
 {
     return (s->lmul <=3D 2) &&
            (s->sew < MO_64) &&
-           ((s->sew + 1) <=3D (s->elen >> 4)) &&
+           ((s->sew + 1) <=3D (s->cfg_ptr->elen >> 4)) &&
            require_align(vs2, s->lmul + 1) &&
            require_align(vd, s->lmul) &&
            require_vm(vm, vd);
@@ -661,7 +664,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -819,7 +823,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
     mask =3D tcg_temp_new_ptr();
     base =3D get_gpr(s, rs1, EXT_NONE);
     stride =3D get_gpr(s, rs2, EXT_NONE);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -925,7 +930,8 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
     mask =3D tcg_temp_new_ptr();
     index =3D tcg_temp_new_ptr();
     base =3D get_gpr(s, rs1, EXT_NONE);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
@@ -1065,7 +1071,8 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     base =3D get_gpr(s, rs1, EXT_NONE);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -1120,7 +1127,8 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t =
rs1, uint32_t nf,
=20
     uint32_t data =3D FIELD_DP32(0, VDATA, NF, nf);
     dest =3D tcg_temp_new_ptr();
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     base =3D get_gpr(s, rs1, EXT_NONE);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -1185,7 +1193,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 static inline uint32_t MAXSZ(DisasContext *s)
 {
     int scale =3D s->lmul - 3;
-    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
 }
=20
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
@@ -1220,7 +1228,8 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+                           cpu_env, s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8, data, fn);
     }
     mark_vs_dirty(s);
     gen_set_label(over);
@@ -1262,7 +1271,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1425,7 +1435,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1508,7 +1519,8 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           cpu_env, s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8,
                            data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -1587,7 +1599,8 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+                           cpu_env, s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -1663,7 +1676,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -1843,7 +1857,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -1963,7 +1978,8 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmr=
r *a)
      * are not included for EEW=3D64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+           (!has_ext(s, RVV) &&
+            s->cfg_ptr->ext_zve64f ? s->sew !=3D MO_64 : true);
 }
=20
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -1976,7 +1992,8 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmr=
r *a)
      * are not included for EEW=3D64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+           (!has_ext(s, RVV) &&
+            s->cfg_ptr->ext_zve64f ? s->sew !=3D MO_64 : true);
 }
=20
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2046,7 +2063,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, s->vlen / 8, s->vlen / 8, data,
+                               cpu_env, s->cfg_ptr->vlen / 8,
+                               s->cfg_ptr->vlen / 8, data,
                                fns[s->sew]);
             gen_set_label(over);
         }
@@ -2083,7 +2101,8 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
             };
=20
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
+            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                              s->cfg_ptr->vlen / 8, data=
));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
=20
@@ -2123,7 +2142,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
=20
             s1 =3D tcg_constant_i64(simm);
             dest =3D tcg_temp_new_ptr();
-            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
+            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                              s->cfg_ptr->vlen / 8, data=
));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
=20
@@ -2176,7 +2196,8 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmr=
r *a)
      * for EEW=3D64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+           (!has_ext(s, RVV) &&
+            s->cfg_ptr->ext_zve64f ? s->sew !=3D MO_64 : true);
 }
=20
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2187,7 +2208,8 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmr=
r *a)
      * for EEW=3D64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+           (!has_ext(s, RVV) &&
+            s->cfg_ptr->ext_zve64f ? s->sew !=3D MO_64 : true);
 }
=20
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
@@ -2275,7 +2297,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2302,7 +2325,8 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
+    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                      s->cfg_ptr->vlen / 8, data));
=20
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -2391,7 +2415,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
-                           s->vlen / 8, s->vlen / 8, data,       \
+                           s->cfg_ptr->vlen / 8,                 \
+                           s->cfg_ptr->vlen / 8, data,           \
                            fns[s->sew - 1]);                     \
         mark_vs_dirty(s);                                        \
         gen_set_label(over);                                     \
@@ -2464,7 +2489,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2583,7 +2609,8 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
-                           s->vlen / 8, s->vlen / 8, data, fn);
+                           s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -2696,7 +2723,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
=20
             dest =3D tcg_temp_new_ptr();
-            desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
+            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                              s->cfg_ptr->vlen / 8, data=
));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
=20
             fns[s->sew - 1](dest, t1, cpu_env, desc);
@@ -2782,7 +2810,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2831,7 +2860,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2896,7 +2926,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2947,7 +2978,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data,             \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2986,7 +3018,7 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) && (s->sew < MO_64) &&
-           ((s->sew + 1) <=3D (s->elen >> 4));
+           ((s->sew + 1) <=3D (s->cfg_ptr->elen >> 4));
 }
=20
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
@@ -3034,7 +3066,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data, fn);    \
+                           s->cfg_ptr->vlen / 8,                   \
+                           s->cfg_ptr->vlen / 8, data, fn);        \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
@@ -3067,7 +3100,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr =
*a)
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
         dst =3D dest_gpr(s, a->rd);
-        desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
+        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                          s->cfg_ptr->vlen / 8, data));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -3099,7 +3133,8 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr=
 *a)
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
         dst =3D dest_gpr(s, a->rd);
-        desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
+        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
+                                          s->cfg_ptr->vlen / 8, data));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -3134,7 +3169,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           cpu_env, s->vlen / 8, s->vlen / 8,      \
+                           cpu_env, s->cfg_ptr->vlen / 8,          \
+                           s->cfg_ptr->vlen / 8,                   \
                            data, fn);                              \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -3174,7 +3210,8 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
         };
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
-                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
+                           s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8, data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -3200,7 +3237,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
             gen_helper_vid_v_w, gen_helper_vid_v_d,
         };
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           cpu_env, s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8,
                            data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3554,7 +3592,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
=20
     if (a->vm && s->vl_eq_vlmax) {
         int scale =3D s->lmul - (s->sew + 3);
-        int vlmax =3D scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        int vlmax =3D scale < 0 ?
+                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
=20
         if (a->rs1 =3D=3D 0) {
@@ -3586,7 +3625,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
=20
     if (a->vm && s->vl_eq_vlmax) {
         int scale =3D s->lmul - (s->sew + 3);
-        int vlmax =3D scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        int vlmax =3D scale < 0 ?
+                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
         if (a->rs1 >=3D vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
@@ -3638,7 +3678,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data,
+                           cpu_env, s->cfg_ptr->vlen / 8,
+                           s->cfg_ptr->vlen / 8, data,
                            fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3657,7 +3698,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAM=
E * a)               \
     if (require_rvv(s) &&                                               =
\
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  =
\
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 =
\
-        uint32_t maxsz =3D (s->vlen >> 3) * LEN;                        =
  \
+        uint32_t maxsz =3D (s->cfg_ptr->vlen >> 3) * LEN;               =
  \
         if (s->vstart =3D=3D 0) {                                       =
    \
             /* EEW =3D 8 */                                             =
  \
             tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  =
\
@@ -3742,7 +3783,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
-                       s->vlen / 8, s->vlen / 8, data, fn);
+                       s->cfg_ptr->vlen / 8,
+                       s->cfg_ptr->vlen / 8, data, fn);
=20
     mark_vs_dirty(s);
     gen_set_label(over);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 5a7cac8958..608c51da2c 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -17,13 +17,13 @@
  */
=20
 #define REQUIRE_ZFH(ctx) do { \
-    if (!ctx->ext_zfh) {      \
+    if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
 } while (0)
=20
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
-    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
+    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
 } while (0)
--=20
2.34.1


