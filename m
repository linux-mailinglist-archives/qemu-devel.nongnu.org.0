Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993447A4B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:44:55 +0100 (CET)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBTi-0000f1-7j
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlO-0001rV-9t
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlL-0008AH-GS
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976343; x=1671512343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UYraNBQTMsSNKy8sV9yGh9xqL7Huk9F7pcI0HdybJ5c=;
 b=EzhMnYKirh03dS7HkQ1E6eSsS1HVtOU1swxESGPhx+Zr8m4JptP/qzYQ
 V5hzAcQT9o8g9aHh5kGDs9f1tD5D/jluDr1qcNGOz4H4HmztnnpBH/iz+
 zlAzcDlibpyMy0/WQYL2twKkkMCZflh34vHp8FrbdHE3XrSr19kuam5+h
 WULeG/I0wlrplxex19s7cvHmXMxbtNWH1BEe521hAow6/7C9KBD5+54FA
 KVEoW4SzrZZ0JIE6vqf84rasXtQ+pYNP8ODmokeqGZ4it45FFTqXegywe
 qqIEDopYPzgdk+Ghva+CfyMu3bLdQkDW0MwZ5dciCVOlWl3TTFve92gLJ g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661946"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:02 +0800
IronPort-SDR: VjDWsUyAQqaMTuIDw7q5ZAuObpFReG5mUoTmwN4K4LfCbQ86uiB9eP9SJQP30QfUC/LBV6gVYV
 SJWqufzWtz63UWbRCa9MsJopiyy+HxXTJOA+ZY+aYp5Q5Ba2Jln90nb/8fL8jTppA7TOvIsVXW
 4yc/BkMZE9o6gwVP0vdvw3KRL7/lrfMPGmXiYWlTkQ9+rNu8m0iwGL+Bzmuj9yr8JUvRH/w7jo
 z93nSp0Ps8mFnqLb9FmldMcT/n1flhbzKN10D0sJ049mMDwSh+Lse7TkRFXu27/Spxy4FMnQQm
 etUGNk+WuHsTfgpUPAfjjt8b
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:52 -0800
IronPort-SDR: HqfEq05L+iUwRf1WIjmaXeztCcuxdLFL7rpW6GqNVFgji8Q5brY2jgxo2ykqH9550iKFq1L9UX
 uOogO0eeLSBDYsNI4lDaOY6hkYpOkkz0oF7i5UJX0tvgIcTDQovx/q4lBMFo8eiJjk1gb31jxV
 ZBjuLHtpfI5T9z0P5HGGwADVikfZzNBRbMEt/4DD94ZGW3mJDrwojfbX97eFdIuy+nX+9s2KGV
 YflXm7PPOEq6496OQ3RZ75GyHSCcW1XOu40p5nDfWW5MB7cJJWryDIwh+kH16O8hWdb7ypLQDI
 G1Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6Z3TM5z1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976341; x=1642568342; bh=UYraNBQTMsSNKy8sV9
 yGh9xqL7Huk9F7pcI0HdybJ5c=; b=nFYK6ZL9j9XYnyax3e5C770thDBqfACYXf
 x6HkEFwe7TiYve86/+OLi5zO6xYdpPv/mWVhRa30HOfNYA3CLM5DohFuqxhbclyv
 6qROuHQTuSt/w3tClK9tjQ7lwEehKL1kHNAcKtAWYZvuf3T1mB/E06aRpPDwg7sJ
 Sf76qWasDYDbKheFzmBGVqx8yvS2jh0OcX2g6CsN0JdKFzzzeldQe02nepp0gJdr
 7KIG6XANmrA/6lDwxF0GIeD0ZNU8cPjYxaahrl4oocvPKNjlT9VHLmRrsgkB92Cz
 AsKumD6UgZWHP/Bq/w2p5U30XAYG9nEaVmXkRPuHJcqYHzVVWHwQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id im6Xx8LzGItG for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:01 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6V3PDBz1RtVG;
 Sun, 19 Dec 2021 20:58:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/88] target/riscv: introduce more imm value modes in
 translator functions
Date: Mon, 20 Dec 2021 14:56:01 +1000
Message-Id: <20211220045705.62174-25-alistair.francis@opensource.wdc.com>
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

Immediate value in translator function is extended not only
zero-extended and sign-extended but with more modes to be applicable
with multiple formats of vector instructions.

