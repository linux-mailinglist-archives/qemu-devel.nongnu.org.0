Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CA538706
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:06:03 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjmE-000460-AG
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwT-0003wm-Ih
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0007Aw-AD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3ZaK8O8eU5pJi1dV9nyyn078aiiGZhquvOpuL5BWDR0=;
 b=ldzSvYeN5ORw2gxEK6h2IqJ3tUAMw3VFYlboXh6UJMCcV+rmHdC+T+jxIwD3hJa84i
 UmyHvJ4V/NicgGDrL82u8gWQZcAZMznnCnxMe8izII1CcuZOIdkzGbapRSaGLTGBcbU5
 MZt07ww8eEzvB83DVUf1VFG6Yntt5nOb1VJghG+wvhUaoRHoIkm0Ics+ytg1E6Yo2g8t
 7hZDvskCZ443xlN5WLOjLjlXbSjUMwig7M2ZvaeAjJPAgQO8cIrqzC8O32G4tqbBHPaG
 N8BPoStjpmuW7Nw7jQmTYUleFc0YEIok4Hc8qlSNXCl+BMDXSBAZ3Wk0mYUiD8XzxnBx
 To+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZaK8O8eU5pJi1dV9nyyn078aiiGZhquvOpuL5BWDR0=;
 b=kh8CA5wFd5EiRdWd3zycKdHnGzc0pXlGHGjTT3O3asl2s6nGtS4A+CzGWJGyNLpe+w
 LXuV41icsXJln3HA43FHLUqEgC0hrsgL6qb8v8KhxwDrmyuH7GvLQuMlqGo3/VG+Fwh5
 U56I8Kl/7m8Qs2IC6BkYRVM2tWCUq+7uSVUQ+0Xa3VTa/rk13qONPGAGo+VTDR2+Ue+k
 yGm16UNDsh1ErewWMdLB/4pqauCVmdN5z/4qokhRrsn4FP7hvm0bk4emSTzmSneLnnnr
 pydeTSql7J00nZB+o5pdUXuvkCMWv/ESOMMXChZrFm1M8AMlZgMJb9ru8PiPLYmQdYBn
 zywQ==
X-Gm-Message-State: AOAM530utEGfnNwJa4FkCaIZXu/EErMuaM8LNkGHOcOIZBtBa6CFF0Og
 96NAPiCy40Lnk3FhAvQpSZB7flc2jQYNYA==
X-Google-Smtp-Source: ABdhPJwFGl8c37NFpqk+Ks4Lb+JW229Hsu3QLtUxpdPWs6bhtulj/UI6aqiJvoPZH0uB5UlHXvvrBQ==
X-Received: by 2002:a05:6000:352:b0:210:3509:7364 with SMTP id
 e18-20020a056000035200b0021035097364mr4724693wre.82.1653926904107; 
 Mon, 30 May 2022 09:08:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 080/117] target/arm: Introduce gen_gvec_{ptr,fpst}_zzzz
Date: Mon, 30 May 2022 17:06:31 +0100
Message-Id: <20220530160708.726466-81-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Use these for the several varieties of floating-point
multiply-add instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-78-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 140 ++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 87 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b8bd1047b0a..a799ce3110a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -205,6 +205,35 @@ static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs, plus a pointer. */
+static bool gen_gvec_ptr_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                              int rd, int rn, int rm, int ra,
+                              int data, TCGv_ptr ptr)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           ptr, vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                               int rd, int rn, int rm, int ra,
+                               int data, ARMFPStatusFlavour flavour)
+{
+    TCGv_ptr status = fpstatus_ptr(flavour);
+    bool ret = gen_gvec_ptr_zzzz(s, fn, rd, rn, rm, ra, data, status);
+    tcg_temp_free_ptr(status);
+    return ret;
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3485,24 +3514,15 @@ DO_SVE2_RRXR_ROT(CDOT_zzxw_d, gen_helper_sve2_cdot_idx_d)
 
 static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
 {
-    static gen_helper_gvec_4_ptr * const fns[3] = {
+    static gen_helper_gvec_4_ptr * const fns[4] = {
+        NULL,
         gen_helper_gvec_fmla_idx_h,
         gen_helper_gvec_fmla_idx_s,
         gen_helper_gvec_fmla_idx_d,
     };
-
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | sub,
-                           fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
+                              (a->index << 1) | sub,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
@@ -4040,26 +4060,18 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
 {
-    static gen_helper_gvec_4_ptr * const fns[2] = {
+    static gen_helper_gvec_4_ptr * const fns[4] = {
+        NULL,
         gen_helper_gvec_fcmlah_idx,
         gen_helper_gvec_fcmlas_idx,
+        NULL,
     };
 
-    tcg_debug_assert(a->esz == 1 || a->esz == 2);
     tcg_debug_assert(a->rd == a->ra);
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz,
-                           a->index * 4 + a->rot,
-                           fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+
+    return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
+                              a->index * 4 + a->rot,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 /*
@@ -7327,17 +7339,7 @@ static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
         return false;
     }
 
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR);
 }
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
@@ -7535,16 +7537,9 @@ static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           cpu_env, vsz, vsz, (sel << 1) | sub,
-                           gen_helper_sve2_fmlal_zzzw_s);
-    }
-    return true;
+    return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzzw_s,
+                             a->rd, a->rn, a->rm, a->ra,
+                             (sel << 1) | sub, cpu_env);
 }
 
 static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
@@ -7572,17 +7567,9 @@ static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           cpu_env, vsz, vsz,
-                           (a->index << 2) | (sel << 1) | sub,
-                           gen_helper_sve2_fmlal_zzxw_s);
-    }
-    return true;
+    return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzxw_s,
+                             a->rd, a->rn, a->rm, a->ra,
+                             (a->index << 2) | (sel << 1) | sub, cpu_env);
 }
 
 static bool trans_FMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
@@ -7625,19 +7612,8 @@ static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, sel,
-                           gen_helper_gvec_bfmlal);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
+                              a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR);
 }
 
 static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
@@ -7655,19 +7631,9 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | sel,
-                           gen_helper_gvec_bfmlal_idx);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
+                              a->rd, a->rn, a->rm, a->ra,
+                              (a->index << 1) | sel, FPST_FPCR);
 }
 
 static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-- 
2.25.1


