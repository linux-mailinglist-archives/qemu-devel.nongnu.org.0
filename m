Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1031512A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:03:53 +0100 (CET)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TcO-0003o1-Kh
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPZ-0002NL-LT
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9TPU-00057v-Bl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdVBPzUOkfHNXPNoMvrb004CFMB59V+ej0rdxYBWtRk=;
 b=cq9mD2aysstJmEExXz7X33vq/Gs0FWnafe8lgWkgDHjuaEtYuBzvlqpnIpCFLGN7cpSOL7
 qV2SJfeSxDAjs5hks+Yaaw6ceqa8dVMAFdeaYl7quupk9OWjvVFIaqF6n2TU+7UF+sdhYo
 W9d4bbr+uvEZJ5KUBF/Q34gfOlpbTiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-7nbnJYy3NZGNot7v8c1V_Q-1; Tue, 09 Feb 2021 08:50:24 -0500
X-MC-Unique: 7nbnJYy3NZGNot7v8c1V_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85B9195D570;
 Tue,  9 Feb 2021 13:50:22 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-66.ams2.redhat.com
 [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF725D9C0;
 Tue,  9 Feb 2021 13:50:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] travis: remove travis configuration and all references to
 Travis CI
Date: Tue,  9 Feb 2021 13:50:11 +0000
Message-Id: <20210209135011.1224992-3-berrange@redhat.com>
In-Reply-To: <20210209135011.1224992-1-berrange@redhat.com>
References: <20210209135011.1224992-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Travis CI system QEMU has been using has removed the unlimited free
usage model, replacing it with a one-time only grant of CI minutes that
is not renewed. The QEMU CI jobs quickly exhaust maintainer's free CI
credits, leaving them unable to test with Travis. This is not a
sustainable situation, so we have no choice by to discontinue use of
Travis. GitLab CI is now the primary target, with Cirrus CI filling
in some platform gaps where needed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .travis.yml                        | 439 -----------------------------
 MAINTAINERS                        |   3 -
 configure                          |   1 -
 contrib/gitdm/filetypes.txt        |   2 +-
 scripts/travis/coverage-summary.sh |  27 --
 tests/docker/docker.py             |   2 +-
 tests/qemu-iotests/079             |   2 +-
 tests/test-util-filemonitor.c      |  11 -
 8 files changed, 3 insertions(+), 484 deletions(-)
 delete mode 100644 .travis.yml
 delete mode 100755 scripts/travis/coverage-summary.sh

