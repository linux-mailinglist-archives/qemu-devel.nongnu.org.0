Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C5490B4F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:22:16 +0100 (CET)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tpn-0004iB-2s
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:22:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SDL-0006en-Kt
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:38:28 -0500
Received: from [2607:f8b0:4864:20::232] (port=45622
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SDJ-0002a4-7F
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:38:27 -0500
Received: by mail-oi1-x232.google.com with SMTP id t9so23349316oie.12
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/kCm7OfSfvFhunsvzlwA7HQ30gJuUNMAar3JtatnQ4=;
 b=29Km1xYwERmOKWS1DkBefru9od1O7Dz0ZeCum4asQDasHqk1MloT4KffY6NYzyjw+A
 UK6X2Sk+bq8ztfR97+TRlkTZ67SIQxGt3qP53Etb6MySR1jJT9hPvrHue1rlrydqJPD7
 Yi4G7jqKaImeuA+pfD9zfEovpxfXdseO5RIxFsUxxu3dtn6WI4i+JuVTy4EHJwEmcUOw
 SZwUwWlFdwCEPGEKLW+X+9SuQksSWRZQQW6OJ+OyVIA9Uryj9vmzLQspyFR1ay5T53J8
 xNg5MxQ71YdJYxjPcuY4eSZjk804lGCa95G35u5zXJHPN4RxgZ8cO47lRQTnHc+CQBOD
 YDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/kCm7OfSfvFhunsvzlwA7HQ30gJuUNMAar3JtatnQ4=;
 b=fU3vQHE8hhaUqDkuntOFlc6QLjgTH8MjzNcfgTy8EcdtyrmHV860L5Yxb/IJWVSWAP
 zFL9p0SN6RpPlEvPYcuPqe8lj+a5i19biX6EnaIzN+tWH4RqkYMgqu2wJPm3YzQWrw9P
 yuGwOtB5VkDHRJCMjb0qaieCXYAPXMFbUrXsPn5L+vi8t6C9QzX3XLMTaRsYZm+9NJ3U
 fy7PL6PWaTNm0wJxUbQ697WxhVNToimXi5LslFlqf1znDLvYh0u0Wib9hxWJSgZv3Inl
 r6MwvccOEeaGdOwlAi5Ov5GL/6deFqFNa7USVVYfR2UBSpRFGQ1WQgg8C2X4X8vOkoBK
 uwuA==
X-Gm-Message-State: AOAM533hjk8VLs+sQmJr3uQOokr39y1u6pilqTuCIr8TW6dpQ7egMq6k
 fmwBYPWUcwStKlZ1bb6/Qd67csqMLezTLw==
X-Google-Smtp-Source: ABdhPJwO4d/EUGW7+M70VJT1U07EEdpJlbc7wQKQDvU6UYSceEyZZXCn0XH5s91Q8l4WSVSRVVLqfw==
X-Received: by 2002:a17:90a:f015:: with SMTP id
 bt21mr25139826pjb.3.1642426232566; 
 Mon, 17 Jan 2022 05:30:32 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:31 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 19/23] hw/riscv: virt: Add optional AIA APLIC support to
 virt machine
Date: Mon, 17 Jan 2022 18:58:22 +0530
Message-Id: <20220117132826.426418-20-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::232;
 envelope-from=anup@brainfault.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We extend virt machine to emulate AIA APLIC devices only when
"aia=aplic" parameter is passed along with machine name in QEMU
command-line. When "aia=none" or not specified then we fallback
to original PLIC device emulation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 293 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  26 +++-
 3 files changed, 260 insertions(+), 60 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d2d869aaad..c30bb7cb6c 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV_VIRT
     select PFLASH_CFI01
     select SERIAL
     select RISCV_ACLINT
