Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BC58573E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:17:46 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZEn-0002eR-4G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ4D-0003an-UQ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:50 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ48-0001v6-Ho
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f11so5057011pgj.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6izHYBiV3rdqjDcqKFgIg8VA1mzpR6L0cvMw2fhtCM=;
 b=I+TWE22cJ3p7lpYGASJ2D1zBpOHjjQy7q2c5jqb8fjNZ4Ov49C1QqHqg5wqIxQcGiY
 t8ZDMDrkcxT82rUyoDXfc5n4SMAN/suUiac7KoNacpo/pSQZ7RsrdfF5Pw9Q+KMfRfEx
 KJyeL38XqZu145y9HBPYXX7wNlsZQoHGpyyotypqmuwbkAyjut9bWwb8hdzsNBW2jjLY
 E+heWcH7Hdyar2NWu5eh7IVkJGWL+WYWMQHP1XtFRD71YeBuVB+YnisY0lKJ/ZaPKp6l
 eXH2AJzlGym4XBEjuQ5+SB83XhuW265Y87kMJrr1nVYzKdVXWB0Siv+qJIp8WL3Jk0+K
 VAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6izHYBiV3rdqjDcqKFgIg8VA1mzpR6L0cvMw2fhtCM=;
 b=wuDR5hfQmAJdluTZPdviMcd4Qrr7iIW1myRWonshdDygUatDMrgVdVbLgH4z055Imn
 Y4+EjO82fzShuhWLMTyoHJAqWuMpRviwyEZoFuOeQg+q1/4VZl94FxiptcgDGjLFpWCD
 GXCSJ8Pq+s178/E9kMgFWWmCcIidy02pWBSHwj6lhOEUjt4VOcz8oQ6TFCSQqdNN/wmR
 2Wh3e8uALJKErGW3UW203/zFNnlC0hKEVtEcrXfzawS4/s/YpcJGRwp9K+y9yXvc15mC
 LwPII3DWKUMRUHMRrvXwZ0rRI/k3+cJTfn9ZZ1tUkpB8w9qkYhPgNP4QZsNSGsF88xmM
 +CBQ==
X-Gm-Message-State: AJIora9L4X5aShr0lWIcVGUVD7Rl5WdYvHQqgz9wro/QFgiLLFd0HELc
 Sv5ZPCzZjyN11OMgR+e4sE8jEZ7Fzb/qhQ==
X-Google-Smtp-Source: AGRyM1t1wMiSW5CM0qSUt4TSNawhx7/6Z2VLDP8KueCxNsVUvemxad9UdZvMu6JMO5DPVR85HqqHuw==
X-Received: by 2002:a05:6a00:244a:b0:52b:e9a8:cb14 with SMTP id
 d10-20020a056a00244a00b0052be9a8cb14mr5656389pfj.32.1659136001144; 
 Fri, 29 Jul 2022 16:06:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 e17-20020aa798d1000000b0052d03432f63sm290149pfm.183.2022.07.29.16.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:40 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 11/11] docs/system: openrisc: Add OpenRISC documentation
Date: Sat, 30 Jul 2022 08:01:17 +0900
Message-Id: <20220729230117.3768312-12-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2;
 - Added Reviewed-by

 docs/system/openrisc/cpu-features.rst | 15 ++++++
 docs/system/openrisc/emulation.rst    | 17 +++++++
 docs/system/openrisc/or1k-sim.rst     | 43 ++++++++++++++++
 docs/system/openrisc/virt.rst         | 50 +++++++++++++++++++
 docs/system/target-openrisc.rst       | 72 +++++++++++++++++++++++++++
 docs/system/targets.rst               |  1 +
 6 files changed, 198 insertions(+)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst

diff --git a/docs/system/openrisc/cpu-features.rst b/docs/system/openrisc/cpu-features.rst
new file mode 100644
index 0000000000..aeb65e22ff
--- /dev/null
+++ b/docs/system/openrisc/cpu-features.rst
@@ -0,0 +1,15 @@
+CPU Features
+============
+
+The QEMU emulation of the OpenRISC architecture provides following built in
+features.
+
+- Shadow GPRs
+- MMU TLB with 128 entries, 1 way
+- Power Management (PM)
+- Programmable Interrupt Controller (PIC)
+- Tick Timer
+
+These features are on by default and the presence can be confirmed by checking
+the contents of the Unit Presence Register (``UPR``) and CPU Configuration
+Register (``CPUCFGR``).
diff --git a/docs/system/openrisc/emulation.rst b/docs/system/openrisc/emulation.rst
new file mode 100644
index 0000000000..0af898ab20
--- /dev/null
+++ b/docs/system/openrisc/emulation.rst
@@ -0,0 +1,17 @@
+OpenRISC 1000 CPU architecture support
+======================================
+
+QEMU's TCG emulation includes support for the OpenRISC or1200 implementation of
+the OpenRISC 1000 cpu architecture.
+
+The or1200 cpu also has support for the following instruction subsets:
+
+- ORBIS32 (OpenRISC Basic Instruction Set)
+- ORFPX32 (OpenRISC Floating-Point eXtension)
+
+In addition to the instruction subsets the QEMU TCG emulation also has support
+for most Class II (optional) instructions.
+
+For information on all OpenRISC instructions please refer to the latest
+architecture manual available on the OpenRISC website in the
+`OpenRISC Architecture <https://openrisc.io/architecture>`_ section.
diff --git a/docs/system/openrisc/or1k-sim.rst b/docs/system/openrisc/or1k-sim.rst
new file mode 100644
index 0000000000..ef10439737
--- /dev/null
+++ b/docs/system/openrisc/or1k-sim.rst
@@ -0,0 +1,43 @@
+Or1ksim board
+=============
+
+The QEMU Or1ksim machine emulates the standard OpenRISC board simulator which is
+also the standard SoC configuration.
+
+Supported devices
+-----------------
+
+ * 16550A UART
+ * ETHOC Ethernet controller
+ * SMP (OpenRISC multicore using ompic)
+
+Boot options
+------------
+
+The Or1ksim machine can be started using the ``-kernel`` and ``-initrd`` options
+to load a Linux kernel and optional disk image.
+
+.. code-block:: bash
+
+  $ qemu-system-or1k -cpu or1220 -M or1k-sim -nographic \
+        -kernel vmlinux \
+        -initrd initramfs.cpio.gz \
+        -m 128
+
+Linux guest kernel configuration
+""""""""""""""""""""""""""""""""
+
+The 'or1ksim_defconfig' for Linux openrisc kernels includes the right
+drivers for the or1ksim machine.  If you would like to run an SMP system
+choose the 'simple_smp_defconfig' config.
+
+Hardware configuration information
+""""""""""""""""""""""""""""""""""
+
+The ``or1k-sim`` board automatically generates a device tree blob ("dtb")
+which it passes to the guest. This provides information about the
+addresses, interrupt lines and other configuration of the various devices
+in the system.
+
+The location of the DTB will be passed in register ``r3`` to the guest operating
+system.
diff --git a/docs/system/openrisc/virt.rst b/docs/system/openrisc/virt.rst
new file mode 100644
index 0000000000..2fe61ac942
--- /dev/null
+++ b/docs/system/openrisc/virt.rst
@@ -0,0 +1,50 @@
+'virt' generic virtual platform
+===============================
+
+The ``virt`` board is a platform which does not correspond to any
+real hardware; it is designed for use in virtual machines.
+It is the recommended board type if you simply want to run
+a guest such as Linux and do not care about reproducing the
+idiosyncrasies and limitations of a particular bit of real-world
+hardware.
+
+Supported devices
+-----------------
+
+ * PCI/PCIe devices
+ * 8 virtio-mmio transport devices
+ * 16550A UART
+ * Goldfish RTC
+ * SiFive Test device for poweroff and reboot
+ * SMP (OpenRISC multicore using ompic)
+
+Boot options
+------------
+
+The virt machine can be started using the ``-kernel`` and ``-initrd`` options
+to load a Linux kernel and optional disk image. For example:
+
+.. code-block:: bash
+
+  $ qemu-system-or1k -cpu or1220 -M or1k-sim -nographic \
+        -device virtio-net-device,netdev=user -netdev user,id=user,net=10.9.0.1/24,host=10.9.0.100 \
+        -device virtio-blk-device,drive=d0 -drive file=virt.qcow2,id=d0,if=none,format=qcow2 \
+        -kernel vmlinux \
+        -initrd initramfs.cpio.gz \
+        -m 128
+
+Linux guest kernel configuration
+""""""""""""""""""""""""""""""""
+
+The 'virt_defconfig' for Linux openrisc kernels includes the right drivers for
+the ``virt`` machine.
+
+Hardware configuration information
+""""""""""""""""""""""""""""""""""
+
+The ``virt`` board automatically generates a device tree blob ("dtb") which it
+passes to the guest. This provides information about the addresses, interrupt
+lines and other configuration of the various devices in the system.
+
+The location of the DTB will be passed in register ``r3`` to the guest operating
+system.
diff --git a/docs/system/target-openrisc.rst b/docs/system/target-openrisc.rst
new file mode 100644
index 0000000000..d22971a953
--- /dev/null
+++ b/docs/system/target-openrisc.rst
@@ -0,0 +1,72 @@
+.. _OpenRISC-System-emulator:
+
+OpenRISC System emulator
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+QEMU can emulate 32-bit OpenRISC CPUs using the ``qemu-system-or1k`` executable.
+
+OpenRISC CPUs are generally built into "system-on-chip" (SoC) designs that run
+on FPGAs.  These SoCs are based on the same core architecture as the or1ksim
+(the original OpenRISC instruction level simulator) which QEMU supports. For
+this reason QEMU does not need to support many different boards to support the
+OpenRISC hardware ecosystem.
+
+The OpenRISC CPU supported by QEMU is the ``or1200``, it supports an MMU and can
+run linux.
+
+Choosing a board model
+======================
+
+For QEMU's OpenRISC system emulation, you must specify which board model you
+want to use with the ``-M`` or ``--machine`` option; the default machine is
+``or1k-sim``.
+
+If you intend to boot Linux, it is possible to have a single kernel image that
+will boot on any of the QEMU machines. To do this one would compile all required
+drivers into the kernel. This is possible because QEMU will create a device tree
+structure that describes the QEMU machine and pass a pointer to the structure to
+the kernel.  The kernel can then use this to configure itself for the machine.
+
+However, typically users will have specific firmware images for a specific machine.
+
+If you already have a system image or a kernel that works on hardware and you
+want to boot with QEMU, check whether QEMU lists that machine in its ``-machine
+help`` output. If it is listed, then you can probably use that board model. If
+it is not listed, then unfortunately your image will almost certainly not boot
+on QEMU. (You might be able to extract the filesystem and use that with a
+different kernel which boots on a system that QEMU does emulate.)
+
+If you don't care about reproducing the idiosyncrasies of a particular
+bit of hardware, such as small amount of RAM, no PCI or other hard disk, etc.,
+and just want to run Linux, the best option is to use the ``virt`` board. This
+is a platform which doesn't correspond to any real hardware and is designed for
+use in virtual machines. You'll need to compile Linux with a suitable
+configuration for running on the ``virt`` board. ``virt`` supports PCI, virtio
+and large amounts of RAM.
+
+Board-specific documentation
+============================
+
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
+.. toctree::
+   :maxdepth: 1
+
+   openrisc/or1k-sim
+   openrisc/virt
+
+Emulated CPU architecture support
+=================================
+
+.. toctree::
+   openrisc/emulation
+
+OpenRISC CPU features
+=====================
+
+.. toctree::
+   openrisc/cpu-features
+
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 9dcd95dd84..224fadae71 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -21,6 +21,7 @@ Contents:
    target-m68k
    target-mips
    target-ppc
+   target-openrisc
    target-riscv
    target-rx
    target-s390x
-- 
2.37.1


