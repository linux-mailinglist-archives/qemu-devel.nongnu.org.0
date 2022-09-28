Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E85EE6DF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:55:54 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode5w-0001TU-1z
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeu-0008QB-GT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:56 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeq-0006So-P5
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:55 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MN5aF-1ouTgc09sD-00J5VF; Wed, 28
 Sep 2022 22:27:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 13/37] linux-user: Provide MADV_* definitions
Date: Wed, 28 Sep 2022 22:27:13 +0200
Message-Id: <20220928202737.793171-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NCOMx4w4ocrFe6TZtP2SUsA6vRMvBuVILb7FC493lWMeFcOp9Jr
 2bQiHPO3bYXle6W1JTOoc58JPap/moJUQlgu1CEkeNnFgIEccWol92gosF7cekrsEwiEeDe
 KSozDoTmrB6Xr3FzGL1WkUjw25qU4RZJdw7tdl68pN4Q3UNZJtnbGLY5JpF3/iKmrIraGnE
 KoWawya703CugvY7BXzwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+GnstxPQhhQ=:xNJNSY4ezzZWml5s/q0cHu
 Ha/oS6xpDXEc7k09XbAYBiWkBWUJ+oIHgcPcZuU5AX2q94V8/TSzjcIGjiFeb606WrqfJgUQ8
 6219Y+YfLWfVOjGTpst4EjevHj/zFX4b0xJyU7dH99NdnIZ4Ju3gVgHaYXf2mFn16Sdq4Vcqk
 OQ2K/q4SFIDVSKHHnqQth0NFktzY6zG7YpjaBsM1L2MyX4+qOXmvEFW5W3mDHm42PUxP9ak1o
 FY89zhwJCgECjHCjLZ9b5RYpURmftjXV0DPuFC9U9fy9AG7gnuFd5/p94w3UHqSYAF+ZIH4Ch
 YDmSKYOJvV1hn9kS64bFULnkuEAIwwMRDGcnTU54KScS95ZcLV6phiQIoOF05KRE6fqS0X3nn
 CZjhL8huSzC+LKw7EEZ7jtbvlGa9/81OOBb850T5oSOc3ntoEZMo9V0Hb77rCA1vkHo/UaPJW
 0hjIBcp7LgoIo47b0uHjI8wskRrJFPF5ciayq9LHXL6YziNA+6mcXVQmXO3DypnS6f/3POPUJ
 JFkEbB++Ilp7Uh70R3ZQuuN1/cqFTFZLYIAkFxk5CnIvgM372XzqQKoPpk8W6grobC4BxEfRL
 CJ3BlYywZCsrsC2eUsAU8hrY/B7RH8Y2BPbz91MrWEJL3aMHxJiOeewh23LR8g+T5pGy7Qtvv
 YC95aPrl+TNCEOubhYOdUBIUra617oQagNp59GwhjIapDfG2vhG61l9Z/4TKUuGiCn0RENVkD
 2VY6hNKs7yaC7BZ2M8BYnt+k/9l8bF24+YWagI+R4gdP73lRnZvJubSmoHuDfjssCBVsoO1Or
 5OE5vdA
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Provide MADV_* definitions using target_mman.h header, similar to what
kernel does. Most architectures use the same values, with the exception
of alpha and hppa.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-2-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/target_mman.h     |  1 +
 linux-user/alpha/target_mman.h       |  8 +++
 linux-user/arm/target_mman.h         |  1 +
 linux-user/cris/target_mman.h        |  1 +
 linux-user/generic/target_mman.h     | 92 ++++++++++++++++++++++++++++
 linux-user/hexagon/target_mman.h     |  1 +
 linux-user/hppa/target_mman.h        | 15 +++++
 linux-user/i386/target_mman.h        |  1 +
 linux-user/loongarch64/target_mman.h |  1 +
 linux-user/m68k/target_mman.h        |  1 +
 linux-user/microblaze/target_mman.h  |  1 +
 linux-user/mips/target_mman.h        |  1 +
 linux-user/mips64/target_mman.h      |  1 +
 linux-user/nios2/target_mman.h       |  1 +
 linux-user/openrisc/target_mman.h    |  1 +
 linux-user/ppc/target_mman.h         |  1 +
 linux-user/riscv/target_mman.h       |  1 +
 linux-user/s390x/target_mman.h       |  1 +
 linux-user/sh4/target_mman.h         |  1 +
 linux-user/sparc/target_mman.h       |  1 +
 linux-user/x86_64/target_mman.h      |  1 +
 linux-user/xtensa/target_mman.h      |  1 +
 22 files changed, 134 insertions(+)
 create mode 100644 linux-user/aarch64/target_mman.h
 create mode 100644 linux-user/alpha/target_mman.h
 create mode 100644 linux-user/arm/target_mman.h
 create mode 100644 linux-user/cris/target_mman.h
 create mode 100644 linux-user/generic/target_mman.h
 create mode 100644 linux-user/hexagon/target_mman.h
 create mode 100644 linux-user/hppa/target_mman.h
 create mode 100644 linux-user/i386/target_mman.h
 create mode 100644 linux-user/loongarch64/target_mman.h
 create mode 100644 linux-user/m68k/target_mman.h
 create mode 100644 linux-user/microblaze/target_mman.h
 create mode 100644 linux-user/mips/target_mman.h
 create mode 100644 linux-user/mips64/target_mman.h
 create mode 100644 linux-user/nios2/target_mman.h
 create mode 100644 linux-user/openrisc/target_mman.h
 create mode 100644 linux-user/ppc/target_mman.h
 create mode 100644 linux-user/riscv/target_mman.h
 create mode 100644 linux-user/s390x/target_mman.h
 create mode 100644 linux-user/sh4/target_mman.h
 create mode 100644 linux-user/sparc/target_mman.h
 create mode 100644 linux-user/x86_64/target_mman.h
 create mode 100644 linux-user/xtensa/target_mman.h

