Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7C4B8099
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:25:26 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDkj-0002A9-2r
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDie-0001HD-0K
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:23:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:58996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDib-0005TZ-PM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992593; x=1676528593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OS1E/FtxGnq0FdQKgaclKyxOcSmrIY7adRw9g/4vIHs=;
 b=Iebs4A75I0/TxZAAetye7VOOIn93w/YHeFa7kFmCXA/a9AWhaDi6nGUb
 Gi5GqHyfN2ShxMkABE83zBnjtHRV8zg1s7V08+5EUCuSV2AYghX38EdCf
 3ZHKXWA4pWsJK7oE8+PD6mQ/EuMa1u0MpYePEYuS3k0zpAhXD9IncUkq8
 Q41J0m4JSPOEav/20rr2lQISPEvpilIiA0D+Es9m9j+46NVOgYv7/PaLz
 mU6whRIfOGi9fUANLALcF15OGorl9W6gQwLH2R2ttN0GFGHvHhWuTPnVH
 Sixv/Oo6di8Fwi2R1BzO7uAWDz7LBKHS6iod9+Hl3pYLQk1ZUbZUUPQO8 Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072320"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:23:05 +0800
IronPort-SDR: j3Nvlb8h7QvStb12oMoi2UK4XNx6an8f3XGgXknJx4StsFIqqdLoKyHZtX2CJJe1KbK3AUMQR5
 HwDt0Gp1wSboxxcdudXY4CDWvxaCTz2Lgox0ESeLfb012GQEXZrdNuFPsdL1RRvkKqlKTyLNF7
 JjubWMm0sooMr1XUkcTTFRqoxCO0zyDZrJR8T32mKSM71X85KHRhUeCYUMpoHjmp+froAFrcqV
 z7pNIHf4+g02iO877FZwh6RPOPsUDYGzcU+2ebNhm/rvK9bjD9AilCsmiDWfuUhoWhinmNXPnu
 YU8mdlR67EeD18+m/4sW/xKB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 21:55:53 -0800
IronPort-SDR: CWXobATif2//YO9sI7kJldY0QzIBp97vGeiSOByod1HdP0jDkziv9YD8tD3hzT4F/TyesG/Nkc
 VADwYcXVhN4mW2qVwOImCHxM8jZmfXSVhCI4eiROqxpiuxIlARrhxEuZaMbsBiak3+tR8U5Kg6
 xTeb2QCR0LQU/gQlkBFbRc2rB+5xq8QQ337EnHXw2IliXbiPBId7kfYM0DnWgwP0zozoP8O4+s
 86S6nwQ5NOTTTmxtoP1m5jARWgPSd/gi4uq345DYhE92xbbtFWR4C5I/Sx9L76mtZCemzYRncv
 5cg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:23:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Dm6hYkz1SVp3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:23:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1644992584;
 x=1647584585; bh=OS1E/FtxGnq0FdQKgaclKyxOcSmrIY7adRw9g/4vIHs=; b=
 bMRs9RtFWHEmnT7yCfOv/xFR4cOWJTv+YMYuydo13QgxcCh3gksAbsBzIDvufJWR
 J+ZBjod19dtDDh+L8uuOt2DS/oN+lvgwUzQnw/xiW//Hi8AXixluU1Cw49dnZFRa
 3cokh4HqmniIHKvWZziqb73whYI5iBv24ZD3h3vVIhysqxc4McGKYoYnFMK2eDjE
 joQ/xA20b19paFtliFV9XjLcDU92O5WU5ABn4q96aWON81p3+oSgXl/35RhkBdtm
 QLrR2fRaI6DD7U2tHUIpKOLxH6cYPFQL8N3gAey2pYy4WBdJDQP1/ANITUEfUAPF
 FiRKXb1iH+30h7mFbxBr4g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z84xUgSDHZ49 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:23:04 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Dg59M5z1Rwrw;
 Tue, 15 Feb 2022 22:22:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v1] hw: riscv: opentitan: fixup SPI addresses
Date: Wed, 16 Feb 2022 16:22:48 +1000
Message-Id: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
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
---
 hw/riscv/opentitan.c         | 12 +++++++++---
 include/hw/riscv/opentitan.h |  4 +++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index aec7cfa33f..596b518a26 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -33,8 +33,10 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_RAM] =3D            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI] =3D            {  0x40050000,  0x1000  },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
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


