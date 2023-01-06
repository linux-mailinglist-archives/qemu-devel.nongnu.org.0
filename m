Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274065FA25
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCe-0001qp-Nz; Thu, 05 Jan 2023 22:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCS-0001cS-OV
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:21 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCN-000892-DM
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974915; x=1704510915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jXIs4qZjjxjw7RK0sM+PDXVniQS58iYNalvK8OrCBN8=;
 b=Yf9gwjY1Fvf/088fPO9TUQ5YkhyX2zkEmeK0SVJENKcGLVkXUGUCzKdI
 kVXR2iUCWF04Rul/ubNmx9/H//wdZFqnggyjbQrxpfeUE+o29pTdIagKQ
 xqBIR0hEsUHYhvmMHsOCWyoglqWba5+YISKWJa6WiLPwvborniAZEcTkc
 3lem+UcqHBUcR2o3WciAsexakHmRuwm9P4FjDCCcKSQpUCZr1Qgv526py
 GlrGTwLRnMeVnEF7yy3g4KauaSD1HovVY6luaq3P2SU7zb6OO9jh+k4os
 1kALCdIJR4ZZnD/RXyzUcOd83DfAs/SaP6R1/Mh8VMM2bZTzjTtG1JxOf w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254796"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:39 +0800
IronPort-SDR: ywgK1uzmBjUxYNlB8nZ+yy+6iQmiHURQnLgX39jK0/9+//PfqZSzAgqBlsf9ceeXyeSvVRoWlp
 jVEgR2kEc7UHC9Tpkaaen8gTn9QGMomQFws81HeCEgZctA0FGSG2/jvuItM/AM7YZB+dRocPPC
 BqgdfOm+iRJQTnALmXg7j0jpzKXCCYeNDo+lukw7vml8OOuGowZ0CQUL4/Pv3MjfmZ4Ht2rKx3
 1/LtJDS6yW1QIl4XBrapHnC7WYCCbIlrscS8z0qClz97VyFphUNLKUxYFrs3W1DVv4fPSPpyHt
 uY8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:50 -0800
IronPort-SDR: Xk+1OJ4A0pk1KQ9xSJC/ljL5xej6yCgefZZcSXQ5N84RtcSAdIhhF0pw58zB6FB9QH0IZTst8I
 uMggsJn+8LymenJU2lC/bOHY0I3V2LxDqEr2jKJkWnAGJbmqaXBZDUg6ofznS5pWHhbTbrokx4
 MZ/RDS8NRX8vtkIaRvvrZ5ROxr9NjEtToM1JO11QdkLoPGnleNPweaJFJgSz8wvUiVHuyo+XkE
 sB0SwPsJxSJSfZq6S5aK5D+m2bGMH8hyD4Xe6zyQWukh0xdPuhBsZEaL3RPjwUQSdm91ZPI4w2
 3qg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jq6DdWz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974879; x=1675566880; bh=jXIs4qZjjxjw7RK0sM
 +PDXVniQS58iYNalvK8OrCBN8=; b=e/VuDEXPrli+GzZdgDmp6iyRyohmPvEMMt
 9omdIfQ2e6EgWTWGIlxgHfBhHqJWKEkPYZroAzrUMgeYf3eU9nfiafDlg96vAWkb
 Dl5V0dlr+bxrQGJ5WrQoVPa9FwguCrvUp5J18BEpaA7PqbuoCPe+pM6i06yReW+r
 lPHSzdqj5EOtFSFyj/bPTQyW25gJDt2GZ9ywSP3XCL1AXg3j0ESfZ7vcEjAucKRD
 sCtv0M/9DQNi7VSsXkvgRaUStWySGfN1El8CzL8AYC929rvsuGTEPOdRf4JQLFvJ
 GB0Yqe3C14dW6e3ve45LDWxIIuvkmuF3jmtB424W90/wt7NuuTcg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RtZk93naXPvG for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jn6xJ2z1Rwt8;
 Thu,  5 Jan 2023 19:14:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 20/43] hw/riscv: pfsoc: add missing FICs as unimplemented
Date: Fri,  6 Jan 2023 13:13:34 +1000
Message-Id: <20230106031357.777790-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
2.39.0


