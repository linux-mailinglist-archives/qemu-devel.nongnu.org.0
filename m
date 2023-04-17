Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19156E4838
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:48:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOGO-0005Lq-Ij; Mon, 17 Apr 2023 08:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOGC-0005L8-Lz
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOG8-0001XW-IW
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681735623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YS6F5PU3krX5YURWOq+ADbMTk9hgs6pySWhqwSgRZa4=;
 b=GjoFOTQMfeIr66vNYlbNU3TaGKH93KnhcQEesLm85aWUnGkCrJgcz8/IJGoAfEb+OROJq8
 YLXWemEg9qMqon6uYbBtoeA0+5JTRTXQEBF/+0cEpjss2rvEBw0JOn17gSL02gdrqIUSsh
 sM3Zp43A/fdHMXFyyCRb1RCaPcFAKTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-Xokvuc8TPCuQGudWXyndDg-1; Mon, 17 Apr 2023 08:46:59 -0400
X-MC-Unique: Xokvuc8TPCuQGudWXyndDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB88855310;
 Mon, 17 Apr 2023 12:46:59 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D28F2492B03;
 Mon, 17 Apr 2023 12:46:56 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/2] tests: libvirt-ci: Update to commit '51dad419'
Date: Mon, 17 Apr 2023 14:46:53 +0200
Message-Id: <bd11b5954d3dd1e989699370af2b9e2e0c77194a.1681735482.git.pkrempa@redhat.com>
In-Reply-To: <cover.1681735482.git.pkrempa@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update to commit which has fixes needed for OpenSUSE 15.4 and
re-generate output files.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  16 ++
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  16 ++
 .gitlab-ci.d/cirrus/macos-12.vars             |  16 ++
 tests/docker/dockerfiles/alpine.docker        | 127 +++++++++++++
 tests/docker/dockerfiles/centos8.docker       | 141 +++++++++++++-
 .../dockerfiles/debian-amd64-cross.docker     | 174 +++++++++++++++++-
 tests/docker/dockerfiles/debian-amd64.docker  | 148 +++++++++++++++
 .../dockerfiles/debian-arm64-cross.docker     | 173 ++++++++++++++++-
 .../dockerfiles/debian-armel-cross.docker     | 172 ++++++++++++++++-
 .../dockerfiles/debian-armhf-cross.docker     | 173 ++++++++++++++++-
 .../dockerfiles/debian-mips64el-cross.docker  | 170 ++++++++++++++++-
 .../dockerfiles/debian-mipsel-cross.docker    | 170 ++++++++++++++++-
 .../dockerfiles/debian-ppc64el-cross.docker   | 172 ++++++++++++++++-
 .../dockerfiles/debian-s390x-cross.docker     | 171 ++++++++++++++++-
 .../dockerfiles/fedora-win32-cross.docker     | 106 ++++++++++-
 .../dockerfiles/fedora-win64-cross.docker     | 106 ++++++++++-
 tests/docker/dockerfiles/fedora.docker        | 153 ++++++++++++++-
 tests/docker/dockerfiles/opensuse-leap.docker | 138 +++++++++++++-
 tests/docker/dockerfiles/ubuntu2004.docker    | 149 +++++++++++++++
 tests/docker/dockerfiles/ubuntu2204.docker    | 148 +++++++++++++++
 tests/lcitool/libvirt-ci                      |   2 +-
 21 files changed, 2613 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 44d8a2a511..e72eef105d 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -14,3 +14,19 @@ PIP3='/usr/local/bin/pip-3.8'
 PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables freebsd-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS=''
+CROSS_PKGS=''
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PACKAGING_COMMAND='pkg'
+PIP3='/usr/local/bin/pip-3.8'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PYPI_PKGS=''
+PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7622c849b2..cb3f08e143 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -14,3 +14,19 @@ PIP3='/usr/local/bin/pip-3.8'
 PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables freebsd-13 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS=''
+CROSS_PKGS=''
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PACKAGING_COMMAND='pkg'
+PIP3='/usr/local/bin/pip-3.8'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PYPI_PKGS=''
+PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index da6aa6469b..7abe0bb8ec 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -14,3 +14,19 @@ PIP3='/opt/homebrew/bin/pip3'
 PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables macos-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/opt/homebrew/bin/ccache'
+CPAN_PKGS=''
+CROSS_PKGS=''
+MAKE='/opt/homebrew/bin/gmake'
+NINJA='/opt/homebrew/bin/ninja'
+PACKAGING_COMMAND='brew'
+PIP3='/opt/homebrew/bin/pip3'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
+PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 81c70aeaf9..4b0062cb86 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -120,6 +120,133 @@ RUN apk update && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all alpine-316 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/alpine:3.16
+
+RUN apk update && \
+    apk upgrade && \
+    apk add \
+        alsa-lib-dev \
+        attr-dev \
+        bash \
+        bc \
+        bison \
+        bzip2 \
+        bzip2-dev \
+        ca-certificates \
+        capstone-dev \
+        ccache \
+        cdrkit \
+        ceph-dev \
+        clang \
+        cmocka-dev \
+        ctags \
+        curl-dev \
+        cyrus-sasl-dev \
+        dbus \
+        diffutils \
+        dtc-dev \
+        eudev-dev \
+        findutils \
+        flex \
+        fuse3-dev \
+        g++ \
+        gcc \
+        gcovr \
+        gettext \
+        git \
+        glib-dev \
+        glib-static \
+        gnutls-dev \
+        gtk+3.0-dev \
+        json-c-dev \
+        libaio-dev \
+        libbpf-dev \
+        libcap-ng-dev \
+        libdrm-dev \
+        libepoxy-dev \
+        libffi-dev \
+        libgcrypt-dev \
+        libjpeg-turbo-dev \
+        libnfs-dev \
+        libpng-dev \
+        libseccomp-dev \
+        libselinux-dev \
+        libslirp-dev \
+        libssh-dev \
+        libtasn1-dev \
+        liburing-dev \
+        libusb-dev \
+        linux-pam-dev \
+        llvm \
+        lttng-ust-dev \
+        lzo-dev \
+        make \
+        mesa-dev \
+        meson \
+        multipath-tools \
+        musl-dev \
+        ncurses-dev \
+        ndctl-dev \
+        net-tools \
+        nettle-dev \
+        nmap-ncat \
+        numactl-dev \
+        openssh-client \
+        pcre-dev \
+        pixman-dev \
+        pkgconf \
+        pulseaudio-dev \
+        py3-numpy \
+        py3-pillow \
+        py3-pip \
+        py3-sphinx \
+        py3-sphinx_rtd_theme \
+        py3-yaml \
+        python3 \
+        rpm2cpio \
+        samurai \
+        sdl2-dev \
+        sdl2_image-dev \
+        sed \
+        snappy-dev \
+        sndio-dev \
+        socat \
+        sparse \
+        spice-dev \
+        spice-protocol \
+        tar \
+        tesseract-ocr \
+        usbredir-dev \
+        util-linux \
+        vde2-dev \
+        virglrenderer-dev \
+        vte3-dev \
+        which \
+        xen-dev \
+        xfsprogs-dev \
+        zlib-dev \
+        zlib-static \
+        zstd \
+        zstd-dev && \
+    apk list | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 7e3a6217ae..800a626af1 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -100,7 +100,146 @@ RUN dnf distro-sync -y && \
         python38-setuptools \
         python38-wheel \
         rdma-core-devel \
