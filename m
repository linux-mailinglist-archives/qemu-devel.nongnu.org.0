Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4EC591FED
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 15:49:38 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNDzk-0000tW-8S
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 09:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNDyA-0006fX-Ib
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 09:47:58 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:41971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNDy8-0006gE-EE
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 09:47:58 -0400
Received: by mail-qt1-x82b.google.com with SMTP id c20so3937154qtw.8
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2DJYZM3aFwey+M0xE9dcbEKZGi5URIHdT3tZNs3ERiI=;
 b=Xhkw16K6hAK7+xJKJpateW6UhVRzW/yFvtpW3XgFPlSocAuQklLD+1l7DzEVqkzNJ+
 I/2ikn7INkLxNqGJSfGQo/ysP7AG2I1j8DGC8SVvgRI2djiFkaJFHr/XCMwFPc0KoXOi
 GDF8FV1l9lszvIaVJEad5B7U1To1kreunh2FEnKZDfULICVN3nIAgGcShsColSKYlMqv
 kqKwX9Rq3eRgnLe8I7RFpXwX6jIVqR1qSRtfpGA+UABmzP/iDKU4nX7jKYrn7AO2SKIZ
 wrvEPUOEDPw/StyRDo6BtmuAics+YCIqZK0qL0PuoJe6IMl5kjN62X3fVACneBl2q233
 VvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2DJYZM3aFwey+M0xE9dcbEKZGi5URIHdT3tZNs3ERiI=;
 b=XVSTvapQ5qmVJh3YzU9TsQMRK+xRxZSSED/nZaSB+2KqGu0uBTgX9WY7ceuOY+TYIU
 ZXOGiqRqlUtGKiXesx7/MXqOIrO//eRzp8W74xa/tiPRSjJr98CLS/ytz2goaUD4pCfa
 9xrqVIe3ntEzEmyy+UltCmPGrKmhoLnICae3Qyy9pyEIzi7eybJSGJQP6ljtTZ8IG8Se
 YsJTFuf6kr1gYBDKIpIbZIw+WGcHEDOwob3amdyvU5VKJugQ9Esdxx3p/I2HQAzs0/zG
 NzfupvslE16xfK8sASso3JD5X3AwI23tEuAmk8amhhucYy6WAv4phHrqNw4ltlUkTnoP
 eu8g==
X-Gm-Message-State: ACgBeo0h51MabaIgTSDwOkcWAJw/lQ/WxtExA8g3Wv3T39KIQFgCsKUk
 PGqHsdjLfk9lb9B8hNVFcHjVoCbBoO1/UA==
X-Google-Smtp-Source: AA6agR4F59wTcGEbM2GFK6OzrMwNfvOehA2k5pgPQ9q8mXhQrZpbDTMaIssiQPqTLNAsG7ugmqjz4A==
X-Received: by 2002:ac8:5901:0:b0:344:5846:129e with SMTP id
 1-20020ac85901000000b003445846129emr1473172qty.469.1660484874935; 
 Sun, 14 Aug 2022 06:47:54 -0700 (PDT)
