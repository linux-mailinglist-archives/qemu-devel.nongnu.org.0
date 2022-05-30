Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC953861E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:28:31 +0200 (CEST)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviFq-0006Zt-4a
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0002rd-OU
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvT-0007EZ-4O
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso8700133wmh.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4ZQsUZFIQn45fUAYCwuEeZCcMS3C2PBrUOch8zG/uoA=;
 b=cT2wGL1J4I3G1jzlMYblg+Ls1XKLZqQzPM75oty88EBpTuo5Zm0XVt9rbEdyNqIxdr
 W89TOeyM8Ck6DY+mZNZ6OEUhjgmHeot5ZlEVLSZmtXCcbDAdNLglaUnzK/lhS+H50NtP
 OxgjPSx28zXa4Mxn8uzECONKJU0jx/pbY7z/qSs7p/liRhUAA6sPLXx3RHUsv0g3BPka
 OLynBtFmyARxjeCspQv1kTMOC6wE+8MmIx9j05/dThSxsSiwTXBNLGeSLprvHuG/l/XF
 C2J1tM86xF8L7FoBwzAMAEHBbBIHdGmJqQYxq0zv4bIQTNNOR+zNGpYX7IVLLUNUIaAC
 9dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZQsUZFIQn45fUAYCwuEeZCcMS3C2PBrUOch8zG/uoA=;
 b=SNrq+cx25OLZ/ljXG3QvT+QYlY/llReXjviFg1HyZ5CbRElWqwFCP/T4ae5vlsTvCK
 CVVqB1UFEnfoFI1ItLt4eyK5f3zXtzlbCiaN3WB53XzG045zDeE+AGu+3eJvOf8TEREs
 PdwR6W1787MbZJR4AVx1RS3HOle8/0gDzjHaQgA2Qul4zs1Hg5/tD3WSy7y/5d/+B4zQ
 3LkIuS7ihfa3mIFnpJIGXv1iG1SLBO8tjZyPe/ba2m7ImvZtI//O7H785d3hKSXoMadO
 gD6xT384COMnD8paB9yBKunJzX+54J9fsbjc5i2JIyhpf2fCM9yRcs4uTtG/nUFH4LJp
 oRdA==
X-Gm-Message-State: AOAM530Rllzz92zZDLi0l3J0Uvg+ko8MGLK3Rhc35S2g+IPQmnNS9b8E
 R1556sjeHatK4Kj5GPpzh/WVgy0HrGIE+w==
X-Google-Smtp-Source: ABdhPJx+Sn0o6GJGJw/xp9DcZY+j2WBqidEVAHP/O92DUSawrOjaiZfNc+eyf1Gk7clOS0JsUwptvQ==
X-Received: by 2002:a05:600c:3d10:b0:397:835e:bf64 with SMTP id
 bh16-20020a05600c3d1000b00397835ebf64mr18207764wmb.167.1653926845644; 
 Mon, 30 May 2022 09:07:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 019/117] target/arm: Use TRANS_FEAT for do_sve2_zzzz_data
Date: Mon, 30 May 2022 17:05:30 +0100
Message-Id: <20220530160708.726466-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Convert SVE translation functions using do_sve2_zzzz_data
to use TRANS_FEAT and gen_gvec_ool_{zzzz,zzxz}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-17-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 106 ++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 65 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ac76705da69..c345399ace9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3879,90 +3879,66 @@ DO_SVE2_RRX_TB(UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
 #undef DO_SVE2_RRX_TB
 
-static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
-                              int data, gen_helper_gvec_4 *fn)
-{
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           vec_full_reg_offset(s, rm),
-                           vec_full_reg_offset(s, ra),
-                           vsz, vsz, data, fn);
-    }
-    return true;
-}
-
 #define DO_SVE2_RRXR(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra, a->index, FUNC); }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_arg_zzxz, FUNC, a)
 
-DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
-DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
-DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+DO_SVE2_RRXR(MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
 
-DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
-DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
-DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+DO_SVE2_RRXR(MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
 
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
 
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 
 #undef DO_SVE2_RRXR
 
 #define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)          \
-    {                                                           \
-        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->rd, \
-                                 (a->index << 1) | TOP, FUNC);  \
-    }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzzz, FUNC,        \
+               a->rd, a->rn, a->rm, a->ra, (a->index << 1) | TOP)
 
-DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
+DO_SVE2_RRXR_TB(SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
+DO_SVE2_RRXR_TB(SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
+DO_SVE2_RRXR_TB(SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
+DO_SVE2_RRXR_TB(SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
+DO_SVE2_RRXR_TB(SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
+DO_SVE2_RRXR_TB(SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
+DO_SVE2_RRXR_TB(SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
+DO_SVE2_RRXR_TB(SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
+DO_SVE2_RRXR_TB(SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
+DO_SVE2_RRXR_TB(SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
+DO_SVE2_RRXR_TB(SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
+DO_SVE2_RRXR_TB(SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
+DO_SVE2_RRXR_TB(UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
+DO_SVE2_RRXR_TB(UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
+DO_SVE2_RRXR_TB(UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
+DO_SVE2_RRXR_TB(UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
+DO_SVE2_RRXR_TB(SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
+DO_SVE2_RRXR_TB(SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
+DO_SVE2_RRXR_TB(SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
+DO_SVE2_RRXR_TB(SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
+DO_SVE2_RRXR_TB(UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
+DO_SVE2_RRXR_TB(UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
+DO_SVE2_RRXR_TB(UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
+DO_SVE2_RRXR_TB(UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
 
 #undef DO_SVE2_RRXR_TB
 
 #define DO_SVE2_RRXR_ROT(NAME, FUNC) \
-    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)       \
-    {                                                              \
-        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra,    \
-                                 (a->index << 2) | a->rot, FUNC);  \
-    }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzzz, FUNC,           \
+               a->rd, a->rn, a->rm, a->ra, (a->index << 2) | a->rot)
 
 DO_SVE2_RRXR_ROT(CMLA_zzxz_h, gen_helper_sve2_cmla_idx_h)
 DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
-- 
2.25.1


