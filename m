Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FA27AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:40:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTl9F-0000VV-EA
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:40:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTkvA-0005gP-Lq
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTkv4-0001CR-CS
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:25:58 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54678)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hTkv2-0000ta-8Y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:25:54 -0400
Received: by mail-wm1-x344.google.com with SMTP id i3so5211842wml.4
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hbC6Uuy+rCphFJXRN5GPHrqZRqXnqfdaGhA8RUCMKxg=;
	b=hEJh9QgOdMqmyLe0c0khC2QOt9zDuLNDpB6Gh9jOzlcCy2PZFa9iNLia9iFXwYxzlH
	BlS4456PzJwanNJmq07CK6WOM/uGZRjM20RfAjTbGYtoYcpfsvw5pA0hl8ms9ypguAHd
	DPopycyQjW7E142KDeXCoz4XGCJD2W9gBT4jujJb1/a7mQ7rVMHnZNm2vcd9BC53tutK
	JQM9IiKxnZmJqSkt5mFP1S59i72fQPAWC8XfztryW3uaUcwDtSEAwWtJxhw6xyQIcFWI
	Qdn5jxM+ZKcAM2q5UYXMhHsTloFsTmekHd9Pmhy3z5Fivm2rCB7GG8imVcP1E9863zuQ
	v6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hbC6Uuy+rCphFJXRN5GPHrqZRqXnqfdaGhA8RUCMKxg=;
	b=c7UwldhGfEM/C4qjBN08YiKLRDC1/g0laiqhExi3W2TZ6/PmTdYIXmUO91Fp81+6EU
	ZcvVmYwlm1XQlZ/PwEOxN+zd6IswBfedhH7vYi2vMCgA3iqmdREYK501ojj0WLAZEiEr
	f4ICoPJrbSg4exMvdsQqjtF3I9tMTj9Kt7z+rNCZ7jIIWvw08WM4BoIIK7S1lGJ5Sgff
	h3wnyIS72ZTPAP268wxMUHOy64wRkKD1+jXQw8d9ReDd6TVPqMTeLQ8lIJr93SWlIx6y
	lGjKksY3ILD9JEbhcb07Zm4xRFPUwKh3d3PTla59GSDAF7xzUoryGIDQZeAwgGIU6bDu
	hE3g==
X-Gm-Message-State: APjAAAVsGMSWEhECQ2yL3pUks1eZScCSMYyttlukxpcRcBHBOck+S+XN
	M2iLYzwnNnDjpl5SrfhR3TmQZ7aG1nQ=
X-Google-Smtp-Source: APXvYqxitkzQC8NAz8+6BgaPWjudhYgHG9hHdmdVOz3KuxAqbQ2/anLlmr0ltpF5SbI4TKJrJWzMqw==
X-Received: by 2002:a1c:3cc2:: with SMTP id j185mr10788632wma.26.1558607135796;
	Thu, 23 May 2019 03:25:35 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	q68sm7037319wme.11.2019.05.23.03.25.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 03:25:33 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B25F01FF90;
	Thu, 23 May 2019 11:25:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 11:25:07 +0100
Message-Id: <20190523102532.10486-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a semihosting
 console
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides two functions for handling console output that handle
the common backend behaviour for semihosting.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c                        |  5 +++
 hw/semihosting/Makefile.objs     |  1 +
 hw/semihosting/console.c         | 70 ++++++++++++++++++++++++++++++++
 include/exec/gdbstub.h           | 11 +++++
 include/hw/semihosting/console.h | 38 +++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 hw/semihosting/console.c
 create mode 100644 include/hw/semihosting/console.h

diff --git a/gdbstub.c b/gdbstub.c
index 793218bb43a..b4334014373 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1987,6 +1987,11 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     va_end(va);
 }
 
