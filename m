Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A972B6BEF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:40:25 +0100 (CET)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4xs-00075s-Iw
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uQ-0001zN-La
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uL-0006No-4u
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:50 -0500
Received: by mail-wm1-x341.google.com with SMTP id w24so4015900wmi.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAMQantiot8HqhvJdu7BmWOVAam67OVmYlUn7ZUYJ3k=;
 b=hjYavtMQ6wBkyFO5xxMVozB8WBgGwW3vbss3RvbANvNitR3yj3UDP46YYj2/iCSzpQ
 947HVqLDaNiBRJnShyBYXaOTTqYe0yS/0q4AXk2DOOVpjeSBXUyRT/paVqh4x4Kvz9us
 Rb58jddKrpyHbOqkTQo4yb2nMALkUCoCNUgwdWFv0OEjQVU7/xPn247LvBdbJpWZfjTn
 pwIWB8PX8mhxzbcQC85Pico9f0JQPx2PlRbClOy7N7FEB9XdjwDjLfjK2hvXi7sUjGFE
 CkF0jW/VszHXnwUYIlXONtZaoEM/nTI0QT5UDbWFMRzPMCi8wAvy22dm9lMsz7WcSQ9D
 DvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAMQantiot8HqhvJdu7BmWOVAam67OVmYlUn7ZUYJ3k=;
 b=l2syzP6ByleklBDHVfmdi/ERHlqYvPGcmQJAblGvNgo7YXeTaYqVjOtME13fhvcwCJ
 V4rsdmJ2CzjgwGc7HfylRe17za9cQA/d3LH3nJo8guTQAmV3pfea3Z3+jr5xdMyurAJL
 /1BFU3VvUCcN0bmqf/4fXVJ70JkrWcyY21lkMwDSdVq+litbiPqEZKTqRBup6LP+gxuI
 Jh6kxbriq2GyPQbMwfSsPH0aq4i5JCKM79LPWnXzmiDGAcNL6hCiNRSSDNgI2BuN1wL7
 YcFabjm5af739e2B6gvgVju+9id8RuWfgC8AdLXwj8hy7PRx6/y6mbIKFKWnF3Ap5wOv
 ohAQ==
X-Gm-Message-State: AOAM531E/049mWoCeHLUVskwZCcKu/I7XwzqgR8lrZ8iSkVl/gWVE8tP
 EgJmwx7xphGjinhUKY5PzYGgGQ==
X-Google-Smtp-Source: ABdhPJy3ysUoD2GApKwmsJJWV/tOLmmgpqWtnzAhbv3Xia/XoBpYHTzPJVLXMKW1Yx1HHPR1AexcGg==
X-Received: by 2002:a1c:1fcc:: with SMTP id f195mr163169wmf.121.1605634603787; 
 Tue, 17 Nov 2020 09:36:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm28684559wrr.49.2020.11.17.09.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE4BF1FF90;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] gitlab: move remaining x86 check-tcg targets to gitlab
Date: Tue, 17 Nov 2020 17:36:33 +0000
Message-Id: <20201117173635.29101-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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

The GCC check-tcg (user) test in particular was very prone to timing
out on Travis. We only actually need to move the some-softmmu builds
across as we already have coverage for linux-user.

As --enable-debug-tcg does increase the run time somewhat as more
debug is put in let's restrict that to just the plugins build. It's
unlikely that a plugins enabled build is going to hide a sanity
failure in core TCG code so let the plugin builds do the heavy lifting
on checking TCG sanity so the non-plugin builds can run swiftly.

Now the only remaining check-tcg builds on Travis are for the various
non-x86 arches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201110192316.26397-10-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 17 +++++++++++++++++
 .travis.yml    | 26 --------------------------
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a8b375188..b406027a55 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -247,6 +247,15 @@ build-user:
     CONFIGURE_ARGS: --disable-tools --disable-system
     MAKE_CHECK_ARGS: check-tcg
 
+# Only build the softmmu targets we have check-tcg tests for
+build-some-softmmu:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
+    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
 # Run check-tcg against linux-user (with plugins)
 # we skip sparc64-linux-user until it has been fixed somewhat
 # we skip cris-linux-user as it doesn't use the common run loop
@@ -258,6 +267,14 @@ build-user-plugins:
     MAKE_CHECK_ARGS: check-tcg
   timeout: 1h 30m
 
+build-some-softmmu-plugins:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
+    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
 build-clang:
   <<: *native_build_job_definition
   variables:
diff --git a/.travis.yml b/.travis.yml
index a3d78171ca..bac085f800 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -301,32 +301,6 @@ jobs:
         - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
 
 
-    # Run check-tcg against linux-user
-    - name: "GCC check-tcg (user)"
-      env:
-        - CONFIG="--disable-system --enable-debug-tcg"
-        - TEST_BUILD_CMD="make build-tcg"
-        - TEST_CMD="make check-tcg"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
-
-
-    # Run check-tcg against softmmu targets
-    - name: "GCC check-tcg (some-softmmu)"
-      env:
-        - CONFIG="--enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
-        - TEST_BUILD_CMD="make build-tcg"
-        - TEST_CMD="make check-tcg"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
-
-
-    # Run check-tcg against softmmu targets (with plugins)
-    - name: "GCC plugins check-tcg (some-softmmu)"
-      env:
-        - CONFIG="--enable-plugins --enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
-        - TEST_BUILD_CMD="make build-tcg"
-        - TEST_CMD="make check-tcg"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
-
     - name: "[aarch64] GCC check-tcg"
       arch: arm64
       dist: focal
-- 
2.20.1


