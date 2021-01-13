Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834852F4E72
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:24:36 +0100 (CET)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi0h-0005sb-J4
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqu-0005oF-9n
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqr-000086-Un
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d26so2475051wrb.12
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g895hxsUwOXrvd8TSIiWjoS25vv/WAOJ38vrkhw936E=;
 b=jpdmfZcBkp2/iQ6L6VOmDwMCp9zH1Wfxkw+1Kuat6Zs+W67cHm/Ww+ZXZ4iLmXCGPh
 z68dap7/6vylCXB1WQ4iKgZ9koVu/yXnZsNYeBu6csuG5PC8C1kEyqnYgZC0CPWEz3Rv
 14GbEFwhaEBqev67eMhpFizUtmS4asGsQHBWHXAXUTG1dpHfaGzwwmEPOJDc8uRiv2X3
 D+ty0yvrzzsMsUrA9kdBiDUTBtyrU/7Y0jnI+TXX5XpOdR8l87HO2mp1vCajy1YKPFwd
 ysKfcfJzrHZofk1hmBdVnyUS0AvIF2oZXDlvYhcgU/YJwVsj5tzxjnT9b1Hc57gNvdE6
 JUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g895hxsUwOXrvd8TSIiWjoS25vv/WAOJ38vrkhw936E=;
 b=XaLT6uD5n5EBZfSBHnE9o3YbuZuZrW5wfpK+WxVGkAWykeuBn1fCrLBNvS4UpgtITG
 SOit5C4Vpdqw5EYDYeIk+X1e6wLabA5GYNktBYpdFv4DtN2WlvZ+iXK5nqWh4njt4pRn
 Mkx1my8t7cJJSegp5MjY4I6c5yyW9xDF7r3j7aE3B78lcmWjTCwbL0jIJBt+VqVIq1HS
 tds3He0EsYIG/gWJ1B4ld5D9XTpmHXEeTv3/9SiFp09NsED/tjjaOzWO/GVFlvbw3w5U
 9CwmHkisj7Z7cgB6pXOQ0q8oc2Z2Rr5AoVUbSomtQA5akyjXWlNUNuZW8YW5I39F2zWQ
 Y1WA==
X-Gm-Message-State: AOAM533D5MMXeLy1eWw3GL8V1NhUW5mX/Mr0vW1ySl9RuOxPryAyD2Fe
 94R68Ii/GHJO7G5Yz0Zj3j40tg==
X-Google-Smtp-Source: ABdhPJx/aAz7Wpy+0E86WerStdrv3jALayrCBGJ6LTDezp1hDYOzDZRZ8VnBaRJadqm+0uDMM6U4yQ==
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr3102456wrg.322.1610550864583; 
 Wed, 13 Jan 2021 07:14:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm3288965wmk.12.2021.01.13.07.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 629B71FF98;
 Wed, 13 Jan 2021 15:14:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 9/9] gitlab: move docs and tools build across from Travis
Date: Wed, 13 Jan 2021 15:14:08 +0000
Message-Id: <20210113151408.27939-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it we might as well check the tag generation. For
bonus points we run GNU globals htags into the public pages directory
for publishing with the auto generated pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 22 ++++++++++++++++------
 .travis.yml    | 16 ----------------
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4532f1718a..c07064a4f7 100644
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
+    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
+    CONFIGURE_ARGS: --enable-docs --enable-tools
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 acceptance-system-debian:
   <<: *native_test_job_definition
   needs:
@@ -597,13 +606,14 @@ build-libvhost-user:
     - ninja
 
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
+    - mkdir -p public/src
+    - htags --suggest --tree-view=filetree -m qemu_init
+        -t "Welcome to the QEMU source code" public/src
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