diff --git a/.travis.yml b/.travis.yml
deleted file mode 100644
index 5f1dea873e..0000000000
--- a/.travis.yml
+++ /dev/null
@@ -1,439 +0,0 @@
-# The current Travis default is a VM based 16.04 Xenial on GCE
-# Additional builds with specific requirements for a full VM need to
-# be added as additional matrix: entries later on
-os: linux
-dist: focal
-language: c
-compiler:
-  - gcc
-cache:
-  # There is one cache per branch and compiler version.
-  # characteristics of each job are used to identify the cache:
-  # - OS name (currently only linux)
-  # - OS distribution (for Linux, bionic or focal)
-  # - Names and values of visible environment variables set in .travis.yml or Settings panel
-  timeout: 1200
-  ccache: true
-  pip: true
-  directories:
-  - $HOME/avocado/data/cache
-
-
-addons:
-  apt:
-    packages:
-      # Build dependencies
-      - libaio-dev
-      - libattr1-dev
-      - libbrlapi-dev
-      - libcap-ng-dev
-      - libgcc-7-dev
-      - libgnutls28-dev
-      - libgtk-3-dev
-      - libiscsi-dev
-      - liblttng-ust-dev
-      - libncurses5-dev
-      - libnfs-dev
-      - libnss3-dev
-      - libpixman-1-dev
-      - libpng-dev
-      - librados-dev
-      - libsdl2-dev
-      - libsdl2-image-dev
-      - libseccomp-dev
-      - libspice-protocol-dev
-      - libspice-server-dev
-      - libssh-dev
-      - liburcu-dev
-      - libusb-1.0-0-dev
-      - libvdeplug-dev
-      - libvte-2.91-dev
-      - libzstd-dev
-      - ninja-build
-      - sparse
-      - uuid-dev
-      - gcovr
-      # Tests dependencies
-      - genisoimage
-
-
-# The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
-# to prevent IRC notifications from forks. This was created using:
-# $ travis encrypt -r "qemu/qemu" "irc.oftc.net#qemu"
-notifications:
-  irc:
-    channels:
-      - secure: "F7GDRgjuOo5IUyRLqSkmDL7kvdU4UcH3Lm/W2db2JnDHTGCqgEdaYEYKciyCLZ57vOTsTsOgesN8iUT7hNHBd1KWKjZe9KDTZWppWRYVwAwQMzVeSOsbbU4tRoJ6Pp+3qhH1Z0eGYR9ZgKYAoTumDFgSAYRp4IscKS8jkoedOqM="
-    on_success: change
-    on_failure: always
-
-
-env:
-  global:
-    - SRC_DIR=".."
-    - BUILD_DIR="build"
-    - BASE_CONFIG="--disable-docs --disable-tools"
-    - TEST_BUILD_CMD=""
-    - TEST_CMD="make check V=1"
-    # This is broadly a list of "mainline" softmmu targets which have support across the major distros
-    - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
-    - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
-    - CCACHE_MAXSIZE=1G
-    - G_MESSAGES_DEBUG=error
-
-
-git:
-  # we want to do this ourselves
-  submodules: false
-
-# Common first phase for all steps
-before_install:
-  - if command -v ccache ; then ccache --zero-stats ; fi
-  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
-  - echo "=== Using ${JOBS} simultaneous jobs ==="
-
-# Configure step - may be overridden
-before_script:
-  - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-  - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-# Main build & test - rarely overridden - controlled by TEST_CMD
-script:
-  - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
-  - |
-    if [ "$BUILD_RC" -eq 0 ] && [ -n "$TEST_BUILD_CMD" ]; then
-        ${TEST_BUILD_CMD} || BUILD_RC=$?
-    else
-        $(exit $BUILD_RC);
-    fi
-  - |
-    if [ "$BUILD_RC" -eq 0 ] ; then
-        ${TEST_CMD} ;
-    else
-        $(exit $BUILD_RC);
-    fi
-after_script:
-  - df -h
-  - if command -v ccache ; then ccache --show-stats ; fi
-
-
-jobs:
-  include:
-    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - name: "GCC debug (main-softmmu)"
-      env:
-        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-
-
-    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - name: "GCC debug (user)"
-      env:
-        - CONFIG="--enable-debug-tcg --disable-system"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
-
-    # Module builds are mostly of interest to major distros
-    - name: "GCC modules (main-softmmu)"
-      env:
-        - CONFIG="--enable-modules --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
-    # Test with Clang for compile portability (Travis uses clang-5.0)
-    - name: "Clang (user)"
-      env:
-        - CONFIG="--disable-system --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
-    - name: "Clang (main-softmmu)"
-      env:
-        - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
-      compiler: clang
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
-    - name: "Clang (other-softmmu)"
-      env:
-        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
-    # gprof/gcov are GCC features
-    - name: "GCC gprof/gcov"
-      dist: bionic
-      addons:
-        apt:
-          packages:
-            - ninja-build
-      env:
-        - CONFIG="--enable-gprof --enable-gcov --disable-libssh
-                  --target-list=${MAIN_SOFTMMU_TARGETS}"
-      after_success:
-        - ${SRC_DIR}/scripts/travis/coverage-summary.sh
-
-
-    # Using newer GCC with sanitizers
-    - name: "GCC9 with sanitizers (softmmu)"
-      dist: bionic
-      addons:
-        apt:
-          update: true
-          sources:
-            # PPAs for newer toolchains
-            - ubuntu-toolchain-r-test
-          packages:
-            # Extra toolchains
-            - gcc-9
-            - g++-9
-            # Build dependencies
-            - libaio-dev
-            - libattr1-dev
-            - libbrlapi-dev
-            - libcap-ng-dev
-            - libgnutls28-dev
-            - libgtk-3-dev
-            - libiscsi-dev
-            - liblttng-ust-dev
-            - libnfs-dev
-            - libncurses5-dev
-            - libnss3-dev
-            - libpixman-1-dev
-            - libpng-dev
-            - librados-dev
-            - libsdl2-dev
-            - libsdl2-image-dev
-            - libseccomp-dev
-            - libspice-protocol-dev
-            - libspice-server-dev
-            - liburcu-dev
-            - libusb-1.0-0-dev
-            - libvte-2.91-dev
-            - ninja-build
-            - sparse
-            - uuid-dev
-      language: generic
-      compiler: none
-      env:
-        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
-        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-linux-user"
-        - TEST_CMD=""
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
-    - name: "[aarch64] GCC check-tcg"
-      arch: arm64
-      dist: focal
-      addons:
-        apt_packages:
-          - libaio-dev
-          - libattr1-dev
-          - libbrlapi-dev
-          - libcap-ng-dev
-          - libgcrypt20-dev
-          - libgnutls28-dev
-          - libgtk-3-dev
-          - libiscsi-dev
-          - liblttng-ust-dev
-          - libncurses5-dev
-          - libnfs-dev
-          - libnss3-dev
-          - libpixman-1-dev
-          - libpng-dev
-          - librados-dev
-          - libsdl2-dev
-          - libseccomp-dev
-          - liburcu-dev
-          - libusb-1.0-0-dev
-          - libvdeplug-dev
-          - libvte-2.91-dev
-          - ninja-build
-          # Tests dependencies
-          - genisoimage
-      env:
-        - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - UNRELIABLE=true
-
-    - name: "[ppc64] GCC check-tcg"
-      arch: ppc64le
-      dist: focal
-      addons:
-        apt_packages:
-          - libaio-dev
-          - libattr1-dev
-          - libbrlapi-dev
-          - libcap-ng-dev
-          - libgcrypt20-dev
-          - libgnutls28-dev
-          - libgtk-3-dev
-          - libiscsi-dev
-          - liblttng-ust-dev
-          - libncurses5-dev
-          - libnfs-dev
-          - libnss3-dev
-          - libpixman-1-dev
-          - libpng-dev
-          - librados-dev
-          - libsdl2-dev
-          - libseccomp-dev
-          - liburcu-dev
-          - libusb-1.0-0-dev
-          - libvdeplug-dev
-          - libvte-2.91-dev
-          - ninja-build
-          # Tests dependencies
-          - genisoimage
-      env:
-        - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=ppc64-softmmu,ppc64le-linux-user"
-
-    - name: "[s390x] GCC check-tcg"
-      arch: s390x
-      dist: bionic
-      addons:
-        apt_packages:
-          - libaio-dev
-          - libattr1-dev
-          - libbrlapi-dev
-          - libcap-ng-dev
-          - libgcrypt20-dev
-          - libgnutls28-dev
-          - libgtk-3-dev
-          - libiscsi-dev
-          - liblttng-ust-dev
-          - libncurses5-dev
-          - libnfs-dev
-          - libnss3-dev
-          - libpixman-1-dev
-          - libpng-dev
-          - librados-dev
-          - libsdl2-dev
-          - libseccomp-dev
-          - liburcu-dev
-          - libusb-1.0-0-dev
-          - libvdeplug-dev
-          - libvte-2.91-dev
-          - ninja-build
-          # Tests dependencies
-          - genisoimage
-      env:
-        - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
-        - UNRELIABLE=true
-      script:
-        - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
-        - |
-          if [ "$BUILD_RC" -eq 0 ] ; then
-              mv pc-bios/s390-ccw/*.img pc-bios/ ;
-              ${TEST_CMD} ;
-          else
-              $(exit $BUILD_RC);
-          fi
-
-    - name: "[s390x] GCC (other-softmmu)"
-      arch: s390x
-      dist: bionic
-      addons:
-        apt_packages:
-          - libaio-dev
-          - libattr1-dev
-          - libcap-ng-dev
-          - libgnutls28-dev
-          - libiscsi-dev
-          - liblttng-ust-dev
-          - liblzo2-dev
-          - libncurses-dev
-          - libnfs-dev
-          - libnss3-dev
-          - libpixman-1-dev
-          - libsdl2-dev
-          - libsdl2-image-dev
-          - libseccomp-dev
-          - libsnappy-dev
-          - libzstd-dev
-          - nettle-dev
-          - xfslibs-dev
-          - ninja-build
-          # Tests dependencies
-          - genisoimage
-      env:
-        - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
-                  --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
-
-    - name: "[s390x] GCC (user)"
-      arch: s390x
-      dist: bionic
-      addons:
-        apt_packages:
-          - libgcrypt20-dev
-          - libgnutls28-dev
-          - ninja-build
-      env:
-        - CONFIG="--disable-containers --disable-system"
-
-    - name: "[s390x] Clang (disable-tcg)"
-      arch: s390x
-      dist: bionic
-      compiler: clang
-      addons:
-        apt_packages:
-          - libaio-dev
-          - libattr1-dev
-          - libbrlapi-dev
-          - libcap-ng-dev
-          - libgcrypt20-dev
-          - libgnutls28-dev
-          - libgtk-3-dev
-          - libiscsi-dev
-          - liblttng-ust-dev
-          - libncurses5-dev
-          - libnfs-dev
-          - libnss3-dev
-          - libpixman-1-dev
-          - libpng-dev
-          - librados-dev
-          - libsdl2-dev
-          - libseccomp-dev
-          - liburcu-dev
-          - libusb-1.0-0-dev
-          - libvdeplug-dev
-          - libvte-2.91-dev
-          - ninja-build
-      env:
-        - TEST_CMD="make check-unit"
-        - CONFIG="--disable-containers --disable-tcg --enable-kvm
-                  --disable-tools --host-cc=clang --cxx=clang++"
-        - UNRELIABLE=true
-
-    # Release builds
-    # The make-release script expect a QEMU version, so our tag must start with a 'v'.
-    # This is the case when release candidate tags are created.
-    - name: "Release tarball"
-      if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
-      env:
-        # We want to build from the release tarball
-        - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--prefix=$PWD/dist"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-softmmu,armeb-linux-user,ppc-linux-user"
-        - TEST_CMD="make install -j${JOBS}"
-        - QEMU_VERSION="${TRAVIS_TAG:1}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      script:
-        - make -C ${SRC_DIR} qemu-${QEMU_VERSION}.tar.bz2
-        - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
-        - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
-        - mkdir -p release-build && cd release-build
-        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
-        - make install
-  allow_failures:
-    - env: UNRELIABLE=true
diff --git a/MAINTAINERS b/MAINTAINERS
index 06635ba81a..6fb0d9aafa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3208,13 +3208,10 @@ M: Fam Zheng <fam@euphon.net>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
-F: .travis.yml
-F: scripts/travis/
 F: .shippable.yml
 F: tests/docker/
 F: tests/vm/
 F: scripts/archive-source.sh
-W: https://travis-ci.org/qemu/qemu
 W: https://app.shippable.com/github/qemu/qemu
 W: http://patchew.org/QEMU/
 
diff --git a/configure b/configure
index 7c496d81fc..058a7c7967 100755
--- a/configure
+++ b/configure
@@ -4872,7 +4872,6 @@ fi
 ########################################
 # See if __attribute__((alias)) is supported.
 # This false for Xcode 9, but has been remedied for Xcode 10.
-# Unfortunately, travis uses Xcode 9 by default.
 
 attralias=no
 cat > $TMPC << EOF
diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index d2d6f6db8d..bb29166aed 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -81,7 +81,7 @@ filetype tests \.out\.nocache$
 filetype tests \.err$
 filetype tests \.exit$      # bad-if-FOO.exit etc
 filetype tests \.decode$
-filetype tests \.yml$        # travis/shippable config
+filetype tests \.yml$        # gitlab/shippable config
 
 #
 # Development documentation files (for hacking generally)
diff --git a/scripts/travis/coverage-summary.sh b/scripts/travis/coverage-summary.sh
deleted file mode 100755
index d7086cf9ca..0000000000
--- a/scripts/travis/coverage-summary.sh
+++ /dev/null
@@ -1,27 +0,0 @@
-#!/bin/sh
-#
-# Author: Alex Bennée <alex.bennee@linaro.org>
-#
-# Summerise the state of code coverage with gcovr and tweak the output
-# to be more sane on Travis hosts. As we expect to be executed on a
-# throw away CI instance we do spam temp files all over the shop. You
-# most likely don't want to execute this script but just call gcovr
-# directly. See also "make coverage-report"
-#
-# This code is licensed under the GPL version 2 or later.  See
-# the COPYING file in the top-level directory.
-
-# first generate the coverage report
-gcovr -p -o raw-report.txt
-
-# strip the full-path and line markers
-sed s@$PWD\/@@ raw-report.txt | sed s/[0-9]\*[,-]//g > simplified.txt
-
-# reflow lines that got split
-awk '/.[ch]$/ { printf("%s", $0); next } 1' simplified.txt > rejoined.txt
-
-# columnify
-column -t rejoined.txt > final.txt
-
-# and dump, stripping out 0% coverage
-grep -v "0%" final.txt
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..bb42b32a9b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -228,7 +228,7 @@ class Docker(object):
     def __init__(self):
         self._command = _guess_engine_command()
 
-        if "docker" in self._command and "TRAVIS" not in os.environ:
+        if "docker" in self._command:
             os.environ["DOCKER_BUILDKIT"] = "1"
             self._buildkit = True
         else:
diff --git a/tests/qemu-iotests/079 b/tests/qemu-iotests/079
index 793e1f9d08..7f758c0f9a 100755
--- a/tests/qemu-iotests/079
+++ b/tests/qemu-iotests/079
@@ -40,7 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file nfs fuse
 
-# Some containers (e.g. non-x86 on Travis) do not allow large files
+# Some environments may not allow large files
 _require_large_file 4G
 
 echo "=== Check option preallocation and cluster_size ==="
diff --git a/tests/test-util-filemonitor.c b/tests/test-util-filemonitor.c
index b629e10857..c1d29c386a 100644
--- a/tests/test-util-filemonitor.c
+++ b/tests/test-util-filemonitor.c
@@ -408,21 +408,10 @@ test_file_monitor_events(void)
     char *pathdst = NULL;
     QFileMonitorTestData data;
     GHashTable *ids = g_hash_table_new(g_int64_hash, g_int64_equal);
-    char *travis_arch;
 
     qemu_mutex_init(&data.lock);
     data.records = NULL;
 
-    /*
-     * This test does not work on Travis LXD containers since some
-     * syscalls are blocked in that environment.
-     */
-    travis_arch = getenv("TRAVIS_ARCH");
-    if (travis_arch && !g_str_equal(travis_arch, "x86_64")) {
-        g_test_skip("Test does not work on non-x86 Travis containers.");
-        return;
-    }
-
     /*
      * The file monitor needs the main loop running in
      * order to receive events from inotify. We must
-- 
2.29.2


