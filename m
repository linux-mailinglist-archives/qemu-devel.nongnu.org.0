Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE1454A94
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:09:49 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNVM-0000K6-ND
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQK-0000Ot-33
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:37 -0500
Received: from [2a00:1450:4864:20::435] (port=39826
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQH-00033f-9M
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id d27so5661879wrb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89Fa/Tur9qVyNBoDHh7CWeamjUn5Uv3GJaQJZqkaJN0=;
 b=qrXd8PjiasFiLu/12b5Hr6jdl6ahH0DmZKgOl1KoQ7AuYsOplHu8td0ERaH+uzB/yC
 +9kb8iFtekU3mZCKmb3T0e2dbsyGd5vdtGk/PWldaaSE16ayA5STWeetukjRIryzABRx
 G3SvtB2iOpmVepWA5g9WElcZk2GAC9aAnK4k83PSNCM4v/+J1Tz+O6+Bve7NQ3CUAagI
 EcW9LX7S/C3Wlc93dQwHRtV8C0LIiWt0Vhb4DaGK9yfbyQ/DkyjueWwrXguk+VGUAoeH
 IQnN9B2Cdg4NcMlCiZkQv3386OMPr6/w0Usnw/Ru/Sbn7xHMJXtM7Ip76wpF6pMRBxqW
 BSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89Fa/Tur9qVyNBoDHh7CWeamjUn5Uv3GJaQJZqkaJN0=;
 b=CntGghYbEwjjXwj2UjZVf9ivJZP0pvvpRF2iDyUVdSTN2D5y3vqgugw+HZBc6nfjFL
 mOEc2E3PCHQ862ejct44JxW4NBCpmgdSXxCnWDkoUqhKiC5h8IRwYke0xAOz0rHiCJwB
 7LIHp073JiOEiodbUdNWs2ha+cX+YxPUinGSgi9xe+L8yGARHchkkvs3BjG9TDytR8Yw
 a5kSj0gEcv82dasodTQW2ARRZZJJHgTDuD5GYb+IcXf/tu0e/w6oUHRQq74nMyc+h65g
 oMIE1qerxXmTrIkHw2BnS9IzUlT+BHCwtrhnJc55ok1aZk7mH+awORNVwI5ek87o1QXm
 hx6A==
X-Gm-Message-State: AOAM531qVFeR62dyAEkLHFYzkIydQZMcdFRBj13xPC20iV9C/9pYTKEJ
 lyIC6Rtnj2azQ2ArPN/Qz+WFqeJu8GUUdJbBwLA=
X-Google-Smtp-Source: ABdhPJzer7at7xzdloh3W/YO9fNmKJY7Vc9rf1VA3bIvGzbTbMttAiRUb1k95XOsYOHBEmbsWLkNBA==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr21847721wrk.225.1637165071686; 
 Wed, 17 Nov 2021 08:04:31 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/17] *-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
