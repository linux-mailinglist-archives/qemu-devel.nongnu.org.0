Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69E3B1C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:34:34 +0200 (CEST)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3xZ-0001Bl-0q
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3s4-0005EN-9L
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3s1-0000dT-Uh
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxM9qdWcfC85adSF6xa67emCY4updE0CTXj8NEuBVHA=;
 b=OrOXEnr7UUoI0/3+EiYFUC8JF9YqR7ioFwIccTT0vZY6t14pgDAiOMBVHVFluo8GTyDEXR
 NnAJyyR8eO7wzOb92NK55D00PMw+dLkFh1SIRKJepCUSUnWr/KUrnf/hUkrsqXKvdA4ibx
 XW3nwbPDi7XFLPJDFJIr1xmM1vdWnv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-cE3sBSU_NGyqUh7kZfhJZw-1; Wed, 23 Jun 2021 10:28:47 -0400
X-MC-Unique: cE3sBSU_NGyqUh7kZfhJZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40343801596;
 Wed, 23 Jun 2021 14:28:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D9710016F8;
 Wed, 23 Jun 2021 14:28:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/22] tests/docker: auto-generate opensuse-leap with
 lcitool
Date: Wed, 23 Jun 2021 15:28:19 +0100
Message-Id: <20210623142819.308336-1-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-1-berrange@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles-refresh.py           |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 239 ++++++++++--------
 2 files changed, 130 insertions(+), 110 deletions(-)

diff --git a/tests/docker/dockerfiles-refresh.py b/tests/docker/dockerfiles-refresh.py
index df2dfc60e8..ba37f38383 100755
--- a/tests/docker/dockerfiles-refresh.py
+++ b/tests/docker/dockerfiles-refresh.py
@@ -65,5 +65,6 @@ def generate_image(filename, host, cross=None, trailer=None):
                "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"]
    generate_image("ubuntu2004.docker", "ubuntu-2004",
                   trailer="".join(tsanhack))
+   generate_image("opensuse-leap.docker", "opensuse-leap-152")
 except Exception as ex:
    print(str(ex), file=sys.stderr)
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 5a8bee0289..484f4f55af 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,113 +1,132 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile opensuse-leap-152 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/e9aa46cbbbbd0c02285e9dde1f91b3110b2444b7
+
 FROM registry.opensuse.org/opensuse/leap:15.2
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    Mesa-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    ca-certificates \
-    ccache \
-    clang \
-    ctags \
-    cyrus-sasl-devel \
-    dbus-1 \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    gcovr \
-    gettext-runtime \
-    git \
-    glib2-devel \
-    glibc-locale \
-    glibc-static \
-    glusterfs-devel \
-    gtk3-devel \
-    hostname \
-    jemalloc-devel \
-    libSDL2-devel \
-    libSDL2_image-devel \
-    libaio-devel \
-    libasan6 \
-    libattr-devel \
-    libbpf-devel \
-    libbz2-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libffi-devel \
-    libgcrypt-devel \
-    libgnutls-devel \
-    libiscsi-devel \
-    libjpeg8-devel \
-    libndctl-devel \
-    libnettle-devel \
-    libnfs-devel \
-    libnuma-devel \
-    libpixman-1-0-devel \
-    libpmem-devel \
-    libpng16-devel \
-    libpulse-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libspice-server-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan1 \
-    libudev-devel \
-    libusb-1_0-devel \
-    libxml2-devel \
-    libzstd-devel \
-    llvm \
-    lttng-ust-devel \
-    lzo-devel \
-    make \
-    mkisofs \
-    ncat \
-    ncurses-devel \
-    ninja \
-    openssh \
-    pam-devel \
-    perl-Test-Harness \
-    perl-base \
-    pkgconfig \
-    python3-Pillow \
-    python3-PyYAML \
-    python3-Sphinx \
-    python3-base \
-    python3-numpy \
-    python3-opencv \
-    python3-pip \
-    python3-setuptools \
-    python3-sphinx_rtd_theme \
-    python3-virtualenv \
-    python3-wheel \
-    rdma-core-devel \
-    rpm \
-    sed \
-    snappy-devel \
-    sparse \
-    spice-protocol-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    tesseract-ocr \
-    tesseract-ocr-traineddata-english \
-    texinfo \
-    usbredir-devel \
-    util-linux \
-    virglrenderer-devel \
-    vte-devel \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
+RUN zypper update -y && \
+    zypper install -y \
+           Mesa-devel \
+           alsa-lib-devel \
+           bc \
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
+           libcurl-devel \
+           libdrm-devel \
+           libepoxy-devel \
+           libfdt-devel \
+           libffi-devel \
+           libgcrypt-devel \
+           libgnutls-devel \
+           libiscsi-devel \
+           libjpeg8-devel \
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
+           libspice-server-devel \
+           libssh-devel \
+           libtasn1-devel \
+           libubsan1 \
+           libudev-devel \
+           libusb-1_0-devel \
+           libxml2-devel \
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
+           perl-Test-Harness \
+           perl-base \
+           pkgconfig \
+           python3-Pillow \
+           python3-PyYAML \
+           python3-Sphinx \
+           python3-base \
+           python3-numpy \
+           python3-opencv \
+           python3-pip \
+           python3-setuptools \
+           python3-sphinx_rtd_theme \
+           python3-virtualenv \
+           python3-wheel \
+           rdma-core-devel \
+           rpm \
+           sed \
+           snappy-devel \
+           sparse \
+           spice-protocol-devel \
+           systemd-devel \
+           systemtap-sdt-devel \
+           tar \
+           tesseract-ocr \
+           tesseract-ocr-traineddata-english \
+           texinfo \
+           usbredir-devel \
+           util-linux \
+           virglrenderer-devel \
+           vte-devel \
+           which \
+           xen-devel \
+           xfsprogs-devel \
+           zlib-devel && \
+    zypper clean --all && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+RUN pip3 install \
+         meson==0.56.0
 
-RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
-- 
2.31.1


