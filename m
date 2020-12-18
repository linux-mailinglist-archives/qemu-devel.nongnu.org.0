Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280F32DDE65
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:07:50 +0100 (CET)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8vd-00032R-58
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pS-0004wQ-9J
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:26 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pO-0002GJ-EN
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271589; x=1639807589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZEylZjmwmI8yYq7lqp9Fa0gMtrPfMjwNGFdOr0BhT5k=;
 b=dMsPmwMGuLE9haYpFeDe/HFtTtvJ3sNg9VGT4Kw+QU34rIFQgn/zCB0K
 Ki52e+NMPtmfCX69bB/5JPcqnAw5fFG81unZ7WUqcrerRnLD9HRH0CRNE
 dtLYW8sWS6EjNKo1BL/HWecj/IEmobfCxPSzJDty6xh9IP5VwWZiCkWT7
 9hJtOF9ZDmgxKJw+MW9s8AL8heveo9OZ/DKG1+8vVylTuv3kgzalwB4mB
 AumtXi/dN7tNCYvvSlg3tOmbkk8j92gBZqbQqxmIJrZ0jRyf9v0SD+uX5
 j2e7BBaj9X7hILQ9hZRk2ec08xfv4ke34fD5sH57LukyLQbOuA67gRIYh A==;
IronPort-SDR: Uj4vCzEuN2plnnRhv6YhtaCblmEbsyuAMD3xQ5+ohIw0h/a+rbybvI02oheZVhXnLSn+djWHH6
 KiugOjkUO9KISAV7A7apZ84+LHGxSh0irO1HDi/DxAemWjiofz7b+AOKuyhiS83NLKc0F6KeNt
 RcavxgKxD6HzYAQERhvS3IPbJVDwTctmhx/RWQfNnokRtIWnmUToY7Z68A0T4+BlphRbtZlpx4
 gSjRl4EYtXD/PKh7lfeGG9twgSLGleA8Vv5YEjk3gB/AWNnLZZPRkXv+Ji5JxhrqEEIlR2yBgI
 sss=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237037"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:23 +0800
IronPort-SDR: mSGTtct197HNIBEL0RWQhpfMIPRTxUNA8BY2Er+/gbPSUvkSY35rV5vCHDPKaCD7FvJLE6sVC0
 YthFBsm9vYSsRhPKNiZj2PYPjhN7UMjJ2IBLpLXUgvF+ptuagWxy0B82LxM0WgkTuZGYNDs56t
 6Z5VjQf3/UiB+wsrkRr69acLoSdmuHkMmSZ2aGk9p3KhcOI24SsgVFF1zzKAlFweb/OMPPKAIc
 BJHdSVAtOeDioyreSGugHQGlKe6aGAyqHV13CMUwlLMMdK7ulhHjXJ+2twXF87zuWXflXM+Iqw
 j2FV7Ww/8inZsg9dYTYcQvqs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:34 -0800
IronPort-SDR: RZ+WIGr3paxH6MeeOdBY7/kIRtHfGygW0cJkfEgXJmzqXxJys+bv7f4348PQPr8PEB3sAzxdSi
 TFvtYHOWoJ7Aps9o/7Jyhg29n5II8fpmL5e17YynwPt5WSdBafHOmYGkN0BeUjmoh9lMiw5iKB
 1T/CkzFfSnIpjCTLcqivxW0/0Y889ygPaGIF4uNy46AWuOYYmBFkhCBvmV6FazmRmmytssrBKm
 qJCTadN7DmtojnpLb7YR+PXp8/sHZ0DrNXuBjskrCztnLre8Ajx+O/xHYZ2TIMu1NENWwTHHHX
 v+M=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:18 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 02/23] hw/riscv: microchip_pfsoc: add QSPI NOR flash
Date: Thu, 17 Dec 2020 22:00:53 -0800
Message-Id: <20201218060114.3591217-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Wool <vitaly.wool@konsulko.com>

Add QSPI NOR flash definition for Microchip PolarFire SoC.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20201112074950.33283-1-vitaly.wool@konsulko.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h |  3 +++
 hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 51d44637db..d0c666aae0 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -97,6 +97,8 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_SPI0,
+    MICROCHIP_PFSOC_SPI1,
     MICROCHIP_PFSOC_I2C1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
@@ -105,6 +107,7 @@ enum {
     MICROCHIP_PFSOC_GPIO2,
     MICROCHIP_PFSOC_ENVM_CFG,
     MICROCHIP_PFSOC_ENVM_DATA,
+    MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 37ac46a1af..e952b49e8c 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -113,6 +113,8 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
     [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
@@ -121,6 +123,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
+    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
     [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
@@ -185,6 +188,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
+    MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
     NICInfo *nd;
@@ -344,6 +348,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
         serial_hd(4));
 
+    /* SPI */
+    create_unimplemented_device("microchip.pfsoc.spi0",
+        memmap[MICROCHIP_PFSOC_SPI0].base,
+        memmap[MICROCHIP_PFSOC_SPI0].size);
+    create_unimplemented_device("microchip.pfsoc.spi1",
+        memmap[MICROCHIP_PFSOC_SPI1].base,
+        memmap[MICROCHIP_PFSOC_SPI1].size);
+
     /* I2C1 */
     create_unimplemented_device("microchip.pfsoc.i2c1",
         memmap[MICROCHIP_PFSOC_I2C1].base,
@@ -401,6 +413,15 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
+
+    /* QSPI Flash */
+    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
+                           "microchip.pfsoc.qspi_xip",
+                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
+                                qspi_xip_mem);
 }
 
 static void microchip_pfsoc_soc_class_init(ObjectClass *oc, void *data)
-- 
2.29.2


