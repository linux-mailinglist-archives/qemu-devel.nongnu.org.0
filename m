Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48352FF24F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:47:10 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2e33-0003uC-T9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2e15-0002zB-Fx
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2e12-0002f3-RW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611251101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w9bSQ+hBfqQwRl9eeB4psbm8zoDqEqEyMGizCcnQChc=;
 b=IObdhrzoe0peb2fD7zjLaRFEcD5yKoc3/8QNm5hY7q1+b7RJohW8kbvf6ln2OzozI5Dnj7
 ma2vW1OkhjZYkRIEcw1PgW7Ia5Ql9x0WFUQiP0kOOyvttzrJTK56e23aMO2GU5C7WOcl+u
 ugl8/X3xim8vD6AUDCYkyX3NphZVbb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-GoygQ-GQO8K9koCWLAFwrQ-1; Thu, 21 Jan 2021 12:44:59 -0500
X-MC-Unique: GoygQ-GQO8K9koCWLAFwrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E3F1800D42;
 Thu, 21 Jan 2021 17:44:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36E905F9B5;
 Thu, 21 Jan 2021 17:44:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Avoid some submodules to speed up the CI a
 little bit
Date: Thu, 21 Jan 2021 18:44:51 +0100
Message-Id: <20210121174451.658924-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the meson build system rework, the configure script prefers the
git submodules over the system libraries. So we are testing compilation
with capstone, fdt and libslirp as a submodule all over the place,
burning CPU cycles by recompiling these third party modules and wasting
some network bandwidth in the CI by cloning the submodules each time.
Let's stop doing that in at least a couple of jobs and use the system
libraries instead.

While we're at it, also install meson in the Fedora container, since
it is new enough already, so we do not need to check out the meson
submodule here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml                               | 6 +++++-
 tests/docker/dockerfiles/centos8.docker      | 1 +
 tests/docker/dockerfiles/debian-amd64.docker | 1 +
 tests/docker/dockerfiles/fedora.docker       | 3 +++
 tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..e2f9c99e27 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,6 +109,7 @@ build-system-ubuntu:
   <<: *native_build_job_definition
   variables:
     IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -140,6 +141,7 @@ build-system-debian:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-amd64
+    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -185,6 +187,7 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
+             --enable-fdt=system --enable-slirp=system --enable-capstone=system
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -216,7 +219,7 @@ build-system-centos:
   <<: *native_build_job_definition
   variables:
     IMAGE: centos8
-    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -248,6 +251,7 @@ build-system-opensuse:
   <<: *native_build_job_definition
   variables:
     IMAGE: opensuse-leap
+    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
   artifacts:
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 64cb7a6eda..a763d55730 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -15,6 +15,7 @@ ENV PACKAGES \
     glib2-devel \
     libaio-devel \
     libepoxy-devel \
+    libfdt-devel \
     libgcrypt-devel \
     lzo-devel \
     make \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index a98314757d..ed546edcd6 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -21,6 +21,7 @@ RUN apt update && \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
+        libfdt-dev \
         librdmacm-dev \
         libsasl2-dev \
         libsnappy-dev \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0b5053f2d0..0d7602abbe 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
+    capstone-devel \
     ccache \
     clang \
     cyrus-sasl-devel \
@@ -37,6 +38,7 @@ ENV PACKAGES \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
+    libslirp-devel \
     libssh-devel \
     libubsan \
     libudev-devel \
@@ -46,6 +48,7 @@ ENV PACKAGES \
     llvm \
     lzo-devel \
     make \
+    meson \
     mingw32-bzip2 \
     mingw32-curl \
     mingw32-glib2 \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index ae889d8482..8519584d2b 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -37,6 +37,7 @@ ENV PACKAGES flex bison \
     libsasl2-dev \
     libsdl2-dev \
     libseccomp-dev \
+    libslirp-dev \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
-- 
2.27.0


