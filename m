Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B855FFF3A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:38:58 +0200 (CEST)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok2uu-0002uC-OF
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ks-0002TP-Ch; Sun, 16 Oct 2022 08:28:34 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kp-0000QV-H2; Sun, 16 Oct 2022 08:28:33 -0400
Received: by mail-ed1-x52c.google.com with SMTP id u21so12536551edi.9;
 Sun, 16 Oct 2022 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSx/0dBuPJaOvBdHjoRuvrisCjatTW6nbPDpOTMpy00=;
 b=KAj2ju30TO84aZywwn/xSgIO57lE8/owtt4M+fOteMokW89E7AAyfoMWr1A4rVc4+z
 JLrUuB3ZQ28xZVJ4B/t2+3zzofm5kEhaxNt0dtgJ8CVqxG/Tm3NGkYbSmmssWSeb7uHI
 l0zuzWl3tmdzRtlRm/dQZUJaECkckfxR4d6clXnfAzOhNaB8LEgWIFoulijerQksDSQt
 e0Rs2AuI32LHHs32FLFoIn/btCAXu6wxlXl1oOS//35kvqVtOUpvdv96yEJCy9Eq/v49
 /Z58juVV1brxLNN1me9wlacOpJK/1HAAOx3EwBQEa0Y59lmhMJrcjV097aICwUjIHKnL
 gUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSx/0dBuPJaOvBdHjoRuvrisCjatTW6nbPDpOTMpy00=;
 b=Bp7Ws9iVOKJ0acICfXo5Zkm00A1VRWQ1gi2LmjyBwuDUdvo+hjKUTSlEssAFTCCp5P
 BEBJ9N5kmxmKAPwyXHV6aoN8LwiZ6rHOOIVq6S7hB7YWkXqHazY5GdysMakmNaLWkhMy
 9+5XTivtHQGHde5MkiY5oCEFAmJUH7OS+u6N7gIA1ZDptA6YimimmSJvu1tL8rqpKoc9
 +kon+7+YUX/msaLJzx/CdBv0s6wRKk1TDfwfUocn9+hKB2JudgTqpRixlesAiS1wTa9E
 FGl6uU4OL7DdQs/7EYY0wCizJBOjttycM61dnWUlC8u75ofrSUwh1//vki6EdGYkri8t
 Rr8Q==
X-Gm-Message-State: ACrzQf2Xstn9ytidtsTesftTJqcTPFtyU0LWUFryrgd+Z4hnZvDp9+3Z
 ljv+SZu28UwSnB2CCLZFu6+Q55r1gU0=
X-Google-Smtp-Source: AMsMyM6pwi7oTfzJu4eHliwQ2yjo+NSUDtboEVXZzycWm322MbOSMMdap9S3TCa8dRDkirBa03cDGw==
X-Received: by 2002:a05:6402:1911:b0:45c:be41:a879 with SMTP id
 e17-20020a056402191100b0045cbe41a879mr6012384edz.322.1665923308594; 
 Sun, 16 Oct 2022 05:28:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 3/9] hw/block/pflash_cfi01: Attach memory region in boards
Date: Sun, 16 Oct 2022 14:27:31 +0200
Message-Id: <20221016122737.93755-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pflash_cfi01_register() had a parameter which was only passed to
sysbus_mmio_map() but not used otherwise. Pulling out sysbus_mmio_map()
resolves that parameter and concentrates the memory region setup in
board code. Furthermore, it allows attaching cfi01 devices relative to
some parent bus rather than to the global "sysbus".

