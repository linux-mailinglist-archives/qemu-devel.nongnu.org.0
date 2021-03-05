Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9332E4BB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:26:06 +0100 (CET)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6ij-0002Qt-Jz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gN-00014Y-Hk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gL-0004Jy-5n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id b18so1277782wrn.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UzYDP9cQ1V8C20NjMVuBOgS/p/If5huR1Br4L+1ZEM=;
 b=efRWbJUl3SG3Mhcd3Hld7DqLL3H/uJmkN/rBTZBe51s/E3Ci1eGboiTa7SzxcJohnS
 0X/oF9qE1ILud5/4J38m3eg9reviPZASyrq70Y2535sQxglU9ab5BGn5cUbWDvVqYWt9
 UXisgbV9fb8bRSK62FBkZBeDq4XD5UenHzCZuOFVKXY90BZqm/jJXOPjVc50LQZ9v2c7
 ZvaLKCKIIgOlKMRtEEs4Pt5SiUNZRp0/hp+z1JIgqUyXp1m9WZKhwHmZiJyneN+aAOU8
 s6Ov1RfyllSqu5FOiAn1KOxOLoLW8/3Y3jMxWJBzRJHUMSd+Y7iOsDe2cRQPlf4sW/Hk
 HKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UzYDP9cQ1V8C20NjMVuBOgS/p/If5huR1Br4L+1ZEM=;
 b=Hv5ASwnaCTLOe1FpsQ/30Otox0/rZcOzx2iiLdnkwZMthIQrAeHRsopi7nw9UUwAmh
 RvXkiTvGurAi5CY3BRC+6zgbiVPq1XjNMU9m27cSjBRS8taSvbWKP9qL9JC0krSg/3sN
 JPdXqmSaawrYB6JcJoeGaiCRc8tAUDAZnVY6ZVR+gMXFL3nkvOVKRmpgPKcnpwDEFTnV
 erj3Uly5HBvcrBLPvuI2nEZWa3/9ZQ9iQDKWghjyJZ38OEVNM0PwKEzkMG6AnSZpuj2q
 8yol2EnepmhtPxvaRXZk0bovKPnYbAoNCOy7WUmdD0uksihpvZzKiWjGzhFCk2muY8ve
 Z2FA==
X-Gm-Message-State: AOAM5301jrGPsDLjXVADLRkrngkdXPC3N6R3cG7HXi5rgQDiwABK/G/3
 tNx10G6lqjeXCnQUT0usdIoq1Q==
X-Google-Smtp-Source: ABdhPJxFcf6N5aqrqDvbtRsselKpi3MxKYtlSy3176tcpk59QqR+m53JA/b99r0Jka5Dxs8hZyWsrA==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8273713wrn.394.1614936215821; 
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c128sm16325664wme.3.2021.03.05.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 543AD1FF90;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/9] docker: Add Hexagon image
Date: Fri,  5 Mar 2021 09:23:23 +0000
Message-Id: <20210305092328.31792-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Base on qemu/debian10, add missing EXTRA_FILES, remove X86]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Brian Cain <bcain@quicinc.com>
Message-Id: <20210228222314.304787-2-f4bug@amsat.org>
[AJB: add build-dep for QEMU, include in MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

squash! docker: Add Hexagon image
---
 MAINTAINERS                                   |   2 +
 tests/docker/Makefile.include                 |   2 +
 .../dockerfiles/debian-hexagon-cross.docker   |  27 ++++
 .../build-toolchain.sh                        | 141 ++++++++++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..1443278059 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -196,6 +196,8 @@ F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: default-configs/targets/hexagon-linux-user.mak
+F: docker/dockerfiles/debian-hexagon-cross.docker
+F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7cab761bf5..3aee031c4e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -144,6 +144,8 @@ docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
+docker-image-debian-hexagon-cross: \
+	EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
new file mode 100644
index 0000000000..bf32536896
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -0,0 +1,27 @@
+FROM qemu/debian10
+
+# What we need to build QEMU itself (as this is used in CI as well)
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy qemu
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        bison \
+        cmake \
+        flex \
+        lld \
+        rsync \
+        wget
+
+ENV TOOLCHAIN_INSTALL /usr
+ENV ROOTFS /usr
+
+ENV LLVM_URL https://github.com/llvm/llvm-project/archive/3d8149c2a1228609fd7d7c91a04681304a2f0ca9.tar.gz
+ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
+ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
+
+ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
+
+RUN ( cd /root/hexagon-toolchain && ./build-toolchain.sh ) && \
+    rm -rf /root/hexagon-toolchain
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


