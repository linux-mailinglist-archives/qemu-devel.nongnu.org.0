Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC64F993
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jun 2019 04:46:23 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hesWM-0002pX-TN
	for lists+qemu-devel@lfdr.de; Sat, 22 Jun 2019 22:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42931)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hesSv-0000Kv-2T
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 22:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hesSs-0003Dc-Ep
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 22:42:48 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
 id 1hesSs-0003BV-46
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 22:42:46 -0400
Received: by mail-pf1-x441.google.com with SMTP id r7so5548214pfl.3
 for <qemu-devel@nongnu.org>; Sat, 22 Jun 2019 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0175rzzmXB3wcWtqy4A/d2/Pbdgtm6CItBQos36x938=;
 b=tx9kTKVwYAjPXfNSqLQ6rfmCCR5BW/Rtw9K9MZC8dsZ2rFzYjj7jEXUhfdkdKwJuVj
 nAOsEZdsVi1rOpRTMcALiAjlrm2q1mJ3klPAKqQw6GI2q/uRZ4d2WlnVzLuDXzoVYZ7n
 fZo2OPaydXxWhCEiJh5IQdGEMEBP3HQjzzikWnw4v3h4Tj4VN1OUKD0NiMNJfCWENmZv
 5reHsrln9bXklQN7jekduqpkELgUMNbv+m5smcekRhnN7jdtBqR9Hr9TckWbzb7opp/B
 XXTdsMMNOT1TRvdNkcDjHpv0KTNyVFR1xwGAjTiTXgf6xAOR9BxXX71+fq1mPI7PVWrU
 vCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0175rzzmXB3wcWtqy4A/d2/Pbdgtm6CItBQos36x938=;
 b=JUM6f7ImdSvoq7XQsaovxtDI9hv4ZNDTDt9bFWtDeRoHfRxM7HpMBZdMyk7DwsyEvA
 SAPv7zXt0XZv6xDfpWzQAvpgLJM5M2B0MpyuLUQhshTlkFwFvnc+uTXBfg0nTsy46h2k
 Ui+7p7+wcVA9DY78VwfoLxZGWz6WtTn8fSbfz4IcBG0RF6kjkApWxSqZYQjyeP7hyqgx
 jrZCu1iSulZhiLphmKQ8ylvfbhUsNi4QewdWbrN7vZXE/7JKQOpKjQuUMwvmmWwZusI/
 dtZnjqmSMi7xZcbCcah5N4VXtSU8HjxIGoGeG6n0pFlBSJSGa22CBVqq5DG+KMV6br3m
 YKEQ==
X-Gm-Message-State: APjAAAXv2L0pKScp8nvShF+ruGGVTQwl0JnapOdCsUGH0AoGYTSKzFSw
 nFCsPap6LVu82cR2t8G2lfQG/Q==
X-Google-Smtp-Source: APXvYqw3173tR8OJnH7al5jA8PaFzDc0m06p2OMqdGNlglcG7DnUvX7OdKToaLZx/yGxPWET+JAo5A==
X-Received: by 2002:a17:90a:35e6:: with SMTP id
 r93mr16413441pjb.20.1561257764914; 
 Sat, 22 Jun 2019 19:42:44 -0700 (PDT)
Received: from localhost.localdomain ([222.131.159.173])
 by smtp.gmail.com with ESMTPSA id o13sm7007146pje.28.2019.06.22.19.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 22 Jun 2019 19:42:44 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 23 Jun 2019 10:40:55 +0800
Message-Id: <1561257655-25907-3-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561257655-25907-1-git-send-email-hongbo.zhang@linaro.org>
References: <1561257655-25907-1-git-send-email-hongbo.zhang@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v8 2/2] hw/arm: Add arm SBSA reference machine,
 devices part
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
 leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the previous patch, this patch adds peripheral devices to the
newly introduced SBSA-ref machine.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/sbsa-ref.c | 523 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 517 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e68751e..3b2b9cb 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -18,21 +18,41 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/block/flash.h"
 #include "hw/boards.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/ahci_internal.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/loader.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/usb.h"
+#include "net/net.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
 
