Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FD112F15
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 16:57:25 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icX1o-0004VF-Cm
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 10:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1icWru-0007Vh-5o
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1icWrs-0000Rb-60
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22530
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1icWrr-0000In-Tm
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575474420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfbwmcxEU9ulT1ANQx9x8E9MQAuRCkvXgzodGvlOIe4=;
 b=iqu6dAhtWdHy9HZ5S4hP+EPoO4uCUXLJ7o5pQg/jaXYPc2ERGTvR3AhH5uRKrVudOoE8NE
 EWnso0SBZ8sPhzuvyz9rDL6+laQNGSbrPheohYHaDvy1zAlvuje0yZqDJsz8OLxezRNWz2
 X8r1n+mKL+F688tijRP8mojLAm2/YEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-rEeKplYPNr-SCR6Qh66ndw-1; Wed, 04 Dec 2019 10:46:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C3618543A0;
 Wed,  4 Dec 2019 15:46:56 +0000 (UTC)
Received: from thuth.com (ovpn-117-39.ams2.redhat.com [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583AF600C8;
 Wed,  4 Dec 2019 15:46:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] travis.yml: Enable builds on arm64, ppc64le and s390x
Date: Wed,  4 Dec 2019 16:46:18 +0100
Message-Id: <20191204154618.23560-8-thuth@redhat.com>
In-Reply-To: <20191204154618.23560-1-thuth@redhat.com>
References: <20191204154618.23560-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: rEeKplYPNr-SCR6Qh66ndw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-block@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Eric Auger <eric.auger@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Travis recently added the possibility to test on these architectures,
too, so let's enable them in our travis.yml file to extend our test
coverage.

Unfortunately, the libssh in this Ubuntu version (bionic) is in a pretty
unusable Frankenstein state and libspice-server-dev is not available here,
so we can not use the global list of packages to install, but have to
provide individual package lists instead.

Also, some of the iotests crash when using "dist: bionic" on arm64
and ppc64le, thus these two builders have to use "dist: xenial" until
the problem is understood / fixed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 445b0646c1..0e6458b0af 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -354,6 +354,92 @@ matrix:
         - TEST_CMD=3D"make -j3 check-tcg V=3D1"
         - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
=20
+    - arch: arm64
+      dist: xenial
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libgtk-3-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libncurses5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+      env:
+        - TEST_CMD=3D"make check check-tcg V=3D1"
+        - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS}"
+
+    - arch: ppc64le
+      dist: xenial
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libgtk-3-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libncurses5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+      env:
+        - TEST_CMD=3D"make check check-tcg V=3D1"
+        - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},ppc64le-linux-user"
+
+    - arch: s390x
+      dist: bionic
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libgtk-3-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libncurses5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+      env:
+        - TEST_CMD=3D"make check check-tcg V=3D1"
+        - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},s390x-linux-user"
=20
     # Release builds
     # The make-release script expect a QEMU version, so our tag must start=
 with a 'v'.
--=20
2.18.1


