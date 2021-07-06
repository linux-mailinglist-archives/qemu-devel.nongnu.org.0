Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB753BD98F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:11:15 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mjC-00051m-Ma
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mXK-00055m-Jo
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX3-00025e-QC
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q17so6045285wrv.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQM582CR+pF+8YGG08VBpf08mKJ/9zGDEh5ELcyeUXY=;
 b=dxN3O2shUBDveDdRza5Kbsx1GJWEDtP+psl3NNbeSj6rZaC3G5/87jalX6OkOJz8tq
 POg/oqqcG60V6R6DDNQyJqcaJuaJxFrHrtkzOiBD4xzisKIOAjffNPTccYSEOesiSas/
 Gi45/GPJxnfVdgLnsExP2PjPcRQyDfHUuGro7idzxpyF7Es5yG/uQKSbRjHqiMKfdXzg
 aVsRfwc7pfIIwXg2DxMWdtox8tywGp4kNeaL/aSgXB4IozhupAaJV2DsWs1zqFidx0aI
 UQ/qE2YevcaecW/lVgPEBwxvX6eD1lp88sqDohmUWDVZITRIZvjtgcaOxxu2lnF45o5z
 wJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQM582CR+pF+8YGG08VBpf08mKJ/9zGDEh5ELcyeUXY=;
 b=i8kzf70bkd6USlZ9iVpP5DdUA8h+HoZsYmDxAXQeYnwqnyNGRwIP0nIi4UQlFgYJSW
 ss7M3njZOI5SSv68a7Jsv/rQ+7DvBz6zOvOQuA77XhneCnkfdM5zMApkuKLQah3zh8L5
 nVURV5k/lxb19kb6T+lENToaNXiVCJaHStLTnp2WYhZglDY8XzBXu9K7D+Peou/J+OUP
 c5tXuw6NvGbSi2mwT+QH3yAYe5nf6cI50cFBsHNquyXwDG2zpwnfu9Yeql0UoTvlwplN
 kVZL1/DXHOP1TSyTJcy8QhYHESsv9KGNyam7IIRVuIX4FFqxDFqaoQjt6kqwjVPuoG2O
 ettg==
X-Gm-Message-State: AOAM531umjOXOY2oRZ1Mmj2Rfe1RyQsa1LnQh0a7vusl2fdCYRfAoQFB
 FY0ACVkdkZhtCTEWSVDwU2jLLg==
X-Google-Smtp-Source: ABdhPJx8x2LiMlBfKhicabnxrNHqW8vAtSAG2gwgOvyMZM+g8ds4nVvFV1G3kB9xVIDlYAZ/GJ18Zw==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr22722209wry.97.1625583516293; 
 Tue, 06 Jul 2021 07:58:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm3128179wmi.1.2021.07.06.07.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6152F1FF9C;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/39] tests/docker: remove FEATURES env var from templates
Date: Tue,  6 Jul 2021 15:57:51 +0100
Message-Id: <20210706145817.24109-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

In preparation for switching to auto-generated dockerfiles, remove the
FEATURES env variable. The equivalent functionality can be achieved in
most cases by just looking for existance of a binary.

The cases which don't correspond to binaries are simply dropped because
configure/meson will probe for any requested feature anyway.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-6-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.20.1


