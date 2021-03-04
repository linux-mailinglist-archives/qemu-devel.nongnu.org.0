Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC832D1EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:41:03 +0100 (CET)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmLm-0000pV-6z
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHmKa-0000LD-Ia
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:39:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHmKW-0005uq-LW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:39:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so27265869wry.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 03:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mjo595EgRooDhcY5a/Nmkr5QiCQxUAecgeDW0qHXV34=;
 b=gJ27r2EQPHOsTAgItj/elWQgQmZk+viZxasVwgmAPyHKJfW2KOrlxjyT+a/g0KkqEe
 UJlBbJwgioFPhLmyGSbTpTbK93+cnHPoEULeASZv3W8okAMEwZpQbjQdCsASktvX3JbF
 8aMGne9Mc6n5gN6rtnAm7XpIPKFGQHE7cuRUDajqmujuIhBc73pBYjhmLSX0Nw5Ou33V
 7w6W7+xnB1pNrsAPpqWh/ZXb9aJ3isT8Db9YkWdU0iMOcWA0l8PBJQByE9fXPD3YGqQX
 ZMSqW7fsiHN7ye4S3770Itn2oU4GoSHTywiH0mAl+uoFm3SnSQ0QJXcw/fTdIbwECx6G
 idrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mjo595EgRooDhcY5a/Nmkr5QiCQxUAecgeDW0qHXV34=;
 b=Z20x59bgR79OQmZ8EoqlJNSZOyGZIt4rWP0sUpQScOnxAsp3hUpsR9UOBZoq9vpjSs
 X0RwKl9m+jDfopySlVqYLgdfTaoPSpYOhe+yz8zocgdd9nrVXBxgg2yO0OrixzQnSldw
 dwbQ/aqqXZIcXY3hBVYfzPG6b/U74qviNBcW/UJnfIC4dC8D1e4qnA7hNcEsNaQSyKkx
 ZCsWvwkmsZW1A2uV8NldFGiHVmSVQWLgDg7YCCGVVgYlKpzdJqmTRPbi5bYZDo0nh1dz
 8edoHU0PO+yj2nMqte0d8LKwT7hyBCFs47Z1jwFi5J/kNlvcysML1YhuKCrtCQVoRq7J
 RykQ==
X-Gm-Message-State: AOAM530RR8G1IN2djWZIsUpbTJ5gy07mBPsFGlyqPDOhrbLpPKOjK681
 NL8plzTwnIGRTgAhOBXC7fbRgg==
X-Google-Smtp-Source: ABdhPJxVqxIhjVjXyqxszZGkFgvtEeAbvl7hxXy5V+7oJHktcsNRFX6dk8iaTvYKGvdFivo9QqMG0w==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr3523420wrd.424.1614857983013; 
 Thu, 04 Mar 2021 03:39:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q25sm9054549wmq.15.2021.03.04.03.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:39:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1126D1FF7E;
 Thu,  4 Mar 2021 11:39:41 +0000 (GMT)
References: <20210228222314.304787-1-f4bug@amsat.org>
 <20210228222314.304787-2-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] docker: Add Hexagon image
Date: Thu, 04 Mar 2021 11:37:45 +0000
In-reply-to: <20210228222314.304787-2-f4bug@amsat.org>
Message-ID: <878s73gnb6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> From: Alessandro Di Federico <ale@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> [PMD: Base on qemu/debian10, add missing EXTRA_FILES, remove X86]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/docker/Makefile.include                 |   2 +
>  .../dockerfiles/debian-hexagon-cross.docker   |  23 +++
>  .../build-toolchain.sh                        | 141 ++++++++++++++++++
>  3 files changed, 166 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.=
d/build-toolchain.sh
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 7cab761bf5b..3aee031c4e9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -144,6 +144,8 @@ docker-image-debian-riscv64-cross: docker-image-debia=
n10
>  docker-image-debian-s390x-cross: docker-image-debian10
>  docker-image-debian-sh4-cross: docker-image-debian10
>  docker-image-debian-sparc64-cross: docker-image-debian10
> +docker-image-debian-hexagon-cross: \
> +	EXTRA_FILES:=3D$(SRC_PATH)/tests/docker/dockerfiles/debian-hexagon-cros=
s.docker.d/build-toolchain.sh
>=20=20
>  # Specialist build images, sometimes very limited tools
>  docker-image-debian-tricore-cross: docker-image-debian10
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests=
/docker/dockerfiles/debian-hexagon-cross.docker
> new file mode 100644
> index 00000000000..7aa28767311
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -0,0 +1,23 @@
> +FROM qemu/debian10
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt install -y --no-install-recommends \
> +        bison \
> +        cmake \
> +        flex \
> +        lld \
> +        rsync \
> +        wget
> +
> +ENV TOOLCHAIN_INSTALL /usr
> +ENV ROOTFS /usr
> +
> +ENV LLVM_URL https://github.com/llvm/llvm-project/archive/3d8149c2a12286=
09fd7d7c91a04681304a2f0ca9.tar.gz
> +ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3=
691905aa1af6c0778c.tar.gz
> +ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.=
tar.xz
> +
> +ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
> +
> +RUN ( cd /root/hexagon-toolchain && ./build-toolchain.sh ) && \
> +    rm -rf /root/hexagon-toolchain