-        rpm \
+        sed \
+        snappy-devel \
+        socat \
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        usbredir-devel \
+        util-linux \
+        virglrenderer-devel \
+        vte291-devel \
+        which \
+        xfsprogs-devel \
+        zlib-devel \
+        zlib-static \
+        zstd && \
+    dnf autoremove -y && \
+    dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+RUN /usr/bin/pip3.8 install \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3.8"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all centos-stream-8 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM quay.io/centos/centos:stream8
+
+RUN dnf distro-sync -y && \
+    dnf install 'dnf-command(config-manager)' -y && \
+    dnf config-manager --set-enabled -y powertools && \
+    dnf install -y centos-release-advanced-virtualization && \
+    dnf install -y epel-release && \
+    dnf install -y epel-next-release && \
+    dnf install -y \
+        SDL2-devel \
+        alsa-lib-devel \
+        bash \
+        bc \
+        bison \
+        brlapi-devel \
+        bzip2 \
+        bzip2-devel \
+        ca-certificates \
+        capstone-devel \
+        ccache \
+        clang \
+        ctags \
+        cyrus-sasl-devel \
+        daxctl-devel \
+        dbus-daemon \
+        device-mapper-multipath-devel \
+        diffutils \
+        findutils \
+        flex \
+        fuse3-devel \
+        gcc \
+        gcc-c++ \
+        genisoimage \
+        gettext \
+        git \
+        glib2-devel \
+        glib2-static \
+        glibc-langpack-en \
+        glibc-static \
+        glusterfs-api-devel \
+        gnutls-devel \
+        gtk3-devel \
+        hostname \
+        jemalloc-devel \
+        json-c-devel \
+        libaio-devel \
+        libasan \
+        libattr-devel \
+        libbpf-devel \
+        libcacard-devel \
+        libcap-ng-devel \
+        libcmocka-devel \
+        libcurl-devel \
+        libdrm-devel \
+        libepoxy-devel \
+        libfdt-devel \
+        libffi-devel \
+        libgcrypt-devel \
+        libiscsi-devel \
+        libjpeg-devel \
+        libnfs-devel \
+        libpmem-devel \
+        libpng-devel \
+        librbd-devel \
+        libseccomp-devel \
+        libselinux-devel \
+        libslirp-devel \
+        libssh-devel \
+        libtasn1-devel \
+        libubsan \
+        liburing-devel \
+        libusbx-devel \
+        libzstd-devel \
+        llvm \
+        lttng-ust-devel \
+        lzo-devel \
+        make \
+        mesa-libgbm-devel \
+        ncurses-devel \
+        nettle-devel \
+        ninja-build \
+        nmap-ncat \
+        numactl-devel \
+        openssh-clients \
+        pam-devel \
+        pcre-static \
+        pixman-devel \
+        pkgconfig \
+        pulseaudio-libs-devel \
+        python38 \
+        python38-PyYAML \
+        python38-numpy \
+        python38-pip \
+        python38-setuptools \
+        python38-wheel \
+        rdma-core-devel \
         sed \
         snappy-devel \
         socat \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index afb1cbd046..0c4167a44e 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -148,7 +148,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/x86_64-linux-gnu-gcc'\n\
 ar = '/usr/bin/x86_64-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/x86_64-linux-gnu-strip'\n\
@@ -158,7 +158,177 @@ pkgconfig = '/usr/bin/x86_64-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'x86_64'\n\
 cpu = 'x86_64'\n\
-endian = 'little'" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-gcc
+
+ENV ABI "x86_64-linux-gnu"
+ENV MESON_OPTS "--cross-file=x86_64-linux-gnu"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross x86_64 debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture amd64 && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-x86-64-linux-gnu \
+                      gcc-x86-64-linux-gnu \
+                      libaio-dev:amd64 \
+                      libasan5:amd64 \
+                      libasound2-dev:amd64 \
+                      libattr1-dev:amd64 \
+                      libbpf-dev:amd64 \
+                      libbrlapi-dev:amd64 \
+                      libbz2-dev:amd64 \
+                      libc6-dev:amd64 \
+                      libcacard-dev:amd64 \
+                      libcap-ng-dev:amd64 \
+                      libcapstone-dev:amd64 \
+                      libcmocka-dev:amd64 \
+                      libcurl4-gnutls-dev:amd64 \
+                      libdaxctl-dev:amd64 \
+                      libdrm-dev:amd64 \
+                      libepoxy-dev:amd64 \
+                      libfdt-dev:amd64 \
+                      libffi-dev:amd64 \
+                      libfuse3-dev:amd64 \
+                      libgbm-dev:amd64 \
+                      libgcrypt20-dev:amd64 \
+                      libglib2.0-dev:amd64 \
+                      libglusterfs-dev:amd64 \
+                      libgnutls28-dev:amd64 \
+                      libgtk-3-dev:amd64 \
+                      libibumad-dev:amd64 \
+                      libibverbs-dev:amd64 \
+                      libiscsi-dev:amd64 \
+                      libjemalloc-dev:amd64 \
+                      libjpeg62-turbo-dev:amd64 \
+                      libjson-c-dev:amd64 \
+                      liblttng-ust-dev:amd64 \
+                      liblzo2-dev:amd64 \
+                      libncursesw5-dev:amd64 \
+                      libnfs-dev:amd64 \
+                      libnuma-dev:amd64 \
+                      libpam0g-dev:amd64 \
+                      libpixman-1-dev:amd64 \
+                      libpmem-dev:amd64 \
+                      libpng-dev:amd64 \
+                      libpulse-dev:amd64 \
+                      librbd-dev:amd64 \
+                      librdmacm-dev:amd64 \
+                      libsasl2-dev:amd64 \
+                      libsdl2-dev:amd64 \
+                      libsdl2-image-dev:amd64 \
+                      libseccomp-dev:amd64 \
+                      libselinux1-dev:amd64 \
+                      libslirp-dev:amd64 \
+                      libsnappy-dev:amd64 \
+                      libspice-server-dev:amd64 \
+                      libssh-gcrypt-dev:amd64 \
+                      libsystemd-dev:amd64 \
+                      libtasn1-6-dev:amd64 \
+                      libubsan1:amd64 \
+                      libudev-dev:amd64 \
+                      liburing-dev:amd64 \
+                      libusb-1.0-0-dev:amd64 \
+                      libusbredirhost-dev:amd64 \
+                      libvdeplug-dev:amd64 \
+                      libvirglrenderer-dev:amd64 \
+                      libvte-2.91-dev:amd64 \
+                      libxen-dev:amd64 \
+                      libzstd-dev:amd64 \
+                      nettle-dev:amd64 \
+                      systemtap-sdt-dev:amd64 \
+                      xfslibs-dev:amd64 \
+                      zlib1g-dev:amd64 && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/x86_64-linux-gnu-gcc'\n\
+ar = '/usr/bin/x86_64-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/x86_64-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/x86_64-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'x86_64'\n\
+cpu = 'x86_64'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 28e2fa81b1..17479151f0 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -141,6 +141,154 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      clang \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      g++ \
+                      gcc \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libaio-dev \
+                      libasan5 \
+                      libasound2-dev \
+                      libattr1-dev \
+                      libbpf-dev \
+                      libbrlapi-dev \
+                      libbz2-dev \
+                      libc6-dev \
+                      libcacard-dev \
+                      libcap-ng-dev \
+                      libcapstone-dev \
+                      libcmocka-dev \
+                      libcurl4-gnutls-dev \
+                      libdaxctl-dev \
+                      libdrm-dev \
+                      libepoxy-dev \
+                      libfdt-dev \
+                      libffi-dev \
+                      libfuse3-dev \
+                      libgbm-dev \
+                      libgcrypt20-dev \
+                      libglib2.0-dev \
+                      libglusterfs-dev \
+                      libgnutls28-dev \
+                      libgtk-3-dev \
+                      libibumad-dev \
+                      libibverbs-dev \
+                      libiscsi-dev \
+                      libjemalloc-dev \
+                      libjpeg62-turbo-dev \
+                      libjson-c-dev \
+                      liblttng-ust-dev \
+                      liblzo2-dev \
+                      libncursesw5-dev \
+                      libnfs-dev \
+                      libnuma-dev \
+                      libpam0g-dev \
+                      libpcre2-dev \
+                      libpixman-1-dev \
+                      libpmem-dev \
+                      libpng-dev \
+                      libpulse-dev \
+                      librbd-dev \
+                      librdmacm-dev \
+                      libsasl2-dev \
+                      libsdl2-dev \
+                      libsdl2-image-dev \
+                      libseccomp-dev \
+                      libselinux1-dev \
+                      libslirp-dev \
+                      libsnappy-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-gcrypt-dev \
+                      libsystemd-dev \
+                      libtasn1-6-dev \
+                      libubsan1 \
+                      libudev-dev \
+                      liburing-dev \
+                      libusb-1.0-0-dev \
+                      libusbredirhost-dev \
+                      libvdeplug-dev \
+                      libvirglrenderer-dev \
+                      libvte-2.91-dev \
+                      libxen-dev \
+                      libzstd-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      multipath-tools \
+                      ncat \
+                      nettle-dev \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      xfslibs-dev \
+                      zlib1g-dev \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b4f7a7f903..beaae5ef92 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -147,7 +147,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
 ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
