Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C49430CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:58:11 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF6Y-00032S-9o
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1k-0003FT-5h
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1h-0008UW-RX
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso6947609wms.4
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h1iHf2kDwn8LzMNDc3apAwvo6I02QYP6FBZ32aF9Pzw=;
 b=GEswyGDoegGDy6FscBt++5t7rRfpGn4/oAUvDH3SnujadmzZEvnjBhW3jKVdTADRju
 fkPUqE8besl9QJOwZ+AJ21+a28cLDzzvWl6iwnGtyJfVncy0BqG28xzXnmhz19+gTWLm
 NWivqcXhBx3HRISghXnSy+IvE6KOG1YxD2Dh0GZTUPLQRaOFIFLaiXWbsL+Tw9InSr6A
 HmXRpt4LRj5nJpxQ8S4K0ppwLBVh4SV8El/7Z+jcpByOZ4Cz6r7+YupLfGyE7uMXJsdb
 4a5dVVGtfeTA7mjIYbQiNUKscX3kIdRzAua3TcNvR9ekMnkncX1GllHmKVwE8Rgb6pdn
 xovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h1iHf2kDwn8LzMNDc3apAwvo6I02QYP6FBZ32aF9Pzw=;
 b=DgUP6HZsOatB7mqBQjBCSXntVNlWYyoPxr39KZ8UzZ4d0SbCIDNt2r7J3ZO3h3Hn05
 drq3UcYyDMMHQOsSnNgK8nXKaR0OvQAXg0EpqE89dJAaHdwwQUezAXJUJS1V+BBZ3aXS
 826+q7qAX/7h3l8SZTjG9UmHkChTELXNOteoe/TJfvih2d34LAQYRftzmS4E2qCIAKjT
 KCFF0/M9cgGl9oxBqU1mHsSXe9jsaDaN73uCjRM0QjCF1jbJ+ebY2c9XFUwF6itEvpt9
 RFOeMkEGPWrSq9DWoWoH8QscCeUmqnlopCyOoTzNtNUmP6NFGhaXdEb7EN8rH9oXZasg
 aSOQ==
X-Gm-Message-State: AOAM533ouqRgVbmcdXzA7fy5cPb3kAp0e87k3gYLKaupYoewDpAmqeT6
 ei7nPwfaBZiUJDJWJ2MbSHbEO0HFEpA=
X-Google-Smtp-Source: ABdhPJyJsXCCSsOkGqOR3cHFuEiRyhy0f0+fBsPOviQ6g720nNyHDRnbhbM2Kjy///5A9UidOSnLQg==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr342489wme.185.1634511188278; 
 Sun, 17 Oct 2021 15:53:08 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id t1sm648804wre.32.2021.10.17.15.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] hw/mips/boston: Add FDT generator
Date: Mon, 18 Oct 2021 00:52:32 +0200
Message-Id: <20211017225245.2618892-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Generate FDT on our own if no dtb argument supplied.
Avoid introducing unused device in FDT with user supplied dtb.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[PMD: Fix coding style]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211002184539.169-4-jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 245 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 236 insertions(+), 9 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 7374bb5da4d..0e3cca55118 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -49,6 +49,15 @@ typedef struct BostonState BostonState;
 DECLARE_INSTANCE_CHECKER(BostonState, BOSTON,
                          TYPE_BOSTON)
 
+#define FDT_IRQ_TYPE_NONE       0
+#define FDT_IRQ_TYPE_LEVEL_HIGH 4
+#define FDT_GIC_SHARED          0
+#define FDT_GIC_LOCAL           1
+#define FDT_BOSTON_CLK_SYS      1
+#define FDT_BOSTON_CLK_CPU      2
+#define FDT_PCI_IRQ_MAP_PINS    4
+#define FDT_PCI_IRQ_MAP_DESCS   6
+
 struct BostonState {
     SysBusDevice parent_obj;
 
@@ -437,6 +446,222 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
     return XILINX_PCIE_HOST(dev);
 }
 
