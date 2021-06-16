Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C693A8E59
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:26:48 +0200 (CEST)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKKN-00021W-7B
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6n-0005lA-Ur
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6R-0008UX-Uq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g4so750120pjk.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YW5guTHBvWRMH5moaLCydApEzADr3l/GtZeuUgDhrc=;
 b=aMkJ4w/Yny6+pdVD3hYHRBvqRE/lqIl3BBbUEd3d1QYWLir1opI0DYlnvy8Eh27RB3
 AoQQBvLHLsRDQFRifL59EabzRchHKSoGd/VFWH+Ycw/AZtw5sqG+X1NU3xuMJA2qdk2h
 czZUQ7rNOHm3T5vMiAzT0gUDLCe8mIDZ+BCeg9MMP+qJX3fAcHxn+PD8y5vUwqzXKXnb
 6rwX1wDNTk+eoFtGyEuhIuiC4WbjOianqTmWCRrLxmEZQMHPY1BuJZ7HwM3iDZOu4Fzb
 QW9Egqhmh3S2dJ6JQIapv7AhImMszNNT9NXFaRV6Zk1MMqhLYlNB6Tt6jRn8tJyzocnE
 8LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YW5guTHBvWRMH5moaLCydApEzADr3l/GtZeuUgDhrc=;
 b=MhTSrfesRob+lTa5etzWAqJYspf9WMQQ3JgA9cXOCC8e3hID6gmKeEfWR5D1eyNGy+
 75SISw/UqK6g1/9Ogf0joyN8g1zWXEkWFxbZYL5LzI3UBttE7zKo1aYPCE1ym4AwGr1p
 gTkjp/Fu8x622rL5zJjKJKw9S/Ux+0N3u7xtRKBK4/8/W/M5qj9PQYdZf0mKS2sBB5md
 HxgWk+WYtKaHs06M6auS6lWQCPf8wWMptEzzbURfeNgeXGPMRNXdAKuTRnoa1z1qtcPb
 8Qb18j24o/1YbNojzxX9IngLZ62FuzqMhHWjk+uTRiAo3hsI4ss+Wv7Vcra126lxQVGh
 L8kw==
X-Gm-Message-State: AOAM533Y7CuYwpRmlBhtsS9V4hsxDJZpe21MYAhFLlMtQ3mIrxcEXR4/
 KSJ0AJTVYRupZO/U5tyfG7JLllbG2MUrwg==
X-Google-Smtp-Source: ABdhPJxB4Tg3Wp7+gq1klXZ8EQUNXyjgP3xE97RAnzmdWSUX1oOLbKGyyc7h+ZHP3rcsmrgkLvXv9w==
X-Received: by 2002:a17:902:9049:b029:116:e060:c464 with SMTP id
 w9-20020a1709029049b0290116e060c464mr6815773plz.1.1623805942712; 
 Tue, 15 Jun 2021 18:12:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/21] linux-user/sparc: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:07 -0700
Message-Id: <20210616011209.1446045-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  4 ++++
 linux-user/sparc/signal.c        | 32 ++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 34f9a12519..e661ddd6ab 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+#else
+/* For sparc64, use of KA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
 
 /* bit-flags */
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570..65e9b7f8b4 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -290,13 +290,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] = sf_addr +
-                offsetof(struct target_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_sigreturn, %g1 */
-        __put_user(0x821020d8u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -357,13 +351,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] =
-            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_rt_sigreturn, %g1 */
-        __put_user(0x82102065u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -774,4 +762,20 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+#else
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(0x821020d8u, &tramp[0]);   /* mov __NR_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);   /* t 0x10 */
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    __put_user(0x82102065u, &tramp[2]);   /* mov __NR_rt_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[3]);   /* t 0x10 */
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
-- 
2.25.1


