Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A143C86A4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:09:02 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gVR-0006qr-FN
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNc-0007H9-LB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNa-0007XU-FJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id n4so1798741wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fh/p0r7wN5Zugi8eSuKUIwB1x6po8kSVMsGhQEyjfVI=;
 b=i8kNILAUXbm8E8LZAN/8sMkhZ+NYOnerJd5YuOH5Yvg8QV4oV2pdhTQrdD0FWwlrrZ
 xLsDPQZZ/Ccwd/UCgTL/J9pItwzc1GKR5KmwNrbx/kvE+6MmiqbmvxdaeCX6x/oj9neM
 lBn2fzIwWqRH/XxuWH55REaTzBUt9uSnKWsIsHhDxavcVkVawcKNKQOS6AzXeAQbLN+R
 EjEtkb9i/aEulvPZGvPPNn5kFQ6gFL6VrKKt73VugMHivhwuEkn8km8TkJl3O+24qA5B
 tEI7lUU9z3c6VlEdX4mOo3Klw+P9njxCplgEVFr/3F1l4JM9l9uGn/W+emVS/ZDnHGg+
 YraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fh/p0r7wN5Zugi8eSuKUIwB1x6po8kSVMsGhQEyjfVI=;
 b=iN3TrtlzqdA1zkoOuN01/r+KADcXuQC0hwCOYEju5gIMppQhWlhJJn84d+IlgpahUr
 CXIWZe2vzwbxkHXfx3LDt4hFROxolNyr0ic/ut4KgTH7TuEW0ZS0SPv9qBuXIiNJpIo4
 dNisE6b/d+LDkrZOU9ItghuBcFt8Kx+HVd0Q+TGL5h2j3LITaT5tzo0RC05LNM8ostFX
 SIjW1xMP2iB4+7Qx9Rlb7hfVV27+aRt/129fLy2cuJa3Vg+hUroYBi65oQRY6ca0ZAqZ
 0aHQlIs0oUwIar3gK4BR9XRpH9IQNJd1CsJZ9Uus2wLz7tb8UDuH4w83dgFbvciIKpTi
 9iAw==
X-Gm-Message-State: AOAM531CFRxpTfdITEdoyIFEs8duGoZDtGoenjJ7CFiDwuTrnK3pn+/L
 JCXbgazYLARzNGS77P3I7e3WzA==
X-Google-Smtp-Source: ABdhPJxu5ZODBpIUDByRrqDmTzEsZ2fWUpKMF1wK5b0+wDDj1h05soWj9C54drMmFr/0jtb+dQtwEg==
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr11640078wml.74.1626274852776; 
 Wed, 14 Jul 2021 08:00:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm3030946wri.39.2021.07.14.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E30D11FF9A;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 11/44] hw/usb/ccid: remove references to NSS
Date: Wed, 14 Jul 2021 16:00:03 +0100
Message-Id: <20210714150036.21060-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-2-berrange@redhat.com>
Message-Id: <20210709143005.1554-10-alex.bennee@linaro.org>

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


