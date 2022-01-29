Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2A4A31AB
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 20:48:59 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDtiU-0002Ja-2E
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 14:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtgj-0001Pg-NS; Sat, 29 Jan 2022 14:47:09 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:49604)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtgh-0002KW-4B; Sat, 29 Jan 2022 14:47:09 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 3352B1BF454;
 Sat, 29 Jan 2022 22:47:15 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Move generic TARGET_RLIMIT* definitions to
 generic/target_resource.h
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
 <87ilu2l473.fsf@depni.sinp.msu.ru>
Date: Sat, 29 Jan 2022 22:46:59 +0300
In-Reply-To: <87ilu2l473.fsf@depni.sinp.msu.ru> (Serge Belyshev's message of
 "Sat, 29 Jan 2022 22:41:52 +0300")
Message-ID: <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
---
Compile tested, and also verified that target definitions did not change.

 linux-user/aarch64/target_resource.h    |  1 +
 linux-user/alpha/target_resource.h      | 21 ++++++++++
 linux-user/arm/target_resource.h        |  1 +
 linux-user/cris/target_resource.h       |  1 +
 linux-user/generic/target_resource.h    | 37 +++++++++++++++++
 linux-user/hexagon/target_resource.h    |  1 +
 linux-user/hppa/target_resource.h       |  1 +
 linux-user/i386/target_resource.h       |  1 +
 linux-user/m68k/target_resource.h       |  1 +
 linux-user/microblaze/target_resource.h |  1 +
 linux-user/mips/target_resource.h       | 24 +++++++++++
 linux-user/mips64/target_resource.h     |  1 +
 linux-user/nios2/target_resource.h      |  1 +
 linux-user/openrisc/target_resource.h   |  1 +
 linux-user/ppc/target_resource.h        |  1 +
 linux-user/riscv/target_resource.h      |  1 +
 linux-user/s390x/target_resource.h      |  1 +
 linux-user/sh4/target_resource.h        |  1 +
 linux-user/sparc/target_resource.h      | 17 ++++++++
 linux-user/syscall_defs.h               | 53 +------------------------
 linux-user/x86_64/target_resource.h     |  1 +
 linux-user/xtensa/target_resource.h     |  1 +
 22 files changed, 117 insertions(+), 52 deletions(-)
 create mode 100644 linux-user/aarch64/target_resource.h
 create mode 100644 linux-user/alpha/target_resource.h
 create mode 100644 linux-user/arm/target_resource.h
 create mode 100644 linux-user/cris/target_resource.h
 create mode 100644 linux-user/generic/target_resource.h
 create mode 100644 linux-user/hexagon/target_resource.h
 create mode 100644 linux-user/hppa/target_resource.h
 create mode 100644 linux-user/i386/target_resource.h
 create mode 100644 linux-user/m68k/target_resource.h
 create mode 100644 linux-user/microblaze/target_resource.h
 create mode 100644 linux-user/mips/target_resource.h
 create mode 100644 linux-user/mips64/target_resource.h
 create mode 100644 linux-user/nios2/target_resource.h
 create mode 100644 linux-user/openrisc/target_resource.h
 create mode 100644 linux-user/ppc/target_resource.h
 create mode 100644 linux-user/riscv/target_resource.h
 create mode 100644 linux-user/s390x/target_resource.h
 create mode 100644 linux-user/sh4/target_resource.h
 create mode 100644 linux-user/sparc/target_resource.h
 create mode 100644 linux-user/x86_64/target_resource.h
 create mode 100644 linux-user/xtensa/target_resource.h

