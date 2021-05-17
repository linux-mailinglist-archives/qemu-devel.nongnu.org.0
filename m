Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390EC383977
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:16:57 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifvM-00027x-44
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpU-0007Ua-8s
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpD-00061w-FT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q5so7020357wrs.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rfnchD5SVmgU5vx+Rd3nLxyXpMSnbLzOfkJSsDmY2E=;
 b=ZgjcyiX5iozkT1sQY69udHEGh4oY5tzQ1eNgXiBeTvP0IOr06jvzh7mKW4RAmgufyd
 EzU7sECOIFisv+WcWLSgtsd6Tmp+Wdb+Kcpm63li9cOTMHMOmjjr/qRPDsVf88ytEqJV
 fevEVh7vp736a0kpchNoLSTxD3MDnS6bRTE/sioKzmad7uPkhOxU46Adaecy6jluiby7
 dZ7Vo/TpQtNgtKd7KS/xbs3pV3S72itrVhGa3iNcLF/D5/mZ1toqIUwzN4BhVkVg0Rcp
 W/yg59A/7KiWJj+07BqWZEuHgGdbUmOMNG3tk3vhbAwLzNZaPRgOiC22VE35mgqZIsyv
 /MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rfnchD5SVmgU5vx+Rd3nLxyXpMSnbLzOfkJSsDmY2E=;
 b=Z79i+Bw+5odiosufVAx/QzvnCcj31bfp22VN1Y4DhgcRCRzA6ghm/eIKf0Di9t+s3R
 3aH5bSPY9ibevYo6cw7qXLTYpXAZjWs01K/UAl7oH51xyCUiH5OPH5lCfWOsnDistyi+
 kXo7uJhwSrHves4IAQ+ByeiPt2EHt+QpqvfPRNwMtwPY/5zgSTF2N09sH1ARLY0RsrAp
 Buh1c2G6oq6DLex0B4nyiSvLli/UdW8m6eejgqWMglj2/0CzempvCsA1+XCkiXlIJivk
 OxGaik80N2MPF1KkaNp+3jQXOPe1gLWNS11PnRpvOQcWhkMkSQKhia4K6w5xSYqqnFKu
 lsRQ==
X-Gm-Message-State: AOAM533I7zUaP40xEcL1dhumABFMs/0x8QEDydJpNdw3JIcQSH2zKOeP
 vsYJYY0ZiSu3JwyQCjyV6yH2jA==
X-Google-Smtp-Source: ABdhPJxyL223HTtDrLpNzSRMqAPKebELmV1DRVJBM//nORMSwhks0qt8cFtsRU09ByXdA58+EICmZQ==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr515406wrs.33.1621267833877;
 Mon, 17 May 2021 09:10:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm18318413wrq.26.2021.05.17.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 846021FF91;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/29] docker: Add Hexagon image
Date: Mon, 17 May 2021 17:09:58 +0100
Message-Id: <20210517161022.13984-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This image is a little special because it takes a long time to build.
As such most users don't want to be doing that and just pull random
binaries from the ether as intended by the container gods. This
involves someone with credentials and a beefy machine running:

  make docker-image-debian-hexagon-cross V=1 NOCACHE=1 J=30
  docker tag qemu/debian-hexagon-cross registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross
  docker push registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross

With a suitable binary in the "cloud" a normal user will run:

  make docker-image-debian-hexagon-cross

