Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACABD346640
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:26:44 +0100 (CET)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOknj-0001hS-JX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN0-0007Bc-Mp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:06 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMs-0005yj-Fz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:06 -0400
Received: by mail-ej1-x629.google.com with SMTP id u21so10301701ejo.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mb2USBz3/rkoafXQjYLvAfykrf4t+4S3CX6XGxj0nMM=;
 b=shO2ITS6nNs2VpaXtci8r+Icv2O9OjgYf+wR0dj8vfuo7a8LltHyyruGc1s17xqrsT
 zauH6geBB+QonpD9ymkmUzakD9NLh2Zv+ckXgsKbX8B+aRi3jhKOlEU8502XRJkOysxs
 ER7G8r8P6z9iZvp1iZxY6xfqWXlgpVYEVvF8cmMrDFYQzNz9WCbmkB13+TU2wxHBQsJA
 WGB04wit6YGkuQCndMYFOCqSwb5OQDijOrIO3x2wMJKiCI2PRA/mcq4xLwhJ0SbgRkO8
 6oaKu7UYKWSXIYSA7s72e1GmmJSVXEbqswbA7MHBcc1Jn1EhquejaXrzoFFDu2SUV2ua
 WleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mb2USBz3/rkoafXQjYLvAfykrf4t+4S3CX6XGxj0nMM=;
 b=n7X3o+3N4llhjSqx1SO8B8/nddNMyjjnG0V6Atrfvt9RrEe9lsHBmqzYT5k32X5SlJ
 tY/YPkj7sQFcGJY3fBEwL7hnhqp0P0u4KYEE8pZkSa6Q5fsfUOhsCcBSed8xX+zLrvhs
 FCO9zog1NVT9vl0wo8MFdGizwG1imFaF707pAaBBN5U4S+O8qJSBbp4cO5Yuybuq6Wnq
 G6iuHfSX/e/8PinBGZPNclmp6QbqXx8wyhasLJhDWl5yThZm8bjUyQXkDdM45dCbEG/g
 qn19DIt64antuFY9enpI/IiAAr7WKQsPZGPG52565RPOC47fvPwSMJRh9FqspBCp40me
 8A8A==
X-Gm-Message-State: AOAM533rq8F1BeULsfJVCs+pP7FuApm2KusvqvejVFDWShVF51dyZUSP
 YdV5D0PMKO0Sx7Rpul6L2sOBwfu4fsrnkH2K
X-Google-Smtp-Source: ABdhPJwCC7FZWhS5NiBDOKpvCBLHXm07xFz2+oxRUUOUDfGO5i4uXFjA2cYEv1gFhHS+HTJJS0+97w==
X-Received: by 2002:a17:906:5902:: with SMTP id
 h2mr5835872ejq.416.1616518736672; 
 Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u13sm11392727ejy.31.2021.03.23.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 126131FFAA;
 Tue, 23 Mar 2021 16:53:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 22/22] gitlab: default to not building the documentation
Date: Tue, 23 Mar 2021 16:53:08 +0000
Message-Id: <20210323165308.15244-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
Debian") we made sure we can build the documents on more than one
system. However we don't want to build documents all the time as it's
a waste of cycles (and energy). So lets reduce the total amount of
documentation we build while still keeping coverage of at least one
build on each supported target.

Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from Travis")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v2
  - enable for OpenSUSE LEAP and Centos8 as well
  - disable for all cross builds
  - minor re-word of the commit text
v3
  - revert: enable for OpenSUSE LEAP and Centos8 as well
---
 .gitlab-ci.d/crossbuilds.yml | 15 ++++++++-------
 .gitlab-ci.yml               | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d5098c986b..2d95784ed5 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -6,10 +6,10 @@
     - mkdir build
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
-        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
-          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
-          ppc-softmmu sh4-softmmu xtensa-softmmu"
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
+          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
+          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 # Job to cross-build specific accelerators.
@@ -25,8 +25,8 @@
     - mkdir build
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
-        --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
@@ -36,7 +36,8 @@
     - mkdir build
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-system
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9ffbaa7ffb..3480d79db3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -23,9 +23,9 @@ include:
     - cd build
     - if test -n "$TARGETS";
       then
-        ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS" ;
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
-        ../configure --enable-werror $CONFIGURE_ARGS ;
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
@@ -119,7 +119,7 @@ build-system-ubuntu:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
+    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -607,7 +607,7 @@ tsan-build:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
+    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
@@ -619,7 +619,7 @@ build-deprecated:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-docs --disable-tools
+    CONFIGURE_ARGS: --disable-tools
     MAKE_CHECK_ARGS: build-tcg
     TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
   artifacts:
-- 
2.20.1


