Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61133871DB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:26:03 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litB4-0001md-Uj
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKw-000841-0G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:10 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKp-0007CS-Dy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:09 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfL5v-1lFaBu1ZL1-00gmLF; Tue, 18
 May 2021 07:32:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 55/59] linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
Date: Tue, 18 May 2021 07:31:27 +0200
Message-Id: <20210518053131.87212-56-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Fqsxo95B62MFNOBM4N3vYpdEHIqIfN5zeCw5/MK1IWn1XSNgGhI
 RiXI/bCSCXY0x+3J/U/xkGuZT7xf+D3hh5ts/KHM9g9+TEwFg8gGVVx/06YevU6S3g6jeBL
 RDqG1okDWj5JE1QB4uKeb1aoA/+brIu019qo9OZCX0l3j4xiYi38ObvBMpl1bECpUgVnKfX
 1KwEchLgqDKkMgzi+ZrWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BHKz87otMNo=:hirpCJuzHZ75PiXdXoZGbh
 6ssCb1/EbkCY78mftXGYo1iaacmBDvFxRr+536QtbXAj9qohnfzpK3Cdwq1pr6jSuvX1A5fIu
 7pCb8g2/V0E5mzm3NQCrGzKtVg4/RXulXw4wEbo7IeKXRJRuh3PEk4hNMU1/S5a+MAp2AbY1G
 L8fq1mn9H+KXif3QtViyeK+b8HsTC1/Bju1GU0kXNdYzDkEJtbKcaS+K9XABrJ2ROGulmNVE5
 DvM+AqEVdOHQ+tc+r9UxgpX7KrBeyj4glbzugzTFB5kNfpvk8ppMwKnKLVAJeZM8ST1FaG+/M
 GRpObhphB6xyhv8zSJW4GPWOxhT+beNmW7DefEyGhTTFNIgK7jYYpKqsnks+zsuyKouGjQ9Cr
 Zo0k15LXtUX3rTSIwHSoT+ZzgT+UT9LF6x041xT7YOO1lqz2Cd6CRMawWKZHA3smsgTmtDS/5
 o7pbsB6Ks3rmeUMYqlSSw1J/oHhVwPTwSzmsbYJl17G7qICVnnWSCaW5tI7cSS2CCivMM85fc
 7MbOc3OlZheI5TgpbfUJ5Y=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This means that we can share the TARGET_NR_rt_sigaction code,
and the target_rt_sigaction structure is unused.  Untangling
the ifdefs so that target_sigaction can be shared will wait
until the next patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422230227.314751-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_signal.h |  1 +
 linux-user/syscall.c             | 37 ++++++--------------------------
 linux-user/syscall_defs.h        |  6 ------
 3 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 0b90d3a89701..250642913e2a 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -92,6 +92,7 @@ typedef struct target_sigaltstack {
 #define TARGET_GEN_SUBRNG7     -25
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_KA_RESTORER
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a2e18b06c6d0..048056ba2bf2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9064,41 +9064,17 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
     case TARGET_NR_rt_sigaction:
         {
-#if defined(TARGET_ALPHA)
-            /* For Alpha and SPARC this is a 5 argument syscall, with
+            /*
+             * For Alpha and SPARC this is a 5 argument syscall, with
              * a 'restorer' parameter which must be copied into the
              * sa_restorer field of the sigaction struct.
              * For Alpha that 'restorer' is arg5; for SPARC it is arg4,
              * and arg5 is the sigsetsize.
-             * Alpha also has a separate rt_sigaction struct that it uses
-             * here; SPARC uses the usual sigaction struct.
              */
-            struct target_rt_sigaction *rt_act;
-            struct target_sigaction act, oact, *pact = 0;
-
-            if (arg4 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, rt_act, arg2, 1))
-                    return -TARGET_EFAULT;
-                act._sa_handler = rt_act->_sa_handler;
-                act.sa_mask = rt_act->sa_mask;
-                act.sa_flags = rt_act->sa_flags;
-                unlock_user_struct(rt_act, arg2, 0);
-                pact = &act;
-            }
-            ret = get_errno(do_sigaction(arg1, pact, &oact, arg5));
-            if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, rt_act, arg3, 0))
-                    return -TARGET_EFAULT;
-                rt_act->_sa_handler = oact._sa_handler;
-                rt_act->sa_mask = oact.sa_mask;
-                rt_act->sa_flags = oact.sa_flags;
-                unlock_user_struct(rt_act, arg3, 1);
-            }
-#else
-#ifdef TARGET_SPARC
+#if defined(TARGET_ALPHA)
+            target_ulong sigsetsize = arg4;
+            target_ulong restorer = arg5;
+#elif defined(TARGET_SPARC)
             target_ulong restorer = arg4;
             target_ulong sigsetsize = arg5;
 #else
@@ -9131,7 +9107,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 unlock_user_struct(act, arg2, 0);
             if (oact)
                 unlock_user_struct(oact, arg3, 1);
-#endif
         }
         return ret;
 #ifdef TARGET_NR_sgetmask /* not on alpha */
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index e4aaf8412f56..7a1d3b239c02 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -507,12 +507,6 @@ struct target_old_sigaction {
     int32_t sa_flags;
 };
 
-struct target_rt_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_flags;
-    target_sigset_t sa_mask;
-};
-
 /* This is the struct used inside the kernel.  The ka_restorer
    field comes from the 5th argument to sys_rt_sigaction.  */
 struct target_sigaction {
-- 
2.31.1