@@ -157,7 +157,176 @@ pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'aarch64'\n\
 cpu = 'aarch64'\n\
-endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-gcc
+
+ENV ABI "aarch64-linux-gnu"
+ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture arm64 && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-aarch64-linux-gnu \
+                      gcc-aarch64-linux-gnu \
+                      libaio-dev:arm64 \
+                      libasan5:arm64 \
+                      libasound2-dev:arm64 \
+                      libattr1-dev:arm64 \
+                      libbpf-dev:arm64 \
+                      libbrlapi-dev:arm64 \
+                      libbz2-dev:arm64 \
+                      libc6-dev:arm64 \
+                      libcacard-dev:arm64 \
+                      libcap-ng-dev:arm64 \
+                      libcapstone-dev:arm64 \
+                      libcmocka-dev:arm64 \
+                      libcurl4-gnutls-dev:arm64 \
+                      libdaxctl-dev:arm64 \
+                      libdrm-dev:arm64 \
+                      libepoxy-dev:arm64 \
+                      libfdt-dev:arm64 \
+                      libffi-dev:arm64 \
+                      libfuse3-dev:arm64 \
+                      libgbm-dev:arm64 \
+                      libgcrypt20-dev:arm64 \
+                      libglib2.0-dev:arm64 \
+                      libglusterfs-dev:arm64 \
+                      libgnutls28-dev:arm64 \
+                      libgtk-3-dev:arm64 \
+                      libibumad-dev:arm64 \
+                      libibverbs-dev:arm64 \
+                      libiscsi-dev:arm64 \
+                      libjemalloc-dev:arm64 \
+                      libjpeg62-turbo-dev:arm64 \
+                      libjson-c-dev:arm64 \
+                      liblttng-ust-dev:arm64 \
+                      liblzo2-dev:arm64 \
+                      libncursesw5-dev:arm64 \
+                      libnfs-dev:arm64 \
+                      libnuma-dev:arm64 \
+                      libpam0g-dev:arm64 \
+                      libpixman-1-dev:arm64 \
+                      libpng-dev:arm64 \
+                      libpulse-dev:arm64 \
+                      librbd-dev:arm64 \
+                      librdmacm-dev:arm64 \
+                      libsasl2-dev:arm64 \
+                      libsdl2-dev:arm64 \
+                      libsdl2-image-dev:arm64 \
+                      libseccomp-dev:arm64 \
+                      libselinux1-dev:arm64 \
+                      libslirp-dev:arm64 \
+                      libsnappy-dev:arm64 \
+                      libspice-server-dev:arm64 \
+                      libssh-gcrypt-dev:arm64 \
+                      libsystemd-dev:arm64 \
+                      libtasn1-6-dev:arm64 \
+                      libubsan1:arm64 \
+                      libudev-dev:arm64 \
+                      liburing-dev:arm64 \
+                      libusb-1.0-0-dev:arm64 \
+                      libusbredirhost-dev:arm64 \
+                      libvdeplug-dev:arm64 \
+                      libvirglrenderer-dev:arm64 \
+                      libvte-2.91-dev:arm64 \
+                      libxen-dev:arm64 \
+                      libzstd-dev:arm64 \
+                      nettle-dev:arm64 \
+                      systemtap-sdt-dev:arm64 \
+                      xfslibs-dev:arm64 \
+                      zlib1g-dev:arm64 && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'aarch64'\n\
+cpu = 'aarch64'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 4b4191f824..863ab4465b 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -146,7 +146,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
 ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
 strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
@@ -156,7 +156,175 @@ pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'arm'\n\
 cpu = 'arm'\n\
-endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-gcc
+
+ENV ABI "arm-linux-gnueabi"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross armv6l debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armel && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-arm-linux-gnueabi \
+                      gcc-arm-linux-gnueabi \
+                      libaio-dev:armel \
+                      libasan5:armel \
+                      libasound2-dev:armel \
+                      libattr1-dev:armel \
+                      libbpf-dev:armel \
+                      libbrlapi-dev:armel \
+                      libbz2-dev:armel \
+                      libc6-dev:armel \
+                      libcacard-dev:armel \
+                      libcap-ng-dev:armel \
+                      libcapstone-dev:armel \
+                      libcmocka-dev:armel \
+                      libcurl4-gnutls-dev:armel \
+                      libdaxctl-dev:armel \
+                      libdrm-dev:armel \
+                      libepoxy-dev:armel \
+                      libfdt-dev:armel \
+                      libffi-dev:armel \
+                      libfuse3-dev:armel \
+                      libgbm-dev:armel \
+                      libgcrypt20-dev:armel \
+                      libglib2.0-dev:armel \
+                      libglusterfs-dev:armel \
+                      libgnutls28-dev:armel \
+                      libgtk-3-dev:armel \
+                      libibumad-dev:armel \
+                      libibverbs-dev:armel \
+                      libiscsi-dev:armel \
+                      libjemalloc-dev:armel \
+                      libjpeg62-turbo-dev:armel \
+                      libjson-c-dev:armel \
+                      liblttng-ust-dev:armel \
+                      liblzo2-dev:armel \
+                      libncursesw5-dev:armel \
+                      libnfs-dev:armel \
+                      libnuma-dev:armel \
+                      libpam0g-dev:armel \
+                      libpixman-1-dev:armel \
+                      libpng-dev:armel \
+                      libpulse-dev:armel \
+                      librbd-dev:armel \
+                      librdmacm-dev:armel \
+                      libsasl2-dev:armel \
+                      libsdl2-dev:armel \
+                      libsdl2-image-dev:armel \
+                      libseccomp-dev:armel \
+                      libselinux1-dev:armel \
+                      libslirp-dev:armel \
+                      libsnappy-dev:armel \
+                      libspice-server-dev:armel \
+                      libssh-gcrypt-dev:armel \
+                      libsystemd-dev:armel \
+                      libtasn1-6-dev:armel \
+                      libubsan1:armel \
+                      libudev-dev:armel \
+                      liburing-dev:armel \
+                      libusb-1.0-0-dev:armel \
+                      libusbredirhost-dev:armel \
+                      libvdeplug-dev:armel \
+                      libvirglrenderer-dev:armel \
+                      libvte-2.91-dev:armel \
+                      libzstd-dev:armel \
+                      nettle-dev:armel \
+                      systemtap-sdt-dev:armel \
+                      xfslibs-dev:armel \
+                      zlib1g-dev:armel && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'arm'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-c++ && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index c9b6b2e563..2f483cac31 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -147,7 +147,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
 ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
 strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
@@ -157,7 +157,176 @@ pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'arm'\n\
 cpu = 'armhf'\n\
-endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-gcc
+
+ENV ABI "arm-linux-gnueabihf"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabihf"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross armv7l debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armhf && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-arm-linux-gnueabihf \
+                      gcc-arm-linux-gnueabihf \
+                      libaio-dev:armhf \
+                      libasan5:armhf \
+                      libasound2-dev:armhf \
+                      libattr1-dev:armhf \
+                      libbpf-dev:armhf \
+                      libbrlapi-dev:armhf \
+                      libbz2-dev:armhf \
+                      libc6-dev:armhf \
+                      libcacard-dev:armhf \
+                      libcap-ng-dev:armhf \
+                      libcapstone-dev:armhf \
+                      libcmocka-dev:armhf \
+                      libcurl4-gnutls-dev:armhf \
+                      libdaxctl-dev:armhf \
+                      libdrm-dev:armhf \
+                      libepoxy-dev:armhf \
+                      libfdt-dev:armhf \
+                      libffi-dev:armhf \
+                      libfuse3-dev:armhf \
+                      libgbm-dev:armhf \
+                      libgcrypt20-dev:armhf \
+                      libglib2.0-dev:armhf \
+                      libglusterfs-dev:armhf \
+                      libgnutls28-dev:armhf \
+                      libgtk-3-dev:armhf \
+                      libibumad-dev:armhf \
+                      libibverbs-dev:armhf \
+                      libiscsi-dev:armhf \
+                      libjemalloc-dev:armhf \
+                      libjpeg62-turbo-dev:armhf \
+                      libjson-c-dev:armhf \
+                      liblttng-ust-dev:armhf \
+                      liblzo2-dev:armhf \
+                      libncursesw5-dev:armhf \
+                      libnfs-dev:armhf \
+                      libnuma-dev:armhf \
+                      libpam0g-dev:armhf \
+                      libpixman-1-dev:armhf \
+                      libpng-dev:armhf \
+                      libpulse-dev:armhf \
+                      librbd-dev:armhf \
+                      librdmacm-dev:armhf \
+                      libsasl2-dev:armhf \
+                      libsdl2-dev:armhf \
+                      libsdl2-image-dev:armhf \
+                      libseccomp-dev:armhf \
+                      libselinux1-dev:armhf \
+                      libslirp-dev:armhf \
+                      libsnappy-dev:armhf \
+                      libspice-server-dev:armhf \
+                      libssh-gcrypt-dev:armhf \
+                      libsystemd-dev:armhf \
+                      libtasn1-6-dev:armhf \
+                      libubsan1:armhf \
+                      libudev-dev:armhf \
+                      liburing-dev:armhf \
+                      libusb-1.0-0-dev:armhf \
+                      libusbredirhost-dev:armhf \
+                      libvdeplug-dev:armhf \
+                      libvirglrenderer-dev:armhf \
+                      libvte-2.91-dev:armhf \
+                      libxen-dev:armhf \
+                      libzstd-dev:armhf \
+                      nettle-dev:armhf \
+                      systemtap-sdt-dev:armhf \
+                      xfslibs-dev:armhf \
+                      zlib1g-dev:armhf && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'armhf'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-c++ && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index cfe4f9a0d7..982b7e5c11 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -144,7 +144,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/mips64el-linux-gnuabi64-gcc'\n\
 ar = '/usr/bin/mips64el-linux-gnuabi64-gcc-ar'\n\
 strip = '/usr/bin/mips64el-linux-gnuabi64-strip'\n\
@@ -154,7 +154,173 @@ pkgconfig = '/usr/bin/mips64el-linux-gnuabi64-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'mips64'\n\
 cpu = 'mips64el'\n\
-endian = 'little'" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
+endian = 'little'\n" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-gcc
+
+ENV ABI "mips64el-linux-gnuabi64"
+ENV MESON_OPTS "--cross-file=mips64el-linux-gnuabi64"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mips64el debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture mips64el && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-mips64el-linux-gnuabi64 \
+                      gcc-mips64el-linux-gnuabi64 \
+                      libaio-dev:mips64el \
+                      libasound2-dev:mips64el \
+                      libattr1-dev:mips64el \
+                      libbpf-dev:mips64el \
+                      libbrlapi-dev:mips64el \
+                      libbz2-dev:mips64el \
+                      libc6-dev:mips64el \
+                      libcacard-dev:mips64el \
+                      libcap-ng-dev:mips64el \
+                      libcapstone-dev:mips64el \
+                      libcmocka-dev:mips64el \
+                      libcurl4-gnutls-dev:mips64el \
+                      libdaxctl-dev:mips64el \
+                      libdrm-dev:mips64el \
+                      libepoxy-dev:mips64el \
+                      libfdt-dev:mips64el \
+                      libffi-dev:mips64el \
+                      libfuse3-dev:mips64el \
+                      libgbm-dev:mips64el \
+                      libgcrypt20-dev:mips64el \
+                      libglib2.0-dev:mips64el \
+                      libglusterfs-dev:mips64el \
+                      libgnutls28-dev:mips64el \
+                      libgtk-3-dev:mips64el \
+                      libibumad-dev:mips64el \
+                      libibverbs-dev:mips64el \
+                      libiscsi-dev:mips64el \
+                      libjemalloc-dev:mips64el \
+                      libjpeg62-turbo-dev:mips64el \
+                      libjson-c-dev:mips64el \
+                      liblttng-ust-dev:mips64el \
+                      liblzo2-dev:mips64el \
+                      libncursesw5-dev:mips64el \
+                      libnfs-dev:mips64el \
+                      libnuma-dev:mips64el \
+                      libpam0g-dev:mips64el \
+                      libpixman-1-dev:mips64el \
+                      libpng-dev:mips64el \
+                      libpulse-dev:mips64el \
+                      librbd-dev:mips64el \
+                      librdmacm-dev:mips64el \
+                      libsasl2-dev:mips64el \
+                      libsdl2-dev:mips64el \
+                      libsdl2-image-dev:mips64el \
+                      libseccomp-dev:mips64el \
+                      libselinux1-dev:mips64el \
+                      libslirp-dev:mips64el \
+                      libsnappy-dev:mips64el \
+                      libspice-server-dev:mips64el \
+                      libssh-gcrypt-dev:mips64el \
+                      libsystemd-dev:mips64el \
+                      libtasn1-6-dev:mips64el \
+                      libudev-dev:mips64el \
+                      liburing-dev:mips64el \
+                      libusb-1.0-0-dev:mips64el \
+                      libusbredirhost-dev:mips64el \
+                      libvdeplug-dev:mips64el \
+                      libvirglrenderer-dev:mips64el \
+                      libvte-2.91-dev:mips64el \
+                      libzstd-dev:mips64el \
+                      nettle-dev:mips64el \
+                      systemtap-sdt-dev:mips64el \
+                      xfslibs-dev:mips64el \
+                      zlib1g-dev:mips64el && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/mips64el-linux-gnuabi64-gcc'\n\
+ar = '/usr/bin/mips64el-linux-gnuabi64-gcc-ar'\n\
+strip = '/usr/bin/mips64el-linux-gnuabi64-strip'\n\
+pkgconfig = '/usr/bin/mips64el-linux-gnuabi64-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'mips64'\n\
+cpu = 'mips64el'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-c++ && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 8e521fc9ee..90952cfeec 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -144,7 +144,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/mipsel-linux-gnu-gcc'\n\
 ar = '/usr/bin/mipsel-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/mipsel-linux-gnu-strip'\n\
@@ -154,7 +154,173 @@ pkgconfig = '/usr/bin/mipsel-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'mips'\n\
 cpu = 'mipsel'\n\
