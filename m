Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE43925FE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:18:45 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7To-0001WM-SF
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PQ-0001Yw-GF
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:14 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PN-0007A7-8Q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:12 -0400
Received: by mail-pf1-x429.google.com with SMTP id g18so2661065pfr.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yeOiXbtTOrQ1HO+ZU3eJmyLjRTBzgH1M55NyXilFo1c=;
 b=DOeGpaJ9PQVKA0HzYycc+VcRYAoAX5WrELrsJQX0YoYUEbTVPgixqgKIol+Or2Z3AD
 NmDTaf5vKx5p435eqr9srgNPLgTarWewQavwlqHaTk12CZ6qsPNR8W8L1Dgtx0gJ5tqE
 dSIOA6Y0362AZhlf2SVj5wR56RxgyMxXKwPPlaP/9twHazWe7XSW7A7TN5PLdwU0jFmY
 XBJ9VLsRb4CqGClcG0sgD7Ymnof2Efv3cQy5dKZetn2s3y9XhJipmxlghwxQDbIusoVK
 I2XT+aimc9MNfiQBrPi8wZDPu3FO0o4dvQH0vVMaTvwkkMXYwnXVPnqoAOALU8qfly63
 3XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yeOiXbtTOrQ1HO+ZU3eJmyLjRTBzgH1M55NyXilFo1c=;
 b=m4wc6EZwmcN3b5a6FZj3zW/BuT8D3pKR7hgwV40UMkogsoUzEMrOoqzE58tXFGx5lS
 0uU1MysM0HoDcXp0b1etGkEEdhCI0ShqRBTyo5Pmhh9FmBN2+yBmdsXRAxhTJqXjZKWk
 EDIBSNnUTU5VKejaf8ynnLiSQ3X32fSgSAgioLMCZysyXHxpe4cleH1Hz12G73xkS3f5
 2VnBXsUZj8E2k3XYpias39JGD53mFQY7unhAuFdG4JxgP6Sv8Qns1Q61nyLDsUUqQV3b
 tiK8knDGas84g7lJt/NfW1LQr9JDJvxPdPrWk7XbCXs2B9BjXReLXg5cVYpYfh5KVoXv
 KdnQ==
X-Gm-Message-State: AOAM531diZ0p5BJC7HZ0XuBzP1DcRhx6WFjr2w7FLsULT36cDobH5dYO
 KPmQhTDWFlwrZfLPp5086EvxXvIOCBwcmA==
X-Google-Smtp-Source: ABdhPJw1Lf/slX24ydCi1ORLXxAzv4NkI3nHNeFjNFsgfyHfPvQcAtzr/yv87JX+7LFlFTCEDDatSw==
X-Received: by 2002:aa7:9a0e:0:b029:2dc:70d1:2224 with SMTP id
 w14-20020aa79a0e0000b02902dc70d12224mr1846798pfj.1.1622088847737; 
 Wed, 26 May 2021 21:14:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] softfloat: Rename float_flag_output_denormal to
 float_flag_oflush_denormal
Date: Wed, 26 May 2021 21:13:56 -0700
Message-Id: <20210527041405.391567-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new name emphasizes that the output denormal has been flushed to zero.