+#define NUM_IRQS        256
+#define NUM_SMMU_IRQS   4
+#define NUM_SATA_PORTS  6
+
+#define VIRTUAL_PMU_IRQ        7
+#define ARCH_GIC_MAINT_IRQ     9
+#define ARCH_TIMER_VIRT_IRQ    11
+#define ARCH_TIMER_S_EL1_IRQ   13
+#define ARCH_TIMER_NS_EL1_IRQ  14
+#define ARCH_TIMER_NS_EL2_IRQ  10
+
 enum {
     SBSA_FLASH,
     SBSA_MEM,
@@ -67,6 +87,7 @@ typedef struct {
     void *fdt;
     int fdt_size;
     int psci_conduit;
+    PFlashCFI01 *flash[2];
 } SBSAMachineState;
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
@@ -113,6 +134,455 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_EHCI] = 11,
 };
 
+/*
+ * Firmware on this machine only uses ACPI table to load OS, these limited
+ * device tree nodes are just to let firmware know the info which varies from
+ * command line parameters, so it is not necessary to be fully compatible
+ * with the kernel CPU and NUMA binding rules.
+ */
+static void create_fdt(SBSAMachineState *sms)
+{
+    void *fdt = create_device_tree(&sms->fdt_size);
+    const MachineState *ms = MACHINE(sms);
+    int cpu;
+
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    sms->fdt = fdt;
+
+    qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,sbsa-ref");
+    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+
+    if (have_numa_distance) {
+        int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
+        uint32_t *matrix = g_malloc0(size);
+        int idx, i, j;
+
+        for (i = 0; i < nb_numa_nodes; i++) {
+            for (j = 0; j < nb_numa_nodes; j++) {
+                idx = (i * nb_numa_nodes + j) * 3;
+                matrix[idx + 0] = cpu_to_be32(i);
+                matrix[idx + 1] = cpu_to_be32(j);
+                matrix[idx + 2] = cpu_to_be32(numa_info[i].distance[j]);
+            }
+        }
+
+        qemu_fdt_add_subnode(fdt, "/distance-map");
+        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
+                         matrix, size);
+        g_free(matrix);
+    }
+
+    qemu_fdt_add_subnode(sms->fdt, "/cpus");
+
+    for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
+        char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
+        CPUState *cs = CPU(armcpu);
+
+        qemu_fdt_add_subnode(sms->fdt, nodename);
+
+        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
+            qemu_fdt_setprop_cell(sms->fdt, nodename, "numa-node-id",
+                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
+        }
+
+        g_free(nodename);
+    }
+}
+
+#define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
+
+static PFlashCFI01 *sbsa_flash_create1(SBSAMachineState *sms,
+                                        const char *name,
+                                        const char *alias_prop_name)
+{
+    /*
+     * Create a single flash device.  We use the same parameters as
+     * the flash devices on the Versatile Express board.
+     */
+    DeviceState *dev = qdev_create(NULL, TYPE_PFLASH_CFI01);
+
+    qdev_prop_set_uint64(dev, "sector-length", SBSA_FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x89);
+    qdev_prop_set_uint16(dev, "id1", 0x18);
+    qdev_prop_set_uint16(dev, "id2", 0x00);
+    qdev_prop_set_uint16(dev, "id3", 0x00);
+    qdev_prop_set_string(dev, "name", name);
+    object_property_add_child(OBJECT(sms), name, OBJECT(dev),
+                              &error_abort);
+    object_property_add_alias(OBJECT(sms), alias_prop_name,
+                              OBJECT(dev), "drive", &error_abort);
+    return PFLASH_CFI01(dev);
+}
+
+static void sbsa_flash_create(SBSAMachineState *sms)
+{
+    sms->flash[0] = sbsa_flash_create1(sms, "sbsa.flash0", "pflash0");
+    sms->flash[1] = sbsa_flash_create1(sms, "sbsa.flash1", "pflash1");
+}
+
+static void sbsa_flash_map1(PFlashCFI01 *flash,
+                            hwaddr base, hwaddr size,
+                            MemoryRegion *sysmem)
+{
+    DeviceState *dev = DEVICE(flash);
+
+    assert(size % SBSA_FLASH_SECTOR_SIZE == 0);
+    assert(size / SBSA_FLASH_SECTOR_SIZE <= UINT32_MAX);
+    qdev_prop_set_uint32(dev, "num-blocks", size / SBSA_FLASH_SECTOR_SIZE);
+    qdev_init_nofail(dev);
+
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       0));
+}
+
+static void sbsa_flash_map(SBSAMachineState *sms,
+                           MemoryRegion *sysmem,
+                           MemoryRegion *secure_sysmem)
+{
+    /*
+     * Map two flash devices to fill the SBSA_FLASH space in the memmap.
+     * sysmem is the system memory space. secure_sysmem is the secure view
+     * of the system, and the first flash device should be made visible only
+     * there. The second flash device is visible to both secure and nonsecure.
+     * If sysmem == secure_sysmem this means there is no separate Secure
+     * address space and both flash devices are generally visible.
+     */
+    hwaddr flashsize = sbsa_ref_memmap[SBSA_FLASH].size / 2;
+    hwaddr flashbase = sbsa_ref_memmap[SBSA_FLASH].base;
+
+    sbsa_flash_map1(sms->flash[0], flashbase, flashsize,
+                    secure_sysmem);
+    sbsa_flash_map1(sms->flash[1], flashbase + flashsize, flashsize,
+                    sysmem);
+}
+
+static bool sbsa_firmware_init(SBSAMachineState *sms,
+                               MemoryRegion *sysmem,
+                               MemoryRegion *secure_sysmem)
+{
+    int i;
+    BlockBackend *pflash_blk0;
+
+    /* Map legacy -drive if=pflash to machine properties */
+    for (i = 0; i < ARRAY_SIZE(sms->flash); i++) {
+        pflash_cfi01_legacy_drive(sms->flash[i],
+                                  drive_get(IF_PFLASH, 0, i));
+    }
+
+    sbsa_flash_map(sms, sysmem, secure_sysmem);
+
+    pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
+
+    if (bios_name) {
+        char *fname;
+        MemoryRegion *mr;
+        int image_size;
+
+        if (pflash_blk0) {
+            error_report("The contents of the first flash device may be "
+                         "specified with -bios or with -drive if=pflash... "
+                         "but you cannot use both options at once");
+            exit(1);
+        }
+
+        /* Fall back to -bios */
+
+        fname = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        if (!fname) {
+            error_report("Could not find ROM image '%s'", bios_name);
+            exit(1);
+        }
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(sms->flash[0]), 0);
+        image_size = load_image_mr(fname, mr);
+        g_free(fname);
+        if (image_size < 0) {
+            error_report("Could not load ROM image '%s'", bios_name);
+            exit(1);
+        }
+    }
+
+    return pflash_blk0 || bios_name;
+}
+
+static void create_secure_ram(SBSAMachineState *sms,
+                              MemoryRegion *secure_sysmem)
+{
+    MemoryRegion *secram = g_new(MemoryRegion, 1);
+    hwaddr base = sbsa_ref_memmap[SBSA_SECURE_MEM].base;
+    hwaddr size = sbsa_ref_memmap[SBSA_SECURE_MEM].size;
+
+    memory_region_init_ram(secram, NULL, "sbsa-ref.secure-ram", size,
+                           &error_fatal);
+    memory_region_add_subregion(secure_sysmem, base, secram);
+}
+
+static void create_gic(SBSAMachineState *sms, qemu_irq *pic)
+{
+    DeviceState *gicdev;
+    SysBusDevice *gicbusdev;
+    const char *gictype;
+    uint32_t redist0_capacity, redist0_count;
+    int i;
+
+    gictype = gicv3_class_name();
+
+    gicdev = qdev_create(NULL, gictype);
+    qdev_prop_set_uint32(gicdev, "revision", 3);
+    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
+    /*
+     * Note that the num-irq property counts both internal and external
+     * interrupts; there are always 32 of the former (mandated by GIC spec).
+     */
+    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
+    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+
+    redist0_capacity =
+                sbsa_ref_memmap[SBSA_GIC_REDIST].size / GICV3_REDIST_SIZE;
+    redist0_count = MIN(smp_cpus, redist0_capacity);
+
+    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+
+    qdev_init_nofail(gicdev);
+    gicbusdev = SYS_BUS_DEVICE(gicdev);
+    sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
+    sysbus_mmio_map(gicbusdev, 1, sbsa_ref_memmap[SBSA_GIC_REDIST].base);
+
+    /*
+     * Wire the outputs from each CPU's generic timer and the GICv3
+     * maintenance interrupt signal to the appropriate GIC PPI inputs,
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     */
+    for (i = 0; i < smp_cpus; i++) {
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
+        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        int irq;
+        /*
+         * Mapping from the output timer irq lines from the CPU to the
+         * GIC PPI inputs used for this board.
+         */
+        const int timer_irq[] = {
+            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+        };
+
+        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+            qdev_connect_gpio_out(cpudev, irq,
+                                  qdev_get_gpio_in(gicdev,
+                                                   ppibase + timer_irq[irq]));
+        }
+
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
+                                    qdev_get_gpio_in(gicdev, ppibase
+                                                     + ARCH_GIC_MAINT_IRQ));
+        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                    qdev_get_gpio_in(gicdev, ppibase
+                                                     + VIRTUAL_PMU_IRQ));
+
+        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+    }
+
+    for (i = 0; i < NUM_IRQS; i++) {
+        pic[i] = qdev_get_gpio_in(gicdev, i);
+    }
+}
+
+static void create_uart(const SBSAMachineState *sms, qemu_irq *pic, int uart,
+                        MemoryRegion *mem, Chardev *chr)
+{
+    hwaddr base = sbsa_ref_memmap[uart].base;
+    int irq = sbsa_ref_irqmap[uart];
+    DeviceState *dev = qdev_create(NULL, "pl011");
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    memory_region_add_subregion(mem, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, pic[irq]);
+}
+
+static void create_rtc(const SBSAMachineState *sms, qemu_irq *pic)
+{
+    hwaddr base = sbsa_ref_memmap[SBSA_RTC].base;
+    int irq = sbsa_ref_irqmap[SBSA_RTC];
+
+    sysbus_create_simple("pl031", base, pic[irq]);
+}
+
+static DeviceState *gpio_key_dev;
+static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
+{
+    /* use gpio Pin 3 for power button event */
+    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+}
+
+static Notifier sbsa_ref_powerdown_notifier = {
+    .notify = sbsa_ref_powerdown_req
+};
+
+static void create_gpio(const SBSAMachineState *sms, qemu_irq *pic)
+{
+    DeviceState *pl061_dev;
+    hwaddr base = sbsa_ref_memmap[SBSA_GPIO].base;
+    int irq = sbsa_ref_irqmap[SBSA_GPIO];
+
+    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
+
+    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    /* connect powerdown request */
+    qemu_register_powerdown_notifier(&sbsa_ref_powerdown_notifier);
+}
+
+static void create_ahci(const SBSAMachineState *sms, qemu_irq *pic)
+{
+    hwaddr base = sbsa_ref_memmap[SBSA_AHCI].base;
+    int irq = sbsa_ref_irqmap[SBSA_AHCI];
+    DeviceState *dev;
+    DriveInfo *hd[NUM_SATA_PORTS];
+    SysbusAHCIState *sysahci;
+    AHCIState *ahci;
+    int i;
+
+    dev = qdev_create(NULL, "sysbus-ahci");
+    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
+
+    sysahci = SYSBUS_AHCI(dev);
+    ahci = &sysahci->ahci;
+    ide_drive_get(hd, ARRAY_SIZE(hd));
+    for (i = 0; i < ahci->ports; i++) {
+        if (hd[i] == NULL) {
+            continue;
+        }
+        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+    }
+}
+
+static void create_ehci(const SBSAMachineState *sms, qemu_irq *pic)
+{
+    hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
+    int irq = sbsa_ref_irqmap[SBSA_EHCI];
+
+    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
+}
+
+static void create_smmu(const SBSAMachineState *sms, qemu_irq *pic,
+                        PCIBus *bus)
+{
+    hwaddr base = sbsa_ref_memmap[SBSA_SMMU].base;
+    int irq =  sbsa_ref_irqmap[SBSA_SMMU];
+    DeviceState *dev;
+    int i;
+
+    dev = qdev_create(NULL, "arm-smmuv3");
+
+    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
+                             &error_abort);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    for (i = 0; i < NUM_SMMU_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+    }
+}
+
+static void create_pcie(SBSAMachineState *sms, qemu_irq *pic)
+{
+    hwaddr base_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
+    hwaddr size_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].size;
+    hwaddr base_mmio = sbsa_ref_memmap[SBSA_PCIE_MMIO].base;
+    hwaddr size_mmio = sbsa_ref_memmap[SBSA_PCIE_MMIO].size;
+    hwaddr base_mmio_high = sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].base;
+    hwaddr size_mmio_high = sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size;
+    hwaddr base_pio = sbsa_ref_memmap[SBSA_PCIE_PIO].base;
+    int irq = sbsa_ref_irqmap[SBSA_PCIE];
+    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    DeviceState *dev;
+    PCIHostState *pci;
+    int i;
+
+    dev = qdev_create(NULL, TYPE_GPEX_HOST);
+    qdev_init_nofail(dev);
+
+    /* Map ECAM space */
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, size_ecam);
+    memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
+
+    /* Map the MMIO space */
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, base_mmio, size_mmio);
+    memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
+
+    /* Map the MMIO_HIGH space */
+    mmio_alias_high = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, base_mmio_high, size_mmio_high);
+    memory_region_add_subregion(get_system_memory(), base_mmio_high,
+                                mmio_alias_high);
+
+    /* Map IO port space */
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
+    }
+
+    pci = PCI_HOST_BRIDGE(dev);
+    if (pci->bus) {
+        for (i = 0; i < nb_nics; i++) {
+            NICInfo *nd = &nd_table[i];
+
+            if (!nd->model) {
+                nd->model = g_strdup("e1000e");
+            }
+
+            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
+        }
+    }
+
+    pci_create_simple(pci->bus, -1, "VGA");
+
+    create_smmu(sms, pic, pci->bus);
+}
+
+static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
+{
+    const SBSAMachineState *board = container_of(binfo, SBSAMachineState,
+                                                 bootinfo);
+
+    *fdt_size = board->fdt_size;
+    return board->fdt;
+}
+
 static void sbsa_ref_init(MachineState *machine)
 {
     SBSAMachineState *sms = SBSA_MACHINE(machine);
@@ -120,9 +590,10 @@ static void sbsa_ref_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
-    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
+    qemu_irq pic[NUM_IRQS];
 
     if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
         error_report("sbsa-ref: CPU type other than the built-in "
@@ -135,6 +606,20 @@ static void sbsa_ref_init(MachineState *machine)
         exit(1);
     }
 
+    /*
+     * The Secure view of the world is the same as the NonSecure,
+     * but with a few extra devices. Create it as a container region
+     * containing the system memory at low priority; any secure-only
+     * devices go in at higher priority and take precedence.
+     */
+    secure_sysmem = g_new(MemoryRegion, 1);
+    memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
+                       UINT64_MAX);
+    memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
+
+    firmware_loaded = sbsa_firmware_init(sms, sysmem,
+                                         secure_sysmem ?: sysmem);
+
     if (machine->kernel_filename && firmware_loaded) {
         error_report("sbsa-ref: No fw_cfg device on this machine, "
                      "so -kernel option is not supported when firmware loaded, "
@@ -164,11 +649,6 @@ static void sbsa_ref_init(MachineState *machine)
         exit(1);
     }
 
-    secure_sysmem = g_new(MemoryRegion, 1);
-    memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
-                       UINT64_MAX);
-    memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
@@ -208,11 +688,33 @@ static void sbsa_ref_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base, ram);
 
