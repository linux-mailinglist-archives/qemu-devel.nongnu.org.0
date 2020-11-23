Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF122C0498
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:33:42 +0100 (CET)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA6F-0006dU-9s
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yO-0007qD-Bj
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:32 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yL-0004f5-0k
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id t4so5279034wrr.12
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBm2QW2xv0X0uMeboe0qDw8OaAc5NxhfEjgUZ3hL4ww=;
 b=WHasC0UJ+zQLixSCMKbszwDN87efoBie0dNEccvIu2watbjRFcW595ymKzUAu7lBfG
 RxHA1czcNOGJWjRDEoFpEo5l6leFqHr9+yrYVBI/1MaU2BlAL3J/AgyRU2wDjP/2dFBO
 N4/UzdQlEDXxmwuUOVkGoXiu7B2VXnaSUeDmwWZe7Wl2xBscdwAEFTlDGASloY+MS9Eg
 luIHz7o2Nx3RqFULCgyX/7WMdRvUZYMQXTB2+Q8zqJU9XhxCB3twX9ulw1Ul6/4hc/j1
 mI5S+8vGRjb+1dVBzQjBlurHMjm6y3vFAOIxMGG9hqKXKTxMCWzEBAcIox3ImUjN6DVM
 pH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBm2QW2xv0X0uMeboe0qDw8OaAc5NxhfEjgUZ3hL4ww=;
 b=QqOjdi2xIFns+ZMOmA+WmYz4tPLc/kVKr59ccRvFwYtj8ua0tHw/0aH/z73qzE9gzr
 +TjAekXAD6HuLFJiDH7k7Bz/sZYDy2UlGL/BbDx9q48CJ/E+Sd3zVXm9nd7sIEmdVrw/
 qc23C7HBc4GI+5UHmzLtGYuB0vm7iIh7fc4dS6SxB2CGJSgihM1bWK0/kvt0NyJAB4OK
 swtFvBim1RZk12kkgmVjRP7yIk3LJsPIVdDvsFny1SBuUvQb+BNYIduPgBAlfbFziihR
 dGlGO63gXTgJxHHEqQRWA5378QhSVFuyytB/hnhRchzr/Ow3W9xypncD8yIR7V9CCGuI
 dx5Q==
X-Gm-Message-State: AOAM530u9fzubqqeFU/n6x6MVkjGRnqqJ7YjrBqXlIrewjk40LBlHqvC
 sl220B76vf/FBvYrAMzTTlRatw==
X-Google-Smtp-Source: ABdhPJzEoCHjE2uX6E8Xq5unNZ/ehZOJQvjT4NVmPZgZcHvfx/uhIK9oQgU5+tr132wMeOX8OiZBQg==
X-Received: by 2002:adf:f651:: with SMTP id x17mr9789980wrp.185.1606130727387; 
 Mon, 23 Nov 2020 03:25:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm19084334wrs.50.2020.11.23.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C06A1FF90;
 Mon, 23 Nov 2020 11:25:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/7] gitlab: move remaining x86 check-tcg targets to gitlab
Date: Mon, 23 Nov 2020 11:25:15 +0000
Message-Id: <20201123112518.13425-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201117173635.29101-5-alex.bennee@linaro.org>

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


