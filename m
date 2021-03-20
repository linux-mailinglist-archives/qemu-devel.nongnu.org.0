Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A09342D28
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:49:11 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbyY-0006Po-72
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn8-000384-2g
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:22 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn6-0004HV-7O
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u5so14058289ejn.8
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLEsx07yxF/Bt1JL1Eo30fED3vfHhKy7OHokAU6q/Nw=;
 b=N8/2UfstRKqeXxkOf5npk+yhbHNfAqYeLA9j7nelQyyJ46/dBggkL5ge6ZnTTlrMsk
 l8JqJ3bOWphrsWHFFIwE9jmvHKkdwBFM+gbiGabEJVkIbq6Zadcu8KPwfNDWdny44h5+
 0nLPpfqwpFraN+c8mXuEjXagDQ5HBv4JUJt92HMVq86OWg5vZoAsazUD+7hke1UqtKlE
 yBVJJ9dlZRgJ1ktctRtskvUiRhXcfoYvs6bou2ARR0x2LKFaarf18KS/4puPk2CHPcWD
 BcRGIIlK98bIegC/qXx6J5WEn/HTEO29NioB+wNonp5SwTM7GfMT/XqeFg1nUNYnuJMw
 OFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLEsx07yxF/Bt1JL1Eo30fED3vfHhKy7OHokAU6q/Nw=;
 b=jt4Hb6/Ymw+edcbPtAnq1P6xfcNcpN91m49w5nQfPaMQpdn6DGvUpaoNbh16gPCJIM
 SFDB//Fr5JDynoGw4i2Tfe/2SD//mGqhw3wVtAQ0moD76iBvQptG0fkW0U3eNtBhi4uq
 38IlBHqZWdwMAPsqGM7Y4qMUVEypdj9FkInzUsXVEvmKDjAKUTajr4auTGhoUWUHx0hk
 2AuOA/+IwaumFPDhGK7q0epw1sJ88IfycX2FGS/YExu5dBnFXKXttg+MOZo/6fCPblDH
 ttsrhFtR4cQ74eNJ+FiA/5Iah8NNozF7lXhV8VwjeQaLrNUrjRM7NVkSBgkHSmUyyS7r
 vgpg==
X-Gm-Message-State: AOAM5319xN1p5/LyBCTDaQGVD8+piD+5rjLf4pK+zmnxiOGpN9JIjkd7
 J+DENDq+mrt4UJ61Rl/WNSIebw==
X-Google-Smtp-Source: ABdhPJxXHFRvfhdUOhy/gMo451pTUIWNKBsrKGdvfUcgoERowkWG7Yw5pf0ShmCI4rII2kK/9CGhsw==
X-Received: by 2002:a17:907:162b:: with SMTP id
 hb43mr9855705ejc.41.1616247438881; 
 Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h13sm6170051edz.71.2021.03.20.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 543691FF92;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/14] semihosting/arm-compat-semi: unify GET/SET_ARG
 helpers
Date: Sat, 20 Mar 2021 13:36:58 +0000
Message-Id: <20210320133706.21475-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code. Having the
helper will also be useful later.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210312102029.17017-3-alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 56 ++++++++++++-----------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..0f0e129a7c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -767,15 +767,28 @@ static const GuestFDFunctions guestfd_fns[] = {
     },
 };
 
-/* Read the input value from the argument block; fail the semihosting
- * call if the memory read fails.
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails. Eventually we could use a generic
+ * CPUState helper function here.
  */
-#ifdef TARGET_ARM
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+#if defined(TARGET_ARM)
+    return is_a64(env);
+#elif defined(TARGET_RISCV)
+    return !riscv_cpu_is_32bit(env);
+#else
+#error un-handled architecture
+#endif
+}
+
+
 #define GET_ARG(n) do {                                 \
-    if (is_a64(env)) {                                  \
+    if (is_64bit_semihosting(env)) {                    \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(cs, -1);              \
+            return set_swi_errno(cs, -1);               \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
@@ -786,41 +799,10 @@ static const GuestFDFunctions guestfd_fns[] = {
 } while (0)
 
 #define SET_ARG(n, val)                                 \
-    (is_a64(env) ?                                      \
+    (is_64bit_semihosting(env) ?                        \
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
-#endif
 
-#ifdef TARGET_RISCV
-
-/*
- * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
- * we need a macro that fetches a target_ulong
- */
-#define get_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     get_user_u64(arg, p) :                     \
-     get_user_u32(arg, p))
-
-/*
- * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
- * we need a macro that stores a target_ulong
- */
-#define put_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     put_user_u64(arg, p) :                     \
-     put_user_u32(arg, p))
-
-#define GET_ARG(n) do {                                                 \
-        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
-            errno = EFAULT;                                             \
-            return set_swi_errno(cs, -1);                              \
-        }                                                               \
-    } while (0)
-
-#define SET_ARG(n, val)                                 \
-    put_user_utl(val, args + (n) * sizeof(target_ulong))
-#endif
 
 /*
  * Do a semihosting call.
-- 
2.20.1


