Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA332D5D7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:03:56 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpW6-0007io-F3
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHD-0001xJ-3s
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:31 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHA-0007uj-Ly
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869308; x=1646405308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrLo+MnWYEqjF+U2xUiHFhBQ64ckE8Spwd7RNyVoeYY=;
 b=Yz18HC4qQQ6LSa0Eol5U6wQFq1OLfwg0KCbULrNf7YP+oQLkNW9451ne
 HuP/72PBwiQOmvjmctULaGw3I2H8JdTJkQrEI2WAEvxuNse8GRdDaLaU2
 lv37eC+GIzHZ1JLr1Fe6zUJiUHrfpsvL905EngNwS3SHlvO+QUo6ZPNHV
 YHqFh7knAt4sIDJEBe7sO4TUYDk+CpLhoIMilXMzadPKw5oUq0Q8rLaTj
 9HQRE+X1IrFagLnlc0caRt2J2zkF+9GOLAkCLOHi6QZVt29kpyus5Mz3F
 ISvkDImhbsTmxRZuUAyrrQp7SPalhHKMdarOQy3/FFAEtDG4P9k98gUXo w==;
IronPort-SDR: cfMNOy4OaoTuf1vtofHr4EeMbITADU9+MeT0PjbF+dlYGUah0QVMhnyaGFRnkirzooyGGsCHpF
 mm10UUt2uFzXBfpIXS6+sJ4jzN6hKyIDOQMX+plSkDLK/D8pmLG+rmUau6H1fl/255FyPew8XR
 PBQT2IpBRywKrQ29yxUy3dC5VgR3Cjy+H2HureSGBVjXE9vBg7noXW5jDIo1wAxhKAa2w83ecq
 V4TgvgbKXy9EUWQfF/n2Q3IZI/nl1Kp2HVP/BzB/bw8QhIg4Q6Cv3AW4JP4pksTUDGg5rVvKOM
 bew=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984421"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:15 +0800
IronPort-SDR: aAHjP1Be/i1VkkNQ3boBtRTq2ZVTSQbWKnDwhFKhdRR0mF6xAVAdAljXltFu6iTR6cunK80BPr
 uA9pzE5i92hKpNwplrP0mIuYaKxks1YRz/agFoUCav3Y2BwCt1uz46zPVImfxRmfIyl8OUHPv/
 WXxLVqSsnuYBi/O6szxTrjSfBhRAJf7d7r//SpEUV8TYH4CuNqq5YttZDFBOdldB6Z1aNuqI5y
 CdGN86xyfBJC4GV+rvijyr89/Ku6xaFXPsfhma35Ar24n9OyqTEzph/2RzdJOgHHpClZ895eGC
 +u1qEbR0zOWB9HE2nHpVH7d2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:28 -0800
IronPort-SDR: j2y1LcG3CX/+iEQ/vKiOzMB1v83kuXNwPB3+w6gm6ykmyEL1D/ZZkLid44H8J4GEI4Y/T9I/jO
 XUGnL8S312aziJnIlzeTWpXSEgQFMuBTqsiYs0O1MlyKZBdWdmaGhvoKNMo5xd6BKeqA6Q/KAg
 s5O50w+Pl9T5j9vb8pQkHAuJIikp8POO7/Ca0Yy1LUyf1Y50oCDhy246p6VuSc5EL56h7s6MMh
 Kave5kTJ+PAe+AOgkHty/JGv5JZhc6FW8PLjFO49kt9y1A2lx1Uq6GLMeYluUZTdfAB/tf2dWT
 9is=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:15 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 12/19] docs/system: Add RISC-V documentation
Date: Thu,  4 Mar 2021 09:46:44 -0500
Message-Id: <20210304144651.310037-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Add RISC-V system emulator documentation for generic information.
`Board-specific documentation` and `RISC-V CPU features` are only
a placeholder and will be added in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-9-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/target-riscv.rst | 62 ++++++++++++++++++++++++++++++++++++
 docs/system/targets.rst      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 docs/system/target-riscv.rst

diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
new file mode 100644
index 0000000000..9f4b7586e5
--- /dev/null
+++ b/docs/system/target-riscv.rst
@@ -0,0 +1,62 @@
+.. _RISC-V-System-emulator:
+
+RISC-V System emulator
+======================
+
+QEMU can emulate both 32-bit and 64-bit RISC-V CPUs. Use the
+``qemu-system-riscv64`` executable to simulate a 64-bit RISC-V machine,
+``qemu-system-riscv32`` executable to simulate a 32-bit RISC-V machine.
+
+QEMU has generally good support for RISC-V guests. It has support for
+several different machines. The reason we support so many is that
+RISC-V hardware is much more widely varying than x86 hardware. RISC-V
+CPUs are generally built into "system-on-chip" (SoC) designs created by
+many different companies with different devices, and these SoCs are
+then built into machines which can vary still further even if they use
+the same SoC.
+
+For most boards the CPU type is fixed (matching what the hardware has),
+so typically you don't need to specify the CPU type by hand, except for
+special cases like the ``virt`` board.
+
+Choosing a board model
+----------------------
+
+For QEMU's RISC-V system emulation, you must specify which board
+model you want to use with the ``-M`` or ``--machine`` option;
+there is no default.
+
+Because RISC-V systems differ so much and in fundamental ways, typically
+operating system or firmware images intended to run on one machine
+will not run at all on any other. This is often surprising for new
+users who are used to the x86 world where every system looks like a
+standard PC. (Once the kernel has booted, most user space software
+cares much less about the detail of the hardware.)
+
+If you already have a system image or a kernel that works on hardware
+and you want to boot with QEMU, check whether QEMU lists that machine
+in its ``-machine help`` output. If it is listed, then you can probably
+use that board model. If it is not listed, then unfortunately your image
+will almost certainly not boot on QEMU. (You might be able to
+extract the file system and use that with a different kernel which
+boots on a system that QEMU does emulate.)
+
+If you don't care about reproducing the idiosyncrasies of a particular
+bit of hardware, such as small amount of RAM, no PCI or other hard
+disk, etc., and just want to run Linux, the best option is to use the
+``virt`` board. This is a platform which doesn't correspond to any
+real hardware and is designed for use in virtual machines. You'll
+need to compile Linux with a suitable configuration for running on
+the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and
+large amounts of RAM. It also supports 64-bit CPUs.
+
+Board-specific documentation
+----------------------------
+
+Unfortunately many of the RISC-V boards QEMU supports are currently
+undocumented; you can get a complete list by running
+``qemu-system-riscv64 --machine help``, or
+``qemu-system-riscv32 --machine help``.
+
+RISC-V CPU features
+-------------------
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 564cea9a9b..75ed1087fd 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -19,6 +19,7 @@ Contents:
    target-m68k
    target-mips
    target-ppc
+   target-riscv
    target-rx
    target-s390x
    target-sparc
-- 
2.30.1


