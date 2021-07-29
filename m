Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EE3D9C5B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 05:42:32 +0200 (CEST)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8wwJ-0002R1-BQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 23:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuN-0000N2-Hl
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:33 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuL-0002DP-Ck
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E61595C00F8;
 Wed, 28 Jul 2021 23:40:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 23:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=EmMJRK3CdDiio
 C17LP3nyUyRPsdJIFKrJhTy511XlHY=; b=l5xm5YWW3o1wUaVARxi2HH/XBfAcp
 PfIQOfNXVJELvvI15JSPtsodYpnG0DclOs6ZZ8yrlMYU7KD+WQCmEjJHJPq5E8OO
 unAHP52WbO7Hr8wqnyn52nY+tXgeP59SM1gsBQ0Bz6LIMYbOb23AVZKWDIOfvd76
 wNdK/3cNtHS3zZs8Wm3rSJxXAnaXMAGAP4nVidRdAiQUc/B1SINrFFu5odNBAhvx
 K77klGPfKDepTrv4CjW4wIFpsUH3Oz/q3bckiacAPHwlAM/9TMeIi0QxpQjpOElO
 x3Zs6FWPZ9Tv8tvhtrKbTDV8d9rs/0Q2UOUWFoi8zn3UQCiz/NqD/2wOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=EmMJRK3CdDiioC17LP3nyUyRPsdJIFKrJhTy511XlHY=; b=jO0bRpzP
 9aowrYy1WtFWYJqwnUBzX55EfTWzNFWWly2Okn5499CFw3FM/4X/QjqeE3NWgcD2
 XFwgFuboE6E6FFWstkXRxNixuN7YZShaTBQlNpeFUo4Bx4hOrPPbtWoi+kI4hE7E
 NEXuztP3sk6VHpHGSzpxS3zuPYt5anooFR4e0GGp7fLld+ZYl9oh/jjKr4oFTMPZ
 ZN0A1IrzQUmGhTYLtE7rJFScUxe4GkWgHd8FKPHRl3gyBza+Lc2h7E1l8h69S23C
 Nqk7xS5yaFaGnKaZi9KxGPU8jSfnZX2cdY45fRH92+Df4ss+FOOElZMGce7zDVN3
 LwJ/QuPYdZez5Q==
X-ME-Sender: <xms:LCMCYaXsUZl0w133sa-q1CwpO89aBOYccRwoNhCl4Uz4Z8edARWraQ>
 <xme:LCMCYWkckGi-iSAzyOlWZnskbIAcAhsa9MSFVaUL83iKgs-E1ixCHm7y8-RNxfip1
 p2fmoT26OmgyFVP_yk>
X-ME-Received: <xmr:LCMCYebGDjWJRzFEX0_975XXMe_QUAO69JZky7vZS4AfvEPkQ1y1OBKWFNjK5GcGm9G-FlOPpmGJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
 dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
 udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:LCMCYRXA6PIggQLXAOnMANOpHodN_2QFgw4rVImaFW0_Jbui-eg3jg>
 <xmx:LCMCYUlrTA-imuBCVgo-Bgt7JvW7aDxbL1olORb2kGHVzJKwUebF6Q>
 <xmx:LCMCYWfgH-JkHD7cYYjRBXV2nXiIJLHHqpiqLbN4XNGgnovi9zGS2g>
 <xmx:LCMCYehLB0CdXRPAxfwAx9S-bMKNxNFeYi4neEiFybbNGuSqCMIBNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 23:40:24 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/mips/boston: Add FDT generator
Date: Thu, 29 Jul 2021 11:39:59 +0800
Message-Id: <20210729033959.6454-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Avoid introduce unused device in FDT with user supplied dtb.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 238 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 228 insertions(+), 10 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 42b31a1ce4..aaa79b9da7 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -49,6 +49,13 @@ typedef struct BostonState BostonState;
 DECLARE_INSTANCE_CHECKER(BostonState, BOSTON,
                          TYPE_BOSTON)
 
+#define FDT_IRQ_TYPE_NONE       0
+#define FDT_IRQ_TYPE_LEVEL_HIGH 4
+#define FDT_GIC_SHARED          0
+#define FDT_GIC_LOCAL           1
+#define FDT_BOSTON_CLK_SYS      1
+#define FDT_BOSTON_CLK_CPU      2
+
 struct BostonState {
     SysBusDevice parent_obj;
 
@@ -435,6 +442,214 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
     return XILINX_PCIE_HOST(dev);
 }
 
+
+static void fdt_create_pcie(void *fdt, int gic_ph, int irq, hwaddr reg_base,
+                            hwaddr reg_size, hwaddr mmio_base, hwaddr mmio_size)
+{
+    int i;
+    char *name, *intc_name;
+    uint32_t intc_ph;
+    uint32_t interrupt_map[4][6];
+
+    intc_ph = qemu_fdt_alloc_phandle(fdt);
+    name = g_strdup_printf("/soc/pci@%lx", (long)reg_base);
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
+    for (i = 0; i < 4; i++) {
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
+    gic_name = g_strdup_printf("/soc/interrupt-controller@%lx",
+                                (long)memmap[BOSTON_GIC].base);
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
+    name = g_strdup_printf("/soc/cdmm@%lx", (long)memmap[BOSTON_CDMM].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "mti,mips-cdmm");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_CDMM].base,
+                            memmap[BOSTON_CDMM].size);
+    g_free(name);
+
+    /* CPC node */
+    name = g_strdup_printf("/soc/cpc@%lx", (long)memmap[BOSTON_CPC].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "mti,mips-cpc");
+    qemu_fdt_setprop_cells(fdt, name, "reg", memmap[BOSTON_CPC].base,
+                            memmap[BOSTON_CPC].size);
+    g_free(name);
+
+    /* platreg and it's clk node */
+    platreg_name = g_strdup_printf("/soc/system-controller@%lx",
+                                    (long)memmap[BOSTON_PLATREG].base);
+    qemu_fdt_add_subnode(fdt, platreg_name);
+    {
+        static const char * const compat[2] = {"img,boston-platform-regs", "syscon"};
+        qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible", (char **)&compat,
+                                      ARRAY_SIZE(compat));
+    }
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
+    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[BOSTON_UART].base);
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
+    name = g_strdup_printf("/soc/lcd@%lx", (long)memmap[BOSTON_LCD].base);
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
@@ -556,23 +771,26 @@ static void boston_mach_init(MachineState *machine)
                            NULL, 0, EM_MIPS, 1, 0);
 
         if (kernel_size) {
+            int dt_size;
+            const void *dtb_file_data, *dtb_load_data;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
             hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
 
             s->kernel_entry = kernel_entry;
-            if (machine->dtb) {
-                int dt_size;
-                const void *dtb_file_data, *dtb_load_data;
 
+            if (machine->dtb) {
                 dtb_file_data = load_device_tree(machine->dtb, &dt_size);
-                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
-
-                /* Calculate real fdt size after filter */
-                dt_size = fdt_totalsize(dtb_load_data);
-                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
-                g_free((void *) dtb_file_data);
-                g_free((void *) dtb_load_data);
+            } else {
+                dtb_file_data = create_fdt(s, boston_memmap, &dt_size);
             }
+
+            dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
+
+            /* Calculate real fdt size after filter */
+            dt_size = fdt_totalsize(dtb_load_data);
+            rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            g_free((void *) dtb_file_data);
+            g_free((void *) dtb_load_data);
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.32.0


