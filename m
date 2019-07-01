Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E712878
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 09:10:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMSKZ-0002nI-OP
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 03:10:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSDZ-0006b7-5o
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSDY-0007OA-6t
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:02:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49484)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hMSDY-0007O3-1w
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:02:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C3FC31A1DF5;
	Fri,  3 May 2019 07:02:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B56EE26341;
	Fri,  3 May 2019 07:02:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 03D1511AAA; Fri,  3 May 2019 09:02:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 09:02:41 +0200
Message-Id: <20190503070241.24786-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 03 May 2019 07:02:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/docker: add ubuntu 18.04
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on the ubuntu.docker file.
Used to reproduce the build failure Peter was seeing.
Others might find this useful too ;)

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 tests/docker/dockerfiles/ubuntu1804.docker

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
new file mode 100644
index 000000000000..2e2900150b09
--- /dev/null
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -0,0 +1,57 @@
+FROM ubuntu:18.04
+ENV PACKAGES flex bison \
+    ccache \
+    clang \
+    gcc \
+    gettext \
+    git \
+    glusterfs-common \
+    libaio-dev \
+    libattr1-dev \
+    libbluetooth-dev \
+    libbrlapi-dev \
+    libbz2-dev \
+    libcacard-dev \
+    libcap-dev \
+    libcap-ng-dev \
+    libcurl4-gnutls-dev \
+    libdrm-dev \
+    libepoxy-dev \
+    libfdt-dev \
+    libgbm-dev \
+    libgtk-3-dev \
+    libibverbs-dev \
+    libiscsi-dev \
+    libjemalloc-dev \
+    libjpeg-turbo8-dev \
+    liblzo2-dev \
+    libncurses5-dev \
+    libncursesw5-dev \
+    libnfs-dev \
+    libnss3-dev \
+    libnuma-dev \
+    libpixman-1-dev \
+    librados-dev \
+    librbd-dev \
+    librdmacm-dev \
+    libsasl2-dev \
+    libsdl2-dev \
+    libseccomp-dev \
+    libsnappy-dev \
+    libspice-protocol-dev \
+    libspice-server-dev \
+    libssh2-1-dev \
+    libusb-1.0-0-dev \
+    libusbredirhost-dev \
+    libvdeplug-dev \
+    libvte-2.91-dev \
+    libxen-dev \
+    make \
+    python-yaml \
+    sparse \
+    texinfo \
+    xfslibs-dev
+RUN apt-get update && \
+    apt-get -y install $PACKAGES
+RUN dpkg -l $PACKAGES | sort > /packages.txt
+ENV FEATURES clang pyyaml sdl2
-- 
2.18.1


