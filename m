Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30A2C6B6E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:13:32 +0100 (CET)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiFP-0005Ii-B4
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiCf-0003YW-N3
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:10:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiCd-000203-MP
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606500638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=WLwVxrEsjzzsZOEuxbeFyk3NgBJ6cU+gai6r5KvQ7w8=;
 b=TXUT7wlhEwCby04or2kCMISzrcPNh+QmoOY3Rm4iZipaKf1dnne03VI5xMut9rHL5vg5S2
 Vk1jm0jaBB4YO5OUYvairbUKVSeYb0d5uaYwWXCAekKSjqRLjAXIRm3Ia2LICgw6DtDSlV
 Vo+q0XK+uTg0Job8qJCZFgYLpuPYtfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-hIsPN7AENKuF2xhx4eWjlg-1; Fri, 27 Nov 2020 13:10:36 -0500
X-MC-Unique: hIsPN7AENKuF2xhx4eWjlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929478030AA;
 Fri, 27 Nov 2020 18:10:35 +0000 (UTC)
Received: from thuth.com (ovpn-113-70.ams2.redhat.com [10.36.113.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A314D6085D;
 Fri, 27 Nov 2020 18:10:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
Date: Fri, 27 Nov 2020 19:10:25 +0100
Message-Id: <20201127181025.472458-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: alex.williamson@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After adding some missing packages, it's possible to check 32-bit
builds and tests with the fedora-i386-cross container in the gitlab-CI,
too.

While we're at it, update it to Fedora 31. Unfortunately the gcc
from the later versions emits some very dubious format-truncation
warnings, so Fedora 32 and 33 are currently unsuitable for this job.

I also had to remove the gnutls-devel package since linking then
failed due to its dependency libtasn1 not being recognized (even
if I explicitely installed it into the container).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Test runs can be seen here:
  https://gitlab.com/huth/qemu/-/jobs/877519207
 and here:
  https://gitlab.com/huth/qemu/-/jobs/877519208

 .gitlab-ci.d/crossbuilds.yml                     | 16 ++++++++++++++--
 .../docker/dockerfiles/fedora-i386-cross.docker  | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 03ebfabb3f..283c42b100 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -11,7 +11,7 @@
         --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
           mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
           xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job_template: &cross_user_build_job_definition
   stage: build
@@ -21,7 +21,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
   <<: *cross_system_build_job_definition
@@ -53,6 +53,18 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-i386-system:
+  <<: *cross_system_build_job_definition
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check
+
+cross-i386-user:
+  <<: *cross_user_build_job_definition
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check
+
 cross-mips-system:
   <<: *cross_system_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index cd16cd1bfa..7824cc0da3 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,14 +1,24 @@
-FROM fedora:30
+FROM fedora:31
 ENV PACKAGES \
+    bzip2 \
+    diffutils \
+    findutils \
     gcc \
+    git \
+    make \
+    meson \
+    ninja-build \
     glib2-devel.i686 \
     glibc-devel.i686 \
     glibc-static.i686 \
-    gnutls-devel.i686 \
     nettle-devel.i686 \
+    perl-Test-Harness \
     pixman-devel.i686 \
     zlib-devel.i686 \
     libzstd-devel.i686
 
+ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32
+ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
+
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.18.4