-endian = 'little'" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-gcc
+
+ENV ABI "mipsel-linux-gnu"
+ENV MESON_OPTS "--cross-file=mipsel-linux-gnu"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mipsel debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture mipsel && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-mipsel-linux-gnu \
+                      gcc-mipsel-linux-gnu \
+                      libaio-dev:mipsel \
+                      libasound2-dev:mipsel \
+                      libattr1-dev:mipsel \
+                      libbpf-dev:mipsel \
+                      libbrlapi-dev:mipsel \
+                      libbz2-dev:mipsel \
+                      libc6-dev:mipsel \
+                      libcacard-dev:mipsel \
+                      libcap-ng-dev:mipsel \
+                      libcapstone-dev:mipsel \
+                      libcmocka-dev:mipsel \
+                      libcurl4-gnutls-dev:mipsel \
+                      libdaxctl-dev:mipsel \
+                      libdrm-dev:mipsel \
+                      libepoxy-dev:mipsel \
+                      libfdt-dev:mipsel \
+                      libffi-dev:mipsel \
+                      libfuse3-dev:mipsel \
+                      libgbm-dev:mipsel \
+                      libgcrypt20-dev:mipsel \
+                      libglib2.0-dev:mipsel \
+                      libglusterfs-dev:mipsel \
+                      libgnutls28-dev:mipsel \
+                      libgtk-3-dev:mipsel \
+                      libibumad-dev:mipsel \
+                      libibverbs-dev:mipsel \
+                      libiscsi-dev:mipsel \
+                      libjemalloc-dev:mipsel \
+                      libjpeg62-turbo-dev:mipsel \
+                      libjson-c-dev:mipsel \
+                      liblttng-ust-dev:mipsel \
+                      liblzo2-dev:mipsel \
+                      libncursesw5-dev:mipsel \
+                      libnfs-dev:mipsel \
+                      libnuma-dev:mipsel \
+                      libpam0g-dev:mipsel \
+                      libpixman-1-dev:mipsel \
+                      libpng-dev:mipsel \
+                      libpulse-dev:mipsel \
+                      librbd-dev:mipsel \
+                      librdmacm-dev:mipsel \
+                      libsasl2-dev:mipsel \
+                      libsdl2-dev:mipsel \
+                      libsdl2-image-dev:mipsel \
+                      libseccomp-dev:mipsel \
+                      libselinux1-dev:mipsel \
+                      libslirp-dev:mipsel \
+                      libsnappy-dev:mipsel \
+                      libspice-server-dev:mipsel \
+                      libssh-gcrypt-dev:mipsel \
+                      libsystemd-dev:mipsel \
+                      libtasn1-6-dev:mipsel \
+                      libudev-dev:mipsel \
+                      liburing-dev:mipsel \
+                      libusb-1.0-0-dev:mipsel \
+                      libusbredirhost-dev:mipsel \
+                      libvdeplug-dev:mipsel \
+                      libvirglrenderer-dev:mipsel \
+                      libvte-2.91-dev:mipsel \
+                      libzstd-dev:mipsel \
+                      nettle-dev:mipsel \
+                      systemtap-sdt-dev:mipsel \
+                      xfslibs-dev:mipsel \
+                      zlib1g-dev:mipsel && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/mipsel-linux-gnu-gcc'\n\
+ar = '/usr/bin/mipsel-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/mipsel-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/mipsel-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'mips'\n\
+cpu = 'mipsel'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index b1b8277f3f..793263aea4 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -146,7 +146,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/powerpc64le-linux-gnu-gcc'\n\
 ar = '/usr/bin/powerpc64le-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/powerpc64le-linux-gnu-strip'\n\
@@ -156,7 +156,175 @@ pkgconfig = '/usr/bin/powerpc64le-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'ppc64'\n\
 cpu = 'powerpc64le'\n\
