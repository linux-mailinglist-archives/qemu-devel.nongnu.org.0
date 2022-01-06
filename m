Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6F48632C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:51:03 +0100 (CET)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QMI-0002Wz-Hz
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDZ-0007ng-GK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:59497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDS-0004k4-99
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFsdD-1nAhOx3J0B-00HM7h; Thu, 06
 Jan 2022 11:41:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/27] linux-user: Disable more prctl subcodes
Date: Thu,  6 Jan 2022 11:41:18 +0100
Message-Id: <20220106104137.732883-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:exBT1H1rszwPC8FJI7xe18/8Sp8Ud31mxEMUrECmJ9fB3wCQ71j
 vvocxS9CmbansrTdY0gBkhLYEe7jHO08uQSeMVQJFjoFRNcKk1q4LiOKFvPoAhsNNaWqhnL
 xOxAbZ4Zb+DoFoCplTCXvToJpKnCrkB/eKRGPIoZACSPp8kzwud1odI+XCr/ThHtbspG7kU
 cU8TPj2Eyf6S+412vZ+Pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AuFtkTdDAo8=:4E1TezFD/uBa4nyFpEbkPA
 DoBOuHT03Xv+Fp7ObpnYGLd9za+AkkULRWILmwEeYFQkKeTO8uX8BNd4MJZ92k9cn0YHF984S
 gNpZKIpDCRdsR/IOyaJkBzRj4qlDoqKPW87u74zyVljGZHUjDyqMA6vAy3VHYp6J0v26iptFF
 ZBeanFLWRcfPqeAbi0Y9tTzoy/w36vB1bSKkG9vGWYW/+koBJEcRQ4enpTYIcDq+j5bovUdND
 e6FAlN1UCt6QJ+CcA6Ib80KsEtmn/nljAKmEk5nYUAgf1uRrV2G+Poer005b6YcBgYFwziAqT
 Y5y5AWfLq2InBylh0VyHJ0r27TsCkQa/ezMlqL0uOE8LavMGSTtbM2a4DUtbe3/K1rQCgOS5w
 /0uOWE7h6YHIgfcXKNl3YdW3TRXsgojCwb358/yli/ENo0Pu9IsYdg8Kh0LnLL/FgaB5DP2Xr
 KiqZ3EKwMaxrYjuk9rN9tJdiKwAJ4seZe0M+pVySdyObq8OyzItDokoZR357oznbB04UmSYgu
 O3O9DZbQ88m4Nc1r806tj2WQfEhKIMehN9GrH/nj15UKmSOPeiVjxWIninqUi37OliWVT9V6a
 TxXuQ2W4ilfrY2Oxsekxmeb/nilkGyahQk32cgCjB2kwIkrVwbZBYTTiNVJfYdJhY0wVGPg4t
 rijtSdSs/QSgXvRsAolXqZH4jB4q5WRWdQQy5HUm0ZgMmsK/4f56/R0jbToNuyPhXzC4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211227150127.2659293-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0f0f67d56721..d868ef291085 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6337,6 +6337,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_MTE_TAG_SHIFT       3
 # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
 #endif
+#ifndef PR_SET_IO_FLUSHER
+# define PR_SET_IO_FLUSHER 57
+# define PR_GET_IO_FLUSHER 58
+#endif
+#ifndef PR_SET_SYSCALL_USER_DISPATCH
+# define PR_SET_SYSCALL_USER_DISPATCH 59
+#endif
 
 #include "target_prctl.h"
 
@@ -6433,13 +6440,58 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             return -TARGET_EINVAL;
         }
         return do_prctl_get_tagged_addr_ctrl(env);
+
+    case PR_GET_DUMPABLE:
+    case PR_SET_DUMPABLE:
+    case PR_GET_KEEPCAPS:
+    case PR_SET_KEEPCAPS:
+    case PR_GET_TIMING:
+    case PR_SET_TIMING:
+    case PR_GET_TIMERSLACK:
+    case PR_SET_TIMERSLACK:
+    case PR_MCE_KILL:
+    case PR_MCE_KILL_GET:
+    case PR_GET_NO_NEW_PRIVS:
+    case PR_SET_NO_NEW_PRIVS:
+    case PR_GET_IO_FLUSHER:
+    case PR_SET_IO_FLUSHER:
+        /* Some prctl options have no pointer arguments and we can pass on. */
+        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+
+    case PR_GET_CHILD_SUBREAPER:
+    case PR_SET_CHILD_SUBREAPER:
+    case PR_GET_SPECULATION_CTRL:
+    case PR_SET_SPECULATION_CTRL:
+    case PR_GET_TID_ADDRESS:
+        /* TODO */
+        return -TARGET_EINVAL;
+
+    case PR_GET_FPEXC:
+    case PR_SET_FPEXC:
+        /* Was used for SPE on PowerPC. */
+        return -TARGET_EINVAL;
+
+    case PR_GET_ENDIAN:
+    case PR_SET_ENDIAN:
+    case PR_GET_FPEMU:
+    case PR_SET_FPEMU:
+    case PR_SET_MM:
     case PR_GET_SECCOMP:
     case PR_SET_SECCOMP:
-        /* Disable seccomp to prevent the target disabling syscalls we need. */
+    case PR_SET_SYSCALL_USER_DISPATCH:
+    case PR_GET_THP_DISABLE:
+    case PR_SET_THP_DISABLE:
+    case PR_GET_TSC:
+    case PR_SET_TSC:
+    case PR_GET_UNALIGN:
+    case PR_SET_UNALIGN:
+        /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
+
     default:
-        /* Most prctl options have no pointer arguments */
-        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+        qemu_log_mask(LOG_UNIMP, "Unsupported prctl: " TARGET_ABI_FMT_ld "\n",
+                      option);
+        return -TARGET_EINVAL;
     }
 }
 
-- 
2.33.1


