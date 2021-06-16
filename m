Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B93A8E49
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:23:47 +0200 (CEST)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKHS-0002C4-Fk
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6a-0005fi-MZ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:34 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6Q-0008TR-Ac
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso748667pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7P6aK0Xlt7Wqq1Vaq4hTczk8Q+yU+JFeTGVvn77Fon4=;
 b=jfvOgkmlTDRzoViZrZSiMCHBd/PCUZMjWLXHppbBIDAP8JsUvQyTN5q0yqGlvsKeJ7
 88z2ViNQ9EBMDGT3Gv68KBnmyjmSVCem/JMJFQpsyuoWORqsLOdZ5P27U5LQH4kgPyDJ
 AkR1uVKqhifFD+mIlADbQkcXZoZ6Ktv9IuJhnucddp6wux3yQU9hQFwN2UwKy8RyWHoO
 XZeMhf4sjervF9v2dtA/1HXV9/9vkzd02SYp7qv6FkY5owYOdgwHP9gO8g2wfu5Aqr9h
 ExdmaMDuczlnoK7IpfBLYO9rwewxZ5d9rjGXkz0RlzBI7H7TBO8PwHLl6lVNHA3QJSEP
 /MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7P6aK0Xlt7Wqq1Vaq4hTczk8Q+yU+JFeTGVvn77Fon4=;
 b=gF8UNzvseuBUp1MR8xpaWYwvGpJi5DmlJpfgZ+CVkdZHUokc0+U4ME442w76zC+wE/
 is7c5Y32KlT4DiCeg5lwB1jEY2jl9I80NdsUaXQjcjLWwLqCmUSitOpIYTLLIut3BksI
 bFfgFnK/+LbIJsdzYKFAv/SzoR9vdRPEUnCupmJ9vVt4YUvflczv5KSjmyuRNdXVYJBa
 gUNEwVOE8XmtVofBH2iau0GvjW446K6KzXuCmrfofMbtSmAANIZFf27CgKgLlGXpGFFn
 SoowmBrf8dWvVrmRTPmnmknOLi3xpUGhaP2qYOJz1jKkgqVMxQND8V3kvKxpT7OqYiPs
 MnHg==
X-Gm-Message-State: AOAM530jZowUiy4czQegGxo4yvxsfMcCXdZIYs/f6uIWRo744X3diyT3
 qEM92BYu+sIEcdnLLUQhiZdAExlHiwGcWA==
X-Google-Smtp-Source: ABdhPJwoPsUrEYN0R/c6To9MyYDz9AtG4LwYkV7y89qtWzopD6ytMnJgA61M78sk2tn7cAt7WE1EYQ==
X-Received: by 2002:a17:902:d701:b029:115:d3d8:94d2 with SMTP id
 w1-20020a170902d701b0290115d3d894d2mr6634336ply.23.1623805941084; 
 Tue, 15 Jun 2021 18:12:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/21] linux-user/riscv: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:04 -0700
Message-Id: <20210616011209.1446045-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: qemu-riscv@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

This fixes a bug wrt libgcc fallback unwinding.  It expects
the stack pointer to point to the siginfo_t, whereas we had
inexplicably placed our private signal trampoline at the start
of the signal frame instead of the end.  Now moot because we
have removed it from the stack frame entirely.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/target_signal.h |  2 ++
 linux-user/riscv/signal.c        | 22 +++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
index f113ba9a55..3e36fddc9d 100644
--- a/linux-user/riscv/target_signal.h
+++ b/linux-user/riscv/target_signal.h
@@ -15,4 +15,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* RISCV_TARGET_SIGNAL_H */
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9a..4086dfa5d5 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -46,7 +46,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -104,12 +103,6 @@ static void setup_ucontext(struct target_ucontext *uc,
     setup_sigcontext(&uc->uc_mcontext, env);
 }
 
-static inline void install_sigtramp(uint32_t *tramp)
-{
-    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
-    __put_user(0x00000073, tramp + 1);  /* ecall */
-}
-
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPURISCVState *env)
@@ -126,14 +119,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
-    install_sigtramp(frame->tramp);
 
     env->pc = ka->_sa_handler;
     env->gpr[xSP] = frame_addr;
     env->gpr[xA0] = sig;
     env->gpr[xA1] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[xA2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[xRA] = frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[xRA] = default_rt_sigreturn;
 
     return;
 
@@ -202,3 +194,15 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
+    __put_user(0x00000073, tramp + 1);  /* ecall */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


