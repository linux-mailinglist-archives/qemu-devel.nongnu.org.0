Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6E135B5E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 15:29:43 +0100 (CET)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipYof-0007Ye-Jz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 09:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ipYef-0001JN-Tb
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ipYea-0006Vo-6T
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:47069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ipYeZ-0006Qc-TQ
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:16 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so7496174wrl.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrqfu3/47lmcz6wMTTbEUHpwKSel/XeOgEsTRy16lE4=;
 b=a+CxGQqTvRNbrhOFaDCRcyy79bXxCVaGHrnL/VM2diJGoeLSNNRKs1GhlUyLg2mh5O
 LjHS5L0Iga7H2DLbkIkQ2B8Drz5JWHvzUmDrMYDL09jcmtMLiOI15JawvKSRwRkm4kL5
 yhR5cSrNfAGO2SkDuLg5Di0m0lP5zUOF2Vd0hxNWFOxpbf4FNtD/BmkfD831Td+01zKF
 qVzCz7+UIaqCEsuul69hqk2be8VVTyuOwrvF1IGhSwgkrX/d3OHQXih5N29o1oL3QfIL
 0UzMjcsFFWV2QkeFroRPAc9oy3KiWDB3uQ6dccgrfntgnxaEvHzM2YwG4CnL8Y853Qc5
 AyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrqfu3/47lmcz6wMTTbEUHpwKSel/XeOgEsTRy16lE4=;
 b=Y6lZJBlqGTDVea3lA2jiWdYXAJnrWYzYkNhJJrozyoEcEKkoOtS6GDb9ugXrutln4+
 dp26ygC8FNxs014Ccgcd+hqB+2dB3g3/u2awY3VQRa3kBI1bJIm4Hl3MWd+ADrVQ9l5P
 V3xfVhTUcJQtMEYeGJ1UQBDJi+mAN75jn0888QcagSszcad4RwrhFApLzxpq28iag1Bn
 ITfdG7DCwC9C8ccxgFlCuTDRnoB0d4wE0wor3oweyqiTM1CsKPZtagft1gM/cr6osdgK
 Rz+167ENotboFAyw7wPUgLNz8vadtgv+DGjt2j0YyziVdFt9nNwFWLR+09zzRgquOyI2
 4WIw==
X-Gm-Message-State: APjAAAWKEKMIYp6OwC0uSh2bJMG8Efp2lFlxOrAm8kZF4j1MLJlk68t4
 qpVT9yZ21cpNEg5JJS77WlKBqQ==
X-Google-Smtp-Source: APXvYqyREf4ecmpmSf0ojUpxb67GVufHywtwojKBy8QWL/pMK+Zdp/E9wXzLunCn7rOBJOSXXhs3cg==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr11091411wrn.280.1578579554631; 
 Thu, 09 Jan 2020 06:19:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t131sm3080518wmb.13.2020.01.09.06.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 06:19:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2D8A1FF9B;
 Thu,  9 Jan 2020 14:18:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 11/14] semihosting: add qemu_semihosting_console_inc for
 SYS_READC
Date: Thu,  9 Jan 2020 14:18:55 +0000
Message-Id: <20200109141858.14376-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109141858.14376-1-alex.bennee@linaro.org>
References: <20200109141858.14376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Keith Packard <keithp@keithp.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Provides a blocking call to read a character from the console using
semihosting.chardev, if specified. This takes some careful command
line options to use stdio successfully as the serial ports, monitor
and semihost all want to use stdio. Here's a sample set of command
line options which share stdio between semihost, monitor and serial
ports:

	qemu \
	-chardev stdio,mux=on,id=stdio0 \
	-serial chardev:stdio0 \
	-semihosting-config enable=on,chardev=stdio0 \
	-mon chardev=stdio0,mode=readline

This creates a chardev hooked to stdio and then connects all of the
subsystems to it. A shorter mechanism would be good to hear about.

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20191104204230.12249-1-keithp@keithp.com>
[AJB: fixed up deadlock, minor commit title reword]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
index 9be9754bcdf..0238f540f4b 100644
--- a/include/hw/semihosting/console.h
+++ b/include/hw/semihosting/console.h
@@ -37,6 +37,22 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
  */
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
+/**
+ * qemu_semihosting_console_inc:
+ * @env: CPUArchState
+ *
+ * Receive single character from debug console. This may be the remote
+ * gdb session if a softmmu guest is currently being debugged. As this
+ * call may block if no data is available we suspend the CPU and will
+ * re-execute the instruction when data is there. Therefore two
+ * conditions must be met:
+ *   - CPUState is synchronized before calling this function
+ *   - pc is only updated once the character is successfully returned
+ *
+ * Returns: character read OR cpu_loop_exit!
+ */
+target_ulong qemu_semihosting_console_inc(CPUArchState *env);
+
 /**
  * qemu_semihosting_log_out:
  * @s: pointer to string
diff --git a/include/hw/semihosting/semihost.h b/include/hw/semihosting/semihost.h
index 60fc42d851e..b8ce5117ae0 100644
--- a/include/hw/semihosting/semihost.h
+++ b/include/hw/semihosting/semihost.h
@@ -56,6 +56,9 @@ static inline Chardev *semihosting_get_chardev(void)
 {
     return NULL;
 }
+static inline void qemu_semihosting_console_init(void)
+{
+}
 #else /* !CONFIG_USER_ONLY */
 bool semihosting_enabled(void);
 SemihostingTarget semihosting_get_target(void);