-endian = 'little'" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-gcc
+
+ENV ABI "powerpc64le-linux-gnu"
+ENV MESON_OPTS "--cross-file=powerpc64le-linux-gnu"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross ppc64le debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture ppc64el && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-powerpc64le-linux-gnu \
+                      gcc-powerpc64le-linux-gnu \
+                      libaio-dev:ppc64el \
+                      libasan5:ppc64el \
+                      libasound2-dev:ppc64el \
+                      libattr1-dev:ppc64el \
+                      libbpf-dev:ppc64el \
+                      libbrlapi-dev:ppc64el \
+                      libbz2-dev:ppc64el \
+                      libc6-dev:ppc64el \
+                      libcacard-dev:ppc64el \
+                      libcap-ng-dev:ppc64el \
+                      libcapstone-dev:ppc64el \
+                      libcmocka-dev:ppc64el \
+                      libcurl4-gnutls-dev:ppc64el \
+                      libdaxctl-dev:ppc64el \
+                      libdrm-dev:ppc64el \
+                      libepoxy-dev:ppc64el \
+                      libfdt-dev:ppc64el \
+                      libffi-dev:ppc64el \
+                      libfuse3-dev:ppc64el \
+                      libgbm-dev:ppc64el \
+                      libgcrypt20-dev:ppc64el \
+                      libglib2.0-dev:ppc64el \
+                      libglusterfs-dev:ppc64el \
+                      libgnutls28-dev:ppc64el \
+                      libgtk-3-dev:ppc64el \
+                      libibumad-dev:ppc64el \
+                      libibverbs-dev:ppc64el \
+                      libiscsi-dev:ppc64el \
+                      libjemalloc-dev:ppc64el \
+                      libjpeg62-turbo-dev:ppc64el \
+                      libjson-c-dev:ppc64el \
+                      liblttng-ust-dev:ppc64el \
+                      liblzo2-dev:ppc64el \
+                      libncursesw5-dev:ppc64el \
+                      libnfs-dev:ppc64el \
+                      libnuma-dev:ppc64el \
+                      libpam0g-dev:ppc64el \
+                      libpixman-1-dev:ppc64el \
+                      libpng-dev:ppc64el \
+                      libpulse-dev:ppc64el \
+                      librbd-dev:ppc64el \
+                      librdmacm-dev:ppc64el \
+                      libsasl2-dev:ppc64el \
+                      libsdl2-dev:ppc64el \
+                      libsdl2-image-dev:ppc64el \
+                      libseccomp-dev:ppc64el \
+                      libselinux1-dev:ppc64el \
+                      libslirp-dev:ppc64el \
+                      libsnappy-dev:ppc64el \
+                      libspice-server-dev:ppc64el \
+                      libssh-gcrypt-dev:ppc64el \
+                      libsystemd-dev:ppc64el \
+                      libtasn1-6-dev:ppc64el \
+                      libubsan1:ppc64el \
+                      libudev-dev:ppc64el \
+                      liburing-dev:ppc64el \
+                      libusb-1.0-0-dev:ppc64el \
+                      libusbredirhost-dev:ppc64el \
+                      libvdeplug-dev:ppc64el \
+                      libvirglrenderer-dev:ppc64el \
+                      libvte-2.91-dev:ppc64el \
+                      libzstd-dev:ppc64el \
+                      nettle-dev:ppc64el \
+                      systemtap-sdt-dev:ppc64el \
+                      xfslibs-dev:ppc64el \
+                      zlib1g-dev:ppc64el && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/powerpc64le-linux-gnu-gcc'\n\
+ar = '/usr/bin/powerpc64le-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/powerpc64le-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/powerpc64le-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'ppc64'\n\
+cpu = 'powerpc64le'\n\
+endian = 'little'\n" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index af39568ce5..5386e8d09a 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -145,7 +145,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/s390x-linux-gnu-gcc'\n\
 ar = '/usr/bin/s390x-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/s390x-linux-gnu-strip'\n\
@@ -155,7 +155,174 @@ pkgconfig = '/usr/bin/s390x-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 's390x'\n\
 cpu = 's390x'\n\
-endian = 'big'" > /usr/local/share/meson/cross/s390x-linux-gnu && \
+endian = 'big'\n" > /usr/local/share/meson/cross/s390x-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-gcc
+
+ENV ABI "s390x-linux-gnu"
+ENV MESON_OPTS "--cross-file=s390x-linux-gnu"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross s390x debian-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture s390x && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      g++-s390x-linux-gnu \
+                      gcc-s390x-linux-gnu \
+                      libaio-dev:s390x \
+                      libasan5:s390x \
+                      libasound2-dev:s390x \
+                      libattr1-dev:s390x \
+                      libbpf-dev:s390x \
+                      libbrlapi-dev:s390x \
+                      libbz2-dev:s390x \
+                      libc6-dev:s390x \
+                      libcacard-dev:s390x \
+                      libcap-ng-dev:s390x \
+                      libcapstone-dev:s390x \
+                      libcmocka-dev:s390x \
+                      libcurl4-gnutls-dev:s390x \
+                      libdaxctl-dev:s390x \
+                      libdrm-dev:s390x \
+                      libepoxy-dev:s390x \
+                      libfdt-dev:s390x \
+                      libffi-dev:s390x \
+                      libfuse3-dev:s390x \
+                      libgbm-dev:s390x \
+                      libgcrypt20-dev:s390x \
+                      libglib2.0-dev:s390x \
+                      libglusterfs-dev:s390x \
+                      libgnutls28-dev:s390x \
+                      libgtk-3-dev:s390x \
+                      libibumad-dev:s390x \
+                      libibverbs-dev:s390x \
+                      libiscsi-dev:s390x \
+                      libjemalloc-dev:s390x \
+                      libjpeg62-turbo-dev:s390x \
+                      libjson-c-dev:s390x \
+                      liblttng-ust-dev:s390x \
+                      liblzo2-dev:s390x \
+                      libncursesw5-dev:s390x \
+                      libnfs-dev:s390x \
+                      libnuma-dev:s390x \
+                      libpam0g-dev:s390x \
+                      libpixman-1-dev:s390x \
+                      libpng-dev:s390x \
+                      libpulse-dev:s390x \
+                      librbd-dev:s390x \
+                      librdmacm-dev:s390x \
+                      libsasl2-dev:s390x \
+                      libsdl2-dev:s390x \
+                      libsdl2-image-dev:s390x \
+                      libseccomp-dev:s390x \
+                      libselinux1-dev:s390x \
+                      libslirp-dev:s390x \
+                      libsnappy-dev:s390x \
+                      libssh-gcrypt-dev:s390x \
+                      libsystemd-dev:s390x \
+                      libtasn1-6-dev:s390x \
+                      libubsan1:s390x \
+                      libudev-dev:s390x \
+                      liburing-dev:s390x \
+                      libusb-1.0-0-dev:s390x \
+                      libusbredirhost-dev:s390x \
+                      libvdeplug-dev:s390x \
+                      libvirglrenderer-dev:s390x \
+                      libvte-2.91-dev:s390x \
+                      libzstd-dev:s390x \
+                      nettle-dev:s390x \
+                      systemtap-sdt-dev:s390x \
+                      xfslibs-dev:s390x \
+                      zlib1g-dev:s390x && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    printf "[binaries]\n\
+c = '/usr/bin/s390x-linux-gnu-gcc'\n\
+ar = '/usr/bin/s390x-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/s390x-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/s390x-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 's390x'\n\
+cpu = 's390x'\n\
+endian = 'big'\n" > /usr/local/share/meson/cross/s390x-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 1fc4c987f7..f85f95f6dc 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -7,14 +7,115 @@
 FROM registry.fedoraproject.org/fedora:37

 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               sed \
