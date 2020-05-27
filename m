Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA091E46FB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 17:06:26 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdxdR-0000bH-Gf
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 11:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdxSc-00021U-W0
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:55:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdxSb-0008G4-KM
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:55:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v19so3351786wmj.0
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 07:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hyh91ojyztqE2sZmXe5ULEmyNIFPWUmO5p3g1DDRWRY=;
 b=Y4aApPJXQcXVbJh6nUI63OeAs6XKVLi3Kiv4CXNqDbxgoxzp235vX/ZSRCSgkKh4Kg
 AGSaU3AvdznhIDAnnKg0VB7CjLpFTePwxXLRqNJK0QFNT2utBEoLpqp2o88TqnqsClx5
 O/6Q97yt21LonmIdgN7UFp824zRn79wu6bFAYp+8KpNtN9NBCi/QS0ZiW1I8gbkZIwVz
 pAXwYjTBSdhVuwNBOcT+LvJacf9qjDy2xOQ8/7Z/wL4X4NUFg9HFl8zXmfiniXg3DKvW
 CT6jOCYBKYka5YpFSN+dyFahiQqNy84VibWzA0AYCvIVwk7wUTpD1TuW38e9ZzuBXaQv
 F1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hyh91ojyztqE2sZmXe5ULEmyNIFPWUmO5p3g1DDRWRY=;
 b=WhhG8e3UT8eH6Au8zQO3T+5oQy5gLba8FpnBabzMm6+DzBFdeM+gUrv0ZtJ2ju+oXP
 XxLY9BSoxV4zybr2MrNRRMcWNfneTDsHTfV8maX8A+P20KvZk1O3BsKNshVtGswoP/zX
 5sKbR+YIwxoZ16LOMtSGz7PVaSbkcDyRy/9UFEaiY3YrXtRcdl0TiUC8YTTqYCO9GKp5
 in/8C2oy2Ni3WNfx5S4kBGKQ5Ap0wGjTOBCYoRTfYLHDyIfdEhQgz5ecX8Yj2mYO7JIk
 nJbMUhPdeOemELBbRqfvPD4ngC/0kUcdaQSE5/So07NtvTfHRo+rNKDLO/1/b0hbNidq
 HVuw==
X-Gm-Message-State: AOAM531MVy1Pqx6pR5+HmPYfM1xT6A+pXpwc2ozY5/CKHayZ2WntjgUv
 fvDETxbl0kIIuKjar+oRHy87qA==
X-Google-Smtp-Source: ABdhPJybrduI4iysO2J9g1/L2HoQluTusk0GwwQWn/XAaS4oHzskJgtiiGoQ3/pB9TOUeVOIWsUBsQ==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr5003912wme.91.1590591312078; 
 Wed, 27 May 2020 07:55:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r5sm3194036wrq.0.2020.05.27.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 07:55:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B7C51FF9B;
 Wed, 27 May 2020 15:54:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/12] tests/tcg: add new threadcount test
Date: Wed, 27 May 2020 15:54:55 +0100
Message-Id: <20200527145455.2550-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527145455.2550-1-alex.bennee@linaro.org>
References: <20200527145455.2550-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Nikolay Igotti <igotti@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on the original testcase by Nikolay Igotti.

Message-ID: <CAEme+7GLKg_dNsHizzTKDymX9HyD+Ph2iZ=WKhOw2XG+zhViXg@mail.gmail.com>
Signed-off-by: Nikolay Igotti <igotti@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20200520140541.30256-15-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/threadcount.c b/tests/tcg/multiarch/threadcount.c
new file mode 100644
index 00000000000..545a1c81466
--- /dev/null
+++ b/tests/tcg/multiarch/threadcount.c
@@ -0,0 +1,64 @@
+/*
+ * Thread Exerciser
+ *
+ * Unlike testthread which is mainly concerned about testing thread
+ * semantics this test is used to exercise the thread creation and
+ * accounting. A version of this test found a problem with clashing
+ * cpu_indexes which caused a break in plugin handling.
+ *
+ * Based on the original test case by Nikolay Igotti.
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <pthread.h>
+
+int max_threads = 10;
+
+typedef struct {
+    int delay;
+} ThreadArg;
+
+static void *thread_fn(void* varg)
+{
+    ThreadArg *arg = varg;
+    usleep(arg->delay);
+    free(arg);
+    return NULL;
+}
+
+int main(int argc, char **argv)
+{
+    int i;
+    pthread_t *threads;
+
+    if (argc > 1) {
+        max_threads = atoi(argv[1]);
+    }
+    threads = calloc(sizeof(pthread_t), max_threads);
+
+    for (i = 0; i < max_threads; i++) {
+        ThreadArg *arg = calloc(sizeof(ThreadArg), 1);
+        arg->delay = i * 100;
+        pthread_create(threads + i, NULL, thread_fn, arg);
+    }
+
+    printf("Created %d threads\n", max_threads);
+
+    /* sleep until roughly half the threads have "finished" */
+    usleep(max_threads * 50);
+
+    for (i = 0; i < max_threads; i++) {
+        pthread_join(threads[i], NULL);
+    }
+
+    printf("Done\n");
+
+    return 0;
+}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 51fb75ecfdd..cb49cc9ccb2 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -28,6 +28,8 @@ run-float_%: float_%
 
 testthread: LDFLAGS+=-lpthread
 
+threadcount: LDFLAGS+=-lpthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.20.1


