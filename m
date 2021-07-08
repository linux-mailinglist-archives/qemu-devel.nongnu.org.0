Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9B3C19F3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:38:45 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZrA-00007m-MH
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPU-0003bk-DZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPL-0004pu-VH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so3210312wms.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oMFk17+lkx7R0jpd2CoasVTpsd/qUIiJBETPT7RG2V8=;
 b=pwbir1geun52fy35K9G3IsSMbOlwsjzSHW1ITfKuT8F7N5exY8W6KxuthP3/KNIgCR
 iOZ3ADECSmq1wZ9T1zqtFkErKQxCZotp5IigjTZKRuuOygjkkTEJmI5FHMNQmxlCdtM0
 UM7cCbRNWHdFLx5flupUYN8SwXJ9Lga1OzOKzOfxuCc0t3zVMDF556kt6xnVefFVrwsU
 4N4QfUVS3V7yWXmQVuF1h89/hvfQ3gEyoKHm979kXAOpEPpFiNjeDsytZfX/DDuqL0Qm
 KxY/0CEGsMpn0KUaITp/WlN/s7yOu0FT2kW2S9JSijBvqtXpBy9xG167qbVBnO5et4fW
 lFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMFk17+lkx7R0jpd2CoasVTpsd/qUIiJBETPT7RG2V8=;
 b=WSLvo7CaG0X2rvE9AeDlAm4K7u3Laq7ipTqZXRbVUrQbxggUEwW8o+M1RYuqudHhEE
 Rxqw+gE8/IDoFOWBV+tHbZI/TquiBBmje5FAJA5L1w26JKDoT6pLyMQ/rfywCTrrdF0J
 Lw1ztHs+EWjIrfyYFo4MnVaKSCD7ZLH1KgrN+LtMypfmbLqASJRo0pzM1inl9BumF9UA
 JSgl50v1HoTv8JKTHDhKWPJb0+4U2ehPBTq0fe4/AmsN4F6tBNkSXAjlJvW3Tf1OE35q
 HwlFMH0WPaggmky5q/M2uVXjN4mCjUsq8UX3TPkVhrQRqJvyF/0guYQEs6XErPGPzKqC
 XVtg==
X-Gm-Message-State: AOAM531FfgW4rLnoMVuDrcxTaSz4/QA+knJiFpJ8pomtwiXDJRVyMnHn
 qCbP7eEuDOwYVJKufJvkolhCqg==
X-Google-Smtp-Source: ABdhPJze+vbEvwS2Jfq5KjNjtwKWj38BTa75ouMz1wNaau6uujlYDpi2an0YVO6W23v/sqLnP5F2hg==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr7100902wmm.7.1625771398621; 
 Thu, 08 Jul 2021 12:09:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm10002949wmj.8.2021.07.08.12.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB6D51FF98;
 Thu,  8 Jul 2021 20:09:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 09/39] hw/usb/ccid: remove references to NSS
Date: Thu,  8 Jul 2021 20:09:11 +0100
Message-Id: <20210708190941.16980-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The NSS package was previously pre-requisite for building CCID related
features, however, this became obsolete when the libcacard library was
spun off to a separate project:

    commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
    Author: Marc-André Lureau <marcandre.lureau@redhat.com>
    Date:   Sun Aug 30 11:48:40 2015 +0200

        libcacard: use the standalone project

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/ccid.txt                              | 15 +++++++--------
 .travis.yml                                | 12 ++++++------
 scripts/coverity-scan/coverity-scan.docker |  1 -
 tests/docker/dockerfiles/fedora.docker     |  2 +-
 tests/docker/dockerfiles/ubuntu.docker     |  1 -
 tests/docker/dockerfiles/ubuntu1804.docker |  1 -
 tests/docker/dockerfiles/ubuntu2004.docker |  1 -
 7 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/docs/ccid.txt b/docs/ccid.txt
index c97fbd2de0..2b85b1bd42 100644
--- a/docs/ccid.txt
+++ b/docs/ccid.txt
@@ -34,15 +34,14 @@ reader and smart card (i.e. not backed by a physical device) using this device.
 
 2. Building
 
-The cryptographic functions and access to the physical card is done via NSS.
-
-Installing NSS:
+The cryptographic functions and access to the physical card is done via the
+libcacard library, whose development package must be installed prior to
+building QEMU:
 
 In redhat/fedora:
-    yum install nss-devel
-In ubuntu/debian:
-    apt-get install libnss3-dev
-    (not tested on ubuntu)
+    yum install libcacard-devel
+In ubuntu:
+    apt-get install libcacard-dev
 
 Configuring and building:
     ./configure --enable-smartcard && make
@@ -51,7 +50,7 @@ Configuring and building:
 3. Using ccid-card-emulated with hardware
 
 Assuming you have a working smartcard on the host with the current
-user, using NSS, qemu acts as another NSS client using ccid-card-emulated:
+user, using libcacard, QEMU acts as another client using ccid-card-emulated:
 
     qemu -usb -device usb-ccid -device ccid-card-emulated
 
diff --git a/.travis.yml b/.travis.yml
index 4609240b5a..0faddf7b4e 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -27,6 +27,7 @@ addons:
       - libattr1-dev
       - libbrlapi-dev
       - libcap-ng-dev
+      - libcacard-dev
       - libgcc-7-dev
       - libgnutls28-dev
       - libgtk-3-dev
@@ -34,7 +35,6 @@ addons:
       - liblttng-ust-dev
       - libncurses5-dev
       - libnfs-dev
-      - libnss3-dev
       - libpixman-1-dev
       - libpng-dev
       - librados-dev
@@ -129,6 +129,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -137,7 +138,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -163,6 +163,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -171,7 +172,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -196,6 +196,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -204,7 +205,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -238,6 +238,7 @@ jobs:
         apt_packages:
           - libaio-dev
           - libattr1-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgnutls28-dev
           - libiscsi-dev
@@ -245,7 +246,6 @@ jobs:
           - liblzo2-dev
           - libncurses-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libsdl2-dev
           - libsdl2-image-dev
@@ -281,6 +281,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -289,7 +290,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index 501ac67233..ecff6ac5b4 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -93,7 +93,6 @@ ENV PACKAGES \
     mingw64-SDL2 \
     ncurses-devel \
     nettle-devel \
-    nss-devel \
     numactl-devel \
     perl \
     perl-Test-Harness \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 00cac5d61c..9dde3f6a78 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -28,6 +28,7 @@ ENV PACKAGES \
     libasan \
     libattr-devel \
     libblockdev-mpath-devel \
+    libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
     libepoxy-devel \
@@ -82,7 +83,6 @@ ENV PACKAGES \
     ncurses-devel \
     nettle-devel \
     ninja-build \
-    nss-devel \
     numactl-devel \
     perl \
     perl-Test-Harness \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 24d1647a65..100cfa76e3 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -40,7 +40,6 @@ ENV PACKAGES \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     libpng-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 2f1ec7c42b..86114be23a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -27,7 +27,6 @@ ENV PACKAGES \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     librados-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index fe993fe2a3..b33ed139d9 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -31,7 +31,6 @@ ENV PACKAGES flex bison \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     librados-dev \
-- 
2.20.1


