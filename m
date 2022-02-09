Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6AF4AF865
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:28:22 +0100 (CET)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqlQ-000606-QT
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNT-00060M-Bc
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:35 -0500
Received: from rev.ng ([5.9.113.41]:53333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNN-0004YG-S0
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i4pM1k0Qo1vVAPF2ZhyISWSHIokslmBVpEws0TKMEuY=; b=nN5AI2oyHql8kBWQxUt83eY80U
 CDepRN2ozR3mINCdbr0LP+in81RD/Ux+KJtldydkY0e7lIRNmlbnpKbqeULY3D27fXJKezK/WsbDR
 u/DwUG6wd6q5hLqb0HAW3NW20rSnAl9ccT5p9Rsd1beLMS+cJwJEREh+igbgPLY0Cdj8=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 08/12] target/hexagon: import flex/bison to docker files
Date: Wed,  9 Feb 2022 18:03:08 +0100
Message-Id: <20220209170312.30662-9-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-1-anjo@rev.ng>
References: <20220209170312.30662-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

Note: In this version of the patchset `tests/lcitool/libvirt-ci` points
to a fork of libvirt-ci that includes flex/bison. This fork has not been
merged upstream yet, and can be found at

  https://gitlab.com/AntonJohansson/libvirt-ci/-/tree/mapping-flex-bison

This patch will have to be modified to point to the upstreamed version
before pulling.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars                  | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                  | 2 +-
 .gitlab-ci.d/windows.yml                             | 2 ++
 .gitmodules                                          | 3 ++-
 tests/docker/dockerfiles/alpine.docker               | 5 ++++-
 tests/docker/dockerfiles/centos8.docker              | 7 ++++---
 tests/docker/dockerfiles/debian-amd64.docker         | 2 ++
 tests/docker/dockerfiles/debian-native.docker        | 3 +++
 tests/docker/dockerfiles/debian-riscv64-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 tests/docker/dockerfiles/debian10.docker             | 3 +++
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 3 +++
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora.docker               | 5 +++--
 tests/docker/dockerfiles/opensuse-leap.docker        | 7 ++++---
 tests/docker/dockerfiles/ubuntu1804.docker           | 7 ++++---
 tests/docker/dockerfiles/ubuntu2004.docker           | 7 ++++---
 tests/lcitool/libvirt-ci                             | 2 +-
 tests/lcitool/projects/qemu.yml                      | 2 ++
 tests/lcitool/refresh                                | 2 +-
 21 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 9c52266811..f2385c1b4a 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7b44dba324..43904b65fa 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 62dd9ed832..4ae49376cf 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -33,6 +33,7 @@ msys2-64bit:
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
       diffutils git grep make sed
+      flex bison
       mingw-w64-x86_64-capstone
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-cyrus-sasl
@@ -68,6 +69,7 @@ msys2-32bit:
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
       diffutils git grep make sed
+      flex bison
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..666e17907f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,5 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = http://gitlab.com/AntonJohansson/libvirt-ci
+        branch = mapping-flex-bison
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index eb2251c81c..d4f0279318 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile alpine-edge qemu
+#  $ lcitool dockerfile --layers all alpine-edge qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -13,6 +13,7 @@ RUN apk update && \
         attr-dev \
         bash \
         bc \
+        bison \
         bzip2 \
         bzip2-dev \
         ca-certificates \
@@ -29,6 +30,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
+        flex \
         fuse3-dev \
         g++ \
         gcc \
@@ -109,6 +111,7 @@ RUN apk update && \
         zlib-dev \
         zlib-static \
         zstd-dev && \
+    apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b..66d1f09a86 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile centos-8 qemu
+#  $ lcitool dockerfile --layers all almalinux-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/centos:8
+FROM docker.io/library/almalinux:8
 
 RUN dnf update -y && \
     dnf install 'dnf-command(config-manager)' -y && \
@@ -16,6 +16,7 @@ RUN dnf update -y && \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -30,6 +31,7 @@ RUN dnf update -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        flex \
         fuse3-devel \
         gcc \
         gcc-c++ \
