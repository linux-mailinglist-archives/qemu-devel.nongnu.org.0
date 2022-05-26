Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D459E5355CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:46:37 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLJU-0002tK-Un
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCE-0001he-3Z; Thu, 26 May 2022 17:39:06 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCB-00087U-PE; Thu, 26 May 2022 17:39:05 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 w19-20020a9d6393000000b0060aeb359ca8so1805428otk.6; 
 Thu, 26 May 2022 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5GgsOpDjeA+vC8pR0ZSMAzm3cG/iVjGaJ452lWpcYc=;
 b=Aim/QprPOzV0APBAGjDHDP0u/JBQzi9TAMjrdkeg/XXku0u2nkjYcmyF+fKvPgi+ze
 vmmGo45M+Y83nq86SplzMteGoYAIr4uQh//oWCPZ6kEz1uVPVjLZLriGyhtavlpGKR6S
 ZBH1yKJn1Dw3enPDkavFu2F4cx2Uxn6viGaW7E3CEKn0JrNHXvRpK/tiCW1N1mjsgcX7
 jndv1Umr6mPIOTcmffeIys1CD7z295lsAkICcpF6gnJ7fmG4JdZ4f6yhCYrJgMEhMW7k
 YulfsRIALBmWmaS3QhX6ado6YsCBkFc2fkR0TEl3myiVQVWDm3vwC8PHo0fujz9OqtGZ
 P9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5GgsOpDjeA+vC8pR0ZSMAzm3cG/iVjGaJ452lWpcYc=;
 b=ceiIr9nlIY0etkKVawM5jq7WamKmgeb4o9QFMYoo+tJYWTuKbh79k5cB95i2cxpZdf
 vrNvtwSeBy93ze1WkewhAvl/yIx9gQzkk2DkBZYkSKN8PhTip0Yetpq1IzvkDBl9iMbj
 iyp+VeQG/JVJkD3yQAKguaY1KTPLVdRmEZEhfFScvUBgO2RdFmy381NyWRNW+bu4cZc/
 tvEff5LUB5uvhJC97t8WABvUsp9MsgI5kcB9azohvm6x1G4UO+Y7Ei9fVcBKGiMqwVfb
 LyLGZlUEnYQ+o9w+5SLNogb2uS+Et+qdzUsLm75Wv8q7Cifx/c/xErrg1/jCADS0QYki
 UKZw==
X-Gm-Message-State: AOAM532CFpkYjZELqPjC2jMT6yWOY1TEYLKyZbeh8YfRP0Cj1nbSYqib
 ZfAlj5mm0u/i6YyW9/YodVlVmfZ57H4=
X-Google-Smtp-Source: ABdhPJzdP3386vM66cMUNESmIvKOmYVupQBh91HgGZbEIam4e7ycTiFbq2ppamddmn+MkBDVJlco8A==
X-Received: by 2002:a9d:70c9:0:b0:60b:111f:7dc0 with SMTP id
 w9-20020a9d70c9000000b0060b111f7dc0mr8828056otj.140.1653601142158; 
 Thu, 26 May 2022 14:39:02 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PULL 09/34] target/ppc: Rename sfprf to sfifprf where it's also used
 as set fi flag
Date: Thu, 26 May 2022 18:37:50 -0300
Message-Id: <20220526213815.92701-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

The bit FI fix used the sfprf flag as a flag for the set_fi parameter
in do_float_check_status where applicable. Now, this patch rename this
flag to sfifprf to state this dual usage.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Message-Id: <20220517161522.36132-4-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 112 ++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 88f9e756a5..8592727792 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -1693,9 +1693,9 @@ uint32_t helper_efdcmpeq(CPUPPCState *env, uint64_t op1, uint64_t op2)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_ADD_SUB(name, op, nels, tp, fld, sfprf, r2sp)                    \
+#define VSX_ADD_SUB(name, op, nels, tp, fld, sfifprf, r2sp)                  \
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                             \
 {                                                                            \
@@ -1712,19 +1712,19 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_addsub(env, tstat.float_exception_flags,        \
-                                    sfprf, GETPC());                         \
+                                    sfifprf, GETPC());                       \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfprf, GETPC());                              \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_ADD_SUB(xsadddp, add, 1, float64, VsrD(0), 1, 0)
@@ -1769,9 +1769,9 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_MUL(op, nels, tp, fld, sfprf, r2sp)                              \
+#define VSX_MUL(op, nels, tp, fld, sfifprf, r2sp)                            \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                               \
 {                                                                            \
@@ -1788,20 +1788,20 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_mul(env, tstat.float_exception_flags,           \
-                                 sfprf, GETPC());                            \
+                                 sfifprf, GETPC());                          \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfprf, GETPC());                              \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_MUL(xsmuldp, 1, float64, VsrD(0), 1, 0)
@@ -1840,9 +1840,9 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_DIV(op, nels, tp, fld, sfprf, r2sp)                               \
+#define VSX_DIV(op, nels, tp, fld, sfifprf, r2sp)                             \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
 {                                                                             \
@@ -1859,7 +1859,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
             float_invalid_op_div(env, tstat.float_exception_flags,            \
-                                 sfprf, GETPC());                             \
+                                 sfifprf, GETPC());                           \
         }                                                                     \
         if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {   \
             float_zero_divide_excp(env, GETPC());                             \
@@ -1869,13 +1869,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
             t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfprf, GETPC());                               \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_DIV(xsdivdp, 1, float64, VsrD(0), 1, 0)
