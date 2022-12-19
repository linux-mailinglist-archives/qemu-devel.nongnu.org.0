Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED64650636
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ih-0008Ff-A4; Sun, 18 Dec 2022 21:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75if-0008FR-H5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:33 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75id-00013c-Fp
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416251; x=1702952251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZrlKiAsAn7MNytGWr5N4/b3L8vVhvkGQkq8G2qzSWk=;
 b=SvTnNKBdpMHs/tJjFcjDvhSVdS0n2etS5H7bskrv0VeFZnVhlZkSSJA/
 HuLIgQ3PnVSirSPrMHFC47K0Af8CpWcLUrwy0YDYwadMAhpO4czfYs32+
 QapO1R2cdXqc2s+BU5Dl3UTsmgt0AC0MqTWFxPUsCbq6KyLOhViDJLym1
 4WwIcpHgtxcdJe5hIy1kVAZmSqIMGTAB50nblP/dUm4hyHBOKGK/KFgjs
 YwDy/Bvt6N2rh0bqSguNDnLw+JDekJmJNYrzpdBk9Imh6kREEeRCaJ1+0
 GtZ3GAiD66OABYsEqgna237uZ1HOK1qTf2jPUxef1SyxNioXCjL6ENt3p A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199298"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:30 +0800
IronPort-SDR: 23JvvBr7c2icftG9HHXSd6NStkpEYbTBTpGZ9PWf5zJf0wOyGGiHOqeCFXBz/gtNDFHiVF22KZ
 WCksdcKbdy/VZIkEL4/Mr49wRO2FgQfIaT/p88gLzOOlHtIwjxXbK+3FZBhJX/1uk8trPtm6Ya
 FDqRqU2XeU1uC2JMobYsBMIdAVMBhQFIekw98hMZsGvWcSnK/KfxDF0nxIR1e2K9iNnyxRwBYv
 mTi9iGS+lKP2YhYagYxPq78nWvBe6S19ZL/NJvi4Z8ipNSAbRybumVYWgZwcVnCldrsaGfD56R
 C9o=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:03 -0800
IronPort-SDR: ltBMjwqC41ZJ+FMo46v40dbQdkhbtDVvE5GGJSt/HswcChIBYnmKgy/ZeBWbmnyLaYvz8BSLL1
 m53hRuTYI1vP4FyMA1A2IcegG47jI8C8Nko1gYkbjnVq7e1dmvRvNsF6GhJWN09t/denePimyb
 t7kVDTq7Y7GmlNjqbxKzaiUEoUG2YgiZKPzoWTJn7+YvrQ5S1pTrlfbDMX3Xgv6gXPebl28wnW
 zgGk8xicCyeqjHzM4tv5bhS5BBnK+YeT8WTGLgU3Oa4GTDvjsuQuTgPSUZVsjh5tf5E3Gg5Fwt
 0Zs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JB4q0gz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416249; x=1674008250; bh=nZrlKiAsAn7MNytGWr
 5N4/b3L8vVhvkGQkq8G2qzSWk=; b=DWP5VD1ZCrl4UueR0aIG47gB6+kRB+Iz6u
 QG9RGxGOWHGMf3o+kwmhd9J5Z8A2mrpw/P6jcA7/TStMgONPgRsj7Dr/GZBPKAxx
 IctNvG2/Kt2ZE9s4k2qOq4Z0nOdEhhjpIFW95SgCbBaqXJyaLzwlzYPFl5uFRXmz
 x996CsGyLAg5hg3vafSzKgiLnMZrPyANLYQbfT9NgWptS9Lw0JaiV94Ktg+9sPnr
 2/ado7ljvKyi80RpI/5Qsbry8of3E106rSsbKhhe709W3xMe68DcNQ3qvQLrJPqZ
 P+CqW2YHJwJ7C00g3RHAH8/9aZPY45UOCHkDgwaQRLvQ/o5ifAPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QeRqs0fSb8e3 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:29 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3J75tHrz1RvTp;
 Sun, 18 Dec 2022 18:17:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/45] hw/riscv/opentitan: bump opentitan
Date: Mon, 19 Dec 2022 12:16:25 +1000
Message-Id: <20221219021703.20473-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch updates the OpenTitan model to match
the specified register layout as per [1]. Which is also the latest
commit of OpenTitan supported by TockOS.

Note: Pinmux and Padctrl has been merged into Pinmux [2][3], this patch r=
emoves
any references to Padctrl. Note: OpenTitan doc [2] has not yet specified
much detail regarding this, except for a note that states `TODO: this
section needs to be updated to reflect the pinmux/padctrl merger`

[1] https://github.com/lowRISC/opentitan/blob/d072ac505f82152678d6e04be95=
c72b728a347b8/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
[2] https://docs.opentitan.org/hw/top_earlgrey/doc/design/
[3] https://docs.opentitan.org/hw/ip/pinmux/doc/#overview

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20221025043335.339815-2-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h |  9 ++++-----
 hw/riscv/opentitan.c         | 21 +++++++++++++--------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 6665cd5794..1fc055cdff 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,7 +81,6 @@ enum {
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
     IBEX_DEV_PINMUX,
-    IBEX_DEV_PADCTRL,
     IBEX_DEV_USBDEV,
     IBEX_DEV_FLASH_CTRL,
     IBEX_DEV_PLIC,
@@ -109,10 +108,10 @@ enum {
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
     IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 151,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 152,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 153,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 154,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
 };
=20
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index be7ff1eea0..92493c629d 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -28,8 +28,16 @@
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
=20
+/*
+ * This version of the OpenTitan machine currently supports
+ * OpenTitan RTL version:
+ * <lowRISC/opentitan@d072ac505f82152678d6e04be95c72b728a347b8>
+ *
+ * MMIO mapping as per (specified commit):
+ * lowRISC/opentitan: hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
+ */
 static const MemMapEntry ibex_memmap[] =3D {
-    [IBEX_DEV_ROM] =3D            {  0x00008000,   0x8000 },
+    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000 },
     [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000 },
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
@@ -38,17 +46,17 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
-    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
     [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
+    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x1000  },
     [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
     [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
+    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
-    [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
+    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
     [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
@@ -59,10 +67,9 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
     [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
     [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
-    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
     [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
-    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000  },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000 },
     [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
 };
=20
@@ -265,8 +272,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
         memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
         memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
-        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
         memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
     create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
--=20
2.38.1


