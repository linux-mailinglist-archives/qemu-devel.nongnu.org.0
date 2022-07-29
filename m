Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D87584CB9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 09:36:55 +0200 (CEST)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHKYI-000346-3F
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 03:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oHKSI-0008Gs-5k
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47432 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oHKSE-0004tF-O9
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:41 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9GLjONiJ2lBAA--.46172S4; 
 Fri, 29 Jul 2022 15:30:22 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 2/2] hw/loongarch: Change macro name 'LS7A_XXX' to
 'VIRT_XXX'
Date: Fri, 29 Jul 2022 15:30:18 +0800
Message-Id: <20220729073018.27037-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
References: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9GLjONiJ2lBAA--.46172S4
X-Coremail-Antispam: 1UD129KBjvAXoW3CFWxZr1DuFy5tF1kAFy8uFg_yoW8GFy7Ao
 Z7XF4Sy3y8Ww1fCrWUKw47XFZrKr10kanxJFWkCFW8Cw47GrWUJ3W5G3Wv9w1xJF1fKry7
 Ja45twn5C392yF1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Change macro name 'LS7A_XXX' to 'VIRT_XXX', as the loongarch
virt machinue use the GPEX bridge instead of LS7A bridge. So
the macro name should keep consistency.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/acpi-build.c   | 18 ++++++------
 hw/loongarch/virt.c         | 56 ++++++++++++++++++-------------------
 include/hw/loongarch/virt.h |  8 +++---
 include/hw/pci-host/ls7a.h  | 43 +++++++++++++---------------
 4 files changed, 61 insertions(+), 64 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index b95b83b079..4b4529a3fb 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -135,7 +135,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 21, 1);        /* Type */
     build_append_int_noprefix(table_data, 19, 1);        /* Length */
     build_append_int_noprefix(table_data, 1, 1);         /* Version */
-    build_append_int_noprefix(table_data, LS7A_PCH_MSI_ADDR_LOW, 8);/* Address */
+    build_append_int_noprefix(table_data, VIRT_PCH_MSI_ADDR_LOW, 8);/* Address */
     build_append_int_noprefix(table_data, 0x40, 4);      /* Start */
     build_append_int_noprefix(table_data, 0xc0, 4);      /* Count */
 
@@ -143,7 +143,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 22, 1);        /* Type */
     build_append_int_noprefix(table_data, 17, 1);        /* Length */
     build_append_int_noprefix(table_data, 1, 1);         /* Version */
-    build_append_int_noprefix(table_data, LS7A_PCH_REG_BASE, 8);/* Address */
+    build_append_int_noprefix(table_data, VIRT_PCH_REG_BASE, 8);/* Address */
     build_append_int_noprefix(table_data, 0x1000, 2);    /* Size */
     build_append_int_noprefix(table_data, 0, 2);         /* Id */
     build_append_int_noprefix(table_data, 0x40, 2);      /* Base */
@@ -307,7 +307,7 @@ static void build_uart_device_aml(Aml *table)
     Aml *dev;
     Aml *crs;
     Aml *pkg0, *pkg1, *pkg2;
-    uint32_t uart_irq = LS7A_UART_IRQ;
+    uint32_t uart_irq = VIRT_UART_IRQ;
 
     Aml *scope = aml_scope("_SB");
     dev = aml_device("COMA");
@@ -367,7 +367,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     if (lams->acpi_ged) {
         build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(lams->acpi_ged),
-                      LS7A_SCI_IRQ - PCH_PIC_IRQ_OFFSET, AML_SYSTEM_MEMORY,
+                      VIRT_SCI_IRQ - PCH_PIC_IRQ_OFFSET, AML_SYSTEM_MEMORY,
                       VIRT_GED_EVT_ADDR);
     }
 
@@ -385,9 +385,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     aml_append(crs,
         aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
                          AML_CACHEABLE, AML_READ_WRITE,
-                         0, LS7A_PCI_MEM_BASE,
-                         LS7A_PCI_MEM_BASE + LS7A_PCI_MEM_SIZE - 1,
-                         0, LS7A_PCI_MEM_BASE));
+                         0, VIRT_PCI_MEM_BASE,
+                         VIRT_PCI_MEM_BASE + VIRT_PCI_MEM_SIZE - 1,
+                         0, VIRT_PCI_MEM_BASE));
     aml_append(scope, aml_name_decl("_CRS", crs));
     aml_append(dsdt, scope);
 
