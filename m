Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D54446DD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:17:33 +0100 (CET)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJtE-0006yZ-5v
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiF-0003d0-DI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiD-0003YI-2W
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso3778273wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EaaPl8F8ppW5z5fedqGy1eQqxGS9mK5OSP2e+zsFqfU=;
 b=QAP2DLNudG/OHcJBNv0vXa7iFZMLj37Y6sgQ1fEXvrPgtFuvU/Ay9zoM+G90lfrThZ
 X92c131LURgdjwNqruf4Rp9i5uIQoISrQyRRmjbFQzS+8KnWaelTW6aih/51u4S/+tgW
 lwxPCMiuNyz4vpYaWbgDixKhaFYeHqi2EuZ+P/2yUVu+88H8pi3RJzwotQFwf03PFnt5
 XVH9FDM61OEwV22oMIDvVJEaFOheC1xV60B1sy92FuSiA+DKUtdGojkYDGQx5XmO2Rqz
 NgslImk1Tf8R4ucf2ApKewczl3sYlvVEjghw69dYGDCLsdJWRPzODm/pRqR2WJa3vUTn
 jvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EaaPl8F8ppW5z5fedqGy1eQqxGS9mK5OSP2e+zsFqfU=;
 b=RNq4p9TVjtw52Hb72o/JsIKXHlLKN50G1ofKqs+voiIS4jKzb+LqDULAF44F7iC8xO
 /xMQpTC4kJrz/4P/n3zF2G/+G356RyKuVXc4kGr+zKwueBVu7zoV0zdhO2easxtAuBXQ
 efI47dV3uVdNPacmpR/M9R81ZjlbtsTje9UukvYgjybTkY0CgMu8fBinM6+yYHwcT6Cn
 DGFErzA/602e7sSb6YGwiOeBc8SJxGJsvmxPTtEeKMQ0rFRh/H5rwefQpGgjaVM3Lv2K
 CovVJPZrgltxZEAF9S9sXdQDVIFNCMtpiabsZbEucSwfnQ9cpAFdOvhI5XNWB/noFNWD
 tmVw==
X-Gm-Message-State: AOAM532Elk1SmUQkWw5HE9qc7F+7nD5GC2HqawUnqBDat8npXWY778uJ
 JydpWXRtyzfH4ffjachGE4xZyA==
X-Google-Smtp-Source: ABdhPJzoAfUaVKwt0aKzz0dnnSslxNWKwxIekAXbWtf0xtURdsgMAc/9JTtl1PZQRx6+HS5v6D3kIA==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr16838777wme.36.1635959167302; 
 Wed, 03 Nov 2021 10:06:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o1sm2498218wru.91.2021.11.03.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1D2A1FF9B;
 Wed,  3 Nov 2021 17:05:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/21] tests/docker: Add debian-microblaze-cross image
Date: Wed,  3 Nov 2021 17:05:41 +0000
Message-Id: <20211103170558.717981-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: Update MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-7-richard.henderson@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211026102234.3961636-7-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index e07134aa28..a4d7a6f2e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -227,6 +227,7 @@ S: Maintained
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


