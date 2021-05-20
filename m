Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A638B573
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:49:16 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmnG-0002vw-3x
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhT-0003CJ-6q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhP-00013N-Gu
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id d11so18489385wrw.8
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQhUkmM1hd8VG9HynbCnkI01fYn9Z50vQ7P065/2YIg=;
 b=OAqW6QLHWBXgM0vR6YjUEK9p2adLS/VOZjljA1lCjYbXRkX3CvlDcLAfXiGn6TH9nt
 bXYBQeJpyPtOEDy6aO7HTnLqH2m4OqV/NEjZL5b1WCNdiUdVm7oTmkJbmgB0Bld8z4c0
 M4Slt8t+LNIC7JXgUP9+wJo9LCC+2dR4OWIQCHiJ/hntlzConHiz/sAUqueBD81uQcmQ
 8ETfA6BCA00HVSA3Hef3FldTpOGZbEvgWKw98uXuqI116Fbk+AZbisX3ak/kshS9Qs/f
 PAWTZbem1Anw+w7VzOMvtBLVfqSKsCiXrM3Iy/2fm1MZh9dkAEesStOm88P8tUOtaJfc
 lvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQhUkmM1hd8VG9HynbCnkI01fYn9Z50vQ7P065/2YIg=;
 b=awpRknsGc9TyiRMZIDzW4P69yk4OWa6aYhv3FKDCqOWBrKoxTukLH+uJ7wJVBHiJGd
 e388w5RnzjVpVLhMibxvQNmolx4bX962hJcBJVL/Oc0kdPiZgFuvD1oiVRyVa68RtDdT
 kLRGixKhcO5mqy0DoldnjfVDxKzJjuhj0+oEpfCUNGUCsW6wLPNpbkz2c5t4zaVkCiKg
 Km+lZmRXw345cckRjk3nHJ2Rzg0x2XTz4sUJbo8swJUH79EY5GdVNMiyzYAv3wHh9pUe
 5RbwuSHM7vlyd8Qn33V2B57fAKQViy8iTU47sk7+wMfFwUlz/my1BQ9Rk48OY2TSw2hX
 t8iQ==
X-Gm-Message-State: AOAM532//cmi/baVZkGXf/JR7Zmpr8G9NUVJ0pTJ48L1Rv5mgDlghXTN
 GHXiHWQpPiM5yz8rIQAeiAH3vA==
X-Google-Smtp-Source: ABdhPJwBOYApptB9pnodnXGNPGp1QTgylipqnKllHw1hkdUD5RRMWDLpT88CKyeah5K3PNhVUITCXg==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr5488691wrn.255.1621532585880; 
 Thu, 20 May 2021 10:43:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm4219135wrx.15.2021.05.20.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9353E1FF87;
 Thu, 20 May 2021 18:43:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/8] tests/tcg: add a multiarch signals test to stress test
 signal delivery
Date: Thu, 20 May 2021 18:42:56 +0100
Message-Id: <20210520174303.12310-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

Message-Id: <20210504100223.25427-29-alex.bennee@linaro.org>
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
index 408dace783..279362391d 100644
--- a/tests/tcg/sparc64/Makefile.target
+++ b/tests/tcg/sparc64/Makefile.target
@@ -2,5 +2,12 @@
 #
 # sparc specific tweaks
 
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


