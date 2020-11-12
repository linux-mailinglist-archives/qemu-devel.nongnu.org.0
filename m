Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015252B126D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:05:36 +0100 (CET)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLeq-00061q-1r
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbA-0002AS-6x; Thu, 12 Nov 2020 18:01:48 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLb3-0004wn-Qj; Thu, 12 Nov 2020 18:01:43 -0500
Received: by mail-wr1-x441.google.com with SMTP id d12so7683890wrr.13;
 Thu, 12 Nov 2020 15:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gesUKpMLimF8Ec0q9LM84BenUMuPjKxzfPxS37UyoL0=;
 b=QZ///RFpdw/dAhZbKAM99c8b7Iak+XePceeMjx5UwlaIBHW1jrgfUqTnxYPqUeHwE9
 jKh2yozMkNiGDQavmLqs1oQTgIkqBL8fn5B2fBed3w5IGS33XUWHVWLTf6SvsmXdyOPi
 XltQlnwXLDAZzyBEPeg/l0q2d6pq8xvywjwkaSLn7OwLHx6WvP749Yyxz6Zzusj7Ey/6
 ndF/1u4yAZbxPruak0eO9yR/rM7Tdxi3HW7YNf8VxB1RytB7xtk+OGQ/OoPALwDhb63L
 ad28jH5zsfJAv2qbYYQA1210ItiIyqoZZzJA8Gz0Q3mrAl0kc/1zbFiLKVPQRZBQpXOQ
 U8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gesUKpMLimF8Ec0q9LM84BenUMuPjKxzfPxS37UyoL0=;
 b=eaMcznx+7EVYIc4CK3U2oOuvI5sUZggP19ZlWHcdVBIKfOOZd9d34rplg79JBinioc
 qkgmW/pnov1yt7Sel5vAuV/TyyElMI3l6k7be/llY2T8M4sIY6Ee8QpSUDBqktL+TLuI
 R+dQ4AuDM8Eyp1PItKL0p/C97oQCajZBGJIhefkJp2gK8+FgYoILFJ/7YYfkSdHxEGcJ
 Q6Y27Uy8CQNteh4KVm+ye62DJTJMC8YpbLAUYllVTK6w/aF7WtEa3xJbvyV5jlcO+h3T
 FXSFXr0t67ADf+2kk1lpEeakmmxFw1RhKZ2pvukyx72fp88KdbiFj39NTAWVwAjPjEGF
 kAMA==
X-Gm-Message-State: AOAM532oTjvsMB8fWgEz9CwpppYsruX8qXMYh5cyeUWsZnN7ZuDxkSRc
 mVzzC9Q/hwa5ci/LJTxeTf7PyIpw3kuE0g==
X-Google-Smtp-Source: ABdhPJy3SrdSGwaevnSQvVicnxjOkn2mZlpIIoQ8ReuZzOtwnIFWEAWMUBYNcMJqOXuallQeCjFbWA==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr2093269wru.405.1605222099557; 
 Thu, 12 Nov 2020 15:01:39 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id v16sm8326184wml.33.2020.11.12.15.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:39 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] ppc/translate: Turn the helper macros into functions
Date: Fri, 13 Nov 2020 00:01:28 +0100
Message-Id: <20201112230130.65262-3-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112230130.65262-1-thatlemon@gmail.com>
References: <20201112230130.65262-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 222 ++++++++++++++++++++++------------------
 1 file changed, 120 insertions(+), 102 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index b07ff66375..6600520221 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2467,113 +2467,131 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     do_float_check_status(env, GETPC());
 }
 
