Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7AE2DA941
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:36:09 +0100 (CET)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5oX-00070R-2p
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kp5nX-0006bS-Py
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kp5nW-0000q2-3Y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608021304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=11PnN6W97rK9X2BKOQ30CjQtovwyar6mtnZKls3YCvg=;
 b=TwbixtHyJ5Vqi3CDKUxlAJ5EIWnLiJK4ESdu0aCOaTrFDxiUyHUXxD8+JhF+y8fqjlc99j
 t8UJIQH0nkeKKz0Nct6pnbfSATfwB5+FB4fq1N+BluT0GZtS+FCjPXPRnPJ1VFKC+CjFLL
 E5YWSC1alKsChIZ3OrWcedWJDU9Fza8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-KOV2huJbN42ebIMNCmGEyw-1; Tue, 15 Dec 2020 03:35:02 -0500
X-MC-Unique: KOV2huJbN42ebIMNCmGEyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78AF71060B70;
 Tue, 15 Dec 2020 08:35:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1D42BCFB;
 Tue, 15 Dec 2020 08:34:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
Date: Tue, 15 Dec 2020 09:34:51 +0100
Message-Id: <20201215083451.92322-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After adding some missing packages, it's possible to check 32-bit
builds and tests with the fedora-i386-cross container in the gitlab-CI,
too. Unfortunately, the code in subprojects/ ignores the --extra-cflags
(on purpose), so the vhost-user part has to be disabled for this.

While we're at it, update the container to Fedora 31. Unfortunately the
gcc from the later versions emits some very dubious format-truncation
warnings, so Fedora 32 and 33 are currently unsuitable for this job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml                   | 16 ++++++++++++++--
 .../dockerfiles/fedora-i386-cross.docker       | 18 +++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index bd6473a75a..2da92e4a6f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -10,7 +10,7 @@
         --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
           mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
           xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 # Job to cross-build specific accelerators.
 #
@@ -37,7 +37,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
   extends: .cross_system_build_job
@@ -69,6 +69,18 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-i386-system:
+  extends: .cross_system_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check-qtest
+
+cross-i386-user:
+  extends: .cross_user_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check
+
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index cd16cd1bfa..a6e411291b 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,14 +1,26 @@
-FROM fedora:30
+FROM fedora:31
 ENV PACKAGES \
+    bzip2 \
+    diffutils \
+    findutils \
     gcc \
+    git \
+    libtasn1-devel.i686 \
+    libzstd-devel.i686 \
+    make \
+    meson \
+    ninja-build \
     glib2-devel.i686 \
     glibc-devel.i686 \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    perl-Test-Harness \
     pixman-devel.i686 \
-    zlib-devel.i686 \
-    libzstd-devel.i686
+    zlib-devel.i686
+
+ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
+ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.27.0


