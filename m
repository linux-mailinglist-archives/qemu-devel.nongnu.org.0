Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FAD2C04A3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:35:24 +0100 (CET)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA7t-0000Ty-4A
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yR-0007wo-49
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yO-0004i2-8L
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id a65so16888077wme.1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ha7GtIAF1I/0DbH6VrBKGbJXyrL4nzb53Wtfo6JIF00=;
 b=KuJL7YwitqfuTeahBLbBAE73gsB2IWoY7f3Vicy6kFlnpr30ZKOpAMCj4KkTTSpmg5
 kjno4CNLRPjioEAhB54GJjjHXeOny1btpx9mRMgbfc5k66oEE84Q6l4/K8Oa3GU/JFKN
 cGqdId6/+SCJRgc+jt7FNG4jCHV9ZOe0COrFEnEHIp0RqU86KkrPSU1jI1D+H9wHxB+y
 5XkosEwl2rzcCgyASL22qtDV6ESMjkr1OrUcGoz4tMNlXs/m+vG9ijZQb7v+A0D6TE70
 1oi34vGMXAJr6X1WzKDoa8wteEq9yMLxPC4p7Qv3lj6HnVVQIPLxlGkGzaMB4GaNawhE
 Sm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ha7GtIAF1I/0DbH6VrBKGbJXyrL4nzb53Wtfo6JIF00=;
 b=SGjICGvHVzAMNiCTt74aDU51GFA/5C9CJeQxaJlxJLe4xi1PGubyURc4OdtBBxgmtC
 WbWhFX9MwFJFUUqyWtEzTXBOHuJMVNOUu6xPXyO6KdYUmKlVEcnlrHPGCgMHLLR9XrL3
 zVCKCuhclIDObciRwxXQ7qfgBlPf32InegiPG6oyo+3KjGu3ll8hYpLWnlrXnrPT0+l3
 hPC9saD18C2SDV/Omc6FaheXiaCSw0/XoeDMXZbuIuynU6dVCN3fQ9xA4utbN+fvCOJv
 A+XvE2omvL8ATcgs6cac4d60pQBmo8rmpGRjsaYxDQFt9UmZkwmcWLIs9saMaFuxaROX
 hSXQ==
X-Gm-Message-State: AOAM531AI/KvY1a6PIX9bZZ/wlq+Gxpd/J/wTlcHEqFqWBukCXYZ2LEx
 vy1gymmnXOxqiegc9FBOoFL+7Q==
X-Google-Smtp-Source: ABdhPJykCjx8iE3WbkChjSqaV9MFUK/G8T8O59vdMUflhAA8uEQg3rrBwXPVxO/VdX1CEvaXgFs4aQ==
X-Received: by 2002:a1c:9652:: with SMTP id y79mr24077791wmd.71.1606130730721; 
 Mon, 23 Nov 2020 03:25:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h4sm18416224wrq.3.2020.11.23.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592A21FF92;
 Mon, 23 Nov 2020 11:25:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/7] gitlab-ci: Move trace backend tests across to gitlab
Date: Mon, 23 Nov 2020 11:25:17 +0000
Message-Id: <20201123112518.13425-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the trace backend
tests to GitLab.

Note the User-Space Tracer backend is still tested on
Ubuntu by the s390x jobs on Travis-CI.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201111121234.3246812-3-philmd@redhat.com>
Message-Id: <20201117173635.29101-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b406027a55..d0173e82b1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -415,6 +415,24 @@ check-crypto-only-gnutls:
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
+# We don't need to exercise every backend with every front-end
+build-trace-multi-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
+
+build-trace-ftrace-system:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
+
+build-trace-ust-system:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
 check-patch:
   stage: build
diff --git a/.travis.yml b/.travis.yml
index bac085f800..1f80bdb624 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -232,25 +232,6 @@ jobs:
         - TEST_CMD=""
 
 
-    # We don't need to exercise every backend with every front-end
-    - name: "GCC trace log,simple,syslog (user)"
-      env:
-        - CONFIG="--enable-trace-backends=log,simple,syslog --disable-system"
-        - TEST_CMD=""
-
-
-    - name: "GCC trace ftrace (x86_64-softmmu)"
-      env:
-        - CONFIG="--enable-trace-backends=ftrace --target-list=x86_64-softmmu"
-        - TEST_CMD=""
-
-
-    - name: "GCC trace ust (x86_64-softmmu)"
-      env:
-        - CONFIG="--enable-trace-backends=ust --target-list=x86_64-softmmu"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


