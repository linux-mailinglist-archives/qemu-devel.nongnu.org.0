Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367C14DA05
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 12:43:50 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix8Ef-0007o7-6G
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 06:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ix89y-0001QG-DH
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ix89w-0000Dw-Ee
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:38:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38376)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ix89w-0000Ax-73
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:38:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id a9so3833298wmj.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSz/SlGwFZMMFn8SfLXYWlbCBGKFGhkYUBuW4lw0QDw=;
 b=vU1dS+j0yvywOpHRR4R9fIukGizn57LUpesx6WtsHaL73QwOXPUWeaTbDqkTpCf4tD
 hTS82/wor6CI0kwJWyadC0mKeZXHOiKFpiHbkl6BbMsUkWZibF5QRKcIGbEyU1vINs9P
 QrMnjH9ux+do3aHRtCojSAwJBZbJhmfT/03aJryY9+DLuOwilAr2oKiL+pTNxmDogmd6
 YDR7mRDeSeWdzQP2UK3PnTxexiGMCkTrGr3cr4v6a7B4wHd0dUQokL7XfNpvHQEjFnvP
 jYXlCinCRtZQPLkgcP6eJsjWHjyv81rCIgz8J/orckICmdT3Nkos26jeLJ3ootvQ0WWr
 UhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSz/SlGwFZMMFn8SfLXYWlbCBGKFGhkYUBuW4lw0QDw=;
 b=O8dMW1NWp+b96gecy6iSDciBclCV7D2/NzoyULhWQPbQzBVIp1yYxuDLe8Qj9fQ8jI
 7RNaofmxf+Kf2zb50TFYySgokuwgtr9rd7MugeebeMkM+SE4YIdTN/LcqSPj3jca+V1p
 KpoO9ypodgpbNgnzvtmW3aZ/u5JplORGVFIb7e16OGmol+TbSNmQW4+djTmo8Ritqbsx
 lsIGkoSf2kpXVgXwVULz+UMXWpugdvwv2dcP0Ui6tq/mXqOluanEdLlA+O71ZyxxqSs7
 p8FgpT3zR29C8Q/LSTyXDCUuZkvO5t+cs9MQBST9IiR/X9RySJS8g7yMOZ0b+zE1Tp+a
 1XfA==
X-Gm-Message-State: APjAAAURmOPessduTGxfzr1MdyvIWKrJXdIDmRwvTfofFXnlBXSgGrtG
 1bkqztBRIFC06a3xw324LQZY0g==
X-Google-Smtp-Source: APXvYqy+VkUkoSZcyYWCcI5Etx0Ns63bcOiZA3zLN82C8W5J0OxHxYIdmetcacup7c0Nb91JQGpI9A==
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr5195695wme.79.1580384333715; 
 Thu, 30 Jan 2020 03:38:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a6sm7122920wrm.69.2020.01.30.03.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 03:38:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E03C41FF98;
 Thu, 30 Jan 2020 11:32:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/12] .travis.yml: Add description to each job
Date: Thu, 30 Jan 2020 11:32:19 +0000
Message-Id: <20200130113223.31046-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200130113223.31046-1-alex.bennee@linaro.org>
References: <20200130113223.31046-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The NAME variable can be used to describe nicely a job (see [*]).
As we currently have 32 jobs, use it. This helps for quickly
finding a particular job.

  before: https://travis-ci.org/qemu/qemu/builds/639887646
  after: https://travis-ci.org/philmd/qemu/builds/641795043

[*] https://docs.travis-ci.com/user/customizing-the-build/#naming-jobs-within-matrices

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200125183135.28317-1-f4bug@amsat.org>

---
[ajb]
  - drop [x86]
---
 .travis.yml | 101 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 7526967847..056db1adac 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -96,24 +96,28 @@ after_script:
 
 matrix:
   include:
-    - env:
+    - name: "GCC static (user)"
+      env:
         - CONFIG="--disable-system --static"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
     # we split the system builds as it takes a while to build them all
-    - env:
+    - name: "GCC (main-softmmu)"
+      env:
         - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    - env:
-        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
+    - name: "GCC (other-softmmu)"
+      env:
+       - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
     # Just build tools and run minimal unit and softfloat checks
-    - env:
+    - name: "GCC check-softfloat (user)"
+      env:
         - BASE_CONFIG="--enable-tools"
         - CONFIG="--disable-user --disable-system"
         - TEST_CMD="make check-unit check-softfloat -j3"
@@ -121,41 +125,48 @@ matrix:
 
 
     # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - env:
+    - name: "GCC debug (main-softmmu)"
+      env:
         - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
 
 
     # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - env:
+    - name: "GCC debug (user)"
+      env:
         - CONFIG="--enable-debug-tcg --disable-system"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
-    - env:
+    - name: "GCC some libs disabled (main-softmmu)"
+      env:
         - CONFIG="--disable-linux-aio --disable-cap-ng --disable-attr --disable-brlapi --disable-libusb --disable-replication --target-list=${MAIN_SOFTMMU_TARGETS}"
 
 
     # Module builds are mostly of interest to major distros
-    - env:
+    - name: "GCC modules (main-softmmu)"
+      env:
         - CONFIG="--enable-modules --target-list=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
     # Alternate coroutines implementations are only really of interest to KVM users
     # However we can't test against KVM on Travis so we can only run unit tests
-    - env:
+    - name: "check-unit coroutine=ucontext"
+      env:
         - CONFIG="--with-coroutine=ucontext --disable-tcg"
         - TEST_CMD="make check-unit -j3 V=1"
 
 
-    - env:
+    - name: "check-unit coroutine=sigaltstack"
+      env:
         - CONFIG="--with-coroutine=sigaltstack --disable-tcg"
         - TEST_CMD="make check-unit -j3 V=1"
 
 
     # Check we can build docs and tools (out of tree)
