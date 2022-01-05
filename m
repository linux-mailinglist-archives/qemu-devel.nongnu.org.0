Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31F485414
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:08:56 +0100 (CET)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56yF-0006Ws-QL
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gS-0008D4-QZ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:32 -0500
Received: from [2a00:1450:4864:20::531] (port=40671
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gN-0004Df-R1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:31 -0500
Received: by mail-ed1-x531.google.com with SMTP id z29so162224559edl.7
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y09O4InlKeU0/R7U+08P+CBOo19ggXXwpdYEwn1yA5M=;
 b=M5lYQLDqsyEbDFL1i+dD/AzXqUZAelQ3GKZO2juJcjI2/MphT08tevMz2TSnF4pbgj
 9LXnAVVJCiuOhc/nBEQngO/klsFNO+aPbO00AwrIW6xWj3q5usGfJ/ObQJKqdRA5j7/w
 31JAmo03ToJn01HeHMFbiIVp/4DwQLG3HmE5UWbknP2RZmh42S4NOP3wQEjbWPw3rkQ9
 zRZNPVYquvzopRhHU3jI3+lIwd5eLksRHGExsPIJKxRk5ZfwJozIa74PWZ/NlkLEuZCi
 ZLgaw0we44i1vIXZdYZ3RQBxigzvhs21K5kuG2siDmvZvtLK6C9mUWoeNp4XL3R9aBvE
 u9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y09O4InlKeU0/R7U+08P+CBOo19ggXXwpdYEwn1yA5M=;
 b=y3wnG7H865wW8PZByHUfjdBQ42puHGRHx+Ieg9RuAsPxlZlwLUzUg4k2SICMC3t7UP
 AGBJxbCkGwDZ1PdPPXsUNuJzDOdxhOtDuqJpoN4mOwuFvaxENvDSqRT5FmY1qMvR+oAn
 DzRw6Fy8qMU773QyUxEnX2HlYquVR531v3tpppFfU2KTnkkj5OHaEiScch2kwizmyU2x
 RDkQZsH4MProtl/Ny4pFnh/b+tG86BDELguFNh6yystCb+Z9Yd+uZirQvpE7yEsecxSn
 IJesSPgle8xDvK+KmP2BzZZulRQCsJF21ZfINIY5dksq/Qg6yctJNSG3L4kvvKe2AHEH
 hASg==
X-Gm-Message-State: AOAM5312YQ/ATXwzeKdCjRf9B2P77wxTFm7AHL5N8whhXjYiuxuehamS
 gp7Otcnk4ctp55TA5awnhpWdlg==
X-Google-Smtp-Source: ABdhPJznOcm1GBuk6v6JtyRPU07kT7iPFHzb0UxNh6+643Zm4Not1f7F1jLD6/lrbjEfPKP+jkDTLA==
X-Received: by 2002:a17:907:2ce3:: with SMTP id
 hz3mr41900646ejc.737.1641390626330; 
 Wed, 05 Jan 2022 05:50:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gs17sm12144888ejc.116.2022.01.05.05.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 365CE1FFC4;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/34] tests/docker: auto-generate opensuse-leap.docker
 with lcitool
Date: Wed,  5 Jan 2022 13:49:47 +0000
Message-Id: <20220105135009.1584676-13-alex.bennee@linaro.org>
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
Message-Id: <20211215141949.3512719-13-berrange@redhat.com>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 245 ++++++++++--------
 tests/lcitool/refresh                         |   1 +
 2 files changed, 135 insertions(+), 111 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 3bbdb67f4f..5510bdf19c 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,114 +1,137 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile opensuse-leap-152 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
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
-    libselinux-devel \
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
+           bash \
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
+           libselinux-devel \
+           libspice-server-devel \
+           libssh-devel \
+           libtasn1-devel \
+           libubsan1 \
+           libudev-devel \
+           liburing-devel \
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
+           pcre-devel-static \
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
+           zlib-devel \
+           zlib-devel-static && \
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
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 310bad1315..b8a69cee59 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -78,6 +78,7 @@ try:
                        trailer="".join(ubuntu1804_skipssh))
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
+   generate_dockerfile("opensuse-leap", "opensuse-leap-152")
    sys.exit(0)
 except Exception as ex:
    print(str(ex), file=sys.stderr)
-- 
2.30.2