@@ -462,8 +462,8 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg = {
-           .base = cpu_to_le64(LS_PCIECFG_BASE),
-           .size = cpu_to_le64(LS_PCIECFG_SIZE),
+           .base = cpu_to_le64(VIRT_PCI_CFG_BASE),
+           .size = cpu_to_le64(VIRT_PCI_CFG_SIZE),
         };
         build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
                    lams->oem_table_id);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index a08dc9d299..5cc0b05538 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -126,12 +126,12 @@ static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
 static void fdt_add_pcie_node(const LoongArchMachineState *lams)
 {
     char *nodename;
-    hwaddr base_mmio = LS7A_PCI_MEM_BASE;
-    hwaddr size_mmio = LS7A_PCI_MEM_SIZE;
-    hwaddr base_pio = LS7A_PCI_IO_BASE;
-    hwaddr size_pio = LS7A_PCI_IO_SIZE;
-    hwaddr base_pcie = LS_PCIECFG_BASE;
-    hwaddr size_pcie = LS_PCIECFG_SIZE;
+    hwaddr base_mmio = VIRT_PCI_MEM_BASE;
+    hwaddr size_mmio = VIRT_PCI_MEM_SIZE;
+    hwaddr base_pio = VIRT_PCI_IO_BASE;
+    hwaddr size_pio = VIRT_PCI_IO_SIZE;
+    hwaddr base_pcie = VIRT_PCI_CFG_BASE;
+    hwaddr size_pcie = VIRT_PCI_CFG_SIZE;
     hwaddr base = base_pcie;
 
     const MachineState *ms = MACHINE(lams);
@@ -145,12 +145,12 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
-                           PCIE_MMCFG_BUS(LS_PCIECFG_SIZE - 1));
+                           PCIE_MMCFG_BUS(VIRT_PCI_CFG_SIZE - 1));
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_pcie, 2, size_pcie);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
-                                 1, FDT_PCI_RANGE_IOPORT, 2, LS7A_PCI_IO_OFFSET,
+                                 1, FDT_PCI_RANGE_IOPORT, 2, VIRT_PCI_IO_OFFSET,
                                  2, base_pio, 2, size_pio,
                                  1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
                                  2, base_mmio, 2, size_mmio);
@@ -313,7 +313,7 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, VIRT_GED_REG_ADDR);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
-                       qdev_get_gpio_in(pch_pic, LS7A_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
+                       qdev_get_gpio_in(pch_pic, VIRT_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     return dev;
 }
@@ -336,24 +336,24 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     ecam_alias = g_new0(MemoryRegion, 1);
     ecam_reg = sysbus_mmio_get_region(d, 0);
     memory_region_init_alias(ecam_alias, OBJECT(gpex_dev), "pcie-ecam",
-                             ecam_reg, 0, LS_PCIECFG_SIZE);
-    memory_region_add_subregion(get_system_memory(), LS_PCIECFG_BASE,
+                             ecam_reg, 0, VIRT_PCI_CFG_SIZE);
+    memory_region_add_subregion(get_system_memory(), VIRT_PCI_CFG_BASE,
                                 ecam_alias);
 
     /* Map PCI mem space */
     mmio_alias = g_new0(MemoryRegion, 1);
     mmio_reg = sysbus_mmio_get_region(d, 1);
     memory_region_init_alias(mmio_alias, OBJECT(gpex_dev), "pcie-mmio",
-                             mmio_reg, LS7A_PCI_MEM_BASE, LS7A_PCI_MEM_SIZE);
-    memory_region_add_subregion(get_system_memory(), LS7A_PCI_MEM_BASE,
+                             mmio_reg, VIRT_PCI_MEM_BASE, VIRT_PCI_MEM_SIZE);
+    memory_region_add_subregion(get_system_memory(), VIRT_PCI_MEM_BASE,
                                 mmio_alias);
 
     /* Map PCI IO port space. */
     pio_alias = g_new0(MemoryRegion, 1);
     pio_reg = sysbus_mmio_get_region(d, 2);
     memory_region_init_alias(pio_alias, OBJECT(gpex_dev), "pcie-io", pio_reg,
-                             LS7A_PCI_IO_OFFSET, LS7A_PCI_IO_SIZE);
-    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
+                             VIRT_PCI_IO_OFFSET, VIRT_PCI_IO_SIZE);
+    memory_region_add_subregion(get_system_memory(), VIRT_PCI_IO_BASE,
                                 pio_alias);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
@@ -362,9 +362,9 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
         gpex_set_irq_num(GPEX_HOST(gpex_dev), i, 16 + i);
     }
 
