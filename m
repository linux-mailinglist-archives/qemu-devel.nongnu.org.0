Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C067456
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 19:35:00 +0200 (CEST)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlzRj-0005He-CD
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 13:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39191)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlzRT-0004t7-Tx
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:34:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlzRR-0002Cm-As
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:34:43 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hlzRP-000287-QO
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:34:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id a15so9631595wmj.5
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Svo3or4hCwl38TOd0ugjNwln01VejHJw1BSvbQQsvcc=;
 b=HY14Ck31UvydvGmZ9SHYrAbRJJxGtdzdpWmXwAjGBtOFboM3dwEypdEeskHQO+7sc7
 PKYgPobDGwkrGylJkE24ByLpFH+XK9ygGWtmxC1x1qioc/MnWrLH3SEUgrKD5NMlWk6J
 g7DJ8fpAYWqhQ6JUqbpzzZveKxAw97AgNJBqHQbbP2yDp8t7EWZxwbFYZxzlPRxHpM9X
 PqkUunQG5ALmWiRFOn0/KmzLhapqbhY1SRGVfIG+PMide2mAB4uKeUVdo+mUOFRt7dwg
 FuUgq9mtgt3kTw09mBrbuK96F7IzVH7iazaUczHS7yO5sFRlLWK69xu+o65Gg5FXc5oE
 t2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Svo3or4hCwl38TOd0ugjNwln01VejHJw1BSvbQQsvcc=;
 b=lFiCpsDR+QyS06Y60tejws82riB19QE8rZpxg7/IrIGIde0vvi8vLZop2tLH08uvkn
 i096byBEulfSZynMYSDoRAzhMODl3BuxQCKBpN0TwEzYwfUu+URU6h1TFcGOGHMB8dG5
 PHYDxKjefAboSX67ux109GiL9QeHSjAB+LC9I7m+/e8aJpCZUFrTZ4gE5VxkLNesZIN9
 b4Im2tHgoT/1BA+TXmKADUbsLE8zSbyI9elOG8eiknW0ZwiRo2YVPedhVoKRuNsByG0w
 hEAhrz+h5R0yAs7or1zPfsnkTnfguE4HtFkcJ8a/oEdEUT/Mt/ns3SglboxzVvJSVpP1
 LQag==
X-Gm-Message-State: APjAAAXXOBxE0ei9IkRuazvra2Z/ooTCoS4aOqanFYWE6zzwAZb1WWPO
 K245JS0A8DE6Llgou9LUQWDAYZPfsUo=
X-Google-Smtp-Source: APXvYqxn/UHjYEakynnmk6GT+SqEscwAtJdg2yMYnC5Zp+5U9opg6ANLJfmwPxFk5JgW444m7mbkCw==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr10443585wmg.155.1562952877334; 
 Fri, 12 Jul 2019 10:34:37 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g19sm17265148wrb.52.2019.07.12.10.34.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 10:34:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 19:34:35 +0200
Message-Id: <1562952875-53702-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] util: merge main-loop.c and iohandler.c
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
Cc: marcandre.lureau@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

main-loop.c has a dependency on iohandler.c, and everything breaks
if that dependency is instead satisfied by stubs/iohandler.c.
Just put everything in the same file to avoid strange dependencies
on the order of files in util-obj-y.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/Makefile.objs |   2 +-
 util/iohandler.c   | 135 -----------------------------------------------------
 util/main-loop.c   | 110 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 136 deletions(-)
 delete mode 100644 util/iohandler.c

diff --git a/util/Makefile.objs b/util/Makefile.objs
index 3817820..a817ced 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -2,7 +2,7 @@ util-obj-y = osdep.o cutils.o unicode.o qemu-timer-common.o
 util-obj-y += bufferiszero.o
 util-obj-y += lockcnt.o
 util-obj-y += aiocb.o async.o aio-wait.o thread-pool.o qemu-timer.o
