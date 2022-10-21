Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDF607331
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:03:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnwL-0004Mc-1F
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:03:41 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVO-0004dc-Nz
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUj-00044o-DW
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUS-0007rE-CP
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:05 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso5861088pja.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3xi1EBD8jK1qsnUY3LZUu6R47blhBME7MEkkZGVfDU=;
 b=Bx+4oD+Dg9v3/SUwtvhJZI+jyAsgg4vs+TW+Zxa8Rqh0RIzYBl8iNQws8jQkJHRQDz
 YOgJ42HNokl2rOIFew57HH4szSfzInAtbFHFUNvlthUJey4oO4cfTiH/my6tw8/43Y9R
 5Gc2N/k0KKF4A2/4r8t7p/zPme5nTim6MHzT0BEC8AOl1St4zVhW2paSAfZh6HW37BKF
 W9rR4Ybaatenad4UEaa2Yfi1K4sjUr2WKEOn6ERK8i6fOAC7m1+v36S6gSzF7WQU3nxS
 UKK0PaOTVr7IFawCuOw/kZrS/+GoT7YL3IxCO5/UXI9E4yJEeR4hNSb6pFPhGrJ6iGFB
 XLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3xi1EBD8jK1qsnUY3LZUu6R47blhBME7MEkkZGVfDU=;
 b=xlqVQY4okWunsXgLtRfvf1yfpsKRwci3gmQFuZtUSaZtNgzh0CL2yl5DhHMybhsfYG
 NyZTlRplGyuduowO1EH/jgFZyEncL7+0c3GI9EfZEbeSASM/rPsUwx9eRZ3UYZXR1iPL
 gIZNCmCzEJi/BgtZfrsrYmMZRoD4Vm/3OE5YhH/A6dIJk79iaOBzpNieLT3newuK3Q5U
 8wwuokiiu4vLZN4XbUupSQ+JbVRyewAQ4jS1gM/GhneuAQYDmMCvgahnD2KRZ9o4tm9x
 NIoB92qERaz38kQmwFDZ1+Fm3OChPWlHFUNtBPCplYIXPej3fLwDaHlN46JSd+8D6++P
 cfuA==
X-Gm-Message-State: ACrzQf0PTjLx5GXLEAy1YdAvsAVq16yEm8UVobAB7+WmUIRdqxxwSvKP
 VPy8zjQA7LeLGD+Nw3V54sdM8reCbfas2mbn
X-Google-Smtp-Source: AMsMyM4xrNX8Cbum0e5FzP2Z0jywcepNTl3K0/a8FkBil38UHHD+v0+5TzQ6hrk8ZPOxFzNpKJ28Lw==
X-Received: by 2002:a17:90b:4b02:b0:20c:c3a8:38d with SMTP id
 lx2-20020a17090b4b0200b0020cc3a8038dmr54057347pjb.12.1666337446507; 
 Fri, 21 Oct 2022 00:30:46 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 1/9] target/s390x: Use a single return for helper_divs32/u32
Date: Fri, 21 Oct 2022 17:29:58 +1000
Message-Id: <20221021073006.2398819-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Pack the quotient and remainder into a single uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
 target/s390x/tcg/translate.c  | 10 ++++++----
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bf33d86f74..97a9668eef 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
 DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
-DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
+DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..130b8bd4d2 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -34,45 +34,45 @@
 #endif
 
 /* 64/32 -> 32 signed division */
-int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
+uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
 {
-    int32_t ret, b = b64;
-    int64_t q;
+    int32_t b = b64;
+    int64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (int32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(r, 32, 32, q);
 }
 
 /* 64/32 -> 32 unsigned division */
 uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 {
-    uint32_t ret, b = b64;
-    uint64_t q;
+    uint32_t b = b64;
+    uint64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (uint32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(r, 32, 32, q);
 }
 
 /* 64/64 -> 64 signed division */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..525317c9df 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2395,15 +2395,17 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_ext32u_i64(o->out2, o->out);
+    tcg_gen_shri_i64(o->out, o->out, 32);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_ext32u_i64(o->out2, o->out);
+    tcg_gen_shri_i64(o->out, o->out, 32);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


