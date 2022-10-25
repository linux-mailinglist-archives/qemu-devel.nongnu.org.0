Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08B60C2C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBrZ-0004pv-7D; Tue, 25 Oct 2022 00:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBrI-0004dG-UA
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:48:16 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBrF-0002ol-SO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666673290; x=1698209290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I4CKihtthzXOfahvUWJQTfAuyO6hc7XxzMvk4ywIizA=;
 b=NfavO9Z0dTiMOaYVKWJxiSIYsGQGFLSM01OFPatQiER/B13umUuX5lRR
 6Yho1QhwZesvak/JIp5u2Q3W5i9EmTpSKZBcTM/r2W/f1kRpC7Aw7wuhA
 L6KcNXyfgnWH7zW6Ch/eSs8OOCUdCjwJ4T9jB5yRn5J4TvLZV6Bmyvvg3
 eyd5SPH4aCU/ShQVCs3s0bv0pJQ9yDSt/JMrNT+HiaYTuGVffwp+fvE5P
 YwHv9HwdL4cp9EGzLSM2ysJcwU0ydsDR5i99MJwl4Gi90lBSNhL3fcfCy
 jk4hVgXG5HAwhi78t7MycIU4kR3upuuvXQtURP92emMSQlwi7AZEWuhKj w==;
X-IronPort-AV: E=Sophos;i="5.95,211,1661788800"; d="scan'208";a="214652832"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 12:48:07 +0800
IronPort-SDR: wKEHQfRBmJGtk9Lmk38k4t6JnuqMDA/u53kaaahFuLC+aU2KS9144DoE/kvzc6Ixsz/f252yOr
 Q8ueUnw/KKLjVtTe68G6ZlgL/vYt9x76VE0MK5I9iwWH078ho3Q8cGtQwBYNl9PLpDuPF3QQk5
 THZIcGM+TKxIIiK6SMB0G3GLilnR4WcnDqOCooA30Wgen+1Je1bobv7ff1H0pgCai/4UsWTTbX
 3ckm4bUk95Be60wba/F4FxRF7HuC4PV0aH6DJa6KAmtu+fi9IJaUPB1T36QYDKMbxOqFNAhNUb
 x3B4jcffs1VQMlfhFnJTzdes
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 21:01:48 -0700
IronPort-SDR: n08mS7j/oAzndJ1Xlk77PbsKyfSnwi5NkUJA7uosL5cNAthokudHigHPLM+tvgB2qQ74S+pq9C
 FtUElPlK8pbiN/MA1taO+TPnQFRbSTHakIk7q5oqtB4zw4pWmGaWEdiVifX8h+Szosj3o/gAoe
 bruUwkC2QjbxLHgH6WjE6D5WHnyknbSk5NcaLBQBggm/rtOBu2tYFh88kyl4kTmC6Md2Hap+rK
 6rthslc65eIMvf/MGQxG/OYs7u/O43r75cEARJOy8iy8C/p8EAm9Hjw4Oq73MZKzj5l1w7l3e+
 EIw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 21:48:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxJxs164qz1Rwtl
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:34:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1666672480; x=1669264481; bh=I4CKihtthzXOfahvUW
 JQTfAuyO6hc7XxzMvk4ywIizA=; b=PnKLVV2paVFIbAIdPxJKCJyEMTnVLrODa0
 lY7ODCt5s4mZ35J+OL+KnJ6dNShxJnjklYrwb6Esf34uWXvNzPJvtljdz+AqGleV
 mbpZ2OIitfE/ucJes4D4sk9nqwWU5tQ4bZQCwHxCGhizl7U1AHNO+tv/Dze9yXL/
 6fk5l5FM2Q1Pkhy7fLAYTTbkTSGBcqRPlZusEXxTkguXdb/+V0he/NQVqGl727Wn
 ogVMNDEsCVF+YNZHWiHVlR52Y9LVThF4Mq7d5pX4HRFCXqta/R59UTKF2/5wJR4z
 shnuxYB1PW9Qz/bNnUJaQpeCqZyEyYh/h7WVcJjoP/+hOb3eLXIA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ywb4Lx-Eng8I for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 21:34:40 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.78])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxJxm42xVz1RvLy;
 Mon, 24 Oct 2022 21:34:36 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v1 1/2] hw/riscv/opentitan: bump opentitan
Date: Tue, 25 Oct 2022 14:33:36 +1000
Message-Id: <20221025043335.339815-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
References: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
---
 hw/riscv/opentitan.c         | 21 +++++++++++++--------
 include/hw/riscv/opentitan.h |  9 ++++-----
 2 files changed, 17 insertions(+), 13 deletions(-)

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
--=20
2.37.3


