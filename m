Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B902E3B1C8C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:31:39 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3uj-000292-9F
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3mt-0000hm-AT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3mr-0006PK-3r
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhacyYx9sJjL14XNf0kWxqVuP3Gw/1SEbvQJ90dtGcQ=;
 b=DqCdBWRCgL2BVlGcdQkQx4ykRSS5Mb8yy8h22uM1RzuMfCRnCICuGOK6Ka1A/lEaArM5DJ
 g+yCTnQDuCNPVfjISxrDFihHLpiqVPqXb/GrBI5CIH+OgTr7Y0BBvJ8qtC4EMBpvxDt8BB
 IkUf9AO8j8n9Pgjiqd+HR9mht6sjNfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ZP-SR21ROAWYGcAO1yFhsw-1; Wed, 23 Jun 2021 10:23:24 -0400
X-MC-Unique: ZP-SR21ROAWYGcAO1yFhsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E9EF79EDD;
 Wed, 23 Jun 2021 14:23:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B059760854;
 Wed, 23 Jun 2021 14:23:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/22] tests/docker: remove FEATURES env var from templates
Date: Wed, 23 Jun 2021 15:22:28 +0100
Message-Id: <20210623142245.307776-6-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-1-berrange@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for switching to auto-generated dockerfiles, remove the
FEATURES env variable. The equivalent functionality can be achieved in
most cases by just looking for existance of a binary.

The cases which don't correspond to binaries are simply dropped because
configure/meson will probe for any requested feature anyway.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/common.rc                        | 19 ++++++++++++++-----
 tests/docker/dockerfiles/debian10.docker      |  2 --
 .../dockerfiles/fedora-win32-cross.docker     |  1 -
 .../dockerfiles/fedora-win64-cross.docker     |  1 -
 tests/docker/dockerfiles/fedora.docker        |  1 -
 tests/docker/dockerfiles/ubuntu.docker        |  1 -
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 -
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 -
 tests/docker/run                              |  3 ---
 tests/docker/test-clang                       |  2 +-
 tests/docker/test-debug                       |  2 +-
 tests/docker/test-mingw                       |  3 ++-
 tests/docker/test-misc                        |  2 +-
 tests/docker/test-tsan                        |  2 +-
 14 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index ebc5b97ecf..c5cc33d366 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -15,14 +15,23 @@
 # overriden by TARGET_LIST if the user sets it.
 DEF_TARGET_LIST=${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
 
-requires()
+requires_binary()
 {
+    found=0
     for c in $@; do
-        if ! echo "$FEATURES" | grep -wq -e "$c"; then
-            echo "Prerequisite '$c' not present, skip"
-            exit 0
-        fi
+        for d in /bin /usr/bin /usr/local/bin
+        do
+            if test -f "$d/$c"
+            then
+                found=1
+            fi
+        done
     done
+    if test "$found" != "1"
+    then
+        echo "Prerequisite '$c' not present, skip"
+        exit 0
+    fi
 }
 
 configure_qemu()
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index a27b88df55..b414af1b9f 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -35,5 +35,3 @@ RUN apt update && \
         python3-sphinx \
         python3-sphinx-rtd-theme \
         $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
-
-ENV FEATURES docs
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 9fed35f4e1..5a03e1af43 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -37,7 +37,6 @@ ENV PACKAGES \
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV FEATURES mingw
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index fb641f6104..ff706040c4 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -33,7 +33,6 @@ ENV PACKAGES \
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV FEATURES mingw
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index a506e68d33..64a413f5e0 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -117,4 +117,3 @@ ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
 ENV PATH $PATH:/usr/libexec/python3-sphinx/
-ENV FEATURES mingw clang pyyaml asan docs
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index e0ff425c01..f0e0180d21 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -69,4 +69,3 @@ ENV PACKAGES \
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-ENV FEATURES clang pyyaml sdl2 docs
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index adcdef8244..0acdb0d9ad 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -55,7 +55,6 @@ ENV PACKAGES \
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-ENV FEATURES clang pyyaml sdl2 docs
 
 # https://bugs.launchpad.net/qemu/+bug/1838763
 ENV QEMU_CONFIGURE_OPTS --disable-libssh
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 78755bc2e3..88b3cfa136 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -70,7 +70,6 @@ ENV PACKAGES flex bison \
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-ENV FEATURES clang tsan pyyaml sdl2
 
 # Apply patch https://reviews.llvm.org/D75820
 # This is required for TSan in clang-10 to compile with QEMU.
diff --git a/tests/docker/run b/tests/docker/run
index 8edc7026ee..421393046b 100755
--- a/tests/docker/run
+++ b/tests/docker/run
@@ -30,9 +30,6 @@ mkdir -p $TEST_DIR/{src,build,install}
 
 # Extract the source tarballs
 tar -C $TEST_DIR/src -xf $BASE/qemu.tar || { echo "Failed to untar source"; exit 2; }
-if test -f $TEST_DIR/src/Makefile; then
-    export FEATURES="$FEATURES dtc"
-fi
 
 if test -n "$SHOW_ENV"; then
     if test -f /packages.txt; then
diff --git a/tests/docker/test-clang b/tests/docker/test-clang
index 8c51ead518..b57e0119d9 100755
--- a/tests/docker/test-clang
+++ b/tests/docker/test-clang
@@ -13,7 +13,7 @@
 
 . common.rc
 
-requires clang
+requires_binary clang
 
 cd "$BUILD_DIR"
 
diff --git a/tests/docker/test-debug b/tests/docker/test-debug
index c050fa0d93..f52f16328c 100755
--- a/tests/docker/test-debug
+++ b/tests/docker/test-debug
@@ -14,7 +14,7 @@
 
 . common.rc
 
-requires clang asan
+requires_binary clang
 
 cd "$BUILD_DIR"
 
diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index c30eb654eb..0bc6d78872 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -13,7 +13,8 @@
 
 . common.rc
 
-requires mingw dtc
+requires_binary x86_64-w64-mingw32-gcc
+requires_binary i686-w64-mingw32-gcc
 
 cd "$BUILD_DIR"
 
diff --git a/tests/docker/test-misc b/tests/docker/test-misc
index cc94a738dd..2a3c2c2e1c 100755
--- a/tests/docker/test-misc
+++ b/tests/docker/test-misc
@@ -14,7 +14,7 @@
 
 . common.rc
 
-requires docs
+requires_binary sphinx-build-3 sphinx-build
 
 cd "$BUILD_DIR"
 
diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
index eb40ac45b7..53d90d2f79 100755
--- a/tests/docker/test-tsan
+++ b/tests/docker/test-tsan
@@ -17,7 +17,7 @@
 
 setup_tsan()
 {
-    requires clang tsan
+    requires_binary clang
     tsan_log_dir="/tmp/qemu-test/build/tsan"
     mkdir -p $tsan_log_dir > /dev/null || true
     EXTRA_CONFIGURE_OPTS="${EXTRA_CONFIGURE_OPTS} --enable-tsan \
-- 
2.31.1