Date: Wed, 17 Nov 2021 17:04:04 +0100
Message-Id: <20211117160412.71563-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.
We use this as an extra marker for both host and target errno.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h                       |  2 +-
 linux-user/generic/target_errno_defs.h      |  2 +-
 linux-user/safe-syscall.h                   |  8 ++++----
 linux-user/signal-common.h                  |  2 +-
 linux-user/aarch64/cpu_loop.c               |  2 +-
 linux-user/alpha/cpu_loop.c                 |  2 +-
 linux-user/arm/cpu_loop.c                   |  2 +-
 linux-user/cris/cpu_loop.c                  |  2 +-
 linux-user/hexagon/cpu_loop.c               |  2 +-
 linux-user/hppa/cpu_loop.c                  |  2 +-
 linux-user/i386/cpu_loop.c                  |  6 +++---
 linux-user/m68k/cpu_loop.c                  |  2 +-
 linux-user/microblaze/cpu_loop.c            |  2 +-
 linux-user/mips/cpu_loop.c                  |  2 +-
 linux-user/openrisc/cpu_loop.c              |  2 +-
 linux-user/ppc/cpu_loop.c                   |  2 +-
 linux-user/riscv/cpu_loop.c                 |  2 +-
 linux-user/s390x/cpu_loop.c                 |  2 +-
 linux-user/sh4/cpu_loop.c                   |  2 +-
 linux-user/signal.c                         |  6 +++---
 linux-user/sparc/cpu_loop.c                 |  2 +-
 linux-user/syscall.c                        | 16 ++++++++--------
 linux-user/xtensa/cpu_loop.c                |  2 +-
 common-user/host/aarch64/safe-syscall.inc.S |  2 +-
 common-user/host/arm/safe-syscall.inc.S     |  2 +-
 common-user/host/i386/safe-syscall.inc.S    |  2 +-
 common-user/host/mips/safe-syscall.inc.S    |  2 +-
 common-user/host/ppc64/safe-syscall.inc.S   |  2 +-
 common-user/host/riscv/safe-syscall.inc.S   |  2 +-
 common-user/host/s390x/safe-syscall.inc.S   |  2 +-
 common-user/host/sparc64/safe-syscall.inc.S |  2 +-
 common-user/host/x86_64/safe-syscall.inc.S  |  2 +-
 32 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 832671354f..583ebe8cee 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,6 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+#define QEMU_ERESTARTSYS        TARGET_ERESTART /* compat */
 
 #endif /* !  _ERRNO_DEFS_H_ */
diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/target_errno_defs.h
index 17d85e0b61..58a06a10d6 100644
--- a/linux-user/generic/target_errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -153,7 +153,7 @@
  * after handling any pending signals. They match with the ones the guest
  * kernel uses for the same purpose.
  */
-#define TARGET_ERESTARTSYS     512     /* Restart system call (if SA_RESTART) */
+#define QEMU_ERESTARTSYS     512     /* Restart system call (if SA_RESTART) */
 
 /* QEMU internal, not visible to the guest. This is returned by the
  * do_sigreturn() code after a successful sigreturn syscall, to indicate
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index 0deb87e51a..70c2dec408 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -25,10 +25,10 @@
  *
  * Call a system call if guest signal not pending.
  * This has the same API as the libc syscall() function, except that it
- * may return -1 with errno == TARGET_ERESTARTSYS if a signal was pending.
+ * may return -1 with errno == QEMU_ERESTARTSYS if a signal was pending.
  *
  * Returns: the system call result, or -1 with an error code in errno
- * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing
+ * (Errnos are host errnos; we rely on QEMU_ERESTARTSYS not clashing
  * with any of the host errno values.)
  */
 
@@ -81,7 +81,7 @@
  * which are only technically blocking (ie which we know in practice won't
  * stay in the host kernel indefinitely) it's OK to use libc if necessary.
  * You must be able to cope with backing out correctly if some safe_syscall
- * you make in the implementation returns either -TARGET_ERESTARTSYS or
+ * you make in the implementation returns either -QEMU_ERESTARTSYS or
  * EINTR though.)
  *
  * block_signals() cannot be used for interruptible syscalls.
@@ -94,7 +94,7 @@
  * handler checks the interrupted host PC against the addresse of that
  * known section. If the PC is before or at the address of the syscall
  * instruction then we change the PC to point at a "return
- * -TARGET_ERESTARTSYS" code path instead, and then exit the signal handler
+ * -QEMU_ERESTARTSYS" code path instead, and then exit the signal handler
  * (causing the safe_syscall() call to immediately return that value).
  * Then in the main.c loop if we see this magic return value we adjust
  * the guest PC to wind it back to before the system call, and invoke
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 7457f8025c..b9f33bb44f 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -76,7 +76,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
  * Block all signals, and arrange that the signal mask is returned to
  * its correct value for the guest before we resume execution of guest code.
  * If this function returns non-zero, then the caller should immediately
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * return -QEMU_ERESTARTSYS to the main loop, which will take the pending
  * signal and restart execution of the syscall.
  * If block_signals() returns zero, then the caller can continue with
  * emulation of the system call knowing that no signals can be taken
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 97e0728b67..775ba43913 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -99,7 +99,7 @@ void cpu_loop(CPUARMState *env)
                              env->xregs[4],
                              env->xregs[5],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->xregs[0] = ret;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5c..ce9b251ce3 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -98,7 +98,7 @@ void cpu_loop(CPUAlphaState *env)
                                     env->ir[IR_A2], env->ir[IR_A3],
                                     env->ir[IR_A4], env->ir[IR_A5],
                                     0, 0);
