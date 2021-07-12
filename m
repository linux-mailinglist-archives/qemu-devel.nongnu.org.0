Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B53C669C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:01:10 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34vF-0001dD-AB
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oO-0005Ul-DU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:04 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oL-0006rU-Ix
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130442; x=1657666442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/ClrNoVNTB6Ni1MIH2PRYQ8QXs+hHuddAsSsBZMUC8=;
 b=IOmsVN7rXPUzRhjot+qcMvdr/2pZzkqOrgICc6uFVfFdv4q9TNtt1NhA
 HWaPUX0dBoj0FlBYKoS/H/7b+vbnZ6WUg71rBYBHYt1JOEZbMKCP52VYE
 CnoixNb4MfRy11fW/HJ/DHHHbYH8nr1irQmt0mHDz89HBtaXPYSmsxfFF
 DWIqazx2XZHERZrsvw3ULhsBC72X7mbVrxsnl3nJrwuZxWKEONE1N4nHH
 5yb1uXGz4ONgOWYswxxVVrXs3WrDY5or+gNlqEjXG/GyzQTMXsa7Qi95t
 TtC2wRu1IL4X48dD2DhfZPuuTUfbBLBfhJfXNdBRr1iKFO9V14ZVRxP0s w==;
IronPort-SDR: m2tHA/jJJMQjUWxPpuj6aWY6cuj9hfFwzQRPoF1NgWc2Qw4yXuOWp101hHKevEj21vJhaOaLzc
 O/PLvhVrhY4LkIC2ym9v/8WAg4tEjAvtjvZe/HEiyQ6GJG8qURoEIVqdS8Qv3wuX1Vxd/R0cF/
 845cuShNNHGbZ9DP2+rtZcavHrn4f8v80fXCuEiJYpSt5NY3wWy6Ms1fP1/dY6CzfL5Gqpci+o
 HIPJIgYMYT1Ul9dnbooGAIIFDCnnm2GUDT6yqpdUlHoRvq3kOXpBbBWNbILBfV92D33J8S2S8g
 ljY=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973311"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:53 +0800
IronPort-SDR: m+zk5QR2QfSm7wbv+loSJSseOVMpEL/Y8wfQ7xvcgoNprlFxgptOJVMtsyfsOJr3Zqg4fJcSXi
 F8D41IlQU3HSHpGPn4v/VEgkQ46TnDAdln9QnnKWUe98UGLp9okx+n3bUkRG0XPyFcUusJlIOO
 Xl/KQonuhohgbQNM+My3BzC0/H5hw/lM/Xp/7BZSktIGFFcjKY3g68iczwHuxnrEVvZw8plsIN
 xvu6OWjhz7eS1BmFpM/1MY2Ix/cMDmEW5+hbnzpy6DGt3XADhc8QrV/0stgIGyOIn+lm9rApWF
 arP7TDiuB9wacz3RIloTW0Ik
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:59 -0700
IronPort-SDR: cdh3qVTW8ZFbUWiAN3/FDdlZMfZhgIEG+Mf7OpBGrUNg1RxRVSE5gpdSq3oV//Zs1V6heMgGeR
 f+gSL6/v913OTMrhyGySuBiPWpwMPi62OocirMZKqC+YwMB2vpH6kTH1inItopBHbIBorIEUTF
 KLLM9FrWn+Tv2oPR96YGP1AM4ryt7jiGJUf+phe6lySoi2ARgFiUMq70htpnyOvpJSSE2khHah
 i8J0bgrZyiFuaWvwi8p9tYc1qZ5ZONhHjxrQRkuKeohiyn8Va/NOztVgJMt1C6UoQGsG0YT495
 uz8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 11/11] hw/riscv: opentitan: Add the flash alias
Date: Mon, 12 Jul 2021 15:53:48 -0700
Message-Id: <20210712225348.213819-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenTitan has an alias of flash avaliable which is called virtual flash.
Add support for that in the QEMU model.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: c9cfbd2dd840fd0076877b8ea4d6dcfce60db5e9.1625801868.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h | 2 ++
 hw/riscv/opentitan.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a488f5e8ec..9f93bebdac 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -40,6 +40,7 @@ struct LowRISCIbexSoCState {
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
+    MemoryRegion flash_alias;
 };
 
 typedef struct OpenTitanState {
@@ -54,6 +55,7 @@ enum {
     IBEX_DEV_ROM,
     IBEX_DEV_RAM,
     IBEX_DEV_FLASH,
+    IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
     IBEX_DEV_GPIO,
     IBEX_DEV_SPI,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 933c211b11..36a41c8b5b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -59,6 +59,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
     [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
+    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -134,8 +135,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Flash memory */
     memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
                            memmap[IBEX_DEV_FLASH].size, &error_fatal);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "riscv.lowrisc.ibex.flash_virtual", &s->flash_mem, 0,
+                             memmap[IBEX_DEV_FLASH_VIRTUAL].size);
     memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH].base,
                                 &s->flash_mem);
+    memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH_VIRTUAL].base,
+                                &s->flash_alias);
 
     /* PLIC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
-- 
2.31.1