-util-obj-y += main-loop.o iohandler.o
+util-obj-y += main-loop.o
 main-loop.o-cflags := $(SLIRP_CFLAGS)
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) += atomic64.o
 util-obj-$(CONFIG_POSIX) += aio-posix.o
diff --git a/util/iohandler.c b/util/iohandler.c
deleted file mode 100644
index bece882..0000000
--- a/util/iohandler.c
+++ /dev/null
@@ -1,135 +0,0 @@
-/*
- * QEMU System Emulator - managing I/O handler
- *
- * Copyright (c) 2003-2008 Fabrice Bellard
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu/queue.h"
-#include "block/aio.h"
-#include "qemu/main-loop.h"
-
-#ifndef _WIN32
-#include <sys/wait.h>
-#endif
-
-/* This context runs on top of main loop. We can't reuse qemu_aio_context
- * because iohandlers mustn't be polled by aio_poll(qemu_aio_context). */
-static AioContext *iohandler_ctx;
-
-static void iohandler_init(void)
-{
-    if (!iohandler_ctx) {
-        iohandler_ctx = aio_context_new(&error_abort);
-    }
-}
-
-AioContext *iohandler_get_aio_context(void)
-{
-    iohandler_init();
-    return iohandler_ctx;
-}
-
-GSource *iohandler_get_g_source(void)
-{
-    iohandler_init();
-    return aio_get_g_source(iohandler_ctx);
-}
-
-void qemu_set_fd_handler(int fd,
-                         IOHandler *fd_read,
-                         IOHandler *fd_write,
-                         void *opaque)
-{
-    iohandler_init();
-    aio_set_fd_handler(iohandler_ctx, fd, false,
-                       fd_read, fd_write, NULL, opaque);
-}
-
-void event_notifier_set_handler(EventNotifier *e,
-                                EventNotifierHandler *handler)
-{
-    iohandler_init();
-    aio_set_event_notifier(iohandler_ctx, e, false,
-                           handler, NULL);
-}
-
-/* reaping of zombies.  right now we're not passing the status to
-   anyone, but it would be possible to add a callback.  */
-#ifndef _WIN32
-typedef struct ChildProcessRecord {
-    int pid;
-    QLIST_ENTRY(ChildProcessRecord) next;
-} ChildProcessRecord;
-
-static QLIST_HEAD(, ChildProcessRecord) child_watches =
-    QLIST_HEAD_INITIALIZER(child_watches);
-
-static QEMUBH *sigchld_bh;
-
-static void sigchld_handler(int signal)
-{
-    qemu_bh_schedule(sigchld_bh);
-}
-
-static void sigchld_bh_handler(void *opaque)
-{
-    ChildProcessRecord *rec, *next;
-
-    QLIST_FOREACH_SAFE(rec, &child_watches, next, next) {
-        if (waitpid(rec->pid, NULL, WNOHANG) == rec->pid) {
-            QLIST_REMOVE(rec, next);
-            g_free(rec);
-        }
-    }
-}
-
-static void qemu_init_child_watch(void)
-{
-    struct sigaction act;
-    sigchld_bh = qemu_bh_new(sigchld_bh_handler, NULL);
-
-    memset(&act, 0, sizeof(act));
-    act.sa_handler = sigchld_handler;
-    act.sa_flags = SA_NOCLDSTOP;
-    sigaction(SIGCHLD, &act, NULL);
-}
-
-int qemu_add_child_watch(pid_t pid)
-{
-    ChildProcessRecord *rec;
-
-    if (!sigchld_bh) {
-        qemu_init_child_watch();
-    }
-
-    QLIST_FOREACH(rec, &child_watches, next) {
-        if (rec->pid == pid) {
-            return 1;
-        }
-    }
-    rec = g_malloc0(sizeof(ChildProcessRecord));
-    rec->pid = pid;
-    QLIST_INSERT_HEAD(&child_watches, rec, next);
-    return 0;
-}
-#endif
diff --git a/util/main-loop.c b/util/main-loop.c
index a9f4e8d..e3eaa55 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -32,6 +32,11 @@
 #include "qemu/main-loop.h"
 #include "block/aio.h"
 #include "qemu/error-report.h"
