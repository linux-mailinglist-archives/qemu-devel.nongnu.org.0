Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CB4B0101
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:13:51 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw9m-0006NJ-AK
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxy-0004UV-Of
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:41 -0500
Received: from [2607:f8b0:4864:20::429] (port=40503
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxv-00037G-Rs
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:37 -0500
Received: by mail-pf1-x429.google.com with SMTP id a39so6144528pfx.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=794y6swXt3Be6ZeeHwqMVlaY+8MqtzyalR1LJBF3V4w=;
 b=M5Fe9yf4/FB6a6L3drLcZjuNvMCCKPneTEvncujVgP8JPg0tjkFUQOSfbIHXfOpIV9
 ZKn9LjoHLYLpSc6xiZNsGCZlXhJeXazZfKnNvIAWEmCzOyFaNP/yLqznSenS7aGfMFIF
 ofi6tbrtn+WHDMp7S1zOIssuW6/wPNTCw6tbRKFLxbsUQRRATiNqt+MHBJZHws27PGJ1
 T4ir8t86h3NaXo9q41+Bfhjm2VAhxrprEkGxW9oPbdkd6+GQcBG1SXj5UFQNvTcny93h
 qxaYPrhAFnBmOkwf2Ef6aXIl2hY6asIYn78PPFX1EXBG1Q013WzN/tGq2HbSlopjOzYe
 H4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=794y6swXt3Be6ZeeHwqMVlaY+8MqtzyalR1LJBF3V4w=;
 b=Xy/sxWLBmcpQHiCWxyL+fxz94tJI+5VsqIlqrVnCzu3NhxBg9aftBuXSR0BM8Zzin8
 tLmDZ3ibet/C9IONuEmyZCWdgK10MJA0ZrFvOoqNKqZ5P+nEuJ+uE6UZOZdyMH0x9L/4
 GECU3HVLGZZer82oqeoT0zSGKebvtzQThPGwFm8by7rBvNE9rdoci/se1usHTS8LU2y0
 b2jDHznhSSvcDVJxNuOmd9ZTNeglcFPNOSFE44YfsLNrExsjKxG49C8V4j3ImeOZBt9E
 QxuZJLtJ2cWywv4Ea1sqhXI/uC9IwyKRBBLjIqpNa4yOKOGBD60e1fIONrHiXR8Pez/y
 5vog==
X-Gm-Message-State: AOAM531VbAVPMkoOqd/0yiYerBQjVoSti3PrkL+z91m5tEQn3EhsF1RM
 CtKcjrDi3RDU5cw7AYnZdlobsXtMwoI=
X-Google-Smtp-Source: ABdhPJwAA+ldiww99dndFX2psHSF4fX7wgFe6pIDcoqTpehKsSM1jSRP3oQ3Nebz0cuoZHySwlxe1g==
X-Received: by 2002:a05:6a00:230e:: with SMTP id
 h14mr4639140pfh.10.1644447693432; 
 Wed, 09 Feb 2022 15:01:33 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q8sm22475709pfl.143.2022.02.09.15.01.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 7/9] user: Declare target-specific prototypes in
 'user/cpu-target.h'
Date: Thu, 10 Feb 2022 00:00:28 +0100
Message-Id: <20220209230030.93987-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Move user-mode specific prototypes from "exec/exec-all.h"
to "user/cpu-target.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/user-exec.c            |  1 +
 bsd-user/elfload.c               |  1 +
 bsd-user/main.c                  |  1 +
 bsd-user/signal.c                |  1 +
 include/exec/exec-all.h          | 41 ------------------------
 include/user/cpu-target.h        | 55 ++++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c    |  1 +
 linux-user/alpha/cpu_loop.c      |  1 +
 linux-user/arm/cpu_loop.c        |  1 +
 linux-user/arm/signal.c          |  1 +
 linux-user/cris/cpu_loop.c       |  1 +
 linux-user/elfload.c             |  1 +
 linux-user/hexagon/cpu_loop.c    |  1 +
 linux-user/hppa/cpu_loop.c       |  1 +
 linux-user/hppa/signal.c         |  1 +
 linux-user/i386/cpu_loop.c       |  1 +
 linux-user/linuxload.c           |  1 +
 linux-user/m68k/cpu_loop.c       |  1 +
 linux-user/main.c                |  1 +
 linux-user/microblaze/cpu_loop.c |  1 +
 linux-user/mips/cpu_loop.c       |  1 +
 linux-user/mmap.c                |  1 +
 linux-user/nios2/cpu_loop.c      |  1 +
 linux-user/openrisc/cpu_loop.c   |  1 +
 linux-user/ppc/cpu_loop.c        |  1 +
 linux-user/ppc/signal.c          |  1 +
 linux-user/riscv/cpu_loop.c      |  1 +
 linux-user/s390x/cpu_loop.c      |  1 +
 linux-user/sh4/cpu_loop.c        |  1 +
 linux-user/signal.c              |  1 +
 linux-user/sparc/cpu_loop.c      |  1 +
 linux-user/syscall.c             |  1 +
 linux-user/uaccess.c             |  1 +
 linux-user/xtensa/cpu_loop.c     |  1 +
 34 files changed, 87 insertions(+), 41 deletions(-)
 create mode 100644 include/user/cpu-target.h

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 6f5d4933f0..c05bd84f1b 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -28,6 +28,7 @@
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
 #include "tcg/tcg-ldst.h"
