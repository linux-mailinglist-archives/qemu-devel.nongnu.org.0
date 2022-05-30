Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65785386A4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:14:58 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviyn-0007Mv-Vd
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwf-0004CZ-Cb
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwb-0007S8-2P
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q21so4090949wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jcLKb+33IxapKiJvEnPjfrqxShYTJcg2+RTGcwFVY7g=;
 b=vtuJNF5xUV3U6ZfrWGporDyuB16DNDZlSDw3t+xpUJSkD5IJZQc+Q74Ju9sDU7gzab
 XZR1qTSrlRZLx6incX1f7xK9fOAgktz/G9i1daDvTJj9N867QFudxaAROwkvVX7BCOb6
 VmyMJpaVgOSltQbufCYdraxyd+LB7xNjsCnPY0Q3h4Gxdsqfyqqq6RQUtOpZiU1Wp9hn
 AiUFHo6wCQFVOJMUBmZzOfUWunkIlUWxkYAk30jbB2XPNYiCWE0fqqPf4vrgYCC3ZbHU
 llMypddnNNQKw31XlrLrf2zB6jdZaGozD3ooAszYrGAey3zpvPTszIc0hrE8HiQ4rgKw
 hQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcLKb+33IxapKiJvEnPjfrqxShYTJcg2+RTGcwFVY7g=;
 b=KkK0t0NIgNvXXmGHt4SqNegbZnfd2FY/bkGGQosU971zguqKUwE9x+8yeVi6uVxPVg
 U/gA7aLQudU2C5cNPidHFE8Y20B9l4ULZ+0JJeZ2iHyFFYQSVxj0GZD+PkDkCIprdmBM
 QAWN3zTXgYTEIP6xU6hHyICwOqIE4d8gTzWmEnUNmUnZSIaK45ohBRJ1mZMsm+kxi+PH
 7IgxrX2cM3XmxmIWGaBnVo2gOYL5regIP3h18wiaVBGVZn7O1dbUWqHgZ6vGLtaVc5ja
 FcgpwqrJ5N09zIfboemo4YOUTLD2Erd7fQA7j1KPzTxvpp5HiFqzJ+Zmo8jmo1UhONPI
 Iexw==
X-Gm-Message-State: AOAM532yo6QPhzQyN/a4+nYORV+yUN3vjZ6/2c0P8rLM00AF1Um8PpcG
 5B0xYjEfyK4cEWNfqIWFHHqkIqMqbiCg7Q==
X-Google-Smtp-Source: ABdhPJw4UJut61rKYwPQmNyUhGBrZZKbvD6xJQCDzSxprPWTuAKt2eA9ynPcEuaPQjFjOx08LRXcFQ==
X-Received: by 2002:adf:f68f:0:b0:210:2ef7:e801 with SMTP id
 v15-20020adff68f000000b002102ef7e801mr7014083wrp.318.1653926916107; 
 Mon, 30 May 2022 09:08:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 096/117] target/arm: Rename do_zpz_ptr to
 gen_gvec_ool_fpst_arg_zpz
Date: Mon, 30 May 2022 17:06:47 +0100
Message-Id: <20220530160708.726466-97-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Rename the function to match other expansion function and
move to be adjacent.  Split out gen_gvec_fpst_zzp as a
helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-94-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 392 ++++++++++++-------------------------
 1 file changed, 129 insertions(+), 263 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 99e5d896457..2a5fbec2d6d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -318,6 +318,33 @@ static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
 }
 
+static bool gen_gvec_fpst_zzp(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                              int rd, int rn, int pg, int data,
+                              ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           pred_full_reg_offset(s, pg),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zpz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                                  arg_rpr_esz *a, int data,
+                                  ARMFPStatusFlavour flavour)
+{
+    return gen_gvec_fpst_zzp(s, fn, a->rd, a->rn, a->pg, data, flavour);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -4044,128 +4071,53 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
  *** SVE Floating Point Unary Operations Predicated Group
  */
 
-static bool do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
-                       bool is_fp16, gen_helper_gvec_3_ptr *fn)
-{
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           pred_full_reg_offset(s, pg),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+TRANS_FEAT(FCVT_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hs, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sh);
-}
+TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvt, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hs);
-}
+TRANS_FEAT(FCVT_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_dh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sd, a, 0, FPST_FPCR)
 
-static bool trans_BFCVT(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvt);
-}
+TRANS_FEAT(FCVTZS_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZS_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hs, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hs, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZS_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hd, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hd, a, 0, FPST_FPCR_F16)
 