+               socat \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               util-linux \
+               which \
+               zstd && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN nosync dnf install -y \
+               mingw32-SDL2 \
+               mingw32-SDL2_image \
+               mingw32-bzip2 \
+               mingw32-curl \
+               mingw32-gcc \
+               mingw32-gcc-c++ \
+               mingw32-gettext \
+               mingw32-glib2 \
+               mingw32-gnutls \
+               mingw32-gtk3 \
+               mingw32-libepoxy \
+               mingw32-libgcrypt \
+               mingw32-libjpeg-turbo \
+               mingw32-libpng \
+               mingw32-libtasn1 \
+               mingw32-nettle \
+               mingw32-nsis \
+               mingw32-pixman \
+               mingw32-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-gcc
+
+ENV ABI "i686-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw32.meson"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-37 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM registry.fedoraproject.org/fedora:37
+
+RUN dnf install -y nosync && \
+    printf '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -50,7 +151,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-pip \
                python3-sphinx \
                python3-sphinx_rtd_theme \
-               rpm \
                sed \
                socat \
                sparse \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 39a0617a9d..c6b3c116f2 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -7,14 +7,115 @@
 FROM registry.fedoraproject.org/fedora:37

 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               sed \
+               socat \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               util-linux \
+               which \
+               zstd && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+
+RUN nosync dnf install -y \
+               mingw32-nsis \
+               mingw64-SDL2 \
+               mingw64-SDL2_image \
+               mingw64-bzip2 \
+               mingw64-curl \
+               mingw64-gcc \
+               mingw64-gcc-c++ \
+               mingw64-gettext \
+               mingw64-glib2 \
+               mingw64-gnutls \
+               mingw64-gtk3 \
+               mingw64-libepoxy \
+               mingw64-libgcrypt \
+               mingw64-libjpeg-turbo \
+               mingw64-libpng \
+               mingw64-libtasn1 \
+               mingw64-nettle \
+               mingw64-pixman \
+               mingw64-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-gcc
+
+ENV ABI "x86_64-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-37 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM registry.fedoraproject.org/fedora:37
+
+RUN dnf install -y nosync && \
+    printf '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -50,7 +151,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-pip \
                python3-sphinx \
                python3-sphinx_rtd_theme \
-               rpm \
                sed \
                socat \
                sparse \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index e030c5fb1e..ff488d001a 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -7,14 +7,162 @@
 FROM registry.fedoraproject.org/fedora:37

 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               SDL2-devel \
+               SDL2_image-devel \
+               alsa-lib-devel \
+               bash \
+               bc \
+               bison \
+               brlapi-devel \
+               bzip2 \
+               bzip2-devel \
+               ca-certificates \
+               capstone-devel \
+               ccache \
+               clang \
+               ctags \
+               cyrus-sasl-devel \
+               daxctl-devel \
+               dbus-daemon \
+               device-mapper-multipath-devel \
+               diffutils \
+               findutils \
+               flex \
+               fuse3-devel \
+               gcc \
+               gcc-c++ \
+               gcovr \
+               genisoimage \
+               gettext \
+               git \
+               glib2-devel \
+               glib2-static \
+               glibc-langpack-en \
+               glibc-static \
+               glusterfs-api-devel \
+               gnutls-devel \
+               gtk3-devel \
+               hostname \
+               jemalloc-devel \
+               json-c-devel \
+               libaio-devel \
+               libasan \
+               libattr-devel \
+               libbpf-devel \
+               libcacard-devel \
+               libcap-ng-devel \
+               libcmocka-devel \
+               libcurl-devel \
+               libdrm-devel \
+               libepoxy-devel \
+               libfdt-devel \
+               libffi-devel \
+               libgcrypt-devel \
+               libiscsi-devel \
+               libjpeg-devel \
+               libnfs-devel \
+               libpmem-devel \
+               libpng-devel \
+               librbd-devel \
+               libseccomp-devel \
+               libselinux-devel \
+               libslirp-devel \
+               libssh-devel \
+               libtasn1-devel \
+               libubsan \
+               liburing-devel \
+               libusbx-devel \
+               libzstd-devel \
+               llvm \
+               lttng-ust-devel \
+               lzo-devel \
+               make \
+               mesa-libgbm-devel \
+               meson \
+               ncurses-devel \
+               nettle-devel \
+               ninja-build \
+               nmap-ncat \
+               numactl-devel \
+               openssh-clients \
+               pam-devel \
+               pcre-static \
+               pixman-devel \
+               pkgconfig \
+               pulseaudio-libs-devel \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rdma-core-devel \
+               sed \
+               snappy-devel \
+               socat \
+               sparse \
+               spice-protocol \
+               spice-server-devel \
+               systemd-devel \
+               systemtap-sdt-devel \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               usbredir-devel \
+               util-linux \
+               virglrenderer-devel \
+               vte291-devel \
+               which \
+               xen-devel \
+               xfsprogs-devel \
+               zlib-devel \
+               zlib-static \
+               zstd && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all fedora-37 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM registry.fedoraproject.org/fedora:37
+
+RUN dnf install -y nosync && \
+    printf '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -110,7 +258,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-sphinx \
                python3-sphinx_rtd_theme \
                rdma-core-devel \
-               rpm \
                sed \
                snappy-devel \
                socat \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 8e9500e443..a0d802ab83 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -93,7 +93,143 @@ RUN zypper update -y && \
            python39-pip \
            python39-setuptools \
            rdma-core-devel \
-           rpm \
+           sed \
+           snappy-devel \
+           sndio-devel \
+           socat \
+           sparse \
+           spice-protocol-devel \
+           systemd-devel \
+           systemtap-sdt-devel \
+           tar \
+           tesseract-ocr \
+           tesseract-ocr-traineddata-english \
+           usbredir-devel \
+           util-linux \
+           virglrenderer-devel \
+           vte-devel \
+           which \
+           xen-devel \
+           xfsprogs-devel \
+           zlib-devel \
+           zlib-devel-static \
+           zstd && \
+    zypper clean --all && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+RUN /usr/bin/pip3.9 install \
+                    PyYAML \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3.9"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM registry.opensuse.org/opensuse/leap:15.3
+
+RUN zypper update -y && \
+    zypper install -y \
+           Mesa-devel \
+           alsa-lib-devel \
+           bash \
+           bc \
+           bison \
+           brlapi-devel \
+           bzip2 \
+           ca-certificates \
+           ccache \
+           clang \
+           ctags \
+           cyrus-sasl-devel \
+           dbus-1 \
+           diffutils \
+           findutils \
+           flex \
+           fuse3-devel \
+           gcc \
+           gcc-c++ \
+           gcovr \
+           gettext-runtime \
+           git \
+           glib2-devel \
+           glibc-locale \
+           glibc-static \
+           glusterfs-devel \
+           gtk3-devel \
+           hostname \
+           jemalloc-devel \
+           libSDL2-devel \
+           libSDL2_image-devel \
+           libaio-devel \
+           libasan6 \
+           libattr-devel \
+           libbpf-devel \
+           libbz2-devel \
+           libcacard-devel \
+           libcap-ng-devel \
+           libcmocka-devel \
+           libcurl-devel \
+           libdrm-devel \
+           libepoxy-devel \
+           libfdt-devel \
+           libffi-devel \
+           libgcrypt-devel \
+           libgnutls-devel \
+           libiscsi-devel \
+           libjpeg8-devel \
+           libjson-c-devel \
+           libndctl-devel \
+           libnettle-devel \
+           libnfs-devel \
+           libnuma-devel \
+           libpixman-1-0-devel \
+           libpmem-devel \
+           libpng16-devel \
+           libpulse-devel \
+           librbd-devel \
+           libseccomp-devel \
+           libselinux-devel \
+           libslirp-devel \
+           libspice-server-devel \
+           libssh-devel \
+           libtasn1-devel \
+           libubsan1 \
+           libudev-devel \
+           liburing-devel \
+           libusb-1_0-devel \
+           libzstd-devel \
+           llvm \
+           lttng-ust-devel \
+           lzo-devel \
+           make \
+           mkisofs \
+           ncat \
+           ncurses-devel \
+           ninja \
+           openssh \
+           pam-devel \
+           pcre-devel-static \
+           pkgconfig \
+           python39-base \
+           python39-pip \
+           python39-setuptools \
+           rdma-core-devel \
            sed \
            snappy-devel \
            sndio-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index aa2f5ca7b4..27e34cd3bd 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -142,6 +142,155 @@ RUN export DEBIAN_FRONTEND=noninteractive && \

 RUN /usr/bin/pip3 install meson==0.63.2

