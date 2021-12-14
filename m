Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2E4739A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:35:38 +0100 (CET)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvn8-0000C1-0G
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:35:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve8-00088c-OY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:20 -0500
Received: from [2607:f8b0:4864:20::432] (port=44688
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve3-0005SQ-Hq
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:19 -0500
Received: by mail-pf1-x432.google.com with SMTP id k64so16382094pfd.11
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OXKTkD0XslX3F2mSmJn4vyqwKgYwlny2SKE6rytHBgc=;
 b=nfyhGvaJUFdaFde7h+VFWOWbrT1o1m0k7e121M7NzSmwkwAcyDK/P/ubshx7n1vYyn
 q7YnSjh1N9PWA4Ja1Ln0QZsnbRqUPAUOsoLnbS9DaSnSb6DYUUnv7iCKzOvURjffTV0G
 ImEfv8s7nR9nMf/O5rsyYdG4gPTdu5wSANeTW5q0Cj1ujmH8kX3KvFiP1+CTBnW/NLvw
 ViGtkYfFVGuZK0IQXN8CfY+TF6lzeI30MGTjeZaoi7pGw43mGJcG3tIBtd/oO+rj5y+U
 Tl0ZpKa4jAQOWmoqkB/opBdVOwsJi0kY83creKxTH0AwMIXc19y0m/wnJIk5kStFnywH
 JXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OXKTkD0XslX3F2mSmJn4vyqwKgYwlny2SKE6rytHBgc=;
 b=TiK1N20eQr3hdEpkizxQV9gcLSRGuyjaaswZsS77U88J12Id2rnfdSkESQWDlfQN7J
 vFoTpANA/154M+nY12O1L4u2jb1EzCT0fWtJBJMPAEBkMWFukF4oksRhPDXXsQy4Iuov
 uAtcG3wGTN0pVSGzs5rYEAcZd7uZb+7xdX3Fqa/c8doRMCqV7+BRW5KBAdVC0m8+CkNT
 yjNG5hpBkQrZA4oQDZIPUDFACcuTcEZoXcbftVehTxMq/ZZOVMNgO5IfV4rs9gTYn6G2
 efx+YCRlB05fHf0HaUE/jNMHplLr8QFmFEclrM8L137taT56sYEp8n7oSzYH0Bmg+VQS
 5fdw==
X-Gm-Message-State: AOAM530X5uttNxThHiWtGkf6HY3gvczHTCfbVVjtUUsA4dcOHmmrzM30
 +9TsGBFVZW5AYxlmsmZH+ihwZBF/JJVBww==
X-Google-Smtp-Source: ABdhPJwBrSygfuQH8sPkbHqTYTnH0TFCyiJps+3TNN/T655cm1GFRpXL2lheLUGmOI2Dkj1GT15jpA==
X-Received: by 2002:a63:5754:: with SMTP id h20mr1352523pgm.475.1639441574114; 
 Mon, 13 Dec 2021 16:26:14 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/15] linux-user: Rename TARGET_QEMU_ESIGRETURN to
 QEMU_ESIGRETURN
Date: Mon, 13 Dec 2021 16:25:57 -0800
Message-Id: <20211214002604.161983-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/generic/target_errno_defs.h |  2 +-
 linux-user/aarch64/cpu_loop.c          |  2 +-
 linux-user/aarch64/signal.c            |  4 ++--
 linux-user/alpha/cpu_loop.c            |  2 +-
 linux-user/alpha/signal.c              |  8 ++++----
 linux-user/arm/cpu_loop.c              |  2 +-
 linux-user/arm/signal.c                |  8 ++++----
 linux-user/cris/cpu_loop.c             |  2 +-
 linux-user/cris/signal.c               |  4 ++--
 linux-user/hexagon/cpu_loop.c          |  2 +-
 linux-user/hexagon/signal.c            |  2 +-
 linux-user/hppa/cpu_loop.c             |  2 +-
 linux-user/hppa/signal.c               |  4 ++--
 linux-user/i386/cpu_loop.c             |  6 +++---
 linux-user/i386/signal.c               |  8 ++++----
 linux-user/m68k/cpu_loop.c             |  2 +-
 linux-user/m68k/signal.c               |  8 ++++----
 linux-user/microblaze/cpu_loop.c       |  2 +-
 linux-user/microblaze/signal.c         |  4 ++--
 linux-user/mips/cpu_loop.c             |  2 +-
 linux-user/mips/signal.c               |  8 ++++----
 linux-user/openrisc/cpu_loop.c         |  2 +-
 linux-user/ppc/cpu_loop.c              |  2 +-
 linux-user/ppc/signal.c                | 10 +++++-----
 linux-user/riscv/cpu_loop.c            |  2 +-
 linux-user/riscv/signal.c              |  2 +-
 linux-user/s390x/cpu_loop.c            |  2 +-
 linux-user/s390x/signal.c              |  8 ++++----
 linux-user/sh4/cpu_loop.c              |  2 +-
 linux-user/sh4/signal.c                |  8 ++++----
 linux-user/sparc/cpu_loop.c            |  2 +-
 linux-user/sparc/signal.c              |  8 ++++----
 linux-user/syscall.c                   |  2 +-
 linux-user/xtensa/cpu_loop.c           |  2 +-
 linux-user/xtensa/signal.c             |  4 ++--
 35 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/target_errno_defs.h