-                if (sysret == -TARGET_ERESTARTSYS) {
+                if (sysret == -QEMU_ERESTARTSYS) {
                     env->pc -= 4;
                     break;
                 }
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 01cb6eb534..1fcf19750e 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -407,7 +407,7 @@ void cpu_loop(CPUARMState *env)
                                      env->regs[4],
                                      env->regs[5],
                                      0, 0);
-                    if (ret == -TARGET_ERESTARTSYS) {
+                    if (ret == -QEMU_ERESTARTSYS) {
                         env->regs[15] -= env->thumb ? 2 : 4;
                     } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                         env->regs[0] = ret;
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0d5d268609..f3e5b13f89 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUCRISState *env)
                              env->pregs[7], 
                              env->pregs[11],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[10] = ret;
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba9..1cacbf42f1 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -54,7 +54,7 @@ void cpu_loop(CPUHexagonState *env)
                              env->gpr[4],
                              env->gpr[5],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->gpr[HEX_REG_PC] -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gpr[0] = ret;
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f0..5315224d12 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -133,7 +133,7 @@ void cpu_loop(CPUHPPAState *env)
                 env->iaoq_f = env->gr[31];
                 env->iaoq_b = env->gr[31] + 4;
                 break;
-            case -TARGET_ERESTARTSYS:
+            case -QEMU_ERESTARTSYS:
             case -TARGET_QEMU_ESIGRETURN:
                 break;
             }
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f6a1cc632b..fbd9a353e5 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -180,7 +180,7 @@ static void emulate_vsyscall(CPUX86State *env)
     ret = do_syscall(env, syscall, env->regs[R_EDI], env->regs[R_ESI],
                      env->regs[R_EDX], env->regs[10], env->regs[8],
                      env->regs[9], 0, 0);
-    g_assert(ret != -TARGET_ERESTARTSYS);
+    g_assert(ret != -QEMU_ERESTARTSYS);
     g_assert(ret != -TARGET_QEMU_ESIGRETURN);
     if (ret == -TARGET_EFAULT) {
         goto sigsegv;
@@ -223,7 +223,7 @@ void cpu_loop(CPUX86State *env)
                              env->regs[R_EDI],
                              env->regs[R_EBP],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
@@ -241,7 +241,7 @@ void cpu_loop(CPUX86State *env)
                              env->regs[8],
                              env->regs[9],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3..b03c21a3dc 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -80,7 +80,7 @@ void cpu_loop(CPUM68KState *env)
                                  env->dregs[5],
                                  env->aregs[0],
                                  0, 0);
