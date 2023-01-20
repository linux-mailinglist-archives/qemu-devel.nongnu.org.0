Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2254674E44
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1x-0003FW-4R; Fri, 20 Jan 2023 02:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1r-0002xc-PZ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:40 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1n-0004pU-WB
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200495; x=1705736495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7SUXXHsk115w6NotA000eLTiwAW407mCxAvfoZAmt8=;
 b=HAHlibSfWvPN1Dhef7ZxN5qVSQ8TIfBLJj9nXaRKU9G4X8rx/lo93iUk
 Ktv+VnSFGHyEBH5U/WlzNQqOrSl10MuHbVKi4sNz01fP2OZ6ETdzA8aJH
 /jYk4mER4qaH1c7uQ92aZiPBWhGv8fnUL1eWnlwvf5wy/nDlDsOsxP0Zi
 zlAT/GCvuyZF61cDT9WyqiweMyHFL773NffdFARJH0V3YOkz8gSTO7AyJ
 lTzsQajrNru8loCf5eyc5P9UIvkSbs+OmxOYVLIr7PiZmdwSRqZKvW8xg
 V7uRk05F3L80sLvLhn79ikArUXo6t+JseRN4rz/hruwIfGH7/6atbZiQ/ Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176769"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:34 +0800
IronPort-SDR: i7WrkKmj13Yw60Gzbje4nqTFKFcJl5h2iNnHoxbL8Cp/dr+qdoI48g8+bBMaWeHgJhfiZ/+Q/q
 ufsZLYbgteo9g6/WQnTzVUG6uZZEpzxn5KkU9dNiva0SXmY4d1TVzd0hOtA5drjkAC+s9jG2jI
 YY6EdjO4rDfaOvYxdjyR5S02h7z34JxH8iBp2zQ7ya2xOR/O5Ytu4ggkS2ydWGaOpU8C1gzyWQ
 DRylqrff5xpydcKTStqyXqtPWdpF6KpscV3j8FNMajrVFBfy2Cu51IkMi1Thvn0drNS1fPgRjR
 Za0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:12 -0800
IronPort-SDR: Xu68GPZIHi61sFc9m5oV8ACgE4yJh6Q/qQ5/CQBXOC2n/cxgcEAz24aYvu+1MZZghgeVRRLlNO
 KNQiI/ht/CkkNL7jBChwiuZ0Ath/pnpVeZut2V0YExL2/rrZl7t39RfwGnhy1fiSMqIumgRj/r
 QaS8Jqra7Spy7zoBJks1Q5Fi/Ok6pQi3+QlHGONS/LM4EF0VBYJZT/IMt37f+57hq3Fj7KIrib
 Xj2yFqn4b2vhSPJBV3g5VOX0Dfo1rfgzvOzSMh+kid0I68++pEx1r3uUU7RSIZBtkbWGfCQeTM
 5nY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyryB0Bjkz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200433; x=1676792434; bh=Q7SUXXHsk115w6NotA
 000eLTiwAW407mCxAvfoZAmt8=; b=Oe1tXcYKgYLITM3MBsN2SaNwZQ1wKllxar
 EoC7t2Opdz2bzhp0lxXcZtl3PqU9sAGgUkkHZ9NkQu4f+26UpxazycIGLxSdN55a
 CL4UWfvXkS0zsS8Tb5sRK7K9bqrA5XNQzQocYP1XdEJBEU4hkE2HIlrJRwjJrMbX
 A9HocHE5DQJN+wPuTOXv5tD46YqDFFESU9ra2ju9LiTZaZ6Pvih3hAyQpNApHQVW
 nVrVrS1ZKKKWYHhjhQWYs40o0VFb/H+Xe295fargS+f7qE3vELBMDvdIWJpobgGN
 yUYccDkg7TxWmk/auwGIxUvU/floZN1Kmuepxo/tO+PD+F6pG+kg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id adnr-s40hkFG for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry72Wkhz1Rwrq;
 Thu, 19 Jan 2023 23:40:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/37] target/riscv: Introduce helper_set_rounding_mode_chkfrm