@@ -69,7 +71,6 @@ RUN dnf update -y && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index ed546edcd6..805fd6f981 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -14,9 +14,11 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/dockerfiles/debian-native.docker
index efd55cb6e0..02ccaf98fd 100644
--- a/tests/docker/dockerfiles/debian-native.docker
+++ b/tests/docker/dockerfiles/debian-native.docker
@@ -26,13 +26,16 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
+        libglib2.0-dev \
         libfdt-dev \
         librdmacm-dev \
         libsasl2-dev \
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 594d97982c..f5553afc2e 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -17,12 +17,15 @@ RUN apt update && \
 # Install common build utilities
 RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
     bc \
+    bison \
     build-essential \
     ca-certificates \
     debian-ports-archive-keyring \
     dpkg-dev \
+    flex \
     gettext \
     git \
+    libglib2.0-dev \
     ninja-build \
     pkg-config \
     python3
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 3f6b55562c..9191aafc7f 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..23285e7aa4 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -18,15 +18,18 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bc \
+        bison \
         build-essential \
         ca-certificates \
         ccache \
         clang \
         dbus \
+        flex \
         gdb-multiarch \
         gettext \
         git \
         libffi-dev \
+        libglib2.0-dev \
         libncurses5-dev \
         ninja-build \
         pkg-config \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 13328e6081..ae009a203f 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,12 +1,15 @@
 FROM registry.fedoraproject.org/fedora:34
 
 ENV PACKAGES \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     git \
+    glib2-devel \
     libffi-devel.i686 \
     libselinux-devel.i686 \
     libtasn1-devel.i686 \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index d80e66c651..ed08392657 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:33
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
+    glib2-devel \
     hostname \
     make \
     meson \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 2b12b94ccf..bc31c66aef 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -3,12 +3,15 @@ FROM registry.fedoraproject.org/fedora:33
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
+    glib2-devel \
     git \
     hostname \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 60207f3da3..e2ba993e6b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-35 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -23,6 +23,7 @@ exec "$@"' > /usr/bin/nosync && \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -37,6 +38,7 @@ exec "$@"' > /usr/bin/nosync && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        flex \
         fuse3-devel \
         gcc \
         gcc-c++ \
@@ -77,7 +79,6 @@ exec "$@"' > /usr/bin/nosync && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f57d8cfb29..146cd9f3e3 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -12,6 +12,7 @@ RUN zypper update -y && \
            alsa-lib-devel \
            bash \
            bc \
+           bison \
            brlapi-devel \
            bzip2 \
            ca-certificates \
@@ -22,6 +23,7 @@ RUN zypper update -y && \
            dbus-1 \
            diffutils \
            findutils \
+           flex \
            fuse3-devel \
            gcc \
            gcc-c++ \
@@ -128,8 +130,7 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0ffa3c4d4b..0a5900f203 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-1804 qemu
+#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdmainutils \
             bzip2 \
             ca-certificates \
@@ -23,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             g++ \
             gcc \
             gcovr \
@@ -134,8 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 4e562dfdcd..75b5eee895 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdmainutils \
             bzip2 \
             ca-certificates \
@@ -23,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             g++ \
             gcc \
             gcovr \
@@ -136,8 +138,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 29cec2153b..22a88ac731 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
+Subproject commit 22a88ac73197e6c6b8a319eb92cdbd2ac06eb44a
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index ed5ab1407a..f464665990 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -3,6 +3,7 @@ packages:
  - alsa
  - bash
  - bc
+ - bison
  - brlapi
  - bzip2
  - bzip2-libs
@@ -18,6 +19,7 @@ packages:
  - diffutils
  - dtrace
  - findutils
+ - flex
  - fuse3
  - g++
  - gcc
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223..4d7e6e8383 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
 ]
 
 try:
-   generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("centos8", "almalinux-8")
    generate_dockerfile("fedora", "fedora-35")
    generate_dockerfile("ubuntu1804", "ubuntu-1804",
                        trailer="".join(ubuntu1804_skipssh))
-- 
2.34.1