-                if (ret == -TARGET_ERESTARTSYS) {
+                if (ret == -QEMU_ERESTARTSYS) {
                     env->pc -= 2;
                 } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                     env->dregs[0] = ret;
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index a94467dd2d..6e368f986e 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -53,7 +53,7 @@ void cpu_loop(CPUMBState *env)
                              env->regs[9], 
                              env->regs[10],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 /* Wind back to before the syscall. */
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b735c99a24..64f308c6ad 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -141,7 +141,7 @@ done_syscall:
                              env->active_tc.gpr[8], env->active_tc.gpr[9],
                              env->active_tc.gpr[10], env->active_tc.gpr[11]);
 # endif /* O32 */
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->active_tc.PC -= 4;
                 break;
             }
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 3cfdbbf037..3147ab2b62 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -48,7 +48,7 @@ void cpu_loop(CPUOpenRISCState *env)
                              cpu_get_gpr(env, 6),
                              cpu_get_gpr(env, 7),
                              cpu_get_gpr(env, 8), 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 cpu_set_gpr(env, 11, ret);
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 483e669300..5348641e9e 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -428,7 +428,7 @@ void cpu_loop(CPUPPCState *env)
             ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
                              env->gpr[5], env->gpr[6], env->gpr[7],
                              env->gpr[8], 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->nip -= 4;
                 break;
             }
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index b301dac802..20f8c48b1d 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -69,7 +69,7 @@ void cpu_loop(CPURISCVState *env)
                                  env->gpr[xA5],
                                  0, 0);
             }
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gpr[xA0] = ret;
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e..043582ca7c 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -83,7 +83,7 @@ void cpu_loop(CPUS390XState *env)
             ret = do_syscall(env, n, env->regs[2], env->regs[3],
                              env->regs[4], env->regs[5],
                              env->regs[6], env->regs[7], 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->psw.addr -= env->int_svc_ilen;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[2] = ret;
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c..6c4ebfa969 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUSH4State *env)
                              env->gregs[0],
                              env->gregs[1],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gregs[0] = ret;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ca8f24b9ec..12b1705287 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -213,7 +213,7 @@ int block_signals(void)
 
 /* Wrapper for sigprocmask function
  * Emulates a sigprocmask in a safe way for the guest. Note that set and oldset
- * are host signal set, not guest ones. Returns -TARGET_ERESTARTSYS if
+ * are host signal set, not guest ones. Returns -QEMU_ERESTARTSYS if
  * a signal was already pending and the syscall must be restarted, or
  * 0 on success.
  * If set is NULL, this is guaranteed not to fail.
@@ -230,7 +230,7 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
         int i;
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         switch (how) {
@@ -985,7 +985,7 @@ int do_sigaction(int sig, const struct target_sigaction *act,
     }
 
     if (block_signals()) {
-        return -TARGET_ERESTARTSYS;
+        return -QEMU_ERESTARTSYS;
     }
 
     k = &sigact_table[sig - 1];
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431c..529337c5e0 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)
                               env->regwptr[2], env->regwptr[3],
                               env->regwptr[4], env->regwptr[5],
                               0, 0);
-            if (ret == -TARGET_ERESTARTSYS || ret == -TARGET_QEMU_ESIGRETURN) {
+            if (ret == -QEMU_ERESTARTSYS || ret == -TARGET_QEMU_ESIGRETURN) {
                 break;
             }
             if ((abi_ulong)ret >= (abi_ulong)(-515)) {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662f..3c0e341e45 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -545,7 +545,7 @@ static inline abi_long get_errno(abi_long ret)
 
 const char *target_strerror(int err)
 {
-    if (err == TARGET_ERESTARTSYS) {
+    if (err == QEMU_ERESTARTSYS) {
         return "To be restarted";
     }
     if (err == TARGET_QEMU_ESIGRETURN) {
@@ -6456,7 +6456,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         }
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         fork_start();
@@ -8173,7 +8173,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
            Do thread termination if we have more then one thread.  */
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         pthread_mutex_lock(&clone_lock);
@@ -9162,7 +9162,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
             ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
                                                SIGSET_T_SIZE));
-            if (ret != -TARGET_ERESTARTSYS) {
+            if (ret != -QEMU_ERESTARTSYS) {
                 ts->in_sigsuspend = 1;
             }
         }
@@ -9181,7 +9181,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             unlock_user(p, arg1, 0);
             ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
                                                SIGSET_T_SIZE));
-            if (ret != -TARGET_ERESTARTSYS) {
+            if (ret != -QEMU_ERESTARTSYS) {
                 ts->in_sigsuspend = 1;
             }
         }
@@ -9297,13 +9297,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigreturn
     case TARGET_NR_sigreturn:
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
         return do_sigreturn(cpu_env);
 #endif
     case TARGET_NR_rt_sigreturn:
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
         return do_rt_sigreturn(cpu_env);
     case TARGET_NR_sethostname:
@@ -13141,7 +13141,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
         static bool flag;
         flag = !flag;
         if (flag) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
     }
 #endif
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35..29cc6f3830 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -184,7 +184,7 @@ void cpu_loop(CPUXtensaState *env)
                     env->regs[2] = ret;
                     break;
 
-                case -TARGET_ERESTARTSYS:
+                case -QEMU_ERESTARTSYS:
                     env->pc -= 3;
                     break;
 
diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index d3f065cdef..6b405be448 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -86,7 +86,7 @@ safe_syscall_end:
 	ret
 
 	/* code path when we didn't execute the syscall */
