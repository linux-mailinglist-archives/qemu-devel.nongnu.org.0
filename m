Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563132F7E07
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:22:11 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PzO-0008W6-CX
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEa-0001H7-Gf
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEY-00087f-It
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d13so9271607wrc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Df631mxt2afxlIpDJjQfhR/CHjkLtQgEg7fhjq99/Rk=;
 b=V4dUDnvqmVoIz7oFrWRUcUyUY9OhrH09AKNkBe/LOBUW2NbEUDnnX3fd/Ls+KI852i
 pOB8a5gjaeikawZ3qw2QacpC3wCra2F1yJxUUaFTMB7WTECF9n59RrTNqXhMvKmdAG3B
 RxuaKYSE4O1s63FkOb7U59G28r3sGfRHnHXd3axLqJgkleeqBvTZGtBrCgS1zdlkhXzY
 F+SXgy3pXQLYpusy5INByZASQ8K3uX5rDI9Yq19yZeWnfM0C/R4Dr4+UYB6rcwl1dTsV
 wHSUTGjyRU0zQJP797kKgjDH8/uIfZJ64dbKgt9yop1UxOD/50WvoAQbk3AihhDGjDWj
 0Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Df631mxt2afxlIpDJjQfhR/CHjkLtQgEg7fhjq99/Rk=;
 b=Qmd2XpwEVEYynVydWbup8OtTVGeciTqhpXtPAdMK3833rI7S6Sr+9WuN6CJTYl+jGm
 nhDxvooPSPA9ZbjyMwIlhPq5qtuhCGQV3oA+a+q32laW7b3M22+K0lCV1oRioZU187FG
 /ymAeb8pR/Nq3BmpeYGNNPfyNv5i3t5nnpkK+NahOTQz3IrUaXNDrPY1niSgtv7aABxC
 RMOSoKexFmLeXI/FYoKS00bipSgb4FxLeOUKe/fCL37j6Ih5EpcFu0HYVRRIGb0F5B0x
 7yUi5XRMY1qQtG1JRbyXN5Rr8a4viIJRj6OIXoYhvBqZz8R7HoSg9pAlOHg0bnHvX1w5
 O7CQ==
X-Gm-Message-State: AOAM532GBqjvxw3XhCZp9ySo2vnugU6zw/Y1vEtJ0p28ylJqe6DVu91F
 W0pqcQID5O8rWgMgY/edVznkT3evLtPBlg==
X-Google-Smtp-Source: ABdhPJyRWIqe3iX7t0FYrgkkRhk89uGsILWiHj4uJ6NUgiu29U0G9AuYiwangqo93LrAx8iXq3g0PA==
X-Received: by 2002:adf:e547:: with SMTP id z7mr12787550wrm.283.1610717625242; 
 Fri, 15 Jan 2021 05:33:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm14650825wrt.10.2021.01.15.05.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 786BD1FF98;
 Fri, 15 Jan 2021 13:08:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/30] gitlab: move docs and tools build across from Travis
Date: Fri, 15 Jan 2021 13:08:07 +0000
Message-Id: <20210115130828.23968-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it we might as well check the tag generation. For
bonus points we run GNU globals htags into the public pages directory
for publishing with the auto generated pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210114165730.31607-10-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4532f1718a..bd60f3e741 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -79,7 +79,6 @@ build-system-ubuntu:
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -111,7 +110,6 @@ build-system-debian:
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -126,6 +124,17 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
+build-tools-and-docs-debian:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: ctags TAGS cscope
+    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 acceptance-system-debian:
   <<: *native_test_job_definition
   needs:
@@ -596,14 +605,21 @@ build-libvhost-user:
     - meson
     - ninja
 
+# Prepare for GitLab pages deployment. Anything copied into the
+# "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 pages:
-  image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
+  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
   needs:
-    - job: build-system-ubuntu
-      artifacts: true
+    - job: build-tools-and-docs-debian
   script:
-    - mkdir public
+    - mkdir -p public
+    # HTML-ised source tree
+    - make gtags
+    - htags -anT --tree-view=filetree -m qemu_init
+        -t "Welcome to the QEMU sourcecode"
+    - mv HTML public/src
+    # Project documentation
     - mv build/docs/index.html public/
     - for i in devel interop specs system tools user ; do mv build/docs/$i public/ ; done
   artifacts:
diff --git a/.travis.yml b/.travis.yml
index f2a101936c..3b574a5968 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -148,22 +148,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    # Check we can build docs and tools (out of tree)
-    - name: "tools and docs (bionic)"
-      dist: bionic
-      env:
-        - BUILD_DIR="out-of-tree/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--enable-tools --enable-docs"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-linux-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      addons:
-        apt:
-          packages:
-            - ninja-build
-            - python3-sphinx
-            - perl
-
-
     # Test with Clang for compile portability (Travis uses clang-5.0)
     - name: "Clang (user)"
       env:
-- 
2.20.1