-static bool trans_FCVT_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_dh);
-}
+TRANS_FEAT(FCVTZS_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZS_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZS_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ds, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hd);
-}
-
-static bool trans_FCVT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_ds);
-}
-
-static bool trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
-}
-
-static bool trans_FCVTZS_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hh);
-}
-
-static bool trans_FCVTZU_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hh);
-}
-
-static bool trans_FCVTZS_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hs);
-}
-
-static bool trans_FCVTZU_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hs);
-}
-
-static bool trans_FCVTZS_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hd);
-}
-
-static bool trans_FCVTZU_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hd);
-}
-
-static bool trans_FCVTZS_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ss);
-}
-
-static bool trans_FCVTZU_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ss);
-}
-
-static bool trans_FCVTZS_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_sd);
-}
-
-static bool trans_FCVTZU_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_sd);
-}
-
-static bool trans_FCVTZS_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ds);
-}
-
-static bool trans_FCVTZU_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ds);
-}
-
-static bool trans_FCVTZS_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_dd);
-}
-
-static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
-}
+TRANS_FEAT(FCVTZS_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_dd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_dd, a, 0, FPST_FPCR)
 
 static gen_helper_gvec_3_ptr * const frint_fns[] = {
     NULL,
@@ -4173,28 +4125,17 @@ static gen_helper_gvec_3_ptr * const frint_fns[] = {
     gen_helper_sve_frint_s,
     gen_helper_sve_frint_d
 };
+TRANS_FEAT(FRINTI, aa64_sve, gen_gvec_fpst_arg_zpz, frint_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                      frint_fns[a->esz]);
-}
-
-static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_frintx_h,
-        gen_helper_sve_frintx_s,
-        gen_helper_sve_frintx_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const frintx_fns[] = {
+    NULL,
+    gen_helper_sve_frintx_h,
+    gen_helper_sve_frintx_s,
+    gen_helper_sve_frintx_d
+};
+TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                           int mode, gen_helper_gvec_3_ptr *fn)
@@ -4258,101 +4199,53 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
     return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
-static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_frecpx_h,
-        gen_helper_sve_frecpx_s,
-        gen_helper_sve_frecpx_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
+    NULL,                    gen_helper_sve_frecpx_h,
+    gen_helper_sve_frecpx_s, gen_helper_sve_frecpx_d,
+};
+TRANS_FEAT(FRECPX, aa64_sve, gen_gvec_fpst_arg_zpz, frecpx_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_FSQRT(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_fsqrt_h,
-        gen_helper_sve_fsqrt_s,
-        gen_helper_sve_fsqrt_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const fsqrt_fns[] = {
+    NULL,                   gen_helper_sve_fsqrt_h,
+    gen_helper_sve_fsqrt_s, gen_helper_sve_fsqrt_d,
+};
+TRANS_FEAT(FSQRT, aa64_sve, gen_gvec_fpst_arg_zpz, fsqrt_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
-}
+TRANS_FEAT(SCVTF_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(SCVTF_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_sh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(SCVTF_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_dh, a, 0, FPST_FPCR_F16)
 
-static bool trans_SCVTF_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_sh);
-}
+TRANS_FEAT(SCVTF_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(SCVTF_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_ds, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_dh);
-}
+TRANS_FEAT(SCVTF_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(SCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_dd, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ss);
-}
+TRANS_FEAT(UCVTF_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(UCVTF_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_sh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(UCVTF_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_dh, a, 0, FPST_FPCR_F16)
 
-static bool trans_SCVTF_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ds);
-}
+TRANS_FEAT(UCVTF_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(UCVTF_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(UCVTF_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_sd, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_sd);
-}
-
-static bool trans_SCVTF_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_dd);
-}
-
-static bool trans_UCVTF_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_hh);
-}
-
-static bool trans_UCVTF_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_sh);
-}
-
-static bool trans_UCVTF_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_dh);
-}
-
-static bool trans_UCVTF_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ss);
-}
-
-static bool trans_UCVTF_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ds);
-}
-
-static bool trans_UCVTF_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_sd);
-}
-
-static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_dd);
-}
+TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_dd, a, 0, FPST_FPCR)
 
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
@@ -7389,45 +7282,18 @@ TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 
 TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
-static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
-}
+TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_sh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTNT_ds, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_ds, a, 0, FPST_FPCR)
 
-static bool trans_BFCVTNT(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvtnt);
-}
+TRANS_FEAT(BFCVTNT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvtnt, a, 0, FPST_FPCR)
 
-static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
-}
-
-static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
-}
-
-static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
-}
+TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_hs, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
 static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.25.1


