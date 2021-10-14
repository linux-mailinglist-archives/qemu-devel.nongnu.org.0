Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CF42E475
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:52:46 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9af-0006fi-Ac
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sz-00033m-Px
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:49 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sv-0004ND-Ie
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:49 -0400
Received: by mail-pf1-x434.google.com with SMTP id 187so6706054pfc.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aczB35SHWFaFaMgBb9g1Ob+SREIcDIjaeXltlaQr3r0=;
 b=oDfbWoORcP1fbUG0GxKUoVaVplDA9EINPhDnwJGNkHuZwpJjZxyVfMirL6vP+CZSyS
 9mQuYxiapot7+pFEJt1LUv5V3Yb5GsmlLTX7/M2zTSExqOhOET2RZT9XC0Cld8nHTns9
 mmEd87we0jyxhW8mYqi2Qh52mVRcXrcH99dScwfc9fCYLVJPj+uSnbiff3g1UL2KIlcG
 tuSbbj3Q8hAEYnYXd4RzGhVOXjdTQqtVW741//QMQzRZGkNNxGEzz8TH8r0d7NKHGfM/
 4eDE3WOeLw3uvyiCLlXaYU2Yf6nV8f29zreTTAuqbvvHAyAFXrBXfikSqKVBFnx3Ifwd
 n0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aczB35SHWFaFaMgBb9g1Ob+SREIcDIjaeXltlaQr3r0=;
 b=pPxAFq5wG9cNsZA1hzMC6TgQZtlNjkpcqo9hEc9lFhEhWDA1Hf+sDuNCj9VwGB9n/r
 YvSpNnDOH3TB9f4NY29zAvbG7/9L3Yv09VcbENs0mMuWRhvW6RnBrBM3hus43lgc5NEa
 AtZ86kPrzhIYDKY6mGBYv1tSTWNEnC8mcOrMAoUb1NkBMACzqzU4kmV8RfuSMlv8VaHH
 rSXFtB+vLzIgf1piwdqS59EPwnBf4IJAEXTebsJF/XWb6sEe/U3qTeSWiqGfR9Kp5xPA
 LNlv3D8ZwVwQlbY1PSmMzC1rbRnTMxJoiRdGfqxl6TxuwEHjleQG+rq6TDzyHfyb8PBF
 Gmqw==
X-Gm-Message-State: AOAM532RmvBOjx/X7FD9tJIdC5LW+vEIn2AIhGX0uAKwVQOW+ApirFxW
 j/Fyd+daPZ1ZZZFtuU2XZEEuL6TKjzgslA==
X-Google-Smtp-Source: ABdhPJxPNBKezNghNBSlUAHw1XvBWIk7MsSrBRfcx/FpG48ySXDZWY9iFUlJvK1gvpZyHoM3ePj1rA==
X-Received: by 2002:a62:6243:0:b0:44b:e10e:61b0 with SMTP id
 w64-20020a626243000000b0044be10e61b0mr7706713pfb.53.1634251483860; 
 Thu, 14 Oct 2021 15:44:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] tests/docker: Add debian-nios2-cross image