diff --git a/linux-user/aarch64/target_resource.h b/linux-user/aarch64/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/aarch64/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/alpha/target_resource.h b/linux-user/alpha/target_resource.h
new file mode 100644
index 0000000000..c9b082faee
--- /dev/null
+++ b/linux-user/alpha/target_resource.h
@@ -0,0 +1,21 @@
+#ifndef ALPHA_TARGET_RESOURCE_H
+#define ALPHA_TARGET_RESOURCE_H
+
+#include "../generic/target_resource.h"
+
+#undef TARGET_RLIM_INFINITY
+#define TARGET_RLIM_INFINITY    0x7fffffffffffffffull
+
+#undef TARGET_RLIMIT_NOFILE
+#define TARGET_RLIMIT_NOFILE    6
+
+#undef TARGET_RLIMIT_AS
+#define TARGET_RLIMIT_AS        7
+
+#undef TARGET_RLIMIT_NPROC
+#define TARGET_RLIMIT_NPROC     8
+
+#undef TARGET_RLIMIT_MEMLOCK
+#define TARGET_RLIMIT_MEMLOCK   9
+
+#endif
diff --git a/linux-user/arm/target_resource.h b/linux-user/arm/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/arm/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/cris/target_resource.h b/linux-user/cris/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/cris/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
new file mode 100644
index 0000000000..f04c93b125
--- /dev/null
+++ b/linux-user/generic/target_resource.h
@@ -0,0 +1,37 @@
+/*
+ * Target definitions of RLIMIT_* constants. These may be overridden by an
+ * architecture specific header if needed.
+ */
+
+#ifndef GENERIC_TARGET_RESOURCE_H
+#define GENERIC_TARGET_RESOURCE_H
+
+struct target_rlimit {
+    abi_ulong rlim_cur;
+    abi_ulong rlim_max;
+};
+
+struct target_rlimit64 {
+    uint64_t rlim_cur;
+    uint64_t rlim_max;
+};
+
+#define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
+
+#define TARGET_RLIMIT_CPU               0
+#define TARGET_RLIMIT_FSIZE             1
+#define TARGET_RLIMIT_DATA              2
+#define TARGET_RLIMIT_STACK             3
+#define TARGET_RLIMIT_CORE              4
+#define TARGET_RLIMIT_RSS               5
+#define TARGET_RLIMIT_NPROC             6
+#define TARGET_RLIMIT_NOFILE            7
+#define TARGET_RLIMIT_MEMLOCK           8
+#define TARGET_RLIMIT_AS                9
+#define TARGET_RLIMIT_LOCKS             10
+#define TARGET_RLIMIT_SIGPENDING        11
+#define TARGET_RLIMIT_MSGQUEUE          12
+#define TARGET_RLIMIT_NICE              13
+#define TARGET_RLIMIT_RTPRIO            14
+
+#endif
diff --git a/linux-user/hexagon/target_resource.h b/linux-user/hexagon/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/hexagon/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/hppa/target_resource.h b/linux-user/hppa/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/hppa/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/i386/target_resource.h b/linux-user/i386/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/i386/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/m68k/target_resource.h b/linux-user/m68k/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/m68k/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/microblaze/target_resource.h b/linux-user/microblaze/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/microblaze/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/mips/target_resource.h b/linux-user/mips/target_resource.h
new file mode 100644
index 0000000000..6d131b041d
--- /dev/null
+++ b/linux-user/mips/target_resource.h
@@ -0,0 +1,24 @@
+#ifndef MIPS_TARGET_RESOURCE_H
+#define MIPS_TARGET_RESOURCE_H
+
+#include "../generic/target_resource.h"
+
+#undef TARGET_RLIM_INFINITY
+#define TARGET_RLIM_INFINITY    0x7fffffffUL
+
+#undef TARGET_RLIMIT_NOFILE
+#define TARGET_RLIMIT_NOFILE    5
+
+#undef TARGET_RLIMIT_AS
+#define TARGET_RLIMIT_AS        6
+
+#undef TARGET_RLIMIT_RSS
+#define TARGET_RLIMIT_RSS       7
+
+#undef TARGET_RLIMIT_NPROC
+#define TARGET_RLIMIT_NPROC     8
+
+#undef TARGET_RLIMIT_MEMLOCK
+#define TARGET_RLIMIT_MEMLOCK   9
+
+#endif
diff --git a/linux-user/mips64/target_resource.h b/linux-user/mips64/target_resource.h
new file mode 100644
index 0000000000..fe29002a12
--- /dev/null
+++ b/linux-user/mips64/target_resource.h
@@ -0,0 +1 @@
+#include "../mips/target_resource.h"
diff --git a/linux-user/nios2/target_resource.h b/linux-user/nios2/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/nios2/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/openrisc/target_resource.h b/linux-user/openrisc/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/openrisc/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/ppc/target_resource.h b/linux-user/ppc/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/ppc/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/riscv/target_resource.h b/linux-user/riscv/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/riscv/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/s390x/target_resource.h b/linux-user/s390x/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/s390x/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/sh4/target_resource.h b/linux-user/sh4/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/sh4/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/sparc/target_resource.h b/linux-user/sparc/target_resource.h
new file mode 100644
index 0000000000..d9a2fb814a
--- /dev/null
+++ b/linux-user/sparc/target_resource.h
@@ -0,0 +1,17 @@
+#ifndef SPARC_TARGET_RESOURCE_H
+#define SPARC_TARGET_RESOURCE_H
+
+#include "../generic/target_resource.h"
+
+#if TARGET_ABI_BITS == 32
+#undef TARGET_RLIM_INFINITY
+#define TARGET_RLIM_INFINITY    0x7fffffffUL
+#endif
+
+#undef TARGET_RLIMIT_NOFILE
+#define TARGET_RLIMIT_NOFILE    6
+
+#undef TARGET_RLIMIT_NPROC
+#define TARGET_RLIMIT_NPROC     7
+
+#endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 3fcabaeae3..78607effe8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -717,54 +717,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
 #define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
