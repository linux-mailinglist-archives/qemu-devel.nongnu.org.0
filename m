Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845F1733FE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 10:28:50 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7bwv-0004Ch-67
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 04:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7btE-00077G-Oe
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7btD-0003tW-6e
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:25:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7btD-0003tB-3L
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582881898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTUvsLVV9AD1ni2B1FTeD9gDr33hOT+CZ+tKeAj/3I0=;
 b=MLU2fa+ES3glah2zb1zw6CnpDLKYsF/5/HBSMzSVVK45D4Sen1HpdE5MIz371TXi05BYVz
 x42RK/2u+cIKUP3CfDfzCxjXXoVTflNOP+z8PGJCJYw/8I9xGx+hpkg7dfp3vDSflCeQC9
 tiwrbrlpl7vKWV+G2TV//WEOrYnUdxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-vkuze-8cPhuaXv2ZKJ4BlQ-1; Fri, 28 Feb 2020 04:24:57 -0500
X-MC-Unique: vkuze-8cPhuaXv2ZKJ4BlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E80C7800D6C;
 Fri, 28 Feb 2020 09:24:55 +0000 (UTC)
Received: from secure.mitica (ovpn-116-211.ams2.redhat.com [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8372E60C18;
 Fri, 28 Feb 2020 09:24:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] configure: Enable test and libs for zstd
Date: Fri, 28 Feb 2020 10:24:11 +0100
Message-Id: <20200228092420.103757-7-quintela@redhat.com>
In-Reply-To: <20200228092420.103757-1-quintela@redhat.com>
References: <20200228092420.103757-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add it to several build systems to make testing good.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 .gitlab-ci.yml                                |  1 +
 .travis.yml                                   |  1 +
 configure                                     | 30 +++++++++++++++++++
 tests/docker/dockerfiles/centos7.docker       |  3 +-
 .../dockerfiles/fedora-i386-cross.docker      |  3 +-
 tests/docker/dockerfiles/fedora.docker        |  3 +-
 tests/docker/dockerfiles/ubuntu.docker        |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
 tests/vm/fedora                               |  5 +++-
 tests/vm/freebsd                              |  3 ++
 tests/vm/netbsd                               |  3 ++
 tests/vm/openbsd                              |  3 ++
 12 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c15e394f09..72f8b8aa51 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,6 +21,7 @@ build-system2:
  script:
  - apt-get install -y -qq libsdl2-dev libgcrypt-dev libbrlapi-dev libaio-d=
ev
       libfdt-dev liblzo2-dev librdmacm-dev libibverbs-dev libibumad-dev
+      libzstd-dev
  - mkdir build
  - cd build
  - ../configure --enable-werror --target-list=3D"tricore-softmmu unicore32=
-softmmu
diff --git a/.travis.yml b/.travis.yml
index f4020dcc6c..9867272177 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -49,6 +49,7 @@ addons:
       - libusb-1.0-0-dev
       - libvdeplug-dev
       - libvte-2.91-dev
+      - libzstd-dev
       - sparse
       - uuid-dev
       - gcovr
diff --git a/configure b/configure
index 48d6f89d57..7b373bc0bb 100755
--- a/configure
+++ b/configure
@@ -449,6 +449,7 @@ lzo=3D""
 snappy=3D""
 bzip2=3D""
 lzfse=3D""
+zstd=3D""
 guest_agent=3D""
 guest_agent_with_vss=3D"no"
 guest_agent_ntddscsi=3D"no"
@@ -1371,6 +1372,10 @@ for opt do
   ;;
   --disable-lzfse) lzfse=3D"no"
   ;;
+  --disable-zstd) zstd=3D"no"
+  ;;
+  --enable-zstd) zstd=3D"yes"
+  ;;
   --enable-guest-agent) guest_agent=3D"yes"
   ;;
   --disable-guest-agent) guest_agent=3D"no"
@@ -1829,6 +1834,8 @@ disabled with --disable-FEATURE, default is enabled i=
f available:
                   (for reading bzip2-compressed dmg images)
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
+  zstd            support for zstd compression library
+                  (for migration compression)
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
@@ -2453,6 +2460,24 @@ EOF
     fi
 fi
