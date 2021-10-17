Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7E430CC8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:56:02 +0200 (CEST)
Received: from localhost ([::1]:56926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF4T-0005eL-Qq
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1e-00036G-U9
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1X-0008LL-Ia
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r10so37764813wra.12
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMDhCXCDbzxJyYdvKoRXl+1jB8zw3v1bjW6eZPBvW4k=;
 b=anEVRsDz+1QcpVYRL2+QJ9RHMCMkVTuDMkazq8Xssg1KX5R9dBUE/FPNCs79ofkP0z
 dExoj91l7MvxE/2GXSDwN+8MLD+BVo2VwMdvMSaR8jRtAKTkKaDSjxDPmjwmaWfQwRpg
 E+zNOgKHjiTz3hHib3DLZKdZW9pGmNj5lb5ITULwI0/c25E4VVnc0q3NCrznkMb36pPv
 Xqqi6O+AfRdfcYrur0no7YEcezyAYSUkobhxX0iQXnAoOYQq4X4JqDEl9Dn+zPiIqXXS
 VGZHFtbtiQpQVQl9FHu12sTGN7mUq89QY2cncR+/jPT9/IQFrXE5wsSpxWX79RFQrh7E
 MDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UMDhCXCDbzxJyYdvKoRXl+1jB8zw3v1bjW6eZPBvW4k=;
 b=YpV50xFH5DbxKnJiWpDRtUyv+FQZcB20P0rvs66ot17FrywZgqOF3XlVar7ZQLgM3H
 1QOZbz5Jtt/67Nd6iX3S2HQlvTEbPlNXUg57EL1/2hFNMtDvUPA3a4nZ3pmQsYvk77FY
 m2KSUW/TFrYIhisqDND1HM/tWMsYo6pChsfz9IMGV4AuMRx8bTRYuAZXS0H1umO9461e
 ObUxmOU3VyEDUBbO3tWD/H7aZRqQf6hEk7d6xEPHnSAkBlHBX0bX/J99dmBCWQaQ/cNI
 06aFjTe2jd15tXzJf1LZJOuYaV/0STDRePN6to6AOxCjflxyT1u/YpcfARr9S7aL9etJ
 neww==
X-Gm-Message-State: AOAM531fTYErVGYfBhV4EtIs26d6BU7JTz7T7GTYhLukmwkfJdKEwrBJ
 HYhYbKJt4zrcdLqvNDf3pHvJGLYsXnI=
X-Google-Smtp-Source: ABdhPJx1tcYowVmrM2PxhoF38B3rIfExYgZYD33a8EvVY5qSZvWhIdx1yZbgjL23pYFT31xm5V4TmQ==
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr31481507wrz.363.1634511178006; 
 Sun, 17 Oct 2021 15:52:58 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c185sm10992864wma.8.2021.10.17.15.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:52:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] hw/mips/boston: Massage memory map information
Date: Mon, 18 Oct 2021 00:52:30 +0200
Message-Id: <20211017225245.2618892-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Use memmap array to uinfy address of memory map.
That would allow us reuse address information for FDT generation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Use local 'regaddr' in gen_firmware(), fix coding style]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211002184539.169-2-jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 108 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 80 insertions(+), 28 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 20b06865b2b..37b8278623e 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -64,6 +64,44 @@ struct BostonState {
     hwaddr fdt_base;
 };
 
+enum {
+    BOSTON_LOWDDR,
+    BOSTON_PCIE0,
+    BOSTON_PCIE1,
+    BOSTON_PCIE2,
+    BOSTON_PCIE2_MMIO,
+    BOSTON_CM,
+    BOSTON_GIC,
+    BOSTON_CDMM,
+    BOSTON_CPC,
+    BOSTON_PLATREG,
+    BOSTON_UART,
+    BOSTON_LCD,
+    BOSTON_FLASH,
+    BOSTON_PCIE1_MMIO,
+    BOSTON_PCIE0_MMIO,
+    BOSTON_HIGHDDR,
+};
+
+static const MemMapEntry boston_memmap[] = {
+    [BOSTON_LOWDDR] =     {        0x0,    0x10000000 },
+    [BOSTON_PCIE0] =      { 0x10000000,     0x2000000 },
+    [BOSTON_PCIE1] =      { 0x12000000,     0x2000000 },
+    [BOSTON_PCIE2] =      { 0x14000000,     0x2000000 },
+    [BOSTON_PCIE2_MMIO] = { 0x16000000,      0x100000 },
+    [BOSTON_CM] =         { 0x16100000,       0x20000 },
+    [BOSTON_GIC] =        { 0x16120000,       0x20000 },
+    [BOSTON_CDMM] =       { 0x16140000,        0x8000 },
+    [BOSTON_CPC] =        { 0x16200000,        0x8000 },
+    [BOSTON_PLATREG] =    { 0x17ffd000,        0x1000 },
+    [BOSTON_UART] =       { 0x17ffe000,          0x20 },
+    [BOSTON_LCD] =        { 0x17fff000,           0x8 },
+    [BOSTON_FLASH] =      { 0x18000000,     0x8000000 },
+    [BOSTON_PCIE1_MMIO] = { 0x20000000,    0x20000000 },
+    [BOSTON_PCIE0_MMIO] = { 0x40000000,    0x40000000 },
+    [BOSTON_HIGHDDR] =    { 0x80000000,           0x0 },
+};
+
 enum boston_plat_reg {
     PLAT_FPGA_BUILD     = 0x00,
     PLAT_CORE_CL        = 0x04,
@@ -275,24 +313,24 @@ type_init(boston_register_types)
 
 static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
-    const uint32_t cm_base = 0x16100000;
-    const uint32_t gic_base = 0x16120000;
-    const uint32_t cpc_base = 0x16200000;
+    uint64_t regaddr;
 
     /* Move CM GCRs */
-    bl_gen_write_ulong(&p,
-                       cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
-                       cm_base);
+    regaddr = cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr,
+                       boston_memmap[BOSTON_CM].base);
 
     /* Move & enable GIC GCRs */
