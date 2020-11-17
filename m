Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921362B6BEC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:38:55 +0100 (CET)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4wQ-00046V-KD
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uU-00028O-4r
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:54 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uN-0006P9-O1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:53 -0500
Received: by mail-wm1-x32a.google.com with SMTP id p22so4050909wmg.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PAJ5aE8N6gr4ejxRSy0yUGc4MSHZiCqHtxPL9qS46IE=;
 b=GakcrMpfu2Y03WrvTrLgHM6Xo9Htd62RO5bHC5QQ4MGHvCNhCd0/VWcK23ofvqWQGa
 SO7gVa0FpJgROHcclXN0a/+RJ3SV6nFwxpf0Y8WKy5bITOooqIXziCv1p5SwBBNdqVzr
 MY8KOnYxQNbwXxRGGDUjbenowmOKzhucm80rbG9k0EJo1Dljla4tUP0Mm6MxmsYRv610
 PyCqa9ztO8sGNNt9sxqVXtCH+svN9/IbgtA+7hcsKLu426KdOU1NFpn9Oh9l27WEgcQ7
 VS/FjpfvoHnOiLLT8NE2OGNBdbYOXNpEPIjRFQatXNWv8VhRDaYREA46fSj4ysj31mMW
 Wxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAJ5aE8N6gr4ejxRSy0yUGc4MSHZiCqHtxPL9qS46IE=;
 b=jx5E7vnWY/CNSe7ZrTQ/OBBZM1ggg8b7fOJpPKJSeygBHNt2qqddS777H1TBDXbjCQ
 nULjVX8Deyq2HzR5keLj0EaY8/uzqb9sZcsufy7x8sxyj8puH9OpjWMS9haFQ4o6hRZt
 7d1/VUZlNsU3CAjc1HlpPtgH7TA4DVFfskfkYCH9m3Q3yuAsb8vde8Xn3h3dPvqtQjmQ
 5uoIp7N3+mKaMIA7GVbXGWkzkfstPHGXXUR83zhJ/bIRDZ2MzcjZTQiA7ylEbVjw6/qt
 m9eTsirZX91A9j+nu5HJG+wNS0LkHFpxDd00p16LaOJMO5b79B2VWE1uduSfEwiJfXEZ
 tukg==
X-Gm-Message-State: AOAM5320gFtV/VdDDUFiUCinw71wcrDBwQC5dNnFxyMxnwVlOmTp1CVg
 NjPQxQw8EW+2NIpWtTZElIMxEF0B6tHGyQ==
X-Google-Smtp-Source: ABdhPJyC1gk8zZqHFtutrs6QcykxW2Na7ezhfy6FAJaGdOA4n99BMraS8WrpqTvTOOKsMuH9bNJH4A==
X-Received: by 2002:a1c:4884:: with SMTP id v126mr200447wma.160.1605634606276; 
 Tue, 17 Nov 2020 09:36:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v64sm3709314wme.25.2020.11.17.09.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDE951FF92;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/6] gitlab-ci: Move trace backend tests across to gitlab
Date: Tue, 17 Nov 2020 17:36:35 +0000
Message-Id: <20201117173635.29101-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the trace backend
tests to GitLab.

Note the User-Space Tracer backend is still tested on
Ubuntu by the s390x jobs on Travis-CI.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201111121234.3246812-3-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 18 ++++++++++++++++++
 .travis.yml    | 19 -------------------
 2 files changed, 18 insertions(+), 19 deletions(-)

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


