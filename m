Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992B59204B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNF46-0006fP-Hu
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 10:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF28-0002HI-Rq
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:08 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54612
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF25-0007P8-U5
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660488955; bh=xtOi84D7gwtPt2qpdJhKaRrxyW1/rWu6BSRb/i6isgs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYVPUZnnunLOumcu1kWPpyTPRuLrB7ItLB8L942cxJdEHjE/TPL9gPzMG9xecEknM
 y6gVSjmWRZc9dC7X+CEc/fW88DbM/32EZ/nSygofSf1x5iczKb+k7SOXKQlWQZRV+j
 j69uytOND0V1O0t6Ve7dQCefEQFQjSQ7b00pPH34=
Received: from ld50.lan (unknown [101.88.24.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F02266068A;
 Sun, 14 Aug 2022 22:55:53 +0800 (CST)
From: WANG Xuerui <i.qemu@xen0n.name>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-7.1 4/4] docs, target/loongarch: Rewrite the LoongArch docs
Date: Sun, 14 Aug 2022 22:55:22 +0800
Message-Id: <20220814145522.1474927-5-i.qemu@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814145351.1474753-1-git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: WANG Xuerui <git@xen0n.name>

Much information is already outdated in its current form, not to mention
the hard-to-understand Chinglish. Rewrite to hopefully de-duplicate and
re-organize things, and reflect the latest status of LoongArch at
upstream.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 docs/system/loongarch/loongson3.rst | 41 ------------
 docs/system/loongarch/virt.rst      | 41 ++++++++++++
 target/loongarch/README             | 99 -----------------------------
 target/loongarch/README.md          | 75 ++++++++++++++++++++++
 4 files changed, 116 insertions(+), 140 deletions(-)
 delete mode 100644 docs/system/loongarch/loongson3.rst
 create mode 100644 docs/system/loongarch/virt.rst
 delete mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/README.md

diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
deleted file mode 100644
index fa3acd01c0..0000000000
--- a/docs/system/loongarch/loongson3.rst
+++ /dev/null
@@ -1,41 +0,0 @@
-:orphan:
-
-==========================================
-loongson3 virt generic platform (``virt``)
-==========================================
-
-The ``virt`` machine use gpex host bridge, and there are some
-emulated devices on virt board, such as loongson7a RTC device,
-IOAPIC device, ACPI device and so on.
-
-Supported devices
------------------
-
-The ``virt`` machine supports:
-- Gpex host bridge
-- Ls7a RTC device
-- Ls7a IOAPIC device
-- Ls7a ACPI device
-- Fw_cfg device
-- PCI/PCIe devices
-- Memory device
-- CPU device. Type: Loongson-3A5000.
-
-CPU and machine Type
---------------------
-
-The ``qemu-system-loongarch64`` provides emulation for virt
-machine. You can specify the machine type ``virt`` and
-cpu type ``Loongson-3A5000``.
-
-Boot options
-------------
-
-Now the ``virt`` machine can run test program in ELF format and the
-method of compiling is in target/loongarch/README.
-
-.. code-block:: bash
-
-  $ qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 \
-      -smp 1 -kernel hello -monitor none -display none \
-      -chardev file,path=hello.out,id=output -serial chardev:output
diff --git a/docs/system/loongarch/virt.rst b/docs/system/loongarch/virt.rst
new file mode 100644
index 0000000000..2d8f7e1db5
--- /dev/null
+++ b/docs/system/loongarch/virt.rst
@@ -0,0 +1,41 @@
+:orphan:
+
+=================================================
+LoongArch generic virtualized platform (``virt``)
+=================================================
+
+The ``virt`` machine has a GPEX host bridge, and some more emulated devices
+such as the LS7A RTC, IOAPIC, ACPI device and so on.
+
+Being a machine type designed for virtualized use cases, the machine resembles
+a Loongson 3A5000 + LS7A1000 board, but is not an exact emulation.
+For example, only cascading of the EXTIOI interrupt is implemented.
+Also, only the RTC block of the LS7A1000 is emulated; for the other devices
+the QEMU models are used.
+Normally you do not need to care about any of these.
+
+Supported devices
+-----------------
+
+The ``virt`` machine supports:
+
+- GPEX host bridge
+- LS7A RTC device
+- LS7A IOAPIC device
+- LS7A ACPI device
+- fw_cfg device
+- PCI/PCIe devices
+- Memory device
+- CPU device. Defaults to ``qemu64-v1.00``.
+
+Boot options
+------------
+
+Some more information could be found in the QEMU sources at
+``target/loongarch/README.md``. A simple example being:
+
+.. code-block:: bash
+
+  $ qemu-system-loongarch64 -machine virt -m 4G -smp 1 -kernel hello \
+      -monitor none -display none \
+      -chardev file,path=hello.out,id=output -serial chardev:output
diff --git a/target/loongarch/README b/target/loongarch/README
deleted file mode 100644
index 1823375d04..0000000000
--- a/target/loongarch/README
+++ /dev/null
@@ -1,99 +0,0 @@
-- Introduction
-
-  LoongArch is the general processor architecture of Loongson.
-
-  The following versions of the LoongArch core are supported
-    core: 3A5000
-    https://github.com/loongson/LoongArch-Documentation/releases/download/2021.08.17/LoongArch-Vol1-v1.00-EN.pdf
-
-  We can get the latest loongarch documents at https://github.com/loongson/LoongArch-Documentation/tags.
-
-
-- System emulation
-
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
-
-- Linux-user emulation
-
-  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
-  and We can also use qemu-loongarch64 to run LoongArch executables.
-
-  1. Config cross-tools env.
-
-     see System emulation.
-
-  2. Test tests/tcg/multiarch.
-
-     ./configure  --static  --prefix=/usr  --disable-werror --target-list="loongarch64-linux-user" --enable-debug
-
-     cd build
-
-     make && make check-tcg
-
-  3. Run LoongArch system basic command with loongarch-clfs-system.
-
-     - Config clfs env.
-
-       wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-system-5.0.tar.bz2
-
-       tar -vxf loongarch64-clfs-system-5.0.tar.bz2 -C /opt/clfs
-
-       cp /opt/clfs/lib64/ld-linux-loongarch-lp64d.so.1  /lib64
-
-       export LD_LIBRARY_PATH="/opt/clfs/lib64"
-
-     - Run LoongArch system basic command.
-
-       ./qemu-loongarch64  /opt/clfs/usr/bin/bash
-       ./qemu-loongarch64  /opt/clfs/usr/bin/ls
-       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
-
-- Note.
-  We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
diff --git a/target/loongarch/README.md b/target/loongarch/README.md
new file mode 100644
index 0000000000..6a5ff8acd5
--- /dev/null
+++ b/target/loongarch/README.md
@@ -0,0 +1,75 @@
+# QEMU LoongArch target
+
+## Introduction
+
+LoongArch is the general-purpose instruction set architecture developed by
+Loongson. Documentation can be found at [the LoongArch Documentation repository][docs-repo].
+
+[docs-repo]: https://github.com/loongson/LoongArch-Documentation
+
+Currently the following CPU models are supported:
+
+|`-cpu name`|Description|
+|:----------|:----------|
+|`qemu64-v1.00`|Virtual model similar to the Loongson 3A5000, compatible with LoongArch64 v1.00.|
+
+## Trying out
+
+For some of the steps or development/debug purposes, you may have to set up
+cross toolchains if you are not running on native LoongArch hardware.
+
+Now that LoongArch support has been merged in the GNU toolchain packages and
+Linux, you may make your own toolchains like with any other architectures;
+Loongson also has made available [their pre-compiled toolchain binaries for x86][build-tools].
+You may follow the respective instructions to set up your development
+environment.
+
+[build-tools]: https://github.com/loongson/build-tools
+
+### System emulation
+
+Both raw ELF images and EFI stub kernels together with UEFI firmware image are
+supported.
+
+For running raw ELF images with system emulation:
+
+```sh
+# In the build directory:
+./qemu-system-loongarch64 -m 4G -smp 1 \
+    -kernel build/tests/tcg/loongarch64-softmmu/hello \
+    -monitor none -display none \
+    -chardev file,path=hello.out,id=output -serial chardev:output
+```
+
+For a more complete emulation with UEFI firmware, currently there is no
+pre-compiled firmware blob yet, but in the meantime you may compile your own
+firmware image with Loongson's forked [EDK II][edk2] and
+[corresponding platform code][edk2-plat].
+
+[edk2]: https://github.com/loongson/edk2-LoongarchVirt
+[edk2-plat]: https://github.com/loongson/edk2-platforms
+
+Once you have the firmware image in place, you could boot EFI images with it.
+For example:
+
+```sh
+./qemu-system-loongarch64 -m 4G smp 4 \
+    -bios path/to/your/QEMU_EFI.fd \
+    -kernel path/to/your/vmlinux \
+    -initrd path/to/your/initramfs/if/you/have/one \
+    -append 'root=/dev/ram rdinit=/sbin/init console=ttyS0,115200'
+    -nographic
+```
+
+### Linux-user emulation
+
+Linux-user emulation is fully supported, and there are already several Linux
+distributions available with ready-to-use sysroot tarballs, for example
+[CLFS][clfs] and [Gentoo][gentoo].
+
+You may compile static qemu-user binaries then follow suitable instructions
+for your distribution (set up binfmt\_misc, etc.) to make yourself a LoongArch
+chroot for experimentation.
+
+[clfs]: https://github.com/sunhaiyong1978/CLFS-for-LoongArch
+[gentoo]: https://wiki.gentoo.org/wiki/Project:LoongArch
-- 
2.35.1


