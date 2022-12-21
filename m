Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46F6538F8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mb-0008Ti-C0; Wed, 21 Dec 2022 17:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mZ-0008Qk-O7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mX-0000Xf-N7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662509; x=1703198509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RobOMoHC8AMiNjPZ0P2MpRetfpGMHTgISeyeurg1D18=;
 b=ciEVtmW9ezP6wwP/QK0SdsuWtXjJMQCobo/pNY9L+PszsClI61rcYCjm
 dHjbukmTfXZLtV9uJcOlAxyHWWvnsejXu5RbRqMfU0eOR01jpOjLQd02I
 1RZVPrY3imswnEmR12S7j7xPsbATn8rtHZa/UmKT4EEm0uEQS8goRTBMg
 2gbFopEIJg2z9XqfNYGkWblVkifA4ij4upLDTHht8geXwi0mLwI9GwCZS
 eV6Jf6mYTNOlRv2SQ1NugDgIt/N8PytVX34UBeDsbW7LldVbjtu1dXXv7
 F3iU4ej4X2vZJuo/zVQ+JBNY9KRlDreGkFSLtIh2C3ZNFHjH7cJ+oxAy8 Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561367"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:14 +0800
IronPort-SDR: jXPC2XJyuVpiTrgEasp1WfeRVCqt4YCESw0qV0pO7WbHju4VKJ3r6SkAdFJuLmMHWjY5+NHM86
 lZkZp9xEtTae83/nKyCcfpLxamPbWx4kGDS8hApqkZQfz5jTlLMqnH2SSi7irAYkg6pHjuj+Sa
 rM1ai5v/B3jNDz4sSCJwP+x+Dr7suQ8uMsUd/o4vC/QA1uGopl4+G93beV22m1Jdf58/xP9SVI
 SCifeIJOc/30qhrHdtPurqPYXyJQavMuqnBR9HXYGObcY79MyrcAqOeSrvmHz6lf0RZAXWRv9a
 Rkc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:43 -0800
IronPort-SDR: 7ajwp+p/01fun+5KZbmOnk1/LwTFx8P1Mt+h0JAuazSYRnPtlLmww4avwGGYcQGq0PnwrtJRSk
 D0FU57/jfywn/XP3+N1Yjud2TwhYKg/vFI7rw3fW66KsTV3JYL19M3Y4zD/zy03cIpsrtpvyxD
 KnVzD4He6u4U0Vfd9IbwTPKIezGLU9QRB5Nv1VdKSj540RGx4smotehVpBOpHYQMQmoHRRIsaW
 kIltpb2gDgmW0fT0uFVXX0vuunP6h3nOAVsFk9XTdIA1uwZkTqk0nuW8uL+F01d+tX5WmFSkgL
 4pQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMG5Jy1z1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662473; x=1674254474; bh=RobOMoHC8AMiNjPZ0P
 2MpRetfpGMHTgISeyeurg1D18=; b=G3TFUki67RcOkpsJPsWEC7Dzn4ZZ8MecHQ
 vIF7poJpb/cA7lkgS5qrqiPDKpUdUx5Py89Krr4b/QGB2VSzSJQQHNR9PnuATwnR
 IiVowkDtvyUh2/5iz2C7ll+oGC331HCX/jwymgWO0enXqdUigJgHBofBiSRP18RZ
 c1waG2Dww0g8XqiUBoGweyiBtJ61An/AsWzBwlRc0rilepxOImVfdZPdfdHd9zph
 v5qs5cOvm0V5LRTXDXlfRWhwvY+gnR4HOQFNekOTGXPucN5QH23Ix0ECo6JWfuHf
 S1kV7D3lulK8ruyesxxqZmIaVzdxd/q0BUHAHA2XR1/9y4XfAtCA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iZ9ixqAC5JvD for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMD54Yjz1Rwrq;
 Wed, 21 Dec 2022 14:41:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 22/45] hw/riscv: pfsoc: add missing FICs as unimplemented
