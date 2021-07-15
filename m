Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF23C999A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:26:13 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vl6-0007Bi-8k
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcK-00061M-8N
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:08 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcI-0003aa-45
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333426; x=1657869426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/ClrNoVNTB6Ni1MIH2PRYQ8QXs+hHuddAsSsBZMUC8=;
 b=VZKhMe/LebdQLxWx7XyNMt7lXDJBADIWMeO/EKElBdHPWEeGhlEGE7ma
 KS82+UO2wt9pzkaQuFeKURhHla5En6e33/96uxu0WRZG3IyU7xeh2HVX6
 JndLLDhXAtokK0//quiK8czqbWws4G93Oe5jzDd/qWzgax8kq1jmuBhK9
 jDfhwVm75nACqt5Chvk9dplS/GRGc7zaC/w3RU6xWucaNryVx2FlK6rWi
 nUsaUJ+48ENawzVp0YGYHEvQ2wofEE1zoddEIjwG/9jDf0SzLGcJYea1M
 Ec9NTOo8JNM2/jVKZT58YICNkoVNlXdYmzO35wGJA6a9PKmjMmZmpu+Yk A==;
IronPort-SDR: j/1IhWNL7x5PLKIlmEXvJrbxF1LvtkTq0RQisSmDjdi5mErB3HoFHtivlCKh9I1YsCSSh76mdN
 JhGv3rWkwZj7+mUO2B9nEK0bKUXtUeNCfcRMfc5b5K46aYDZij6D/vJ7xr1XnEcMtER90jr5+A
 I9LrRQrkI6t8kTA8gZLxR4Y2rHfH7wvfJV/WXkFUvj9qLEFxjAKMUdAMwH+KTeH8OjZHt7ns6+
 +ebsDv9uaGIMyAgO6KaosqDLOfBvt0rP1BMA2X9UZE6rOd3cS9rQ/930sxj49c/Ne/R6D1i4Pb
 uiY=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212310"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: iyXw9OEgwdS+ZB4x6ltQA6eBK0idLDoN1GbsxogxB1MYRYG0KgoFU8z2CT3+tWIa/KDFaLF+4w
 4Qscx4lOi0ji6gR1ci7fZCuatHjPAjVlIn86BNG1sssikSj1poVzikofaWjMeOtLwlRGjYPkIW
 S2o+SIgiBW5SWJDpsJLMimVuB0+NS9y6oOftAkuXudnDLJgCEEt57cNG1xkosFdlw7JVBoFJnG
 ypAO74BnWkqD2Y63ZBUW2p13ThlZ2WK9bkH4A6u/0Mu+d/tj3HMTe7jY9AjfyibntKmjc0hLZR
 3NNC3oSq4typPerwh7l0p8at
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: ySomnvEeJZ4ZjTyLSzIIvMFdZing+h0DOLNFDlus0Q06GpLHiAxAzv7eSNeh/JLkY3AsmT3pVO
 +VKkwjdIBrd/t5GKxO5sEYRIfR2ogoAfkEB0NYOgkES4eBGq6Hmdnbe8VXAMquQOpL5BJriEbf
 SFIItMJYcG37F7M+6QNgh/OfI+HckbybPY5TULN6WXz41qSgkmgtZeEubejuuJGp04gTKssl+n
 W3ClvMRNxn8AVszR5WFzg60WhyU+DDQJrRc5Kew7xR7Xqf/upu83ojv6L7U15I9AWieT6wR+Sq
 2O4=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 11/12] hw/riscv: opentitan: Add the flash alias
Date: Thu, 15 Jul 2021 00:16:39 -0700
Message-Id: <20210715071640.232070-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
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