So this is attempting to everything in one step so we don't inflate the
layers too much?

I believe this is something multi-stage builds are meant to deal with:

  https://docs.docker.com/develop/develop-images/multistage-build/

but I've not gotten one to work in practice. For now I'm trying this out
on my beefy machine and I'll see if I have the permissions required to
upload it to gitlab.

> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build=
-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/buil=
d-toolchain.sh
> new file mode 100755
> index 00000000000..19b1c9f83e1
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolch=
ain.sh
> @@ -0,0 +1,141 @@
> +#!/bin/bash
> +
> +set -e
> +
> +BASE=3D$(readlink -f ${PWD})
> +
> +TOOLCHAIN_INSTALL=3D$(readlink -f "$TOOLCHAIN_INSTALL")
> +ROOTFS=3D$(readlink -f "$ROOTFS")
> +
> +TOOLCHAIN_BIN=3D${TOOLCHAIN_INSTALL}/bin
> +HEX_SYSROOT=3D${TOOLCHAIN_INSTALL}/hexagon-unknown-linux-musl
> +HEX_TOOLS_TARGET_BASE=3D${HEX_SYSROOT}/usr
> +
> +function cdp() {
> +  DIR=3D"$1"
> +  mkdir -p "$DIR"
> +  cd "$DIR"
> +}
> +
> +function fetch() {
> +  DIR=3D"$1"
> +  URL=3D"$2"
> +  TEMP=3D"$(readlink -f "$PWD/tmp.tar.gz")"
> +  wget --quiet "$URL" -O "$TEMP"
> +  cdp "$DIR"
> +  tar xaf "$TEMP" --strip-components=3D1
> +  rm "$TEMP"
> +  cd -
> +}
> +
> +build_llvm_clang() {
> +  fetch "$BASE/llvm-project" "$LLVM_URL"
> +  cdp "$BASE/build-llvm"
> +
> +  cmake -G Ninja \
> +    -DCMAKE_BUILD_TYPE=3DRelease \
> +    -DCMAKE_INSTALL_PREFIX=3D${TOOLCHAIN_INSTALL} \
> +    -DLLVM_ENABLE_LLD=3DON \
> +    -DLLVM_TARGETS_TO_BUILD=3D"Hexagon" \
> +    -DLLVM_ENABLE_PROJECTS=3D"clang;lld" \
> +    "$BASE/llvm-project/llvm"
> +  ninja all install
> +  cd ${TOOLCHAIN_BIN}
> +  ln -sf clang hexagon-unknown-linux-musl-clang
> +  ln -sf clang++ hexagon-unknown-linux-musl-clang++
> +  ln -sf llvm-ar hexagon-unknown-linux-musl-ar
> +  ln -sf llvm-objdump hexagon-unknown-linux-musl-objdump
> +  ln -sf llvm-objcopy hexagon-unknown-linux-musl-objcopy
> +  ln -sf llvm-readelf hexagon-unknown-linux-musl-readelf
> +  ln -sf llvm-ranlib hexagon-unknown-linux-musl-ranlib
> +
> +  # workaround for now:
> +  cat <<EOF > hexagon-unknown-linux-musl.cfg
> +-G0 --sysroot=3D${HEX_SYSROOT}
> +EOF
> +}
> +
> +build_clang_rt() {
> +  cdp "$BASE/build-clang_rt"
> +  cmake -G Ninja \
> +    -DCMAKE_BUILD_TYPE=3DRelease \
> +    -DLLVM_CONFIG_PATH=3D"$BASE/build-llvm/bin/llvm-config" \
> +    -DCMAKE_ASM_FLAGS=3D"-G0 -mlong-calls -fno-pic --target=3Dhexagon-un=
known-linux-musl " \
> +    -DCMAKE_SYSTEM_NAME=3DLinux \
> +    -DCMAKE_C_COMPILER=3D"${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-cl=
ang" \
> +    -DCMAKE_ASM_COMPILER=3D"${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-=
clang" \
> +    -DCMAKE_INSTALL_PREFIX=3D${HEX_TOOLS_TARGET_BASE} \
> +    -DCMAKE_CROSSCOMPILING=3DON \
> +    -DCMAKE_C_COMPILER_FORCED=3DON \
> +    -DCMAKE_CXX_COMPILER_FORCED=3DON \
> +    -DCOMPILER_RT_BUILD_BUILTINS=3DON \
> +    -DCOMPILER_RT_BUILTINS_ENABLE_PIC=3DOFF \
> +    -DCMAKE_SIZEOF_VOID_P=3D4 \
> +    -DCOMPILER_RT_OS_DIR=3D \
> +    -DCAN_TARGET_hexagon=3D1 \
> +    -DCAN_TARGET_x86_64=3D0 \
> +    -DCOMPILER_RT_SUPPORTED_ARCH=3Dhexagon \
> +    -DLLVM_ENABLE_PROJECTS=3D"compiler-rt" \
> +    "$BASE/llvm-project/compiler-rt"
> +  ninja install-compiler-rt
> +}
> +
> +build_musl_headers() {
> +  fetch "$BASE/musl" "$MUSL_URL"
> +  cd "$BASE/musl"
> +  make clean
> +  CC=3D${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
> +    CROSS_COMPILE=3Dhexagon-unknown-linux-musl \
> +    LIBCC=3D${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
> +    CROSS_CFLAGS=3D"-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --targ=
et=3Dhexagon-unknown-linux-musl" \
> +    ./configure --target=3Dhexagon --prefix=3D${HEX_TOOLS_TARGET_BASE}
> +  PATH=3D${TOOLCHAIN_BIN}:$PATH make CROSS_COMPILE=3D install-headers
> +
> +  cd ${HEX_SYSROOT}/..
> +  ln -sf hexagon-unknown-linux-musl hexagon
> +}
> +
> +build_kernel_headers() {
> +  fetch "$BASE/linux" "$LINUX_URL"
> +  mkdir -p "$BASE/build-linux"
> +  cd "$BASE/linux"
> +  make O=3D../build-linux ARCH=3Dhexagon \
> +   KBUILD_CFLAGS_KERNEL=3D"-mlong-calls" \
> +   CC=3D${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
> +   LD=3D${TOOLCHAIN_BIN}/ld.lld \
> +   KBUILD_VERBOSE=3D1 comet_defconfig
> +  make mrproper
> +
> +  cd "$BASE/build-linux"
> +  make \
> +    ARCH=3Dhexagon \
> +    CC=3D${TOOLCHAIN_BIN}/clang \
> +    INSTALL_HDR_PATH=3D${HEX_TOOLS_TARGET_BASE} \
> +    V=3D1 \
> +    headers_install
> +}
> +
> +build_musl() {
> +  cd "$BASE/musl"
> +  make clean
> +  CROSS_COMPILE=3Dhexagon-unknown-linux-musl- \
> +    AR=3Dllvm-ar \
> +    RANLIB=3Dllvm-ranlib \
> +    STRIP=3Dllvm-strip \
> +    CC=3Dclang \
> +    LIBCC=3D${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
> +    CFLAGS=3D"-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=3Dh=
exagon-unknown-linux-musl" \
> +    ./configure --target=3Dhexagon --prefix=3D${HEX_TOOLS_TARGET_BASE}
> +  PATH=3D${TOOLCHAIN_BIN}/:$PATH make CROSS_COMPILE=3D install
> +  cd ${HEX_TOOLS_TARGET_BASE}/lib
> +  ln -sf libc.so ld-musl-hexagon.so
> +  ln -sf ld-musl-hexagon.so ld-musl-hexagon.so.1
> +  cdp ${HEX_TOOLS_TARGET_BASE}/../lib
> +  ln -sf ../usr/lib/ld-musl-hexagon.so.1
> +}
> +
> +build_llvm_clang
> +build_kernel_headers
> +build_musl_headers
> +build_clang_rt
> +build_musl


--=20
Alex Benn=C3=A9e

