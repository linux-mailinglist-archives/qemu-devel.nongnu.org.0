Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D93FF7D7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:29:41 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLw9M-0002Ns-2W
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5d-0005aS-Pq
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:25:49 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5b-00059g-2W
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625147; x=1662161147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rShATVOyZt9SnfwqKRn0y8UZ0rHTTM6iAVUUXimZzFU=;
 b=JwEm3OE4HFv0OgClRqZTibBWESV7/b9Bx4gV5rhcT2vc0cx65KzK2H/X
 jXGrOhDY5eRmJTxkUf1fnYTUyy6R0puvh0itclv9UaTfvTF4X69IatnZp
 Db/ZVYVX4jbiG/hNZKqR79gi46eKCRtG9NCY8VKe90CTehZ5cDiRvwqry
 Tiy7HrIcMORwBRCN5AckYRe98mKA1dDwDDrrvwAwyRixYS+DCd0yJc9aL
 H4gKvWAWcSnVdrT5uEA4K6Qf+TM2qo3yuNamhw+BYh+nCA8YuHTOdNj6m
 2xi/2wGVtz8LOP36KiqKgFzkBZBgh2jvrEH6kv5B8yPHra7MkpO+j8m/N w==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="179628325"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:25:46 +0800
IronPort-SDR: iBK602wISFvcMrq+KMQh9bhki49PBJ3Kqc7OvWufAgYODoBvax7iK5BAKzAhU1FU6+oyDavLDl
 9yKjIAWjg7Oqy1PdRYRPE1b/X5AtkjARAG17+MSjuIm13sBiWaDducMpI0knpKLamMQ9lBzD46
 XEVMYJwO3SNSjBwz48kSM4J6DjL6OJ5IUfVSvwubamx5VtXWyl+W0WeD/TL4yTVt1MVcEMLCni
 dKjCs2rug/DrLNalCg2kN0MzwRLSBB0wJP3rX1WIxYlzLZyD99WjH4OzAmgReDF2LloJZvMTiI
 3DvjXe3NXJseYWC7pT13oOWI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:02:30 -0700
IronPort-SDR: EtjINgYXSpWsshjUuQmP0pKZ2fiI8EQtHenMKDl7ixlP20d5WLyi1/QoSvWtj4dO8BQHWCtMH5
 D1EYmQGn2lygLoDVcb88Hm4soNbV8SAB444JJqBS1cXGO2YTdbgH5PtgZFVCDqzYP9ZNtnXQRz
 OVbMSij+dW4dti/Ot2tk5lzbRys+G5LbOq8oYZlkfxtAMAVcABaoZmgunxnnrHK03u/PQJOABq
 AqYkba2rxtYtQcWOijbNUxfQZba21hWYg5ohnXfwN2Lv0yzKuD+fIDs/omWFZ1fdguJfQVm5nC
 DAs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:25:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xqs3r5yz1RvlT
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 16:25:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630625144; x=1633217145; bh=rShATVOyZt9SnfwqKR
 n0y8UZ0rHTTM6iAVUUXimZzFU=; b=fqKXGeALMC++GrKEV6SNH5k1PcBq8wzgSK
 qe52J4hLHa+lYYMpB032LuhnPaxOYakUAvQdtrrHJuYqcLLxcXmq0XA1iZaWlG/+
 eeVXowb/y547ohCQU7j3LHt6+YQRa5ImJEdyvhihva+iLMBtTGNJfPcv15sktJCb
 QzkWC52MJEEUnKkEjVYlkk9u184wat3TibR0fT16kAQ9Rl4UsxgeLD8NLS+ZPDKg
 bHmhjlXsUL6vjKqISuoVzB2rDZo9po2uqJ+f5tiO2pCiH22UeYkg/ikmB9mFrveR
 v3ot6n6Tq8e3dmibAPKkESStAXhe0BjY9kfJaaQnFBFQnO8JPaMQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 40jvczu_02HS for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 16:25:44 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xqm6R1Gz1RvlP;
 Thu,  2 Sep 2021 16:25:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/2] sifive_u: Connect the SiFive PWM device
Date: Fri,  3 Sep 2021 09:25:34 +1000
Message-Id: <da274fb1833ecf9ea3a0dc343439aa4d4b3c4d76.1630625094.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630625094.git.alistair.francis@wdc.com>
References: <cover.1630625094.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Connect the SiFive PWM device and expose it via the device tree.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h | 14 +++++++++-
 hw/riscv/sifive_u.c         | 55 ++++++++++++++++++++++++++++++++++++-
 hw/timer/sifive_pwm.c       |  1 +
 hw/riscv/Kconfig            |  1 +
 4 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2656b39808..0d010c7309 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -27,6 +27,7 @@
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
 #include "hw/ssi/sifive_spi.h"