* IMM_ZX:         Zero-extended
* IMM_SX:         Sign-extended
* IMM_TRUNC_SEW:  Truncate to log(SEW) bit
* IMM_TRUNC_2SEW: Truncate to log(2*SEW) bit

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-17-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 115 ++++++++++++++----------
 1 file changed, 66 insertions(+), 49 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index bef37dd888..66273afb53 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1313,8 +1313,32 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint=
32_t dofs, uint32_t aofs,
=20
 GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
=20
+typedef enum {
+    IMM_ZX,         /* Zero-extended */
+    IMM_SX,         /* Sign-extended */
+    IMM_TRUNC_SEW,  /* Truncate to log(SEW) bits */
+    IMM_TRUNC_2SEW, /* Truncate to log(2*SEW) bits */
+} imm_mode_t;
+
+static int64_t extract_imm(DisasContext *s, uint32_t imm, imm_mode_t imm=
_mode)
+{
+    switch (imm_mode) {
+    case IMM_ZX:
+        return extract64(imm, 0, 5);
+    case IMM_SX:
+        return sextract64(imm, 0, 5);
+    case IMM_TRUNC_SEW:
+        return extract64(imm, 0, s->sew + 3);
+    case IMM_TRUNC_2SEW:
+        return extract64(imm, 0, s->sew + 4);
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_=
t vm,
-                        gen_helper_opivx *fn, DisasContext *s, int zx)
+                        gen_helper_opivx *fn, DisasContext *s,
+                        imm_mode_t imm_mode)
 {
     TCGv_ptr dest, src2, mask;
     TCGv src1;
@@ -1327,11 +1351,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm,=
 uint32_t vs2, uint32_t vm,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
-    if (zx) {
-        src1 =3D tcg_constant_tl(imm);
-    } else {
-        src1 =3D tcg_constant_tl(sextract64(imm, 0, 5));
-    }
+    src1 =3D tcg_constant_tl(extract_imm(s, imm, imm_mode));
+
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
@@ -1355,28 +1376,23 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint=
32_t, int64_t,
=20
 static inline bool
 do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
-              gen_helper_opivx *fn, int zx)
+              gen_helper_opivx *fn, imm_mode_t imm_mode)
 {
     if (!opivx_check(s, a)) {
         return false;
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
-        if (zx) {
-            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
-                    extract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
-        } else {
-            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
-                    sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
-        }
+        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
         mark_vs_dirty(s);
         return true;
     }
-    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, imm_mode);
 }
=20
 /* OPIVI with GVEC IR */
-#define GEN_OPIVI_GVEC_TRANS(NAME, ZX, OPIVX, SUF) \
+#define GEN_OPIVI_GVEC_TRANS(NAME, IMM_MODE, OPIVX, SUF) \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 {                                                                  \
     static gen_helper_opivx * const fns[4] =3D {                     \
@@ -1384,10 +1400,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)             \
         gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
     };                                                             \
     return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
-                         fns[s->sew], ZX);                         \
+                         fns[s->sew], IMM_MODE);                   \
 }
=20
-GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
+GEN_OPIVI_GVEC_TRANS(vadd_vi, IMM_SX, vadd_vx, addi)
=20
 static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t ao=
fs,
                                int64_t c, uint32_t oprsz, uint32_t maxsz=
)
@@ -1396,7 +1412,7 @@ static void tcg_gen_gvec_rsubi(unsigned vece, uint3=
2_t dofs, uint32_t aofs,
     tcg_gen_gvec_rsubs(vece, dofs, aofs, tmp, oprsz, maxsz);
 }
=20
-GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
+GEN_OPIVI_GVEC_TRANS(vrsub_vi, IMM_SX, vrsub_vx, rsubi)
=20
 /* Vector Widening Integer Add/Subtract */
=20
@@ -1652,7 +1668,7 @@ GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
 GEN_OPIVX_TRANS(vmsbc_vxm, opivx_vmadc_check)
=20
 /* OPIVI without GVEC IR */
-#define GEN_OPIVI_TRANS(NAME, ZX, OPIVX, CHECK)                         =
 \
+#define GEN_OPIVI_TRANS(NAME, IMM_MODE, OPIVX, CHECK)                   =
 \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  =
 \
 {                                                                       =
 \
     if (CHECK(s, a)) {                                                  =
 \
@@ -1661,13 +1677,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)                   \
             gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,             =
 \
         };                                                              =
 \
         return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                =
 \
-                           fns[s->sew], s, ZX);                         =
 \
+                           fns[s->sew], s, IMM_MODE);                   =
 \
     }                                                                   =
 \
     return false;                                                       =
 \
 }