-    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
+    serial_mm_init(get_system_memory(), VIRT_UART_BASE, 0,
                    qdev_get_gpio_in(pch_pic,
-                                    LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
+                                    VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* Network init */
@@ -386,9 +386,9 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
      * Create some unimplemented devices to emulate this.
      */
     create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
-    sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
+    sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
-                         LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+                         VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
 
     pm_mem = g_new(MemoryRegion, 1);
     memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
@@ -472,13 +472,13 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
     d = SYS_BUS_DEVICE(pch_pic);
     sysbus_realize_and_unref(d, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), LS7A_IOAPIC_REG_BASE,
+    memory_region_add_subregion(get_system_memory(), VIRT_IOAPIC_REG_BASE,
                             sysbus_mmio_get_region(d, 0));
     memory_region_add_subregion(get_system_memory(),
-                            LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
+                            VIRT_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
                             sysbus_mmio_get_region(d, 1));
     memory_region_add_subregion(get_system_memory(),
-                            LS7A_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
+                            VIRT_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
                             sysbus_mmio_get_region(d, 2));
 
     /* Connect 64 pch_pic irqs to extioi */
@@ -490,7 +490,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
     d = SYS_BUS_DEVICE(pch_msi);
     sysbus_realize_and_unref(d, &error_fatal);
-    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
+    sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
     for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
         /* Connect 192 pch_msi irqs to extioi */
         qdev_connect_gpio_out(DEVICE(d), i,
@@ -666,8 +666,8 @@ static void loongarch_init(MachineState *machine)
     memmap_add_entry(0x90000000, highram_size, 1);
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
-                             get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
-    memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
+                             get_system_io(), 0, VIRT_ISA_IO_SIZE);
+    memory_region_add_subregion(address_space_mem, VIRT_ISA_IO_BASE,
                                 &lams->isa_io);
     /* load the BIOS image. */
     loongarch_firmware_init(lams);
@@ -706,9 +706,9 @@ static void loongarch_init(MachineState *machine)
 
     /* load fdt */
     MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
-    memory_region_init_rom(fdt_rom, NULL, "fdt", LA_FDT_SIZE, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), LA_FDT_BASE, fdt_rom);
-    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, LA_FDT_BASE);
+    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f4f24df428..92b84de1c5 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -15,8 +15,8 @@
 
 #define LOONGARCH_MAX_VCPUS     4
 
-#define LOONGARCH_ISA_IO_BASE   0x18000000UL
-#define LOONGARCH_ISA_IO_SIZE   0x0004000
+#define VIRT_ISA_IO_BASE        0x18000000UL
+#define VIRT_ISA_IO_SIZE        0x0004000
 #define VIRT_FWCFG_BASE         0x1e020000UL
 #define VIRT_BIOS_BASE          0x1c000000UL
 #define VIRT_BIOS_SIZE          (4 * MiB)
@@ -28,8 +28,8 @@
 #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
 #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
 
-#define LA_FDT_BASE             0x1c400000
-#define LA_FDT_SIZE             0x100000
+#define VIRT_FDT_BASE           0x1c400000
+#define VIRT_FDT_SIZE           0x100000
 
 struct LoongArchMachineState {
     /*< private >*/
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 0fdc86b973..cdde0af1f8 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -15,34 +15,31 @@
 #include "qemu/range.h"
 #include "qom/object.h"
 
-#define LS7A_PCI_MEM_BASE        0x40000000UL
-#define LS7A_PCI_MEM_SIZE        0x40000000UL
-#define LS7A_PCI_IO_OFFSET      0x4000
-#define LS_PCIECFG_BASE         0x20000000
-#define LS_PCIECFG_SIZE         0x08000000
-#define LS7A_PCI_IO_BASE        0x18004000UL
-#define LS7A_PCI_IO_SIZE        0xC000
+#define VIRT_PCI_MEM_BASE        0x40000000UL
+#define VIRT_PCI_MEM_SIZE        0x40000000UL
+#define VIRT_PCI_IO_OFFSET       0x4000
+#define VIRT_PCI_CFG_BASE        0x20000000
+#define VIRT_PCI_CFG_SIZE        0x08000000
+#define VIRT_PCI_IO_BASE         0x18004000UL
+#define VIRT_PCI_IO_SIZE         0xC000
 
-#define LS7A_PCI_MEM_BASE       0x40000000UL
-#define LS7A_PCI_MEM_SIZE       0x40000000UL
-
-#define LS7A_PCH_REG_BASE       0x10000000UL
-#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
-#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
+#define VIRT_PCH_REG_BASE        0x10000000UL
+#define VIRT_IOAPIC_REG_BASE     (VIRT_PCH_REG_BASE)
+#define VIRT_PCH_MSI_ADDR_LOW    0x2FF00000UL
 
 /*
  * According to the kernel pch irq start from 64 offset
  * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
  * used for pci device.
  */
-#define PCH_PIC_IRQ_OFFSET      64
-#define LS7A_DEVICE_IRQS        16
-#define LS7A_PCI_IRQS           48
-#define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
-#define LS7A_UART_BASE          0x1fe001e0
-#define LS7A_RTC_IRQ            (PCH_PIC_IRQ_OFFSET + 3)
-#define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
-#define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
-#define LS7A_RTC_LEN            0x100
-#define LS7A_SCI_IRQ            (PCH_PIC_IRQ_OFFSET + 4)
+#define PCH_PIC_IRQ_OFFSET       64
+#define VIRT_DEVICE_IRQS         16
+#define VIRT_PCI_IRQS            48
+#define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
+#define VIRT_UART_BASE           0x1fe001e0
+#define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
+#define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
+#define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
+#define VIRT_RTC_LEN             0x100
+#define VIRT_SCI_IRQ             (PCH_PIC_IRQ_OFFSET + 4)
 #endif
-- 
2.31.1


