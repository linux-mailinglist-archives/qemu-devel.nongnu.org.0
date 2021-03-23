Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E734556E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:17:54 +0100 (CET)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWcD-0002vM-3l
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWL0-0003Bt-LD
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:06 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKy-0006tH-Mg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464804; x=1648000804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mXSaw2aL0sxPF+xu4Mg8aZKNjLty8M+Q4NARUvJlxh8=;
 b=Xby+/rR7AYQzdS85OoQbIOgJ8uRJO3JBFjw2uLuEQRB3KrQHm9w47UjJ
 +yIpjE7YNqQVbfo40sXppSYbm7PJn+M8OA5xAaRyWg7iJwrUOLvQArZ7G
 i5LAY6tgQ9yqMBwsogAlXwALxRmD3GVBlW9rN1JdXE0TKUgfWdVMxFjok
 V2UGS2TskIQL5Pxein0kofn9iATB25k1m+WwdKmsh+t5tuiKhEBKOGzYe
 qKrrEAN0SH8cb+tkLOP2ERUzNazCrHELyQhbqWAgPd33IkLUQT9/z+lOf
 ePPgvqIXO+OtA1fQ4HD0tNSgv1qdYlrOb9m3ZXcnNpzlnS3X1m2KSM8dT A==;
IronPort-SDR: A/5eb2w/Vh6ocFZ8cHY2cAa3UTYrGogSKFx2Kk79e5BVB2rxjsRqxoWgdWItdl7Ay6Sicbxcy2
 ucj//pRNIdTRPO1mUr1g9Z+TYQN1KuGc1pXTibYP0qOt9bmR6QVb/PhQX8Ftem1zczxj1UUqLm
 bPA1wLpttRMwlPq4bx5upuk7HLEqHFnsu9Do/cuoYNLyn5PBY4gj16uvGGFrSayhLFw7zPHNCL
 0PfYN4ySIKosqnfKTSJHPbn+lZbAYr9Ns/BrESj+TMAkhUZbKuFGcp+X8uTy2xkOPErzCscZHf
 G0k=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707648"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:41 +0800
IronPort-SDR: Z44toVkR9c0qHw9/Nbl+6KhCiWjOWefkg6wc80z2ZG7zWBGHuOAfytYXXaoBMw3Epgcr65IIWb
 MVaRStOAatQo/2IKF4SBeX8xjNbUfcxOiZv6etnljl6DevNKYaU254odRIW4v+o9KIlU15G4Jl
 L11tmqD3YEGtCCMTS/TtmP3flB2Q3/Z9aEPlumFEoUURbb+A5okj4z08mLPMdvj2OW5Dqch60v
 qQkkYy7TRXhhwHLCUVwoUr5z1FYSAAlsp+rRXnQSVGpJA9MPhzvZQola02Gpo8ZgFdVm2L/+4b
 rUtI0kqICY7HBrAY30/3CBoL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:49 -0700
IronPort-SDR: uU8EqSWiT5pSXY4wKIgdIaTHXhsFORyN5XL2vapNpwvE5Fruqd/pGiifPLuksUmeUrA5Snxn8h
 bvsbiBEWGBnipC7yIv8dA07u++Gadr3OdNVDCUdG1Y12zBl9YjBWC4JG1hT/aTKHeZLT+bpP/9
 S0bHTVDAn8p2JRfMucKffID+VrFUNb7279+IcV2WubTC49+6jULeq0zwb9hwxu8R+z0wP0VzBT
 qoJv345Jucc5hcGkn+B34KVBBBgzrRjDUm/wiUFdh2DR9rpgCK2p+wxKvLbOknt5xX+ggx4Q+0
 EXY=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 14/16] hw/riscv: microchip_pfsoc: Map EMMC/SD mux register
Date: Mon, 22 Mar 2021 21:57:54 -0400
Message-Id: <20210323015756.3168650-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Since HSS commit c20a89f8dcac, the Icicle Kit reference design has
been updated to use a register mapped at 0x4f000000 instead of a
GPIO to control whether eMMC or SD card is to be used. With this
support the same HSS image can be used for both eMMC and SD card
boot flow, while previously two different board configurations were
used. This is undocumented but one can take a look at the HSS code
HSS_MMCInit() in services/mmc/mmc_api.c.

With this commit, HSS image built from 2020.12 release boots again.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210322075248.136255-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h | 1 +
 hw/riscv/microchip_pfsoc.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index d0c666aae0..d30916f45d 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -109,6 +109,7 @@ enum {
     MICROCHIP_PFSOC_ENVM_DATA,
     MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
+    MICROCHIP_PFSOC_EMMC_SD_MUX,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
     MICROCHIP_PFSOC_DRAM_HI,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 266f1c3342..c4146b7a6b 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -122,6 +122,7 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
     [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
+    [MICROCHIP_PFSOC_EMMC_SD_MUX] =     { 0x4f000000,        0x4 },
     [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
@@ -411,6 +412,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
 
+    /* eMMC/SD mux */
+    create_unimplemented_device("microchip.pfsoc.emmc_sd_mux",
+        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].base,
+        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].size);
+
     /* QSPI Flash */
     memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
                            "microchip.pfsoc.qspi_xip",
-- 
2.30.1


