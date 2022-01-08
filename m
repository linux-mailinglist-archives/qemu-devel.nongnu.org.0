Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0058D4882C8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:25:39 +0100 (CET)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67yl-0001ik-3V
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n67tb-0005b6-2q
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40630 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n67tN-0001Vk-Tt
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:10 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMrrVdlhvLMAAA--.1341S32; 
 Sat, 08 Jan 2022 17:14:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 30/30] tests/tcg/loongarch64: Add hello/memory test in
 loongarch64 system
Date: Sat,  8 Jan 2022 04:14:19 -0500
Message-Id: <20220108091419.2027710-31-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMrrVdlhvLMAAA--.1341S32
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw43Kw4fAF48KrWxJr43KFg_yoW7tw4Upw
 4akFy5Krs7JFZrGw1xKF1rGF13Jry8CF1UWFy3Xr40vFs7Ww1vqw1FgrW5JFy2qrZ5GrWS
 v3Z5tw1YgF97Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- We write a very minimal softmmu harness.
- This is a very simple smoke test with no need to run a full Linux/kernel.
- The Makefile.softmmu-target record the rule to run.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/tcg/loongarch64/Makefile.softmmu-target | 33 +++++++
 tests/tcg/loongarch64/system/boot.S           | 58 +++++++++++++
 tests/tcg/loongarch64/system/kernel.ld        | 30 +++++++
 tests/tcg/loongarch64/system/regdef.h         | 86 +++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/loongarch64/system/boot.S
 create mode 100644 tests/tcg/loongarch64/system/kernel.ld
 create mode 100644 tests/tcg/loongarch64/system/regdef.h

