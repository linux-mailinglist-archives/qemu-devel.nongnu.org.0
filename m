Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181453865E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:52:21 +0200 (CEST)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvicu-0007H5-Fi
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvr-0003e0-HO
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvp-0007Aw-VI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yvlWfaRzgoo3c8jL+dg4FesDheVDvd0N84Inz3djlc8=;
 b=YDRsHkcnqQ0XyhxNKitmi2kOJqdmD/qqWVgX/UlN7RuRcxwPuPOw+JnoORk9ctSwMR
 iCkxLg+s/2OJlxKkdZimO+9XXNTkDXKccfdAkH3X8ztIbij1OLzPaPw3uEjo9H4K6vh9
 d4rJsCMpd+kQOkqVb2IHC1Z2U/fwFInCa/OYbDWTRuBUFE6ztA4im7BkTY0UFUkgS+VV
 9y8O+CovkFktjGXN71lwjEm/orhBegNjO8oJAfHIhfJe+K30qadhZulGEPM4pdQCdvAh
 yfJv0twD/GinkXljrKHNYvpV45k1PQUit7bW2WfjZjdkVU+GZM5C12s0lZ8bLIODeRSv
 OlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvlWfaRzgoo3c8jL+dg4FesDheVDvd0N84Inz3djlc8=;
 b=AtcWlhyFM+P4TfXbqFZ4IR+XtMu5Yee9HneP8+32EqW48nQmgWqoEhnrnvD9sDXjKd
 lJk+ib5Pql/sJ5X48h6UQKeV40w8Oqs5gM7O+PzdspC4TBVwokaair6dhsvJyGoHWBQ3
 AL6biuBC/yV3nSYVbwMQNGScCXcYGnOdxHuBDPGLbI8OLIBlFz3GvNxB00Xo9oyWiTQc
 grBO72N35XAN51FYohRkmqp9ZYJvfOB5gi3VZv7Kqz+q1ZQqJMZ38LwodLd4bWav278y
 nHmRQirLVGyec/5I21cN1WW5JwaWT4AzBJXEvSxs5v+0h1dBoLU2B25Wu22XCH/BRGFw
 HC7A==
X-Gm-Message-State: AOAM532RDE7PfPS82QHNJBVkjSr1YGkXRZGymfm+KFvLtu+bfGveJMwJ
 aDJbEPG128A5Rl/bgLJq+2XF/Trp4GDH9A==
X-Google-Smtp-Source: ABdhPJxZPbvBOUsq6iuQLS/rdhfKuNfJaBTgNK6rViI2267X3HacznI3TGiTTkZqFb6W3Dd5JeyGQQ==
X-Received: by 2002:a5d:52c7:0:b0:210:ac6:3956 with SMTP id
 r7-20020a5d52c7000000b002100ac63956mr18444615wrv.379.1653926869064; 
 Mon, 30 May 2022 09:07:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 049/117] target/arm: Use TRANS_FEAT for do_shift_zpzi
Date: Mon, 30 May 2022 17:06:00 +0100
Message-Id: <20220530160708.726466-50-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-47-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c7c16863c0b..98f9cfa86c9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -926,41 +926,29 @@ static bool do_shift_zpzi(DisasContext *s, arg_rpri_esz *a, bool asr,
     return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
-static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
-        gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, true, fns);
-}
+static gen_helper_gvec_3 * const asr_zpzi_fns[4] = {
+    gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
+    gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
+};
+TRANS_FEAT(ASR_zpzi, aa64_sve, do_shift_zpzi, a, true, asr_zpzi_fns)
 
-static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
-        gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const lsr_zpzi_fns[4] = {
+    gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
+    gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
+};
+TRANS_FEAT(LSR_zpzi, aa64_sve, do_shift_zpzi, a, false, lsr_zpzi_fns)
 
-static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
-        gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const lsl_zpzi_fns[4] = {
+    gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
+    gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
+};
+TRANS_FEAT(LSL_zpzi, aa64_sve, do_shift_zpzi, a, false, lsl_zpzi_fns)
 
-static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
-        gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const asrd_fns[4] = {
+    gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
+    gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
+};
+TRANS_FEAT(ASRD, aa64_sve, do_shift_zpzi, a, false, asrd_fns)
 
 static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
     gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
-- 
2.25.1