+    select RISCV_APLIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 720641b1dd..45d85d274f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -33,6 +33,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
+#include "hw/intc/riscv_aplic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -51,6 +52,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
+    [VIRT_APLIC_M] =     {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_APLIC_S] =     {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
@@ -132,12 +135,13 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_pcie_irq_map(void *fdt, char *nodename,
-                                uint32_t plic_phandle)
+static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
+                                uint32_t irqchip_phandle)
 {
     int pin, dev;
-    uint32_t
-        full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS * FDT_INT_MAP_WIDTH] = {};
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                          FDT_MAX_INT_MAP_WIDTH] = {};
     uint32_t *irq_map = full_irq_map;
 
     /* This code creates a standard swizzle of interrupts such that
@@ -155,23 +159,31 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
             int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
             int i = 0;
 
+            /* Fill PCI address cells */
             irq_map[i] = cpu_to_be32(devfn << 8);
-
             i += FDT_PCI_ADDR_CELLS;
-            irq_map[i] = cpu_to_be32(pin + 1);
 
+            /* Fill PCI Interrupt cells */
+            irq_map[i] = cpu_to_be32(pin + 1);
             i += FDT_PCI_INT_CELLS;
-            irq_map[i++] = cpu_to_be32(plic_phandle);
 
-            i += FDT_PLIC_ADDR_CELLS;
-            irq_map[i] = cpu_to_be32(irq_nr);
-
-            irq_map += FDT_INT_MAP_WIDTH;
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irqchip_phandle);
+            irq_map[i++] = cpu_to_be32(irq_nr);
+            if (s->aia_type != VIRT_AIA_TYPE_NONE) {
+                irq_map[i++] = cpu_to_be32(0x4);
+            }
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
         }
     }
 
-    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
-                     full_irq_map, sizeof(full_irq_map));
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                     irq_map_stride * sizeof(uint32_t));
 
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
                            0x1800, 0, 0, 0x7);
@@ -394,8 +406,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
     plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
     qemu_fdt_add_subnode(mc->fdt, plic_name);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name,
-        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
@@ -415,6 +425,76 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
+static void create_fdt_socket_aia(RISCVVirtState *s,
+                                  const MemMapEntry *memmap, int socket,
+                                  uint32_t *phandle, uint32_t *intc_phandles,
+                                  uint32_t *aplic_phandles)
+{
+    int cpu;
+    char *aplic_name;
+    uint32_t *aplic_cells;
+    unsigned long aplic_addr;
+    MachineState *mc = MACHINE(s);
+    uint32_t aplic_m_phandle, aplic_s_phandle;
+
+    aplic_m_phandle = (*phandle)++;
+    aplic_s_phandle = (*phandle)++;
+    aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    /* M-level APLIC node */
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    aplic_addr = memmap[VIRT_APLIC_M].base +
+                 (memmap[VIRT_APLIC_M].size * socket);
+    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,aplic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
+        aplic_s_phandle);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
+        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
+    g_free(aplic_name);
+
+    /* S-level APLIC node */
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    aplic_addr = memmap[VIRT_APLIC_S].base +
+                 (memmap[VIRT_APLIC_S].size * socket);
+    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,aplic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
+    g_free(aplic_name);
+
+    g_free(aplic_cells);
+    aplic_phandles[socket] = aplic_s_phandle;
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -451,8 +531,13 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
             create_fdt_socket_clint(s, memmap, socket, intc_phandles);
         }
 
-        create_fdt_socket_plic(s, memmap, socket, phandle,
-            intc_phandles, xplic_phandles);
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            create_fdt_socket_plic(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        } else {
+            create_fdt_socket_aia(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        }
 
         g_free(intc_phandles);
         g_free(clust_name);
@@ -493,7 +578,13 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
             0x0, memmap[VIRT_VIRTIO].size);
         qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
             irq_virtio_phandle);
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + i);
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            qemu_fdt_setprop_cell(mc->fdt, name, "interrupts",
+                                  VIRTIO_IRQ + i);
+        } else {
+            qemu_fdt_setprop_cells(mc->fdt, name, "interrupts",
+                                   VIRTIO_IRQ + i, 0x4);
+        }
         g_free(name);
     }
 }
@@ -531,7 +622,7 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
 
-    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
+    create_pcie_irq_map(s, mc->fdt, name, irq_pcie_phandle);
     g_free(name);
 }
 
