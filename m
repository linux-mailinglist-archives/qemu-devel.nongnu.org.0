Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667841FDC7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 20:49:35 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWk4k-0001Xa-5T
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 14:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1M-0007Hp-A6
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1I-0006jy-PY
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D47195C00AF;
 Sat,  2 Oct 2021 14:45:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 02 Oct 2021 14:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OoAZOydEtauKt
 auDZ8XoaAh08//n33xGy6R1YggnQ2Y=; b=LcLXzkVlb1adiP9/FVau7/r2AL4tf
 YWXuUDexDGxibZIX1bS3p5W6gym7BSSpJ1wfpz4nfW5F5kQPjlQk4WnarPJ+3X6n
 mE20wERRxVx3aivI/yneeDoCjWJRYfaSjYgZ7BUmf7gJG/9V9ABwvVzNMUW7+32r
 3o8a1DJrwaRKm33TiAqspywYi3i5ahxlqhW6UQtXZiEGenEuqwjGTNAHWaioRceW
 R6ltg4BKEFIakU4fO9kxZX05DbrSj3Z960BrEFTFQf1KAQ1J5nyhd23pyci0qJEu
 ruZye7UJlESMHo5sRAbcE6STdMKHMITEX4Dx6MlVO0DwY1OeMdzd0/6Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OoAZOydEtauKtauDZ8XoaAh08//n33xGy6R1YggnQ2Y=; b=TLHPxt3o
 KyXHj4DghJaL2hgLr6S5IN4WbwKEzJYfIRgZapiZc9jUERTCSj8B1I4l+lytTO8w
 +h5W4j5aSVmoi9dP8lhY87s+YKUmZjhP8Oglf9y34sTFPsjVPkn7IQqAEtSI9Q09
 dF1e8L0HqzaY14MotIZzCALz3nQchOS/RKMIER1fm0FM9QsOUA5GEJ6LZeCNtJEw
 2MaiL4E8Y5+nSl7AEmxSdGayCUbNlkin8BIHumnNfMOCvFPrzyGRf+P6uEBUzC0f
 LI7j10ukFfb5XRKR7mbQFFAJqtxvXbAsusiMidPMaykT6zRED7xyQJpVhGDEbDTT
 hlgj7yXzvmPNvA==
X-ME-Sender: <xms:56hYYfYTwPsCAEMch1flJlxOdBU9jmfmaXtEGI1rbJz7TzYPr4r8iw>
 <xme:56hYYeafdcWR4iOqS4b7EnQcx05gIJXMAN2SYi851WFPkVQrvMgPV-vWrquzpHFFw
 zS7El9zRhMIunqiIME>
X-ME-Received: <xmr:56hYYR8RJpQPwgaCodjNnziVJDX8l_ngSHCTyD9TEYzRfZv4fcMRXHZuzWvpdW6ojjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelff
 dukedtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:56hYYVqQDjdenrvxUgD-l1a8GRB5zeYFqZpu--FuCiL5QCya37ztWA>
 <xmx:56hYYaoWIOIKevEUOXMyxDAmLymjAveOGBHGwNiwh3__2KuyEsMTYw>
 <xmx:56hYYbT-pO2ozjWt-Z0WwiLLYellBq3w4su3JTc8kS4J_XOYKkoJZw>
 <xmx:56hYYTnm_Kf4gIqj14aFxC_ehAAJSpAkZn1wRJk1sro1b62WXqEKpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 14:45:58 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/mips/boston: Add FDT generator
Date: Sat,  2 Oct 2021 19:45:39 +0100
Message-Id: <20211002184539.169-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002184539.169-1-jiaxun.yang@flygoat.com>
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generate FDT on our own if no dtb argument supplied.
Avoid introducing unused device in FDT with user supplied dtb.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v2: Address f4bug cmments (Thanks!)
---
 hw/mips/boston.c | 234 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 226 insertions(+), 8 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index e6d5cc2d22..d0935dbc79 100644
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
 
@@ -435,6 +444,213 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
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
+    qemu_fdt_setprop_string(fdt, name, "compatible", "xlnx,axi-pcie-host-1.00.a");
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
+    qemu_fdt_setprop(fdt, name, "interrupt-map", &interrupt_map, sizeof(interrupt_map));
+
+    g_free(intc_name);
+    g_free(name);
+}
+
+static const void *create_fdt(BostonState *s, const MemMapEntry *memmap, int *dt_size)
+{
+    void *fdt;
+    int cpu;
+    MachineState *mc = s->mach;
+    uint32_t platreg_ph, gic_ph, clk_ph;
+    char *name, *gic_name, *platreg_name, *stdout_name;
+    static const char * const syscon_compat[2] = {"img,boston-platform-regs", "syscon"};
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
+    fdt_create_pcie(fdt, gic_ph, 2, memmap[BOSTON_PCIE0].base, memmap[BOSTON_PCIE0].size,
+                    memmap[BOSTON_PCIE0_MMIO].base, memmap[BOSTON_PCIE0_MMIO].size);
+
+    fdt_create_pcie(fdt, gic_ph, 1, memmap[BOSTON_PCIE1].base, memmap[BOSTON_PCIE1].size,
+                    memmap[BOSTON_PCIE1_MMIO].base, memmap[BOSTON_PCIE1_MMIO].size);
+
+    fdt_create_pcie(fdt, gic_ph, 0, memmap[BOSTON_PCIE2].base, memmap[BOSTON_PCIE2].size,
+                    memmap[BOSTON_PCIE2_MMIO].base, memmap[BOSTON_PCIE2_MMIO].size);
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
+                                    memmap[BOSTON_PLATREG].base);
+    qemu_fdt_add_subnode(fdt, platreg_name);
+    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
+                                 (char **)&syscon_compat,
+                                 ARRAY_SIZE(syscon_compat));
+    qemu_fdt_setprop_cells(fdt, platreg_name, "reg", memmap[BOSTON_PLATREG].base,
+                            memmap[BOSTON_PLATREG].size);
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
@@ -555,21 +771,23 @@ static void boston_mach_init(MachineState *machine)
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
-                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
-
-                /* Calculate real fdt size after filter */
-                dt_size = fdt_totalsize(dtb_load_data);
-                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            } else {
+                dtb_file_data = create_fdt(s, boston_memmap, &dt_size);
             }
+
+            dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
+
+            /* Calculate real fdt size after filter */
+            dt_size = fdt_totalsize(dtb_load_data);
+            rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.30.2


