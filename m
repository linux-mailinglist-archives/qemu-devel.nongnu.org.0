Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6473C9C4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:13:01 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haei3-0006v3-15
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39109)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007DU-IU
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePp-0007MJ-Ar
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40880)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePl-0007IR-Pg
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so2373827wmj.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1mXK/eH5N64QkDhmnkelnMmCB2hbh3lAb5CdjVow+A=;
 b=wE5MdMLSoUyrnoFfk4BadfOCp01wtILFUTTZuOW+3rjmHKgqowsvNeoOlh5ahbEim9
 jbHv5S5R8QPb8ajTlWVT+8EvHzQQw4xH+Jmhl8TU+4y5X4+tWsEabAzXPeNEpfl44kox
 cRMxn2C1r02sbBPp1vSReoAKGaPHsvfTzL3eDp+I1Po5uNPjRyW32Ngms3MTqlc9WrFW
 gdpqYfva0PrQ5Jz/rZmSb33mdjVR9hZnijg8Hnq6p6eWlegPbNysGAXKjThi0R0pRr6g
 1KxXPIig23UrCvzMGIBF+gz+WNybVVeRi5Qmaj0sLq9Dl1hp/vsLIuMCmdo2xZxaDb2w
 prSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1mXK/eH5N64QkDhmnkelnMmCB2hbh3lAb5CdjVow+A=;
 b=VJRD/rvMwhTzECjbVyAR6sN6gpA/0CJVWzu92AuCQm1/6puHD1pLh5ZpF8tQyzxFGr
 4iRXVO6jnKL+G4FxPi7CVNSKfA1Iok2za69ESLUgTQlc3zGl5RZF88YD9SKvKQgux1a3
 +VBNlMEIcVWpR5bbBZAOQeW1Tu8D+kjh6gcoTK6Ju0wgcjKoM9AcH0GV/Y80GF5Xi378
 eOdtGIfPax+E+N3KkAENEITc+VdjII2fvymDzYGXsV530diRIdvvbudeaxxQ+oVOwW6d
 frPAQjM2RyjKhQ8bJHOa10nlRl36SGMcrng6F7eVxm4zk2SnLPbheph3bmJMzPAbeX55
 IPAw==
X-Gm-Message-State: APjAAAV6oVGhpVf/ZeKWSdRTxvzIuSJnEc1/4Bn3J/o2i1fP76H6JCQK
 fBSqDp6PTTnvqHVrWhA2VX9jlw==
X-Google-Smtp-Source: APXvYqwl5Y6zCtgh4q0L/1s473oAQTiWmiz1d6DRackuz91pcjAY/acqXyjd3+BG7NGqZcHxsMtniQ==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr17207611wmg.5.1560250444483;
 Tue, 11 Jun 2019 03:54:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:19 +0100
Message-Id: <20190611105351.9871-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v2 10/42] target/arm: Move the VFP trans_*
 functions to translate-vfp.inc.c
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the trans_*() functions we've just created from translate.c
to translate-vfp.inc.c. This is pure code motion with no textual
changes (this can be checked with 'git show --color-moved').

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 337 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 337 ---------------------------------
 2 files changed, 337 insertions(+), 337 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index f7535138d0f..2f070a6e0d9 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -138,3 +138,340 @@ static bool vfp_access_check(DisasContext *s)
 {
     return full_vfp_access_check(s, false);
 }
