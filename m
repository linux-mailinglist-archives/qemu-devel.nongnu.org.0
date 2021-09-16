Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49140DDD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:19:55 +0200 (CEST)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtB4-0004SM-Vv
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4U-00037r-4e
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:13:06 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4A-0004At-Rl
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:13:03 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M27ep-1mSnwG2TVZ-002amk; Thu, 16
 Sep 2021 17:12:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] linux-user: Split mmap prototypes into user-mmap.h
Date: Thu, 16 Sep 2021 17:12:32 +0200
Message-Id: <20210916151237.1188301-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fisbrR2TAFF4KtCuGEU6ddyrKDFa6KLsXsx5twGIcqCWOK2oWLS
 ZtjGplSNM1n0K8Z1R5zwy9jTmh1K5BU9ZNDA20urHBbAf+6W8/cw+7hexkPrCJD8fO97j2g
 5UYjmbsQa/+P6zm36y1Kd8FzaCMUSqdPb0sqIZwBNkB5oVf7efpmrsiXOoM/oAzsbJ4ZKDt
 Z7hTpvpCT9ZBWUOvOwlWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OcY21J0WZlk=:2hW+QZCbk3OuFJNimB9cLN
 rgFgvYpj0ILeeKLJVQOpP38YTlFXBorlx9qwEONQPFpNDTynFbXin1/QeGRsSnOnm1Gssme0o
 43uLKlpgttYhfqyWsqJAw1D0fyWL8UhPgFUTQYBbRnda63ncktb342yVgAvhtfgjuvzT0pSlK
 z36Q/ynDV7QDW+8YlJ/8WquKH1HK1xRSODtFtDYkCsdkefqcsiZT6Qb03w1SxXVM387kfuVZc
 o0hXSGlr4JBXOBeQdU2lGINNEcrFE0rTd8mSsSkek9/NigAX1SihMXBJyuoQThbZn40EzQcP8
 1B9VFaiPwRsITc4ztom4wcMffVBPOAjdpheJo9lmYHCq8gpA0Vd7gCkMarrhjI0l+tbKJWIrd
 m5p+7hKmkRZtUX/BiRB3Gt2JTkQ6JX881j5L/FWOH2YaRVFZ+6HDk/TQWEV5Bf4JILDIJZSB3
 kDnHyPGkrHkbCA864gFJZpHoUVk7nXm+q6oedZBZTlFA8tg+m6Jy9dw34KMUTse+rNt0wtoqe
 XSas03xW90q+tGP8U6IgfFZzhLE+XMVyu3SVDY8ikrGrBb3XfbRhHNtJzW88nR/RlwX7FiWc6
 iLudsW1Txyt7Goi7o/bZ4v9D7XGRoAW7qg35dwNO76xn0cYYllxRfG2UKLSBrBjEAaGCl7Ubg
 5sRBiLPIWqLvkebVZPOJb5u/r6rPnwAt7phkyCFM7D8XUfd9n9WzDigXSN1WPdlu91SMFLP01
 Ko5IaGMFbS+COuQR4RY3AXCa+LZd2zDxTDcDNQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

Split out the mmap prototypes into a new header user-mmap.h
which we only include where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-6-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c       |  1 +
 linux-user/flatload.c      |  1 +
 linux-user/i386/cpu_loop.c |  1 +
 linux-user/main.c          |  1 +
 linux-user/mmap.c          |  1 +
 linux-user/qemu.h          | 14 --------------
 linux-user/syscall.c       |  1 +
 linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
 8 files changed, 40 insertions(+), 14 deletions(-)
 create mode 100644 linux-user/user-mmap.h

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 6244fcd05ce4..c291f3cee09f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "disas/disas.h"
 #include "qemu/bitops.h"
 #include "qemu/path.h"
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 7484a4a35432..99550061db8d 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -37,6 +37,7 @@
 
 #include "qemu.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "flat.h"
 #include "target_flat.h"
 
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index ee2e139a0634..fcc410a426ae 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
+#include "user-mmap.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/main.c b/linux-user/main.c
index 67c5a87ffadd..a76aec733689 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -51,6 +51,7 @@
 #include "fd-trans.h"
 #include "signal-common.h"
 #include "loader.h"
+#include "user-mmap.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0e103859fed8..4b182444bbdc 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/log.h"
 #include "qemu.h"
+#include "user-mmap.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 02c4778c9704..0cb799905796 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -389,20 +389,6 @@ void sparc64_set_context(CPUSPARCState *env);
 void sparc64_get_context(CPUSPARCState *env);
 #endif
 
-/* mmap.c */
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
-extern unsigned long last_brk;
-extern abi_ulong mmap_next_start;
-abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-void mmap_fork_start(void);
-void mmap_fork_end(int child);
-
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b1cd7410d8bb..b6c8406e1dc0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -130,6 +130,7 @@
 #include "strace.h"
 #include "signal-common.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
new file mode 100644
index 000000000000..d1dec99c0249
--- /dev/null
+++ b/linux-user/user-mmap.h
@@ -0,0 +1,34 @@
+/*
+ * user-mmap.h: prototypes for linux-user guest binary loader
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
+#ifndef LINUX_USER_USER_MMAP_H
+#define LINUX_USER_USER_MMAP_H
+
+int target_mprotect(abi_ulong start, abi_ulong len, int prot);
+abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, int fd, abi_ulong offset);
+int target_munmap(abi_ulong start, abi_ulong len);
+abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+                       abi_ulong new_size, unsigned long flags,
+                       abi_ulong new_addr);
+extern unsigned long last_brk;
+extern abi_ulong mmap_next_start;
+abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
+void mmap_fork_start(void);
+void mmap_fork_end(int child);
+
+#endif /* LINUX_USER_USER_MMAP_H */
-- 
2.31.1


