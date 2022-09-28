Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA65EE6DA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:53:23 +0200 (CEST)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode3W-0005Sk-UZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddex-0000Ag-5O
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddev-0006U9-AN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7iT4-1pHhMm2KRe-014gps; Wed, 28
 Sep 2022 22:27:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 22/37] linux-user/hppa: Increase guest stack size to 80MB for
 hppa target
Date: Wed, 28 Sep 2022 22:27:22 +0200
Message-Id: <20220928202737.793171-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W5SIn3QUq2yyQqKcxFvuKvFpVCdZj00ZF4YOmfS5fcCzOHbCRoB
 kBkHYM1sz0+wnEuA/C3qGJVrSgno1FeSa3PgLCW7CCQI0opw5dekGdupAWLuEU7j4UN0LTd
 bbJHt8AuE/QkWGAiBznInCM4byizksGFF+1/iT70O0cZ+MS7Y098cTtQH2wOKvpj7oIwaM0
 +ydCsQbz9pbz/GX/h29Dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hQgp/74nSdI=:U+bLORNvdkEKlL5esDpHzI
 3Lv4Mi64f8zru+/ZprlUuVG+gcirpOzBnzm6bgASYiI4fLowt9ZZgNAHuZYVzDtfVtoNs7tnq
 wCIFB3fnNVIWymEsYxHp4SZV0Az1Ur7WZeDPctlks+VxXnUc6jfYUgx64FbrNotejyIYR4imH
 d2lzkyMdyAGT0UKvUVCO7hPsBOqPrSWK8XrIT3hPJDKuk2qis4kiXoCVKXmP6c+aFb4k93EvA
 IMts9WBoMFFkLM/uy5P+n62onk+G+BEN49KaEB6APc+RkMgMNf2maM1AhV2b7ArvEPzuWbXhU
 +7tHE1BLBJBI2Eg//qc1BElzZ5lxvwYN5Tmd/2o7vPM4r+BsQeRkPCPNv+tc1tvqEFes3Plgy
 RrcMIhUHx8zMnt4BBo7Z06bjvEmSk18W6giOAGtjQOiH5owhXDq6BfpYwJxi9hc71VMc1KkSu
 jgJU4kooGyF6p5WDc7hPrKmYbliSCmseGm1JcL7zKTUAsM95a58S9WHMUPC0QQkQk/kztK88q
 mh9YRiPwEh0OCmR9aCr8TMB2/klbD5OoZUH63JatUn1RPui8zxX/uyntQKq4bwm07/sMM85ek
 zLpK2jJWYV2DNxApOpgZqqxURqAf5dGvSr9khh0yYwXxHGO4iLDrkecmuoWgpJPfLQAIEXkdb
 U1Rcshm1QZ5vN0/xHEJ+eFFD/1Y6OzxBpQUftTLo94VClm1zaublT8n74wCvt0n8UP8UlWAun
 myQCbKMq97TgKRqkvI1xSvdLr0b86uNJbBDuRTcF+x6v248v180qLSGwmzJe7cOwklQhx20vQ
 Oqx+6m9
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


