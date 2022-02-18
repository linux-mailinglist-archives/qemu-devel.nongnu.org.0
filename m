Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FB4BB2B2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 07:48:51 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKx4S-00010H-CA
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 01:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=041753b3d=alistair.francis@opensource.wdc.com>)
 id 1nKwvA-0007do-7Y
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 01:39:13 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=041753b3d=alistair.francis@opensource.wdc.com>)
 id 1nKwv7-0002cZ-Gl
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 01:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1645166350; x=1676702350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=POAeFf8lmhKQLPzv4kini1ERq/h60YOWCEprrO1GQ2g=;
 b=p9J7ptrmHosAczE/bhGn5scPhmHs5x0chRCONv1GZG8Foo5wGlLc/8G5
 fWPVXFeFTQpJ7FrDhDlH3MuBqC/vANjNT5LVyelGNl5EH24bC9W8uhQiy
 GEmnbZbeVaa6JLK/VO32I3tkqtJODY32Onc7YHGuH7MTl6/eAnZfMOScw
 buU1P+Zjh/rbwDrV4JPjRdzTc4KXcWwTv2NlmHpunJaGQ1yDzHDXXdYIs
 1ezxFlOu1AGF67SDVX999PCePAP4KUeGlSEefR/bzwzmCujO0uQypGOEF
 rN6t87Eq6iT3Ti7IegmoMprbgjZRCloS9XtspwSLh5MGiIKtqPNKFnjAL g==;
X-IronPort-AV: E=Sophos;i="5.88,378,1635177600"; d="scan'208";a="194238253"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2022 14:38:52 +0800
IronPort-SDR: XqULGfmGLPdU41OUb1kUaFKF103HXHz3SmkReU4xwZK90XiRzC4a8N45PyFN67v6EwsCDOzAS8
 XsF1E5LKpZuRYGUxo/LS7e8w05MLQaN4e6/NDc8wZKns555LFSDU6u1fFB+wvNJCneP8Zsus68
 y8KrQ5Lo0GkfHcVTWwQ26ISnjv2qySBmCFyRgrHksZ94MwdGTr3Nw8lGCtH66MSIYa+ea0PsJA
 XHMt/Lwz/NDPYnkUfuErADaHxlMUIXeRED2Zaji5LDhszheyhR+TOc+SCHzwTM0rgK8FB8zuTW
 YAVnsPcTunp1JCc61V5b8MLr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 22:10:30 -0800
IronPort-SDR: mVpqJmF6L4U6xIykR0aDRwxZZqmvHMjdE2cMCV4hyIsL0ElY8w0w2dX645hAKCdwyCWzpYdJHN
 uX7MyRVmREPidzLujderNKamAdHPGLx+gSwJhqbnnb9oEJAZqC+utKDI8OwREQaQzad54zAlRJ
 6H6OnDY2eV9I3l3NsiHIbM111Jbif0lVkn0f1F8IgwyEvlzeZcb3Jb/LHi8a2BHYuz+gcF11mf
 rJbfoMf6afE7iI4A3syBgDNacfJRXADUqa5/SxGtr17Lr4I6TYUYvB8mfV8IDciTGaDwX03xXu
 DYM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 22:38:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K0MV346fVz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 22:38:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1645166330;
 x=1647758331; bh=POAeFf8lmhKQLPzv4kini1ERq/h60YOWCEprrO1GQ2g=; b=
 c/UT0vs3rna6yyLiOeT0l3IRNSas3xtBapeIBYXlYcQ97Qn6BbXliauecXGUsV+1
 Yv7oi58BCT/CvgdtP0U0JUdEyMnrGV6P/ygULRz328h29YzDfAnJ0Aj2mbv1FvUm
 XrN4ozbJqu15bh/32/JLfos7xEQ9SoefgJRJIrixRXtCRmM1+1y0+BolsGlCa1EH
 zljP12iw6r2qAok3WObXPOuAHdDK6dl8vVGDrxolqTyot0MUtakZLWU7VSMe7961
 FolNLK47sa/ZhyofGk4B+E72HVppn0L0TxolBYU+ADj6wdBK+1nlJ4FNPLYw2Pyp
 6D8HVahWmnQKecojWZcu5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HIRv1Wv0MmbJ for <qemu-devel@nongnu.org>;
 Thu, 17 Feb 2022 22:38:50 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K0MTy40vvz1Rwrw;
 Thu, 17 Feb 2022 22:38:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2] hw: riscv: opentitan: fixup SPI addresses
Date: Fri, 18 Feb 2022 16:38:39 +1000
Message-Id: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=041753b3d=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
v2: arranged base addrs in sorted order

 hw/riscv/opentitan.c         | 12 +++++++++---
 include/hw/riscv/opentitan.h |  4 +++-
 2 files changed, 12 insertions(+), 4 deletions(-)

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
--=20
2.35.1