Patch created mechanically using:
  sed -i s,float_flag_output_denormal,float_flag_oflush_denormal,g \
    $(git grep -l float_flag_output_denormal)

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 2 +-
 fpu/softfloat.c               | 2 +-
 target/arm/vfp_helper.c       | 2 +-
 target/i386/tcg/fpu_helper.c  | 2 +-
 target/mips/tcg/msa_helper.c  | 2 +-
 target/rx/op_helper.c         | 2 +-
 target/tricore/fpu_helper.c   | 6 +++---
 fpu/softfloat-parts.c.inc     | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 719b4d2531..e2d70ff556 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -149,7 +149,7 @@ enum {
     float_flag_underflow = 16,
     float_flag_inexact   = 32,
     float_flag_iflush_denormal = 64,
-    float_flag_output_denormal = 128
+    float_flag_oflush_denormal = 128
 };
 
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index fa3a691a5a..cb077cf111 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4591,7 +4591,7 @@ floatx80 roundAndPackFloatx80(FloatX80RoundPrec roundingPrecision, bool zSign,
         }
         if ( zExp <= 0 ) {
             if (status->flush_to_zero) {
-                float_raise(float_flag_output_denormal, status);
+                float_raise(float_flag_oflush_denormal, status);
                 return packFloatx80(zSign, 0, 0);
             }
             isTiny = status->tininess_before_rounding
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 0a43ccc6fa..5864553718 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -46,7 +46,7 @@ static inline int vfp_exceptbits_from_host(int host_bits)
     if (host_bits & float_flag_overflow) {
         target_bits |= 4;
     }
-    if (host_bits & (float_flag_underflow | float_flag_output_denormal)) {
+    if (host_bits & (float_flag_underflow | float_flag_oflush_denormal)) {
         target_bits |= 8;
     }
     if (host_bits & float_flag_inexact) {
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index c402daf659..c9779a9fe0 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3001,7 +3001,7 @@ void update_mxcsr_from_sse_status(CPUX86State *env)
                    (flags & float_flag_overflow ? FPUS_OE : 0) |
                    (flags & float_flag_underflow ? FPUS_UE : 0) |
                    (flags & float_flag_inexact ? FPUS_PE : 0) |
-                   (flags & float_flag_output_denormal ? FPUS_UE | FPUS_PE :
+                   (flags & float_flag_oflush_denormal ? FPUS_UE | FPUS_PE :
                     0));
 }
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 992d348aa3..51791f946b 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -6240,7 +6240,7 @@ static inline int update_msacsr(CPUMIPSState *env, int action, int denormal)
     }
 
     /* Set Inexact (I) and Underflow (U) when flushing outputs to zero */
-    if ((ieee_exception_flags & float_flag_output_denormal) &&
+    if ((ieee_exception_flags & float_flag_oflush_denormal) &&
             (env->active_tc.msacsr & MSACSR_FS_MASK) != 0) {
         mips_exception_flags |= FP_INEXACT;
         if (action & CLEAR_FS_UNDERFLOW) {
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index eb2c4a41fb..ef904eb5f9 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -98,7 +98,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
             SET_FPSW(X);
         }
         if ((xcpt & (float_flag_iflush_denormal
-                     | float_flag_output_denormal))
+                     | float_flag_oflush_denormal))
             && !FIELD_EX32(env->fpsw, FPSW, DN)) {
             env->fpsw = FIELD_DP32(env->fpsw, FPSW, CE, 1);
         }
diff --git a/target/tricore/fpu_helper.c b/target/tricore/fpu_helper.c
index cb7ee7dd35..7c826f9b7b 100644
--- a/target/tricore/fpu_helper.c
+++ b/target/tricore/fpu_helper.c
@@ -43,7 +43,7 @@ static inline uint8_t f_get_excp_flags(CPUTriCoreState *env)
            & (float_flag_invalid
               | float_flag_overflow
               | float_flag_underflow
-              | float_flag_output_denormal
+              | float_flag_oflush_denormal
               | float_flag_divbyzero
               | float_flag_inexact);
 }
@@ -99,7 +99,7 @@ static void f_update_psw_flags(CPUTriCoreState *env, uint8_t flags)
         some_excp = 1;
     }
 
-    if (flags & float_flag_underflow || flags & float_flag_output_denormal) {
+    if (flags & float_flag_underflow || flags & float_flag_oflush_denormal) {
         env->FPU_FU = 1 << 31;
         some_excp = 1;
     }
@@ -109,7 +109,7 @@ static void f_update_psw_flags(CPUTriCoreState *env, uint8_t flags)
         some_excp = 1;
     }
 
-    if (flags & float_flag_inexact || flags & float_flag_output_denormal) {
+    if (flags & float_flag_inexact || flags & float_flag_oflush_denormal) {
         env->PSW |= 1 << 26;
         some_excp = 1;
     }
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index be29ba0aa3..72e2b24539 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -227,7 +227,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
         }
         frac_shr(p, frac_shift);
     } else if (s->flush_to_zero) {
-        flags |= float_flag_output_denormal;
+        flags |= float_flag_oflush_denormal;
         p->cls = float_class_zero;
         exp = 0;
         frac_clear(p);
-- 
2.25.1


