Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945D6538DA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lm-0007Oy-3k; Wed, 21 Dec 2022 17:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lj-0007Nt-D4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87le-0000bf-IP
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662454; x=1703198454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZrlKiAsAn7MNytGWr5N4/b3L8vVhvkGQkq8G2qzSWk=;
 b=AXansJmWA65o3uekZtsqFJWZ4pWFA09tnfWpfCKSyTDooQxPWG7O/fn0
 5exTyKNfRqsQ2aYaREvwnArgZv0c2eSmMhD9P32R1UI/2r7iGR9PeID//
 mDn82QW29mad0ypRta8WHdYAHW9/XzPaP8ECKLVvqe5L7n4sLNQedIZmj
 Cmsk+snfFcVtwwYV85R1rc+4HJChSJu8xhXNzwh2gHPKK6OMVS0Yb4pPq
 94o4WHGhkIWuCjVqvt2uERiA0qo0zQmte06DxuBU4xdGJHwbsquYwIXyT
 rrj1vtBQEZKmrVaaqz6OEMzRV6xvtK4DZRIyzzKlQv+XvWY99Zb9Nb2H9 Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561289"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:44 +0800
IronPort-SDR: O6nOwe3QSEum4X376tHdKjxvuwfONs16Djp0XP4Yp+O1955JKj3h8Dk9Nd3AENjRYGPR6L7BNB
 ZaKikH5hUqT4d70v9vAqktTKimhqUf7DYKPkE8O1KlENqFg/+6+NuWj70irkbPj07kG31mszJh
 eRq6SkQPCg/Sh7/1T4BLxmpKswX5FUhMyjrOPnHoz41ybKy3LTfAjJj6KT8YtYN1Ttx87u501S
 xSiIBJuJ8199N5v2nVTQHNuylFeaFWajqx/OHvidRWS8fq3G1MYEHlXp+7eXygkut3htUp9iNe
 RPo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:13 -0800
IronPort-SDR: EdO1dEUuR6wzRcqXHp8IO9eOSh+14892S2fgcO69Ouy4jsTLzEVc2c3TzG4BJxuzB/IIeTRV9j
 Q3ccdotaCtlQI1ZvDXm2NWn++TTVR7CpN8Mn5yvvnG5QSEAV3wkXbUh/LuuMFrQXU53XlkXQN+
 plTn63Bz03yacKT78M+8AyVULt8WMzWX/tursVplSmz3fxoHgxwIcwDFGlCvbmUrw9mSKTqLey
 AJNLCRXJjYRrpqr8AqWdl/zTdIAZjf1Ecum6+2+rwompry2lz710nzPpnZmACC3K++J3Rg6jS3
 tzc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLh1zP2z1Rwt8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662443; x=1674254444; bh=nZrlKiAsAn7MNytGWr
 5N4/b3L8vVhvkGQkq8G2qzSWk=; b=GUDXGFOO7PtrePzGTczMcsOfMdGC7lmd8n
 KlYY2nLD3h9+1V8Nf2Sd+wJi5gZ5VTsuCMdQK9+qaKjouo692eiv3sBpgBoI54c2
 gkvT+qBYGFk06m59rSxk8RO6QHp/2TYFV8z/xwfN9oKanA7TLMM9Js1wLWMUXvqR
 Ds+5betG9ReNX6W1hPXv7srKG0xXFiG2mnevYIzowHZvDdJnL4kT+k2vulQgofZQ
 cSyKP/TAvBey5RC4BP8dzrFuZ2ridws1K/uKdArk5FlsIxCXpxPrsZKoz0PWpYE+
 6RMzzKq1fJsRrwfRJ+sveXV4srdl9z10YX7MAHxo2OU4MzyRSBQw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id siAV_d5KbHgF for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLd4mXYz1RvTp;
 Wed, 21 Dec 2022 14:40:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 07/45] hw/riscv/opentitan: bump opentitan
Date: Thu, 22 Dec 2022 08:39:44 +1000
Message-Id: <20221221224022.425831-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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


