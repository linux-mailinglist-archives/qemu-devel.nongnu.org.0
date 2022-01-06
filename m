Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804DE48612A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:53:36 +0100 (CET)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NaZ-0008TM-D9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5NV9-0005Sd-8B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:48:02 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54638 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5NV5-0006Yt-GZ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:47:58 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_8ucntZhlwMAAA--.61S3;
 Thu, 06 Jan 2022 15:47:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] linux-user: Move target_signal.h generic definitions
 to generic/signal.h
Date: Thu,  6 Jan 2022 02:47:38 -0500
Message-Id: <20220106074740.1754661-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220106074740.1754661-1-gaosong@loongson.cn>
References: <20220106074740.1754661-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_8ucntZhlwMAAA--.61S3
X-Coremail-Antispam: 1UD129KBjvAXoWfJw4DZr1rWr17JrW3CF48Zwb_yoW8Gr1rJo
 WIvFn7ur1rJr1ruw4qgw4kWr9xJr97Jw48Ar47ur95GrnFgFn5Wr9rt3yxuF45XryfKF4r
 JFyaq3Wvkan5GF4kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, gaosong@loongson.cn,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No code change

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h    | 18 ------------------
 linux-user/arm/target_signal.h        | 18 ------------------
 linux-user/cris/target_signal.h       | 18 ------------------
 linux-user/generic/signal.h           | 16 ++++++++++++++++
 linux-user/hexagon/target_signal.h    | 11 -----------
 linux-user/i386/target_signal.h       | 18 ------------------
 linux-user/m68k/target_signal.h       | 18 ------------------
 linux-user/microblaze/target_signal.h | 18 ------------------
 linux-user/nios2/target_signal.h      | 16 ----------------
 linux-user/openrisc/target_signal.h   | 23 -----------------------
 linux-user/ppc/target_signal.h        | 18 ------------------
 linux-user/riscv/target_signal.h      | 12 ------------
 linux-user/s390x/target_signal.h      | 15 ---------------
 linux-user/sh4/target_signal.h        | 18 ------------------
 linux-user/x86_64/target_signal.h     | 18 ------------------
 linux-user/xtensa/target_signal.h     | 17 -----------------
 16 files changed, 16 insertions(+), 256 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 7580d99403..40e399d990 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef AARCH64_TARGET_SIGNAL_H
 #define AARCH64_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK 1
-#define TARGET_SS_DISABLE 2
-
-#define TARGET_MINSIGSTKSZ 2048
-#define TARGET_SIGSTKSZ 8192
-
 #include "../generic/signal.h"
 
 #define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
index 1e7fb0cecb..0e6351d9f7 100644
--- a/linux-user/arm/target_signal.h
+++ b/linux-user/arm/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef ARM_TARGET_SIGNAL_H
 #define ARM_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK	1
-#define TARGET_SS_DISABLE	2
-
-#define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
index 83a5155507..ab0653fcdc 100644
--- a/linux-user/cris/target_signal.h
+++ b/linux-user/cris/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef CRIS_TARGET_SIGNAL_H
 #define CRIS_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
index 943bc1a1e2..ceaf8a876c 100644
--- a/linux-user/generic/signal.h
+++ b/linux-user/generic/signal.h
@@ -55,6 +55,22 @@
 #define TARGET_SIG_UNBLOCK        1    /* for unblocking signals */
 #define TARGET_SIG_SETMASK        2    /* for setting the signal mask */
 
+/* this struct defines a stack used during syscall handling */
+typedef struct target_sigaltstack {
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
+} target_stack_t;
+
+/*
+ * sigaltstack controls
+ */
+#define TARGET_SS_ONSTACK 1
+#define TARGET_SS_DISABLE 2
+
+#define TARGET_MINSIGSTKSZ     2048
+#define TARGET_SIGSTKSZ        8192
+
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
 /* mask for all SS_xxx flags */
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 9e0223d322..193abac340 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -18,17 +18,6 @@
 #ifndef HEXAGON_TARGET_SIGNAL_H
 #define HEXAGON_TARGET_SIGNAL_H
 
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-#define TARGET_SS_ONSTACK 1
-#define TARGET_SS_DISABLE 2
-
-#define TARGET_MINSIGSTKSZ 2048
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
index 64d09f2e75..9315cba241 100644
--- a/linux-user/i386/target_signal.h
+++ b/linux-user/i386/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef I386_TARGET_SIGNAL_H
 #define I386_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK	1