-#define VSX_SCALAR_CMP(op, ordered)                                      \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                           \
-{                                                                        \
-    uint32_t cc = 0;                                                     \
-    bool vxsnan_flag = false, vxvc_flag = false;                         \
-                                                                         \
-    helper_reset_fpstatus(env);                                          \
-                                                                         \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
-        vxsnan_flag = true;                                              \
-        if (fpscr_ve == 0 && ordered) {                                  \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
-               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        if (ordered) {                                                   \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    }                                                                    \
-    if (vxsnan_flag) {                                                   \
-        float_invalid_op_vxsnan(env, GETPC());                           \
-    }                                                                    \
-    if (vxvc_flag) {                                                     \
-        float_invalid_op_vxvc(env, 0, GETPC());                          \
-    }                                                                    \
-                                                                         \
-    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
-    case float_relation_less:                                            \
-        cc |= CRF_LT;                                                    \
-        break;                                                           \
-    case float_relation_equal:                                           \
-        cc |= CRF_EQ;                                                    \
-        break;                                                           \
-    case float_relation_greater:                                         \
-        cc |= CRF_GT;                                                    \
-        break;                                                           \
-    case float_relation_unordered:                                       \
-        cc |= CRF_SO;                                                    \
-        break;                                                           \
-    }                                                                    \
-                                                                         \
-    env->fpscr &= ~FP_FPCC;                                              \
-    env->fpscr |= cc << FPSCR_FPCC;                                      \
-    env->crf[BF(opcode)] = cc;                                           \
-                                                                         \
-    do_float_check_status(env, GETPC());                                 \
+static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
+                                 int crf_idx, bool ordered)
+{
+    uint32_t cc;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
+        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
+        vxsnan_flag = true;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
+               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {
+    case float_relation_less:
+        cc = CRF_LT;
+        break;
+    case float_relation_equal:
+        cc = CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc = CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc = CRF_SO;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
+}
+
+void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), true);
+}
+
+void helper_xscmpudp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), false);
 }
 
-VSX_SCALAR_CMP(xscmpodp, 1)
-VSX_SCALAR_CMP(xscmpudp, 0)
+static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
+                                  ppc_vsr_t *xb, int crf_idx, bool ordered)
+{
+    uint32_t cc;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
+        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
+        vxsnan_flag = true;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
+               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {
+    case float_relation_less:
+        cc = CRF_LT;
+        break;
+    case float_relation_equal:
+        cc = CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc = CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc = CRF_SO;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
-#define VSX_SCALAR_CMPQ(op, ordered)                                    \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                          \
-{                                                                       \
-    uint32_t cc = 0;                                                    \
-    bool vxsnan_flag = false, vxvc_flag = false;                        \
-                                                                        \
-    helper_reset_fpstatus(env);                                         \
-                                                                        \
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||         \
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {         \
-        vxsnan_flag = true;                                             \
-        cc = CRF_SO;                                                    \
-        if (fpscr_ve == 0 && ordered) {                                 \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||      \
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {      \
-        cc = CRF_SO;                                                    \
-        if (ordered) {                                                  \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    }                                                                   \
-    if (vxsnan_flag) {                                                  \
-        float_invalid_op_vxsnan(env, GETPC());                          \
-    }                                                                   \
-    if (vxvc_flag) {                                                    \
-        float_invalid_op_vxvc(env, 0, GETPC());                         \
-    }                                                                   \
-                                                                        \
-    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
-    case float_relation_less:                                           \
-        cc |= CRF_LT;                                                   \
-        break;                                                          \
-    case float_relation_equal:                                          \
-        cc |= CRF_EQ;                                                   \
-        break;                                                          \
-    case float_relation_greater:                                        \
-        cc |= CRF_GT;                                                   \
-        break;                                                          \
-    case float_relation_unordered:                                      \
-        cc |= CRF_SO;                                                   \
-        break;                                                          \
-    }                                                                   \
-                                                                        \
-    env->fpscr &= ~FP_FPCC;                                             \
-    env->fpscr |= cc << FPSCR_FPCC;                                     \
-    env->crf[BF(opcode)] = cc;                                          \
-                                                                        \
-    do_float_check_status(env, GETPC());                                \
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
+}
+
+void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), true);
 }
 
-VSX_SCALAR_CMPQ(xscmpoqp, 1)
-VSX_SCALAR_CMPQ(xscmpuqp, 0)
+void helper_xscmpuqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), false);
+}
 
 /*
  * VSX_MAX_MIN - VSX floating point maximum/minimum
-- 
2.27.0


