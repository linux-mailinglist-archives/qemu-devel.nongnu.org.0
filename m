Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0D53867B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:02:06 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvimK-0008Ek-W3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0003QQ-VH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvk-0007I7-7D
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so8686855wme.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vsA6bJy9SO81bRRIWZswEveByufekWoVyLicmZ9sRuw=;
 b=gWtv760s/f+hj5aONHdw/E+i56psOYBmYcngm/FtuGbmAZaDtuQ9Yn4RMUMgDMlhwn
 vAxGKoiXqURNVWuXoynmeX1YqJKjPCxwf6p9sayq6BtE8T98k8D0psT5YmX84aUwqaFO
 TJgkh+0Oh3b2tDe8LFxfJIDIf5IcLbvU13101TfkNsmDJSY4ABbI1KbKlM8A4vBRwxBi
 A1FNnnx5sHcwwUEr+tA+I4x/e8x6D1KOcRvGS3Jw0k3DxptGt+1q3NH7fDjxQBeuOphP
 JrlqvJEdL7L/xvRvxCUvHzBGdg/Obng/EAhgOllEJcrAAzD3MstwRsTa0SLeMp565Tog
 sJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsA6bJy9SO81bRRIWZswEveByufekWoVyLicmZ9sRuw=;
 b=dFLcy5sVpXig+7RMxtuz+AFfa1DmjEibkA9IXoWVlSWZ+ngZqqakKochgJ005B3Qxy
 Xv8m29JFE6wn5kYxVZkiNUx153BRYfBnLLeOrsCnkratMpK3Swlzm9MFxEIXSOCqVQj0
 +FzqkM4L8mJAQiZv9/xk071cti7nruHrYS+koy62w8nokiOLNbjgC7ex8o0e1vjxhH/j
 mmzQqf6PAYdw15xKzmft9WqDkpl8SQKHidcKLj0wZDW92OrARzoN6hi/A7WboeHlZqsQ
 WwgFnpjSgmm11oSfslDIfC4py0IAR0wX7VEAU4CZRle5pXfoBbw2RHFhC2+/PYaudZsx
 Iu4w==
X-Gm-Message-State: AOAM531qqVyc/Qcoc+c26NWTkEnh3r4s3xIWlcTFADknVjqwZwHt/DHA
 oQC3reOdQ2Ei0eRmpB+5vPmL+DAJAhIbSw==
X-Google-Smtp-Source: ABdhPJweUVEqWQInPHCM8kKYC5+F2+/w7oGD+1uyb2UbBKsweKJRsH2KkQeYfsvcR0TRIysj2ta/jw==
X-Received: by 2002:a7b:c20f:0:b0:39a:46fb:64eb with SMTP id
 x15-20020a7bc20f000000b0039a46fb64ebmr10218046wmi.151.1653926862288; 
 Mon, 30 May 2022 09:07:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 040/117] target/arm: Use TRANS_FEAT for do_sve2_zzzz_fn
Date: Mon, 30 May 2022 17:05:51 +0100
Message-Id: <20220530160708.726466-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Convert SVE translation functions using do_sve2_zzzz_fn
to use TRANS_FEAT and gen_gvec_fn_arg_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-38-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 38 ++++++--------------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e0b083f8615..f89c78a23e9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -491,14 +491,6 @@ static bool trans_XAR(DisasContext *s, arg_rrri_esz *a)
     return true;
 }
 
-static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzzz(s, fn, a);
-}
-
 static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
     tcg_gen_xor_i64(d, n, m);
@@ -525,10 +517,7 @@ static void gen_eor3(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_EOR3(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_eor3);
-}
+TRANS_FEAT(EOR3, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_eor3, a)
 
 static void gen_bcax_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -556,10 +545,7 @@ static void gen_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BCAX(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bcax);
-}
+TRANS_FEAT(BCAX, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bcax, a)
 
 static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
@@ -568,10 +554,7 @@ static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_bitsel(vece, d, a, n, m, oprsz, maxsz);
 }
 
-static bool trans_BSL(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl);
-}
+TRANS_FEAT(BSL, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl, a)
 
 static void gen_bsl1n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -606,10 +589,7 @@ static void gen_bsl1n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BSL1N(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl1n);
-}
+TRANS_FEAT(BSL1N, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl1n, a)
 
 static void gen_bsl2n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -653,10 +633,7 @@ static void gen_bsl2n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BSL2N(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl2n);
-}
+TRANS_FEAT(BSL2N, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl2n, a)
 
 static void gen_nbsl_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -685,10 +662,7 @@ static void gen_nbsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_nbsl);
-}
+TRANS_FEAT(NBSL, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_nbsl, a)
 
 /*
  *** SVE Integer Arithmetic - Unpredicated Group
-- 
2.25.1


