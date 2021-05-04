Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8F37288F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:13:44 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds3j-000735-HN
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzd-0002Qa-IL
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzZ-0006ip-Q5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so8698972wrt.12
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/1r7PR/C5kPfLyXXkdUvTNVaZZQrwDzdLKu6YqyjOU=;
 b=ncfGJTUOxIibH+C5d+AixBXq8PRrM8A9OJXuZ++f8BRpkj/778FmlilCLunCglufQd
 kt8psQJkCyu0mvGquQ7zyOoqFcUoZdZK19K9gpI3DYrraD+E0BMsbORlO2QO91q9oae+
 kltKbui72P513VZV/hRFerUN3RHFv9IdEhA742Dzhb1qs7pI4eE+TeNjUfmqhvRIs/Ur
 gwMiF7gv3QUByzfY4g1NIXYBl0xCpf0w5fuE1OOnxl9gaGFmZm7OvqL38XFU7aorh1Nd
 k+4DYgw9cIxkYSriq1KbUMstRZCq0U6NV/S3aBqkzBgrkFZQyocu2gB7aoZGFzsSZrSv
 aTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/1r7PR/C5kPfLyXXkdUvTNVaZZQrwDzdLKu6YqyjOU=;
 b=Fem46RM36cV9FfTcGxjhyZn+Pm/EVpqNJgkw+/e5NBxYDGivXCA6m66n/7jZREYwnA
 PYMmj/XuKgqebksVdX5cs4feluFDDsmqQvSOukUFd/3QHyNa7Mky3wZ8q2xEhIfwgJoF
 Nr451jWeQfI8Wneq2YExF4Qp4PkPlocYWalRBf06JzUycJ26yIXPhjARs8ZlFxycJp+K
 32B+wFN/gU2wlMscjyP0d6XVQCgPWlrNuRIHAfWbB3cJVAq0gGLIWRxlnL5VtR06Jbo8
 B5Qjsj86PGRMif7sjTlhk0pORbPKz0oXhf5M92qMH81YVDkX/yVZCYayyO7sip82Usm8
 XlxA==
X-Gm-Message-State: AOAM532OW+acbrjK96Na4nS+SS18VhWlYWjR4eJmIlYVdcQ2DGZufl8d
 3xFpyKj9SFmE+gyPIIhdP5xiwg==
X-Google-Smtp-Source: ABdhPJxNVHOavIfczJGkQL15FpB6H+27rtgSyDoaPgcpwJkYdBTj5+Rh0fWAsP105XA9/cKQwyUsxA==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr30809646wrv.333.1620122964143; 
 Tue, 04 May 2021 03:09:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm2040813wrr.27.2021.05.04.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B38C1FFB4;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/30] tests/tcg: add a multiarch signals test to stress
 test signal delivery
Date: Tue,  4 May 2021 11:02:21 +0100
Message-Id: <20210504100223.25427-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple signal test that combines the POSIX timer_create
with signal delivery across multiple threads. The aim is to provide a
bit more of a stress test to flush out signal handling issues for
easily than the occasional random crash we sometimes see in linux-test
or threadcount.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - minor cosmetic tweaks
  - skip for alpha/sparc64 (including with plugins)
---
 tests/tcg/multiarch/signals.c       | 149 ++++++++++++++++++++++++++++
 tests/tcg/alpha/Makefile.target     |   7 ++
 tests/tcg/multiarch/Makefile.target |   2 +
 tests/tcg/sparc64/Makefile.target   |   7 ++
 4 files changed, 165 insertions(+)
 create mode 100644 tests/tcg/multiarch/signals.c

