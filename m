Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060857A684
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:31:56 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDs0h-0002j0-Ep
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXZ-0000Jz-CA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:49 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXU-0006IE-E4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:48 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u76so7655749oie.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+hSw+rcLUEhJ5nun6ANeEAP/n61x1MPgsJo6q4i9pd8=;
 b=MnbZ882pqE2v2I3wKukVCgIlKoifS/0QeKQqzPWuOZdQEVd9FmCx5VxWe4Na+hoXAW
 QfGT17QMsWcNBuSxgesU4eoi7at39XQUpEcRr6HTWc2mSk49tknlCS6qamU7NjmOEqlE
 RMSq/x0gH1lgTcKxWcsyxt7H2OUuNf+fs4uIOccQWdatcznbsp8uykAGdm/7gTQZBB2G
 sS7j2zfGZHDKG3n4AAE1/kHyQHNPmNq4lhW/QOx7BXHIfxAX6a9E7SD3oLxecqPORR3U
 CSoNsTCIybuebIlx5OJvhCsQsLV9bvaebUUR/Bx+CDi7G93SWftSRpf2Ebp8TYWdcxol
 NN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+hSw+rcLUEhJ5nun6ANeEAP/n61x1MPgsJo6q4i9pd8=;
 b=vYIP5AMPwDK2BJaD9ObTuAe8fOUzpj5WElGztVGYdo9oNyLhMq5JQNMHJuzCOx6uTa
 sn57ZssLf/tEoJQyxggAhMu0CLQjqQuIOtQFcfUgnG+ir3jug7TIhLs4SYf7/drJDSPm
 WOy2XzPUtUp/UA6DffDiLs4WGSnnX/RsVIPIrbqQvQUGY0gHntUwN/1LZGNSAmk7xYtV
 j2Zqwq56R3Mzi32pTBgMtgbCUQpvz8/7JGNiccfO0N4izWtxbzxX8paIDvv6JLcUZ1Qe
 T+zY2OhAT+9HD3yMLbgklo3uwVLLI5rV9QFEmpYnYlWt63EJi7mgphFjPBUhflANDpPl
 hurQ==
X-Gm-Message-State: AJIora9opvfkLWZXaht54cV7LWPViK3yPm3awXy9e0EX2ECAF2HTcLVC
 wk28MjWUvWZ3FIfctv8GJ/WSeIWszF6iKRaQ
X-Google-Smtp-Source: AGRyM1tCkHaEcemVWE0iqiWBdKpRghvDYne/OBRxQ+XFE24yuK9eBQDntQc//hKI0B4PAJiwGwaFog==
X-Received: by 2002:a05:6808:1b1f:b0:33a:9bfb:4919 with SMTP id
 bx31-20020a0568081b1f00b0033a9bfb4919mr342434oib.170.1658253703673; 
 Tue, 19 Jul 2022 11:01:43 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 21/21] hw/loongarch: Add fdt support
Date: Tue, 19 Jul 2022 23:30:00 +0530
Message-Id: <20220719180000.378186-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add LoongArch flatted device tree, adding cpu device node, firmware cfg node,
pcie node into it, and create fdt rom memory region. Now fdt info is not
full since only uefi bios uses fdt, linux kernel does not use fdt.
Loongarch Linux kernel uses acpi table which is full in qemu virt
machine.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220712083206.4187715-7-yangxiaojuan@loongson.cn>
[rth: Set TARGET_NEED_FDT, add fdt to meson.build]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/loongarch64-softmmu.mak |   1 +
 include/hw/loongarch/virt.h             |   4 +
 target/loongarch/cpu.h                  |   3 +
 hw/loongarch/loongson3.c                | 136 +++++++++++++++++++++++-
 target/loongarch/cpu.c                  |   1 +
 hw/loongarch/meson.build                |   2 +-
 6 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
index 7bc06c850c..483474ba93 100644
--- a/configs/targets/loongarch64-softmmu.mak
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=loongarch64
 TARGET_BASE_ARCH=loongarch
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
+TARGET_NEED_FDT=y
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index fb4a4f4e7b..f4f24df428 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -28,6 +28,9 @@
 #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
 #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
 