Received: from stoup.. ([50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 u67-20020ae9d846000000b006b89b9024ddsm6224456qkf.24.2022.08.14.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 06:47:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Song Gao <gaosong@loongson.cn>
Subject: [PULL 1/1] docs/system/loongarch: Update the LoongArch document
Date: Sun, 14 Aug 2022 08:47:45 -0500
Message-Id: <20220814134745.8824-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220814134745.8824-1-richard.henderson@linaro.org>
References: <20220814134745.8824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

1. Add some information about how to boot the LoongArch virt
machine by uefi bios and linux kernel and how to access the
source code or binary file.
2. Move the explanation of LoongArch system emulation in the
target/loongarch/README to docs/system/loongarch/loongson3.rst

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220812091957.3338126-1-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/loongarch/loongson3.rst | 104 +++++++++++++++++++++++++---
 target/loongarch/README             |  49 +------------
 2 files changed, 97 insertions(+), 56 deletions(-)

diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
index fa3acd01c0..1bdab44e27 100644
--- a/docs/system/loongarch/loongson3.rst
+++ b/docs/system/loongarch/loongson3.rst
@@ -15,27 +15,115 @@ The ``virt`` machine supports:
 - Gpex host bridge
 - Ls7a RTC device
 - Ls7a IOAPIC device
-- Ls7a ACPI device
+- ACPI GED device
 - Fw_cfg device
 - PCI/PCIe devices
 - Memory device
-- CPU device. Type: Loongson-3A5000.
+- CPU device. Type: la464-loongarch-cpu.
 
 CPU and machine Type
 --------------------
 
 The ``qemu-system-loongarch64`` provides emulation for virt
 machine. You can specify the machine type ``virt`` and
-cpu type ``Loongson-3A5000``.
+cpu type ``la464-loongarch-cpu``.
 
 Boot options
 ------------
 
-Now the ``virt`` machine can run test program in ELF format and the
-method of compiling is in target/loongarch/README.
+We can boot the LoongArch virt machine by specifying the uefi bios,
+initrd, and linux kernel. And those source codes and binary files
+can be accessed by following steps.
+
+(1) booting command:
 
 .. code-block:: bash
 
-  $ qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 \
-      -smp 1 -kernel hello -monitor none -display none \
-      -chardev file,path=hello.out,id=output -serial chardev:output
+  $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
+      -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
+      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
+      --nographic
+
+Note: The running speed may be a little slow, as the performance of our
+qemu and uefi bios is not perfect, and it is being fixed.
+
+(2) cross compiler tools:
+
+.. code-block:: bash
+
+  wget https://github.com/loongson/build-tools/releases/download/ \
+  2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
+
+  tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
+
+(3) qemu compile configure option:
+
+.. code-block:: bash
+
+  ./configure --disable-rdma --disable-pvrdma --prefix=usr \
+              --target-list="loongarch64-softmmu" \
+              --disable-libiscsi --disable-libnfs --disable-libpmem \
+              --disable-glusterfs --enable-libusb --enable-usb-redir \
+              --disable-opengl --disable-xen --enable-spice \
+              --enable-debug --disable-capstone --disable-kvm \
+              --enable-profiler
+  make
+
+(4) uefi bios source code and compile method:
+
+.. code-block:: bash
+
+  git clone https://github.com/loongson/edk2-LoongarchVirt.git
+
+  cd edk2-LoongarchVirt
+
+  git submodule update --init
+
+  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
+
+  export WORKSPACE=`pwd`
+
+  export PACKAGES_PATH=$WORKSPACE/edk2-LoongarchVirt
+
+  export GCC5_LOONGARCH64_PREFIX=loongarch64-unknown-linux-gnu-
+
+  edk2-LoongarchVirt/edksetup.sh
+
+  make -C edk2-LoongarchVirt/BaseTools
+
+  build --buildtarget=DEBUG --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
+
+  build --buildtarget=RELEASE --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
+
+The efi binary file path:
+
+  Build/LoongArchQemu/DEBUG_GCC5/FV/QEMU_EFI.fd
+
+  Build/LoongArchQemu/RELEASE_GCC5/FV/QEMU_EFI.fd
+
+(5) linux kernel source code and compile method:
+
+.. code-block:: bash
+
+  git clone https://github.com/loongson/linux.git
+
+  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
+
+  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/lib:$LD_LIBRARY_PATH
+
+  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
+
+  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- loongson3_defconfig
+
+  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu-
+
+  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- install
+
+  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- modules_install
+
+Note: The branch of linux source code is loongarch-next.
+
+(6) initrd file:
+
+  You can use busybox tool and the linux modules to make a initrd file. Or you can access the
+  binary files: https://github.com/yangxiaojuan-loongson/qemu-binary
diff --git a/target/loongarch/README b/target/loongarch/README
index 1823375d04..0b9dc0d40a 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -11,54 +11,7 @@
 
 - System emulation
 
-  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly the same as the host.
-  3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
-  cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
-  and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
-  the general use. We also introduced the emulation of devices at docs/system/loongarch/virt.rst.
-
-  This version only supports running binary files in ELF format, and does not depend on BIOS and kernel file.
-  You can compile the test program with 'make & make check-tcg' and run the test case with the following command:
-
-  1. Install LoongArch cross-tools on X86 machines.
-
-    Download cross-tools.
-
-      wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
-
-      tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz -C /opt
-
-    Config cross-tools env.
-
-      . setenv.sh
-
-      setenv.sh:
-
-          #!/bin/sh
-          set -x
-          CC_PREFIX=/opt/cross-tools
-
-          export PATH=$CC_PREFIX/bin:$PATH
-          export LD_LIBRARY_PATH=$CC_PREFIX/lib:$LD_LIBRARY_PATH
-          export LD_LIBRARY_PATH=$CC_PREFIX/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
-          set +x
-
-  2. Test tests/tcg/multiarch.
-
-    ./configure --disable-rdma --disable-pvrdma --prefix=/usr  \
-            --target-list="loongarch64-softmmu"  \
-            --disable-libiscsi --disable-libnfs --disable-libpmem \
-            --disable-glusterfs --enable-libusb --enable-usb-redir \
-            --disable-opengl --disable-xen --enable-spice --disable-werror \
-            --enable-debug --disable-capstone --disable-kvm --enable-profiler
-
-    cd  build/
-
-    make && make check-tcg
-
-    or
-
-    ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 -smp 1 -kernel build/tests/tcg/loongarch64-softmmu/hello -monitor none -display none -chardev file,path=hello.out,id=output -serial chardev:output
+  You can reference docs/system/loongarch/loongson3.rst to get the information about system emulation of LoongArch.
 
 - Linux-user emulation
 
-- 
2.34.1