@@ -590,7 +681,11 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
         0x0, memmap[VIRT_UART0].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", UART0_IRQ, 0x4);
+    }
 
     qemu_fdt_add_subnode(mc->fdt, "/chosen");
     qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
@@ -611,7 +706,11 @@ static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
         0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
         irq_mmio_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", RTC_IRQ, 0x4);
+    }
     g_free(name);
 }
 
@@ -692,7 +791,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr high_mmio_base,
                                           hwaddr high_mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic)
+                                          DeviceState *irqchip)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -726,7 +825,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
-        irq = qdev_get_gpio_in(plic, PCIE_IRQ + i);
+        irq = qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
@@ -757,18 +856,75 @@ static FWCfgState *create_fw_cfg(const MachineState *mc)
     return fw_cfg;
 }
 
+static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
+                                     int base_hartid, int hart_count)
+{
+    DeviceState *ret;
+    char *plic_hart_config;
+
+    /* Per-socket PLIC hart topology configuration string */
+    plic_hart_config = riscv_plic_hart_config_string(hart_count);
+
+    /* Per-socket PLIC */
+    ret = sifive_plic_create(
+            memmap[VIRT_PLIC].base + socket * memmap[VIRT_PLIC].size,
+            plic_hart_config, hart_count, base_hartid,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            ((1U << VIRT_IRQCHIP_NUM_PRIO_BITS) - 1),
+            VIRT_PLIC_PRIORITY_BASE,
+            VIRT_PLIC_PENDING_BASE,
+            VIRT_PLIC_ENABLE_BASE,
+            VIRT_PLIC_ENABLE_STRIDE,
+            VIRT_PLIC_CONTEXT_BASE,
+            VIRT_PLIC_CONTEXT_STRIDE,
+            memmap[VIRT_PLIC].size);
+
+    g_free(plic_hart_config);
+
+    return ret;
+}
+
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+                                    const MemMapEntry *memmap, int socket,
+                                    int base_hartid, int hart_count)
+{
+    DeviceState *aplic_m;
+
+    /* Per-socket M-level APLIC */
+    aplic_m = riscv_aplic_create(
+        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
+        memmap[VIRT_APLIC_M].size,
+        base_hartid, hart_count,
+        VIRT_IRQCHIP_NUM_SOURCES,
+        VIRT_IRQCHIP_NUM_PRIO_BITS,
+        false, true, NULL);
+
+    if (aplic_m) {
+        /* Per-socket S-level APLIC */
+        riscv_aplic_create(
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
+            memmap[VIRT_APLIC_S].size,
+            base_hartid, hart_count,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            VIRT_IRQCHIP_NUM_PRIO_BITS,
+            false, false, aplic_m);
+    }
+
+    return aplic_m;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    char *plic_hart_config, *soc_name;
+    char *soc_name;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
-    DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
+    DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
 
     /* Check socket count limit */
@@ -779,7 +935,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     /* Initialize sockets */
-    mmio_plic = virtio_plic = pcie_plic = NULL;
+    mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < riscv_socket_count(machine); i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
@@ -829,36 +985,27 @@ static void virt_machine_init(MachineState *machine)
                 base_hartid, hart_count, true);
         }
 
-        /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config = riscv_plic_hart_config_string(hart_count);
-
-        /* Per-socket PLIC */
-        s->plic[i] = sifive_plic_create(
-            memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, hart_count, base_hartid,
-            VIRT_PLIC_NUM_SOURCES,
-            VIRT_PLIC_NUM_PRIORITIES,
-            VIRT_PLIC_PRIORITY_BASE,
-            VIRT_PLIC_PENDING_BASE,
-            VIRT_PLIC_ENABLE_BASE,
-            VIRT_PLIC_ENABLE_STRIDE,
-            VIRT_PLIC_CONTEXT_BASE,
-            VIRT_PLIC_CONTEXT_STRIDE,
-            memmap[VIRT_PLIC].size);
-        g_free(plic_hart_config);
+        /* Per-socket interrupt controller */
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            s->irqchip[i] = virt_create_plic(memmap, i,
+                                             base_hartid, hart_count);
+        } else {
+            s->irqchip[i] = virt_create_aia(s->aia_type, memmap, i,
+                                            base_hartid, hart_count);
+        }
 
