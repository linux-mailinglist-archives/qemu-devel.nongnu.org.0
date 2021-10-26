Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA243AFFF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:29:04 +0200 (CEST)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJhX-0007b2-9s
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbX-0000t8-7f
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbT-0007QM-FB
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e12so18260641wra.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H8yD/2gRGBDxLd6pT5M2UUlZ2PMMN65AXJnb6WpCya4=;
 b=q9p5aiWEeO8GgwOHDOBKf61FnA+Yvx/YztWHB63erB6vfPmrHfONPQIEMV4OrqNtG3
 /JpJ20oRYe4zWzVyNrF5T0y0y1hxVYHfpZF3gHIwFAnJUc48lsf/dy6UEpz065hTV0gA
 rruR9jDT8D/LTMFcVfvNiT4HSumT4mqND8dYxZsdyHIqiF0U/q/r1Jt6ksC7AqD7AoV0
 2NsOxtMico1qMo0XyzLgardgF5O9vwNgCxlwB/k265jsjHBqHG7pfkYI4dlqNP1DVWvH
 U1g9/H46XF7hWZrckDzaQhn9M0i32Va91GN3IqtWzyqwm/I51egfUZBf5i9/ymDMCMJU
 YsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H8yD/2gRGBDxLd6pT5M2UUlZ2PMMN65AXJnb6WpCya4=;
 b=8Pf215gmfbjYx7dGqZNZfWJMLX4CrpSx2a/g57Jd9+e5xIzhNdTzqMI2NzuhX7JWJG
 vS2cqLeXHQ+HMPAa+ZmgNrfs6zjNYo82ZIJ6ZJh1ca3Tp3jrMAqIHJiUSQmbUlMaSrbq
 14JfR/TbJFeCI/h/iCLVjNf+UKlKMWSU5fz+6i38CTv08Yg9K/pABj+9x9K996e6NPdO
 1qArvKvQBFeVWooAHO6XuAOziO5rKpPJWisIwR0y8F7SCzawNu21M2216sbycytwKv3u
 dlHW33XOwYgoSAoyn/K2EP7iSUJ36b8vacs0dq+ds+EnSB00eYTRPolen3ZRrqqZSETX
 kL/Q==
X-Gm-Message-State: AOAM530IZJdFxPWPnN5B38CbXx7kLZ71IfqoZUvr3/Lhe3u9oYT3pZ70
 MajjR0F0WbXDbEDf9rB7EpOZ6g==
X-Google-Smtp-Source: ABdhPJwPU4xVULrTqtTyK9d8UIvzYmTsSrrgh2jU7y0dJtCAtAEtlmOrpUlmwnd4KPCI90vCO8N2Kg==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr17641635wrd.42.1635243766119; 
 Tue, 26 Oct 2021 03:22:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm176108wmr.31.2021.10.26.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EDAB1FF9D;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/28] tests/docker: Add debian-microblaze-cross image
Date: Tue, 26 Oct 2021 11:22:12 +0100
Message-Id: <20211026102234.3961636-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: Update MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-7-richard.henderson@linaro.org>
---
 MAINTAINERS                                   |  1 +
 tests/docker/Makefile.include                 |  6 ++
 .../build-toolchain.sh                        | 88 +++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index aa515bd313..108fcb799b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -221,6 +221,7 @@ S: Maintained
 F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
+F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 24ed5c1f1d..e943ac33b0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -167,6 +167,10 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
+docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
+    $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
@@ -176,6 +180,7 @@ docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-hexagon-cross: docker-image-debian10
+docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
@@ -185,6 +190,7 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
+DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
diff --git a/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..23ec0aa9a7
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
@@ -0,0 +1,88 @@
+#!/bin/bash
+
+set -e
+
+TARGET=microblaze-linux-musl
+LINUX_ARCH=microblaze
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
+wget https://www.musl-libc.org/releases/musl-1.2.2.tar.gz
+wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.70.tar.xz
+
+tar axf binutils-2.37.tar.xz
+tar axf gcc-11.2.0.tar.xz
+tar axf musl-1.2.2.tar.gz
+tar axf linux-5.10.70.tar.xz
+
+mv binutils-2.37 src-binu
+mv gcc-11.2.0 src-gcc
+mv musl-1.2.2 src-musl
+mv linux-5.10.70 src-linux
+
+mkdir -p bld-hdr bld-binu bld-gcc bld-musl
+mkdir -p ${CROSS_SYSROOT}/usr/include
+
+#
+# Install kernel headers
+#
+
+cd src-linux
+make headers_install ARCH=${LINUX_ARCH} INSTALL_HDR_PATH=${CROSS_SYSROOT}/usr
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
+# Build gcc, just the compiler so far.
+#
+
+cd bld-gcc
+../src-gcc/configure --disable-werror --disable-shared \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET} \
+  --enable-languages=c --disable-libssp --disable-libsanitizer \
+  --disable-libatomic --disable-libgomp --disable-libquadmath
+make -j${J} all-gcc
+make install-gcc
+cd ..
+
+#
+# Build musl.
+# We won't go through the extra step of building shared libraries
+# because we don't actually use them in QEMU docker testing.
+#
+
+cd bld-musl
+../src-musl/configure --prefix=/usr --host=${TARGET} --disable-shared
+make -j${j}
+make install DESTDIR=${CROSS_SYSROOT}
+cd ..
+
+#
+# Go back and build the compiler runtime
+#
+
+cd bld-gcc
+make -j${j}
+make install
+cd ..
-- 
2.30.2