+#define LA_FDT_BASE             0x1c400000
+#define LA_FDT_SIZE             0x100000
+
 struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -45,6 +48,7 @@ struct LoongArchMachineState {
     char         *oem_id;
     char         *oem_table_id;
     DeviceState  *acpi_ged;
+    int          fdt_size;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index d141ec9b5d..a36349df83 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -326,6 +326,9 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
     QEMUTimer timer;
+
+    /* 'compatible' string for this CPU for Linux device trees */
+    const char *dtb_compatible;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 3ec8cda8a1..a08dc9d299 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -35,6 +35,129 @@
 #include "qapi/qapi-visit-common.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/mem/nvdimm.h"
+#include "sysemu/device_tree.h"
+#include <libfdt.h>
+
+static void create_fdt(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+
+    ms->fdt = create_device_tree(&lams->fdt_size);
+    if (!ms->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    /* Header */
+    qemu_fdt_setprop_string(ms->fdt, "/", "compatible",
+                            "linux,dummy-loongson3");
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
+}
+
+static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
+{
+    int num;
+    const MachineState *ms = MACHINE(lams);
+    int smp_cpus = ms->smp.cpus;
+
+    qemu_fdt_add_subnode(ms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
+
+    /* cpu nodes */
+    for (num = smp_cpus - 1; num >= 0; num--) {
+        char *nodename = g_strdup_printf("/cpus/cpu@%d", num);
+        LoongArchCPU *cpu = LOONGARCH_CPU(qemu_get_cpu(num));
+
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "cpu");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
+                                cpu->dtb_compatible);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "reg", num);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                              qemu_fdt_alloc_phandle(ms->fdt));
+        g_free(nodename);
+    }
+
+    /*cpu map */
+    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+
+    for (num = smp_cpus - 1; num >= 0; num--) {
+        char *cpu_path = g_strdup_printf("/cpus/cpu@%d", num);
+        char *map_path;
+
+        if (ms->smp.threads > 1) {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/core%d/thread%d",
+                num / (ms->smp.cores * ms->smp.threads),
+                (num / ms->smp.threads) % ms->smp.cores,
+                num % ms->smp.threads);
+        } else {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/core%d",
+                num / ms->smp.cores,
+                num % ms->smp.cores);
+        }
+        qemu_fdt_add_path(ms->fdt, map_path);
+        qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+
+        g_free(map_path);
+        g_free(cpu_path);
+    }
+}
+
+static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_FWCFG_BASE;
+    const MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/fw_cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, 0x8);
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+}
+
+static void fdt_add_pcie_node(const LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base_mmio = LS7A_PCI_MEM_BASE;
+    hwaddr size_mmio = LS7A_PCI_MEM_SIZE;
+    hwaddr base_pio = LS7A_PCI_IO_BASE;
+    hwaddr size_pio = LS7A_PCI_IO_SIZE;
+    hwaddr base_pcie = LS_PCIECFG_BASE;
+    hwaddr size_pcie = LS_PCIECFG_SIZE;
+    hwaddr base = base_pcie;
+
+    const MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
+                            "compatible", "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 3);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
+                           PCIE_MMCFG_BUS(LS_PCIECFG_SIZE - 1));
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base_pcie, 2, size_pcie);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
+                                 1, FDT_PCI_RANGE_IOPORT, 2, LS7A_PCI_IO_OFFSET,
+                                 2, base_pio, 2, size_pio,
+                                 1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
+                                 2, base_mmio, 2, size_mmio);
+    g_free(nodename);
+    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
+}
+
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
@@ -524,12 +647,12 @@ static void loongarch_init(MachineState *machine)
         error_report("ram_size must be greater than 1G.");
         exit(1);
     }
-
+    create_fdt(lams);
     /* Init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
         cpu_create(machine->cpu_type);
     }
-
+    fdt_add_cpu_nodes(lams);
     /* Add memory region */
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
                              machine->ram, 0, 256 * MiB);
@@ -552,12 +675,12 @@ static void loongarch_init(MachineState *machine)
     /* fw_cfg init */
     lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
     rom_set_fw(lams->fw_cfg);
-
     if (lams->fw_cfg != NULL) {
         fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
                         memmap_table,
                         sizeof(struct memmap_entry) * (memmap_entries));
     }
+    fdt_add_fw_cfg_node(lams);
     loaderparams.ram_size = ram_size;
     loaderparams.kernel_filename = machine->kernel_filename;
     loaderparams.kernel_cmdline = machine->kernel_cmdline;
@@ -579,6 +702,13 @@ static void loongarch_init(MachineState *machine)
     loongarch_irq_init(lams);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
+    fdt_add_pcie_node(lams);
+
+    /* load fdt */
+    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
+    memory_region_init_rom(fdt_rom, NULL, "fdt", LA_FDT_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), LA_FDT_BASE, fdt_rom);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, LA_FDT_BASE);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1415793d6f..1c69a76f2b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -341,6 +341,7 @@ static void loongarch_la464_initfn(Object *obj)
         env->cpucfg[i] = 0x0;
     }
 
+    cpu->dtb_compatible = "loongarch,Loongson-3A5000";
     env->cpucfg[0] = 0x14c010;  /* PRID */
 
     uint32_t data = 0;
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 3e7cbcfc05..6a2a1b18e5 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -2,7 +2,7 @@ loongarch_ss = ss.source_set()
 loongarch_ss.add(files(
     'fw_cfg.c',
 ))
-loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
+loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: [files('loongson3.c'), fdt])
 loongarch_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-build.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
-- 
2.34.1