+void gdb_do_console_out(target_ulong s, int len)
+{
+    gdb_do_syscall(NULL, "write,2,%x,1", s, len);
+}
+
 static void gdb_read_byte(GDBState *s, int ch)
 {
     uint8_t reply;
diff --git a/hw/semihosting/Makefile.objs b/hw/semihosting/Makefile.objs
index 09c19bf19ed..4ad47c05c06 100644
--- a/hw/semihosting/Makefile.objs
+++ b/hw/semihosting/Makefile.objs
@@ -1 +1,2 @@
 obj-$(CONFIG_SEMIHOSTING) += config.o
+obj-$(CONFIG_SEMIHOSTING) += console.o
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
new file mode 100644
index 00000000000..ad6f67ecc71
--- /dev/null
+++ b/hw/semihosting/console.c
@@ -0,0 +1,70 @@
+/*
+ * Semihosting Console Support
+ *
+ * Copyright (c) 2015 Imagination Technologies
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * This provides support for outputting to a semihosting console.
+ *
+ * While most semihosting implementations support reading and writing
+ * to arbitrary file descriptors we treat the console as something
+ * specifically for debugging interaction. This means messages can be
+ * re-directed to gdb (if currently being used to debug) or even
+ * re-directed elsewhere.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/semihosting/console.h"
+#include "exec/gdbstub.h"
+#include "qemu/log.h"
+
+int qemu_semihosting_log_out(const char *s, int len)
+{
+    return write(STDERR_FILENO, s, len);
+}
+
+/*
+ * A re-implementation of lock_user_string that we can use locally
+ * instead of relying on softmmu-semi. Hopefully we can deprecate that
+ * in time. We either copy len bytes if specified or until we find a NULL.
+ */
+static GString *copy_user_string(CPUArchState *env, target_ulong addr, int len)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    GString *s = g_string_sized_new(len ? len : 128);
+    uint8_t c;
+    bool done;
+
+    do {
+        if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
+            s = g_string_append_c(s, c);
+            done = len ? s->len == len : c == 0;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: passed inaccessible address " TARGET_FMT_lx,
+                          __func__, addr);
+            done = true;
+        }
+    } while (!done);
+
+    return s;
+}
+
+
+int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
+{
+    GString *s = copy_user_string(env, addr, len);
+    int out = s->len;
+
+    if (use_gdb_syscalls()) {
+        gdb_do_console_out(addr, s->len);
+    } else {
+        out = qemu_semihosting_log_out(s->str, s->len);
+    }
+
+    g_string_free(s, true);
+    return out;
+}
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c14..b2963547c48 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -44,6 +44,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  * argument list.
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
+/**
+ * gdb_do_console_out:
+ * @gs: guest address of string to send
+ * @len: length of string
+ *
+ * Sends a string to gdb console. Unlike the system call interface
+ * there is no callback and we assume the system call always
+ * succeeds.
+ */
+void gdb_do_console_out(target_ulong s, int len);
+
 int use_gdb_syscalls(void);
 void gdb_set_stop_cpu(CPUState *cpu);
 void gdb_exit(CPUArchState *, int);
diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
new file mode 100644
index 00000000000..30e66ae20aa
--- /dev/null
+++ b/include/hw/semihosting/console.h
@@ -0,0 +1,38 @@
+/*
+ * Semihosting Console
+ *
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _SEMIHOST_CONSOLE_H_
+#define _SEMIHOST_CONSOLE_H_
+
+/**
+ * qemu_semihosting_console_out:
+ * @env: CPUArchState
+ * @s: host address of guest string
+ * @len: length of string or 0 (string is null terminated)
+ *
+ * Send a guest string to the debug console. This may be the remote
+ * gdb session if a softmmu guest is currently being debugged.
+ *
+ * Returns: number of bytes written.
+ */
+int qemu_semihosting_console_out(CPUArchState *env, target_ulong s, int len);
+
+/**
+ * qemu_semihosting_log_out:
+ * @s: pointer to string
+ * @len: length of string
+ *
+ * Send a string to the debug output. Unlike console_out these strings
+ * can't be sent to a remote gdb instance as they don't exist in guest
+ * memory.
+ *
+ * Returns: number of bytes written
+ */
+int qemu_semihosting_log_out(const char *s, int len);
+
+#endif /* _SEMIHOST_CONSOLE_H_ */
-- 
2.20.1