+
+static void fdt_create_pcie(void *fdt, int gic_ph, int irq, hwaddr reg_base,
+                            hwaddr reg_size, hwaddr mmio_base, hwaddr mmio_size)
+{
+    int i;
+    char *name, *intc_name;
+    uint32_t intc_ph;
+    uint32_t interrupt_map[FDT_PCI_IRQ_MAP_PINS][FDT_PCI_IRQ_MAP_DESCS];
+
+    intc_ph = qemu_fdt_alloc_phandle(fdt);
+    name = g_strdup_printf("/soc/pci@%" HWADDR_PRIx, reg_base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible",
+                            "xlnx,axi-pcie-host-1.00.a");
+    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cells(fdt, name, "reg", reg_base, reg_size);
+
+    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 3);
+    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 2);
+    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", 1);
+
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", gic_ph);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", FDT_GIC_SHARED, irq,
+                            FDT_IRQ_TYPE_LEVEL_HIGH);
+
+    qemu_fdt_setprop_cells(fdt, name, "ranges", 0x02000000, 0, mmio_base,
+                            mmio_base, 0, mmio_size);
+    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0x00, 0xff);
+
+
+
+    intc_name = g_strdup_printf("%s/interrupt-controller", name);
+    qemu_fdt_add_subnode(fdt, intc_name);
+    qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, intc_name, "#address-cells", 0);
+    qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
+    qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_ph);
+
+    qemu_fdt_setprop_cells(fdt, name, "interrupt-map-mask", 0, 0, 0, 7);
+    for (i = 0; i < FDT_PCI_IRQ_MAP_PINS; i++) {
+        uint32_t *irqmap = interrupt_map[i];
+
+        irqmap[0] = cpu_to_be32(0);
+        irqmap[1] = cpu_to_be32(0);
+        irqmap[2] = cpu_to_be32(0);
+        irqmap[3] = cpu_to_be32(i + 1);
+        irqmap[4] = cpu_to_be32(intc_ph);
+        irqmap[5] = cpu_to_be32(i + 1);
+    }
+    qemu_fdt_setprop(fdt, name, "interrupt-map",
+                     &interrupt_map, sizeof(interrupt_map));
+
+    g_free(intc_name);
+    g_free(name);
+}
+
+static const void *create_fdt(BostonState *s,
+                              const MemMapEntry *memmap, int *dt_size)
+{
+    void *fdt;
+    int cpu;
+    MachineState *mc = s->mach;
+    uint32_t platreg_ph, gic_ph, clk_ph;
+    char *name, *gic_name, *platreg_name, *stdout_name;
+    static const char * const syscon_compat[2] = {
+        "img,boston-platform-regs", "syscon"
+    };
+
+    fdt = create_device_tree(dt_size);
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    platreg_ph = qemu_fdt_alloc_phandle(fdt);
+    gic_ph = qemu_fdt_alloc_phandle(fdt);
+    clk_ph = qemu_fdt_alloc_phandle(fdt);
+
+    qemu_fdt_setprop_string(fdt, "/", "model", "img,boston");
+    qemu_fdt_setprop_string(fdt, "/", "compatible", "img,boston");
+    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x1);
+    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x1);
+
+
+    qemu_fdt_add_subnode(fdt, "/cpus");
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
+
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        name = g_strdup_printf("/cpus/cpu@%d", cpu);
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible", "img,mips");
+        qemu_fdt_setprop_string(fdt, name, "status", "okay");
+        qemu_fdt_setprop_cell(fdt, name, "reg", cpu);
+        qemu_fdt_setprop_string(fdt, name, "device_type", "cpu");
+        qemu_fdt_setprop_cells(fdt, name, "clocks", clk_ph, FDT_BOSTON_CLK_CPU);
+        g_free(name);
+    }
+
+    qemu_fdt_add_subnode(fdt, "/soc");
+    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
+    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x1);
+    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x1);
+
+    fdt_create_pcie(fdt, gic_ph, 2,
+                memmap[BOSTON_PCIE0].base, memmap[BOSTON_PCIE0].size,
+                memmap[BOSTON_PCIE0_MMIO].base, memmap[BOSTON_PCIE0_MMIO].size);
+
+    fdt_create_pcie(fdt, gic_ph, 1,
+                memmap[BOSTON_PCIE1].base, memmap[BOSTON_PCIE1].size,
+                memmap[BOSTON_PCIE1_MMIO].base, memmap[BOSTON_PCIE1_MMIO].size);
+
+    fdt_create_pcie(fdt, gic_ph, 0,
+                memmap[BOSTON_PCIE2].base, memmap[BOSTON_PCIE2].size,
+                memmap[BOSTON_PCIE2_MMIO].base, memmap[BOSTON_PCIE2_MMIO].size);
+
+    /* GIC with it's timer node */
+    gic_name = g_strdup_printf("/soc/interrupt-controller@%" HWADDR_PRIx,
+                                memmap[BOSTON_GIC].base);
+    qemu_fdt_add_subnode(fdt, gic_name);
+    qemu_fdt_setprop_string(fdt, gic_name, "compatible", "mti,gic");
+    qemu_fdt_setprop_cells(fdt, gic_name, "reg", memmap[BOSTON_GIC].base,
+                            memmap[BOSTON_GIC].size);
+    qemu_fdt_setprop(fdt, gic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, gic_name, "#interrupt-cells", 3);
+    qemu_fdt_setprop_cell(fdt, gic_name, "phandle", gic_ph);
+
+    name = g_strdup_printf("%s/timer", gic_name);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "mti,gic-timer");
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", FDT_GIC_LOCAL, 1,
+                            FDT_IRQ_TYPE_NONE);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_ph, FDT_BOSTON_CLK_CPU);
+    g_free(name);
+    g_free(gic_name);
+
+    /* CDMM node */
+    name = g_strdup_printf("/soc/cdmm@%" HWADDR_PRIx, memmap[BOSTON_CDMM].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "mti,mips-cdmm");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_CDMM].base,
+                            memmap[BOSTON_CDMM].size);
+    g_free(name);
+
+    /* CPC node */
+    name = g_strdup_printf("/soc/cpc@%" HWADDR_PRIx, memmap[BOSTON_CPC].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "mti,mips-cpc");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_CPC].base,
+                            memmap[BOSTON_CPC].size);
+    g_free(name);
+
+    /* platreg and it's clk node */
+    platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
+                                   memmap[BOSTON_PLATREG].base);
+    qemu_fdt_add_subnode(fdt, platreg_name);
+    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
+                                 (char **)&syscon_compat,
+                                 ARRAY_SIZE(syscon_compat));
+    qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
+                           memmap[BOSTON_PLATREG].base,
+                           memmap[BOSTON_PLATREG].size);
+    qemu_fdt_setprop_cell(fdt, platreg_name, "phandle", platreg_ph);
+
+    name = g_strdup_printf("%s/clock", platreg_name);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "img,boston-clock");
+    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 1);
+    qemu_fdt_setprop_cell(fdt, name, "phandle", clk_ph);
+    g_free(name);
+    g_free(platreg_name);
+
+    /* reboot node */
+    name = g_strdup_printf("/soc/reboot");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(fdt, name, "regmap", platreg_ph);
+    qemu_fdt_setprop_cell(fdt, name, "offset", 0x10);
+    qemu_fdt_setprop_cell(fdt, name, "mask", 0x10);
+    g_free(name);
+
+    /* uart node */
+    name = g_strdup_printf("/soc/uart@%" HWADDR_PRIx, memmap[BOSTON_UART].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_UART].base,
+                            memmap[BOSTON_UART].size);
+    qemu_fdt_setprop_cell(fdt, name, "reg-shift", 0x2);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", gic_ph);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", FDT_GIC_SHARED, 3,
+                            FDT_IRQ_TYPE_LEVEL_HIGH);
+    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_ph, FDT_BOSTON_CLK_SYS);
+
+    qemu_fdt_add_subnode(fdt, "/chosen");
+    stdout_name = g_strdup_printf("%s:115200", name);
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", stdout_name);
+    g_free(stdout_name);
+    g_free(name);
+
+    /* lcd node */
+    name = g_strdup_printf("/soc/lcd@%" HWADDR_PRIx, memmap[BOSTON_LCD].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "img,boston-lcd");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_LCD].base,
+                            memmap[BOSTON_LCD].size);
+    g_free(name);
+
+    name = g_strdup_printf("/memory@0");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "device_type", "memory");
+    g_free(name);
+
+    return fdt;
+}
+
 static void boston_mach_init(MachineState *machine)
 {
     DeviceState *dev;
@@ -560,22 +785,24 @@ static void boston_mach_init(MachineState *machine)
                            NULL, 0, EM_MIPS, 1, 0);
 
         if (kernel_size) {
+            int dt_size;
+            g_autofree const void *dtb_file_data, *dtb_load_data;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
             hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
 
             s->kernel_entry = kernel_entry;
             if (machine->dtb) {
-                int dt_size;
-                g_autofree const void *dtb_file_data, *dtb_load_data;
-
                 dtb_file_data = load_device_tree(machine->dtb, &dt_size);
-                dtb_load_data = boston_fdt_filter(s, dtb_file_data,
-                                                  NULL, &dtb_vaddr);
-
-                /* Calculate real fdt size after filter */
-                dt_size = fdt_totalsize(dtb_load_data);
-                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            } else {
+                dtb_file_data = create_fdt(s, boston_memmap, &dt_size);
             }
+
+            dtb_load_data = boston_fdt_filter(s, dtb_file_data,
+                                              NULL, &dtb_vaddr);
+
+            /* Calculate real fdt size after filter */
+            dt_size = fdt_totalsize(dtb_load_data);
+            rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.31.1


