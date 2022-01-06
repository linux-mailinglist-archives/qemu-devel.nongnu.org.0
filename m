Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A189A48631D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:47:44 +0100 (CET)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QJ5-0004qv-Oe
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDV-0007cu-0Z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004ia-Pd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1My3Ad-1mArYP0Ktz-00zaqD; Thu, 06
 Jan 2022 11:41:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/27] linux-user: Move target_signal.h generic definitions to
 generic/signal.h
Date: Thu,  6 Jan 2022 11:41:14 +0100
Message-Id: <20220106104137.732883-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+wgdF5CoUsgsMqtWkXtXNfDYrXEiscisornL7h8ZnsIh4kdCfR3
 eJIhiSMdFagMrdS+Yb7JfPKm2JlAcnRcJiFAAKcxH7/EFJZQsbyJN04TdmFnXN/HoP2heVY
 3G3er/nXTa1/TzpcZrbRlzxOtYta0xqrXoS5xVsL6UVaZr6NoSbaXM2BtMIqlbCVA1zM11x
 cJnMkEsJnWXv+8CNkEveA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:voXw0mK29yI=:Oj6vbPPDVSZJ31YMKNyC/z
 foocgqJs7+rD3U+qSBxByrFdOyDngDElo5zcBC/jKYy2sDSSNSYI7pB3IQLnCqx7/JcyUwHuH
 Em7ZXGtoGphbx2dXc1PBw5yEsMQ5hQPvlKq2XgtGJQOMyNOenfKWW8allm7AC17cIWZ+xPl8+
 HwpEMuE4xwuHRW8Lkj+djW2sjq/V8hecU9UiSSaFcDUVMkXsNsEZn5CAw8nEOIpXogcbk+0FB
 MtKW9IGivnwldQWPR8yhojkk0XvEQfpjIudDNCBd6HXDfDXsBNGHANeqn1AHhmryhg//ns5LN
 FkK7yBvmMud8o519fKZzY+STptdZybFXKtYAV/y9SrDChkcMQK1IEVUV6j2k32cy35OxiXhCR
 2JcnGdTkx5BzAu4jzr7tqGcg8oJbn6QkLtCqaWCOT/T1YP88FBM8r4iq/ZrGK0mMF0P0vk58z
 bUpVJLvrGR5VZi3DV9GazPrMIfRxfFOROQq0TYUarMKbGtmbnNtG6t9UJo/2Oqqcp7o6W7Pso
 LG4mj4cJSMTZUHlI5V/Ab6Iw42AYsbYLk9E+cxxGMPndMHGOn/iEWDjl4nER7xjj5jlryWePu
 2/s45Wseiiyt2FQKZWsw0NhqP9phRx80CLqcZ0aa35r3OmtdyFsobUtEyLu3Bjwg/d2gWMHZ/
 vq9OVPNsGeGT04qFd62efsGTeU/xZV321p++erxkaRCJZqWiOhTe3DIQvMMBfVw//CHM=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

No code change

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1637893388-10282-2-git-send-email-gaosong@loongson.cn>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
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
index 7580d99403cb..40e399d9908d 100644
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
index 1e7fb0cecbdd..0e6351d9f789 100644
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
index 83a515550745..ab0653fcdc06 100644
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
index 943bc1a1e220..ceaf8a876ca0 100644
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
index 9e0223d32225..193abac340c5 100644
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
index 64d09f2e75bd..9315cba241cf 100644
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
index 94157bf1f48d..6e0f4b74e391 100644
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
index e8b510f6b182..7dc5c45f00ac 100644
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
index fe266c4c51dc..46ca5948cea4 100644
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
index 077ec3d5e8d7..5b9d40974a9e 100644
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
index 82184ab8f2ef..5be24e152b7e 100644
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
index 3e36fddc9dbb..6c0470f0bc82 100644
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
index 64f5f422010f..41e0e34a55d7 100644
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
index 04069cba6641..eee6a1a7cda4 100644
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
index 4673c5a88691..9d9717406f3b 100644
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
index 1c7ee73154ac..e4b1bea5cb5d 100644
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
2.33.1