index 58a06a10d6..bb37d88be9 100644
--- a/linux-user/generic/target_errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -162,6 +162,6 @@
  * ERESTART_NOINTR (which is kernel internal) to guarantee that we won't
  * clash with a valid guest errno now or in the future.
  */
-#define TARGET_QEMU_ESIGRETURN 513     /* Return from signal */
+#define QEMU_ESIGRETURN 513     /* Return from signal */
 
 #endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 775ba43913..98b53962cd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -101,7 +101,7 @@ void cpu_loop(CPUARMState *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->xregs[0] = ret;
             }
             break;
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 29c52db3f1..df9e39a4ba 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -556,12 +556,12 @@ long do_rt_sigreturn(CPUARMState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
  badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_sigreturn(CPUARMState *env)
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index ce9b251ce3..37c33f0ccd 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -102,7 +102,7 @@ void cpu_loop(CPUAlphaState *env)
                     env->pc -= 4;
                     break;
                 }
-                if (sysret == -TARGET_QEMU_ESIGRETURN) {
+                if (sysret == -QEMU_ESIGRETURN) {
                     break;
                 }
                 /* Syscall writes 0 to V0 to bypass error check, similar
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index bbe3dd175a..4ec42994d4 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -225,11 +225,11 @@ long do_sigreturn(CPUAlphaState *env)
 
     restore_sigcontext(env, sc);
     unlock_user_struct(sc, sc_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUAlphaState *env)
@@ -249,13 +249,13 @@ long do_rt_sigreturn(CPUAlphaState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 1fcf19750e..f153ab503a 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -409,7 +409,7 @@ void cpu_loop(CPUARMState *env)
                                      0, 0);
                     if (ret == -QEMU_ERESTARTSYS) {
                         env->regs[15] -= env->thumb ? 2 : 4;
-                    } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+                    } else if (ret != -QEMU_ESIGRETURN) {
                         env->regs[0] = ret;
                     }
                 }
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index df9f8e8eb2..cf99fd7b8a 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -511,12 +511,12 @@ long do_sigreturn(CPUARMState *env)
     }
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUARMState *env)
@@ -546,12 +546,12 @@ long do_rt_sigreturn(CPUARMState *env)
     }
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 /*
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index f3e5b13f89..5213aebf55 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -52,7 +52,7 @@ void cpu_loop(CPUCRISState *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->regs[10] = ret;
             }
             break;
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 7f6aca934e..4f532b2903 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -177,10 +177,10 @@ long do_sigreturn(CPUCRISState *env)
 
     restore_sigcontext(&frame->sc, env);
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUCRISState *env)
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 1cacbf42f1..b84e25bf71 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -56,7 +56,7 @@ void cpu_loop(CPUHexagonState *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->gpr[HEX_REG_PC] -= 4;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->gpr[0] = ret;
             }
             break;
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 74e61739a0..ad4e3822d5 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -268,7 +268,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
     target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 5315224d12..a47a63176b 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -134,7 +134,7 @@ void cpu_loop(CPUHPPAState *env)
                 env->iaoq_b = env->gr[31] + 4;
                 break;
             case -QEMU_ERESTARTSYS:
-            case -TARGET_QEMU_ESIGRETURN:
+            case -QEMU_ESIGRETURN:
                 break;
             }
             break;
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index c2fbc26ebb..962f551c04 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -191,9 +191,9 @@ long do_rt_sigreturn(CPUArchState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
  badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fbd9a353e5..9aaae93e2f 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -181,7 +181,7 @@ static void emulate_vsyscall(CPUX86State *env)
                      env->regs[R_EDX], env->regs[10], env->regs[8],
                      env->regs[9], 0, 0);
     g_assert(ret != -QEMU_ERESTARTSYS);
-    g_assert(ret != -TARGET_QEMU_ESIGRETURN);
+    g_assert(ret != -QEMU_ESIGRETURN);
     if (ret == -TARGET_EFAULT) {
         goto sigsegv;
     }
@@ -225,7 +225,7 @@ void cpu_loop(CPUX86State *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
             }
             break;
@@ -243,7 +243,7 @@ void cpu_loop(CPUX86State *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
             }
             break;
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 433efa3d69..4372621a4d 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -559,12 +559,12 @@ long do_sigreturn(CPUX86State *env)
     if (restore_sigcontext(env, &frame->sc))
         goto badframe;
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 #endif
 
@@ -588,12 +588,12 @@ long do_rt_sigreturn(CPUX86State *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 #ifndef TARGET_X86_64
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index b03c21a3dc..3181594414 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -82,7 +82,7 @@ void cpu_loop(CPUM68KState *env)
                                  0, 0);
                 if (ret == -QEMU_ERESTARTSYS) {
                     env->pc -= 2;
-                } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+                } else if (ret != -QEMU_ESIGRETURN) {
                     env->dregs[0] = ret;
                 }
             }
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index ec33482e14..5f35354487 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -353,11 +353,11 @@ long do_sigreturn(CPUM68KState *env)
     restore_sigcontext(env, &frame->sc);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUM68KState *env)
@@ -381,12 +381,12 @@ long do_rt_sigreturn(CPUM68KState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 6e368f986e..ff1fb26c8b 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -56,7 +56,7 @@ void cpu_loop(CPUMBState *env)
             if (ret == -QEMU_ERESTARTSYS) {
                 /* Wind back to before the syscall. */
                 env->pc -= 4;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->regs[3] = ret;
             }
             /* All syscall exits result in guest r14 being equal to the
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 8ebb6a1b7d..5188d74025 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -207,12 +207,12 @@ long do_rt_sigreturn(CPUMBState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
  badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 64f308c6ad..32f9fc1c1c 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -145,7 +145,7 @@ done_syscall:
                 env->active_tc.PC -= 4;
                 break;
             }
-            if (ret == -TARGET_QEMU_ESIGRETURN) {
+            if (ret == -QEMU_ESIGRETURN) {
                 /* Returning from a successful sigreturn syscall.
                    Avoid clobbering register state.  */
                 break;
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 8f79e405ec..58a9d7a8a3 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -281,11 +281,11 @@ long do_sigreturn(CPUMIPSState *regs)
     /* I am not sure this is right, but it seems to work
     * maybe a problem with nested signals ? */
     regs->CP0_EPC = 0;
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 # endif /* O32 */
 
