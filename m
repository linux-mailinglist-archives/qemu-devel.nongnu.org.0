Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870BA347B2A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:53:01 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4sW-0007xD-ED
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f8-0000ON-GS
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f6-0003Sv-H2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o16so24720910wrn.0
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPq46WkfMIfhC+35R00H1uei8HDXcw6U7w4p2WsTbhg=;
 b=nB2cswVC45QUTOKs/4MngkHLUP/iy5f+QR35lPRFBcwaJY61goUkgW86cAFOOdqDIf
 K1D/nP2G5BEt5OpC5DDIIWafkG8TBaY533VnCLmEoP7CuO5gEQwPEu+xtRbmb65Q7Rxn
 iCyIjPc90vZE5ugHD04PTOCvkRKoAtlpSRQiuE4ACI7yaw0rV33rFmnLR6x+/gvh9aBe
 XIRQJ72k6ygOJYKqGmI6BuztCvzFsQ8nnDFEyvDXmzAWsdf80fhmDIcC3tEUGnzRPmzG
 aZzAokG/cBB3wwSb2gt1L25YzSMdIFK6qUazo0Nqi4JPjdUOosldlF+N5/C4+qolV+0H
 zDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPq46WkfMIfhC+35R00H1uei8HDXcw6U7w4p2WsTbhg=;
 b=QCM7CCt/Lmgmw4RiLbJrseArfpnoe0AVcsGOFyMScKWF0aQwDsbt64tzER2ioEtEIs
 T9VMgB6SVsaNetaXO+znuMgzKDWQYwykBkjyKygMkawzuD007iTszltENgU5+r4nS6Ae
 AekP0Z93GP9woW38EK1FpgQZgJGgVnubQ+8trQc/yxfBUR948iaw/a9malgolPZGL9tw
 AATpEZfxnHvehtr4oGfuMN7z1Xt0hTxrXa5CtfAsFabXKp3CCn2idI3EOfk6I8KpROYw
 RS4Bnc/prIfXjfuQGtbqlcOBgI90hS81ABguDYQS49tY94LDseYerwWWqxyBCPEtAPEq
 IPtg==
X-Gm-Message-State: AOAM532kpFQXD+Cyvs3VR5DAqStMH4dB0XeaeYiP5jF9IuMTBfgWlN5d
 RphPfho6NTrOaANQ9BuV7MhJHg==
X-Google-Smtp-Source: ABdhPJy/XJ+TFC2vFjQJa6Vaze831+EtsdTwIkiQTB9W5/kwH6zMpviZcmvo5d+WMdjmKcskWLO3Aw==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr3932320wrc.122.1616596747280; 
 Wed, 24 Mar 2021 07:39:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm2553789wmq.11.2021.03.24.07.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:39:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E35CC1FFAB;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/22] gitlab: default to not building the documentation
Date: Wed, 24 Mar 2021 14:30:21 +0000
Message-Id: <20210324143021.8560-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Message-Id: <20210323165308.15244-23-alex.bennee@linaro.org>

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


