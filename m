Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1382CA96A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:20:58 +0100 (CET)
Received: from localhost ([::1]:45332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9Kj-0005p6-Tx
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9IX-00040L-1n
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9IU-00022A-6U
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=023ZJniVJGJq/i4WqfSVyAmTIwoNJlfRhabVgclptIE=;
 b=PbJKE36/APCNlTGQFL6PctI/yK6ddBYb5jEzcInN8JD5GC6UHG8dW8PfuOrUtzE9PDZdlB
 rlPP5MvZezDg0JOXWHcc6bmGqNBkjCEXBdd2/5cw9EC46yoYJgWW27JNhvgsvtDz6igHn9
 84x7aIXq9AWtOteQtWSmRt0dHoCL1cM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-U9JMbV3zPKOHGG4WL7et3Q-1; Tue, 01 Dec 2020 12:18:32 -0500
X-MC-Unique: U9JMbV3zPKOHGG4WL7et3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC37185E480;
 Tue,  1 Dec 2020 17:18:30 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E8125D9C2;
 Tue,  1 Dec 2020 17:18:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/23] hw/usb/ccid: remove references to NSS
Date: Tue,  1 Dec 2020 17:18:03 +0000
Message-Id: <20201201171825.2243775-2-berrange@redhat.com>
In-Reply-To: <20201201171825.2243775-1-berrange@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NSS package was previously pre-requisite for building CCID related
features, however, this became obsolete when the libcacard library was
spun off to a separate project:

    commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
    Author: Marc-André Lureau <marcandre.lureau@redhat.com>
    Date:   Sun Aug 30 11:48:40 2015 +0200

        libcacard: use the standalone project

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .travis.yml                                | 14 +++++++-------
 docs/ccid.txt                              | 15 +++++++--------
 scripts/coverity-scan/coverity-scan.docker |  1 -
 tests/docker/dockerfiles/centos7.docker    |  1 +
 tests/docker/dockerfiles/centos8.docker    |  1 +
 tests/docker/dockerfiles/fedora.docker     |  2 +-
 tests/docker/dockerfiles/ubuntu.docker     |  1 -
 tests/docker/dockerfiles/ubuntu1804.docker |  1 -
 tests/docker/dockerfiles/ubuntu2004.docker |  1 -
 9 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 1f80bdb624..567e5195ef 100644
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
@@ -249,6 +249,7 @@ jobs:
             - libaio-dev
             - libattr1-dev
             - libbrlapi-dev
+            - libcacard-dev
             - libcap-ng-dev
             - libgnutls28-dev
             - libgtk-3-dev
@@ -256,7 +257,6 @@ jobs:
             - liblttng-ust-dev
             - libnfs-dev
             - libncurses5-dev
-            - libnss3-dev
             - libpixman-1-dev
             - libpng-dev
             - librados-dev
@@ -290,6 +290,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -298,7 +299,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -324,6 +324,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -332,7 +333,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -357,6 +357,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -365,7 +366,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
@@ -399,6 +399,7 @@ jobs:
         apt_packages:
           - libaio-dev
           - libattr1-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgnutls28-dev
           - libiscsi-dev
@@ -406,7 +407,6 @@ jobs:
           - liblzo2-dev
           - libncurses-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libsdl2-dev
           - libsdl2-image-dev
@@ -442,6 +442,7 @@ jobs:
           - libaio-dev
           - libattr1-dev
           - libbrlapi-dev
+          - libcacard-dev
           - libcap-ng-dev
           - libgcrypt20-dev
           - libgnutls28-dev
@@ -450,7 +451,6 @@ jobs:
           - liblttng-ust-dev
           - libncurses5-dev
           - libnfs-dev
-          - libnss3-dev
           - libpixman-1-dev
           - libpng-dev
           - librados-dev
diff --git a/docs/ccid.txt b/docs/ccid.txt
index c7fda6d07d..4866ee4abd 100644
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
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 6f11af1989..d47c96135c 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -17,6 +17,7 @@ ENV PACKAGES \
     glib2-devel \
     gnutls-devel \
     libaio-devel \
+    libcacard-devel \
     libepoxy-devel \
     libfdt-devel \
     libgcrypt-devel \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 54bc6d54cd..bbd82421db 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -13,6 +13,7 @@ ENV PACKAGES \
     git \
     glib2-devel \
     libaio-devel \
+    libcacard-devel \
     libepoxy-devel \
     libgcrypt-devel \
     lzo-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0b5053f2d0..19e7a3d28a 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -27,6 +27,7 @@ ENV PACKAGES \
     libasan \
     libattr-devel \
     libblockdev-mpath-devel \
+    libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
     libepoxy-devel \
@@ -77,7 +78,6 @@ ENV PACKAGES \
     ncurses-devel \
     nettle-devel \
     ninja-build \
-    nss-devel \
     numactl-devel \
     perl \
     perl-Test-Harness \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index b5ef7a8198..9dec1c4bc6 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -39,7 +39,6 @@ ENV PACKAGES \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     libpng-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 9b0a19ba5e..aacea8627a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -26,7 +26,6 @@ ENV PACKAGES \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     librados-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index ae889d8482..52810d4e27 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -28,7 +28,6 @@ ENV PACKAGES flex bison \
     libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
-    libnss3-dev \
     libnuma-dev \
     libpixman-1-dev \
     librados-dev \
-- 
2.28.0