-struct target_rlimit {
-        abi_ulong   rlim_cur;
-        abi_ulong   rlim_max;
-};
-
-#if defined(TARGET_ALPHA)
-#define TARGET_RLIM_INFINITY	0x7fffffffffffffffull
-#elif defined(TARGET_MIPS) || (defined(TARGET_SPARC) && TARGET_ABI_BITS == 32)
-#define TARGET_RLIM_INFINITY	0x7fffffffUL
-#else
-#define TARGET_RLIM_INFINITY	((abi_ulong)-1)
-#endif
-
-#define TARGET_RLIMIT_CPU		0
-#define TARGET_RLIMIT_FSIZE		1
-#define TARGET_RLIMIT_DATA		2
-#define TARGET_RLIMIT_STACK		3
-#define TARGET_RLIMIT_CORE		4
-#if defined(TARGET_MIPS)
-#define TARGET_RLIMIT_NOFILE		5
-#define TARGET_RLIMIT_AS		6
-#define TARGET_RLIMIT_RSS		7
-#define TARGET_RLIMIT_NPROC		8
-#define TARGET_RLIMIT_MEMLOCK		9
-#elif defined(TARGET_ALPHA)
-#define TARGET_RLIMIT_RSS		5
-#define TARGET_RLIMIT_NOFILE		6
-#define TARGET_RLIMIT_AS		7
-#define TARGET_RLIMIT_NPROC		8
-#define TARGET_RLIMIT_MEMLOCK		9
-#elif defined(TARGET_SPARC)
-#define TARGET_RLIMIT_RSS		5
-#define TARGET_RLIMIT_NOFILE		6
-#define TARGET_RLIMIT_NPROC		7
-#define TARGET_RLIMIT_MEMLOCK		8
-#define TARGET_RLIMIT_AS		9
-#else
-#define TARGET_RLIMIT_RSS		5
-#define TARGET_RLIMIT_NPROC		6
-#define TARGET_RLIMIT_NOFILE		7
-#define TARGET_RLIMIT_MEMLOCK		8
-#define TARGET_RLIMIT_AS		9
-#endif
-#define TARGET_RLIMIT_LOCKS		10
-#define TARGET_RLIMIT_SIGPENDING	11
-#define TARGET_RLIMIT_MSGQUEUE		12
-#define TARGET_RLIMIT_NICE		13
-#define TARGET_RLIMIT_RTPRIO		14
+#include "target_resource.h"
 
 struct target_pollfd {
     int fd;           /* file descriptor */
@@ -2769,10 +2722,6 @@ struct target_epoll_event {
 #define TARGET_EP_MAX_EVENTS (INT_MAX / sizeof(struct target_epoll_event))
 
 #endif
-struct target_rlimit64 {
-    uint64_t rlim_cur;
-    uint64_t rlim_max;
-};
 
 struct target_ucred {
     uint32_t pid;
diff --git a/linux-user/x86_64/target_resource.h b/linux-user/x86_64/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/x86_64/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/xtensa/target_resource.h b/linux-user/xtensa/target_resource.h
new file mode 100644
index 0000000000..227259594c
--- /dev/null
+++ b/linux-user/xtensa/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
-- 
2.34.1