+#include "qemu/queue.h"
+
+#ifndef _WIN32
+#include <sys/wait.h>
+#endif
 
 #ifndef _WIN32
 
@@ -525,3 +530,108 @@ QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque)
 {
     return aio_bh_new(qemu_aio_context, cb, opaque);
 }
+
+/*
+ * Functions to operate on the I/O handler AioContext.
+ * This context runs on top of main loop. We can't reuse qemu_aio_context
+ * because iohandlers mustn't be polled by aio_poll(qemu_aio_context).
+ */
+static AioContext *iohandler_ctx;
+
+static void iohandler_init(void)
+{
+    if (!iohandler_ctx) {
+        iohandler_ctx = aio_context_new(&error_abort);
+    }
+}
+
+AioContext *iohandler_get_aio_context(void)
+{
+    iohandler_init();
+    return iohandler_ctx;
+}
+
+GSource *iohandler_get_g_source(void)
+{
+    iohandler_init();
+    return aio_get_g_source(iohandler_ctx);
+}
+
+void qemu_set_fd_handler(int fd,
+                         IOHandler *fd_read,
+                         IOHandler *fd_write,
+                         void *opaque)
+{
+    iohandler_init();
+    aio_set_fd_handler(iohandler_ctx, fd, false,
+                       fd_read, fd_write, NULL, opaque);
+}
+
+void event_notifier_set_handler(EventNotifier *e,
+                                EventNotifierHandler *handler)
+{
+    iohandler_init();
+    aio_set_event_notifier(iohandler_ctx, e, false,
+                           handler, NULL);
+}
+
+/* reaping of zombies.  right now we're not passing the status to
+   anyone, but it would be possible to add a callback.  */
+#ifndef _WIN32
+typedef struct ChildProcessRecord {
+    int pid;
+    QLIST_ENTRY(ChildProcessRecord) next;
+} ChildProcessRecord;
+
+static QLIST_HEAD(, ChildProcessRecord) child_watches =
+    QLIST_HEAD_INITIALIZER(child_watches);
+
+static QEMUBH *sigchld_bh;
+
+static void sigchld_handler(int signal)
+{
+    qemu_bh_schedule(sigchld_bh);
+}
+
+static void sigchld_bh_handler(void *opaque)
+{
+    ChildProcessRecord *rec, *next;
+
+    QLIST_FOREACH_SAFE(rec, &child_watches, next, next) {
+        if (waitpid(rec->pid, NULL, WNOHANG) == rec->pid) {
+            QLIST_REMOVE(rec, next);
+            g_free(rec);
+        }
+    }
+}
+
+static void qemu_init_child_watch(void)
+{
+    struct sigaction act;
+    sigchld_bh = qemu_bh_new(sigchld_bh_handler, NULL);
+
+    memset(&act, 0, sizeof(act));
+    act.sa_handler = sigchld_handler;
+    act.sa_flags = SA_NOCLDSTOP;
+    sigaction(SIGCHLD, &act, NULL);
+}
+
+int qemu_add_child_watch(pid_t pid)
+{
+    ChildProcessRecord *rec;
+
+    if (!sigchld_bh) {
+        qemu_init_child_watch();
+    }
+
+    QLIST_FOREACH(rec, &child_watches, next) {
+        if (rec->pid == pid) {
+            return 1;
+        }
+    }
+    rec = g_malloc0(sizeof(ChildProcessRecord));
+    rec->pid = pid;
+    QLIST_INSERT_HEAD(&child_watches, rec, next);
+    return 0;
+}
+#endif
-- 
1.8.3.1


