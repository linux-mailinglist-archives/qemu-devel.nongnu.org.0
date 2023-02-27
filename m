Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE26A39EB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 05:00:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWUfW-0004r3-O5; Sun, 26 Feb 2023 22:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWUfT-0004qo-Oi
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:59:15 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWUfR-0007Qj-1b
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:59:15 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axu5eKKvxj2PIFAA--.5589S3;
 Mon, 27 Feb 2023 11:59:06 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxf+SKKvxjZ0c+AA--.11700S2; 
 Mon, 27 Feb 2023 11:59:06 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 armbru@redhat.com, thuth@redhat.com, mst@redhat.com, sw@weilnetz.de,
 clg@kaod.org, danielhb413@gmail.com, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH v2 1/2] docs/system/loongarch: update loongson3.rst and rename
 it to virt.rst
Date: Mon, 27 Feb 2023 11:59:04 +0800
Message-Id: <20230227035905.1290953-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxf+SKKvxjZ0c+AA--.11700S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3GF17Xry5JF47KF48Zw45trb_yoW7Kw17pF
 1avFWxKr1kXrnYvrs5G34xW3WqvFnakr9xWF4Dtw4rurWqv347ZwsYy34rXF9rA34kJFy2
 qry8G3yUW3WUXaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the EDK2 had already support LoongArch, update build bios,
and update cpu type, cross-tools.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230208094133.2945979-1-gaosong@loongson.cn>
---
 .../loongarch/{loongson3.rst => virt.rst}     | 97 ++++++++-----------
 1 file changed, 38 insertions(+), 59 deletions(-)
 rename docs/system/loongarch/{loongson3.rst => virt.rst} (51%)

diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/virt.rst
similarity index 51%
rename from docs/system/loongarch/loongson3.rst
rename to docs/system/loongarch/virt.rst
index 489ea20f8f..e3087246a3 100644
--- a/docs/system/loongarch/loongson3.rst
+++ b/docs/system/loongarch/virt.rst
@@ -19,14 +19,14 @@ The ``virt`` machine supports:
 - Fw_cfg device
 - PCI/PCIe devices
 - Memory device
-- CPU device. Type: la464-loongarch-cpu.
+- CPU device. Type: la464.
 
 CPU and machine Type
 --------------------
 
 The ``qemu-system-loongarch64`` provides emulation for virt
 machine. You can specify the machine type ``virt`` and
-cpu type ``la464-loongarch-cpu``.
+cpu type ``la464``.
 
 Boot options
 ------------
@@ -35,95 +35,74 @@ We can boot the LoongArch virt machine by specifying the uefi bios,
 initrd, and linux kernel. And those source codes and binary files
 can be accessed by following steps.
 
-(1) booting command:
+(1) Build qemu-system-loongarch64:
 
 .. code-block:: bash
 
-  $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
-      -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
-      -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" \
-      --nographic
-
-Note: The running speed may be a little slow, as the performance of our
-qemu and uefi bios is not perfect, and it is being fixed.
-
-(2) cross compiler tools:
-
-.. code-block:: bash
-
-  wget https://github.com/loongson/build-tools/releases/download/ \
-  2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
-
-  tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
-
-(3) qemu compile configure option:
-
-.. code-block:: bash
-
-  ./configure --disable-rdma --disable-pvrdma --prefix=usr \
+  ./configure --disable-rdma --disable-pvrdma --prefix=/usr \
               --target-list="loongarch64-softmmu" \
               --disable-libiscsi --disable-libnfs --disable-libpmem \
               --disable-glusterfs --enable-libusb --enable-usb-redir \
               --disable-opengl --disable-xen --enable-spice \
               --enable-debug --disable-capstone --disable-kvm \
               --enable-profiler
-  make
+  make -j8
 
-(4) uefi bios source code and compile method:
+(2) Set cross tools:
 
 .. code-block:: bash
 
-  git clone https://github.com/loongson/edk2-LoongarchVirt.git
-
-  cd edk2-LoongarchVirt
-
-  git submodule update --init
-
-  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
-
-  export WORKSPACE=`pwd`
+  wget https://github.com/loongson/build-tools/releases/download/2022.09.06/loongarch64-clfs-6.3-cross-tools-gcc-glibc.tar.xz
 
-  export PACKAGES_PATH=$WORKSPACE/edk2-LoongarchVirt
+  tar -vxf loongarch64-clfs-6.3-cross-tools-gcc-glibc.tar.xz  -C /opt
 
-  export GCC5_LOONGARCH64_PREFIX=loongarch64-unknown-linux-gnu-
+  export PATH=/opt/cross-tools/bin:$PATH
+  export LD_LIBRARY_PATH=/opt/cross-tools/lib:$LD_LIBRARY_PATH
+  export LD_LIBRARY_PATH=/opt/cross-tools/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
 
-  edk2-LoongarchVirt/edksetup.sh
+Note: You need get the latest cross-tools at https://github.com/loongson/build-tools
 
-  make -C edk2-LoongarchVirt/BaseTools
+(3) Build BIOS:
 
-  build --buildtarget=DEBUG --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
+    See: https://github.com/tianocore/edk2-platforms/tree/master/Platform/Loongson/LoongArchQemuPkg#readme
 
-  build --buildtarget=RELEASE --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
+Note: build release bios need set --buildtarget=RELEASE,
+      the bios file path:  Build/LoongArchQemu/RELEASE_GCC5/FV/QEMU_EFI.fd
 
-The efi binary file path:
-
-  Build/LoongArchQemu/DEBUG_GCC5/FV/QEMU_EFI.fd
-
-  Build/LoongArchQemu/RELEASE_GCC5/FV/QEMU_EFI.fd
-
-(5) linux kernel source code and compile method:
+(4) Build kernel:
 
 .. code-block:: bash
 
   git clone https://github.com/loongson/linux.git
 
-  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
-
-  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/lib:$LD_LIBRARY_PATH
+  cd linux
 
-  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
+  git checkout loongarch-next
 
   make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- loongson3_defconfig
 
-  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu-
-
-  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- install
-
-  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- modules_install
+  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- -j32
 
 Note: The branch of linux source code is loongarch-next.
+      the kernel file: arch/loongarch/boot/vmlinuz.efi
 
-(6) initrd file:
+(5) Get initrd:
 
   You can use busybox tool and the linux modules to make a initrd file. Or you can access the
   binary files: https://github.com/yangxiaojuan-loongson/qemu-binary
+
+.. code-block:: bash
+
+  git clone https://github.com/yangxiaojuan-loongson/qemu-binary
+
+Note: the initrd file is ramdisk
+
+(6) Booting LoongArch:
+
+.. code-block:: bash
+
+  $ ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu la464 \
+      -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd ramdisk \
+      -serial stdio   -monitor telnet:localhost:4495,server,nowait \
+      -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" \
+      --nographic
-- 
2.31.1


