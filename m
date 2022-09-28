Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1CC5EDA9C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:53:41 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUhA-0007as-L5
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008Ap-NQ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-0008Ai-NL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:32 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MgNpJ-1pALKM0Qc3-00huW8; Wed, 28
 Sep 2022 10:15:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 13/38] linux-user: Provide MADV_* definitions
Date: Wed, 28 Sep 2022 10:14:52 +0200
Message-Id: <20220928081517.734954-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iB3EV6V9xPhCjkl/TgXl2lZp9T+3s1ps2p5pDe7mjNTNVFDCBTO
 Z7FUzD3cznLM/9wHhrqUg6jUHZjwppboeoDpbUUgT+arcb6EjKU6WmqifhmLeLZ7AxB0+J+
 cJutOJkxyV6dmzQPLSxRA69nOzxcWGoeqfbfY5yslW2wh2+7U6su2yf1vLn63ZO4jIL4PoB
 j5wl47U57Yy+PtCgq9EKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bQ5z94ZKgfI=:kIXTlm38shq8h0xZBv83TW
 1SXzudUXJ3XZAfPZNYmeVzY9hih5Xvx7DhCUyJYqLudGjf1xRvRBmctzX/5enRjAbKoFhaiQq
 10wOn7PHM9RCWoxjWDxc6ZXYU6HIK8eZoIkX49qyVfC3PN9QbHjq6vfdaJUk3NZHBnjV3zoIz
 cKvJZDKZTg+ZK2iX8m9JXdNsClp0q9F2DACJDcdUNrEIjpdlANX36P2DNNujDzy4iI6V992HO
 tJURZ+MCeeQHYJe1y5hPgQwaGWxnDx1au5qEtZoFFV1Rexa+pvNsIiP9HzdTMQdHBH8VVO0pu
 eJm/y6bnDwmzOtR+7LnZJnL7jxnrI4bQ3CYFjB8+bI/WmpZBQMfQjAt9XchnoCJU0jHFY3zCD
 Hi6QD8h+sCFTIPgJEI6xZL3T7Z6ppIqxiiDSjTiVWdNhor1TEK9FIP5L7YjurWe3jwj0Sszlf
 8Qu8Fs0GiREKxcMegK8lo1xTPWWJ9JWr8ZCbR34IDfoMQ0qHD5HrqrSRXZ4YuI+oAcq3GmedE
 TQkurBEtJD8UVm1jy3/t2HGLQaCUdt2qlxacC2LYiV2+BVNCOFAS0+LesXJ60sV6R2zQQIShj
 nrSuDYBywFY85aXjf3nTO+1gaeJv/68Nna83QOWtkaT3euMEJRlqaib+zx778IjccpugddcM/
 Ojraei+8wAj2Hw9gLThjeiBJWdkP+HJ0GCc5caFv+Gi644kfPmWI3CN8bAINO8JPACRGhqwUa
 WDyjo2um5xWDupqtalZSpv7vqVs7MtBpP0u6g5xpT4uNWjcBLNAUU6qUXADe2O2O2MhXj3HPr
 fCif5Ba
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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