-2:	mov	w0, #TARGET_ERESTARTSYS
+2:	mov	w0, #QEMU_ERESTARTSYS
 	b	1b
 
 	.cfi_endproc
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 328299021d..e9b8d49d7c 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -104,7 +104,7 @@ safe_syscall_end:
 	b	9b
 
 	/* code path when we didn't execute the syscall */
-2:	ldr	r0, =TARGET_ERESTARTSYS
+2:	ldr	r0, =QEMU_ERESTARTSYS
 	b	1b
 
 	.fnend
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index c27207492a..3f928764db 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -114,7 +114,7 @@ safe_syscall_end:
 	jmp	9b
 
 	/* code path when we didn't execute the syscall */
-2:	mov	$TARGET_ERESTARTSYS, %eax
+2:	mov	$QEMU_ERESTARTSYS, %eax
 	jmp	1b
 	.cfi_endproc
 
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
index 1e2f5a079c..90bf3cc03e 100644
--- a/common-user/host/mips/safe-syscall.inc.S
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -122,7 +122,7 @@ safe_syscall_end:
 	 PTR_ADDIU sp, sp, FRAME
 
 	/* code path when we didn't execute the syscall */
-0:	li	v0, TARGET_ERESTARTSYS
+0:	li	v0, QEMU_ERESTARTSYS
 
 	/* code path setting errno */
 1:	PTR_L	t0, ERRNOP(sp)
diff --git a/common-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
index e35408c5fb..11c4672f71 100644
--- a/common-user/host/ppc64/safe-syscall.inc.S
+++ b/common-user/host/ppc64/safe-syscall.inc.S
@@ -92,7 +92,7 @@ safe_syscall_end:
 	blr
 
 	/* code path when we didn't execute the syscall */
-0:	li	3, TARGET_ERESTARTSYS
+0:	li	3, QEMU_ERESTARTSYS
 	b	1b
 
 	.cfi_endproc
diff --git a/common-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
index eddede702b..2f07c729c4 100644
--- a/common-user/host/riscv/safe-syscall.inc.S
+++ b/common-user/host/riscv/safe-syscall.inc.S
@@ -81,7 +81,7 @@ safe_syscall_end:
 	ret
 
 	/* code path when we didn't execute the syscall */
-2:	li	a0, TARGET_ERESTARTSYS
+2:	li	a0, QEMU_ERESTARTSYS
 	j	1b
 
 	.cfi_endproc
diff --git a/common-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
index f2a3bccc13..c1cc127e85 100644
--- a/common-user/host/s390x/safe-syscall.inc.S
+++ b/common-user/host/s390x/safe-syscall.inc.S
@@ -91,7 +91,7 @@ safe_syscall_end:
 	.cfi_restore_state
 
 	/* code path when we didn't execute the syscall */
-1:	lghi	%r2, -TARGET_ERESTARTSYS
+1:	lghi	%r2, -QEMU_ERESTARTSYS
 
 	/* code path setting errno */
 0:	lcr	%r2, %r2		/* create positive errno */
diff --git a/common-user/host/sparc64/safe-syscall.inc.S b/common-user/host/sparc64/safe-syscall.inc.S
index 2492fcbd9e..55e32b30eb 100644
--- a/common-user/host/sparc64/safe-syscall.inc.S
+++ b/common-user/host/sparc64/safe-syscall.inc.S
@@ -85,7 +85,7 @@ safe_syscall_end:
 
 	/* code path when we didn't execute the syscall */
 2:	ba,pt	%xcc, 1b
-	 set	TARGET_ERESTARTSYS, %o0
+	 set	QEMU_ERESTARTSYS, %o0
 
 	.cfi_endproc
 	.size	safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index e3f920fa5c..b93d684e66 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -102,7 +102,7 @@ safe_syscall_end:
         jmp	9b
 
         /* code path when we didn't execute the syscall */
-2:      mov     $TARGET_ERESTARTSYS, %eax
+2:      mov     $QEMU_ERESTARTSYS, %eax
         jmp	1b
 
         .cfi_endproc
-- 
2.25.1


