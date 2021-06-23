Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458563B1C5F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:25:00 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3oJ-0001bx-B6
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3mX-0007vd-9z
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3mV-0006Dx-C3
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKq19luX0HHTG1wzXApeTuxO2eYiTH/3Y9gbUR/dRhQ=;
 b=ZosBCGh3HLYkTfmF/8DxNKeswLcgOsyMeoi9aShOjCrZlYSNvcbY6RBBR5Qs/Vh+PSYzNP
 MXYx+UxEuwtN5QIvCbsSSbZmu2V9ZPdauPjsg2RucKqbf0GRp1rO8MPBkBsPK4GyvyItGy
 waQ3GZj8wzGvqHEc0oouadd+RRYvOO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-wsjK7Az8NZaC8mjvLX0DfA-1; Wed, 23 Jun 2021 10:23:03 -0400
X-MC-Unique: wsjK7Az8NZaC8mjvLX0DfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A48F18D6A34;
 Wed, 23 Jun 2021 14:23:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A79160936;
 Wed, 23 Jun 2021 14:22:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/22] hw/usb/ccid: remove references to NSS
Date: Wed, 23 Jun 2021 15:22:24 +0100
Message-Id: <20210623142245.307776-2-berrange@redhat.com>
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

The NSS package was previously pre-requisite for building CCID related
features, however, this became obsolete when the libcacard library was
spun off to a separate project:

    commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
    Author: Marc-André Lureau <marcandre.lureau@redhat.com>
    Date:   Sun Aug 30 11:48:40 2015 +0200

        libcacard: use the standalone project

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .travis.yml                                | 12 ++++++------
 docs/ccid.txt                              | 15 +++++++--------
 scripts/coverity-scan/coverity-scan.docker |  1 -
 tests/docker/dockerfiles/fedora.docker     |  2 +-
 tests/docker/dockerfiles/ubuntu.docker     |  1 -
 tests/docker/dockerfiles/ubuntu1804.docker |  1 -
 tests/docker/dockerfiles/ubuntu2004.docker |  1 -
 7 files changed, 14 insertions(+), 19 deletions(-)

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
2.31.1


