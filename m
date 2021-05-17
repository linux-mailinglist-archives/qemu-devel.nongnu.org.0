Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49338383CC3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:55:10 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiOT-0008KI-9a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm2-0006vJ-8L
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004ZR-BE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:23 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Ml3ym-1l3qdu3VgS-00lTp7; Mon, 17
 May 2021 20:14:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 55/59] linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
Date: Mon, 17 May 2021 20:14:20 +0200
Message-Id: <20210517181424.8093-56-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MFA5a6cPTBO0bOjE7+QLrnkIugrsFBVthsS6Axi48/E7iOmJpRJ
 kkK4OpeLKLVrA+crO0I6WHcFcNJyiqg3ZO+1xSabSovSzIvhLDy86a9PKJh37CPwFRIRkWv
 eDV0YUzdCVyS4RjUQdku6Fhq9QYTZOZWy5rPsSiHVryXNSGIti2Lo6yl7s6qFnG2d9U32n3
 QyhZnXBzf+3q4NBw3JvCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ZFjjahYV4w=:3v18EcRTtnwcDV2volzhZ2
 WL/jty65RV592mp+0zMfKphDVbONUvZAsFNOxfa40WuSU8smsxo8zD6nJhlpK6hHPI4HiEoEd
 eKSLxfHj7J3XYF/BIVWCSWg/cCQHSllErHFToQeJ3sP5x06VmEUlOP7GkGQs9vpfwDMW5OWWY
 Rl6Ri8d//q2Xi2ucVsvIQwumsw+TgSuU6q+/s1HCvYxMUPOCT6404i0m0Qcxz0CB7sgnh7HUa
 4oUEev2zSG+HItMX8KierOll4gk5tS3noGS4iZSMpWnD+Zqs+LExIj4WU+WA68x0eoHit28hm
 xwdy5+w5nrSRswuTUfHXQi7dvEpcEwjcyWCd9ks79+mFD9vwrk9PEAefQK4LroLCGqNZHckKD
 i005Vknnm8kKSlfYa2EtJ0tPO0w2t/zdtLwTSgwsh+MfZ6NF+UusA8CbNw4FjzOY/hVQ/xomV
 1KlyMWrluF58wTqNZuJbd6cu1vX1Oy/4f7W3lgnj0REEyrpRLQ5d7gg+1U2d9s3ktzp5/iI1C
 HK0zMc202OWn9P+nSrGu0Q=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
index 7b139a9c3a55..4515f816b59b 100644
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


