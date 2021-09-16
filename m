Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0940DDBE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:16:05 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt7M-0005mw-79
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4J-0002uX-TW
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4H-0004DR-Sc
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:55 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKc0o-1mCVRb2LbI-00KwaB; Thu, 16
 Sep 2021 17:12:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] linux-user: Split strace prototypes into strace.h
Date: Thu, 16 Sep 2021 17:12:29 +0200
Message-Id: <20210916151237.1188301-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nauILPra2Fue2grxmgbq665R+L3pTKqbEhkc4AmGn+eS2weFcuY
 z+J7VFOluNdGJW9koAdbt2bME/WZl+nyQE8KGnyoW7DdlekI2tVu783388YN6KMXK6gELOX
 AdoiQ8lNl1wFgUy0w74bVr2BHRo+dYUZ2I5B6DF+0G5V9dtxsUoVXksXbc0c1PHmANTI8h5
 Aw5Jj+lgG58mNTmK/CAWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hPRIh8YKt4c=:DtYD2Ax0qhhXlctbdiGNPJ
 f8v42cXNLmez5mMgv04nP2J/qTxXu1cnBFrkMBxg8pry5MxEy0lf3bnIS/v1w9LjjFU4AtMoi
 cB+ypOzuSirrQmKCWqecWRztAyz3Ty3fJLCqcvQca1uYF6TY9+ns7pDLK3SArFTRy9y202CJS
 TukAoy44qjc4OL0Epe5yZGgUwYl3OAO8zNPufDnmdYldIry1gGs8ZVGq/hIWTo2yO8m7OHtpW
 HpPMSdjz7fwfY9C5SO/nMybWYJfWzpWlNGkWyG6YTCXU9sPM1nUy/KY184KHWrkgJrgfILDGV
 5OQb6ykRvlXwTPaK+l0IkR50R1q87OLHIuj+Nc5cLzPpC04MMjCTiTfJyzmTw2JBcqnsyjwkA
 eQ96dIsVr2P/BrcjCj9cOdZ3G4RAtyjgVSdgu5vyMpZ4b+qYaBLBVfzPX96es5u7HeqEpFY9t
 OC8ZX8cwqpJMkVDyv5Hf1sgd8Cf2Vx1hpj9ytvco9UQZrMnOlcJneFRYmfNhbmb+7L8feQvsI
 6TKpKhtzs/339MhI+0gdEJeicDRoOE3Kdktz93ByjsVlrDneSR+HyQ7MvoYN9Km4jnyOOoci9
 UH9z+rIw5kQ3Nyn0QwdkCeTt1ex9xpCzOBX6fdI0l7b32i2OOq7UFUtHrf+2luzWGVyp0HrKr
 7AblOzlpOxKo+6PVY4NiB0yiVmXLZdq2cuZHnc/R4ZmJXEIsAiH0rhl0dHUe8qHgwRez00IcK
 UgRWiU4mRNo4TxoOpoSQ3AREALCG+kNhsYCQLQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The functions implemented in strace.c are only used in a few files in
linux-user; split them out of qemu.h and into a new strace.h header
which we include in the places that need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h    | 18 ------------------
 linux-user/signal.c  |  1 +
 linux-user/strace.c  |  2 ++
 linux-user/strace.h  | 38 ++++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c |  1 +
 5 files changed, 42 insertions(+), 18 deletions(-)
 create mode 100644 linux-user/strace.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 34b975ba502e..ad2d49fed9fb 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -415,24 +415,6 @@ extern long safe_syscall_base(int *pending, long number, ...);
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
-/* strace.c */
-void print_syscall(void *cpu_env, int num,
-                   abi_long arg1, abi_long arg2, abi_long arg3,
-                   abi_long arg4, abi_long arg5, abi_long arg6);
-void print_syscall_ret(void *cpu_env, int num, abi_long ret,
-                       abi_long arg1, abi_long arg2, abi_long arg3,
-                       abi_long arg4, abi_long arg5, abi_long arg6);
-/**
- * print_taken_signal:
- * @target_signum: target signal being taken
- * @tinfo: target_siginfo_t which will be passed to the guest for the signal
- *
- * Print strace output indicating that this signal is being taken by the guest,
- * in a format similar to:
- * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
- */
-void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
-
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f0909..ee1934947ac8 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,6 +22,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "strace.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index cce0a5d1e351..ee3429fae82a 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+
 #include <sys/ipc.h>
 #include <sys/msg.h>
 #include <sys/sem.h>
@@ -14,6 +15,7 @@
 #include <linux/netlink.h>
 #include <sched.h>
 #include "qemu.h"
+#include "strace.h"
 
 struct syscallname {
     int nr;
diff --git a/linux-user/strace.h b/linux-user/strace.h
new file mode 100644
index 000000000000..1e232d07fc85
--- /dev/null
+++ b/linux-user/strace.h
@@ -0,0 +1,38 @@
+/*
+ * strace.h: prototypes for linux-user builtin strace handling
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef LINUX_USER_STRACE_H
+#define LINUX_USER_STRACE_H
+
+void print_syscall(void *cpu_env, int num,
+                   abi_long arg1, abi_long arg2, abi_long arg3,
+                   abi_long arg4, abi_long arg5, abi_long arg6);
+void print_syscall_ret(void *cpu_env, int num, abi_long ret,
+                       abi_long arg1, abi_long arg2, abi_long arg3,
+                       abi_long arg4, abi_long arg5, abi_long arg6);
+/**
+ * print_taken_signal:
+ * @target_signum: target signal being taken
+ * @tinfo: target_siginfo_t which will be passed to the guest for the signal
+ *
+ * Print strace output indicating that this signal is being taken by the guest,
+ * in a format similar to:
+ * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
+ */
+void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
+
+#endif /* LINUX_USER_STRACE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df7..4ac2801e495a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "strace.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.31.1


