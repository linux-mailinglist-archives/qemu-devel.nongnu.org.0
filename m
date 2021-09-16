Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF040ED1E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:07:57 +0200 (CEST)
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzXw-0001NN-Fi
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHM-0006kq-Ut
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:48 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHK-0002up-Hc
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829046; x=1663365046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JOYrITYOgFWibJzKv6pDdhk12xFdWfw2/yl3Et4aAfg=;
 b=fZFkrEnYtyGYzeqLgIfCt9l+mAPr8bfp05OjDabagJSHyKzLsxdY93pO
 GE1ad+mKYY1V4reUXfKoTgERetUqONdeQD11MV8cP9XXyBKNSBcYd19aW
 UFOQg13szHx+J0DAZp2jiXFcB7VNWgLDZY+fA8AdhHhJLQogtKdlNG2u8
 w/BXeX1Why2k419wpq9HUHhn2ZmF+6PMwB7zS3J/JhPOxgnNuLMFcjPVR
 dioRYQh2rgVWEf16P9N0DBl3LC6dJjGlD8sz3VcJhaq2SB7r0tALo490W
 tujMI/X5iEj3bXMfB9QtfoCflPmrUIjZd4MecPCktgCGG+K7qdL49nQXQ w==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="284004762"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:45 +0800
IronPort-SDR: lopFvuFTGwUQfzQxLkGt4sqwkFRA5zUhS71RKAK4YMdzOrlc9/iyD6aYorARzLCV+u6CDMj3OC
 LijQ6+TkAonoSkUOS74yxJY6R7jtJ79jjaqM/9EAXZGkJNWNU+qXuHYY+acKpQaAIwXp+8CYyl
 5XKPeuby8LqmobbCdcOQs66I+xSr+SbNY3/ctU3PR7B79IE+FFn0KjXrB2sbzC4eL3/v47z/zY
 CyPvtar9LhikW3aj26nGVhmcdFB1+zuXgQB6CU2QGEIEoFsi+mk3UIHHHSo36ARVSL+c8kfvYz
 soNScLXQWicGzlDtl5hV4XrO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:32 -0700
IronPort-SDR: XiMF5MScIe/PToTO2peZKtK5cNxfbDZOtRSFpgWUdVTcx9OAu8HPAwid/HwC4RCNxi49uw4xGc
 ljh+HBZgR82txRV+ccPrTQngwHSPY2sb5AUK9A2XNc6/R/VIzSEWR5MeMEaUmS0GAACGlSTDhz
 9ruFojiLBIKCr62ULHyCGBzGzaDvhOXH5oefjipshig7yFSQ1I3Wylz9VlrWfqUtF9SB0fPgmn
 cp4m6tm4I/GgauZ8BFGfssUI6NKQRNgC5X1F+5gwJXX9GV/maRgXP2AhBHJkBEMh23wyyw/Tej
 SUM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3n1MDZz1RwsB
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829043; x=1634421044; bh=JOYrITYOgFWibJzKv6
 pDdhk12xFdWfw2/yl3Et4aAfg=; b=Yr4DGk0P2S+Bx7iEY4+Y9JAyeE0UjD+7S4
 OX5/uG9W79t6kGAw1wQsIdCt62eGQHdCqL3sQFZlx2XX93brTcrmV6U7M2rTdw6k
 pMwaC5OMFPdfR8/rcRshUgWhrVKITOoL9SdopeURtZ1T4qda2aIYgGPrW7gV2/2l
 g6hRaWoJHL9Fp6VU6mCP6wJdVuV+ksLpCXS2FvlOheYE3ig5ObDpQfU+k76A6edE
 RBpFO3kv4KAB30cUpsj9ZBGUfQrGdwEvdubrSXGyNiFnzp9aqrVmTPszdcQNp+QE
 ZA80au2dNt+wxr0/4iAfTtCOxcEyKGp1mB2evMYfcM1pWoGZcrpQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id o5G1vv_OpOmc for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:43 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3h4CVmz1Rws6;
 Thu, 16 Sep 2021 14:50:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/21] docs/system/riscv: sifive_u: Update U-Boot instructions
Date: Fri, 17 Sep 2021 07:49:01 +1000
Message-Id: <20210916214904.734206-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

In U-Boot v2021.07 release, there were 2 major changes for the
SiFive Unleashed board support:

- Board config name was changed from sifive_fu540_defconfig to
  sifive_unleashed_defconfig
