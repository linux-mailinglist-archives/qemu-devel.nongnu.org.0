Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD34D4CB674
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:34:23 +0100 (CET)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe6Y-0002IZ-VH
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:34:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1I-0001sy-Fb
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:56 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1G-0000XC-EP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285334; x=1677821334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zBpqLWvYbZXszGRoRQcV0k4yc8Y5i/zbSdC126j/28=;
 b=FU8R/xg3HOt+qNTa3p+BH+n8McDf8otJKZ2s+EnWveWESbmX8KIVzHjV
 tVnL1CHV6W1NADGVxjrvJt3uy8jrRedC1fzxJohVfebsHjxhSbFTlHvhY
 FJJKlm+sOpDO1uYNgZpiBULSZptsTsjs2qhMIbzM6eGzo/T3Whdqpfq61
 uHyTYucMa1Ams8dxj5HNEJ4Fs+12zQ8XWBeCJAVlf9Jijl2e7oOYnF7WO
 BAruht9CP2I7O9YYmWJ4jeZyXm4zwttLC1n9BucLaLdLarNdjee8Zhr3+
 5gqnO0YJxSetH3o58wlJTIlJLErtCP9L17MXxVrW1GY6EIsFUp+91s5Y4 w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355357"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:53 +0800
IronPort-SDR: 2+/ehsaKybqCX7FwJ5hnTb3bRPAhpaQ5r/qEzTdKT5JdNwu+ruGl3BGFTuWHcBPS3QtCLa+tkx
 PYjI75BO+m42kFOmxvJEjWwz+9GD0IROWSvvVI5wssoQIqXmLAAm8OBrfBkcD8GrMBtPUGgXz6
 RvjFxxs38tK+UKvb078MUxbbFt6V1zexAun6v6FQtdnEdvutAn4DadTmYsYaWvOnEDMlcmh72D
 YWvWoX5//T59krnyZtd9AzOsVJBovckLHTqmFdgLULap/Fdu8QCXz5wNutptw24LDOsRus2pfa
 MjFhXczXEAkyTjb0BZsD5ElQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:16 -0800
IronPort-SDR: Mgb6EO6yiffCPnxkCt1TZyB9IjXZg/BQR1f4P9r0oetZubVGgqm35yr5SOJPdyy6MB+ct8xWyU
 SogJZatfiW03Kbv36vYBfGxXNi8PJJ+moVk8rQW3FVx3hth1EEt6FLe+u0ust5GR4wIVMpXAwt
 J46jadyXNRBaXpw1w8pbwP+YuYPDxgU2NRhjo9Qeu9u7VPOh4WC1kALxtew0/J2yCJMCoxxojn
 U3FbFNBRb9X2TXFhQIZNJpXY3uh2bo0fIP7dtB775/AVTFfrgUYB4wJ85Y0CarMhQpmZ+41RIz
 DGA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKK2cv9z1SVp0
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285332; x=1648877333; bh=1zBpqLWvYbZXszGRoR
 QcV0k4yc8Y5i/zbSdC126j/28=; b=pWgZXuh6ECTzvWS21u2FlIaTuBE2pmH2/g
 1PrzlVP6aWHnsbiDgbRCJ8rr90zaysE6LtBnDIRJ9IN9qtbzmisHZv2Snbs/oiPt
 tPwIhprvWDn/xUHu/VSTgYlRcJhcYs+QH3BGdqIoUj++dsmX1Wem9rNzGRcuaynP
 qwt/0U00rqZlFuhB5xrW8gX1MhE4OFXiK6khVuCgDTcca6JsWv5DEf37/HNjnScM
 2zWM3OVQd0wGgwqOU9yhM7Sf6aYAdQmuV5j5IlOzYKkITD7Qc3tclp14zAPdOdkH
 E2b3Bz6KFnuq9QFuHBsTYWhyNUw4tPit3k0ZPk2ZuFpnccbKIh5w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YJHk6AbO00r3 for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKF25Mlz1Rvlx;
 Wed,  2 Mar 2022 21:28:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/13] hw: riscv: opentitan: fixup SPI addresses
Date: Thu,  3 Mar 2022 15:27:58 +1000
Message-Id: <20220303052804.529967-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch updates the SPI_DEVICE, SPI_HOST0, SPI_HOST1
base addresses. Also adds these as unimplemented devices.

The address references can be found [1].

[1] https://github.com/lowRISC/opentitan/blob/6c317992fbd646818b34f2a2dbf=
44bc850e461e4/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h#L107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h |  4 +++-
 hw/riscv/opentitan.c         | 12 +++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index eac35ef590..00da9ded43 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -57,8 +57,10 @@ enum {
     IBEX_DEV_FLASH,
     IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
+    IBEX_DEV_SPI_DEVICE,
+    IBEX_DEV_SPI_HOST0,
+    IBEX_DEV_SPI_HOST1,
     IBEX_DEV_GPIO,
-    IBEX_DEV_SPI,
     IBEX_DEV_I2C,
     IBEX_DEV_PATTGEN,
     IBEX_DEV_TIMER,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index aec7cfa33f..833624d66c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -34,13 +34,15 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI] =3D            {  0x40050000,  0x1000  },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
     [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
@@ -209,8 +211,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
=20
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi",
-        memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
+        memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
+        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size=
);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
+        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.i2c",
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
--=20
2.35.1