While at it, replace sysbus_mmio_map() with non-sysbus equivalents.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/collie.c                          | 20 +++++++++++++-------
 hw/arm/gumstix.c                         | 18 ++++++++++++------
 hw/arm/mainstone.c                       | 16 ++++++++++------
 hw/arm/omap_sx1.c                        | 19 +++++++++++--------
 hw/arm/versatilepb.c                     | 12 +++++++-----
 hw/arm/z2.c                              |  9 ++++++---
 hw/block/pflash_cfi01.c                  |  4 +---
 hw/microblaze/petalogix_ml605_mmu.c      | 16 ++++++++++------
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 10 ++++++----
 hw/mips/malta.c                          |  4 ++--
 hw/ppc/sam460ex.c                        | 15 +++++++++------
 hw/ppc/virtex_ml507.c                    |  5 ++++-
 include/hw/block/flash.h                 |  3 +--
 13 files changed, 92 insertions(+), 59 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e2793..25fb5f657b 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -37,8 +37,10 @@ static struct arm_boot_info collie_binfo = {
 static void collie_init(MachineState *machine)
 {
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     CollieMachineState *cms = COLLIE_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -49,17 +51,21 @@ static void collie_init(MachineState *machine)
 
     cms->sa1110 = sa1110_init(machine->cpu_type);
 
-    memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
+    memory_region_add_subregion(system_memory, SA_SDCS0, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    pfl = pflash_cfi01_register("collie.fl1", 0x02000000,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    memory_region_add_subregion(system_memory, SA_CS0,
+                                pflash_cfi01_get_memory(pfl));
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", 0x02000000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    pfl = pflash_cfi01_register("collie.fl2", 0x02000000,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    memory_region_add_subregion(system_memory, SA_CS1,
+                                pflash_cfi01_get_memory(pfl));
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 1296628ed9..d6c997ad8e 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,6 +51,7 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t connex_rom = 0x01000000;
@@ -65,9 +66,11 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
-    pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          sector_len, 2, 0, 0, 0, 0, 0);
+    pfl = pflash_cfi01_register("connext.rom", connex_rom,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                sector_len, 2, 0, 0, 0, 0, 0);
+    memory_region_add_subregion(address_space_mem, 0x00000000,
+                                pflash_cfi01_get_memory(pfl));
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -78,6 +81,7 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t verdex_rom = 0x02000000;
@@ -92,9 +96,11 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
-    pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          sector_len, 2, 0, 0, 0, 0, 0);
+    pfl = pflash_cfi01_register("verdex.rom", verdex_rom,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                sector_len, 2, 0, 0, 0, 0, 0);
+    memory_region_add_subregion(address_space_mem, 0x00000000,
+                                pflash_cfi01_get_memory(pfl));
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 40f708f2d3..fbbaa4bf0c 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -116,7 +116,6 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     hwaddr mainstone_flash_base[] = { MST_FLASH_0, MST_FLASH_1 };
     PXA2xxState *mpu;
     DeviceState *mst_irq;
-    DriveInfo *dinfo;
     int i;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
 
@@ -129,12 +128,17 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
 
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
+        DriveInfo *dinfo;
+        PFlashCFI01 *fl;
+
         dinfo = drive_get(IF_PFLASH, 0, i);
-        pflash_cfi01_register(mainstone_flash_base[i],
-                              i ? "mainstone.flash1" : "mainstone.flash0",
-                              MAINSTONE_FLASH,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                              sector_len, 4, 0, 0, 0, 0, 0);
+        fl = pflash_cfi01_register(i ? "mainstone.flash1" : "mainstone.flash0",
+                                   MAINSTONE_FLASH,
+                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                   sector_len, 4, 0, 0, 0, 0, 0);
+        memory_region_add_subregion(address_space_mem,
+                                    mainstone_flash_base[i],
+                                    pflash_cfi01_get_memory(fl));
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 820652265b..ce06455252 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -112,6 +112,7 @@ static void sx1_init(MachineState *machine, const int version)
     static uint32_t cs2val = 0x00001139;
     static uint32_t cs3val = 0x00001139;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     int fl_idx;
     uint32_t flash_size = flash0_size;
 
@@ -153,10 +154,11 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        pflash_cfi01_register(OMAP_CS0_BASE,
-                              "omap_sx1.flash0-1", flash_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              sector_size, 4, 0, 0, 0, 0, 0);
+        pfl = pflash_cfi01_register("omap_sx1.flash0-1", flash_size,
+                                    blk_by_legacy_dinfo(dinfo),
+                                    sector_size, 4, 0, 0, 0, 0, 0);
+        memory_region_add_subregion(address_space, OMAP_CS0_BASE,
+                                    pflash_cfi01_get_memory(pfl));
         fl_idx++;
     }
 
@@ -172,10 +174,11 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + flash1_size, &cs[1]);
 