-    bl_gen_write_ulong(&p,
-                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS),
-                       gic_base | GCR_GIC_BASE_GICEN_MSK);
+    regaddr = cpu_mips_phys_to_kseg1(NULL, boston_memmap[BOSTON_CM].base
+                                           + GCR_GIC_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr,
+                       boston_memmap[BOSTON_GIC].base | GCR_GIC_BASE_GICEN_MSK);
 
     /* Move & enable CPC GCRs */
-    bl_gen_write_ulong(&p,
-                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS),
-                       cpc_base | GCR_CPC_BASE_CPCEN_MSK);
+    regaddr = cpu_mips_phys_to_kseg1(NULL, boston_memmap[BOSTON_CM].base
+                                           + GCR_CPC_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr,
+                       boston_memmap[BOSTON_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
 
     /*
      * Setup argument registers to follow the UHI boot protocol:
@@ -333,8 +371,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
     ram_low_sz = MIN(256 * MiB, machine->ram_size);
     ram_high_sz = machine->ram_size - ram_low_sz;
     qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
-                                 1, 0x00000000, 1, ram_low_sz,
-                                 1, 0x90000000, 1, ram_high_sz);
+                        1, boston_memmap[BOSTON_LOWDDR].base, 1, ram_low_sz,
+                        1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz,
+                        1, ram_high_sz);
 
     fdt = g_realloc(fdt, fdt_totalsize(fdt));
     qemu_fdt_dumpdtb(fdt, fdt_sz);
@@ -438,11 +477,15 @@ static void boston_mach_init(MachineState *machine)
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
 
     flash =  g_new(MemoryRegion, 1);
-    memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB,
-                           &error_fatal);
-    memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
+    memory_region_init_rom(flash, NULL, "boston.flash",
+                           boston_memmap[BOSTON_FLASH].size, &error_fatal);
+    memory_region_add_subregion_overlap(sys_mem,
+                                        boston_memmap[BOSTON_FLASH].base,
+                                        flash, 0);
 
-    memory_region_add_subregion_overlap(sys_mem, 0x80000000, machine->ram, 0);
+    memory_region_add_subregion_overlap(sys_mem,
+                                        boston_memmap[BOSTON_HIGHDDR].base,
+                                        machine->ram, 0);
 
     ddr_low_alias = g_new(MemoryRegion, 1);
     memory_region_init_alias(ddr_low_alias, NULL, "boston_low.ddr",
@@ -451,32 +494,41 @@ static void boston_mach_init(MachineState *machine)
     memory_region_add_subregion_overlap(sys_mem, 0, ddr_low_alias, 0);
 
     xilinx_pcie_init(sys_mem, 0,
-                     0x10000000, 32 * MiB,
-                     0x40000000, 1 * GiB,
+                     boston_memmap[BOSTON_PCIE0].base,
+                     boston_memmap[BOSTON_PCIE0].size,
+                     boston_memmap[BOSTON_PCIE0_MMIO].base,
+                     boston_memmap[BOSTON_PCIE0_MMIO].size,
                      get_cps_irq(&s->cps, 2), false);
 
     xilinx_pcie_init(sys_mem, 1,
-                     0x12000000, 32 * MiB,
-                     0x20000000, 512 * MiB,
+                     boston_memmap[BOSTON_PCIE1].base,
+                     boston_memmap[BOSTON_PCIE1].size,
+                     boston_memmap[BOSTON_PCIE1_MMIO].base,
+                     boston_memmap[BOSTON_PCIE1_MMIO].size,
                      get_cps_irq(&s->cps, 1), false);
 
     pcie2 = xilinx_pcie_init(sys_mem, 2,
-                             0x14000000, 32 * MiB,
-                             0x16000000, 1 * MiB,
+                             boston_memmap[BOSTON_PCIE2].base,
+                             boston_memmap[BOSTON_PCIE2].size,
+                             boston_memmap[BOSTON_PCIE2_MMIO].base,
+                             boston_memmap[BOSTON_PCIE2_MMIO].size,
                              get_cps_irq(&s->cps, 0), true);
 
     platreg = g_new(MemoryRegion, 1);
     memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
-                          "boston-platregs", 0x1000);
-    memory_region_add_subregion_overlap(sys_mem, 0x17ffd000, platreg, 0);
+                          "boston-platregs",
+                          boston_memmap[BOSTON_PLATREG].size);
+    memory_region_add_subregion_overlap(sys_mem,
+                          boston_memmap[BOSTON_PLATREG].base, platreg, 0);
 
-    s->uart = serial_mm_init(sys_mem, 0x17ffe000, 2,
+    s->uart = serial_mm_init(sys_mem, boston_memmap[BOSTON_UART].base, 2,
                              get_cps_irq(&s->cps, 3), 10000000,
                              serial_hd(0), DEVICE_NATIVE_ENDIAN);
 
     lcd = g_new(MemoryRegion, 1);
     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0x8);
-    memory_region_add_subregion_overlap(sys_mem, 0x17fff000, lcd, 0);
+    memory_region_add_subregion_overlap(sys_mem,
+                                        boston_memmap[BOSTON_LCD].base, lcd, 0);
 
     chr = qemu_chr_new("lcd", "vc:320x240", NULL);
     qemu_chr_fe_init(&s->lcd_display, chr, NULL);
-- 
2.31.1


