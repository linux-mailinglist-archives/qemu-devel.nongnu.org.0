Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07B3274CA
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:26:16 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUVz-000808-Ok
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTF-0006hj-MS
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTD-0005WX-LG
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:25 -0500
Received: by mail-wm1-x331.google.com with SMTP id u187so9917036wmg.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zyfKrzDat4Edt3JBV2c7wDoLMtVDA23Fg8bcGHlQkrI=;
 b=VJnyi3ntWVu97W7gvEsz+RTvRJirTER3gNhT2oTsYnLvdwKJMTZFe2Meu3uWTIsJsd
 vIHr7q5yL1eOKDAkHVq08vqG6dq896uPq9c1FcXKH9OVWJ2YLQq0RnrBYV6NI8DtenBe
 GkBw0GCOU2N8SdnOnmm1c0xzxPCrGpUtYeLHw4sEFqwcuIOF5VQ4BQ6/MWs5v0Is0/II
 shL8aFRN66aNmIjtsgtWUGCWRIOeb45HkwKPhhhwDHYWvXvG1AnVHftS0I90nB36lsKj
 c0Y8KiVmhAQv9Kih1vCf3D87MjmUlaymunpEHAREFBAqTSvaZaouH1TxJJjEX6uiYmUk
 1wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zyfKrzDat4Edt3JBV2c7wDoLMtVDA23Fg8bcGHlQkrI=;
 b=PuxmG/dyVxabfw370SjIUwUhaZiU2ceNh+MISirELL+IsfUaChlMfnzy7R2DHOf0z+
 d+deG+mvd5iEeJ9wUkBAPptkUIVCzd2EZfCPhG87G4h/r0FVc6WOPENTmvOw4cSyRyXM
 XEd96aaKHS7pvZYTFTUhu+2mcjqECl7QU0WxBNcfSD8d+RifRBwnVqZd+Sb8h5coNiB8
 LA9U1hWYsnI4Yxj0SLjH8gBZ1yI6TlTIfpMGRoaSiCNzKCMOGCg0psr/E3clgr1E7eAX
 bXOJBIIgORHzLvLDrLTDFfvdwQG/vhzlHVIXHCdbmHHSMPBuIl9nqYtcppXw+0VEvkHP
 krMA==
X-Gm-Message-State: AOAM532qe2pRg6sIabmOdVjIRUMg0CcIokYLwDs6+fh2SO/Qo3Z5xdHq
 IfDvKhvBBDV55OOlB9ZAuWQBkH30vRk=
X-Google-Smtp-Source: ABdhPJyI33BOhE9FCl7APhoNJLenObPykZ0akT0N6FagORPq+9mC6xYLY4eDAnzr0Ic7yxETtgBiBg==
X-Received: by 2002:a1c:20c7:: with SMTP id
 g190mr12629306wmg.156.1614551001951; 
 Sun, 28 Feb 2021 14:23:21 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm20270852wmb.33.2021.02.28.14.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:23:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] docker: Add Hexagon image
Date: Sun, 28 Feb 2021 23:23:11 +0100
Message-Id: <20210228222314.304787-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
References: <20210228222314.304787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
[PMD: Base on qemu/debian10, add missing EXTRA_FILES, remove X86]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include                 |   2 +
 .../dockerfiles/debian-hexagon-cross.docker   |  23 +++
 .../build-toolchain.sh                        | 141 ++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7cab761bf5b..3aee031c4e9 100644
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
index 00000000000..7aa28767311
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -0,0 +1,23 @@
+FROM qemu/debian10
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
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
index 00000000000..19b1c9f83e1
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
2.26.2