Date: Fri, 20 Jan 2023 17:39:11 +1000
Message-Id: <20230120073913.1028407-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The new helper always validates the contents of FRM, even
if the new rounding mode is not DYN.  This is required by
the vector unit.

Track whether we've validated FRM separately from whether
we've updated fp_status with a given rounding mode, so that
we can elide calls correctly.

This partially reverts d6c4d3f2a69 which attempted the to do
the same thing, but with two calls to gen_set_rm(), which is
both inefficient and tickles an assertion in decode_save_opc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1441
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230115160657.3169274-2-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  1 +
 target/riscv/fpu_helper.c               | 37 +++++++++++++++++++++++++
 target/riscv/translate.c                | 19 +++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 24 +++-------------
 4 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..9792ab5086 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
=20
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, =
i32)
 DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
=20
 /* Floating Point - fused */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 5699c9517f..96817df8ef 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,43 @@ void helper_set_rounding_mode(CPURISCVState *env, uint=
32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
=20
+void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
+{
+    int softrm;
+
+    /* Always validate frm, even if rm !=3D DYN. */
+    if (unlikely(env->frm >=3D 5)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+    if (rm =3D=3D RISCV_FRM_DYN) {
+        rm =3D env->frm;
+    }
+    switch (rm) {
+    case RISCV_FRM_RNE:
+        softrm =3D float_round_nearest_even;
+        break;
+    case RISCV_FRM_RTZ:
+        softrm =3D float_round_to_zero;
+        break;
+    case RISCV_FRM_RDN:
+        softrm =3D float_round_down;
+        break;
+    case RISCV_FRM_RUP:
+        softrm =3D float_round_up;
+        break;
+    case RISCV_FRM_RMM:
+        softrm =3D float_round_ties_away;
+        break;
+    case RISCV_FRM_ROD:
+        softrm =3D float_round_to_odd;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    set_float_rounding_mode(softrm, &env->fp_status);
+}
+
 void helper_set_rod_rounding_mode(CPURISCVState *env)
 {
     set_float_rounding_mode(float_round_to_odd, &env->fp_status);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..493c3815e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -114,6 +114,8 @@ typedef struct DisasContext {
     bool pm_base_enabled;
     /* Use icount trigger for native debug */
     bool itrigger;
+    /* FRM is known to contain a valid value. */
+    bool frm_valid;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -674,12 +676,29 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         gen_helper_set_rod_rounding_mode(cpu_env);
         return;
     }
+    if (rm =3D=3D RISCV_FRM_DYN) {
+        /* The helper will return only if frm valid. */
+        ctx->frm_valid =3D true;
+    }
=20
     /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
     decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
=20
+static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
+{
+    if (ctx->frm =3D=3D rm && ctx->frm_valid) {
+        return;
+    }
+    ctx->frm =3D rm;
+    ctx->frm_valid =3D true;
+
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
+    gen_helper_set_rounding_mode_chkfrm(cpu_env, tcg_constant_i32(rm));
+}
+
 static int ex_plus_1(DisasContext *ctx, int nf)
 {
     return nf + 1;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index d455acedbf..bbb5c3a7b5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2679,13 +2679,9 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
-        if (rm !=3D RISCV_FRM_DYN) {
-            gen_set_rm(s, RISCV_FRM_DYN);
-        }
-
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
-        gen_set_rm(s, rm);
+        gen_set_rm_chkfrm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
@@ -2882,17 +2878,13 @@ static bool opffv_widen_check(DisasContext *s, ar=
g_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM !=3D RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] =3D {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3005,17 +2997,13 @@ static bool opffv_narrow_check(DisasContext *s, a=
rg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM !=3D RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] =3D {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3060,10 +3048,6 @@ static bool opxfv_narrow_check(DisasContext *s, ar=
g_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
-        if (FRM !=3D RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] =3D {            \
             gen_helper_##HELPER##_b,                               \
@@ -3071,7 +3055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
--=20
2.39.0