+#include "user/cpu-target.h"
 #include "internal.h"
 
 __thread uintptr_t helper_retaddr;
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 142a5bfac2..d64b0de0f4 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "disas/disas.h"
 #include "qemu/path.h"
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index f1d58e905e..93f7851fdd 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -47,6 +47,7 @@
 #include "trace/control.h"
 #include "crypto/init.h"
 #include "qemu/guest-random.h"
+#include "user/cpu-target.h"
 
 #include "host-os.h"
 #include "target_arch_cpu.h"
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8a36b696d8..15af69c509 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "signal-common.h"
 #include "trace.h"
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 537f465f54..e8f14b6844 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -649,47 +649,6 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
  */
 MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 
-/**
- * handle_sigsegv_accerr_write:
- * @cpu: the cpu context
- * @old_set: the sigset_t from the signal ucontext_t
- * @host_pc: the host pc, adjusted for the signal
- * @host_addr: the host address of the fault
- *
- * Return true if the write fault has been handled, and should be re-tried.
- */
-bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
-                                 uintptr_t host_pc, abi_ptr guest_addr);
-
-/**
- * cpu_loop_exit_sigsegv:
- * @cpu: the cpu context
- * @addr: the guest address of the fault
- * @access_type: access was read/write/execute
- * @maperr: true for invalid page, false for permission fault
- * @ra: host pc for unwinding
- *
- * Use the TCGCPUOps hook to record cpu state, do guest operating system
- * specific things to raise SIGSEGV, and jump to the main cpu loop.
- */
-void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
-                                         MMUAccessType access_type,
-                                         bool maperr, uintptr_t ra);
-
-/**
- * cpu_loop_exit_sigbus:
- * @cpu: the cpu context
- * @addr: the guest address of the alignment fault
- * @access_type: access was read/write/execute
- * @ra: host pc for unwinding
- *
- * Use the TCGCPUOps hook to record cpu state, do guest operating system
- * specific things to raise SIGBUS, and jump to the main cpu loop.
- */
-void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
-                                        MMUAccessType access_type,
-                                        uintptr_t ra);
-
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/include/user/cpu-target.h b/include/user/cpu-target.h
new file mode 100644
index 0000000000..e621fb9f3d
--- /dev/null
+++ b/include/user/cpu-target.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * cpu-target.h: user-mode target-specific execution prototypes
+ *
+ */
+
+#ifndef USER_CPU_TARGET_H
+#define USER_CPU_TARGET_H
+
+#include "exec/cpu-tlb.h"
+#include "exec/cpu_ldst.h" /* abi_ptr */
+
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @host_addr: the host address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr);
+
+/**
+ * cpu_loop_exit_sigsegv:
+ * @cpu: the cpu context
+ * @addr: the guest address of the fault
+ * @access_type: access was read/write/execute
+ * @maperr: true for invalid page, false for permission fault
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGSEGV, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                                         MMUAccessType access_type,
+                                         bool maperr, uintptr_t ra);
+
+/**
+ * cpu_loop_exit_sigbus:
+ * @cpu: the cpu context
+ * @addr: the guest address of the alignment fault
+ * @access_type: access was read/write/execute
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGBUS, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                                        MMUAccessType access_type,
+                                        uintptr_t ra);
+
+
+#endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 1737e2ea65..ce19e2cf7a 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index de6e0c901c..735603f6f1 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 032e1ffddf..268e19cbca 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index cf99fd7b8a..0cec11ebe4 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0f46b3c1a8..a70b93203c 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 99829faf89..0f5df23aee 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 0d73934d31..c167da2474 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a576d1a249..ebec350047 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 962f551c04..17dbb96f07 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 90bffc1956..425b898590 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "qemu/timer.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 2ed5fc45ed..e7312be184 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "loader.h"
 
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 928a18e3cf..2aec60da0d 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..e318dcfcf8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -30,6 +30,7 @@
 
 #include "qapi/error.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 1a2556be2c..3023e5691b 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9bb12a07ba..10292a9c40 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c125031b90..1849bac128 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/log.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "user-mmap.h"
 
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 1e93ef34e6..f10c28f965 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 7683bea064..137889d7e0 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index ffe39851ed..252ee8efbf 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "qemu/timer.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 176c9d8503..541d70b410 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 26d446f323..2712f2c675 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 7901dfe6f5..37d05f127e 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 1bd313cb19..bd52b3be93 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 32854bb375..c36f7669ad 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -25,6 +25,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "strace.h"
 #include "loader.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index baf3d9ae01..506d4b49f0 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..2cc17c8617 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "strace.h"
 #include "signal-common.h"
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 425cbf677f..99234c52a0 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -1,6 +1,7 @@
 /* User memory access */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "user/cpu-target.h"
 
 #include "qemu.h"
 #include "user-internals.h"
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index d51ce05392..829659297b 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user/cpu-target.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
-- 
2.34.1


