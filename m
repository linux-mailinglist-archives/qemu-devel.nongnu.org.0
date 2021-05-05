Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C9374BF1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:33:31 +0200 (CEST)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR1G-0004z1-7B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQro-0007JH-LB
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:45 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrm-0000Lu-LX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257022; x=1651793022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33oKkjRKiHqdoKmxYRwb0N+/KhiXMXBJI/b/JHXG0gg=;
 b=NJn088P+GKpVcYErRswy2Oc78NYNfK+zcqaqVzIHatprKfP0U/A7ZzbW
 3+JK/IbUzRdRiuqrJoWemqPtOhDoV6ZnAAZjdLdOctawDOctm/mHkL17H
 NPsDdFEDAxxW99zqDR5D87wguhWG0KA0xnWPMMUq/3aBteA77bEzmw6IQ
 HITRHOmyWci9M2yRyOcQHMQxUCdFLa5xfzZMpMOKeJ3CYFz/M/GRUG3pH
 ZWhmCP0+AsfvmO7H6sJVnD288uKXiJv9nHOvwVcYinkD4Ek4JC17lsNE2
 KDayRPG68khDHY34Rtx2OOE9fpW7H+7WgWAkYYPGWGguZnrSpEOgFzP9Z w==;
IronPort-SDR: irEnJeJjwTHGA0kyyxCQzJK+OWmtSDHrcEqGy8IVXyL4Q81GMXuCgFztWwX17T8gEs6l6nF0tk
 99wm44Ql79h82pCuqFIiwH9AYy5lTiE+6aEEQfCZ+bnbxgP+93RwjRjrk2fgbra5zn/8YXNIK5
 Vpg3GVdWQEmDOjGYuhPxPY8G/kn0i+x2Yoofn0L6DKcGskRDbUGXUNDmUYxfT5/tOjFixnkqIa
 OyhlXcJLUkJ+zA7KuqT++SZ8pHoGL3SRGBgxzPvW9a4g+3SmZmeCBmhvhVt21lcJNNNPCHN8TP
 NJo=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356888"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:41 +0800
IronPort-SDR: 92pl+HvCm234UtbeupNkitxxvL9bDCOBnRYxRS1w0GWgnwbqmJBh0lY78/9GzVJ4qNIfeuoxbl
 WK+iLpRNCB3nMQWbejSZGgfxw8tGglMTlnm2g4CniQzQaJ1ufmTzCQYeEwwhqDlPgtG9d5/IYa
 qgtIRdD4d55ufLPzvJJbQAHKIuowVwVdvfkVgN8A7xWDGFUHOGErVTSAg2D+EYGWM8/U84Ytr6
 iBKR9RCEnt0Yzr57q+4h4Mnh4qRxnjblfcbDKXWtND4MQsJUqAwgzkZIIZDmNgQZMLGMXKKzZo
 4/AfvDvbZvVK+ezymwqfLAKt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:22 -0700
IronPort-SDR: uTq2waVbTyIfMlYOhIYfKUlv3Nf8vQTGE0XZRSSTzukk5GB7f3ej0w4t0ee/nTDU4w3zxEX3g+
 LD5T7ZjAsfGqpusvWRGk7zg1lYKgswMee0EX9gJytuT8C0msO5ghCX0aYZxkBXRwoz8a+hf3gd
 k+aWiiaQ0V2ZWHWshuUhKsrUtWp1FaajrBsesdimxuN9DZmAHs55xBwHbma4fg2KO2YwUQxjXR
 xmEwgT1cZ9OL/5hr8aoxBXbxzoabs7GQXeAhqHHHtNZ58O23Iqu0Drz1PXKE4hnM1s33o9wjKr
 Tek=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 08/42] hw/riscv: Connect Shakti UART to Shakti platform
Date: Thu,  6 May 2021 09:22:38 +1000
Message-Id: <20210505232312.4175486-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-5-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/shakti_c.h | 2 ++
 hw/riscv/shakti_c.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 8ffc2b0213..50a2b79086 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -21,6 +21,7 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
+#include "hw/char/shakti_uart.h"
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
 #define RISCV_SHAKTI_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    ShaktiUartState uart;
     MemoryRegion rom;
 
 } ShaktiCSoCState;
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index c8205d3f22..e207fa83dd 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -125,6 +125,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
         SIFIVE_CLINT_TIMEBASE_FREQ, false);
 
+    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
+                    shakti_c_memmap[SHAKTI_C_UART].base);
+
     /* ROM */
     memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
                            shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
@@ -143,6 +150,7 @@ static void shakti_c_soc_instance_init(Object *obj)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
 
     object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
 
     /*
      * CPU type is fixed and we are not supporting passing from commandline yet.
-- 
2.31.1


