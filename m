Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF91444404
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:58:14 +0100 (CET)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHiO-0001dT-Ty
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHap-0005kl-7o
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHam-0003xQ-0p
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3FT8NqWbP8jI0rErtNODhfF07NcbJz9dMjlWRSBXJE=;
 b=V+hPwZS7F8cSC4aRBBTYths6O+KJJbOzGI7woUIqRg3Gu2/+s/wErOP21jextmVqVXvkwZ
 086t9a9wydJ7OE+h9RwH5qNPkN40ljaPaLroM0j4bX+jXGXDklhL3Y3BGZ7ZtoTi62nddb
 4bxYUnguq1sj+LUvu+KyM2lMlSM7/wU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-s8hlpYyNOS2oorxXyGQLIw-1; Wed, 03 Nov 2021 10:50:15 -0400
X-MC-Unique: s8hlpYyNOS2oorxXyGQLIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9ABF10A8E03;
 Wed,  3 Nov 2021 14:50:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA5E4196E5;
 Wed,  3 Nov 2021 14:50:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] docker: Add Fedora 35 container
Date: Wed,  3 Nov 2021 10:48:44 -0400
Message-Id: <20211103144844.1285634-7-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-1-jsnow@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Or, more accurately, update our current Fedora container to Fedora 35,
and then add a new fedora34 container and build test.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/buildtest.yml               |  16 ++++
 .gitlab-ci.d/container-core.yml          |   5 +
 tests/docker/dockerfiles/fedora.docker   |   2 +-
 tests/docker/dockerfiles/fedora34.docker | 117 +++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/fedora34.docker

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5c378e35f9..9d9330b646 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -100,6 +100,22 @@ acceptance-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
 
+build-system-fedora34:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-fedora34-container
+  variables:
+    IMAGE: fedora34
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
+             --enable-fdt=system --enable-slirp=system --enable-capstone=system
+    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
+      xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 build-system-fedora:
   extends: .native_build_job_template
   needs:
diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
index e8dd1f476a..96a71e88ff 100644
--- a/.gitlab-ci.d/container-core.yml
+++ b/.gitlab-ci.d/container-core.yml
@@ -6,6 +6,11 @@ amd64-centos8-container:
   variables:
     NAME: centos8
 
+amd64-fedora34-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora34
+
 amd64-fedora-container:
   extends: .container_job_template
   variables:
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 44d7f12110..24aca97cd7 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM registry.fedoraproject.org/fedora:34
+FROM registry.fedoraproject.org/fedora:35
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora34.docker b/tests/docker/dockerfiles/fedora34.docker
new file mode 100644
index 0000000000..44d7f12110
--- /dev/null
+++ b/tests/docker/dockerfiles/fedora34.docker
@@ -0,0 +1,117 @@
+FROM registry.fedoraproject.org/fedora:34
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    SDL2-devel \
+    SDL2_image-devel \
+    alsa-lib-devel \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    bzip2-devel \
+    ca-certificates \
+    capstone-devel \
+    ccache \
+    clang \
+    ctags \
+    cyrus-sasl-devel \
+    daxctl-devel \
+    dbus-daemon \
+    device-mapper-multipath-devel \
+    diffutils \
+    findutils \
+    gcc \
+    gcc-c++ \
+    gcovr \
+    genisoimage \
+    gettext \
+    git \
+    glib2-devel \
+    glibc-langpack-en \
+    glibc-static \
+    glusterfs-api-devel \
+    gnutls-devel \
+    gtk3-devel \
+    hostname \
+    jemalloc-devel \
+    libaio-devel \
+    libasan \
+    libattr-devel \
+    libbpf-devel \
+    libcacard-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libffi-devel \
+    libgcrypt-devel \
+    libiscsi-devel \
+    libjpeg-devel \
+    libnfs-devel \
+    libpmem-devel \
+    libpng-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libslirp-devel \
+    libssh-devel \
+    libtasn1-devel \
+    libubsan \
+    libudev-devel \
+    liburing-devel \
+    libusbx-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lttng-ust-devel \
+    lzo-devel \
+    make \
+    mesa-libgbm-devel \
+    meson \
+    ncurses-devel \
+    nettle-devel \
+    ninja-build \
+    nmap-ncat \
+    numactl-devel \
+    openssh-clients \
+    pam-devel \
+    perl-Test-Harness \
+    perl-base \
+    pixman-devel \
+    pkgconfig \
+    pulseaudio-libs-devel \
+    python3 \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-pillow \
+    python3-pip \
+    python3-sphinx \
+    python3-sphinx_rtd_theme \
+    python3-virtualenv \
+    rdma-core-devel \
+    rpm \
+    sed \
+    snappy-devel \
+    sparse \
+    spice-protocol \
+    spice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract \
+    tesseract-langpack-eng \
+    texinfo \
+    usbredir-devel \
+    util-linux \
+    virglrenderer-devel \
+    vte291-devel \
+    which \
+    xen-devel \
+    xfsprogs-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
+
+RUN dnf install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV PATH $PATH:/usr/libexec/python3-sphinx/
-- 
2.31.1