Date: Thu, 14 Oct 2021 15:44:33 -0700
Message-Id: <20211014224435.2539547-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include                 | 24 +++++
 .../debian-nios2-cross.d/build-toolchain.sh   | 87 +++++++++++++++++++
 .../dockerfiles/debian-toolchain.docker       | 36 ++++++++
 3 files changed, 147 insertions(+)
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d223100dff..772e0968aa 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -148,11 +148,34 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
+debian-toolchain-run = \
+	$(if $(NOCACHE), 						\
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
+			$(if $V,,--quiet) --no-cache 			\
+			--registry $(DOCKER_REGISTRY) --extra-files	\
+			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
+			"BUILD", $1),				        \
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)	\
+				qemu/$1 $(DOCKER_REGISTRY),		\
+			"FETCH", $1)					\
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 	\
+				qemu/$1 --add-current-user,		\
+			"PREPARE", $1))
+debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
+
+docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
+    $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-hexagon-cross: docker-image-debian10
+docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
@@ -161,6 +184,7 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
+DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..ba3c9d8aff
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
@@ -0,0 +1,87 @@
+#!/bin/bash
+
+set -e
+
+TARGET=nios2-linux-gnu
+LINUX_ARCH=nios2
+
+J=$(expr $(nproc) / 2)
+TOOLCHAIN_INSTALL=/usr/local
+TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
+CROSS_SYSROOT=${TOOLCHAIN_INSTALL}/$TARGET/sys-root
+
+export PATH=${TOOLCHAIN_BIN}:$PATH
+
+#
+# Grab all of the source for the toolchain bootstrap.
+#
+
+wget https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
+wget https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
+wget https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
+wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.70.tar.xz
+
+tar axf binutils-2.37.tar.xz
+tar axf gcc-11.2.0.tar.xz
+tar axf glibc-2.34.tar.xz
+tar axf linux-5.10.70.tar.xz
+
+mv binutils-2.37 src-binu
+mv gcc-11.2.0 src-gcc
+mv glibc-2.34 src-glibc
+mv linux-5.10.70 src-linux
+
+mkdir -p bld-hdr bld-binu bld-gcc bld-glibc
+mkdir -p ${CROSS_SYSROOT}/usr/include
+
+#
+# Install kernel and glibc headers
+#
+
+cd src-linux
+make headers_install ARCH=${LINUX_ARCH} INSTALL_HDR_PATH=${CROSS_SYSROOT}/usr
+cd ..
+
+cd bld-hdr
+../src-glibc/configure --prefix=/usr --host=${TARGET}
+make install-headers DESTDIR=${CROSS_SYSROOT}
+touch ${CROSS_SYSROOT}/usr/include/gnu/stubs.h
+cd ..
+
+#
+# Build binutils
+#
+
+cd bld-binu
+../src-binu/configure --disable-werror \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET}
+make -j${J}
+make install
+cd ..
+
+#
+# Build gcc, without shared libraries, because we do not yet
+# have a shared libc against which to link.
+#
+
+cd bld-gcc
+../src-gcc/configure --disable-werror --disable-shared \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET} \
+  --enable-languages=c --disable-libssp --disable-libsanitizer \
+  --disable-libatomic --disable-libgomp --disable-libquadmath
+make -j${J}
+make install
+cd ..
+
+#
+# Build glibc
+# There are a few random things that use c++ but we didn't build that
+# cross-compiler.  We can get away without them.  Disable CXX so that
+# glibc doesn't try to use the host c++ compiler.
+#
+
+cd bld-glibc
+CXX=false ../src-glibc/configure --prefix=/usr --host=${TARGET}
+make -j${j}
+make install DESTDIR=${CROSS_SYSROOT}
+cd ..
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
new file mode 100644
index 0000000000..738d808aa6
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -0,0 +1,36 @@
+#
+# Docker toolchain cross-compiler
+#
+# This dockerfile is used for building a cross-compiler toolchain.
+# The script for building the toolchain is supplied via extra-files.
+#
+FROM qemu/debian10
+
+# Install build utilities for building gcc and glibc.
+# ??? The build-dep isn't working, missing a number of
+# minimal build dependiencies, e.g. libmpc.
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        bison \
+        flex \
+        gawk \
+        libmpc-dev \
+        libmpfr-dev \
+        rsync \
+        texinfo \
+        wget && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy --arch-only gcc glibc
+
+ADD build-toolchain.sh /root/build-toolchain.sh
+
+RUN cd /root && ./build-toolchain.sh
+
+# Throw away the extra toolchain build deps, the downloaded source,
+# and the build trees by restoring the original debian10 image,
+# then copying the built toolchain from stage 0.
+FROM qemu/debian10
+COPY --from=0 /usr/local /usr/local
-- 
2.25.1


