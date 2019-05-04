Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68B137C4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 08:32:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMo59-0007vz-S6
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 02:23:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMndW-0000ln-4r
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMndV-0005YB-8v
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:55:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMndV-0005XT-41
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:55:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE0A81F25;
	Sat,  4 May 2019 05:54:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B39219C7E;
	Sat,  4 May 2019 05:54:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 May 2019 07:54:40 +0200
Message-Id: <20190504055440.20406-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 04 May 2019 05:54:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/docker: Test more components on the
 Fedora default image
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
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
	Eduardo Otubo <otubo@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael R . Hines" <michael@hinespot.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Junyan He <junyan.he@intel.com>,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
	Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Install optional dependencies of QEMU to get better coverage.

The following components are now enabled:

  $ ./configure
  ...
  Multipath support yes
  VNC SASL support  yes
  RDMA support      yes
  PVRDMA support    yes
  libiscsi support  yes
  seccomp support   yes
  libpmem support   yes
  libudev           yes

Note: The udev-devel package is provided by systemd-devel.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
index 69d4a7f5d75..afbba29adaa 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -8,6 +8,7 @@ ENV PACKAGES \
     bzip2-devel \
     ccache \
     clang \
+    cyrus-sasl-devel \
     device-mapper-multipath-devel \
     findutils \
     flex \
@@ -23,13 +24,17 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
+    libblockdev-mpath-devel \
     libcap-devel \
     libcap-ng-devel \
     libcurl-devel \
     libfdt-devel \
+    libiscsi-devel \
     libjpeg-devel \
+    libpmem-devel \
     libpng-devel \
     librbd-devel \
+    libseccomp-devel \
     libssh2-devel \
     libubsan \
     libusbx-devel \
@@ -74,10 +79,12 @@ ENV PACKAGES \
     pixman-devel \
     python3 \
     PyYAML \
+    rdma-core-devel \
     SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
+    systemd-devel \
     systemtap-sdt-devel \
     tar \
     usbredir-devel \
--=20
2.20.1


