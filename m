Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8948540C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:05:58 +0100 (CET)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56vN-0001YU-Na
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gP-0008Bi-L4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:32 -0500
Received: from [2a00:1450:4864:20::531] (port=35478
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gM-0004Cz-Pd
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id y22so162351417edq.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvlHLjE3fnhbU53U5VSoe45Ri3wPbhenP/DHGpteIhU=;
 b=eeidvR3bNR1e7dJTe6XpbxmD6cz2dpExuYdSWQgDj26Km0st24iQbvy/Z7PNxZWDRg
 sZbhLmc3121fVVd3TjBFl6WpLRARWcW49lxvwKRv7ruCx8sxvcKzYKucFaXawznC2Y8i
 nTtPDyRaN/84TluKrAsDdNLdewik7ImgztiieC/Y9n4Pxb5w96vf0WNz8tGnOxuEUZd7
 /Cxkgw9DW3WxOhjOzU0FC96aFq1R1JHtET/qYsJUulDpjcQerqwzGwvlQEGYIcAf7+T0
 vvZi7YfLzKlZ6/0I2bVY2tF6256+ReyWGZSJMOeqYmnySfFfPNeXdwW/gUCTKwVY+lNX
 UdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvlHLjE3fnhbU53U5VSoe45Ri3wPbhenP/DHGpteIhU=;
 b=AAq02gy/8KutA72ksh80mPBiElFmVadSsDApbIsF5+rJyeCBPXyH8uSu9fKh+CkQ3L
 QjdWh4G+v801ey8yYANrRXu5m3kBjIOm4r/kbdYTtBhW2Xml9VfXPTEFlhTq/LYH2WBu
 sv9pK9CDMLQjWX3FuDtpAyj6fMIOT9+Hl0yDtD5dAskvmwOAvpU8GHUT6rkNPtGTZjCE
 vMnJoc6FkGRrZmp/RpQQlF865dzvcpQMTJLOpJvKeKL5+8j13UhS+2+Gffz4UuSJHhp+
 kb3CYL3qwnq9JZH4Vi5u0XBzxfbteDSsgsqeB40h9rRw6A2WINawVGQ9P16Rca2eQQ1h
 YmZQ==
X-Gm-Message-State: AOAM530Jhv9AlAiC6pJRmC3mb+1GKp8Ic8H703MW3NmhV1L8mEaIu3eW
 m0REbjUmPo3aAxtJhNVA2D2e2A==
X-Google-Smtp-Source: ABdhPJzSAx5g6njEy9ZQLr1+hKukLH75r33hZLdhjA07H7Ehp0UgrgmySMEpNc2uIQkjGAFeYMmMOA==
X-Received: by 2002:a05:6402:2142:: with SMTP id
 bq2mr43607263edb.5.1641390621739; 
 Wed, 05 Jan 2022 05:50:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id kx8sm9100504ejc.126.2022.01.05.05.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA8BE1FFC1;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/34] tests/docker: auto-generate fedora.docker with
 lcitool
Date: Wed,  5 Jan 2022 13:49:44 +0000
Message-Id: <20220105135009.1584676-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-10-berrange@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 260 ++++++++++++++-----------
 tests/lcitool/refresh                  |   1 +
 2 files changed, 146 insertions(+), 115 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 855aefaac5..6784878b56 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,118 +1,148 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    SDL2-devel \
-    SDL2_image-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    bzip2-devel \
-    ca-certificates \
-    capstone-devel \
-    ccache \
-    clang \
-    ctags \
-    cyrus-sasl-devel \
-    daxctl-devel \
-    dbus-daemon \
-    device-mapper-multipath-devel \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    gcovr \
-    genisoimage \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-langpack-en \
-    glibc-static \
-    glusterfs-api-devel \
-    gnutls-devel \
-    gtk3-devel \
-    hostname \
-    jemalloc-devel \
-    libaio-devel \
-    libasan \
-    libattr-devel \
-    libbpf-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libffi-devel \
-    libgcrypt-devel \
-    libiscsi-devel \
-    libjpeg-devel \
-    libnfs-devel \
-    libpmem-devel \
-    libpng-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libselinux-devel \
-    libslirp-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan \
-    libudev-devel \
-    liburing-devel \
-    libusbx-devel \
-    libxml2-devel \
-    libzstd-devel \
-    llvm \
-    lttng-ust-devel \
-    lzo-devel \
-    make \
-    mesa-libgbm-devel \
-    meson \
-    ncurses-devel \
-    nettle-devel \
-    ninja-build \
-    nmap-ncat \
-    numactl-devel \
-    openssh-clients \
-    pam-devel \
-    perl-Test-Harness \
-    perl-base \
-    pixman-devel \
-    pkgconfig \
-    pulseaudio-libs-devel \
-    python3 \
-    python3-PyYAML \
-    python3-numpy \
-    python3-opencv \
-    python3-pillow \
-    python3-pip \
-    python3-sphinx \
-    python3-sphinx_rtd_theme \
-    python3-virtualenv \
-    rdma-core-devel \
-    rpm \
-    sed \
-    snappy-devel \
-    sparse \
-    spice-protocol \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    tesseract \
-    tesseract-langpack-eng \
-    texinfo \
-    usbredir-devel \
-    util-linux \
-    virglrenderer-devel \
-    vte291-devel \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+        SDL2-devel \
+        SDL2_image-devel \
+        alsa-lib-devel \
+        bash \
+        bc \
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
+        gcc \
+        gcc-c++ \
+        gcovr \
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
+        libaio-devel \
+        libasan \
+        libattr-devel \
+        libbpf-devel \
+        libcacard-devel \
+        libcap-ng-devel \
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
+        libudev-devel \
+        liburing-devel \
+        libusbx-devel \
+        libxml2-devel \
+        libzstd-devel \
+        llvm \
+        lttng-ust-devel \
+        lzo-devel \
+        make \
+        mesa-libgbm-devel \
+        meson \
+        ncurses-devel \
+        nettle-devel \
+        ninja-build \
+        nmap-ncat \
+        numactl-devel \
+        openssh-clients \
+        pam-devel \
+        pcre-static \
+        perl-Test-Harness \
+        perl-base \
+        pixman-devel \
+        pkgconfig \
+        pulseaudio-libs-devel \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-opencv \
+        python3-pillow \
+        python3-pip \
+        python3-sphinx \
+        python3-sphinx_rtd_theme \
+        python3-virtualenv \
+        rdma-core-devel \
+        rpm \
+        sed \
+        snappy-devel \
+        sparse \
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        tesseract \
+        tesseract-langpack-eng \
+        texinfo \
+        usbredir-devel \
+        util-linux \
+        virglrenderer-devel \
+        vte291-devel \
+        which \
+        xen-devel \
+        xfsprogs-devel \
+        zlib-devel \
+        zlib-static && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV PATH $PATH:/usr/libexec/python3-sphinx/
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 824b1c0ef2..d79d2b8c06 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,6 +62,7 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
 
 try:
    generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("fedora", "fedora-35")
 
    sys.exit(0)
 except Exception as ex:
-- 
2.30.2


