Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC8347AD3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:35:57 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4bz-000369-RD
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Ws-0006Vg-40
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wq-0007NF-74
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so2817710wma.0
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPK6HS62SnTfNvabHBBC22/tzKk4JYeDFr2rp0SujyI=;
 b=yE2FcFsYrYJT31CK77sFtSy/8Z8nIY9K3pnoZP0NT/54cp4ApXVbG+vftDaW/B1sxl
 EAqOgmFtXarpLWT3bh2barFHmjKksv6PAsKleENXvcG0lL6+Jh/h5p0ihAbSdSJ2LSWe
 EXEs0ETuPF6/wOH6AVQuJe/77lH+eriFe6WRQPya7ppdxZGNGKl+pPNrrL5QyUJ0EXYl
 cgGCLL035s1Q6uhu0D7zl5ektQgA7DKdyYL9SOPSVqUksxJCEAOYVfGi+v/8FlI5wCNd
 YdA8nFGxe4DOqIYFdh34A4IFQnwSZNd653j+Ozm+gEphK++Pad9OLrRXwc6G0Q1H2/yb
 WDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPK6HS62SnTfNvabHBBC22/tzKk4JYeDFr2rp0SujyI=;
 b=khCPq5bvndpXToGz/N45o62aSiNQsHUDC63wQL3Ycd0uFgM4/rnYur9wv7pzX1qSKG
 NXR8kie7aegIY+h24RNPFOS400038de046GjaSrC6Z10BbLC9MlXC2WESdw0d9/trs20
 uChzIp35HZPsqBO/hVe9LUM7K29G3L8yxAjPtOqrPG394aMOL9zh8UoYHlOROGyqb0f5
 9tvdDA/Q56cJnkTwzIJCrUWQX2GpU0ZiTnQ0M15hoykpbdMfv06QdWzJo074Nd+IHghj
 GClcolwqwyyBqfzjKj2xKhOTPCbtTaY9MNVmNOnJblWEvSfT8rD6jbuu7ab+PJNPiipc
 rYAQ==
X-Gm-Message-State: AOAM532aNyMddTaKCYWeraMSHYRCIQv2rRk4OTDzKLh9Px6jns71SBc3
 lwUXPOF4XGEqGF4ynGMBWlbupw==
X-Google-Smtp-Source: ABdhPJwkoN8nBRkQ9piqjkMI+UgmAFOOfzzfzmQtEX3iledI9adoBeIKG29njRg979UCI0oxjWLHSw==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr3263525wmp.121.1616596234789; 
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm3321553wrr.58.2021.03.24.07.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5124E1FF92;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/22] semihosting/arm-compat-semi: unify GET/SET_ARG helpers
Date: Wed, 24 Mar 2021 14:30:05 +0000
Message-Id: <20210324143021.8560-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code. Having the
helper will also be useful later.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210323165308.15244-7-alex.bennee@linaro.org>

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


