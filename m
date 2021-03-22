Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3E344DD9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:55:43 +0100 (CET)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOmE-00077h-8E
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOjP-0005QQ-Dc
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:52:47 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOjN-0001Zx-7r
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:52:47 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b7so22754067ejv.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=909VI7yvf+DrBeOUn32D7EW3XfbdNiPpbl6O0n5XVvw=;
 b=oGgZsYp9cDcTPR124L0v6MhUFSM++MqdZNQQgyMl3I1iPllRXQbngLYl/8NCdrmJ6B
 9Ogp5pOygpqWgbeVoyE0mWtTkOwLNCLG2zK9Z0XLDBZA/bDC/5ia9huT8zAaNQePFVGX
 E3v/hScQzcuGRdzzlm/ZaC7t67xm+nU174APGE9NCIZ/PN5a2J8GbRoat5aHcIn9Y4cK
 8HkOlVmUy+H68WdsXBRDm4t3n9pmV7PXnXwk+Xmvwe8Z7R0abvMuUFUlTIxii/1vpRKq
 w3ruqdb3N4Cy9Tu3vkz3wzFdZT5Rg36Kg4McVc4amqZDFl1enDQAgmO3fjfTYnn2crKT
 +jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=909VI7yvf+DrBeOUn32D7EW3XfbdNiPpbl6O0n5XVvw=;
 b=a2PdzE+8sjCKCjQqf3dMkOW5lclHhpNH43cwnR3gX9UD4qlY0I7i3h5/vMRlOqDYb1
 XO83IE55o1Q4f6vGqRjl3yw1pGAFk5+BDPaVBtP+I/5Me+bhwDwjG0ce8qUjjrv5caaT
 fdnR/vJnTrbjhizJbLVVPHWW0ApvRqvHoICq68/RadQEL4Exm0mVCWpMhph05VCW/OA2
 MskrDdpnFHEyeFAZTpniQip+Cm3VnBs+2wsfQulj50pJdiRcX6vlD7hjfWvJL8TOnZxf
 fmLn3V+GTDMPCFge5N8DNIUvd759lKBtjVpktrhGg/aYIo6ycR94M7Zb+rI8B9ICTM7y
 Okdg==
X-Gm-Message-State: AOAM530P7G7eQZfJybrHdCz48UbHqEjeXpvVFiJxhpVEhJMMuX2Xj3P3
 epQb68fH/UrpHDh7z0HhCENqWQ==
X-Google-Smtp-Source: ABdhPJxnBVGr5L7B5sO/73hbPZ7XtUcgFoJHNwJ/eqXXm0Rw+4T/mUXzSnZjXgkWtR7ypVcsOsf0tw==
X-Received: by 2002:a17:906:5a8f:: with SMTP id
 l15mr1002538ejq.462.1616435563718; 
 Mon, 22 Mar 2021 10:52:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm11854526edu.12.2021.03.22.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:52:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF3CA1FF7E;
 Mon, 22 Mar 2021 17:52:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] gitlab: default to not building the documentation
Date: Mon, 22 Mar 2021 17:52:38 +0000
Message-Id: <20210322175238.4503-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
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

---
v2
  - enable for OpenSUSE LEAP and Centos8 as well
  - disable for all cross builds
  - minor re-word of the commit text
---
 .gitlab-ci.d/crossbuilds.yml | 15 ++++++++-------
 .gitlab-ci.yml               | 16 ++++++++--------
 2 files changed, 16 insertions(+), 15 deletions(-)

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
index 9ffbaa7ffb..c9c4079dbb 100644
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
@@ -223,7 +223,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
-                    --enable-modules
+                    --enable-modules --enable-docs
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -257,7 +257,7 @@ build-system-opensuse:
     job: amd64-opensuse-leap-container
   variables:
     IMAGE: opensuse-leap
-    CONFIGURE_ARGS: --enable-fdt=system
+    CONFIGURE_ARGS: --enable-docs --enable-fdt=system
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
   artifacts:
@@ -443,7 +443,7 @@ build-user-centos7:
     job: amd64-centos7-container
   variables:
     IMAGE: centos7
-    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
+    CONFIGURE_ARGS: --disable-system --disable-tools
     MAKE_CHECK_ARGS: check-tcg
 
 build-some-softmmu-plugins:
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