+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/ubuntu:20.04
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdmainutils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      clang \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      g++ \
+                      gcc \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libaio-dev \
+                      libasan5 \
+                      libasound2-dev \
+                      libattr1-dev \
+                      libbrlapi-dev \
+                      libbz2-dev \
+                      libc6-dev \
+                      libcacard-dev \
+                      libcap-ng-dev \
+                      libcapstone-dev \
+                      libcmocka-dev \
+                      libcurl4-gnutls-dev \
+                      libdaxctl-dev \
+                      libdrm-dev \
+                      libepoxy-dev \
+                      libfdt-dev \
+                      libffi-dev \
+                      libfuse3-dev \
+                      libgbm-dev \
+                      libgcrypt20-dev \
+                      libglib2.0-dev \
+                      libglusterfs-dev \
+                      libgnutls28-dev \
+                      libgtk-3-dev \
+                      libibumad-dev \
+                      libibverbs-dev \
+                      libiscsi-dev \
+                      libjemalloc-dev \
+                      libjpeg-turbo8-dev \
+                      libjson-c-dev \
+                      liblttng-ust-dev \
+                      liblzo2-dev \
+                      libncursesw5-dev \
+                      libnfs-dev \
+                      libnuma-dev \
+                      libpam0g-dev \
+                      libpcre2-dev \
+                      libpixman-1-dev \
+                      libpmem-dev \
+                      libpng-dev \
+                      libpulse-dev \
+                      librbd-dev \
+                      librdmacm-dev \
+                      libsasl2-dev \
+                      libsdl2-dev \
+                      libsdl2-image-dev \
+                      libseccomp-dev \
+                      libselinux1-dev \
+                      libslirp-dev \
+                      libsnappy-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-dev \
+                      libsystemd-dev \
+                      libtasn1-6-dev \
+                      libubsan1 \
+                      libudev-dev \
+                      libusb-1.0-0-dev \
+                      libusbredirhost-dev \
+                      libvdeplug-dev \
+                      libvirglrenderer-dev \
+                      libvte-2.91-dev \
+                      libxen-dev \
+                      libzstd-dev \
+                      llvm \
+                      locales \
+                      make \
+                      multipath-tools \
+                      ncat \
+                      nettle-dev \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-setuptools \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-wheel \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      xfslibs-dev \
+                      zlib1g-dev \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+RUN /usr/bin/pip3 install meson==0.63.2
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 3f7d30e5d0..556a1370f6 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -141,6 +141,154 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/ubuntu:22.04
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      clang \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      g++ \
+                      gcc \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libaio-dev \
+                      libasan5 \
+                      libasound2-dev \
+                      libattr1-dev \
+                      libbpf-dev \
+                      libbrlapi-dev \
+                      libbz2-dev \
+                      libc6-dev \
+                      libcacard-dev \
+                      libcap-ng-dev \
+                      libcapstone-dev \
+                      libcmocka-dev \
+                      libcurl4-gnutls-dev \
+                      libdaxctl-dev \
+                      libdrm-dev \
+                      libepoxy-dev \
+                      libfdt-dev \
+                      libffi-dev \
+                      libfuse3-dev \
+                      libgbm-dev \
+                      libgcrypt20-dev \
+                      libglib2.0-dev \
+                      libglusterfs-dev \
+                      libgnutls28-dev \
+                      libgtk-3-dev \
+                      libibumad-dev \
+                      libibverbs-dev \
+                      libiscsi-dev \
+                      libjemalloc-dev \
+                      libjpeg-turbo8-dev \
+                      libjson-c-dev \
+                      liblttng-ust-dev \
+                      liblzo2-dev \
+                      libncursesw5-dev \
+                      libnfs-dev \
+                      libnuma-dev \
+                      libpam0g-dev \
+                      libpcre2-dev \
+                      libpixman-1-dev \
+                      libpmem-dev \
+                      libpng-dev \
+                      libpulse-dev \
+                      librbd-dev \
+                      librdmacm-dev \
+                      libsasl2-dev \
+                      libsdl2-dev \
+                      libsdl2-image-dev \
+                      libseccomp-dev \
+                      libselinux1-dev \
+                      libslirp-dev \
+                      libsnappy-dev \
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-dev \
+                      libsystemd-dev \
+                      libtasn1-6-dev \
+                      libubsan1 \
+                      libudev-dev \
+                      liburing-dev \
+                      libusb-1.0-0-dev \
+                      libusbredirhost-dev \
+                      libvdeplug-dev \
+                      libvirglrenderer-dev \
+                      libvte-2.91-dev \
+                      libxen-dev \
+                      libzstd-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      multipath-tools \
+                      ncat \
+                      nettle-dev \
+                      ninja-build \
+                      openssh-client \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      socat \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      xfslibs-dev \
+                      zlib1g-dev \
+                      zstd && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 232f41f160..51dad41975 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 232f41f160d4567b8c82dd52aa96c2bc3a5b75c1
+Subproject commit 51dad41975282b8308da4d6c7868df7dddfb8d7a
-- 
2.39.2