-        /* Try to use different PLIC instance based device type */
+        /* Try to use different IRQCHIP instance based device type */
         if (i == 0) {
-            mmio_plic = s->plic[i];
-            virtio_plic = s->plic[i];
-            pcie_plic = s->plic[i];
+            mmio_irqchip = s->irqchip[i];
+            virtio_irqchip = s->irqchip[i];
+            pcie_irqchip = s->irqchip[i];
         }
         if (i == 1) {
-            virtio_plic = s->plic[i];
-            pcie_plic = s->plic[i];
+            virtio_irqchip = s->irqchip[i];
+            pcie_irqchip = s->irqchip[i];
         }
         if (i == 2) {
-            pcie_plic = s->plic[i];
+            pcie_irqchip = s->irqchip[i];
         }
     }
 
@@ -957,7 +1104,7 @@ static void virt_machine_init(MachineState *machine)
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(virtio_plic), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
     }
 
     gpex_pcie_init(system_memory,
@@ -968,14 +1115,14 @@ static void virt_machine_init(MachineState *machine)
                    virt_high_pcie_memmap.base,
                    virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
-                   DEVICE(pcie_plic));
+                   DEVICE(pcie_irqchip));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
-        qdev_get_gpio_in(DEVICE(mmio_plic), RTC_IRQ));
+        qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
 
     virt_flash_create(s);
 
@@ -991,6 +1138,37 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static char *virt_get_aia(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    const char *val;
+
+    switch (s->aia_type) {
+    case VIRT_AIA_TYPE_APLIC:
+        val = "aplic";
+        break;
+    default:
+        val = "none";
+        break;
+    };
+
+    return g_strdup(val);
+}
+
+static void virt_set_aia(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    if (!strcmp(val, "none")) {
+        s->aia_type = VIRT_AIA_TYPE_NONE;
+    } else if (!strcmp(val, "aplic")) {
+        s->aia_type = VIRT_AIA_TYPE_APLIC;
+    } else {
+        error_setg(errp, "Invalid AIA interrupt controller type");
+        error_append_hint(errp, "Valid values are none, and aplic.\n");
+    }
+}
+
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -1029,6 +1207,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aclint",
                                           "Set on/off to enable/disable "
                                           "emulating ACLINT devices");
+
+    object_class_property_add_str(oc, "aia", virt_get_aia,
+                                  virt_set_aia);
+    object_class_property_set_description(oc, "aia",
+                                          "Set type of AIA interrupt "
+                                          "conttoller. Valid values are "
+                                          "none, and aplic.");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6e9f61ccd9..4584042090 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -32,18 +32,24 @@ typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
 
+typedef enum RISCVVirtAIAType {
+    VIRT_AIA_TYPE_NONE=0,
+    VIRT_AIA_TYPE_APLIC,
+} RISCVVirtAIAType;
+
 struct RISCVVirtState {
     /*< private >*/
     MachineState parent;
 
     /*< public >*/
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
-    DeviceState *plic[VIRT_SOCKETS_MAX];
+    DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
     FWCfgState *fw_cfg;
 
     int fdt_size;
     bool have_aclint;
+    RISCVVirtAIAType aia_type;
 };
 
 enum {
@@ -54,6 +60,8 @@ enum {
     VIRT_CLINT,
     VIRT_ACLINT_SSWI,
     VIRT_PLIC,
+    VIRT_APLIC_M,
+    VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
@@ -73,8 +81,9 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_PLIC_NUM_SOURCES 127
-#define VIRT_PLIC_NUM_PRIORITIES 7
+#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
@@ -86,9 +95,14 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
-#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
-#define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 + \
-                               FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_CELLS   2
+#define FDT_MAX_INT_CELLS     2
+#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_MAX_INT_CELLS)
+#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_APLIC_INT_CELLS)
 
 #endif
-- 
2.25.1