Date: Thu, 22 Dec 2022 08:39:59 +1000
Message-Id: <20221221224022.425831-23-alistair.francis@opensource.wdc.com>
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

From: Conor Dooley <conor.dooley@microchip.com>

The Fabric Interconnect Controllers provide interfaces between the FPGA
fabric and the core complex. There are 5 FICs on PolarFire SoC, numbered
0 through 4. FIC2 is an AXI4 slave interface from the FPGA fabric and
does not show up on the MSS memory map. FIC4 is dedicated to the User
Crypto Processor and does not show up on the MSS memory map either.

FIC 0, 1 & 3 do show up in the MSS memory map and neither FICs 0 or 1
are represented in QEMU, leading to load access violations while booting
Linux for Icicle if PCIe is enabled as the root port is connected via
either FIC 0 or 1.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Message-Id: <20221117225518.4102575-3-conor@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h |   2 +
 hw/riscv/microchip_pfsoc.c         | 115 ++++++++++++++++-------------
 2 files changed, 65 insertions(+), 52 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index a757b240e0..7e7950dd36 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -121,6 +121,8 @@ enum {
     MICROCHIP_PFSOC_USB,
     MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
+    MICROCHIP_PFSOC_FABRIC_FIC0,
+    MICROCHIP_PFSOC_FABRIC_FIC1,
     MICROCHIP_PFSOC_FABRIC_FIC3,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index a821263d4f..2a24e3437a 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -86,58 +86,61 @@
  *     describes the complete IOSCB modules memory maps
  */
 static const MemMapEntry microchip_pfsoc_memmap[] =3D {
-    [MICROCHIP_PFSOC_RSVD0] =3D           {        0x0,      0x100 },
-    [MICROCHIP_PFSOC_DEBUG] =3D           {      0x100,      0xf00 },
-    [MICROCHIP_PFSOC_E51_DTIM] =3D        {  0x1000000,     0x2000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT0] =3D    {  0x1700000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT1] =3D    {  0x1701000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT2] =3D    {  0x1702000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT3] =3D    {  0x1703000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT4] =3D    {  0x1704000,     0x1000 },
-    [MICROCHIP_PFSOC_CLINT] =3D           {  0x2000000,    0x10000 },
-    [MICROCHIP_PFSOC_L2CC] =3D            {  0x2010000,     0x1000 },
-    [MICROCHIP_PFSOC_DMA] =3D             {  0x3000000,   0x100000 },
-    [MICROCHIP_PFSOC_L2LIM] =3D           {  0x8000000,  0x2000000 },
-    [MICROCHIP_PFSOC_PLIC] =3D            {  0xc000000,  0x4000000 },
-    [MICROCHIP_PFSOC_MMUART0] =3D         { 0x20000000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG0] =3D           { 0x20001000,     0x1000 },
-    [MICROCHIP_PFSOC_SYSREG] =3D          { 0x20002000,     0x2000 },
-    [MICROCHIP_PFSOC_AXISW] =3D           { 0x20004000,     0x1000 },
-    [MICROCHIP_PFSOC_MPUCFG] =3D          { 0x20005000,     0x1000 },
-    [MICROCHIP_PFSOC_FMETER] =3D          { 0x20006000,     0x1000 },
-    [MICROCHIP_PFSOC_DDR_SGMII_PHY] =3D   { 0x20007000,     0x1000 },
-    [MICROCHIP_PFSOC_EMMC_SD] =3D         { 0x20008000,     0x1000 },
-    [MICROCHIP_PFSOC_DDR_CFG] =3D         { 0x20080000,    0x40000 },
-    [MICROCHIP_PFSOC_MMUART1] =3D         { 0x20100000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART2] =3D         { 0x20102000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART3] =3D         { 0x20104000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART4] =3D         { 0x20106000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG1] =3D           { 0x20101000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG2] =3D           { 0x20103000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG3] =3D           { 0x20105000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG4] =3D           { 0x20106000,     0x1000 },
-    [MICROCHIP_PFSOC_SPI0] =3D            { 0x20108000,     0x1000 },
-    [MICROCHIP_PFSOC_SPI1] =3D            { 0x20109000,     0x1000 },
-    [MICROCHIP_PFSOC_I2C0] =3D            { 0x2010a000,     0x1000 },
-    [MICROCHIP_PFSOC_I2C1] =3D            { 0x2010b000,     0x1000 },
-    [MICROCHIP_PFSOC_CAN0] =3D            { 0x2010c000,     0x1000 },
-    [MICROCHIP_PFSOC_CAN1] =3D            { 0x2010d000,     0x1000 },
-    [MICROCHIP_PFSOC_GEM0] =3D            { 0x20110000,     0x2000 },
-    [MICROCHIP_PFSOC_GEM1] =3D            { 0x20112000,     0x2000 },
-    [MICROCHIP_PFSOC_GPIO0] =3D           { 0x20120000,     0x1000 },
-    [MICROCHIP_PFSOC_GPIO1] =3D           { 0x20121000,     0x1000 },
-    [MICROCHIP_PFSOC_GPIO2] =3D           { 0x20122000,     0x1000 },
-    [MICROCHIP_PFSOC_RTC] =3D             { 0x20124000,     0x1000 },
-    [MICROCHIP_PFSOC_ENVM_CFG] =3D        { 0x20200000,     0x1000 },
-    [MICROCHIP_PFSOC_ENVM_DATA] =3D       { 0x20220000,    0x20000 },
-    [MICROCHIP_PFSOC_USB] =3D             { 0x20201000,     0x1000 },
-    [MICROCHIP_PFSOC_QSPI_XIP] =3D        { 0x21000000,  0x1000000 },
-    [MICROCHIP_PFSOC_IOSCB] =3D           { 0x30000000, 0x10000000 },
-    [MICROCHIP_PFSOC_FABRIC_FIC3] =3D     { 0x40000000, 0x20000000 },
-    [MICROCHIP_PFSOC_DRAM_LO] =3D         { 0x80000000, 0x40000000 },
-    [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =3D   { 0xc0000000, 0x40000000 },
-    [MICROCHIP_PFSOC_DRAM_HI] =3D       { 0x1000000000,        0x0 },
-    [MICROCHIP_PFSOC_DRAM_HI_ALIAS] =3D { 0x1400000000,        0x0 },
+    [MICROCHIP_PFSOC_RSVD0] =3D           {        0x0,        0x100 },
+    [MICROCHIP_PFSOC_DEBUG] =3D           {      0x100,        0xf00 },
+    [MICROCHIP_PFSOC_E51_DTIM] =3D        {  0x1000000,       0x2000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT0] =3D    {  0x1700000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT1] =3D    {  0x1701000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT2] =3D    {  0x1702000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT3] =3D    {  0x1703000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT4] =3D    {  0x1704000,       0x1000 },
+    [MICROCHIP_PFSOC_CLINT] =3D           {  0x2000000,      0x10000 },
+    [MICROCHIP_PFSOC_L2CC] =3D            {  0x2010000,       0x1000 },
+    [MICROCHIP_PFSOC_DMA] =3D             {  0x3000000,     0x100000 },
+    [MICROCHIP_PFSOC_L2LIM] =3D           {  0x8000000,    0x2000000 },
+    [MICROCHIP_PFSOC_PLIC] =3D            {  0xc000000,    0x4000000 },
+    [MICROCHIP_PFSOC_MMUART0] =3D         { 0x20000000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG0] =3D           { 0x20001000,       0x1000 },
+    [MICROCHIP_PFSOC_SYSREG] =3D          { 0x20002000,       0x2000 },
+    [MICROCHIP_PFSOC_AXISW] =3D           { 0x20004000,       0x1000 },
+    [MICROCHIP_PFSOC_MPUCFG] =3D          { 0x20005000,       0x1000 },
+    [MICROCHIP_PFSOC_FMETER] =3D          { 0x20006000,       0x1000 },
+    [MICROCHIP_PFSOC_DDR_SGMII_PHY] =3D   { 0x20007000,       0x1000 },
+    [MICROCHIP_PFSOC_EMMC_SD] =3D         { 0x20008000,       0x1000 },
+    [MICROCHIP_PFSOC_DDR_CFG] =3D         { 0x20080000,      0x40000 },
+    [MICROCHIP_PFSOC_MMUART1] =3D         { 0x20100000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART2] =3D         { 0x20102000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART3] =3D         { 0x20104000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART4] =3D         { 0x20106000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG1] =3D           { 0x20101000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG2] =3D           { 0x20103000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG3] =3D           { 0x20105000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG4] =3D           { 0x20106000,       0x1000 },
+    [MICROCHIP_PFSOC_SPI0] =3D            { 0x20108000,       0x1000 },
+    [MICROCHIP_PFSOC_SPI1] =3D            { 0x20109000,       0x1000 },
+    [MICROCHIP_PFSOC_I2C0] =3D            { 0x2010a000,       0x1000 },
+    [MICROCHIP_PFSOC_I2C1] =3D            { 0x2010b000,       0x1000 },
+    [MICROCHIP_PFSOC_CAN0] =3D            { 0x2010c000,       0x1000 },
+    [MICROCHIP_PFSOC_CAN1] =3D            { 0x2010d000,       0x1000 },
+    [MICROCHIP_PFSOC_GEM0] =3D            { 0x20110000,       0x2000 },
+    [MICROCHIP_PFSOC_GEM1] =3D            { 0x20112000,       0x2000 },
+    [MICROCHIP_PFSOC_GPIO0] =3D           { 0x20120000,       0x1000 },
+    [MICROCHIP_PFSOC_GPIO1] =3D           { 0x20121000,       0x1000 },
+    [MICROCHIP_PFSOC_GPIO2] =3D           { 0x20122000,       0x1000 },
+    [MICROCHIP_PFSOC_RTC] =3D             { 0x20124000,       0x1000 },
+    [MICROCHIP_PFSOC_ENVM_CFG] =3D        { 0x20200000,       0x1000 },
+    [MICROCHIP_PFSOC_ENVM_DATA] =3D       { 0x20220000,      0x20000 },
+    [MICROCHIP_PFSOC_USB] =3D             { 0x20201000,       0x1000 },
+    [MICROCHIP_PFSOC_QSPI_XIP] =3D        { 0x21000000,    0x1000000 },
+    [MICROCHIP_PFSOC_IOSCB] =3D           { 0x30000000,   0x10000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC0] =3D   { 0x2000000000, 0x1000000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC1] =3D   { 0x3000000000, 0x1000000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC3] =3D     { 0x40000000,   0x20000000 },
+    [MICROCHIP_PFSOC_DRAM_LO] =3D         { 0x80000000,   0x40000000 },
+    [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =3D   { 0xc0000000,   0x40000000 },
+    [MICROCHIP_PFSOC_DRAM_HI] =3D       { 0x1000000000,          0x0 },
+    [MICROCHIP_PFSOC_DRAM_HI_ALIAS] =3D { 0x1400000000,          0x0 },
+
 };
=20
 static void microchip_pfsoc_soc_instance_init(Object *obj)
@@ -461,6 +464,14 @@ static void microchip_pfsoc_soc_realize(DeviceState =
*dev, Error **errp)
     create_unimplemented_device("microchip.pfsoc.fabricfic3",
         memmap[MICROCHIP_PFSOC_FABRIC_FIC3].base,
         memmap[MICROCHIP_PFSOC_FABRIC_FIC3].size);
+    /* FPGA Fabric */
+    create_unimplemented_device("microchip.pfsoc.fabricfic0",
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC0].base,
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC0].size);
+    /* FPGA Fabric */
+    create_unimplemented_device("microchip.pfsoc.fabricfic1",
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC1].base,
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC1].size);
=20
     /* QSPI Flash */
     memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
--=20
2.38.1