+    create_fdt(sms);
+
+    create_secure_ram(sms, secure_sysmem);
+
+    create_gic(sms, pic);
+
+    create_uart(sms, pic, SBSA_UART, sysmem, serial_hd(0));
+    create_uart(sms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
+    /* Second secure UART for RAS and MM from EL0 */
+    create_uart(sms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));
+
+    create_rtc(sms, pic);
+
+    create_gpio(sms, pic);
+
+    create_ahci(sms, pic);
+
+    create_ehci(sms, pic);
+
+    create_pcie(sms, pic);
+
     sms->bootinfo.ram_size = machine->ram_size;
     sms->bootinfo.kernel_filename = machine->kernel_filename;
     sms->bootinfo.nb_cpus = smp_cpus;
     sms->bootinfo.board_id = -1;
     sms->bootinfo.loader_start = sbsa_ref_memmap[SBSA_MEM].base;
+    sms->bootinfo.get_dtb = sbsa_ref_dtb;
     sms->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &sms->bootinfo);
 }
@@ -262,6 +764,13 @@ sbsa_ref_get_default_cpu_node_id(const MachineState *ms, int idx)
     return idx % nb_numa_nodes;
 }
 
+static void sbsa_ref_instance_init(Object *obj)
+{
+    SBSAMachineState *sms = SBSA_MACHINE(obj);
+
+    sbsa_flash_create(sms);
+}
+
 static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -284,6 +793,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 static const TypeInfo sbsa_ref_info = {
     .name          = TYPE_SBSA_MACHINE,
     .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(SBSAMachineState),
+    .instance_init = sbsa_ref_instance_init,
     .class_init    = sbsa_ref_class_init,
 };
 
-- 
2.7.4


