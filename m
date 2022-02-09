Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D104B0110
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:17:35 +0100 (CET)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwDP-0003GW-0j
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvy6-0004ba-L8
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:47 -0500
Received: from [2607:f8b0:4864:20::631] (port=38640
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvy3-00039B-5h
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id c3so252528pls.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoZtfPkMyT0ZEPfoTcE8wTfI0Jmyll7QV/yvybhBFT0=;
 b=p8NcTPyKK2ug2tPawOp3yY11LuWetq/YwNU5y9ZZMXN4slmubqRICcWKCwtt2lpbZ6
 hjiY2dQapRpxcpl4KyLy1oCSBOzZ7AbZ/iFBkcrGHtItBiz8Vve5K16LVbh0jvk1TWMz
 Gakwy7cTbeLllQTEsWAIHtzVGdzKqiv7ZL3B8mQCMHrz8t/LxzCaURPcukO2LsuvOgpG
 +QxfyYKLuAL4uuwG3NgpmGEXopkERiQSTCjRRxOvszeDx6/3V6YkcFIzJLWx/nxu29Rn
 QX/6vIVKPy2BXLDIcW5OpDznZH6hhshkBieVSllfMXpf5gRok0tCe6+cIgBrgkxll3Tz
 UYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DoZtfPkMyT0ZEPfoTcE8wTfI0Jmyll7QV/yvybhBFT0=;
 b=M5j569wjiCssvIPb9VR19J2W3vYHYoK0nZxxsrDMUea9Rp/lsNeqUfzCgVpGv7DznV
 JulM9YhHNymnNd9WR5skgPONd2umRhIF0J1P5HenCJQyfnvNW/pDiPgjwVYPN2VJbCF1
 zYbBNW2RhYXlzaoteTiZuFK6jAnAWb2YIRgxR+EuQH8LNR0cu/WNa6+V0/yWmgtC8fyX
 Nw84lD/HlCdraACKCNRpEoKp/1C9OrJaIVVMxwCmFa+DAVxPXCEM5iher+GjnPWzzzdj
 +54RyoZhDmN5Bg/QTwZQ4uhAziYvpMQYiXyJTBAotdcIHfEGcP39gPKP/BeJag+YjdDw
 EDSg==
X-Gm-Message-State: AOAM531kx1VkaUAA8HD6w2TcaD1qw65ie1JOjtMNENusDixQVPBi0MW4
 8KxythcIrXaEI+UlOeXCy2Gay2ScWBE=
X-Google-Smtp-Source: ABdhPJwxdeI/DJVXaLkoMJR2pFKCcIScnbMj+UaWbOo3XTYZRc8GdcjaFMmB72+GLotYGzOfTMevvw==
X-Received: by 2002:a17:90a:1984:: with SMTP id
 4mr4299239pji.197.1644447701546; 
 Wed, 09 Feb 2022 15:01:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oj5sm2728731pjb.29.2022.02.09.15.01.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 8/9] user: Declare target-agnostic prototypes in
 'user/cpu-common.h'
Date: Thu, 10 Feb 2022 00:00:29 +0100
Message-Id: <20220209230030.93987-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
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

Move user-mode common prototypes from "exec/exec-all.h"
to "user/cpu-common.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h             |  2 --
 include/exec/cpu-all.h      |  3 +--
 include/exec/exec-all.h     | 10 ----------
 include/user/cpu-common.h   | 36 ++++++++++++++++++++++++++++++++++++
 include/user/cpu-target.h   |  1 +
 linux-user/exit.c           |  3 +--
 linux-user/user-internals.h | 10 ----------
 7 files changed, 39 insertions(+), 26 deletions(-)
 create mode 100644 include/user/cpu-common.h

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 2f67776b0b..afaf94412e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -182,8 +182,6 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6);
 void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
 int get_osversion(void);
 void fork_start(void);
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 08b2894274..e9cf20560f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -296,9 +296,8 @@ void *page_alloc_target_data(target_ulong address, size_t size);
  * at @address, as per page_alloc_target_data.
  */
 void *page_get_target_data(target_ulong address);
-#endif
 
-CPUArchState *cpu_copy(CPUArchState *env);
+#endif /* CONFIG_USER_ONLY */
 
 /* Flags for use in ENV->INTERRUPT_PENDING.
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e8f14b6844..545cc16a67 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -639,16 +639,6 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
     return addr;
 }
 
-/**
- * adjust_signal_pc:
- * @pc: raw pc from the host signal ucontext_t.
- * @is_write: host memory operation was write, or read-modify-write.
- *
- * Alter @pc as required for unwinding.  Return the type of the
- * guest memory access -- host reads may be for guest execution.
- */
-MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
-
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/include/user/cpu-common.h b/include/user/cpu-common.h
new file mode 100644
index 0000000000..267acb143a
--- /dev/null
+++ b/include/user/cpu-common.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * cpu-target.h: user-mode target-agnostic execution prototypes
+ *
+ */
+
+#ifndef USER_CPU_COMMON_H
+#define USER_CPU_COMMON_H
+
+#include "exec/cpu-tlb.h"
+
+extern __thread CPUState *thread_cpu;
+
+/**
+ * adjust_signal_pc:
+ * @pc: raw pc from the host signal ucontext_t.
+ * @is_write: host memory operation was write, or read-modify-write.
+ *
+ * Alter @pc as required for unwinding.  Return the type of the
+ * guest memory access -- host reads may be for guest execution.
+ */
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
+
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
+
+CPUArchState *cpu_copy(CPUArchState *env);
+
+/**
+ * preexit_cleanup: housekeeping before the guest exits
+ *
+ * env: the CPU state
+ * code: the exit code
+ */
+void preexit_cleanup(CPUArchState *env, int code);
+
+#endif
diff --git a/include/user/cpu-target.h b/include/user/cpu-target.h
index e621fb9f3d..4fbdb35fa4 100644
--- a/include/user/cpu-target.h
+++ b/include/user/cpu-target.h
@@ -9,6 +9,7 @@
 
 #include "exec/cpu-tlb.h"
 #include "exec/cpu_ldst.h" /* abi_ptr */
+#include "user/cpu-common.h"
 
 /**
  * handle_sigsegv_accerr_write:
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 10989f17f8..2c8a8dd75d 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -19,8 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/plugin.h"
 #include "exec/gdbstub.h"
-#include "qemu.h"
-#include "user-internals.h"
+#include "user/cpu-common.h"
 #ifdef CONFIG_GPROF
 #include <sys/gmon.h>
 #endif
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 4d0f682aea..d17f3c9300 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -63,8 +63,6 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg2, abi_long arg3, abi_long arg4,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
-extern __thread CPUState *thread_cpu;
-void QEMU_NORETURN cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
@@ -166,14 +164,6 @@ static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
 static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
 #endif
 
-/**
- * preexit_cleanup: housekeeping before the guest exits
- *
- * env: the CPU state
- * code: the exit code
- */
-void preexit_cleanup(CPUArchState *env, int code);
-
 /*
  * Include target-specific struct and function definitions;
  * they may need access to the target-independent structures
-- 
2.34.1


