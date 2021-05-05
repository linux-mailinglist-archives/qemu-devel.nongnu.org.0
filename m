Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FA374C15
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:46:38 +0200 (CEST)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRDx-0004s2-Bo
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsG-0007kh-V1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsC-0000Xa-6j
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257048; x=1651793048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCgwUukf0mol48E+b6OjDya1sHpuv6iWQ9PgPgArBlM=;
 b=NwGWEcYjhWWmbXK25L+3YnP7FP1pIm3QqO606rthYo0VVoD7dzzpzXhg
 jiBubc298EmC/CpQKK6FL/JKw7EXDcZVD5VHADrU/SnHYD/mpEQP9/JAG
 aH4dKBTL5RSwHBh+0cNSxfJcS5c8myuSkZlic7dJiYf1Wl7SpAoUIMQ5E
 aUUsJyDpCGHAz4H4/IrBGxlfLt+fv5nX4IfrBiW2NQZeWkJ+qOUXvtox+
 alWAh5gKuf1jVtNEY6z8mhcV2QbSSUi1knT5FlFVHqQr8eLxsPF/+yFue
 zBqz5o88mwYQ6uHW2h/gyYYCOFtnICEh7WKuqBNs79ohLjVAumKRzvIjB Q==;
IronPort-SDR: ZxPb7j/twg09di4SuBULuWQb7ATbD9VQ1qC6hjgfvsJDRvbZBmziPUgWyvMOKgAsLzRUa3Zuju
 dP/1nFTg2YdVXvI+qM/DFE4siubfiAg8iKV3CPO6dDCZTlGDDpNP+kNbSRUjrDOlj5+XO13YIU
 crtZdZd7h8Mu5xiiIggIivE2NIiYKzkAngu/ln3jE4oZWMpCYogeIPCkH4Zhg1AyHhZv1FjzWe
 Yt/YUJf/M+mQ1pKllHgemyI731InIbwAk5EMYJjsMHmCY8ghkfDHAkLF9S4Gbgsm9A9gOjN3pu
 HtQ=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585909"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:07 +0800
IronPort-SDR: JmpGMn/QowWMG80vS5h+3lQchmMDQnft9ACQODRh2E91oLIUzUE/cNIFdHWfpJAdnxKi0XfpzC
 iuOKqEv1QUn6z58Gu3jueOkI7cvvYHoBYQzVUPAOeKSHDH7wKfQHN9QtrfyHqSTGxV1w/3wadn
 73rKYSzx5ugGOjy2ZWIki3wU9RZDw3dLsrGConDMYaMtzJzLZtiqN5lu24baE/qxDl9Wx/sfO9
 q8ZI99V3dhHanOTvHObhz3cPg3NUUZwNZwrAuLhth4C4GOt7Ocd0W4ZSKWfZfYz1UbANnCklev
 LV/u2+8NVBDXnURMEcrydXVO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:47 -0700
IronPort-SDR: gZgJIfhlLWOZWKQGkQulG9HC25/Yw7jq/zXzlaSEmRrCwq4ugipUW8A/vVmJPQw7u09V3bsqZd
 hlWqgrLV44oJdhl6Q70/8w/nh4+vCBXINjwOVFvZR2fyQwjWhbRgCnxSTy/kGpwPsCGlHo7b7I
 7l/MzXoysmyy2AvWAYoGK7XJu6PAl6EUSuyi9dTDyRJw+jFroTCXiClyeqDIZNWk+QE3yWtW5c
 PFF8I5OZ/+am6tzt7tIFJ0bYIKBhKHG3qKYQdow0+I7/ZhStWwMwnHuQzIufF25n4ORotQlS0Q
 HiE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 15/42] hw/opentitan: Update the interrupt layout
Date: Thu,  6 May 2021 09:22:45 +1000
Message-Id: <20210505232312.4175486-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the OpenTitan interrupt layout to match the latest OpenTitan
bitstreams. This involves changing the Ibex PLIC memory layout and the
UART interrupts.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h | 16 ++++++++--------
 hw/intc/ibex_plic.c          | 20 ++++++++++----------
 hw/riscv/opentitan.c         |  8 ++++----
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a5ea3a5e4e..aab9bc9245 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -82,14 +82,14 @@ enum {
 };
 
 enum {
-    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
-    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
-    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
-    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
-    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
-    IBEX_UART_TX_EMPTY_IRQ = 0x23,
-    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
-    IBEX_UART_TX_WATERMARK_IRQ = 0x21,
+    IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
+    IBEX_UART0_RX_TIMEOUT_IRQ = 7,
+    IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
+    IBEX_UART0_RX_FRAME_ERR_IRQ = 5,
+    IBEX_UART0_RX_OVERFLOW_IRQ = 4,
+    IBEX_UART0_TX_EMPTY_IRQ = 3,
+    IBEX_UART0_RX_WATERMARK_IRQ = 2,
+    IBEX_UART0_TX_WATERMARK_IRQ = 1,
 };
 
 #endif
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index c1b72fcab0..edf76e4f61 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -225,23 +225,23 @@ static void ibex_plic_irq_request(void *opaque, int irq, int level)
 
 static Property ibex_plic_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", IbexPlicState, num_cpus, 1),
-    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 80),
+    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 176),
 
     DEFINE_PROP_UINT32("pending-base", IbexPlicState, pending_base, 0),
-    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 3),
+    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 6),
 
-    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x0c),
-    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 3),
+    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x18),
+    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 6),
 
-    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x18),
-    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 80),
+    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x30),
+    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 177),
 
-    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x200),
-    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 3),
+    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x300),
+    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 6),
 
-    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x20c),
+    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x318),
 
-    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x210),
+    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x31c),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index dc9dea117e..557d73726b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -148,16 +148,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart), 0, memmap[IBEX_DEV_UART].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_WATERMARK_IRQ));
+                       IBEX_UART0_TX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        1, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_WATERMARK_IRQ));
+                       IBEX_UART0_RX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        2, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_EMPTY_IRQ));
+                       IBEX_UART0_TX_EMPTY_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        3, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_OVERFLOW_IRQ));
+                       IBEX_UART0_RX_OVERFLOW_IRQ));
 
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
-- 
2.31.1