@@ -68,6 +71,7 @@ Chardev *semihosting_get_chardev(void);
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
 void qemu_semihosting_connect_chardevs(void);
+void qemu_semihosting_console_init(void);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* SEMIHOST_H */
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index b4b17c8afbc..6346bd7f506 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -20,8 +20,15 @@
 #include "hw/semihosting/semihost.h"
 #include "hw/semihosting/console.h"
 #include "exec/gdbstub.h"
+#include "exec/exec-all.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
+#include <pthread.h>
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qemu/fifo8.h"
 
 int qemu_semihosting_log_out(const char *s, int len)
 {
@@ -98,3 +105,75 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
                       __func__, addr);
     }
 }
+
+#define FIFO_SIZE   1024
+
+/* Access to this structure is protected by the BQL */
+typedef struct SemihostingConsole {
+    CharBackend         backend;
+    GSList              *sleeping_cpus;
+    bool                got;
+    Fifo8               fifo;
+} SemihostingConsole;
+
+static SemihostingConsole console;
+
+static int console_can_read(void *opaque)
+{
+    SemihostingConsole *c = opaque;
+    int ret;
+    g_assert(qemu_mutex_iothread_locked());
+    ret = (int) fifo8_num_free(&c->fifo);
+    return ret;
+}
+
+static void console_wake_up(gpointer data, gpointer user_data)
+{
+    CPUState *cs = (CPUState *) data;
+    /* cpu_handle_halt won't know we have work so just unbung here */
+    cs->halted = 0;
+    qemu_cpu_kick(cs);
+}
+
+static void console_read(void *opaque, const uint8_t *buf, int size)
+{
+    SemihostingConsole *c = opaque;
+    g_assert(qemu_mutex_iothread_locked());
+    while (size-- && !fifo8_is_full(&c->fifo)) {
+        fifo8_push(&c->fifo, *buf++);
+    }
+    g_slist_foreach(c->sleeping_cpus, console_wake_up, NULL);
+    c->sleeping_cpus = NULL;
+}
+
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    uint8_t ch;
+    SemihostingConsole *c = &console;
+    g_assert(qemu_mutex_iothread_locked());
+    g_assert(current_cpu);
+    if (fifo8_is_empty(&c->fifo)) {
+        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, current_cpu);
+        current_cpu->halted = 1;
+        current_cpu->exception_index = EXCP_HALTED;
+        cpu_loop_exit(current_cpu);
+        /* never returns */
+    }
+    ch = fifo8_pop(&c->fifo);
+    return (target_ulong) ch;
+}
+
+void qemu_semihosting_console_init(void)
+{
+    Chardev *chr = semihosting_get_chardev();
+
+    if  (chr) {
+        fifo8_create(&console.fifo, FIFO_SIZE);
+        qemu_chr_fe_init(&console.backend, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&console.backend,
+                                 console_can_read,
+                                 console_read,
+                                 NULL, NULL, &console,
+                                 NULL, true);
+    }
+}
diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
index a16b525eec0..a1f0f6050ea 100644
--- a/linux-user/arm/semihost.c
+++ b/linux-user/arm/semihost.c
@@ -14,6 +14,7 @@
 #include "cpu.h"
 #include "hw/semihosting/console.h"
 #include "qemu.h"
+#include <termios.h>
 
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
 {
@@ -47,3 +48,29 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
         }
     }
 }
+
+/*
+ * For linux-user we can safely block. However as we want to return as
+ * soon as a character is read we need to tweak the termio to disable
+ * line buffering. We restore the old mode afterwards in case the
+ * program is expecting more normal behaviour. This is slow but
+ * nothing using semihosting console reading is expecting to be fast.
+ */
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    uint8_t c;
+    struct termios old_tio, new_tio;
+
+    /* Disable line-buffering and echo */
+    tcgetattr(STDIN_FILENO, &old_tio);
+    new_tio = old_tio;
+    new_tio.c_lflag &= (~ICANON & ~ECHO);
+    tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
+
+    c = getchar();
+
+    /* restore config */
+    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
+
+    return (target_ulong) c;
+}
diff --git a/stubs/semihost.c b/stubs/semihost.c
index f90589259c0..1d8b37f7b2f 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -69,3 +69,7 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
 void qemu_semihosting_connect_chardevs(void)
 {
 }
+
+void qemu_semihosting_console_init(void)
+{
+}
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 6f7b6d801bf..47d61f6fe1f 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -802,8 +802,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
         return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
     case TARGET_SYS_READC:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func__);
-        return 0;
+        return qemu_semihosting_console_inc(env);
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
diff --git a/vl.c b/vl.c
index 86474a55c9e..b2119212587 100644
--- a/vl.c
+++ b/vl.c
@@ -4238,6 +4238,9 @@ int main(int argc, char **argv, char **envp)
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
 
+    /* connect semihosting console input if requested */
+    qemu_semihosting_console_init();
+
     if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
         exit(1);
     if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
-- 
2.20.1


