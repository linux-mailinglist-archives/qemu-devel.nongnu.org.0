Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6E3C5C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:50:30 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vOH-0003WG-16
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7G-0004aK-0o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7D-0002Hu-Ry
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id f17so25392650wrt.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32upzgWYArkXqNRAuuHhbgidJ0G7HomnDnq8BKCaFQo=;
 b=sa2O6QqcnRxSvG77gjGaCnFSSPrGAgMiKFXKBRIaoxEe7bF0L4p5dwaSlymOZAQd+x
 jIoHrthnYcugXeGAt/5IPvLafAOcFkgr56Rri/zk0rSWCZZXN+OAgE0fwhccDEqS2uh7
 hrT6EpCr5DysQ6X77pvIVXA/2BstgQS03/D7vjpBMTIg7nFRT4ifv4b5CiCQS3ccGrSq
 zlkLuoVx+5L6QBvdUW7vD5wXerC1niDMStivMGc+9zAkHz8LSdkKhEiLp7NfNQhyXooB
 PqhF5tIFDtu0EI43DAKE8qrQ/F1TQhrNAKV3UMkn3zIXby3wZJydATchozVRCzaYKeW8
 ht0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32upzgWYArkXqNRAuuHhbgidJ0G7HomnDnq8BKCaFQo=;
 b=qIc9jrDpr3VzMVEjNignUWvWjWmzBBUI6cvhvK56nNgI394CN8iSWW52WCgbuC7LP3
 yohZM2BzjWpy7877XezMuifxBhSZLL8PUXRp2UJVw9gWye1IKH5FN2ZFme5X9Dlcu2o3
 yVvRB4r9ray0wT3fysVxWViJMPDi2FN4fxQMh/dKdUD9NR9AVXTFW500UqGw/IKEV07W
 B+GMhIBnbiye39aWTE7LmcXE9N3b3b7/IZ18W3e+oKGiM+KvMvx8hmVWPm8wxzM912ua
 tHjq3wOisnNHKYMj2qP/5KkVR2FMrdQ3fUZ2/GTl5DLqEDIbbTpf4rcdR1M1q4xVz3d+
 093w==
X-Gm-Message-State: AOAM532Khhupq0Vq4osvSNMYjp1PqDI0ApvXMqVi5mM1OwPTE8io9t83
 6NUBtHDzAI/aEEON5mEOT00A7A==
X-Google-Smtp-Source: ABdhPJxRqtm/i6LFAaePcgSOrtjo3+p6yUKWUOkcbF0DoF6vYR7BISjGeSSqxXBJg2LT3Rnn0jFcHQ==
X-Received: by 2002:a5d:52d0:: with SMTP id r16mr57664470wrv.323.1626093170255; 
 Mon, 12 Jul 2021 05:32:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s24sm14982311wra.33.2021.07.12.05.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 574C01FF9C;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/40] tests/docker: remove FEATURES env var from templates
Date: Mon, 12 Jul 2021 13:26:26 +0100
Message-Id: <20210712122653.11354-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

In preparation for switching to auto-generated dockerfiles, remove the
FEATURES env variable. The equivalent functionality can be achieved in
most cases by just looking for existance of a binary.

The cases which don't correspond to binaries are simply dropped because
configure/meson will probe for any requested feature anyway.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-6-berrange@redhat.com>
Message-Id: <20210709143005.1554-14-alex.bennee@linaro.org>

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