+#include "hw/timer/sifive_pwm.h"
=20
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -49,6 +50,7 @@ typedef struct SiFiveUSoCState {
     SiFiveSPIState spi0;
     SiFiveSPIState spi2;
     CadenceGEMState gem;
+    SiFiveUPwmState pwm[2];
=20
     uint32_t serial;
     char *cpu_type;
@@ -92,7 +94,9 @@ enum {
     SIFIVE_U_DEV_FLASH0,
     SIFIVE_U_DEV_DRAM,
     SIFIVE_U_DEV_GEM,
-    SIFIVE_U_DEV_GEM_MGMT
+    SIFIVE_U_DEV_GEM_MGMT,
+    SIFIVE_U_DEV_PWM0,
+    SIFIVE_U_DEV_PWM1
 };
=20
 enum {
@@ -126,6 +130,14 @@ enum {
     SIFIVE_U_PDMA_IRQ5 =3D 28,
     SIFIVE_U_PDMA_IRQ6 =3D 29,
     SIFIVE_U_PDMA_IRQ7 =3D 30,
+    SIFIVE_U_DEV_PWM0_0 =3D 42,
+    SIFIVE_U_DEV_PWM0_1 =3D 43,
+    SIFIVE_U_DEV_PWM0_2 =3D 44,
+    SIFIVE_U_DEV_PWM0_3 =3D 45,
+    SIFIVE_U_DEV_PWM1_0 =3D 46,
+    SIFIVE_U_DEV_PWM1_1 =3D 47,
+    SIFIVE_U_DEV_PWM1_2 =3D 48,
+    SIFIVE_U_DEV_PWM1_3 =3D 49,
     SIFIVE_U_QSPI0_IRQ =3D 51,
     SIFIVE_U_GEM_IRQ =3D 53
 };
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6cc1a62b0f..ed2e75df36 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -17,6 +17,7 @@
  * 7) DMA (Direct Memory Access Controller)
  * 8) SPI0 connected to an SPI flash
  * 9) SPI2 connected to an SD card
+ * 10) PWM0 and PWM1
  *
  * This board currently generates devicetree dynamically that indicates =
at least
  * two harts and up to five harts.
@@ -75,6 +76,8 @@ static const MemMapEntry sifive_u_memmap[] =3D {
     [SIFIVE_U_DEV_PRCI] =3D     { 0x10000000,     0x1000 },
     [SIFIVE_U_DEV_UART0] =3D    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =3D    { 0x10011000,     0x1000 },
+    [SIFIVE_U_DEV_PWM0] =3D     { 0x10020000,     0x1000 },
+    [SIFIVE_U_DEV_PWM1] =3D     { 0x10021000,     0x1000 },
     [SIFIVE_U_DEV_QSPI0] =3D    { 0x10040000,     0x1000 },
     [SIFIVE_U_DEV_QSPI2] =3D    { 0x10050000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =3D     { 0x10060000,     0x1000 },
@@ -441,6 +444,38 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
=20
+    nodename =3D g_strdup_printf("/soc/pwm@%lx",
+        (long)memmap[SIFIVE_U_DEV_PWM0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
+        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandl=
e);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
+                           SIFIVE_U_DEV_PWM0_0, SIFIVE_U_DEV_PWM0_1,
+                           SIFIVE_U_DEV_PWM0_2, SIFIVE_U_DEV_PWM0_3);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+                           prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
+    g_free(nodename);
+
+    nodename =3D g_strdup_printf("/soc/pwm@%lx",
+        (long)memmap[SIFIVE_U_DEV_PWM1].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_PWM1].base,
+        0x0, memmap[SIFIVE_U_DEV_PWM1].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandl=
e);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
+                           SIFIVE_U_DEV_PWM1_0, SIFIVE_U_DEV_PWM1_1,
+                           SIFIVE_U_DEV_PWM1_2, SIFIVE_U_DEV_PWM1_3);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+                           prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
+    g_free(nodename);
+
     nodename =3D g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_DEV_UART1].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -765,6 +800,8 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
     object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
+    object_initialize_child(obj, "pwm0", &s->pwm[0], TYPE_SIFIVE_PWM);
+    object_initialize_child(obj, "pwm1", &s->pwm[1], TYPE_SIFIVE_PWM);
 }
=20
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -777,7 +814,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
-    int i;
+    int i, j;
     NICInfo *nd =3D &nd_table[0];
=20
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus -=
 1);
@@ -904,6 +941,22 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
rror **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_GEM_IR=
Q));
=20
+    /* PWM */
+    for (i =3D 0; i < 2; i++) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->pwm[i]), 0,
+                                memmap[SIFIVE_U_DEV_PWM0].base + (0x1000=
 * i));
+
+        /* Connect PWM interrupts to the PLIC */
+        for (j =3D 0; j < SIFIVE_PWM_IRQS; j++) {
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm[i]), j,
+                               qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_U_DEV_PWM0_0 + (i * 4) + =
j));
+        }
+    }
+
     create_unimplemented_device("riscv.sifive.u.gem-mgmt",
         memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT=
].size);
=20
diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
index 61a97f9b46..3b533d4484 100644
--- a/hw/timer/sifive_pwm.c
+++ b/hw/timer/sifive_pwm.c
@@ -25,6 +25,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "trace.h"
 #include "hw/irq.h"
 #include "hw/timer/sifive_pwm.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ff75add6f3..d56c339ef6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -69,6 +69,7 @@ config SIFIVE_U
     select SIFIVE_UART
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
+    select SIFIVE_PWM
     select SSI_M25P80
     select SSI_SD
     select UNIMP
--=20
2.31.1


