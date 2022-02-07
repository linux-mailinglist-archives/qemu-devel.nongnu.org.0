Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2F4AB77B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:27:55 +0100 (CET)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0JO-0007Kk-F1
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNb-00067c-BG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:11 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00079q-7w
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:10 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MFbeC-1nY3Le1CwA-00H7Lj; Mon, 07
 Feb 2022 09:28:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] linux-user: Move generic TARGET_RLIMIT* definitions to
 generic/target_resource.h
Date: Mon,  7 Feb 2022 09:27:58 +0100
Message-Id: <20220207082759.180431-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ia4UNcrvA0G3JvmkI+CYOT+eUB5fpwHfAKjWYyDvO0+M/z3xgwZ
 pygZG4OJpIPLuzJ+yl7IZVbVA0fYwQd1XcAV5dYQMI/WuEJWg3810p41R2QHpiA6jBZ9Wih
 5iKHHtzLpHapyD1GOhocpKAbK2lL0X8XOy7R00MgZVmCLc0YpmfEmlNNq46e7WUJaFuViMN
 Ks6u2cBL8AvVQIgUijg5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Bqtzo7TD+I=:EedaCVRN8WD5MShQntQxmy
 o/cUSirWCpq4THJumnTCu3Q66Vdi+goIKXqaDZl9f/IS/VcF8o4YASS8u9AGmPc/EKKCniAW0
 T0vQQgzHRMy6eSHqk+BAh9i97k9kwFXQEbao5n6xPhls2jEgpNu5iByENDfOUIHx4qCkRDgGA
 E4pjPbUtvFSkAZ4KjEchu63xDln6Sp6i8uVqfoemWD7SJNcc9aMWtn4M0UW/tnOU4GXzrYu7l
 54lYQXNdbuzkeJ304AM78vMOHTvu3ntv+7Ee1lz4vBFJACI1YGmFkW+0ueArPlqv2/qnRAPJN
 WgABGLBy8IUWjkKJAqaFFdcF/141qCtmhvP77zV4cPjJRmszD64/urYlDgjrJ46hF4knYwNCy
 QH9Kxz1Y1KW/HAE0fPobdeGsyqxO9a9jk1JSrPbJgmXvVVIyrMNQoU2ChcMC/5eeVh7gIvcm0
 Xq/8gOjiE+IMM1ZSYBgFQ3mGMWpsp6iyBeTlEgkDh679XM09QPi0QhUWzps562+cShipQWTf8
 Xmxd9/1rz6qym9ryN0Ir3xiGpQ2sPwWyjyTCE3epd2eUaX+adkXmSzVdp967VyxeXnERPpKCv
 93KNkpDJ/VSWKpZpMDCQnnA9oozK4iZjQaG/0///sP1awlvFYIK7r8F7mXOMxloU2fVsnzlpK
 3BctQUGEvOrOk39I5NCsjP5vK0ZIX9ZFyuOczsO3r3c6JWDAs7mfQGBqFi6ig9nNDN28=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Message-Id: <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
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
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/aarch64/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/alpha/target_resource.h b/linux-user/alpha/target_resource.h
new file mode 100644
index 000000000000..c9b082faee4a
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
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/arm/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/cris/target_resource.h b/linux-user/cris/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/cris/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
new file mode 100644
index 000000000000..f04c93b12596
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
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/hexagon/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/hppa/target_resource.h b/linux-user/hppa/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/hppa/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/i386/target_resource.h b/linux-user/i386/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/i386/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/m68k/target_resource.h b/linux-user/m68k/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/m68k/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/microblaze/target_resource.h b/linux-user/microblaze/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/microblaze/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/mips/target_resource.h b/linux-user/mips/target_resource.h
new file mode 100644
index 000000000000..6d131b041db9
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
index 000000000000..fe29002a12eb
--- /dev/null
+++ b/linux-user/mips64/target_resource.h
@@ -0,0 +1 @@
+#include "../mips/target_resource.h"
diff --git a/linux-user/nios2/target_resource.h b/linux-user/nios2/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/nios2/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/openrisc/target_resource.h b/linux-user/openrisc/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/openrisc/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/ppc/target_resource.h b/linux-user/ppc/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/ppc/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/riscv/target_resource.h b/linux-user/riscv/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/riscv/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/s390x/target_resource.h b/linux-user/s390x/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/s390x/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/sh4/target_resource.h b/linux-user/sh4/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/sh4/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/sparc/target_resource.h b/linux-user/sparc/target_resource.h
new file mode 100644
index 000000000000..d9a2fb814a61
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
index c8690688b5b7..78607effe847 100644
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
-#define TARGET_RLIMIT_CPU        0
-#define TARGET_RLIMIT_FSIZE      1
-#define TARGET_RLIMIT_DATA       2
-#define TARGET_RLIMIT_STACK      3
-#define TARGET_RLIMIT_CORE       4
-#if defined(TARGET_MIPS)
-#define TARGET_RLIMIT_NOFILE     5
-#define TARGET_RLIMIT_AS         6
-#define TARGET_RLIMIT_RSS        7
-#define TARGET_RLIMIT_NPROC      8
-#define TARGET_RLIMIT_MEMLOCK    9
-#elif defined(TARGET_ALPHA)
-#define TARGET_RLIMIT_RSS        5
-#define TARGET_RLIMIT_NOFILE     6
-#define TARGET_RLIMIT_AS         7
-#define TARGET_RLIMIT_NPROC      8
-#define TARGET_RLIMIT_MEMLOCK    9
-#elif defined(TARGET_SPARC)
-#define TARGET_RLIMIT_RSS        5
-#define TARGET_RLIMIT_NOFILE     6
-#define TARGET_RLIMIT_NPROC      7
-#define TARGET_RLIMIT_MEMLOCK    8
-#define TARGET_RLIMIT_AS         9
-#else
-#define TARGET_RLIMIT_RSS        5
-#define TARGET_RLIMIT_NPROC      6
-#define TARGET_RLIMIT_NOFILE     7
-#define TARGET_RLIMIT_MEMLOCK    8
-#define TARGET_RLIMIT_AS         9
-#endif
-#define TARGET_RLIMIT_LOCKS      10
-#define TARGET_RLIMIT_SIGPENDING 11
-#define TARGET_RLIMIT_MSGQUEUE   12
-#define TARGET_RLIMIT_NICE       13
-#define TARGET_RLIMIT_RTPRIO     14
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
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/x86_64/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
diff --git a/linux-user/xtensa/target_resource.h b/linux-user/xtensa/target_resource.h
new file mode 100644
index 000000000000..227259594c00
--- /dev/null
+++ b/linux-user/xtensa/target_resource.h
@@ -0,0 +1 @@
+#include "../generic/target_resource.h"
-- 
2.34.1


