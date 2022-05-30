Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24932538621
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:29:36 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviGt-0000AL-2Q
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvS-0002ql-Fz
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvQ-0007AQ-Tp
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4085379wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WpRC+GS9ue3LwPsMr2N1fBULfRhLwBA54Un3pU0cxaw=;
 b=rm/L17IvKTL88vxX3akZhSecVFTDT+3z6pAWovW9vm17o0+P2nN8nkA2tq/i42FoGu
 ixPRpEE36MTnqntL6rjSOnPZu597rD2QcYMeHQvb6GgQetrkKwCgALS21E69PvSij/S5
 aal1IF0sMJLoCkgyAcVk8PM0vf9wn7h/lOlH1Q+0Hk9gSUPnFqH07gm5PwKiFIidr5TN
 HFPUxiRmCbbilx1yFKwRGkAZDaT2ImvxsEeMjanhU1oLFmBOfD18KqcQdsZ2phdwDhGj
 GQUvGj8SpLz19nTHKRSSqVo/yCxYowOcGfTi3A1Jqr1kHzUufgSZlWi3R8cKRCnQurfX
 p2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpRC+GS9ue3LwPsMr2N1fBULfRhLwBA54Un3pU0cxaw=;
 b=KyGv6Ij1//ub+TbZGYSRHmZvOfgEfiefd1Wdk2BOnQFmoOO7OPzut/+men57S3Stf2
 TlWRwcj1F2cZ5RuK7Fk29LHug/KKQ2v8cjwXeR7j4dbPxOTdZgILviNzy40y2rv8FJUa
 mEvtkAimWFi9omOEaU92fGusLr8x7tDAjPBROWvbk+q8qWRvBnETCEqGtfuo76yMdUim
 3DJcaSFMlLBkqDLGYibfyaiuhqTMSHke+F8aaqJzKlNQtzFSD1ekwuG+a9qZB+vMZDn9
 m0iD+BUpBOt51pQqjA2jKJTnfyIhOSBvX0gWFpk6lRImhsx2s78TFx12rZAvLiqkhKYT
 VmmQ==
X-Gm-Message-State: AOAM531DeCy3iYODILH6Cg/atrB0j9VIRtkEVLlAzxSWd/wmKZ5vRCNv
 PliVu0uS9Vk8rmsG7IaqQuG3TGJD9+SEZA==
X-Google-Smtp-Source: ABdhPJx9yDM/fotVGlvdl8ZEbsxAMY+FoBNZwQ7K6YHyY/qcI1wOr7ZoO1OPpzbmVOdCXmdb0/qlcQ==
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr18895467wrq.471.1653926844080; 
 Mon, 30 May 2022 09:07:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 017/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzxz
Date: Mon, 30 May 2022 17:05:28 +0100
Message-Id: <20220530160708.726466-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Convert SVE translation functions directly using
gen_gvec_ool_arg_zzxz to TRANS_FEAT.  Also include
BFDOT_zzxz, which was using gen_gvec_ool_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-15-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 48 +++++++++++---------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b42df76c697..b097b44d9f9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3826,32 +3826,19 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-#define DO_RRXR(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return gen_gvec_ool_arg_zzxz(s, FUNC, a); }
+TRANS_FEAT(SDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sdot_idx_b, a)
+TRANS_FEAT(SDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sdot_idx_h, a)
+TRANS_FEAT(UDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_udot_idx_b, a)
+TRANS_FEAT(UDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_udot_idx_h, a)
 
-DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
-DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
-DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
-DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
-
-static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_sudot_idx_b, a);
-}
-
-static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_usdot_idx_b, a);
-}
-
-#undef DO_RRXR
+TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sudot_idx_b, a)
+TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_usdot_idx_b, a)
 
 static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
                              gen_helper_gvec_3 *fn)
@@ -8311,15 +8298,8 @@ TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-
-static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
-                             a->rd, a->rn, a->rm, a->ra, a->index);
-}
+TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_bfdot_idx, a)
 
 TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfmmla, a, 0)
-- 
2.25.1


