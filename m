Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76A41FDC8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 20:49:35 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWk4k-0001Xy-C3
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 14:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1L-0007Hn-5C
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1I-0006ha-Oj
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CC0E5C00A2;
 Sat,  2 Oct 2021 14:45:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 02 Oct 2021 14:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 I3+qvDL6zWSWgYaf+kszEoKeHqmUgf28ArcBTIjLQaw=; b=OxXj0D180XPSmrSJ
 48tH7IaPEZBw6VoqmrkMqE6DpZCiMijlxn7i/M5sc0jFe5Bw7HBHQ1dAyEFY0Wbf
 LQSpG235AjkXf9EvOcILhsibpmoOaa59m8fCbwjUB2B23giwP9PUkCEdWPsQUpyx
 y91ZSGyiV2ffXlZQT5aJUmjq7BPy2kDQXiuKwnWyf4ZMplkhyMeXahL6oFCc5oyr
 wF+teQSVAnM/6mLAtm6ddHzZ0sGJAP9S4QD93piM/mfSuOQ0+mm3VR9uAc8t7Mwi
 nbH3rRNkWJsB2w3Czi8+uJrzePnP3PORI5+XXmCMeNHKV8gL46FMizQnEJuI+7WX
 iTDeGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=I3+qvDL6zWSWgYaf+kszEoKeHqmUgf28ArcBTIjLQ
 aw=; b=GL+aNaZf0eXAlrxiPo1UXcAsS8r4rpsLRBTAzasDnReWDkH3AAYGtUiYq
 +q2RdvaURaO7C0nBtS2BfkYu86AThaS9h7lVaCy8OBKCnwstUQ7yKwIeC+3luTSK
 UmTwBAd71sHUGRjsVScD9mTjR/Yedus5iKVnLtv/rZbqM+joBZKlAVme/f+M2n6d
 aZUAI4/+k0Ns4lPT6mbvx2ul2eUouPRKuSrkitrJ0+5aZS68DvWpe7ueC6Y7KfyB
 b1LMUEGkG+vpiZWOG14qkagY8PCLdo5rzpcXu9c6d8ztPMs5sPAJr+ffpAKOttOs
 NOCXqRlT4U/Co+yrINTJKWTb8eTqw==
X-ME-Sender: <xms:5ahYYf3zjnRn95Ew4TOrzq92a2MvcVgNy2qpOXfffYL90pUjbfxMMA>
 <xme:5ahYYeFMRau5mQfk9QEPEcAYF9Ve5V-iZ9yUk4OENOhogIzTR8ECkLnOdKx2KN-C-
 9UI5ttJqyvzi4RIFZ4>
X-ME-Received: <xmr:5ahYYf45YCSB_WcEriczhaL7V0a8xo2LU7vbYNQ3R2Ydtku_yiNQeZXic_BGjDfS3XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeehuddvtedtleehhe
 fggeevteekkefhjedvjedtgfeugfekjedtvdevueejveekleenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:5ahYYU1RHvAWute6QYg-mPRAe9iV6j4kwys7yyafMNHgVfUagDk-Fw>
 <xmx:5ahYYSGQM2_4ErSa6-AJxdnVt5oev-TRgYRsEZXh6WgYKTtlyzbRRg>
 <xmx:5ahYYV-gxKnUgjgH3c7ff6y4OaIol0x_2Uy849FRSvSJJrMzWuqe6Q>
 <xmx:5ahYYejoGz3ZTapjieX7FVwDQsNOzuMw7hhEKm3O11iqMeGZxpfd7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 14:45:56 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw/mips/boston: Massage memory map information
Date: Sat,  2 Oct 2021 19:45:37 +0100
Message-Id: <20211002184539.169-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002184539.169-1-jiaxun.yang@flygoat.com>
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use memmap array to uinfy address of memory map.
That would allow us reuse address information for FDT generation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
--
v2: Fix minor style issue, fix uart map size
---
 hw/mips/boston.c | 95 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 24 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 20b06865b2..5c720440fb 100644
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
@@ -275,24 +313,22 @@ type_init(boston_register_types)
 
 static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
-    const uint32_t cm_base = 0x16100000;
-    const uint32_t gic_base = 0x16120000;
-    const uint32_t cpc_base = 0x16200000;
-
     /* Move CM GCRs */
     bl_gen_write_ulong(&p,
                        cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
-                       cm_base);
+                       boston_memmap[BOSTON_CM].base);
 
     /* Move & enable GIC GCRs */
     bl_gen_write_ulong(&p,
-                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS),
-                       gic_base | GCR_GIC_BASE_GICEN_MSK);
+                       cpu_mips_phys_to_kseg1(NULL,
+                            boston_memmap[BOSTON_CM].base + GCR_GIC_BASE_OFS),
+                       boston_memmap[BOSTON_GIC].base | GCR_GIC_BASE_GICEN_MSK);
 
     /* Move & enable CPC GCRs */
     bl_gen_write_ulong(&p,
-                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS),
-                       cpc_base | GCR_CPC_BASE_CPCEN_MSK);
+                       cpu_mips_phys_to_kseg1(NULL,
+                            boston_memmap[BOSTON_CM].base + GCR_CPC_BASE_OFS),
+                       boston_memmap[BOSTON_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
 
     /*
      * Setup argument registers to follow the UHI boot protocol:
@@ -333,8 +369,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
     ram_low_sz = MIN(256 * MiB, machine->ram_size);
     ram_high_sz = machine->ram_size - ram_low_sz;
     qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
-                                 1, 0x00000000, 1, ram_low_sz,
-                                 1, 0x90000000, 1, ram_high_sz);
+                                 1, boston_memmap[BOSTON_LOWDDR].base, 1, ram_low_sz,
+                                 1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz,
+                                 1, ram_high_sz);
 
     fdt = g_realloc(fdt, fdt_totalsize(fdt));
     qemu_fdt_dumpdtb(fdt, fdt_sz);
@@ -438,11 +475,13 @@ static void boston_mach_init(MachineState *machine)
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
 
     flash =  g_new(MemoryRegion, 1);
-    memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB,
+    memory_region_init_rom(flash, NULL, "boston.flash", boston_memmap[BOSTON_FLASH].size,
                            &error_fatal);
-    memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
+    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_FLASH].base,
+                                        flash, 0);
 
-    memory_region_add_subregion_overlap(sys_mem, 0x80000000, machine->ram, 0);
+    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_HIGHDDR].base,
+                                        machine->ram, 0);
 
     ddr_low_alias = g_new(MemoryRegion, 1);
     memory_region_init_alias(ddr_low_alias, NULL, "boston_low.ddr",
@@ -451,32 +490,40 @@ static void boston_mach_init(MachineState *machine)
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
+    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_LCD].base, lcd, 0);
 
     chr = qemu_chr_new("lcd", "vc:320x240", NULL);
     qemu_chr_fe_init(&s->lcd_display, chr, NULL);
-- 
2.30.2