-        pflash_cfi01_register(OMAP_CS1_BASE,
-                              "omap_sx1.flash1-1", flash1_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              sector_size, 4, 0, 0, 0, 0, 0);
+        pfl = pflash_cfi01_register("omap_sx1.flash1-1", flash1_size,
+                                    blk_by_legacy_dinfo(dinfo),
+                                    sector_size, 4, 0, 0, 0, 0, 0);
+        memory_region_add_subregion(address_space, OMAP_CS1_BASE,
+                                    pflash_cfi01_get_memory(pfl));
         fl_idx++;
     } else {
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 43172d72ea..6ab85e304a 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -196,6 +196,7 @@ static void versatile_init(MachineState *machine, int board_id)
     int n;
     int done_smc = 0;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
 
     if (machine->ram_size > 0x10000000) {
         /* Device starting at address 0x10000000,
@@ -385,11 +386,12 @@ static void versatile_init(MachineState *machine, int board_id)
     /* 0x34000000 NOR Flash */
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
-                          VERSATILE_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          VERSATILE_FLASH_SECT_SIZE,
-                          4, 0x0089, 0x0018, 0x0000, 0x0, 0);
+    pfl = pflash_cfi01_register("versatile.flash", VERSATILE_FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                VERSATILE_FLASH_SECT_SIZE,
+                                4, 0x0089, 0x0018, 0x0000, 0x0, 0);
+    memory_region_add_subregion(sysmem, VERSATILE_FLASH_ADDR,
+                                pflash_cfi01_get_memory(pfl));
 
     versatile_binfo.ram_size = machine->ram_size;
     versatile_binfo.board_id = board_id;
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 082ccc557e..79005cd171 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -303,6 +303,7 @@ static void z2_init(MachineState *machine)
     uint32_t sector_len = 0x10000;
     PXA2xxState *mpu;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     void *z2_lcd;
     I2CBus *bus;
     DeviceState *wm;
@@ -311,9 +312,11 @@ static void z2_init(MachineState *machine)
     mpu = pxa270_init(address_space_mem, z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          sector_len, 4, 0, 0, 0, 0, 0);
+    pfl = pflash_cfi01_register("z2.flash0", Z2_FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                sector_len, 4, 0, 0, 0, 0, 0);
+    memory_region_add_subregion(address_space_mem, Z2_FLASH_BASE,
+                                pflash_cfi01_get_memory(pfl));
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9c235bf66e..25d70dc3c0 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -957,8 +957,7 @@ static void pflash_cfi01_register_types(void)
 
 type_init(pflash_cfi01_register_types)
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
+PFlashCFI01 *pflash_cfi01_register(const char *name,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
@@ -984,7 +983,6 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     qdev_prop_set_string(dev, "name", name);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     return PFLASH_CFI01(dev);
 }
 
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..14450ad372 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -76,6 +76,7 @@ petalogix_ml605_init(MachineState *machine)
     MicroBlazeCPU *cpu;
     SysBusDevice *busdev;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     int i;
     MemoryRegion *phys_lmb_bram = g_new(MemoryRegion, 1);
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
@@ -103,12 +104,15 @@ petalogix_ml605_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, MEMORY_BASEADDR, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    /* 5th parameter 2 means bank-width
-     * 10th paremeter 0 means little-endian */
-    pflash_cfi01_register(FLASH_BASEADDR, "petalogix_ml605.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 0);
-
+    /*
+     * 4th parameter 2 means bank-width
+     * 9th paremeter 0 means little-endian
+     */
+    pfl = pflash_cfi01_register("petalogix_ml605.flash", FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 0);
+    memory_region_add_subregion(address_space_mem, FLASH_BASEADDR,
+                                pflash_cfi01_get_memory(pfl));
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr", 1 << TIMER_IRQ);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad8..a7eae72e02 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -62,6 +62,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     DeviceState *dev;
     MicroBlazeCPU *cpu;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     int i;
     hwaddr ddr_base = MEMORY_BASEADDR;
     MemoryRegion *phys_lmb_bram = g_new(MemoryRegion, 1);
@@ -84,10 +85,11 @@ petalogix_s3adsp1800_init(MachineState *machine)
     memory_region_add_subregion(sysmem, ddr_base, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(FLASH_BASEADDR,
-                          "petalogix_s3adsp1800.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    pfl = pflash_cfi01_register("petalogix_s3adsp1800.flash", FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    memory_region_add_subregion(sysmem, FLASH_BASEADDR,
+                                pflash_cfi01_get_memory(pfl));
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr",
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..20407bd998 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1286,12 +1286,12 @@ void mips_malta_init(MachineState *machine)
 
     /* Load firmware in flash / BIOS. */
     dinfo = drive_get(IF_PFLASH, 0, fl_idx);
-    fl = pflash_cfi01_register(FLASH_ADDRESS, "mips_malta.bios",
-                               FLASH_SIZE,
+    fl = pflash_cfi01_register("mips_malta.bios", FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                65536,
                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
     bios = pflash_cfi01_get_memory(fl);
+    memory_region_add_subregion(system_memory, FLASH_ADDRESS, bios);
     fl_idx++;
     if (kernel_filename) {
         ram_low_size = MIN(ram_size, 256 * MiB);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 8089dd015b..6f4f9c7c4a 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -88,7 +88,7 @@ struct boot_info {
     uint32_t entry;
 };
 
-static int sam460ex_load_uboot(void)
+static int sam460ex_load_uboot(MemoryRegion *address_space_mem)
 {
     /*
      * This first creates 1MiB of flash memory mapped at the end of
@@ -109,12 +109,15 @@ static int sam460ex_load_uboot(void)
      */
 
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                          "sam460ex.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    pfl = pflash_cfi01_register("sam460ex.flash", FLASH_SIZE,
+                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    memory_region_add_subregion(address_space_mem,
+                                FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
+                                pflash_cfi01_get_memory(pfl));
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
@@ -448,7 +451,7 @@ static void sam460ex_init(MachineState *machine)
 
     /* Load U-Boot image. */
     if (!machine->kernel_filename) {
-        success = sam460ex_load_uboot();
+        success = sam460ex_load_uboot(address_space_mem);
         if (success < 0) {
             error_report("could not load firmware");
             exit(1);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 493ea0c19f..c98f1b2ab3 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -210,6 +210,7 @@ static void virtex_init(MachineState *machine)
     CPUPPCState *env;
     hwaddr ram_base = 0;
     DriveInfo *dinfo;
+    PFlashCFI01 *pfl;
     qemu_irq irq[32], cpu_irq;
     int kernel_size;
     int i;
@@ -229,9 +230,11 @@ static void virtex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
+    pfl = pflash_cfi01_register("virtex.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    memory_region_add_subregion(address_space_mem, PFLASH_BASEADDR,
+                                pflash_cfi01_get_memory(pfl));
 
     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 86d8363bb0..5f9ba18de1 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -12,8 +12,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
+PFlashCFI01 *pflash_cfi01_register(const char *name,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
-- 
2.38.0