=20
+##########################################
+# zstd check
+
+if test "$zstd" !=3D "no" ; then
+    if $pkg_config --exist libzstd ; then
+        zstd_cflags=3D"$($pkg_config --cflags libzstd)"
+        zstd_libs=3D"$($pkg_config --libs libzstd)"
+        LIBS=3D"$zstd_libs $LIBS"
+        QEMU_CFLAGS=3D"$QEMU_CFLAGS $zstd_cflags"
+        zstd=3D"yes"
+    else
+        if test "$zstd" =3D "yes" ; then
+            feature_not_found "libzstd" "Install libzstd devel"
+        fi
+        zstd=3D"no"
+    fi
+fi
+
 ##########################################
 # libseccomp check
=20
@@ -6668,6 +6693,7 @@ echo "lzo support       $lzo"
 echo "snappy support    $snappy"
 echo "bzip2 support     $bzip2"
 echo "lzfse support     $lzfse"
+echo "zstd support      $zstd"
 echo "NUMA host support $numa"
 echo "libxml2           $libxml2"
 echo "tcmalloc support  $tcmalloc"
@@ -7242,6 +7268,10 @@ if test "$lzfse" =3D "yes" ; then
   echo "LZFSE_LIBS=3D-llzfse" >> $config_host_mak
 fi
=20
+if test "$zstd" =3D "yes" ; then
+  echo "CONFIG_ZSTD=3Dy" >> $config_host_mak
+fi
+
 if test "$libiscsi" =3D "yes" ; then
   echo "CONFIG_LIBISCSI=3Dm" >> $config_host_mak
   echo "LIBISCSI_CFLAGS=3D$libiscsi_cflags" >> $config_host_mak
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerf=
iles/centos7.docker
index 562d65be9e..cdd72de7eb 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -33,6 +33,7 @@ ENV PACKAGES \
     tar \
     vte-devel \
     xen-devel \
-    zlib-devel
+    zlib-devel \
+    libzstd-devel
 RUN yum install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/dock=
er/dockerfiles/fedora-i386-cross.docker
index 9106cf9ebe..cd16cd1bfa 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -7,7 +7,8 @@ ENV PACKAGES \
     gnutls-devel.i686 \
     nettle-devel.i686 \
     pixman-devel.i686 \
-    zlib-devel.i686
+    zlib-devel.i686 \
+    libzstd-devel.i686
=20
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfi=
les/fedora.docker
index 987a3c170a..a6522228c0 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -92,7 +92,8 @@ ENV PACKAGES \
     vte291-devel \
     which \
     xen-devel \
-    zlib-devel
+    zlib-devel \
+    libzstd-devel
 ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3
=20
 RUN dnf install -y $PACKAGES
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfi=
les/ubuntu.docker
index 4177f33691..b6c7b41ddd 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -58,6 +58,7 @@ ENV PACKAGES flex bison \
     libvdeplug-dev \
     libvte-2.91-dev \
     libxen-dev \
+    libzstd-dev \
     make \
     python3-yaml \
     python3-sphinx \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dock=
erfiles/ubuntu1804.docker
index 0766f94cf4..1efedeef99 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -44,6 +44,7 @@ ENV PACKAGES flex bison \
     libvdeplug-dev \
     libvte-2.91-dev \
     libxen-dev \
+    libzstd-dev \
     make \
     python3-yaml \
     python3-sphinx \
diff --git a/tests/vm/fedora b/tests/vm/fedora
index 4d7d6049f4..4843b4175e 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -53,7 +53,10 @@ class FedoraVM(basevm.BaseVM):
         # libs: audio
         '"pkgconfig(libpulse)"',
         '"pkgconfig(alsa)"',
-    ]
+
+        # libs: migration
+        '"pkgconfig(libzstd)"',
+]
=20
     BUILD_SCRIPT =3D """
         set -e;
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index fb54334696..86770878b6 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -55,6 +55,9 @@ class FreeBSDVM(basevm.BaseVM):
         # libs: opengl
         "libepoxy",
         "mesa-libs",
+
+        # libs: migration
+        "zstd",
     ]
=20
     BUILD_SCRIPT =3D """
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index c5069a45f4..55590f4601 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -49,6 +49,9 @@ class NetBSDVM(basevm.BaseVM):
         "SDL2",
         "gtk3+",
         "libxkbcommon",
+
+        # libs: migration
+        "zstd",
     ]
=20
     BUILD_SCRIPT =3D """
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 22cd9513dd..ab6abbedab 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -51,6 +51,9 @@ class OpenBSDVM(basevm.BaseVM):
         "sdl2",
         "gtk+3",
         "libxkbcommon",
+
+        # libs: migration
+        "zstd",
     ]
=20
     BUILD_SCRIPT =3D """
--=20
2.24.1