diff --git a/tests/tcg/multiarch/signals.c b/tests/tcg/multiarch/signals.c
new file mode 100644
index 0000000000..998c8fdefd
--- /dev/null
+++ b/tests/tcg/multiarch/signals.c
@@ -0,0 +1,149 @@
+/*
+ * linux-user signal handling tests.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <pthread.h>
+#include <string.h>
+#include <signal.h>
+#include <time.h>
+#include <sys/time.h>
+
+static void error1(const char *filename, int line, const char *fmt, ...)
+{
+    va_list ap;
+    va_start(ap, fmt);
+    fprintf(stderr, "%s:%d: ", filename, line);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    va_end(ap);
+    exit(1);
+}
+
+static int __chk_error(const char *filename, int line, int ret)
+{
+    if (ret < 0) {
+        error1(filename, line, "%m (ret=%d, errno=%d/%s)",
+               ret, errno, strerror(errno));
+    }
+    return ret;
+}
+
+#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
+
+#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
+
+/*
+ * Thread handling
+ */
+typedef struct ThreadJob ThreadJob;
+
+struct ThreadJob {
+    int number;
+    int sleep;
+    int count;
+};
+
+static pthread_t *threads;
+static int max_threads = 10;
+__thread int signal_count;
+int total_signal_count;
+
+static void *background_thread_func(void *arg)
+{
+    ThreadJob *job = (ThreadJob *) arg;
+
+    printf("thread%d: started\n", job->number);
+    while (total_signal_count < job->count) {
+        usleep(job->sleep);
+    }
+    printf("thread%d: saw %d alarms from %d\n", job->number,
+           signal_count, total_signal_count);
+    return NULL;
+}
+
+static void spawn_threads(void)
+{
+    int i;
+    threads = calloc(sizeof(pthread_t), max_threads);
+
+    for (i = 0; i < max_threads; i++) {
+        ThreadJob *job = calloc(sizeof(ThreadJob), 1);
+        job->number = i;
+        job->sleep = i * 1000;
+        job->count = i * 100;
+        pthread_create(threads + i, NULL, background_thread_func, job);
+    }
+}
+
+static void close_threads(void)
+{
+    int i;
+    for (i = 0; i < max_threads; i++) {
+        pthread_join(threads[i], NULL);
+    }
+    free(threads);
+    threads = NULL;
+}
+
+static void sig_alarm(int sig, siginfo_t *info, void *puc)
+{
+    if (sig != SIGRTMIN) {
+        error("unexpected signal");
+    }
+    signal_count++;
+    __atomic_fetch_add(&total_signal_count, 1, __ATOMIC_SEQ_CST);
+}
+
+static void test_signals(void)
+{
+    struct sigaction act;
+    struct itimerspec it;
+    timer_t tid;
+    struct sigevent sev;
+
+    /* Set up SIG handler */
+    act.sa_sigaction = sig_alarm;
+    sigemptyset(&act.sa_mask);
+    act.sa_flags = SA_SIGINFO;
+    chk_error(sigaction(SIGRTMIN, &act, NULL));
+
+    /* Create POSIX timer */
+    sev.sigev_notify = SIGEV_SIGNAL;
+    sev.sigev_signo = SIGRTMIN;
+    sev.sigev_value.sival_ptr = &tid;
+    chk_error(timer_create(CLOCK_REALTIME, &sev, &tid));
+
+    it.it_interval.tv_sec = 0;
+    it.it_interval.tv_nsec = 1000000;
+    it.it_value.tv_sec = 0;
+    it.it_value.tv_nsec = 1000000;
+    chk_error(timer_settime(tid, 0, &it, NULL));
+
+    spawn_threads();
+
+    do {
+        usleep(1000);
+    } while (total_signal_count < 2000);
+
+    printf("shutting down after: %d signals\n", total_signal_count);
+
+    close_threads();
+
+    chk_error(timer_delete(tid));
+}
+
+int main(int argc, char **argv)
+{
+    test_signals();
+    return 0;
+}
diff --git a/tests/tcg/alpha/Makefile.target b/tests/tcg/alpha/Makefile.target
index a585080328..49ce5cd69f 100644
--- a/tests/tcg/alpha/Makefile.target
+++ b/tests/tcg/alpha/Makefile.target
@@ -14,5 +14,12 @@ test-cmov: test-cond.c
 
 run-test-cmov: test-cmov
 
+# currently broken: executes a halt on sigreturn leading to being terminated by signal SIGILL (Illegal instruction)
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+
+run-plugin-signals-with-%: signals
+	$(call skip-test, $<, "BROKEN")
+
 # On Alpha Linux only supports 8k pages
 EXTRA_RUNS+=run-test-mmap-8192
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index a3a751723d..3f283eabe6 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -30,6 +30,8 @@ testthread: LDFLAGS+=-lpthread
 
 threadcount: LDFLAGS+=-lpthread
 
+signals: LDFLAGS+=-lrt -lpthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/sparc64/Makefile.target b/tests/tcg/sparc64/Makefile.target
index 5bd7f90583..fb3825b7fa 100644
--- a/tests/tcg/sparc64/Makefile.target
+++ b/tests/tcg/sparc64/Makefile.target
@@ -7,5 +7,12 @@
 run-linux-test: linux-test
 	$(call skip-test, $<, "BROKEN")
 
+# currently broken: hangs after the first thread exits
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+
+run-plugin-signals-with-%: signals
+	$(call skip-test, $<, "BROKEN")
+
 # On Sparc64 Linux support 8k pages
 EXTRA_RUNS+=run-test-mmap-8192
-- 
2.20.1