- The generic binman tool was used to generate the FIT image
  (combination of U-Boot proper, DTB and OpenSBI firmware)

which make the existing U-Boot instructions out of date.

Update the doc with latest instructions.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911153431.10362-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/sifive_u.rst | 49 ++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.=
rst
index 7c65e9c440..7b166567f9 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -210,15 +210,16 @@ command line options with ``qemu-system-riscv32``.
 Running U-Boot
 --------------
=20
-U-Boot mainline v2021.01 release is tested at the time of writing. To bu=
ild a
+U-Boot mainline v2021.07 release is tested at the time of writing. To bu=
ild a
 U-Boot mainline bootloader that can be booted by the ``sifive_u`` machin=
e, use
-the sifive_fu540_defconfig with similar commands as described above for =
Linux:
+the sifive_unleashed_defconfig with similar commands as described above =
for
+Linux:
=20
 .. code-block:: bash
=20
   $ export CROSS_COMPILE=3Driscv64-linux-
   $ export OPENSBI=3D/path/to/opensbi-riscv64-generic-fw_dynamic.bin
-  $ make sifive_fu540_defconfig
+  $ make sifive_unleashed_defconfig
=20
 You will get spl/u-boot-spl.bin and u-boot.itb file in the build tree.
=20
@@ -313,31 +314,29 @@ board on QEMU ``sifive_u`` machine out of the box. =
This allows users to
 develop and test the recommended RISC-V boot flow with a real world use
 case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM=
,
 then U-Boot SPL loads the combined payload image of OpenSBI fw_dynamic
-firmware and U-Boot proper. However sometimes we want to have a quick te=
st
-of booting U-Boot on QEMU without the needs of preparing the SPI flash o=
r
-SD card images, an alternate way can be used, which is to create a U-Boo=
t
-S-mode image by modifying the configuration of U-Boot:
+firmware and U-Boot proper.
+
+However sometimes we want to have a quick test of booting U-Boot on QEMU
+without the needs of preparing the SPI flash or SD card images, an alter=
nate
+way can be used, which is to create a U-Boot S-mode image by modifying t=
he
+configuration of U-Boot:
=20
 .. code-block:: bash
=20
+  $ export CROSS_COMPILE=3Driscv64-linux-
+  $ make sifive_unleashed_defconfig
   $ make menuconfig
=20
-then manually select the following configuration in U-Boot:
-
-  Device Tree Control > Provider of DTB for DT Control > Prior Stage boo=
tloader DTB
+then manually select the following configuration:
=20
-This lets U-Boot to use the QEMU generated device tree blob. During the =
build,
-a build error will be seen below:
+  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior S=
tage bootloader DTB
=20
-.. code-block:: none
+and unselect the following configuration:
=20
-  MKIMAGE u-boot.img
-  ./tools/mkimage: Can't open arch/riscv/dts/hifive-unleashed-a00.dtb: N=
o such file or directory
-  ./tools/mkimage: failed to build FIT
-  make: *** [Makefile:1440: u-boot.img] Error 1
+  * Library routines ---> Allow access to binman information in the devi=
ce tree
=20
-The above errors can be safely ignored as we don't run U-Boot SPL under =
QEMU
-in this alternate configuration.
+This changes U-Boot to use the QEMU generated device tree blob, and bypa=
ss
+running the U-Boot SPL stage.
=20
 Boot the 64-bit U-Boot S-mode image directly:
=20
@@ -352,14 +351,18 @@ It's possible to create a 32-bit U-Boot S-mode imag=
e as well.
 .. code-block:: bash
=20
   $ export CROSS_COMPILE=3Driscv64-linux-
-  $ make sifive_fu540_defconfig
+  $ make sifive_unleashed_defconfig
   $ make menuconfig
=20
 then manually update the following configuration in U-Boot:
=20
-  Device Tree Control > Provider of DTB for DT Control > Prior Stage boo=
tloader DTB
-  RISC-V architecture > Base ISA > RV32I
-  Boot images > Text Base > 0x80400000
+  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior S=
tage bootloader DTB
+  * RISC-V architecture ---> Base ISA ---> RV32I
+  * Boot options ---> Boot images ---> Text Base ---> 0x80400000
+
+and unselect the following configuration:
+
+  * Library routines ---> Allow access to binman information in the devi=
ce tree
=20
 Use the same command line options to boot the 32-bit U-Boot S-mode image=
:
=20
--=20
2.31.1


