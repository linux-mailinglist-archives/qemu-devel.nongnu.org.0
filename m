Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534FD48C32D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:31:50 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7br3-0005eD-FN
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn8-0002i1-1H
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:46 -0500
Received: from [2607:f8b0:4864:20::a36] (port=34728
 helo=mail-vk1-xa36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn5-0003Pk-Uy
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:45 -0500
Received: by mail-vk1-xa36.google.com with SMTP id 191so1445848vkc.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcpAn1et5Rc9ve1l2kkPSNJw8TE2Au+M5SjHGGjh70g=;
 b=QE09XDKWVO3zuqqBHyCMvuwEmfB7ELExuwN1/tMjzo8FPYcgo/B5mt7SPW+9FRJ508
 Rd4y136rBd+28NHyxCuhsePRc7puc64BsVAo0tzBG0xTuqDtMYBHxuqY5BntNA5AZz1H
 +iBe9zUMRu2MMi2FYnhBXB+6vuqvUnKgk1FkkdFZqdXcJ5mho4gH5DCsHjjcNlINzcgX
 tSsdZyEPxDjmWbKQ48WlwXuOZrxL95nI0ErYlC/Po6/kUHvwy8Dpx5max4uhnDpxFe35
 qn4kcWvsG/zXHO/FKSZtAELSq27jZwziCUuKZQjbkm/Pl8AoVlmt53fFJCklj99i3oIb
 73GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcpAn1et5Rc9ve1l2kkPSNJw8TE2Au+M5SjHGGjh70g=;
 b=aaBSTqX0B99EO9epfZLVefCOGW+RzfEDNzt1ak9OXNc+Q9fF5MsgwC1crgdh1WxVgG
 eezrpYHyssOa8GrM6xigAEFCRaZXj99dMQ57gdvtoAlw80d1MvZTC9KNxZ9M5YW8H+oD
 s8E5Wyy9Bshoaw3V7lUfJR4Rauo2fohdGs82iL7qSBrYXqPOKV89jLg2l9/LWNszhQ/x
 d5sPb/oqeQgSK4hXksZdKL+rvPoalPPpuRh3KI5c7HXPwCDIVvZhU4hoFAIlOvYopEB0
 6tuYXFf1KYyrhi+zEpjgtFQucXyp3zMSlRKMXyDnzek5ktgCXqoQSHuDfqdkhiXja5N5
 d0bw==
X-Gm-Message-State: AOAM531QnJp0ivpIE2YfmEzh4WsZo4zdawXgchw/TwXeLg0KcNxamGYs
 ahCanj6dDbgAf2WZoAvewOyaNQ==
X-Google-Smtp-Source: ABdhPJz7ReLwQQ48pv6+9CC/0JzwSMdYcOC/Xev95qPSTQx6baucTpYvr0gQxg18E/pgZLJ9TlnUuA==
X-Received: by 2002:a1f:a010:: with SMTP id j16mr4010261vke.29.1641986862441; 
 Wed, 12 Jan 2022 03:27:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l202sm5916311vkl.40.2022.01.12.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66F341FFC4;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/31] tests/docker: auto-generate opensuse-leap.docker with
 lcitool
Date: Wed, 12 Jan 2022 11:27:03 +0000
Message-Id: <20220112112722.3641051-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa36.google.com
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
Message-Id: <20211215141949.3512719-13-berrange@redhat.com>
Message-Id: <20220105135009.1584676-13-alex.bennee@linaro.org>

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