@@ -371,11 +371,11 @@ long do_rt_sigreturn(CPUMIPSState *env)
     /* I am not sure this is right, but it seems to work
     * maybe a problem with nested signals ? */
     env->CP0_EPC = 0;
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 3147ab2b62..592901a68b 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUOpenRISCState *env)
                              cpu_get_gpr(env, 8), 0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 cpu_set_gpr(env, 11, ret);
             }
             break;
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 5348641e9e..30c82f2354 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -432,7 +432,7 @@ void cpu_loop(CPUPPCState *env)
                 env->nip -= 4;
                 break;
             }
-            if (ret == (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {
+            if (ret == (target_ulong)(-QEMU_ESIGRETURN)) {
                 /* Returning from a successful sigreturn syscall.
                    Avoid corrupting register state.  */
                 break;
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 90a0369632..176c9d8503 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -591,13 +591,13 @@ long do_sigreturn(CPUPPCState *env)
 
     unlock_user_struct(sr, sr_addr, 1);
     unlock_user_struct(sc, sc_addr, 1);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 sigsegv:
     unlock_user_struct(sr, sr_addr, 1);
     unlock_user_struct(sc, sc_addr, 1);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 #endif /* !defined(TARGET_PPC64) */
 
@@ -646,12 +646,12 @@ long do_rt_sigreturn(CPUPPCState *env)
     target_restore_altstack(&rt_sf->uc.tuc_stack, env);
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 sigsegv:
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 /* This syscall implements {get,set,swap}context for userland.  */
@@ -704,7 +704,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
             /* We cannot return to a partially updated context.  */
             force_sig(TARGET_SIGSEGV);
         }
-        return -TARGET_QEMU_ESIGRETURN;
+        return -QEMU_ESIGRETURN;
     }
 
     return 0;
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 20f8c48b1d..0cd8985cb8 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -71,7 +71,7 @@ void cpu_loop(CPURISCVState *env)
             }
             if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->gpr[xA0] = ret;
             }
             if (cs->singlestep_enabled) {
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index a0f9542ce3..296e39fbf0 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -188,7 +188,7 @@ long do_rt_sigreturn(CPURISCVState *env)
     target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 043582ca7c..ad0c3cd263 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -85,7 +85,7 @@ void cpu_loop(CPUS390XState *env)
                              env->regs[6], env->regs[7], 0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->psw.addr -= env->int_svc_ilen;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->regs[2] = ret;
             }
             break;
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 676b948147..f47713e04a 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -359,7 +359,7 @@ long do_sigreturn(CPUS390XState *env)
     trace_user_do_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
         force_sig(TARGET_SIGSEGV);
