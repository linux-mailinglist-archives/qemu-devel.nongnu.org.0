Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AB5EDB92
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:17:00 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odV3g-00030g-8X
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008F9-Kd
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008C2-GU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mj831-1p7aS70z2b-00f72d; Wed, 28
 Sep 2022 10:15:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 22/38] linux-user/hppa: Increase guest stack size to 80MB for
 hppa target
Date: Wed, 28 Sep 2022 10:15:01 +0200
Message-Id: <20220928081517.734954-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rCfBcpTyTiThp8DfZDdpolMLOUPn1kzmakqplpIIZwNb6BFxQq5
 rrLlfsYlt6WiXyTxFe7BpiCSngYYiYTILckya/4KuTtu2tdx2o+P4StKAzctPkClCjiupT5
 WY0+SaaqznJmAv71YfvpOuHNTyr+PEFQ0J7429AA4hLrKN+cUZnKxIpZFu9ajzpMv5zNeu9
 XLomPDjAI/OcAe2aurxEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o8x4gOWl6is=:F756uigWoaOQ8fP0io85W2
 BiutCNTBtN9J87t8M3pwB89FGAOlWaRf273siHvKCN8sINOvm8R3bCokwkwy5SxK+4C+gap1K
 kNPnfuOE27IGC5Y/WNJ78A7PeKbOMEllG4Xjerp2182dPAris0d0r05aytUR9KJBXKuxMUz3z
 eN24FUIqd4Uf+snpF9CjN4yCM+e12FNzFxiLFcElUpody6TOJgQSpOhM0zgUS1L+Ai2oxa37j
 +V9I3F/+GYpGg0yoHlNoGjRf7XsMI0Wb4ksOfIUYAOPKl7YDTsnlWbTnn8ZGeYeywz51yt5Gf
 vVzgdZgfftTW0PQLRLQP5ygWeT5qDwDtg4Pw+ZQVJIB2GuYj7J1/VBN63zpuKnJNfu1MwNsRc
 Uj5ki39ORsKLaVQFDWQwnZZxkxSanqXOOCX/KV+RcGXJH3a5SlGwLktHDxxg7uOmbsXUZRszY
 eWH/OkCaIesFQZSF0/1l6oR5I4SA7b3oEru6+D1TqmVhtJf80CXXtFJOjF8VqQVOUjULU7leR
 3umB1VgslxJmdITeJeDFHM8pjVH4sA2qgoPmbfh2aXXPIWJRpgJuJoHYOHEObf4YeGmIvSTjM
 hYxJ3X4g/fNWmBCZhtflioiuF9kdYy50lfoZyxiq8tbl+caLFjr4dGku93nW/JaapGEX2KYpG
 gG1gknFMIWjvJxtYxot1TTmKHOVZMEcaF6diRRsFYVu5Yu7rKj6VQE6dRic9d4zumor5E3/G7
 STJoovJ0LpjrqFlzDqvqR5VhTPFNbboLLDu5bWIbrnQhGVRCc9H0facs1riwEeiMy51pkILi0
 Vct1t+3
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The hppa target requires a much bigger stack than many other targets,
and the Linux kernel allocates 80 MB by default for it.

This patch increases the guest stack for hppa to 80MB, and prevents
that this default stack size gets reduced by a lower stack limit on the
host.

Since the stack grows upwards on hppa, the stack_limit value marks the
upper boundary of the stack. Fix the output of /proc/self/maps (in the
guest) to show the [stack] marker on the correct memory area.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-6-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_syscall.h | 2 ++
 linux-user/main.c                | 9 +++++++--
 linux-user/syscall.c             | 4 ++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index 4b382c1fcf4a..9a8f8ca62817 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -26,4 +26,6 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
 
+#define TARGET_DEFAULT_STACK_SIZE	80 * 1024 * 1024UL
+
 #endif /* HPPA_TARGET_SYSCALL_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index e44bdb17b853..88fccfe26149 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -124,10 +124,14 @@ static void usage(int exitcode);
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
 
+#if !defined(TARGET_DEFAULT_STACK_SIZE)
 /* XXX: on x86 MAP_GROWSDOWN only works if ESP <= address + 32, so
    we allocate a bigger stack. Need a better solution, for example
    by remapping the process stack directly at the right place */
-unsigned long guest_stack_size = 8 * 1024 * 1024UL;
+#define TARGET_DEFAULT_STACK_SIZE	8 * 1024 * 1024UL
+#endif
+
+unsigned long guest_stack_size = TARGET_DEFAULT_STACK_SIZE;
 
 /***********************************************************/
 /* Helper routines for implementing atomic operations.  */
@@ -668,7 +672,8 @@ int main(int argc, char **argv, char **envp)
         struct rlimit lim;
         if (getrlimit(RLIMIT_STACK, &lim) == 0
             && lim.rlim_cur != RLIM_INFINITY
-            && lim.rlim_cur == (target_long)lim.rlim_cur) {
+            && lim.rlim_cur == (target_long)lim.rlim_cur
+            && lim.rlim_cur > guest_stack_size) {
             guest_stack_size = lim.rlim_cur;
         }
     }
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 850410c9b553..f87b36b2491f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8036,7 +8036,11 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
                 continue;
             }
 
+#ifdef TARGET_HPPA
+            if (h2g(max) == ts->info->stack_limit) {
+#else
             if (h2g(min) == ts->info->stack_limit) {
+#endif
                 path = "[stack]";
             } else {
                 path = e->path;
-- 
2.37.3


