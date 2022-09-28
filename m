Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C95EE6E0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:56:32 +0200 (CEST)
Received: from localhost ([::1]:39834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode6a-0002ia-07
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf1-0000Qo-BA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddez-0006WM-Ip
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:03 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M7am5-1oacSJ2MzF-0085OZ; Wed, 28
 Sep 2022 22:27:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jon Alduan <jon.alduan@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 26/37] linux-user: Don't assume 0 is not a valid host timer_t
 value
Date: Wed, 28 Sep 2022 22:27:26 +0200
Message-Id: <20220928202737.793171-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d0MrNzFRlhOdVfypNKkFitcF4YU1Y03IDUrK9VzxoFo39+aDiGu
 h35Mmo6dx8QqbtVPyGbkbM76Q75e6bD9xi7GmtO9YCSsKVlIVnmKGuCzrtKW7IU11lM9eGP
 RNIe+FyeZGXmu1qOMgHMjmlgcLNDlxDfPIvWVlVsdEFSRQAN+4h3JS7Yair452Vei+mnJAh
 pi17WHv70hKoFc7IBHX2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YAvLgBDKtRQ=:trvDAzaxeCI0LIO3SJy/1Z
 5ch1fNVpADcikPEZT6kUkcTPXyY8j2u09QG4Z7viC+p9Jgm119xEzKj2fG8KY5Ld5SbIaotk0
 tRdZOPfZRC01IAOu425BQzWnO+clO1eHFdgGpsbkML8ZR59iQSdXWwg40QQEbeC91OsMwgM0g
 c31MNhJJENIdo42OnHnzXYud1arrJJZTe51j4HLycWveIAZOp62AY3B8xzvjHuEjpfLJY1Ma4
 sy33XYszirkbPPW7DN7Dt3zCn2/XFtun4yVqOG8qk9l2BegpS/YYzB/3Vn+hubCKT12/ull8x
 qYK4Sdx7fK4YhmeFW1k2f9rU1NP2sVkaen+iL5AcsEL+9v3D0A3WpSOGHc6z+jDnddxEG+giK
 1uSZlzgXvqEqtBZeoXm+kgzHEcJ6j7/AHeRLDKSlCQ6NiDW8m9jxvGFTlPuZ3zMfT0LoYORsD
 K9p5JvlsmsNZgjZTic9ceqPkKvfF4610+WPjWJpBvI9mh6b3MRpXJ/F9fYcCGFvApGy6QbJuD
 CtHjMsXXxc0cKw1U76eWp38mgnNnWpCtv56jiDDckYkdeOkPYZvavI4O8qtlMt5gj3mlENxAQ
 +g+XgJnaf86OmEuwCZyqab7pQrTBQYF3XAQ30OOQIrD5atqoA2+HexKmKktALpMOc1+n+Gy0Q
 xD85Gj3RL7bNnkLQ39rnyHqbOmBEDhLybjTmDlZGfFRnZXcO5GxR81nOSr/9/RknTOGkndpWj
 e/6gWJ5GcF80nSUwUtZtTRK4kBjqRuY8G/TJiY91kojLl0i5rWba5/x5TAhoQxGVYwdI59SDK
 pyRMZMH
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

From: Peter Maydell <peter.maydell@linaro.org>

For handling guest POSIX timers, we currently use an array
g_posix_timers[], whose entries are a host timer_t value, or 0 for
"this slot is unused".  When the guest calls the timer_create syscall
we look through the array for a slot containing 0, and use that for
the new timer.

This scheme assumes that host timer_t values can never be zero.  This
is unfortunately not a valid assumption -- for some host libc
versions, timer_t values are simply indexes starting at 0.  When
using this kind of host libc, the effect is that the first and second
timers end up sharing a slot, and so when the guest tries to operate
on the first timer it changes the second timer instead.

Rework the timer allocation code, so that:
 * the 'slot in use' indication uses a separate array from the
   host timer_t array
 * we grab the free slot atomically, to avoid races when multiple
   threads call timer_create simultaneously
 * releasing an allocated slot is abstracted out into a new
   free_host_timer_slot() function called in the correct places

This fixes:
 * problems on hosts where timer_t 0 is valid
 * the FIXME in next_free_host_timer() about locking
 * bugs in the error paths in timer_create where we forgot to release
   the slot we grabbed, or forgot to free the host timer

Reported-by: Jon Alduan <jon.alduan@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220725110035.1273441-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 54b29f3b406a..e0e0f058121f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -525,20 +525,25 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
 
 #if defined(TARGET_NR_timer_create)
 /* Maximum of 32 active POSIX timers allowed at any one time. */
-static timer_t g_posix_timers[32] = { 0, } ;
+#define GUEST_TIMER_MAX 32
+static timer_t g_posix_timers[GUEST_TIMER_MAX];
+static int g_posix_timer_allocated[GUEST_TIMER_MAX];
 
 static inline int next_free_host_timer(void)
 {
-    int k ;
-    /* FIXME: Does finding the next free slot require a lock? */
-    for (k = 0; k < ARRAY_SIZE(g_posix_timers); k++) {
-        if (g_posix_timers[k] == 0) {
-            g_posix_timers[k] = (timer_t) 1;
+    int k;
+    for (k = 0; k < ARRAY_SIZE(g_posix_timer_allocated); k++) {
+        if (qatomic_xchg(g_posix_timer_allocated + k, 1) == 0) {
             return k;
         }
     }
     return -1;
 }
+
+static inline void free_host_timer_slot(int id)
+{
+    qatomic_store_release(g_posix_timer_allocated + id, 0);
+}
 #endif
 
 static inline int host_to_target_errno(int host_errno)
@@ -12896,15 +12901,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 phost_sevp = &host_sevp;
                 ret = target_to_host_sigevent(phost_sevp, arg2);
                 if (ret != 0) {
+                    free_host_timer_slot(timer_index);
                     return ret;
                 }
             }
 
             ret = get_errno(timer_create(clkid, phost_sevp, phtimer));
             if (ret) {
-                phtimer = NULL;
+                free_host_timer_slot(timer_index);
             } else {
                 if (put_user(TIMER_MAGIC | timer_index, arg3, target_timer_t)) {
+                    timer_delete(*phtimer);
+                    free_host_timer_slot(timer_index);
                     return -TARGET_EFAULT;
                 }
             }
@@ -13040,7 +13048,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         } else {
             timer_t htimer = g_posix_timers[timerid];
             ret = get_errno(timer_delete(htimer));
-            g_posix_timers[timerid] = 0;
+            free_host_timer_slot(timerid);
         }
         return ret;
     }
-- 
2.37.3