-    - env:
+    - name: "[x86] tools and docs"
+      env:
         - BUILD_DIR="out-of-tree/build/dir" SRC_DIR="../../.."
         - BASE_CONFIG="--enable-tools --enable-docs"
         - CONFIG="--target-list=x86_64-softmmu,aarch64-linux-user"
@@ -169,13 +180,15 @@ matrix:
 
 
     # Test with Clang for compile portability (Travis uses clang-5.0)
-    - env:
+    - name: "Clang (user)"
+      env:
         - CONFIG="--disable-system"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
-    - env:
+    - name: "Clang (main-softmmu)"
+      env:
         - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS} "
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
       compiler: clang
@@ -184,52 +197,60 @@ matrix:
         - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log && exit 1; }
 
 
-    - env:
+    - name: "Clang (other-softmmu)"
+      env:
         - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
     # gprof/gcov are GCC features
-    - env:
+    - name: "GCC gprof/gcov"
+      env:
         - CONFIG="--enable-gprof --enable-gcov --disable-pie --target-list=${MAIN_SOFTMMU_TARGETS}"
       after_success:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
     # We manually include builds which we disable "make check" for
-    - env:
+    - name: "GCC without-default-devices (softmmu)"
+      env:
         - CONFIG="--without-default-devices --disable-user"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
         - TEST_CMD=""
 
 
     # Check the TCG interpreter (TCI)
-    - env:
+    - name: "GCC TCI"
+      env:
         - CONFIG="--enable-debug-tcg --enable-tcg-interpreter --disable-kvm --disable-containers
             --target-list=alpha-softmmu,arm-softmmu,hppa-softmmu,m68k-softmmu,microblaze-softmmu,moxie-softmmu,ppc-softmmu,s390x-softmmu,x86_64-softmmu"
         - TEST_CMD="make check-qtest check-tcg V=1"
 
 
     # We don't need to exercise every backend with every front-end
-    - env:
+    - name: "GCC trace log,simple,syslog (user)"
+      env:
         - CONFIG="--enable-trace-backends=log,simple,syslog --disable-system"
         - TEST_CMD=""
 
 
-    - env:
+    - name: "GCC trace ftrace (x86_64-softmmu)"
+      env:
         - CONFIG="--enable-trace-backends=ftrace --target-list=x86_64-softmmu"
         - TEST_CMD=""
 
 
-    - env:
+    - name: "GCC trace ust (x86_64-softmmu)"
+      env:
         - CONFIG="--enable-trace-backends=ust --target-list=x86_64-softmmu"
         - TEST_CMD=""
 
 
     # MacOSX builds - cirrus.yml also tests some MacOS builds including latest Xcode
 
-    - env:
+    - name: "OSX Xcode 10.3"
+      env:
         - CONFIG="--target-list=i386-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,x86_64-softmmu"
       os: osx
       osx_image: xcode10.3
@@ -252,7 +273,8 @@ matrix:
 
 
     # Python builds
-    - env:
+    - name: "GCC Python 3.5 (x86_64-softmmu)"
+      env:
         - CONFIG="--target-list=x86_64-softmmu"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
       language: python
@@ -260,7 +282,8 @@ matrix:
         - "3.5"
 
 
-    - env:
+    - name: "GCC Python 3.6 (x86_64-softmmu)"
+      env:
         - CONFIG="--target-list=x86_64-softmmu"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
       language: python
@@ -269,7 +292,8 @@ matrix:
 
 
     # Acceptance (Functional) tests
-    - env:
+    - name: "GCC check-acceptance"
+      env:
         - CONFIG="--target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
         - TEST_CMD="make check-acceptance"
       after_script:
@@ -285,7 +309,8 @@ matrix:
 
 
     # Using newer GCC with sanitizers
-    - addons:
+    - name: "GCC9 with sanitizers (softmmu)"
+      addons:
         apt:
           update: true
           sources:
@@ -333,7 +358,8 @@ matrix:
 
 
     # Run check-tcg against linux-user
-    - env:
+    - name: "GCC check-tcg (user)"
+      env:
         - CONFIG="--disable-system --enable-debug-tcg"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
@@ -341,26 +367,30 @@ matrix:
 
     # Run check-tcg against linux-user (with plugins)
     # we skip sparc64-linux-user until it has been fixed somewhat
-    - env:
+    - name: "GCC plugins check-tcg (user)"
+      env:
         - CONFIG="--disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Run check-tcg against softmmu targets
-    - env:
+    - name: "GCC check-tcg (some-softmmu)"
+      env:
         - CONFIG="--enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Run check-tcg against softmmu targets (with plugins)
-    - env:
+    - name: "GCC plugins check-tcg (some-softmmu)"
+      env:
         - CONFIG="--enable-plugins --enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
-    - arch: arm64
+    - name: "[aarch64] GCC check-tcg"
+      arch: arm64
       dist: xenial
       addons:
         apt_packages:
@@ -391,7 +421,8 @@ matrix:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
 
-    - arch: ppc64le
+    - name: "[ppc64] GCC check-tcg"
+      arch: ppc64le
       dist: xenial
       addons:
         apt_packages:
@@ -422,7 +453,8 @@ matrix:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},ppc64le-linux-user"
 
-    - arch: s390x
+    - name: "[s390x] GCC check-tcg"
+      arch: s390x
       dist: bionic
       addons:
         apt_packages:
@@ -456,7 +488,8 @@ matrix:
     # Release builds
     # The make-release script expect a QEMU version, so our tag must start with a 'v'.
     # This is the case when release candidate tags are created.
-    - if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
+    - name: "Release tarball"
+      if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
       env:
         # We want to build from the release tarball
         - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
-- 
2.20.1