@@ -1917,9 +1917,9 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                                \
+#define VSX_RE(op, nels, tp, fld, sfifprf, r2sp)                              \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
 {                                                                             \
     ppc_vsr_t t = { };                                                        \
@@ -1937,13 +1937,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
             t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfprf, GETPC());                               \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_RE(xsredp, 1, float64, VsrD(0), 1, 0)
@@ -1957,9 +1957,9 @@ VSX_RE(xvresp, 4, float32, VsrW(i), 0, 0)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_SQRT(op, nels, tp, fld, sfprf, r2sp)                             \
+#define VSX_SQRT(op, nels, tp, fld, sfifprf, r2sp)                           \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
@@ -1975,20 +1975,20 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
-                                  sfprf, GETPC());                           \
+                                  sfifprf, GETPC());                         \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfprf, GETPC());                              \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_SQRT(xssqrtdp, 1, float64, VsrD(0), 1, 0)
@@ -2002,9 +2002,9 @@ VSX_SQRT(xvsqrtsp, 4, float32, VsrW(i), 0, 0)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                           \
+#define VSX_RSQRTE(op, nels, tp, fld, sfifprf, r2sp)                         \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
@@ -2020,19 +2020,19 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
-                                  sfprf, GETPC());                           \
+                                  sfifprf, GETPC());                         \
         }                                                                    \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfprf, GETPC());                              \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_RSQRTE(xsrsqrtedp, 1, float64, VsrD(0), 1, 0)
@@ -2158,9 +2158,9 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf)                          \
+#define VSX_MADD(op, nels, tp, fld, maddflgs, sfifprf)                        \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
 {                                                                             \
@@ -2177,15 +2177,15 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
             float_invalid_op_madd(env, tstat.float_exception_flags,           \
-                                  sfprf, GETPC());                            \
+                                  sfifprf, GETPC());                          \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfprf, GETPC());                               \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
@@ -2670,9 +2670,9 @@ VSX_CMP(xvcmpnesp, 4, float32, VsrW(i), eq, 0, 0)
  *   ttp   - target type (float32 or float64)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field (f32 or f64)
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf)    \
+#define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfifprf)  \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
     ppc_vsr_t t = { };                                             \
@@ -2685,19 +2685,19 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
             float_invalid_op_vxsnan(env, GETPC());                 \
             t.tfld = ttp##_snan_to_qnan(t.tfld);                   \
         }                                                          \
-        if (sfprf) {                                               \
+        if (sfifprf) {                                             \
             helper_compute_fprf_##ttp(env, t.tfld);                \
         }                                                          \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, sfprf, GETPC());                    \
+    do_float_check_status(env, sfifprf, GETPC());                  \
 }
 
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
 VSX_CVT_FP_TO_FP(xvcvspdp, 2, float32, float64, VsrW(2 * i), VsrD(i), 0)
 
-#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfprf)                  \
+#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfifprf)                \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
 {                                                                     \
     ppc_vsr_t t = { };                                                \
@@ -2710,14 +2710,14 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
             float_invalid_op_vxsnan(env, GETPC());                    \
             t.VsrW(2 * i) = ttp##_snan_to_qnan(t.VsrW(2 * i));        \
         }                                                             \
-        if (sfprf) {                                                  \
+        if (sfifprf) {                                                \
             helper_compute_fprf_##ttp(env, t.VsrW(2 * i));            \
         }                                                             \
         t.VsrW(2 * i + 1) = t.VsrW(2 * i);                            \
     }                                                                 \
                                                                       \
     *xt = t;                                                          \
