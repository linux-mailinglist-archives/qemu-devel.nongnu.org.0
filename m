Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FF48C38A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:50:10 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c8n-00017F-PB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnA-0002k1-Tg
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:48 -0500
Received: from [2607:f8b0:4864:20::92c] (port=40493
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn8-0003Qj-S1
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:48 -0500
Received: by mail-ua1-x92c.google.com with SMTP id v12so4088199uar.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e08Ep45dJelsp/xxBAvIEh0d39TLmeWguyboL/jrx+Y=;
 b=vT9uGK7f9FNpASBVlk0KUHQHMIoXRW7m6uSD645jo4L0UwW2JngFDgcfh4zWRxdShU
 tI5iTFOHwFnUgrhzeiuxGYLrGdSeKudrAiDeEoGb5/8xL8Xt0qgclfYeti+X1NvmMPut
 kd/+p1HpqfpLeG3SYWzv7B6+mWIH7BmyA25iMWdx09hnMBG92JJhg06OU4qwoqh6MaiE
 6yylN7IE69C6ni1ptN5ep4iPcEkgdd2xsqKlFtAxjz8cWt1p5Mhdn0wt1Mvc2OtlJwbT
 yENiYWM53LzHK0ZhlG5q9XHP66+YeKoaTiK3uhEfKhtDf/7HhxiKcfaZwqZrp4zY52hM
 0oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e08Ep45dJelsp/xxBAvIEh0d39TLmeWguyboL/jrx+Y=;
 b=eIDs8ZXpD+WuvF/i4GbFau1sc7Ij/qLeOkvp4+zI5lyUclbzbudqOga7hC7x72ULjx
 Xuh/k5nEk2HaVSzxe31oVBia/NrF/DuHZFp23xqsAH8x+ll4F6IFvbhE88ByfEEx8G5M
 mOzzt69TGkgkjT/6JWZOkX8I0SwrAalld5mEHN5hpBCeLoMazSuLzhNXJPVAO/Itrmab
 Ba+1yBM05MIivFrYpSb1KUvmRHa7z450vme1HDG6GRF9avu+FRt/5xC8pqkmh9SKT6XL
 XrLSHDmvnNdeSE1S2NXr1w25GZ0FzFeStrtFRZlQf5D/6emQAAjgzXgvTcsLJQlJ74Kw
 uTjQ==
X-Gm-Message-State: AOAM53233MqVc6n6u7PV1mPJpE+xcOU85bOH0I5hXTGHrpE8bqrsr89r
 kmpSDKG1QJLucPAhq+MszZerCA==
X-Google-Smtp-Source: ABdhPJzvH0G9nTVkLs8bUOGeIcIGUbHBsZh7eAKvaPcAZzKbDMJWSZ1Fwo/3e1grRQdOhT0mwIBaPQ==
X-Received: by 2002:a67:f116:: with SMTP id n22mr3874613vsk.71.1641986865803; 
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m3sm8002304vsh.7.2022.01.12.03.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DC0A1FFC1;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/31] tests/docker: auto-generate fedora.docker with lcitool
Date: Wed, 12 Jan 2022 11:27:00 +0000
Message-Id: <20220112112722.3641051-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-10-berrange@redhat.com>
Message-Id: <20220105135009.1584676-10-alex.bennee@linaro.org>

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


