Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAB4EAB55
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:35:46 +0200 (CEST)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9CT-0000NP-4N
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:35:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZ95P-0002Me-9P
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZ95M-0008Or-2V
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648549703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0rbM8aNwUWL4Spcu7si8I8SCIiBQWQu5vlpShgNGmO0=;
 b=eshZ6XkGMDVjWXQCLqMNkD5aRIti2knZZZHg0jLhDDIP/Nu8ZXjwyRG1DF4fVchGIt0l8q
 9+ZOZKrwIZRpILxQIaI1vD+8AKiCWDnqNjeezCv69l2XXQefyzyTiofxoHMFpq4MXKif0X
 Bllf8J5mfHs+ak/ZqIqlR53N7bvNWEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-W03FBZzCPZSWeQp7tHjEBQ-1; Tue, 29 Mar 2022 06:28:17 -0400
X-MC-Unique: W03FBZzCPZSWeQp7tHjEBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02AA11C05EB9;
 Tue, 29 Mar 2022 10:28:17 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8A1D40D0160;
 Tue, 29 Mar 2022 10:28:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1] tests: Drop perl-Test-Harness from the CI containers
 / VMs
Date: Tue, 29 Mar 2022 12:28:08 +0200
Message-Id: <20220329102808.423681-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The perl test harness is not necessary anymore since commit 3d2f73ef75
("build: use "meson test" as the test harness"). Thus remove it from
tests/lcitool/projects/qemu.yml, run "make lcitool-refresh" and manually
clean the remaining docker / vm files that are not managed by lcitool yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This triggers a rebuild of the Centos-stream 8 container when
 pushed to gitlab.com - which is however currently failing due to a
 completely unrelated problem in the distro. Thus I've marked this as
 "for-7.1" for now to avoid disturbing up our 7.0 freeze phase.

 .gitlab-ci.d/cirrus/freebsd-12.vars                  | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                  | 2 +-
 .gitlab-ci.d/cirrus/macos-11.vars                    | 4 ++--
 tests/docker/dockerfiles/alpine.docker               | 1 -
 tests/docker/dockerfiles/centos8.docker              | 1 -
 tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 -
 tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 -
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 -
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 1 -
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 -
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 -
 tests/docker/dockerfiles/fedora.docker               | 1 -
 tests/docker/dockerfiles/opensuse-leap.docker        | 1 -
 tests/docker/dockerfiles/ubuntu1804.docker           | 1 -
 tests/docker/dockerfiles/ubuntu2004.docker           | 1 -
 tests/lcitool/projects/qemu.yml                      | 1 -
 tests/vm/centos.aarch64                              | 3 +--
 tests/vm/fedora                                      | 2 +-
 18 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 07f313aa3a..b4842271b2 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 8a648dda1e..546a82dd75 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index 08183f8793..cfe9181fd4 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -5,12 +5,12 @@
 # https://gitlab.com/libvirt/libvirt-ci
 
 CCACHE='/usr/local/bin/ccache'
-CPAN_PKGS='Test::Harness'
+CPAN_PKGS=''
 CROSS_PKGS=''
 MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bzip2 capstone ccache ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 591af43d60..3f4c0f95cb 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -73,7 +73,6 @@ RUN apk update && \
         openssh-client \
         pcre-dev \
         perl \
-        perl-test-harness \
         pixman-dev \
         pkgconf \
         pulseaudio-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3ede55d09b..4b20925bbf 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -87,7 +87,6 @@ RUN dnf update -y && \
         pam-devel \
         pcre-static \
         perl \
-        perl-Test-Harness \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 589510a7be..b60426834c 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -29,7 +29,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             hostname \
             libpcre2-dev \
             libspice-protocol-dev \
-            libtest-harness-perl \
             llvm \
             locales \
             make \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index aa1bd6eb4c..ff79a2cc4f 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -29,7 +29,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             hostname \
             libpcre2-dev \
             libspice-protocol-dev \
-            libtest-harness-perl \
             llvm \
             locales \
             make \
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 3f6b55562c..b573b9ded2 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -25,7 +25,6 @@ RUN apt update && \
        git \
        libglib2.0-dev \
        libpixman-1-dev \
-       libtest-harness-perl \
        locales \
        make \
        ninja-build \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 13328e6081..0a3ec346e6 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -20,7 +20,6 @@ ENV PACKAGES \
     gnutls-devel.i686 \
     nettle-devel.i686 \
     pcre-devel.i686 \
-    perl-Test-Harness \
     pixman-devel.i686 \
     sysprof-capture-devel.i686 \
     zlib-devel.i686
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index d80e66c651..84a8f5524d 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -31,7 +31,6 @@ ENV PACKAGES \
     mingw32-SDL2 \
     msitools \
     perl \
-    perl-Test-Harness \
     python3 \
     python3-PyYAML \
     tar \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 2b12b94ccf..d7ed8eb1cf 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -28,7 +28,6 @@ ENV PACKAGES \
     mingw64-pkg-config \
     msitools \
     perl \
-    perl-Test-Harness \
     python3 \
     python3-PyYAML \
     tar \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 1d01cd9440..2e6a84abfd 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -94,7 +94,6 @@ exec "$@"' > /usr/bin/nosync && \
         openssh-clients \
         pam-devel \
         pcre-static \
-        perl-Test-Harness \
         perl-base \
         pixman-devel \
         pkgconfig \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index e1ad9434a3..6f5993d602 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -83,7 +83,6 @@ RUN zypper update -y && \
            openssh \
            pam-devel \
            pcre-devel-static \
-           perl-Test-Harness \
            perl-base \
            pkgconfig \
            python3-Pillow \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0a622b467c..b3f2156580 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -81,7 +81,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libssh-dev \
             libsystemd-dev \
             libtasn1-6-dev \
-            libtest-harness-perl \
             libubsan1 \
             libudev-dev \
             libusb-1.0-0-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index b9d06cb040..a3b38884e3 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -83,7 +83,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libssh-dev \
             libsystemd-dev \
             libtasn1-6-dev \
-            libtest-harness-perl \
             libubsan1 \
             libudev-dev \
             libusb-1.0-0-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 958868a6ee..d068a7a8de 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -79,7 +79,6 @@ packages:
  - pam
  - pcre-static
  - perl
- - perl-Test-Harness
  - pixman
  - pkg-config
  - pulseaudio
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index 81c3004c3c..96c450f8be 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -24,8 +24,7 @@ DEFAULT_CONFIG = {
     'cpu'          : "max",
     'machine'      : "virt,gic-version=max",
     'install_cmds' : "yum install -y make ninja-build git python3 gcc gcc-c++ flex bison, "\
-        "yum install -y glib2-devel pixman-devel zlib-devel, "\
-        "yum install -y perl-Test-Harness, "\
+        "yum install -y glib2-devel perl pixman-devel zlib-devel, "\
         "alternatives --set python /usr/bin/python3, "\
         "sudo dnf config-manager "\
         "--add-repo=https://download.docker.com/linux/centos/docker-ce.repo,"\
diff --git a/tests/vm/fedora b/tests/vm/fedora
index b977efe4a2..92b78d6e2c 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -35,7 +35,7 @@ class FedoraVM(basevm.BaseVM):
         'gcc', 'binutils', 'make', 'ninja-build',
 
         # perl
-        'perl-Test-Harness',
+        'perl',
 
         # libs: usb
         '"pkgconfig(libusb-1.0)"',
-- 
2.27.0


