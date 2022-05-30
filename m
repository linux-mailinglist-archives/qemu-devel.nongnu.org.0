Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307455386C3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:29:39 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjD0-0007MB-9S
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwb-00044d-VA
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0007GW-Hj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6724791wmp.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ebGGe9LyDpXcGYT3qpOhGNDX6ZvB/bb1IoWjtN9lGi4=;
 b=XHWnKUuYk48kGNFSo0pQOXtsVY2Agf+Cv7umCKAWmlUapXprWQ3lWJpN3BlzYMDPmy
 FFtG5/NO22AT0GXyczaUaKhmgkQPqHVfLKCwRyekjvOfJX0FDzqz31yXdSL0bzG8ghC1
 0I3pGcqFX+Hk/vRI/b+Js+vECvZlDwA85PzVXOMoxTpoZw66SXAEOq2VvxF6vXTrm8x6
 /3fVNfoZNahmppw9B6Zs+gfB0Y+8HFTZstL4tS2y+19o/npyhAWS1/9zVMhaOEMIcWc3
 c15zT3ly0I8ihMj6tgPbVTPMB0gJZ6R7slE8+KhML3u7dy9S9c3Gl2frJRK0veoCZ+qb
 DfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebGGe9LyDpXcGYT3qpOhGNDX6ZvB/bb1IoWjtN9lGi4=;
 b=gMH7bqW1gpLmVU67ThZiIKWvUYLsDw57fg6gT4GZh1tti39De5XDfTamtlHw4u62rE
 /Vmwk33v9s7+AWP/9sPNiIrKAQsf6uavqI/8y4acRz96yNry1tjsjjx5Nyw5PXZGG5oD
 fJ/Qlw48FxI3tyXyiYYQ/z8xrExqRR02XehqfpnbpLaXkI7fk37fVMENzcZwZq/hFFaE
 tv5qaXU0GwusYxKlnTs6kSpDbHbEE2hxiw14EHe3+ed1IvTawN+j+zPAu98TmFtqRD7u
 biDyJIEhnghrFX1f7XGjt91JV873NcMKAergJJHmGwPSAApDBr+xYsSX0DIpakLMnG+8
 SvRA==
X-Gm-Message-State: AOAM5309DF04o/tjItuSMjgLRGKQf8CLjdBNMlLopa6MVrJ5WHBGDKoj
 gSLB045sMMvcEQbJvGcTXRheKoVz2gfVEA==
X-Google-Smtp-Source: ABdhPJwgcVKM/u8lF6Ib49YKkFxUKR22Z1mIGcVdkL1SSCqy9whLjH2aCFY8vsu7d6IwX9jOa2vKNg==
X-Received: by 2002:a05:600c:3d10:b0:397:835e:bf64 with SMTP id
 bh16-20020a05600c3d1000b00397835ebf64mr18211323wmb.167.1653926904833; 
 Mon, 30 May 2022 09:08:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 081/117] target/arm: Use TRANS_FEAT for FMMLA
Date: Mon, 30 May 2022 17:06:32 +0100
Message-Id: <20220530160708.726466-82-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Being able to specify the feature predicate in TRANS_FEAT
makes it easier to split trans_FMMLA by element size,
which also happens to simplify the decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-79-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  7 +++----
 target/arm/translate-sve.c | 27 ++++-----------------------
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7e79198f5ba..a54feb2f61d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1598,10 +1598,9 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 ### SVE2 floating point matrix multiply accumulate
-{
-  BFMMLA        01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
-  FMMLA         01100100 .. 1 ..... 111 001 ..... .....  @rda_rn_rm
-}
+BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
 
 ### SVE2 Memory Gather Load Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a799ce3110a..364e419f3eb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7318,29 +7318,10 @@ DO_SVE2_ZPZZ_FP(FMINP, fminp)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    gen_helper_gvec_4_ptr *fn;
-
-    switch (a->esz) {
-    case MO_32:
-        if (!dc_isar_feature(aa64_sve_f32mm, s)) {
-            return false;
-        }
-        fn = gen_helper_fmmla_s;
-        break;
-    case MO_64:
-        if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-            return false;
-        }
-        fn = gen_helper_fmmla_d;
-        break;
-    default:
-        return false;
-    }
-
-    return gen_gvec_fpst_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR);
-}
+TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
+           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
+           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
-- 
2.25.1


