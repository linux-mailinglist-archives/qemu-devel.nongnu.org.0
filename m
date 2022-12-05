Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC719642787
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:32:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29g1-0002AK-Dj; Mon, 05 Dec 2022 06:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p29fw-00029U-Po
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:30:21 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p29ft-0005Lq-Le
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:30:20 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxDOtA1o1jZ0UDAA--.7546S3;
 Mon, 05 Dec 2022 19:30:08 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxBlc_1o1jLu8lAA--.9709S2; 
 Mon, 05 Dec 2022 19:30:07 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com, peter.maydell@linaro.org,
 philmd@linaro.org, yangxiaojuan@loongson.cn, maobibo@loongson.cn
Subject: [PATCH] Revert "hw/loongarch/virt: Add cfi01 pflash device"
Date: Mon,  5 Dec 2022 19:30:07 +0800
Message-Id: <20221205113007.683505-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxBlc_1o1jLu8lAA--.9709S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Gw15Gr1kJFWftr1fAF18Krg_yoWxJw13pF
 yfAFn29r48WF43WrZrX3sxWF1UArs7Ca47Xw1I9w40ka47ur18WrWIk3y0vFyUA34kXF1q
 gF95G34jga1UW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit 14dccc8ea6ece7ee63273144fb55e4770a05e0fd.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig        |  1 -
 hw/loongarch/acpi-build.c   | 18 -----------
 hw/loongarch/virt.c         | 62 -------------------------------------
 include/hw/loongarch/virt.h |  5 ---
 4 files changed, 86 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index eb112af990..17d15b6c90 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -20,4 +20,3 @@ config LOONGARCH_VIRT
     select ACPI_HW_REDUCED
     select FW_CFG_DMA
     select DIMM
-    select PFLASH_CFI01
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index c2b237736d..7d5f5a757d 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -279,23 +279,6 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
     acpi_dsdt_add_gpex(scope, &cfg);
 }
 
-static void build_flash_aml(Aml *scope, LoongArchMachineState *lams)
-{
-    Aml *dev, *crs;
-
-    hwaddr flash_base = VIRT_FLASH_BASE;
-    hwaddr flash_size = VIRT_FLASH_SIZE;
-
-    dev = aml_device("FLS0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(flash_base, flash_size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-
 #ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
 {
@@ -345,7 +328,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_uart_device_aml(dsdt);
     build_pci_device_aml(dsdt, lams);
     build_la_ged_aml(dsdt, machine);
-    build_flash_aml(dsdt, lams);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(dsdt, lams);
 #endif
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index c8a495ea30..958be74fa1 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,63 +42,6 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 #include "sysemu/tpm.h"
-#include "sysemu/block-backend.h"
-#include "hw/block/flash.h"
-
-static void virt_flash_create(LoongArchMachineState *lams)
-{
-    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
-
-    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
-    qdev_prop_set_uint8(dev, "width", 4);
-    qdev_prop_set_uint8(dev, "device-width", 2);
-    qdev_prop_set_bit(dev, "big-endian", false);
-    qdev_prop_set_uint16(dev, "id0", 0x89);
-    qdev_prop_set_uint16(dev, "id1", 0x18);
-    qdev_prop_set_uint16(dev, "id2", 0x00);
-    qdev_prop_set_uint16(dev, "id3", 0x00);
-    qdev_prop_set_string(dev, "name", "virt.flash");
-    object_property_add_child(OBJECT(lams), "virt.flash", OBJECT(dev));
-    object_property_add_alias(OBJECT(lams), "pflash",
-                              OBJECT(dev), "drive");
-
-    lams->flash = PFLASH_CFI01(dev);
-}
-
-static void virt_flash_map(LoongArchMachineState *lams,
-                           MemoryRegion *sysmem)
-{
-    PFlashCFI01 *flash = lams->flash;
-    DeviceState *dev = DEVICE(flash);
-    hwaddr base = VIRT_FLASH_BASE;
-    hwaddr size = VIRT_FLASH_SIZE;
-
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
-
-    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    memory_region_add_subregion(sysmem, base,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
-
-}
-
-static void fdt_add_flash_node(LoongArchMachineState *lams)
-{
-    MachineState *ms = MACHINE(lams);
-    char *nodename;
-
-    hwaddr flash_base = VIRT_FLASH_BASE;
-    hwaddr flash_size = VIRT_FLASH_SIZE;
-
-    nodename = g_strdup_printf("/flash@%" PRIx64, flash_base);
-    qemu_fdt_add_subnode(ms->fdt, nodename);
-    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-                                 2, flash_base, 2, flash_size);
-    qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
-    g_free(nodename);
-}
 
 static void fdt_add_rtc_node(LoongArchMachineState *lams)
 {
@@ -653,9 +596,6 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
     int bios_size;
 
     lams->bios_loaded = false;
-
-    virt_flash_map(lams, get_system_memory());
-
     if (filename) {
         bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
         if (!bios_name) {
@@ -839,7 +779,6 @@ static void loongarch_init(MachineState *machine)
             loongarch_direct_kernel_boot(lams);
         }
     }
-    fdt_add_flash_node(lams);
     /* register reset function */
     for (i = 0; i < machine->smp.cpus; i++) {
         lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
@@ -899,7 +838,6 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
-    virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f5f818894e..45c383f5a7 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,7 +12,6 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
-#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -21,9 +20,6 @@
 #define VIRT_FWCFG_BASE         0x1e020000UL
 #define VIRT_BIOS_BASE          0x1c000000UL
 #define VIRT_BIOS_SIZE          (4 * MiB)
-#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
-#define VIRT_FLASH_BASE         0x1d000000UL
-#define VIRT_FLASH_SIZE         (16 * MiB)
 
 #define VIRT_LOWMEM_BASE        0
 #define VIRT_LOWMEM_SIZE        0x10000000
@@ -52,7 +48,6 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
-    PFlashCFI01  *flash;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


