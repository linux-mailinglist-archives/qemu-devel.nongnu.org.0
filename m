Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9033287E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:23:54 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdH7-0007GB-Ky
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdB1-0001L9-KH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdAz-0001iF-Ka
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id a18so15867609wrc.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joRSekChbA2FSdcIDUV4Rc5Up/Vr8KMhyFb2Cl5+fLs=;
 b=y1F7PChOqkextOtYB9k8YXreCJZDMUJTnF09fdfiqUsT9KVHeycKhkKrmgem+PATYJ
 ZRpixpTuHgTo6zbOeZLSFgUaVAUCPdjtdmEcVxoZ87OHugCKTGOsHA2J01fKmkn41qrz
 4sCHYGLUWbQ4mnikoDBfu7sI1S3294svw9ECTaN4f5L45YMEFbHykgaJfrLZcMJ5tf0J
 /Z326dPqwQOimQLWgNKM8CrEKkodyi+xSVzRjEJRscTcFlKtcc2LnBLNirgsxxOPO2mz
 BTSnWWN4pu2lKfgUZhIPxvDuvz4k5j60asXjWSdCnxZAq9GzwDz5ZmkQR4W34auyCmdM
 Pixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=joRSekChbA2FSdcIDUV4Rc5Up/Vr8KMhyFb2Cl5+fLs=;
 b=hu9Tntsrt9xuRv9QumdBprL97EQpGprgbcSmyqt6SUWacjbvmxWekrQXYOszvmVYnd
 5pzHiJrvztMjn+gvd1LoMi135ulxejQXPJdQ3gJ58b4Gz4uYA1P2Tq2wMQjk8ps1YAEG
 re/YukPDVaXKQi9k4v9TC6JB0YjVKJHwzfhO/qNfzlXfARlNAQv5VpnOok7vsGm2vN9S
 PT3MhskIymzQjhOTJyY7Lc0cmZdczTiffeA3myv8uu8i/ojYyNQ+ipqUVWoYE5rpnADV
 IHMZhW0+cTGUkkFeZbzkNcT65Q9SwC33qZWFHrsdE0ZisDQL/sc0lf8r2vVJbt+9kABR
 ClvQ==
X-Gm-Message-State: AOAM531umJh6PYKULEZ2LsIezQ//0Tz884eots8NGHRU9UEsQQioSDao
 EzE5u9sPzS2Qs66PtX1EVFvMb23IhQ6mHw==
X-Google-Smtp-Source: ABdhPJwhz5QZ/d0m3y5tyd6y1iANvithNdv0Lk4ttrqYrgRtzwzx2iGJIQGK53zT+CRcti/3/Ey9nQ==
X-Received: by 2002:adf:a406:: with SMTP id d6mr28779773wra.141.1615299452273; 
 Tue, 09 Mar 2021 06:17:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z25sm4182503wmi.23.2021.03.09.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:17:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 470081FF8C;
 Tue,  9 Mar 2021 14:17:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] semihosting/arm-compat-semi: unify GET/SET_ARG helpers
Date: Tue,  9 Mar 2021 14:17:25 +0000
Message-Id: <20210309141727.12522-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309141727.12522-1-alex.bennee@linaro.org>
References: <20210309141727.12522-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: keithp@keithp.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 54 ++++++++++++-----------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..733eea1e2d 100644
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
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
 #ifdef TARGET_ARM
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


