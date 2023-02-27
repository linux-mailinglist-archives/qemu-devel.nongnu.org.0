Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC76A40EC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpQ-0007JP-AQ; Mon, 27 Feb 2023 06:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboY-0005uO-Qu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboW-0005jM-K2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wY+HDwN8bbEHeKW+vGRSD/QSrfsqyGRGORgCIreSnTg=;
 b=fYWIM+3CN8r+QIHVyqJcQ2SpMyErPRP2dqVvl5k5K6eyirtVAZMQlEaB3A4Paev7GWwEE/
 L7Fg9bGe8lUCV55oKzlXbxbtad6QGZJgixkR03iptVzWHm4d77GcTELTXOgoFwTm53E5vy
 devgvH/B/WjTBc3WyZxQwnMjGbnA1co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-wg358C5GOPKqjJ55yfYhxA-1; Mon, 27 Feb 2023 06:37:00 -0500
X-MC-Unique: wg358C5GOPKqjJ55yfYhxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88836811E6E;
 Mon, 27 Feb 2023 11:37:00 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8E2C1121314;
 Mon, 27 Feb 2023 11:36:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 31/33] gitlab-ci.d: Build with --enable-fdt=system by default
Date: Mon, 27 Feb 2023 12:36:19 +0100
Message-Id: <20230227113621.58468-32-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By using --enable-fdt=system we can make sure that the configure
script does not try to check out the "dtc" submodule. This should
help to safe some precious CI minutes in the long run.

While we're at it, also drop some now-redundant --enable-slirp
and --enable-capstone statements. These used to have the "=system"
suffix in the past, too, which has been dropped when the their
corresponding submodules had been removed. Since these features
are auto-enabled anyway now (since the containers have the right
libraries installed), we do not need the explicit --enable-...
statements anymore.

Message-Id: <20230207201447.566661-6-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml  | 2 +-
 .gitlab-ci.d/buildtest.yml           | 9 +++------
 .gitlab-ci.d/crossbuild-template.yml | 5 +++--
 .gitlab-ci.d/crossbuilds.yml         | 2 ++
 .gitlab-ci.d/windows.yml             | 7 +++++--
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 4a922d9c33..cb96b55c3f 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -11,7 +11,7 @@
       fi
     - mkdir build
     - cd build
-    - ../configure --enable-werror --disable-docs
+    - ../configure --enable-werror --disable-docs --enable-fdt=system
           ${LD_JOBS:+--meson=git} ${TARGETS:+--target-list="$TARGETS"}
           $CONFIGURE_ARGS ||
       { cat config.log meson-logs/meson-log.txt && exit 1; }
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8697c61072..d903c42798 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -41,7 +41,7 @@ build-system-ubuntu:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-capstone
+    CONFIGURE_ARGS: --enable-docs
     TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -120,7 +120,6 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-             --enable-fdt=system --enable-slirp --enable-capstone
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -166,9 +165,8 @@ build-system-centos:
     job: amd64-centos8-container
   variables:
     IMAGE: centos8
-    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-vfio-user-server
       --enable-modules --enable-trace-backends=dtrace --enable-docs
-      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -201,7 +199,6 @@ build-system-opensuse:
     job: amd64-opensuse-leap-container
   variables:
     IMAGE: opensuse-leap
-    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
   artifacts:
@@ -464,7 +461,7 @@ tsan-build:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
-          --enable-trace-backends=ust --enable-fdt=system --disable-slirp
+          --enable-trace-backends=ust --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 6d709628f1..d07989e3b0 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -6,8 +6,9 @@
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
+    - ../configure --enable-werror --disable-docs --enable-fdt=system
+        --disable-user $QEMU_CONFIGURE_OPTS $EXTRA_CONFIGURE_OPTS
+        --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
           sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 57637c5127..101416080c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -175,6 +175,7 @@ cross-win32-system:
     job: win32-fedora-cross-container
   variables:
     IMAGE: fedora-win32-cross
+    EXTRA_CONFIGURE_OPTS: --enable-fdt=internal
     CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu
                         microblazeel-softmmu mips64el-softmmu nios2-softmmu
   artifacts:
@@ -187,6 +188,7 @@ cross-win64-system:
     job: win64-fedora-cross-container
   variables:
     IMAGE: fedora-win64-cross
+    EXTRA_CONFIGURE_OPTS: --enable-fdt=internal
     CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu
                         m68k-softmmu microblazeel-softmmu nios2-softmmu
                         or1k-softmmu rx-softmmu sh4eb-softmmu sparc64-softmmu
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index cf445b77f6..87235e43b4 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -38,6 +38,7 @@ msys2-64bit:
       mingw-w64-x86_64-capstone
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-cyrus-sasl
+      mingw-w64-x86_64-dtc
       mingw-w64-x86_64-gcc
       mingw-w64-x86_64-glib2
       mingw-w64-x86_64-gnutls
@@ -71,7 +72,7 @@ msys2-64bit:
   # for the msys2 64-bit job, due to the build could not complete within
   # the project timeout.
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
-      --without-default-devices'
+      --without-default-devices --enable-fdt=system'
   - ..\msys64\usr\bin\bash -lc 'make'
   # qTests don't run successfully with "--without-default-devices",
   # so let's exclude the qtests from CI for now.
@@ -86,6 +87,7 @@ msys2-32bit:
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
+      mingw-w64-i686-dtc
       mingw-w64-i686-gcc
       mingw-w64-i686-glib2
       mingw-w64-i686-gnutls
@@ -113,7 +115,8 @@ msys2-32bit:
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
+                                --enable-fdt=system'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" ||
                                 { cat meson-logs/testlog.txt; exit 1; }'
-- 
2.31.1