-    do_float_check_status(env, sfprf, GETPC());                       \
+    do_float_check_status(env, sfifprf, GETPC());                     \
 }
 
 VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
@@ -2733,9 +2733,9 @@ VSX_CVT_FP_TO_FP2(xscvdpsp, 1, float64, float32, 1)
  *   tfld  - target vsr_t field (f32 or f64)
  *   sfprf - set FPRF
  */
-#define VSX_CVT_FP_TO_FP_VECTOR(op, nels, stp, ttp, sfld, tfld, sfprf)    \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                       \
-                 ppc_vsr_t *xt, ppc_vsr_t *xb)                            \
+#define VSX_CVT_FP_TO_FP_VECTOR(op, nels, stp, ttp, sfld, tfld, sfprf)  \
+void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
+                 ppc_vsr_t *xt, ppc_vsr_t *xb)                          \
 {                                                                       \
     ppc_vsr_t t = *xt;                                                  \
     int i;                                                              \
@@ -2767,9 +2767,9 @@ VSX_CVT_FP_TO_FP_VECTOR(xscvdpqp, 1, float64, float128, VsrD(0), f128, 1)
  *   ttp   - target type
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_CVT_FP_TO_FP_HP(op, nels, stp, ttp, sfld, tfld, sfprf) \
+#define VSX_CVT_FP_TO_FP_HP(op, nels, stp, ttp, sfld, tfld, sfifprf) \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
     ppc_vsr_t t = { };                                             \
@@ -2782,13 +2782,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
             float_invalid_op_vxsnan(env, GETPC());                 \
             t.tfld = ttp##_snan_to_qnan(t.tfld);                   \
         }                                                          \
-        if (sfprf) {                                               \
+        if (sfifprf) {                                             \
             helper_compute_fprf_##ttp(env, t.tfld);                \
         }                                                          \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, sfprf, GETPC());                    \
+    do_float_check_status(env, sfifprf, GETPC());                  \
 }
 
 VSX_CVT_FP_TO_FP_HP(xscvdphp, 1, float64, float16, VsrD(0), VsrH(3), 1)
@@ -3035,9 +3035,9 @@ VSX_CVT_FP_TO_INT_VECTOR(xscvqpuwz, float128, uint32, f128, VsrD(0), 0x0ULL)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field
  *   jdef  - definition of the j index (i or 2*i)
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf, r2sp)  \
+#define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfifprf, r2sp)\
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
 {                                                                       \
     ppc_vsr_t t = { };                                                  \
@@ -3048,13 +3048,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
         if (r2sp) {                                                     \
             t.tfld = do_frsp(env, t.tfld, GETPC());                     \
         }                                                               \
-        if (sfprf) {                                                    \
+        if (sfifprf) {                                                  \
             helper_compute_fprf_float64(env, t.tfld);                   \
         }                                                               \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, sfprf, GETPC());                         \
+    do_float_check_status(env, sfifprf, GETPC());                       \
 }
 
 VSX_CVT_INT_TO_FP(xscvsxddp, 1, int64, float64, VsrD(0), VsrD(0), 1, 0)
@@ -3136,9 +3136,9 @@ VSX_CVT_INT_TO_FP_VECTOR(xscvudqp, uint64, float128, VsrD(0), f128)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   rmode - rounding mode
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_ROUND(op, nels, tp, fld, rmode, sfprf)                     \
+#define VSX_ROUND(op, nels, tp, fld, rmode, sfifprf)                   \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
 {                                                                      \
     ppc_vsr_t t = { };                                                 \
@@ -3158,7 +3158,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
         } else {                                                       \
             t.fld = tp##_round_to_int(xb->fld, &env->fp_status);       \
         }                                                              \
-        if (sfprf) {                                                   \
+        if (sfifprf) {                                                 \
             helper_compute_fprf_float64(env, t.fld);                   \
         }                                                              \
     }                                                                  \
@@ -3174,7 +3174,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     }                                                                  \
                                                                        \
     *xt = t;                                                           \
-    do_float_check_status(env, sfprf, GETPC());                        \
+    do_float_check_status(env, sfifprf, GETPC());                      \
 }
 
 VSX_ROUND(xsrdpi, 1, float64, VsrD(0), float_round_ties_away, 1)
-- 
2.36.1


