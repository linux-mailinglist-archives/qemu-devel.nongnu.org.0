Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5253AC8F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:14:13 +0200 (CEST)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSrE-0000OT-Jf
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjD-0000ss-60
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjA-0004xf-4E
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:54 -0400
Received: by mail-ed1-x530.google.com with SMTP id h19so3311480edj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyKcVCyKIbo0iLUDwlLoEz33jmfirAoDfOqiwXKavNk=;
 b=T0IKBuZqAGsz5DeWHk5asziAD2lXcT5lfrLixaIvx1c67nrj4VsLNXdsLUr4GImYq/
 T6Io7y6T37PqCzMsLQUPghGdheQUqRsBqFwXjxa5jShWZw/Ldsd//6KUH+glPeNBaUpz
 W9x1Exbp2ocYsBHcOBxF191oWUb77vEusaX1/eO60OZtaJwbw38NPHd/Dmrisr5mH/E1
 njxk77xaZn6aLeAekbJdekEPkcePrlTF9jGLe3QHOkOcMdGmlYhNBTMEedoc/cYIIQIJ
 LYGAA076+4H2eWW3xj3DuKUeYaK1eaUTKSGh+okfaVmPz4EfwpQ0gLJ2DFsWBYXodKXn
 QviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyKcVCyKIbo0iLUDwlLoEz33jmfirAoDfOqiwXKavNk=;
 b=YLfMHWFHF/JC49LYqrLpL/vXzJIDLZrNfqZfTSzqk9l/Wx8hs5M0fmmLYkDp8mHgS4
 n2ajnIrHzg7FOYnd/mbeEr4/InMTyQvgVewVhSJvlvOfzqIBNkLX8QHC7p8jqSiAecl1
 RblRNrrxwi87xrjgzL8th5wDUNm7gJhfoD3P2ftwLGdeqSyYrIvvqtHzJF2nqcHv2rFp
 Db8qaNLJpvbhrargm3Z11lVhfY6a3YcvQf3at83KDQiQLBr8bd3mOfxU7gUXYWu6UYSA
 UI+pprIdhBfYpN2CQCMI8MUp2W2Bix2lv/ToBBWRZfUplvsUQvwBT3/w+m9L3uF/9jkn
 aoPw==
X-Gm-Message-State: AOAM532f1ipzuSgHuXtE55yy9v55+eGpB0XgjgyEskbx/Spvdnsdjgbi
 LMEqyWYxTDxJHXK8pmMRpi9qVg==
X-Google-Smtp-Source: ABdhPJw6OWPStKw1C7K4YHx/OhqZIgosxL33nPy9zcS9zMasbOUXo35uQxAtS/3gptibcdMaPVdQiA==
X-Received: by 2002:aa7:d052:0:b0:42d:d114:43f7 with SMTP id
 n18-20020aa7d052000000b0042dd11443f7mr1028078edo.320.1654106749342; 
 Wed, 01 Jun 2022 11:05:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm1345898edb.13.2022.06.01.11.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 679181FFBF;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 07/33] tests/docker: update debian-armel-cross with lcitool
Date: Wed,  1 Jun 2022 19:05:11 +0100
Message-Id: <20220601180537.2329566-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lcitool to update debian-armel-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220527153603.887929-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 4d1830f3fc..caef7decf4 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -27,8 +27,7 @@ arm64-debian-cross-container:
 
 armel-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-armel-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d6e0710554..d9109bcc77 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
-docker-image-debian-armel-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index b7b1a3585f..a6153e5a83 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -1,26 +1,164 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker armel cross-compiler target
+#  $ lcitool dockerfile --layers all --cross armv6l debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            bash \
+            bc \
+            bsdextrautils \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libpcre2-dev \
+            libspice-protocol-dev \
+            llvm \
+            locales \
+            make \
+            meson \
+            ncat \
+            ninja-build \
+            openssh-client \
+            perl-base \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pillow \
+            python3-pip \
+            python3-sphinx \
+            python3-sphinx-rtd-theme \
+            python3-venv \
+            python3-yaml \
+            rpm2cpio \
+            sed \
+            sparse \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture armel && \
-    apt update && \
-    apt install -yy crossbuild-essential-armel && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a armel --arch-only qemu
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armel && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-arm-linux-gnueabi \
+            gcc-arm-linux-gnueabi \
+            libaio-dev:armel \
+            libasan5:armel \
+            libasound2-dev:armel \
+            libattr1-dev:armel \
+            libbpf-dev:armel \
+            libbrlapi-dev:armel \
+            libbz2-dev:armel \
+            libc6-dev:armel \
+            libcacard-dev:armel \
+            libcap-ng-dev:armel \
+            libcapstone-dev:armel \
+            libcurl4-gnutls-dev:armel \
+            libdaxctl-dev:armel \
+            libdrm-dev:armel \
+            libepoxy-dev:armel \
+            libfdt-dev:armel \
+            libffi-dev:armel \
+            libfuse3-dev:armel \
+            libgbm-dev:armel \
+            libgcrypt20-dev:armel \
+            libglib2.0-dev:armel \
+            libglusterfs-dev:armel \
+            libgnutls28-dev:armel \
+            libgtk-3-dev:armel \
+            libibumad-dev:armel \
+            libibverbs-dev:armel \
+            libiscsi-dev:armel \
+            libjemalloc-dev:armel \
+            libjpeg62-turbo-dev:armel \
+            liblttng-ust-dev:armel \
+            liblzo2-dev:armel \
+            libncursesw5-dev:armel \
+            libnfs-dev:armel \
+            libnuma-dev:armel \
+            libpam0g-dev:armel \
+            libpixman-1-dev:armel \
+            libpng-dev:armel \
+            libpulse-dev:armel \
+            librbd-dev:armel \
+            librdmacm-dev:armel \
+            libsasl2-dev:armel \
+            libsdl2-dev:armel \
+            libsdl2-image-dev:armel \
+            libseccomp-dev:armel \
+            libselinux1-dev:armel \
+            libslirp-dev:armel \
+            libsnappy-dev:armel \
+            libspice-server-dev:armel \
+            libssh-gcrypt-dev:armel \
+            libsystemd-dev:armel \
+            libtasn1-6-dev:armel \
+            libubsan1:armel \
+            libudev-dev:armel \
+            liburing-dev:armel \
+            libusb-1.0-0-dev:armel \
+            libusbredirhost-dev:armel \
+            libvdeplug-dev:armel \
+            libvirglrenderer-dev:armel \
+            libvte-2.91-dev:armel \
+            libzstd-dev:armel \
+            nettle-dev:armel \
+            systemtap-sdt-dev:armel \
+            xfslibs-dev:armel \
+            zlib1g-dev:armel && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'arm'\n\
+endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-gcc
+
+ENV ABI "arm-linux-gnueabi"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabi-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:armel \
-        liblzo2-dev:armel \
-        librdmacm-dev:armel \
-        libsnappy-dev:armel
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 7e4a92f630..4dc5527234 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -105,6 +105,11 @@ try:
                         trailer=debian_cross_build("aarch64-linux-gnu-",
                                                    "aarch64-softmmu,aarch64-linux-user"))
 
+    generate_dockerfile("debian-armel-cross", "debian-11",
+                        cross="armv6l",
+                        trailer=debian_cross_build("arm-linux-gnueabi-",
+                                                   "arm-softmmu,arm-linux-user,armeb-linux-user"))
+
     generate_dockerfile("debian-armhf-cross", "debian-11",
                         cross="armv7l",
                         trailer=debian_cross_build("arm-linux-gnueabihf-",
-- 
2.30.2