-        return -TARGET_QEMU_ESIGRETURN;
+        return -QEMU_ESIGRETURN;
     }
 
     /* Make sure that we're initializing all of target_set. */
@@ -373,7 +373,7 @@ long do_sigreturn(CPUS390XState *env)
     restore_sigregs_ext(env, &frame->sregs_ext);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUS390XState *env)
@@ -385,7 +385,7 @@ long do_rt_sigreturn(CPUS390XState *env)
     trace_user_do_rt_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
         force_sig(TARGET_SIGSEGV);
-        return -TARGET_QEMU_ESIGRETURN;
+        return -QEMU_ESIGRETURN;
     }
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
 
@@ -397,7 +397,7 @@ long do_rt_sigreturn(CPUS390XState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 6c4ebfa969..3290f6445c 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -52,7 +52,7 @@ void cpu_loop(CPUSH4State *env)
                              0, 0);
             if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
-            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+            } else if (ret != -QEMU_ESIGRETURN) {
                 env->gregs[0] = ret;
             }
             break;
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index faa869fb19..f6a18bc6b5 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -286,12 +286,12 @@ long do_sigreturn(CPUSH4State *regs)
     restore_sigcontext(regs, &frame->sc);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUSH4State *regs)
@@ -313,12 +313,12 @@ long do_rt_sigreturn(CPUSH4State *regs)
     target_restore_altstack(&frame->uc.tuc_stack, regs);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 529337c5e0..8765ab6020 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)
                               env->regwptr[2], env->regwptr[3],
                               env->regwptr[4], env->regwptr[5],
                               0, 0);
-            if (ret == -QEMU_ERESTARTSYS || ret == -TARGET_QEMU_ESIGRETURN) {
+            if (ret == -QEMU_ERESTARTSYS || ret == -QEMU_ESIGRETURN) {
                 break;
             }
             if ((abi_ulong)ret >= (abi_ulong)(-515)) {
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 23e1e761de..b501750fe0 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -431,12 +431,12 @@ long do_sigreturn(CPUSPARCState *env)
     set_sigmask(&host_set);
 
     unlock_user_struct(sf, sf_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
  segv_and_exit:
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 #else
     return -TARGET_ENOSYS;
 #endif
@@ -495,12 +495,12 @@ long do_rt_sigreturn(CPUSPARCState *env)
     env->npc = tnpc;
 
     unlock_user_struct(sf, sf_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
  segv_and_exit:
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 23fb45e0f1..2867be4cd3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -550,7 +550,7 @@ const char *target_strerror(int err)
     if (err == QEMU_ERESTARTSYS) {
         return "To be restarted";
     }
-    if (err == TARGET_QEMU_ESIGRETURN) {
+    if (err == QEMU_ESIGRETURN) {
         return "Successful exit from sigreturn";
     }
 
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 29cc6f3830..6bc6d6dee6 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -188,7 +188,7 @@ void cpu_loop(CPUXtensaState *env)
                     env->pc -= 3;
                     break;
 
-                case -TARGET_QEMU_ESIGRETURN:
+                case -QEMU_ESIGRETURN:
                     break;
                 }
                 break;
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 81572a5fc7..06d91a37ec 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -263,12 +263,12 @@ long do_rt_sigreturn(CPUXtensaState *env)
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return -QEMU_ESIGRETURN;
 }
 
 void setup_sigtramp(abi_ulong sigtramp_page)
-- 
2.25.1


