Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5439DEDB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:34:57 +0200 (CEST)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGLA-0005aM-Hj
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJV-0002yi-7I
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJP-0000KO-Gv
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id h3so10204115wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD8MK1dqrE7V3HgQu/qknHgJp7sj9gokbgu7xhjg20o=;
 b=GvMMRDOB0P9flWO2FRxGB40qiMl050eDXyDgNfQkIOfZrvLgCDshzrT1kaJRUoDGew
 sn3NR5kGmXR8hOzg4UOBTKHTmYxelKFxfA1NnLwPb4P0IzzU/9/WV5qd2bir5ElZOnPi
 qR2ze1OGWFcs8p6eLdD1me07J6XntRZQRBYBBzm2SF5DQ1tK3b13cCp0UiLBp13+eAn/
 kGxTPq/X3AMraP7syRFYG7BYeVWsaibn12wTZj6JTo9vO7+BvgzSI2ad9evWoIvsYvQA
 u5qvLPfeOZi0r327ePVQgcUKfGn4Hqqz/zirF6QRSRG3JCbiuvuCuWfbVuuMXeTozREA
 niYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CD8MK1dqrE7V3HgQu/qknHgJp7sj9gokbgu7xhjg20o=;
 b=nOXIJ87nfQQ8cceWw2/60dKsnX7PHh6MwpxjXAMjgl0rmwnQWRs7mQyK0DTBGwMP3y
 8+2EmFR9zJY5zBboV+9qF+dmPzIxPvJeqZqJqvlNke6W6wi495X1I8X3ur1Y6l4tjvfE
 QxgL2e5pUV+fib/RyEBU/l593PLj0V3Vpqr5ptQFXzAtk6YJ5naEskwPBFilS7eutGZZ
 DQqfPQs2nGzgStsNNZmSxwV9LTPYx6Lpp8KXX00UZWFc250hzpFzyP5JiitFYWDU0Csx
 bOiRME3XO0mUWJVMWso5qzucOdTYpWud7vbUA/IGpYmm49W1IiKlEM3AMw7SgmaSoVsM
 N4Wg==
X-Gm-Message-State: AOAM5338JT0nVKPtFfvvCe2YdUU4s8aixE5ooNTOWY0OgIVVNno05A/N
 LBK8rBR1KCzrijNgbnnKInEbjA==
X-Google-Smtp-Source: ABdhPJxc4z6wTT7zoc2lCj97PVr/xmgGTIFOsSabKkAp6h+xE6VMYEeFxTPEQSTZA2+znAUae5sQOg==
X-Received: by 2002:a05:600c:47c4:: with SMTP id
 l4mr16962146wmo.145.1623076385743; 
 Mon, 07 Jun 2021 07:33:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u7sm12440623wrt.18.2021.06.07.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75101FF87;
 Mon,  7 Jun 2021 15:33:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/8] tests/tcg: add a multiarch signals test to stress test
 signal delivery
Date: Mon,  7 Jun 2021 15:32:56 +0100
Message-Id: <20210607143303.28572-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple signal test that combines the POSIX timer_create
with signal delivery across multiple threads. The aim is to provide a
bit more of a stress test to flush out signal handling issues for
easily than the occasional random crash we sometimes see in linux-test
or threadcount.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210527160319.19834-2-alex.bennee@linaro.org>

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
-- 
2.20.1