=20
-GEN_OPIVI_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
-GEN_OPIVI_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
+GEN_OPIVI_TRANS(vadc_vim, IMM_SX, vadc_vxm, opivx_vadc_check)
+GEN_OPIVI_TRANS(vmadc_vim, IMM_SX, vmadc_vxm, opivx_vmadc_check)
=20
 /* Vector Bitwise Logical Instructions */
 GEN_OPIVV_GVEC_TRANS(vand_vv, and)
@@ -1676,9 +1692,9 @@ GEN_OPIVV_GVEC_TRANS(vxor_vv, xor)
 GEN_OPIVX_GVEC_TRANS(vand_vx, ands)
 GEN_OPIVX_GVEC_TRANS(vor_vx,  ors)
 GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
-GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
-GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
-GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
+GEN_OPIVI_GVEC_TRANS(vand_vi, IMM_SX, vand_vx, andi)
+GEN_OPIVI_GVEC_TRANS(vor_vi, IMM_SX, vor_vx,  ori)
+GEN_OPIVI_GVEC_TRANS(vxor_vi, IMM_SX, vxor_vx, xori)
=20
 /* Vector Single-Width Bit Shift Instructions */
 GEN_OPIVV_GVEC_TRANS(vsll_vv,  shlv)
@@ -1726,9 +1742,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
=20
-GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
=20
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
@@ -1794,7 +1810,7 @@ GEN_OPIVX_NARROW_TRANS(vnsra_vx)
 GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
=20
 /* OPIVI with NARROW */
-#define GEN_OPIVI_NARROW_TRANS(NAME, ZX, OPIVX)                         =
 \
+#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                   =
 \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  =
 \
 {                                                                       =
 \
     if (opivx_narrow_check(s, a)) {                                     =
 \
@@ -1804,13 +1820,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)                   \
             gen_helper_##OPIVX##_w,                                     =
 \
         };                                                              =
 \
         return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                =
 \
-                           fns[s->sew], s, ZX);                         =
 \
+                           fns[s->sew], s, IMM_MODE);                   =
 \
     }                                                                   =
 \
     return false;                                                       =
 \
 }
=20
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, 1, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
+GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
+GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
=20
 /* Vector Integer Comparison Instructions */
 /*
@@ -1848,12 +1864,12 @@ GEN_OPIVX_TRANS(vmsle_vx, opivx_cmp_check)
 GEN_OPIVX_TRANS(vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
=20
-GEN_OPIVI_TRANS(vmseq_vi, 0, vmseq_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsne_vi, 0, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, 1, vmsleu_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsle_vi, 0, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, 1, vmsgtu_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgt_vi, 0, vmsgt_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
=20
 /* Vector Integer Min/Max Instructions */
 GEN_OPIVV_GVEC_TRANS(vminu_vv, umin)
@@ -2025,7 +2041,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
=20
 GEN_OPIVV_TRANS(vmerge_vvm, opivv_vadc_check)
 GEN_OPIVX_TRANS(vmerge_vxm, opivx_vadc_check)
-GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vadc_check)
+GEN_OPIVI_TRANS(vmerge_vim, IMM_SX, vmerge_vxm, opivx_vadc_check)
=20
 /*
  *** Vector Fixed-Point Arithmetic Instructions
@@ -2040,8 +2056,8 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
-GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
=20
 /* Vector Single-Width Averaging Add and Subtract */
 GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
@@ -2068,16 +2084,16 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
 GEN_OPIVV_NARROW_TRANS(vnclip_vv)
 GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
 GEN_OPIVX_NARROW_TRANS(vnclip_vx)
-GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
-GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
+GEN_OPIVI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
+GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
@@ -3051,7 +3067,7 @@ static bool slideup_check(DisasContext *s, arg_rmrr=
 *a)
=20
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
 GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
-GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
+GEN_OPIVI_TRANS(vslideup_vi, IMM_ZX, vslideup_vx, slideup_check)
=20
 static bool slidedown_check(DisasContext *s, arg_rmrr *a)
 {
@@ -3062,7 +3078,7 @@ static bool slidedown_check(DisasContext *s, arg_rm=
rr *a)
=20
 GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
-GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
+GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
=20
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
@@ -3141,7 +3157,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
             gen_helper_vrgather_vx_w, gen_helper_vrgather_vx_d
         };
-        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s,=
 1);
+        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew],
+                           s, IMM_ZX);
     }
     return true;
 }
--=20
2.31.1