or have it run for them through the dependency mechanism of our
over-engineered makefiles and get the binary they wanted. There are a
few wrinkles of course including needing to tweak the final image to
have the credentials of the user so we can actually do our cross
compiles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Cc: Alessandro Di Federico <ale@rev.ng>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Brian Cain <bcain@quicinc.com>
Message-Id: <20210512102051.12134-7-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f..7572859317 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -197,6 +197,8 @@ F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: default-configs/targets/hexagon-linux-user.mak
+F: docker/dockerfiles/debian-hexagon-cross.docker
+F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 820423d718..8967ecf118 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -148,6 +148,28 @@ docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
+#
+# The build rule for hexagon-cross is special in so far for most of
+# the time we don't want to build it. While dockers caching does avoid
+# this most of the time sometimes we want to force the issue.
+#
+docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker
+	$(if $(NOCACHE), 								\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) build -t qemu/debian-hexagon-cross -f $< 	\
+			$(if $V,,--quiet) --no-cache 					\
+			--registry $(DOCKER_REGISTRY) --extra-files			\
+			$(DOCKER_FILES_DIR)/debian-hexagon-cross.docker.d/build-toolchain.sh, \
+			"BUILD", "debian-hexagon-cross"),				\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
+				qemu/debian-hexagon-cross $(DOCKER_REGISTRY),		\
+			"FETCH", "debian-hexagon-cross")				\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
+				qemu/debian-hexagon-cross --add-current-user,		\
+			"PREPARE", "debian-hexagon-cross"))
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
new file mode 100644
index 0000000000..d5dc299dc1
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -0,0 +1,45 @@
+#
+# Docker Hexagon cross-compiler target
+#
+# This docker target is used for building hexagon tests. As it also
+# needs to be able to build QEMU itself in CI we include it's
+# build-deps. It is also a "stand-alone" image so as not to be
+# triggered by re-builds on other base images given it takes a long
+# time to build.
+#
+FROM qemu/debian10
+
+# Install common build utilities
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        bison \
+        cmake \
+        flex \
+        lld \
+        rsync \
+        wget
+
+ENV TOOLCHAIN_INSTALL /usr/local
+ENV ROOTFS /usr/local
+
+ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498065e4da92799f613e730d475.tar.gz
+ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
+ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
+
+ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
+
+RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
+
+FROM debian:buster-slim
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+# Install QEMU build deps for use in CI
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy --arch-only qemu
+COPY --from=0 /usr/local /usr/local
+ENV PATH $PATH:/usr/local/bin/
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
new file mode 100755
index 0000000000..19b1c9f83e
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
@@ -0,0 +1,141 @@
+#!/bin/bash
+
+set -e
+
+BASE=$(readlink -f ${PWD})
+
+TOOLCHAIN_INSTALL=$(readlink -f "$TOOLCHAIN_INSTALL")
+ROOTFS=$(readlink -f "$ROOTFS")
+
+TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
+HEX_SYSROOT=${TOOLCHAIN_INSTALL}/hexagon-unknown-linux-musl
+HEX_TOOLS_TARGET_BASE=${HEX_SYSROOT}/usr
+
+function cdp() {
+  DIR="$1"
+  mkdir -p "$DIR"
+  cd "$DIR"
+}
+
+function fetch() {
+  DIR="$1"
+  URL="$2"
+  TEMP="$(readlink -f "$PWD/tmp.tar.gz")"
+  wget --quiet "$URL" -O "$TEMP"
+  cdp "$DIR"
+  tar xaf "$TEMP" --strip-components=1
+  rm "$TEMP"
+  cd -
+}
+
+build_llvm_clang() {
+  fetch "$BASE/llvm-project" "$LLVM_URL"
+  cdp "$BASE/build-llvm"
+
+  cmake -G Ninja \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DCMAKE_INSTALL_PREFIX=${TOOLCHAIN_INSTALL} \
+    -DLLVM_ENABLE_LLD=ON \
+    -DLLVM_TARGETS_TO_BUILD="Hexagon" \
+    -DLLVM_ENABLE_PROJECTS="clang;lld" \
+    "$BASE/llvm-project/llvm"
+  ninja all install
+  cd ${TOOLCHAIN_BIN}
+  ln -sf clang hexagon-unknown-linux-musl-clang
+  ln -sf clang++ hexagon-unknown-linux-musl-clang++
+  ln -sf llvm-ar hexagon-unknown-linux-musl-ar
+  ln -sf llvm-objdump hexagon-unknown-linux-musl-objdump
+  ln -sf llvm-objcopy hexagon-unknown-linux-musl-objcopy
+  ln -sf llvm-readelf hexagon-unknown-linux-musl-readelf
+  ln -sf llvm-ranlib hexagon-unknown-linux-musl-ranlib
+
+  # workaround for now:
+  cat <<EOF > hexagon-unknown-linux-musl.cfg
+-G0 --sysroot=${HEX_SYSROOT}
+EOF
+}
+
+build_clang_rt() {
+  cdp "$BASE/build-clang_rt"
+  cmake -G Ninja \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DLLVM_CONFIG_PATH="$BASE/build-llvm/bin/llvm-config" \
+    -DCMAKE_ASM_FLAGS="-G0 -mlong-calls -fno-pic --target=hexagon-unknown-linux-musl " \
+    -DCMAKE_SYSTEM_NAME=Linux \
+    -DCMAKE_C_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
+    -DCMAKE_ASM_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
+    -DCMAKE_INSTALL_PREFIX=${HEX_TOOLS_TARGET_BASE} \
+    -DCMAKE_CROSSCOMPILING=ON \
+    -DCMAKE_C_COMPILER_FORCED=ON \
+    -DCMAKE_CXX_COMPILER_FORCED=ON \
+    -DCOMPILER_RT_BUILD_BUILTINS=ON \
+    -DCOMPILER_RT_BUILTINS_ENABLE_PIC=OFF \
+    -DCMAKE_SIZEOF_VOID_P=4 \
+    -DCOMPILER_RT_OS_DIR= \
+    -DCAN_TARGET_hexagon=1 \
+    -DCAN_TARGET_x86_64=0 \
+    -DCOMPILER_RT_SUPPORTED_ARCH=hexagon \
+    -DLLVM_ENABLE_PROJECTS="compiler-rt" \
+    "$BASE/llvm-project/compiler-rt"
+  ninja install-compiler-rt
+}
+
+build_musl_headers() {
+  fetch "$BASE/musl" "$MUSL_URL"
+  cd "$BASE/musl"
+  make clean
+  CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
+    CROSS_COMPILE=hexagon-unknown-linux-musl \
+    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
+    CROSS_CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
+    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
+  PATH=${TOOLCHAIN_BIN}:$PATH make CROSS_COMPILE= install-headers
+
+  cd ${HEX_SYSROOT}/..
+  ln -sf hexagon-unknown-linux-musl hexagon
+}
+
+build_kernel_headers() {
+  fetch "$BASE/linux" "$LINUX_URL"
+  mkdir -p "$BASE/build-linux"
+  cd "$BASE/linux"
+  make O=../build-linux ARCH=hexagon \
+   KBUILD_CFLAGS_KERNEL="-mlong-calls" \
+   CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
+   LD=${TOOLCHAIN_BIN}/ld.lld \
+   KBUILD_VERBOSE=1 comet_defconfig
+  make mrproper
+
+  cd "$BASE/build-linux"
+  make \
+    ARCH=hexagon \
+    CC=${TOOLCHAIN_BIN}/clang \
+    INSTALL_HDR_PATH=${HEX_TOOLS_TARGET_BASE} \
+    V=1 \
+    headers_install
+}
+
+build_musl() {
+  cd "$BASE/musl"
+  make clean
+  CROSS_COMPILE=hexagon-unknown-linux-musl- \
+    AR=llvm-ar \
+    RANLIB=llvm-ranlib \
+    STRIP=llvm-strip \
+    CC=clang \
+    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
+    CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
+    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
+  PATH=${TOOLCHAIN_BIN}/:$PATH make CROSS_COMPILE= install
+  cd ${HEX_TOOLS_TARGET_BASE}/lib
+  ln -sf libc.so ld-musl-hexagon.so
+  ln -sf ld-musl-hexagon.so ld-musl-hexagon.so.1
+  cdp ${HEX_TOOLS_TARGET_BASE}/../lib
+  ln -sf ../usr/lib/ld-musl-hexagon.so.1
+}
+
+build_llvm_clang
+build_kernel_headers
+build_musl_headers
+build_clang_rt
+build_musl
-- 
2.20.1


