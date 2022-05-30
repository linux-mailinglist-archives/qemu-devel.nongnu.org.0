Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F53538688
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:06:53 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviqy-0007f3-O7
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvp-0003cf-7I
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvn-0007Ft-Ke
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x17so6211540wrg.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z8wEWNOP2fHsbOK8M8A10RgrzTj1YykPIOPDZrlCou0=;
 b=ctoFAmAQkgcuTNSUdrExOZyBKPzyQdeKp/VPYZDurH1/+u/MFaTZ7V7VqPPUX+R03y
 gSmciD+ToH5s/04a6g4o77SESqPEB9F04FjOZMLNOsiy0X0Fy4EMK6odEa5unateUM+j
 V0i0DCBpSDmuT3DPDVvsF/yT+vWgEkZ2Ao2J4UYiSy0y9wJ2WrVdFGpbNWNtfm0EAk3b
 VnMpF2JkW7O8o2oWQJXzyg1/OIqnl08jpuZk6g6NODXPGCIeXDZRauKIrCNPR1HNKGmw
 rcTwdCU8uuQ+JguHYGT1wSoLlqgf0HDzfcq0pZOfiny1oS6caL8hC8LkqzOBrozehkzk
 AyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8wEWNOP2fHsbOK8M8A10RgrzTj1YykPIOPDZrlCou0=;
 b=yeiIrRvA7nxdaq2wZWA6g995raml/uy+ZJm0cYp1J4FNqZFBngkOenRdjRKucy8W8K
 JLVMNWbdeC5xrWQDDXbc9MFF3UgsX6Rbk1ZHQnB9lTnVRS08Xgs7iu9VnCFSqPkxLsdk
 yT++Oz0XpjywB3gaT3FaaKPKuE3myhx26RvP+ZLn0DBfZlUpQ1itOgRJfdxaWLkVNTqJ
 yTKEFCrQF3TfsgM0qITWTM/xZk5EIID6xZfFZl+rcwbvy0aVWcm5pZjwJEf+MWSwsDHz
 3VFwpTdxVB2B0kF7FslKjxhVzDgAWZDAAqNGjZoJYFSFxyNlDNb2sY5SUix1IgwDUnxD
 ZqUg==
X-Gm-Message-State: AOAM5319s8iFTB+JYPq3l3foBnGyMERBUdoK+zkTbDZOAnBGC42ThxeP
 GvYphWat/xxWGyoIMvZeNaOYG7E/bwS61A==
X-Google-Smtp-Source: ABdhPJxjt1IxV2JtZOMKJ9lKprXy8bcuDlDtgxl4OgHH6RRoPhBDOU83Xk9f+CgEZZauNJRws/hlzg==
X-Received: by 2002:a5d:5150:0:b0:210:1d71:3dcb with SMTP id
 u16-20020a5d5150000000b002101d713dcbmr13141742wrt.412.1653926866776; 
 Mon, 30 May 2022 09:07:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 046/117] target/arm: Use TRANS_FEAT for do_vpz_ool
Date: Mon, 30 May 2022 17:05:57 +0100
Message-Id: <20220530160708.726466-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-44-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 911d2e28bf4..6103bd7f1d4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -858,14 +858,11 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
 }
 
 #define DO_VPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
-{                                                                        \
-    static gen_helper_gvec_reduc * const fns[4] = {                      \
+    static gen_helper_gvec_reduc * const name##_fns[4] = {               \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,            \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
     };                                                                   \
-    return do_vpz_ool(s, a, fns[a->esz]);                                \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_vpz_ool, a, name##_fns[a->esz])
 
 DO_VPZ(ORV, orv)
 DO_VPZ(ANDV, andv)
@@ -877,14 +874,11 @@ DO_VPZ(UMAXV, umaxv)
 DO_VPZ(SMINV, sminv)
 DO_VPZ(UMINV, uminv)
 
-static bool trans_SADDV(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_reduc * const fns[4] = {
-        gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
-        gen_helper_sve_saddv_s, NULL
-    };
-    return do_vpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_reduc * const saddv_fns[4] = {
+    gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
+    gen_helper_sve_saddv_s, NULL
+};
+TRANS_FEAT(SADDV, aa64_sve, do_vpz_ool, a, saddv_fns[a->esz])
 
 #undef DO_VPZ
 
-- 
2.25.1


