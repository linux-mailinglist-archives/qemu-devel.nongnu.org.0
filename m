Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB259EC54
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 17:22:37 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2dIp-00006V-RA
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 11:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwS-0003Pk-F0
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwQ-0003pt-HY
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:59:27 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:32920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cwN-0003k6-9X; Tue, 27 Aug 2019 10:59:24 -0400
Received: by mail-pl1-x644.google.com with SMTP id go14so11908416plb.0;
 Tue, 27 Aug 2019 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=GMi1ltGCHwQ4dkheExnUKN+OEqrYhZPFEnRLNC1m3ek=;
 b=CZSD28Tea+4MGnsDvC9ZP3hEoXKN9u+jULHodq20js2wClz6BjcUgcnKDAJUIDd5K4
 BFNXaFSxtCFk9A1pEvOPWpPvQA7R59FbWsSIbFTbgqbfb6T61A5rPwoJ+1Ud9hI06nC6
 E1mPjen/YU8czpuS9i6Y183KNzCggf8Xh1GRRZF0txSabV09VrqqfvrZgBxjxAdOBTmM
 zKJt+igwcsa3lWiIvxEISutIgstsN66qnPFElOF8Clt4hzgxWFrWPZC/wmgpEMSoq6++
 s45Y4Bvs37xjOXe9wbzNYpip9G4ia358nsvH2151lPsSSqbBIRESk/foDqGT03laDC0J
 SfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=GMi1ltGCHwQ4dkheExnUKN+OEqrYhZPFEnRLNC1m3ek=;
 b=Btjd6Mtxe8RLm5pFqVRUnOEj48Dwc0akAotM+GJf2X0vuynZ0h8sQxsuVQklOqo/DL
 VpYfWTFGm/UxwUrtN5zVIWbtv5YHlvgkj7ynr9Wnr2iuWRuvnVgjLAHBnHUHA2wyMMi8
 UCm4dgTPIAADR3X8rmv2vAkmRRWtVMvsis92CZad/66teq84kcetinZIN5nznaKuP5yk
 aeOOGr4rBPQGG+eoDsmKG0JJ57qzTdBJksadw55nn8qRWFnSPDRXHW4R3qyulRX5JYXw
 BCNIxNeGa+bRVLBhSPPeSUOHhv7IZAU3YIIS2MEBV6qQe5vJVqctTgOGoUNbeA9uQrsy
 OMUQ==
X-Gm-Message-State: APjAAAUIf5bXqBeNSzX3zLQNoBGRskIIidBFLsuE2afUpNMeT34KpVWt
 /UM1iR8lRaJa4MniU81Ct6M=
X-Google-Smtp-Source: APXvYqyyiVl8ffCo7cTxNPqkTLcAbx1hcBDcaxYie/u/mgsdDx6IDOra3fdSWrfyflgUypEiMyOhIw==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr25117099plq.67.1566917949378; 
 Tue, 27 Aug 2019 07:59:09 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.59.08
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:59:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:30 -0700
Message-Id: <1566917919-25381-22-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v6 21/30] riscv: sifive_u: Add PRCI block to
 the SoC
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

Add PRCI mmio base address and size mappings to sifive_u machine,
and generate the corresponding device tree node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v6: None
Changes in v5:
- create sifive_u_prci block directly in the machine codes, instead
  of calling sifive_u_prci_create()

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 24 +++++++++++++++++++++++-
 include/hw/riscv/sifive_u.h |  3 +++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f048806..da8ee64 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -9,6 +9,7 @@
  * 0) UART
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
+ * 3) PRCI (Power, Reset, Clock, Interrupt)
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -60,6 +61,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
+    [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
@@ -77,7 +79,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
-    uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
     uint32_t hfclk_phandle, rtcclk_phandle;
 
@@ -188,6 +190,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    prci_phandle = phandle++;
+    nodename = g_strdup_printf("/soc/clock-controller@%lx",
+        (long)memmap[SIFIVE_U_PRCI].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", prci_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        hfclk_phandle, rtcclk_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_PRCI].base,
+        0x0, memmap[SIFIVE_U_PRCI].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "sifive,fu540-c000-prci");
+    g_free(nodename);
+
     plic_phandle = phandle++;
     cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
@@ -402,6 +419,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", SIFIVE_U_CPU);
 
+    sysbus_init_child_obj(obj, "prci", &s->prci, sizeof(s->prci),
+                          TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -475,6 +494,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
 
+    object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
+
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
     }
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index debbf28..2a023be 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -21,6 +21,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "hw/riscv/sifive_cpu.h"
+#include "hw/riscv/sifive_u_prci.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -36,6 +37,7 @@ typedef struct SiFiveUSoCState {
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
+    SiFiveUPRCIState prci;
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
@@ -54,6 +56,7 @@ enum {
     SIFIVE_U_MROM,
     SIFIVE_U_CLINT,
     SIFIVE_U_PLIC,
+    SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
     SIFIVE_U_DRAM,
-- 
2.7.4


