Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50B5137E9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:14:58 +0200 (CEST)
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5r7-00039o-8d
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jl-0005Uq-RL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jk-0006L6-1c
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id s21so7060978wrb.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+ryhSDqELfNUT9qEanSoz9uViXhWyjP7OPIlFtzevJ4=;
 b=wRRdzLJITFUDcMFeobelXJbYPfZk/fFIbdVJD0/yyVXgeYgfrF89Zqt8YLSs15r8Nq
 rWDCvGuXY7eG7B8SsjbrIXz9eR4bDenISqWYL17Xxoj1TnMSbd0V80PgL+y3TNAfEKrK
 pVjuTH3g8WrxPlipY/28mIuiivwcEjyvwhxYJaIeGvbyyZmSmMHraSHW1pgveHMx61I4
 VaGTtg+6xUZjwOFmxfS6IBR1tzi2yJjoQBmOcSgAdxEnpFRXnRiVrqRllh8raFkZme0U
 rP630VsijR1cj/fNkRX8RgrW/ZRfBeO1zAZ9+Yv6fvME8zlsjiAvFLCoRqZASwI5odgX
 9n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ryhSDqELfNUT9qEanSoz9uViXhWyjP7OPIlFtzevJ4=;
 b=nIO7D1fHykvrsumbSuK3dzIk1fGYczkMOOPb9Tn4/ps8Vk9Qm6ZyZwUf8/4G4XWevE
 sDWxsmWqdNiARwYzlH8tbc/PILnmfeiEre6l8K2eUltU7uAOXcAedDt23Hf2fOeIuGyS
 gzMYy4aAFTsNloDPQB9FX1MmSHqZ+jF7ZxTV+xdUwbHoYBBcEdmT1q4Y6vwkJMMHQ96d
 19tKJO0c55YHtfiTzM/8vame/2wPSqD+isfUo8hjDtHJp51DEaeVuadVPYHOUT+nS0N/
 pX2DS/Z6VtYCWLIZimvKyVES6hx9PY+Zn1wdF2Jvw/oQru3Tz1JyeDqINvX8RGpngTik
 lJ4Q==
X-Gm-Message-State: AOAM5332N2/1aNjymHGR9yHO7ujPVHExwXXkFK+l2Ab1pWL8cPlkkiKs
 h96x2eM0YZqKFg/zNw9khhZSWE2BTnFC/w==
X-Google-Smtp-Source: ABdhPJxc7xN1nvVWetoea0/9pjtc25TAU3UIs2qR5V2FgR/7/qM0WkDAzibGIUwxORR0exgnzPfYsA==
X-Received: by 2002:a05:6000:1145:b0:20a:d93d:ee24 with SMTP id
 d5-20020a056000114500b0020ad93dee24mr17663907wrx.543.1651156826018; 
 Thu, 28 Apr 2022 07:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/54] target/arm: Use tcg_constant for vector shift expanders
Date: Thu, 28 Apr 2022 15:39:29 +0100
Message-Id: <20220428143958.2451229-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-26-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2e4165be3d2..9539d2e8ca2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2996,9 +2996,8 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
-        TCGv_vec zero = tcg_const_zeros_vec_matching(d);                \
+        TCGv_vec zero = tcg_constant_vec_matching(d, vece, 0);          \
         tcg_gen_cmp_vec(COND, vece, d, a, zero);                        \
-        tcg_temp_free_vec(zero);                                        \
     }                                                                   \
     void gen_gvec_##NAME##0(unsigned vece, uint32_t d, uint32_t m,      \
                             uint32_t opr_sz, uint32_t max_sz)           \
@@ -3988,8 +3987,8 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(32);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(32);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4007,8 +4006,6 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4017,8 +4014,8 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(64);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(64);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4036,8 +4033,6 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
@@ -4132,8 +4127,8 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(31);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(31);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4152,8 +4147,6 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4162,8 +4155,8 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(63);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(63);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4182,8 +4175,6 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
-- 
2.25.1