diff --git a/tests/tcg/loongarch64/Makefile.softmmu-target b/tests/tcg/loongarch64/Makefile.softmmu-target
new file mode 100644
index 0000000000..908f3a8c0f
--- /dev/null
+++ b/tests/tcg/loongarch64/Makefile.softmmu-target
@@ -0,0 +1,33 @@
+#
+# Loongarch64 system tests
+#
+
+LOONGARCH64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/loongarch64/system
+VPATH+=$(LOONGARCH64_SYSTEM_SRC)
+
+# These objects provide the basic boot code and helper functions for all tests
+CRT_OBJS=boot.o
+
+LOONGARCH64_TEST_SRCS=$(wildcard $(LOONGARCH64_SYSTEM_SRC)/*.c)
+LOONGARCH64_TESTS = $(patsubst $(LOONGARCH64_SYSTEM_SRC)/%.c, %, $(LOONGARCH64_TEST_SRCS))
+
+CRT_PATH=$(LOONGARCH64_SYSTEM_SRC)
+LINK_SCRIPT=$(LOONGARCH64_SYSTEM_SRC)/kernel.ld
+LDFLAGS=-Wl,-T$(LINK_SCRIPT)
+TESTS+=$(LOONGARCH64_TESTS) $(MULTIARCH_TESTS)
+CFLAGS+=-nostdlib -g -O1 -march=loongarch64 -mabi=lp64d $(MINILIB_INC)
+LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+
+# building head blobs
+.PRECIOUS: $(CRT_OBJS)
+
+%.o: $(CRT_PATH)/%.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
+# Build and link the tests
+%: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory: CFLAGS+=-DCHECK_UNALIGNED=0
+# Running
+QEMU_OPTS+=-serial chardev:output -kernel
diff --git a/tests/tcg/loongarch64/system/boot.S b/tests/tcg/loongarch64/system/boot.S
new file mode 100644
index 0000000000..6a0671a5bf
--- /dev/null
+++ b/tests/tcg/loongarch64/system/boot.S
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Minimal LoongArch system boot code.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "regdef.h"
+
+	.global _start
+	.align 16
+_start:
+	bl main
+
+	.type _start 2
+	.size _start, .-_start
+
+	.global _exit
+	.align 16
+_exit:
+2:      /* QEMU ACPI poweroff */
+	li.w  t0, 0x3c00
+	li.w  t1, 0x100d0014
+	st.w  t0, t1, 0
+	idle  0
+	bl    2b
+
+	.type _exit 2
+	.size _exit, .-_exit
+
+	.global __sys_outc
+__sys_outc:
+	li.d t1, 1000000
+loop:
+	lu12i.w	t2, 0x1fe00
+	ori	t0, t2, 0x1e5
+	lu52i.d	t0, t0, -2048
+	ld.bu	t0, t0, 0
+	andi	t0, t0, 0x20
+	ext.w.b	t0, t0
+	bnez	t0, in
+	addi.w	t1, t1, -1
+	bnez	t1, loop
+in:
+	ext.w.b	a0, a0
+	lu12i.w	t0, 0x1fe00
+	ori	t0, t0, 0x1e0
+	lu52i.d	t0, t0, -2048
+	st.b	a0, t0, 0
+	jirl	$r0, ra, 0
+
+	.data
+	.align 4
+stack:
+	.skip	65536
+$stack_end:
+	.type	stack,@object
+	.size	stack, . - stack
diff --git a/tests/tcg/loongarch64/system/kernel.ld b/tests/tcg/loongarch64/system/kernel.ld
new file mode 100644
index 0000000000..f1a7c0168c
--- /dev/null
+++ b/tests/tcg/loongarch64/system/kernel.ld
@@ -0,0 +1,30 @@
+ENTRY(_start)
+
+SECTIONS
+{
+    /* Linux kernel legacy start address.  */
+    . = 0x9000000000200000;
+    _text = .;
+    .text : {
+        *(.text)
+    }
+    .rodata : {
+        *(.rodata)
+    }
+    _etext = .;
+
+    . = ALIGN(8192);
+    _data = .;
+    .got : {
+        *(.got)
+    }
+    .data : {
+	*(.sdata)
+        *(.data)
+    }
+    _edata = .;
+    .bss : {
+        *(.bss)
+    }
+    _end = .;
+}
diff --git a/tests/tcg/loongarch64/system/regdef.h b/tests/tcg/loongarch64/system/regdef.h
new file mode 100644
index 0000000000..faa09b2377
--- /dev/null
+++ b/tests/tcg/loongarch64/system/regdef.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+#ifndef _ASM_REGDEF_H
+#define _ASM_REGDEF_H
+
+#define zero    $r0     /* wired zero */
+#define ra      $r1     /* return address */
+#define tp      $r2
+#define sp      $r3     /* stack pointer */
+#define v0      $r4     /* return value - caller saved */
+#define v1      $r5
+#define a0      $r4     /* argument registers */
+#define a1      $r5
+#define a2      $r6
+#define a3      $r7
+#define a4      $r8
+#define a5      $r9
+#define a6      $r10
+#define a7      $r11
+#define t0      $r12    /* caller saved */
+#define t1      $r13
+#define t2      $r14
+#define t3      $r15
+#define t4      $r16
+#define t5      $r17
+#define t6      $r18
+#define t7      $r19
+#define t8      $r20
+                        /* $r21: Temporarily reserved */
+#define fp      $r22    /* frame pointer */
+#define s0      $r23    /* callee saved */
+#define s1      $r24
+#define s2      $r25
+#define s3      $r26
+#define s4      $r27
+#define s5      $r28
+#define s6      $r29
+#define s7      $r30
+#define s8      $r31
+
+#define gr0     $r0
+#define gr1     $r1
+#define gr2     $r2
+#define gr3     $r3
+#define gr4     $r4
+#define gr5     $r5
+#define gr6     $r6
+#define gr7     $r7
+#define gr8     $r8
+#define gr9     $r9
+#define gr10    $r10
+#define gr11    $r11
+#define gr12    $r12
+#define gr13    $r13
+#define gr14    $r14
+#define gr15    $r15
+#define gr16    $r16
+#define gr17    $r17
+#define gr18    $r18
+#define gr19    $r19
+#define gr20    $r20
+#define gr21    $r21
+#define gr22    $r22
+#define gr23    $r23
+#define gr24    $r24
+#define gr25    $r25
+#define gr26    $r26
+#define gr27    $r27
+#define gr28    $r28
+#define gr29    $r29
+#define gr30    $r30
+#define gr31    $r31
+
+#define STT_NOTYPE  0
+#define STT_OBJECT  1
+#define STT_FUNC    2
+#define STT_SECTION 3
+#define STT_FILE    4
+#define STT_COMMON  5
+#define STT_TLS     6
+
+#define ASM_NL           ;
+
+#endif /* _ASM_REGDEF_H */
-- 
2.27.0


