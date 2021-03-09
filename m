Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00C332F13
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:35:34 +0100 (CET)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi8j-0001Di-FU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg34-0003az-RF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:34 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg32-0003ra-Sj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id hs11so29877203ejc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2LvglrxP6LVVT9OEB0NOZldt8R6l+wqFUrx+5/Or9E=;
 b=Eyy8FQB0NthfNw2Rb9CLuWT62FhcUZlhcgJW8LcKOhxNP/kvZZrdbvYjioaFIBPXT8
 +5XktAIY+0Ky+E3RQmNmiNvuepE/wTSJdLdUfk5DXDIn8g35BlxzDjGwzmMb7p4+QJwC
 K3usEiwKHpCwG04vqtijuMrxSLH38f1gW3VFa9A9P00v7S5CQfl+F2MQrIyc1XRFWKm0
 E8rYrqpVFutOTOIfdXNCBZPTfZvfCaNs/pWkxDV0ETQ3d0eqbsuo5qtIiGZYHHL3923J
 n+5XNI5NMBrhZ3DIihTz/3gGp80UtrXDjI7u2lqR5tMbPifEfy0QkyB6RlYpw+Dd962X
 gnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2LvglrxP6LVVT9OEB0NOZldt8R6l+wqFUrx+5/Or9E=;
 b=AQcT9eyuv3TxISfDUdxpQQsda9fStSbwxeJrMy1kTT36SothYIv6e6mt/pfByPtA6B
 LKn/WpmyI4CXvYkFujLCU2UeqJB470MX4iJ59f1zagK0kApmkkr/bDEM+01drEzrbeda
 NmepRKzq5IWsiA0xdM+n2IWykcpH3/uE1btpTJ9O23cZYNsHGN71ddZdX+gHOesrLFI2
 P/C6KqJWzeAqbkXak2QrPCsXtwOb9A0it57v9Fw5HysFLnzAZzKQlabPsl9GoVZD7ePt
 oQZgZtm4SU4xyY2YtGHzeiAcaCSVpgYtZKdpr4H6B8fwTfU3o8XDZTs4rzC0/v6u7OKO
 0K6Q==
X-Gm-Message-State: AOAM530uT24pwXDkdo7iLYGmJIIfmdIlBI8vzTMOx0aSHUZbztiQbNGE
 dYltM4zkV9MiLe4gMHLnk5uYVQ==
X-Google-Smtp-Source: ABdhPJwuzaSS7U1/+xPOEkFxZIBg5ynATGQz82XxWNF97ToGN0mANLcu/QH+NIZWA77L1/0YodXWUw==
X-Received: by 2002:a17:906:5453:: with SMTP id
 d19mr20953760ejp.150.1615310491467; 
 Tue, 09 Mar 2021 09:21:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm8626664ejk.52.2021.03.09.09.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:21:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53C6A1FF8C;
 Tue,  9 Mar 2021 17:21:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] semihosting/arm-compat-semi: unify GET/SET_ARG helpers
Date: Tue,  9 Mar 2021 17:21:25 +0000
Message-Id: <20210309172127.20470-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
References: <20210309172127.20470-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code. Having the
helper will also be useful later.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v3
  - consistent #ifdeffery
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