+
+static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
+{
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+
+    if (!dc_isar_feature(aa32_vsel, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (dp) {
+        TCGv_i64 frn, frm, dest;
+        TCGv_i64 tmp, zero, zf, nf, vf;
+
+        zero = tcg_const_i64(0);
+
+        frn = tcg_temp_new_i64();
+        frm = tcg_temp_new_i64();
+        dest = tcg_temp_new_i64();
+
+        zf = tcg_temp_new_i64();
+        nf = tcg_temp_new_i64();
+        vf = tcg_temp_new_i64();
+
+        tcg_gen_extu_i32_i64(zf, cpu_ZF);
+        tcg_gen_ext_i32_i64(nf, cpu_NF);
+        tcg_gen_ext_i32_i64(vf, cpu_VF);
+
+        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        switch (a->cc) {
+        case 0: /* eq: Z */
+            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
+                                frn, frm);
+            break;
+        case 1: /* vs: V */
+            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero,
+                                frn, frm);
+            break;
+        case 2: /* ge: N == V -> N ^ V == 0 */
+            tmp = tcg_temp_new_i64();
+            tcg_gen_xor_i64(tmp, vf, nf);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
+                                frn, frm);
+            tcg_temp_free_i64(tmp);
+            break;
+        case 3: /* gt: !Z && N == V */
+            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero,
+                                frn, frm);
+            tmp = tcg_temp_new_i64();
+            tcg_gen_xor_i64(tmp, vf, nf);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
+                                dest, frm);
+            tcg_temp_free_i64(tmp);
+            break;
+        }
+        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(frn);
+        tcg_temp_free_i64(frm);
+        tcg_temp_free_i64(dest);
+
+        tcg_temp_free_i64(zf);
+        tcg_temp_free_i64(nf);
+        tcg_temp_free_i64(vf);
+
+        tcg_temp_free_i64(zero);
+    } else {
+        TCGv_i32 frn, frm, dest;
+        TCGv_i32 tmp, zero;
+
+        zero = tcg_const_i32(0);
+
+        frn = tcg_temp_new_i32();
+        frm = tcg_temp_new_i32();
+        dest = tcg_temp_new_i32();
+        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        switch (a->cc) {
+        case 0: /* eq: Z */
+            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
+                                frn, frm);
+            break;
+        case 1: /* vs: V */
+            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero,
+                                frn, frm);
+            break;
+        case 2: /* ge: N == V -> N ^ V == 0 */
+            tmp = tcg_temp_new_i32();
+            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
+                                frn, frm);
+            tcg_temp_free_i32(tmp);
+            break;
+        case 3: /* gt: !Z && N == V */
+            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero,
+                                frn, frm);
+            tmp = tcg_temp_new_i32();
+            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
+                                dest, frm);
+            tcg_temp_free_i32(tmp);
+            break;
+        }
+        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(frn);
+        tcg_temp_free_i32(frm);
+        tcg_temp_free_i32(dest);
+
+        tcg_temp_free_i32(zero);
+    }
+
+    return true;
+}
+
+static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
+{
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+    bool vmin = a->op;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    if (dp) {
+        TCGv_i64 frn, frm, dest;
+
+        frn = tcg_temp_new_i64();
+        frm = tcg_temp_new_i64();
+        dest = tcg_temp_new_i64();
+
+        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
+        if (vmin) {
+            gen_helper_vfp_minnumd(dest, frn, frm, fpst);
+        } else {
+            gen_helper_vfp_maxnumd(dest, frn, frm, fpst);
+        }
+        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(frn);
+        tcg_temp_free_i64(frm);
+        tcg_temp_free_i64(dest);
+    } else {
+        TCGv_i32 frn, frm, dest;
+
+        frn = tcg_temp_new_i32();
+        frm = tcg_temp_new_i32();
+        dest = tcg_temp_new_i32();
+
+        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
+        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
+        if (vmin) {
+            gen_helper_vfp_minnums(dest, frn, frm, fpst);
+        } else {
+            gen_helper_vfp_maxnums(dest, frn, frm, fpst);
+        }
+        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(frn);
+        tcg_temp_free_i32(frm);
+        tcg_temp_free_i32(dest);
+    }
+
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+/*
+ * Table for converting the most common AArch32 encoding of
+ * rounding mode to arm_fprounding order (which matches the
+ * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
+ */
+static const uint8_t fp_decode_rm[] = {
+    FPROUNDING_TIEAWAY,
+    FPROUNDING_TIEEVEN,
+    FPROUNDING_POSINF,
+    FPROUNDING_NEGINF,
+};
+
+static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
+{
+    uint32_t rd, rm;
+    bool dp = a->dp;
+    TCGv_ptr fpst;
+    TCGv_i32 tcg_rmode;
+    int rounding = fp_decode_rm[a->rm];
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+
+    if (dp) {
+        TCGv_i64 tcg_op;
+        TCGv_i64 tcg_res;
+        tcg_op = tcg_temp_new_i64();
+        tcg_res = tcg_temp_new_i64();
+        tcg_gen_ld_f64(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        gen_helper_rintd(tcg_res, tcg_op, fpst);
+        tcg_gen_st_f64(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i64(tcg_op);
+        tcg_temp_free_i64(tcg_res);
+    } else {
+        TCGv_i32 tcg_op;
+        TCGv_i32 tcg_res;
+        tcg_op = tcg_temp_new_i32();
+        tcg_res = tcg_temp_new_i32();
+        tcg_gen_ld_f32(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
+        gen_helper_rints(tcg_res, tcg_op, fpst);
+        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
+        tcg_temp_free_i32(tcg_op);
+        tcg_temp_free_i32(tcg_res);
+    }
+
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_temp_free_i32(tcg_rmode);
+
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
+{
+    uint32_t rd, rm;
+    bool dp = a->dp;
+    TCGv_ptr fpst;
+    TCGv_i32 tcg_rmode, tcg_shift;
+    int rounding = fp_decode_rm[a->rm];
+    bool is_signed = a->op;
+
+    if (!dc_isar_feature(aa32_vcvt_dr, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
+
+    tcg_shift = tcg_const_i32(0);
+
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+
+    if (dp) {
+        TCGv_i64 tcg_double, tcg_res;
+        TCGv_i32 tcg_tmp;
+        tcg_double = tcg_temp_new_i64();
+        tcg_res = tcg_temp_new_i64();
+        tcg_tmp = tcg_temp_new_i32();
+        tcg_gen_ld_f64(tcg_double, cpu_env, vfp_reg_offset(1, rm));
+        if (is_signed) {
+            gen_helper_vfp_tosld(tcg_res, tcg_double, tcg_shift, fpst);
+        } else {
+            gen_helper_vfp_tould(tcg_res, tcg_double, tcg_shift, fpst);
+        }
+        tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
+        tcg_gen_st_f32(tcg_tmp, cpu_env, vfp_reg_offset(0, rd));
+        tcg_temp_free_i32(tcg_tmp);
+        tcg_temp_free_i64(tcg_res);
+        tcg_temp_free_i64(tcg_double);
+    } else {
+        TCGv_i32 tcg_single, tcg_res;
+        tcg_single = tcg_temp_new_i32();
+        tcg_res = tcg_temp_new_i32();
+        tcg_gen_ld_f32(tcg_single, cpu_env, vfp_reg_offset(0, rm));
+        if (is_signed) {
+            gen_helper_vfp_tosls(tcg_res, tcg_single, tcg_shift, fpst);
+        } else {
+            gen_helper_vfp_touls(tcg_res, tcg_single, tcg_shift, fpst);
+        }
+        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(0, rd));
+        tcg_temp_free_i32(tcg_res);
+        tcg_temp_free_i32(tcg_single);
+    }
+
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_temp_free_i32(tcg_rmode);
+
+    tcg_temp_free_i32(tcg_shift);
+
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6da472dbca8..e42a21d4aa5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3076,343 +3076,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_temp_free_i32(tmp);
 }
 
-static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
-{
-    uint32_t rd, rn, rm;
-    bool dp = a->dp;
-
-    if (!dc_isar_feature(aa32_vsel, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vn | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rn = a->vn;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    if (dp) {
-        TCGv_i64 frn, frm, dest;
-        TCGv_i64 tmp, zero, zf, nf, vf;
-
-        zero = tcg_const_i64(0);
-
-        frn = tcg_temp_new_i64();
-        frm = tcg_temp_new_i64();
-        dest = tcg_temp_new_i64();
-
-        zf = tcg_temp_new_i64();
-        nf = tcg_temp_new_i64();
-        vf = tcg_temp_new_i64();
-
-        tcg_gen_extu_i32_i64(zf, cpu_ZF);
-        tcg_gen_ext_i32_i64(nf, cpu_NF);
-        tcg_gen_ext_i32_i64(vf, cpu_VF);
-
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (a->cc) {
-        case 0: /* eq: Z */
-            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
-                                frn, frm);
-            break;
-        case 1: /* vs: V */
-            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero,
-                                frn, frm);
-            break;
-        case 2: /* ge: N == V -> N ^ V == 0 */
-            tmp = tcg_temp_new_i64();
-            tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
-            tcg_temp_free_i64(tmp);
-            break;
-        case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero,
-                                frn, frm);
-            tmp = tcg_temp_new_i64();
-            tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
-            tcg_temp_free_i64(tmp);
-            break;
-        }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(frn);
-        tcg_temp_free_i64(frm);
-        tcg_temp_free_i64(dest);
-
-        tcg_temp_free_i64(zf);
-        tcg_temp_free_i64(nf);
-        tcg_temp_free_i64(vf);
-
-        tcg_temp_free_i64(zero);
-    } else {
-        TCGv_i32 frn, frm, dest;
-        TCGv_i32 tmp, zero;
-
-        zero = tcg_const_i32(0);
-
-        frn = tcg_temp_new_i32();
-        frm = tcg_temp_new_i32();
-        dest = tcg_temp_new_i32();
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (a->cc) {
-        case 0: /* eq: Z */
-            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
-                                frn, frm);
-            break;
-        case 1: /* vs: V */
-            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero,
-                                frn, frm);
-            break;
-        case 2: /* ge: N == V -> N ^ V == 0 */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
-            tcg_temp_free_i32(tmp);
-            break;
-        case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero,
-                                frn, frm);
-            tmp = tcg_temp_new_i32();
-            tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
-            tcg_temp_free_i32(tmp);
-            break;
-        }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(frn);
-        tcg_temp_free_i32(frm);
-        tcg_temp_free_i32(dest);
-
-        tcg_temp_free_i32(zero);
-    }
-
-    return true;
-}
-
-static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
-{
-    uint32_t rd, rn, rm;
-    bool dp = a->dp;
-    bool vmin = a->op;
-    TCGv_ptr fpst;
-
-    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vn | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rn = a->vn;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    if (dp) {
-        TCGv_i64 frn, frm, dest;
-
-        frn = tcg_temp_new_i64();
-        frm = tcg_temp_new_i64();
-        dest = tcg_temp_new_i64();
-
-        tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
-        if (vmin) {
-            gen_helper_vfp_minnumd(dest, frn, frm, fpst);
-        } else {
-            gen_helper_vfp_maxnumd(dest, frn, frm, fpst);
-        }
-        tcg_gen_st_f64(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(frn);
-        tcg_temp_free_i64(frm);
-        tcg_temp_free_i64(dest);
-    } else {
-        TCGv_i32 frn, frm, dest;
-
-        frn = tcg_temp_new_i32();
-        frm = tcg_temp_new_i32();
-        dest = tcg_temp_new_i32();
-
-        tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
-        tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
-        if (vmin) {
-            gen_helper_vfp_minnums(dest, frn, frm, fpst);
-        } else {
-            gen_helper_vfp_maxnums(dest, frn, frm, fpst);
-        }
-        tcg_gen_st_f32(dest, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(frn);
-        tcg_temp_free_i32(frm);
-        tcg_temp_free_i32(dest);
-    }
-
-    tcg_temp_free_ptr(fpst);
-    return true;
-}
-
-/*
- * Table for converting the most common AArch32 encoding of
- * rounding mode to arm_fprounding order (which matches the
- * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
- */
-static const uint8_t fp_decode_rm[] = {
-    FPROUNDING_TIEAWAY,
-    FPROUNDING_TIEEVEN,
-    FPROUNDING_POSINF,
-    FPROUNDING_NEGINF,
-};
-
-static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
-{
-    uint32_t rd, rm;
-    bool dp = a->dp;
-    TCGv_ptr fpst;
-    TCGv_i32 tcg_rmode;
-    int rounding = fp_decode_rm[a->rm];
-
-    if (!dc_isar_feature(aa32_vrint, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
-        ((a->vm | a->vd) & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-
-    if (dp) {
-        TCGv_i64 tcg_op;
-        TCGv_i64 tcg_res;
-        tcg_op = tcg_temp_new_i64();
-        tcg_res = tcg_temp_new_i64();
-        tcg_gen_ld_f64(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
-        gen_helper_rintd(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f64(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i64(tcg_op);
-        tcg_temp_free_i64(tcg_res);
-    } else {
-        TCGv_i32 tcg_op;
-        TCGv_i32 tcg_res;
-        tcg_op = tcg_temp_new_i32();
-        tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_op, cpu_env, vfp_reg_offset(dp, rm));
-        gen_helper_rints(tcg_res, tcg_op, fpst);
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(dp, rd));
-        tcg_temp_free_i32(tcg_op);
-        tcg_temp_free_i32(tcg_res);
-    }
-
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_ptr(fpst);
-    return true;
-}
-
-static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
-{
-    uint32_t rd, rm;
-    bool dp = a->dp;
-    TCGv_ptr fpst;
-    TCGv_i32 tcg_rmode, tcg_shift;
-    int rounding = fp_decode_rm[a->rm];
-    bool is_signed = a->op;
-
-    if (!dc_isar_feature(aa32_vcvt_dr, s)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
-        return false;
-    }
-    rd = a->vd;
-    rm = a->vm;
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fpst = get_fpstatus_ptr(0);
-
-    tcg_shift = tcg_const_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-
-    if (dp) {
-        TCGv_i64 tcg_double, tcg_res;
-        TCGv_i32 tcg_tmp;
-        tcg_double = tcg_temp_new_i64();
-        tcg_res = tcg_temp_new_i64();
-        tcg_tmp = tcg_temp_new_i32();
-        tcg_gen_ld_f64(tcg_double, cpu_env, vfp_reg_offset(1, rm));
-        if (is_signed) {
-            gen_helper_vfp_tosld(tcg_res, tcg_double, tcg_shift, fpst);
-        } else {
-            gen_helper_vfp_tould(tcg_res, tcg_double, tcg_shift, fpst);
-        }
-        tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
-        tcg_gen_st_f32(tcg_tmp, cpu_env, vfp_reg_offset(0, rd));
-        tcg_temp_free_i32(tcg_tmp);
-        tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_double);
-    } else {
-        TCGv_i32 tcg_single, tcg_res;
-        tcg_single = tcg_temp_new_i32();
-        tcg_res = tcg_temp_new_i32();
-        tcg_gen_ld_f32(tcg_single, cpu_env, vfp_reg_offset(0, rm));
-        if (is_signed) {
-            gen_helper_vfp_tosls(tcg_res, tcg_single, tcg_shift, fpst);
-        } else {
-            gen_helper_vfp_touls(tcg_res, tcg_single, tcg_shift, fpst);
-        }
-        tcg_gen_st_f32(tcg_res, cpu_env, vfp_reg_offset(0, rd));
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_single);
-    }
-
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_i32(tcg_shift);
-
-    tcg_temp_free_ptr(fpst);
-
-    return true;
-}
-
 /*
  * Disassemble a VFP instruction.  Returns nonzero if an error occurred
  * (ie. an undefined instruction).
-- 
2.20.1


