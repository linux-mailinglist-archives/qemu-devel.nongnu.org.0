Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD32ADFE7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:40:39 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZVO-0005xp-8T
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZF1-0002Y7-L4
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:43 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEy-0007cY-DE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:43 -0500
Received: by mail-wm1-x341.google.com with SMTP id c16so4288176wmd.2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKItzTtEufAj0TqMJC6HYLGD6eMVh7nt9js/sJnXYio=;
 b=C6LH6+H23xSSfj6iYXw+5oOIL/uQsbIgK91TKj7I7+JqMAzYXYAPCw/3Qry7EvKl5D
 gS/uBg30PTqXXaSYnV7oHy4XiPsA+QF71px17RcTP8rvs0f1GjUtDWb8cKNdBHhehkd3
 R2dMr4iPF/R1UJPCY6U5koHVXHLoWVgGx3qBdQdlNOM4FSR3uFTRVCki3IHn8nZ/5obw
 rZ2ZTcWIzgnDxm6dS/zs1hBkKANjezF4mhidgm0dXJnyk6TMjxuSQ6QBFZRpTa7vyRIW
 VFqY4Vr1aTjPiKB3Bv4SZ2R99D+vFRgxaBC3m0PLPNbrbJDw7AIcqr1SK3SMmw0XXiD3
 9dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKItzTtEufAj0TqMJC6HYLGD6eMVh7nt9js/sJnXYio=;
 b=qqhOqSnbbldpdZhZTU+XhikVQbRlebwzLCvDRDiGmz4GbDI/F2xwGhgQhdy51tsSXq
 Tw5MVRsG7zl2qtZmkBwh2iB5Nmrj2QKlO/yn2TMsoDo1l1G28CBQYTia1RHHNSrLjrpF
 j/refvnnR1e74PHl4PGIAW33tes6aUQsDlQQaF/IudKze+EvI0QhHm9mudKrpgYwDv0z
 wbhziGY8ZCVG72Yw/nWyTBVUQ9/Si/ZdrqPOW7+0C56hL4O/5i9Pi3JMgIa9uJUw97Ed
 FZz8TdkitnxWNYL+Uapy/+r4ziR59pReXposUhrDub6YaEMVF9ihSx5tKjD7eja538Jb
 1oEw==
X-Gm-Message-State: AOAM533wd8HjZ4Bh7AVb5/z8Mjs5z5rKeQWifAFv6XLaeEzwjJ891tOw
 Qq9Bz8Y4FwLWExUAwmn4efyqZQ==
X-Google-Smtp-Source: ABdhPJzE67kJTaUfIEk0iQwRIas221owoLop/lVzZJ8zwSg3uYOzckbp/UK7IX1EhPEPeG991YrCaQ==
X-Received: by 2002:a1c:4808:: with SMTP id v8mr261395wma.110.1605036216081;
 Tue, 10 Nov 2020 11:23:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k84sm4147143wmf.42.2020.11.10.11.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 270241FF98;
 Tue, 10 Nov 2020 19:23:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/10] gitlab: move remaining x86 check-tcg targets to
 gitlab
Date: Tue, 10 Nov 2020 19:23:15 +0000
Message-Id: <20201110192316.26397-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
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