-#define TARGET_SS_DISABLE	2
-
-#define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
index 94157bf1f4..6e0f4b74e3 100644
--- a/linux-user/m68k/target_signal.h
+++ b/linux-user/m68k/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef M68K_TARGET_SIGNAL_H
 #define M68K_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK	1
-#define TARGET_SS_DISABLE	2
-
-#define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ	8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index e8b510f6b1..7dc5c45f00 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef MICROBLAZE_TARGET_SIGNAL_H
 #define MICROBLAZE_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index fe266c4c51..46ca5948ce 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -1,22 +1,6 @@
 #ifndef NIOS2_TARGET_SIGNAL_H
 #define NIOS2_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/* sigaltstack controls  */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 /* Nios2 uses a fixed address on the kuser page for sigreturn. */
diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
index 077ec3d5e8..5b9d40974a 100644
--- a/linux-user/openrisc/target_signal.h
+++ b/linux-user/openrisc/target_signal.h
@@ -1,29 +1,6 @@
 #ifndef OPENRISC_TARGET_SIGNAL_H
 #define OPENRISC_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_long ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-/* sigaltstack controls  */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_SA_NOCLDSTOP    0x00000001
-#define TARGET_SA_NOCLDWAIT    0x00000002
-#define TARGET_SA_SIGINFO      0x00000004
-#define TARGET_SA_ONSTACK      0x08000000
-#define TARGET_SA_RESTART      0x10000000
-#define TARGET_SA_NODEFER      0x40000000
-#define TARGET_SA_RESETHAND    0x80000000
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
index 82184ab8f2..5be24e152b 100644
--- a/linux-user/ppc/target_signal.h
+++ b/linux-user/ppc/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef PPC_TARGET_SIGNAL_H
 #define PPC_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #if !defined(TARGET_PPC64)
diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
index 3e36fddc9d..6c0470f0bc 100644
--- a/linux-user/riscv/target_signal.h
+++ b/linux-user/riscv/target_signal.h
@@ -1,18 +1,6 @@
 #ifndef RISCV_TARGET_SIGNAL_H
 #define RISCV_TARGET_SIGNAL_H
 
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-#define TARGET_SS_ONSTACK 1
-#define TARGET_SS_DISABLE 2
-
-#define TARGET_MINSIGSTKSZ 2048
-#define TARGET_SIGSTKSZ 8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index 64f5f42201..41e0e34a55 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -1,21 +1,6 @@
 #ifndef S390X_TARGET_SIGNAL_H
 #define S390X_TARGET_SIGNAL_H
 
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK      1
-#define TARGET_SS_DISABLE      2
-
-#define TARGET_MINSIGSTKSZ     2048
-#define TARGET_SIGSTKSZ        8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
index 04069cba66..eee6a1a7cd 100644
--- a/linux-user/sh4/target_signal.h
+++ b/linux-user/sh4/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef SH4_TARGET_SIGNAL_H
 #define SH4_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
index 4673c5a886..9d9717406f 100644
--- a/linux-user/x86_64/target_signal.h
+++ b/linux-user/x86_64/target_signal.h
@@ -1,24 +1,6 @@
 #ifndef X86_64_TARGET_SIGNAL_H
 #define X86_64_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK	1
-#define TARGET_SS_DISABLE	2
-
-#define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
-
 #include "../generic/signal.h"
 
 /* For x86_64, use of SA_RESTORER is mandatory. */
diff --git a/linux-user/xtensa/target_signal.h b/linux-user/xtensa/target_signal.h
index 1c7ee73154..e4b1bea5cb 100644
--- a/linux-user/xtensa/target_signal.h
+++ b/linux-user/xtensa/target_signal.h
@@ -1,23 +1,6 @@
 #ifndef XTENSA_TARGET_SIGNAL_H
 #define XTENSA_TARGET_SIGNAL_H
 
-/* this struct defines a stack used during syscall handling */
-
-typedef struct target_sigaltstack {
-    abi_ulong ss_sp;
-    abi_int ss_flags;
-    abi_ulong ss_size;
-} target_stack_t;
-
-/*
- * sigaltstack controls
- */
-#define TARGET_SS_ONSTACK     1
-#define TARGET_SS_DISABLE     2
-
-#define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
-
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
-- 
2.27.0


