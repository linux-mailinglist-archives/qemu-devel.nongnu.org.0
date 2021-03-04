Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2C32D5D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:04:07 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpWI-0007uj-5U
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHe-0002PJ-VB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:58 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHd-0007sK-8d
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869337; x=1646405337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ws7/YnKOyQ3gfRMjK/cpAOID7eR8r2Z1YDvYuCmlKfc=;
 b=UbRYG0PEtobrxnUMoJJSOs6cl1/42oR7RSGCI1jMYVYjw+d0jfT9ynx2
 DdwtrkisdUNegtVf7cbiilD8FEPObpYbpo8dHUTN9aBF1bNuN0HLHKvQH
 mopsjTWv12CNvo6PXlfRAtLHpuJ//jDvzkT1eHpOc0bkcl85ulk+6wX5+
 Wyid5wPtgrJUQlWH3Az+8mCHmiMBth3ilqpeMCUZe0/GRhKRGAMptPPlw
 xqvBfUw2YLPIXDOyT2TFKtTX+lEXgSMUAaVippI8nSXK6lboaoBtGmKGZ
 K8lF+b7muMt+A9kXB3gOSBWJSpp+NASWTmDr2jmgZK87HkWFn3UZ7IGVU w==;
IronPort-SDR: FKbjEa7BXKdT2vnKC0uCK6kgnEeMXfGVQWTuwnOKqp15YBLze6asrapl5Y6r1fSigo/0OznGv1
 WUsvHfJfEFS37+/JI6/vLdArIEB65wD/74rlgXbCFvl6b/1SM/XjeaF/bHqyCuBqex38Kx6vDv
 Lgrte638Pla1f+7xItUIDqld0h9E4q+jaKOa83RBEEg59CSJvkVskKOm2HgFvbvas434TqYu2R
 MUXDAcjpXUFYoxz1D3YVjAFqcIi5DftyUG8ciCtxuKBYuOqCj31iMhC4nDtMhNC5ugBPWa7CXD
 KRM=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984433"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:26 +0800
IronPort-SDR: W25N4xG/fYT2QtHewt7A5TFWAgkPvwFqvogYkipmlZnVd8R63+cRfgbcU38+asfOZWPUxquQ8x
 6Jb4nLInUTzfYRnEetncSSqhA0aNMNYrN9wi6NoEfiEaC9VTZ6jsD5bnoPJFhj+VdvNm9S1AgF
 AO2m0lfxog47nJyML2RP38haOC8B24PGZbu6ORhnOUnL2YJ/an/G4IbQniO/EEk56rExkzhmS8
 YDLxDviwFgBsqmjGbNN0X30lLKDu4zLaeMY3XStMLObD2KANtq0CQmXIz+b2kJKRUTxZ0k0OTL
 rGDBvMztzkgDsh0Riz9umvG5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:39 -0800
IronPort-SDR: ilEIZ4/DD9UdUFqbL1Ibu/vdy6F1rESX/3BEGswAsBAPy8oAsCnFjAjyCpcSIQAQU0IoLanIYk
 QJSC8wNQ/X9s538+a0AwIjfc2GZijsZ2xXQ5ioUyIUT1EiaPPJY+Cp8TMtu6ZcCZCrp5UESvYx
 W+nGZVx5OTLxY6EvZxYNK7pybyoRjlKq35SwxPl2hhBpBdN7Kc4w6Flx9MgqvNG10XlXV/shTi
 3DXNeiQjH5JgsQZVd4A8dDRnIzGpViZpmKqkcmL1JtkdJYjyB8jP8M4G9xP6niYgZR66EaHKY+
 Gto=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 17/19] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
Date: Thu,  4 Mar 2021 09:46:49 -0500
Message-Id: <20210304144651.310037-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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

`link_up` is never used in gpex_pcie_init(). Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210220144807.819-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cfd52bc59b..1d05bb3ef9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -449,7 +449,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic, bool link_up)
+                                          DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -669,12 +669,12 @@ static void virt_machine_init(MachineState *machine)
     }
 
     gpex_pcie_init(system_memory,
-                         memmap[VIRT_PCIE_ECAM].base,
-                         memmap[VIRT_PCIE_ECAM].size,
-                         memmap[VIRT_PCIE_MMIO].base,
-                         memmap[VIRT_PCIE_MMIO].size,
-                         memmap[VIRT_PCIE_PIO].base,
-                         DEVICE(pcie_plic), true);
+                   memmap[VIRT_PCIE_ECAM].base,
+                   memmap[VIRT_PCIE_ECAM].size,
+                   memmap[VIRT_PCIE_MMIO].base,
+                   memmap[VIRT_PCIE_MMIO].size,
+                   memmap[VIRT_PCIE_PIO].base,
+                   DEVICE(pcie_plic));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
-- 
2.30.1


