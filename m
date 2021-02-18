Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B731E448
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:19:17 +0100 (CET)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYuS-0006Ql-S5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcK-0006f9-Bg
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcB-0008Jj-1h
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613623; x=1645149623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BlpwmgkXtMFrmL08A60KC0RIvvU6TgqAb/HDpgaDEOw=;
 b=ATVmPLguklNKsbtWbkXIAmOt+A7nR0HrG/tJVGVegyGLuuzt31rm0yyB
 o5XoKdBQgfim8PsHmi7rmA8l2SQg920CcJsvXk9Bzh8ZfKnVh48UqI9cP
 zrGqUuxi29WR2MeZaiB9axD4NgAwW5KPdiHxDsB1mdPbYMw0M3niRUzWT
 ANFXAWzkJ+LeWCYoJK6Lirb+raI6rdg/aVyApm0eLZsRyhAiBIoR/1EE2
 MD83olsj8yl6/87J6O94eNlO2Mj7INkv0S91fW1oOy3AmE2102Gj7FdX6
 tq8Eb50JqJ+3NZsmrObSWvvvW1ZtV5qIaxnqHiZCE41uP5Fryq0qc4d4P g==;
IronPort-SDR: 7tcTPnOtvqYvOKDzK8/YWHw80SUdM5lhaQomiklzQmZGbDEUdVYcbbp3eSDeAyu63cxQujI3ME
 BfYwd7QmSiYiXrewqZbgQ5GYlmJumZJtQg08zSkxPlWamDHHtbx4u+fYHMWgGqLwuxw8eGAJ5I
 BZvEFNi9SSxePCQWMUtrR2ITDYJuMErH9Mx+DZfl9OzqlfoIXxd+NyCb0qokIwmtKCqIPeysfZ
 KSRW/AsuWE/9fQPIB0mdEAqXhazSW95mjAf73GJH9CnabK+u/MQGiEYlpqh65apTxdDMNE1oxH
 ywc=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392138"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:00 +0800
IronPort-SDR: 3Hp0B6Ln5HeAkOeG9SJVnvDIX1H2Mvjb8bGAM6AWU4cGkiw6sbVmzO4E6K7zqaakJll4pyxWMC
 G8bvh5rWu0F6us7510QASTXoKHIBUXnYQ+6RcdWpPYgI8IdL1Vyw3jdEL9nAsqgJcJWnjrVWfi
 gtyMfM5s5YKAxz2k7qKtMta6+ksHoufQKSiwh0tNlQ8H2DdUE224nL3eJc+9Yb6kVjLYdIHxUy
 CpSbJXb5EshqPw7D8YXfr4jqJlgIGB4UHY92ePC4WKbp5x7/SfBoU2NDs3KV9CfktI6d9wWzaX
 vlQLfCC08gT3oamCcd4KDFom
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:30 -0800
IronPort-SDR: nwjRMX5x2sTzqiX/ShEzmIT9b6f4aQnNNGWvbNK7ZTHDoBVhuul5W/zuP07dwHN7wGTCQ0HKdl
 SsDMUp/ReaDC+BHX7Uui6J+EN1hWMu0SJWmz4kFEYxMRyX4pths+NGlcnw1hakRt9HF+NLH3SX
 PGxVAQy14+WjeE5Yhs4DBs8f3VVaCaj0zo5qzE5wabUa9TT3cLUusZ6WPBhIVqfrkyiPd5bm3g
 eC9vSjr5q1vvQHSH2RpZWSz3MZILNgfQKuMvGGVVweNFYp+eSmdH9mAZqT8UPqTnCE3K16TRYN
 bo8=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 12/19] docs/system: Add RISC-V documentation
Date: Wed, 17 Feb 2021 17:59:27 -0800
Message-Id: <20210218015934.1623959-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
2.30.0