diff --git a/linux-user/aarch64/target_mman.h b/linux-user/aarch64/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/aarch64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman.h
new file mode 100644
index 000000000000..cd6e3d70a604
--- /dev/null
+++ b/linux-user/alpha/target_mman.h
@@ -0,0 +1,8 @@
+#ifndef ALPHA_TARGET_MMAN_H
+#define ALPHA_TARGET_MMAN_H
+
+#define TARGET_MADV_DONTNEED 6
+
+#include "../generic/target_mman.h"
+
+#endif
diff --git a/linux-user/arm/target_mman.h b/linux-user/arm/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/arm/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/cris/target_mman.h b/linux-user/cris/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/cris/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
new file mode 100644
index 000000000000..1436a3c54308
--- /dev/null
+++ b/linux-user/generic/target_mman.h
@@ -0,0 +1,92 @@
+#ifndef LINUX_USER_TARGET_MMAN_H
+#define LINUX_USER_TARGET_MMAN_H
+
+#ifndef TARGET_MADV_NORMAL
+#define TARGET_MADV_NORMAL 0
+#endif
+
+#ifndef TARGET_MADV_RANDOM
+#define TARGET_MADV_RANDOM 1
+#endif
+
+#ifndef TARGET_MADV_SEQUENTIAL
+#define TARGET_MADV_SEQUENTIAL 2
+#endif
+
+#ifndef TARGET_MADV_WILLNEED
+#define TARGET_MADV_WILLNEED 3
+#endif
+
+#ifndef TARGET_MADV_DONTNEED
+#define TARGET_MADV_DONTNEED 4
+#endif
+
+#ifndef TARGET_MADV_FREE
+#define TARGET_MADV_FREE 8
+#endif
+
+#ifndef TARGET_MADV_REMOVE
+#define TARGET_MADV_REMOVE 9
+#endif
+
+#ifndef TARGET_MADV_DONTFORK
+#define TARGET_MADV_DONTFORK 10
+#endif
+
+#ifndef TARGET_MADV_DOFORK
+#define TARGET_MADV_DOFORK 11
+#endif
+
+#ifndef TARGET_MADV_MERGEABLE
+#define TARGET_MADV_MERGEABLE 12
+#endif
+
+#ifndef TARGET_MADV_UNMERGEABLE
+#define TARGET_MADV_UNMERGEABLE 13
+#endif
+
+#ifndef TARGET_MADV_HUGEPAGE
+#define TARGET_MADV_HUGEPAGE 14
+#endif
+
+#ifndef TARGET_MADV_NOHUGEPAGE
+#define TARGET_MADV_NOHUGEPAGE 15
+#endif
+
+#ifndef TARGET_MADV_DONTDUMP
+#define TARGET_MADV_DONTDUMP 16
+#endif
+
+#ifndef TARGET_MADV_DODUMP
+#define TARGET_MADV_DODUMP 17
+#endif
+
+#ifndef TARGET_MADV_WIPEONFORK
+#define TARGET_MADV_WIPEONFORK 18
+#endif
+
+#ifndef TARGET_MADV_KEEPONFORK
+#define TARGET_MADV_KEEPONFORK 19
+#endif
+
+#ifndef TARGET_MADV_COLD
+#define TARGET_MADV_COLD 20
+#endif
+
+#ifndef TARGET_MADV_PAGEOUT
+#define TARGET_MADV_PAGEOUT 21
+#endif
+
+#ifndef TARGET_MADV_POPULATE_READ
+#define TARGET_MADV_POPULATE_READ 22
+#endif
+
+#ifndef TARGET_MADV_POPULATE_WRITE
+#define TARGET_MADV_POPULATE_WRITE 23
+#endif
+
+#ifndef TARGET_MADV_DONTNEED_LOCKED
+#define TARGET_MADV_DONTNEED_LOCKED 24
+#endif
+
+#endif
diff --git a/linux-user/hexagon/target_mman.h b/linux-user/hexagon/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/hexagon/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
new file mode 100644
index 000000000000..66dd9f79414e
--- /dev/null
+++ b/linux-user/hppa/target_mman.h
@@ -0,0 +1,15 @@
+#ifndef HPPA_TARGET_MMAN_H
+#define HPPA_TARGET_MMAN_H
+
+#define TARGET_MADV_MERGEABLE 65
+#define TARGET_MADV_UNMERGEABLE 66
+#define TARGET_MADV_HUGEPAGE 67
+#define TARGET_MADV_NOHUGEPAGE 68
+#define TARGET_MADV_DONTDUMP 69
+#define TARGET_MADV_DODUMP 70
+#define TARGET_MADV_WIPEONFORK 71
+#define TARGET_MADV_KEEPONFORK 72
+
+#include "../generic/target_mman.h"
+
+#endif
diff --git a/linux-user/i386/target_mman.h b/linux-user/i386/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/i386/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/loongarch64/target_mman.h b/linux-user/loongarch64/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/loongarch64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/m68k/target_mman.h b/linux-user/m68k/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/m68k/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/microblaze/target_mman.h b/linux-user/microblaze/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/microblaze/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/mips/target_mman.h b/linux-user/mips/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/mips/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/mips64/target_mman.h b/linux-user/mips64/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/mips64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/nios2/target_mman.h b/linux-user/nios2/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/nios2/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/openrisc/target_mman.h b/linux-user/openrisc/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/openrisc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/ppc/target_mman.h b/linux-user/ppc/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/ppc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/riscv/target_mman.h b/linux-user/riscv/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/riscv/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/s390x/target_mman.h b/linux-user/s390x/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/s390x/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/sh4/target_mman.h b/linux-user/sh4/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/sh4/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/sparc/target_mman.h b/linux-user/sparc/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/sparc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/x86_64/target_mman.h b/linux-user/x86_64/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/x86_64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/xtensa/target_mman.h b/linux-user/xtensa/target_mman.h
new file mode 100644
index 000000000000..e7ba6070fe7c
--- /dev/null
+++ b/linux-user/xtensa/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
-- 
2.37.3


