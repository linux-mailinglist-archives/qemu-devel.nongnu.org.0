Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0456AACFE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 23:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYaW9-0001cj-9b; Sat, 04 Mar 2023 17:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW6-0001cR-No
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:14 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW2-0005ru-UX
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:14 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 70C9D5C00E1;
 Sat,  4 Mar 2023 17:38:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 04 Mar 2023 17:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677969489; x=
 1678055889; bh=Fjox/kYHdq2WYuahA8/GuOd5OACsAFtAxSBgAe0aoqk=; b=L
 mkjiFwfUhAa/9rnTy0x+0Gkh4YOa4rOXvcTdEpkFY428l37RP5oiljn36wz9dz7/
 AEaxPNRr1Y9wK0K4whImzg/hM1svsfHH78e5TyRjAhp4sWkmNbz3l7HbU4L1YWi7
 XJ2YtO4vSMWWSagEbz6v1Ob4fsXOzmJ2JefJM0DKuI+5hlm+SgO3oV+o9Y9yegbT
 wefP2Wxlp77zKdBJ79cMyfqDru27mrCk12Za/oq94eRivvN66cEgAFs8YIlracrO
 PPVcpZSJ9HpJnbTmsfBVIzXISZ9q7Tfluy0xTpOAuG7L8zwOWEWrKkuB7V+tUd1A
 4eSMezkAcvMTZZhW383Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677969489; x=
 1678055889; bh=Fjox/kYHdq2WYuahA8/GuOd5OACsAFtAxSBgAe0aoqk=; b=Z
 AcuDPuoef+2V6KuQzsSQ6/QVleyizCd5H54ff0BGRegb4Hm5FEEPkF0gTBkFxz1V
 fDOS+nx+KFkIqHUB9c4bLWU14gKxmfZeiT7mvSXzZBUtV55Vdb3AmYKlzL8a52YA
 og6fpzlhlRWZRmxVF44oY7X8mHt3hdsywPqLF2PjWXPLoLS10iMiSylej4fZFg80
 HAGLX2mP97AxW47fxaZ2Cw1kcM3tjqvHNVjTJPsXSPSkdSpSu5ajEC9vRw9RZ70M
 Ec+GtUcX7AoZ/5HvdDkS1Ra4EA0uvAY7gx7W4ZVXeQRX+fK/TG0baEQuJ4JBMxcu
 /u8uKafZt2cxyxo5X+OFA==
X-ME-Sender: <xms:UcgDZBS1VhMsHZA_eXCWVqKDSBcdAsTC6bihFJ7QaeNmwuwWSvj3Rw>
 <xme:UcgDZKwtAbEsvXsiDI4mBSkR2saxkH_I8XivMIsdWK3vvXzPrGitKwgQii5AYKMju
 dw2Aqfof1cY3_z3DVw>
X-ME-Received: <xmr:UcgDZG1SeaZ15PGaxZhkQ0LJNOSpJYZfSmIdNe0diqdrcnqujiNsWhMukJyp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:UcgDZJByFakAHVMOJFrPiOAMbqB6-62SqF709u6HGyXebaXkXSlLlg>
 <xmx:UcgDZKjrEvz2kJSkso9ifXT7J9t-cEzvy5rdVCD9lUS71wvjjd_N5g>
 <xmx:UcgDZNrijcMscj1IST5falgFyyeMARq_MfdmK5GES2eJcfsP9go58Q>
 <xmx:UcgDZCJw45QEz7YIy0KfolGHjxvQAOBjLsB3ZBG6gXvxEMS1jXcIlA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:38:08 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/2] hw/mips: Add MIPS virt board
Date: Sat,  4 Mar 2023 22:38:03 +0000
Message-Id: <20230304223803.55764-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MIPS virt board is design to utilize existing VirtIO infrastures
but also comptitable with MIPS's existing internal simulation tools.

It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
goldfish-rtc and MIPS CPS system.

It should be able to cooperate with any MIPS CPU cores.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v1:
 - Rename to virt board
 - Convert BIOS flash to ROM
 - Cleanups
v2:
 - Fix fdt flash
 - Remove UP variant
---
 MAINTAINERS                             |   7 +
 configs/devices/mips-softmmu/common.mak |   1 +
 docs/system/target-mips.rst             |  22 +
 hw/mips/Kconfig                         |  17 +
 hw/mips/meson.build                     |   1 +
 hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
 6 files changed, 964 insertions(+)
 create mode 100644 hw/mips/virt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9adb6286279d..6884eaa78a76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1296,6 +1296,13 @@ F: hw/mips/boston.c
 F: hw/pci-host/xilinx-pcie.c
 F: include/hw/pci-host/xilinx-pcie.h
 
+Virt
+M: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Maintained
+F: hw/mips/virt.c
+F: hw/misc/mips_trickbox.c
+F: include/hw/misc/mips_trickbox.h
+
 OpenRISC Machines
 -----------------
 or1k-sim
diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 7da99327a779..eb2c32b7c175 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -24,6 +24,7 @@ CONFIG_I8259=y
 CONFIG_MC146818RTC=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
+CONFIG_MIPS_VIRT=y
 CONFIG_MALTA=y
 CONFIG_PCNET_PCI=y
 CONFIG_MIPSSIM=y
diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
index 138441bdec1c..a11f08ab00a3 100644
--- a/docs/system/target-mips.rst
+++ b/docs/system/target-mips.rst
@@ -10,6 +10,8 @@ machine types are emulated:
 
 -  A generic ISA PC-like machine \"mips\"
 
+-  Generic Virtual Platform \"virt\"
+
 -  The MIPS Malta prototype board \"malta\"
 
 -  An ACER Pica \"pica61\". This machine needs the 64-bit emulator.
@@ -31,6 +33,26 @@ emulated:
 
 -  NE2000 network card
 
+The virt machine supports the following devices:
+
+- A range of MIPS CPUs, default is the P5600 (32-bit) or I6400 (64-bit)
+
+- MIPS CM (Coherence Manager)
+
+- CFI parallel NOR flash memory
+
+- 1 NS16550 compatible UART
+
+- 1 Google Goldfish RTC
+
+- 1 MIPS Trickbox device
+
+- 8 virtio-mmio transport devices
+
+- 1 generic PCIe host bridge
+
+- The fw_cfg device that allows a guest to obtain data from QEMU
+
 The Malta emulation supports the following devices:
 
 -  Core board with MIPS 24Kf CPU and Galileo system controller
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index da3a37e215ec..8a753ec2aee2 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -59,5 +59,22 @@ config MIPS_BOSTON
     select AHCI_ICH9
     select SERIAL
 
+config MIPS_VIRT
+    bool
+    imply PCI_DEVICES
+    imply VIRTIO_VGA
+    imply TEST_DEVICES
+    select MIPS_CPS
+    select MIPS_TRICKBOX
+    select SERIAL
+    select FW_CFG_MIPS
+    select GOLDFISH_RTC
+    select PCI
+    select PCI_EXPRESS_GENERIC_BRIDGE
+    select PFLASH_CFI01
+    select VIRTIO_MMIO
+    select FW_CFG_DMA
+    select PLATFORM_BUS
+
 config FW_CFG_MIPS
     bool
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 900613fc087f..5670c939fa7b 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,6 +1,7 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
+mips_ss.add(when: 'CONFIG_MIPS_VIRT', if_true: files('virt.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
diff --git a/hw/mips/virt.c b/hw/mips/virt.c
new file mode 100644
index 000000000000..e4359f930104
--- /dev/null
+++ b/hw/mips/virt.c
@@ -0,0 +1,916 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * QEMU MIPS Virt Board
+ * Copyright (C) 2022 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/datadir.h"
+
+#include "chardev/char.h"
+#include "hw/block/flash.h"
+#include "hw/boards.h"
+#include "hw/char/serial.h"
+#include "hw/core/sysbus-fdt.h"
+#include "hw/display/ramfb.h"
+#include "hw/intc/goldfish_pic.h"
+#include "hw/loader-fit.h"
+#include "hw/loader.h"
+#include "hw/mips/bootloader.h"
+#include "hw/mips/cps.h"
+#include "hw/mips/cpudevs.h"
+#include "hw/mips/mips.h"
+#include "hw/misc/mips_trickbox.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/pci/pci.h"
+#include "hw/platform-bus.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/rtc/goldfish_rtc.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/guest-random.h"
+#include "qemu/log.h"
+#include "sysemu/device_tree.h"
+#include "sysemu/kvm.h"
+#include "sysemu/qtest.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
+#include "sysemu/tpm.h"
+#include "elf.h"
+
+#include "qom/object.h"
+#include <libfdt.h>
+
+#define TYPE_MIPS_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+typedef struct MIPSVirtState MIPSVirtState;
+DECLARE_INSTANCE_CHECKER(MIPSVirtState, MIPS_VIRT_MACHINE,
+                         TYPE_MIPS_VIRT_MACHINE)
+
+#define FDT_IRQ_TYPE_NONE 0
+#define FDT_IRQ_TYPE_LEVEL_HIGH 4
+#define FDT_GIC_SHARED 0
+#define FDT_GIC_LOCAL 1
+#define FDT_VIRT_CLK_SYS 1
+#define FDT_VIRT_CLK_CPU 2
+#define FDT_PCI_IRQ_MAP_PINS 4
+#define FDT_PCI_IRQ_MAP_DESCS 6
+
+#define FDT_PCI_ADDR_CELLS 3
+#define FDT_PCI_INT_CELLS 1
+#define FDT_MAX_INT_CELLS 3
+#define FDT_MAX_INT_MAP_WIDTH \
+    (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 + FDT_MAX_INT_CELLS)
+
+#define VIRT_CPU_REF_CLK_FREQ 100000000
+
+struct MIPSVirtState {
+    MachineState parent;
+
+    Notifier machine_done;
+    Clock *cpuclk;
+    DeviceState *platform_bus_dev;
+    MIPSCPSState *cps;
+    DeviceState *pic;
+    PFlashCFI01 *flash;
+    MemoryRegion *rom;
+    FWCfgState *fw_cfg;
+    int fdt_size;
+};
+
+enum {
+    VIRT_LOMEM,
+    VIRT_ROM,
+    VIRT_FLASH,
+    VIRT_PLATFORM_BUS,
+    VIRT_CM,
+    VIRT_GIC,
+    VIRT_CDMM,
+    VIRT_CPC,
+    VIRT_PCIE_PIO,
+    VIRT_PCIE_ECAM,
+    VIRT_ROM_BOOT,
+    VIRT_FW_CFG,
+    VIRT_RTC,
+    VIRT_VIRTIO,
+    VIRT_UART0,
+    VIRT_TRICKBOX,
+    VIRT_PCIE_MMIO,
+    VIRT_HIGHMEM
+};
+
+static const MemMapEntry virt_memmap[] = {
+    [VIRT_LOMEM] = { 0x0, 0x10000000 },
+    [VIRT_ROM] = { 0x10000000, 0x2000000 },
+    [VIRT_FLASH] = { 0x12000000, 0x2000000 },
+    [VIRT_PLATFORM_BUS] = { 0x14000000, 0x2000000 },
+    /* CPC CM GCRs */
+    [VIRT_CM] = { 0x16100000, 0x20000 },
+    [VIRT_GIC] = { 0x16120000, 0x20000 },
+    [VIRT_CDMM] = { 0x16140000, 0x8000 },
+    [VIRT_CPC] = { 0x16148000, 0x8000 },
+    /* Leave some space for CM GCR growth */
+    [VIRT_PCIE_PIO] = { 0x1a000000, 0x10000 },
+    [VIRT_PCIE_ECAM] = { 0x1b000000, 0x1000000 },
+    [VIRT_ROM_BOOT] = { 0x1fc00000, 0x300000 },
+    [VIRT_FW_CFG] = { 0x1ff00000, 0x100 },
+    [VIRT_RTC] = { 0x1ff01000, 0x100 },
+    [VIRT_VIRTIO] = { 0x1ff02000, 0x1000 }, /* 8 * virtio */
+    /* Align with MIPS AVP UART and Trickbox position */
+    [VIRT_UART0] = { 0x1ffff000, 0x100 },
+    [VIRT_TRICKBOX] = { 0x1fffff00, 0x100 },
+    [VIRT_PCIE_MMIO] = { 0x20000000, 0x20000000 },
+    [VIRT_HIGHMEM] = { 0x40000000, 0x0 }, /* Variable */
+};
+
+enum {
+    UART0_IRQ = 0,
+    RTC_IRQ = 1,
+    PCIE_IRQ = 2,
+    VIRTIO_IRQ = 7,
+    VIRTIO_COUNT = 8,
+    VIRT_PLATFORM_BUS_IRQ = 16
+};
+
+#define VIRT_PLATFORM_BUS_NUM_IRQS 16
+
+static void create_fdt_hypervisor(MIPSVirtState *s)
+{
+    MachineState *mc = MACHINE(s);
+
+    qemu_fdt_add_subnode(mc->fdt, "/hypervisor");
+    if (kvm_enabled()) {
+        qemu_fdt_setprop_string(mc->fdt, "/hypervisor", "compatible",
+                                "linux,kvm");
+    } else if (tcg_enabled()) {
+        qemu_fdt_setprop_string(mc->fdt, "/hypervisor", "compatible",
+                                "qemu,tcg");
+    }
+}
+
+static void create_fdt_memory(MIPSVirtState *s, const MemMapEntry *memmap)
+{
+    MachineState *mc = MACHINE(s);
+    char *name;
+
+    name = g_strdup_printf("/memory@0");
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "memory");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg", 2,
+                                 memmap[VIRT_LOMEM].base, 2,
+                                 MIN(memmap[VIRT_LOMEM].size, mc->ram_size));
+    g_free(name);
+
+    if (mc->ram_size > memmap[VIRT_LOMEM].size) {
+        name =
+            g_strdup_printf("/memory@%" HWADDR_PRIx, memmap[VIRT_HIGHMEM].base);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "device_type", "memory");
+        qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg", 2,
+                                     memmap[VIRT_HIGHMEM].base, 2,
+                                     mc->ram_size - memmap[VIRT_LOMEM].size);
+        g_free(name);
+    }
+}
+
+static void create_fdt_cpc(MIPSVirtState *s, const MemMapEntry *memmap,
+                           uint32_t clk_ph, uint32_t irq_ph)
+{
+    MachineState *mc = MACHINE(s);
+    char *name, *gic_name;
+
+    /* GIC with it's timer node */
+    gic_name = g_strdup_printf("/soc/interrupt-controller@%" HWADDR_PRIx,
+                               memmap[VIRT_GIC].base);
+    qemu_fdt_add_subnode(mc->fdt, gic_name);
+    qemu_fdt_setprop_string(mc->fdt, gic_name, "compatible", "mti,gic");
+    qemu_fdt_setprop_cells(mc->fdt, gic_name, "reg", 0x0, memmap[VIRT_GIC].base,
+                           0x0, memmap[VIRT_GIC].size);
+    qemu_fdt_setprop(mc->fdt, gic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mc->fdt, gic_name, "#interrupt-cells", 3);
+    qemu_fdt_setprop_cell(mc->fdt, gic_name, "phandle", irq_ph);
+
+    name = g_strdup_printf("%s/timer", gic_name);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "mti,gic-timer");
+    qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", FDT_GIC_LOCAL, 1,
+                           FDT_IRQ_TYPE_NONE);
+    qemu_fdt_setprop_cell(mc->fdt, name, "clocks", clk_ph);
+    g_free(name);
+    g_free(gic_name);
+
+    /* CM node */
+    name = g_strdup_printf("/soc/cm@%" HWADDR_PRIx, memmap[VIRT_CM].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "mti,mips-cm");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0, memmap[VIRT_CM].base,
+                           0x0, memmap[VIRT_CM].size);
+    g_free(name);
+
+    /* CDMM node */
+    name = g_strdup_printf("/soc/cdmm@%" HWADDR_PRIx, memmap[VIRT_CDMM].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "mti,mips-cdmm");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0, memmap[VIRT_CDMM].base,
+                           0x0, memmap[VIRT_CDMM].size);
+    g_free(name);
+
+    /* CPC node */
+    name = g_strdup_printf("/soc/cpc@%" HWADDR_PRIx, memmap[VIRT_CPC].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "mti,mips-cpc");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0, memmap[VIRT_CPC].base,
+                           0x0, memmap[VIRT_CPC].size);
+    g_free(name);
+}
+
+static void create_fdt_virtio(MIPSVirtState *s, const MemMapEntry *memmap,
+                              uint32_t irq_ph)
+{
+    int i;
+    char *name;
+    MachineState *mc = MACHINE(s);
+
+    for (i = 0; i < VIRTIO_COUNT; i++) {
+        name = g_strdup_printf(
+            "/soc/virtio_mmio@%lx",
+            (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size));
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "virtio,mmio");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0,
+                               memmap[VIRT_VIRTIO].base +
+                                   i * memmap[VIRT_VIRTIO].size,
+                               0x0, memmap[VIRT_VIRTIO].size);
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_ph);
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", FDT_GIC_SHARED,
+                                VIRTIO_IRQ + i, FDT_IRQ_TYPE_LEVEL_HIGH);
+        g_free(name);
+    }
+}
+
+static void create_pcie_irq_map(MIPSVirtState *s, void *fdt, char *nodename,
+                                uint32_t irq_ph)
+{
+    int pin, dev;
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                          FDT_MAX_INT_MAP_WIDTH] = {};
+    uint32_t *irq_map = full_irq_map;
+
+    /* This code creates a standard swizzle of interrupts such that
+     * each device's first interrupt is based on it's PCI_SLOT number.
+     * (See pci_swizzle_map_irq_fn())
+     *
+     * We only need one entry per interrupt in the table (not one per
+     * possible slot) seeing the interrupt-map-mask will allow the table
+     * to wrap to any number of devices.
+     */
+    for (dev = 0; dev < GPEX_NUM_IRQS; dev++) {
+        int devfn = dev * 0x8;
+
+        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
+            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
+            int i = 0;
+
+            /* Fill PCI address cells */
+            irq_map[i] = cpu_to_be32(devfn << 8);
+            i += FDT_PCI_ADDR_CELLS;
+
+            /* Fill PCI Interrupt cells */
+            irq_map[i] = cpu_to_be32(pin + 1);
+            i += FDT_PCI_INT_CELLS;
+
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irq_ph);
+            irq_map[i++] = cpu_to_be32(FDT_GIC_SHARED);
+
+            irq_map[i++] = cpu_to_be32(irq_nr);
+            irq_map[i++] = cpu_to_be32(FDT_IRQ_TYPE_LEVEL_HIGH);
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
+        }
+    }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS * irq_map_stride *
+                         sizeof(uint32_t));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask", 0x1800, 0, 0,
+                           0x7);
+}
+
+static void create_fdt_pcie(MIPSVirtState *s, const MemMapEntry *memmap,
+                            uint32_t irq_ph)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
+
+    name = g_strdup_printf("/soc/pci@%lx", (long)memmap[VIRT_PCIE_ECAM].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells", FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+                            "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
+                           memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN -
+                               1);
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0, memmap[VIRT_PCIE_ECAM].base,
+                           0, memmap[VIRT_PCIE_ECAM].size);
+    qemu_fdt_setprop_sized_cells(
+        mc->fdt, name, "ranges", 1, FDT_PCI_RANGE_IOPORT, 2, 0, 2,
+        memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size, 1,
+        FDT_PCI_RANGE_MMIO, 2, memmap[VIRT_PCIE_MMIO].base, 2,
+        memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
+
+    create_pcie_irq_map(s, mc->fdt, name, irq_ph);
+    g_free(name);
+}
+
+static void create_fdt_uart(MIPSVirtState *s, const MemMapEntry *memmap,
+                            uint32_t irq_ph)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
+
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0, memmap[VIRT_UART0].base,
+                           0x0, memmap[VIRT_UART0].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_ph);
+    qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", FDT_GIC_SHARED,
+                               UART0_IRQ, FDT_IRQ_TYPE_LEVEL_HIGH);
+
+    qemu_fdt_add_subnode(mc->fdt, "/chosen");
+    qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
+    g_free(name);
+}
+
+static void create_fdt_rtc(MIPSVirtState *s, const MemMapEntry *memmap,
+                           uint32_t irq_ph)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
+
+    name = g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "google,goldfish-rtc");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0, memmap[VIRT_RTC].base,
+                           0x0, memmap[VIRT_RTC].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_ph);
+    qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", FDT_GIC_SHARED,
+                           RTC_IRQ, FDT_IRQ_TYPE_LEVEL_HIGH);
+
+    g_free(name);
+}
+
+static void create_fdt_reset(MIPSVirtState *s, const MemMapEntry *memmap)
+{
+    char *name;
+    uint32_t syscon_ph;
+    MachineState *mc = MACHINE(s);
+
+    syscon_ph = qemu_fdt_alloc_phandle(mc->fdt);
+    name =
+        g_strdup_printf("/soc/trickbox@%lx", (long)memmap[VIRT_TRICKBOX].base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    {
+        static const char *const compat[2] = { "mips,trickbox", "syscon" };
+        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+    }
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0x0,
+                           memmap[VIRT_TRICKBOX].base, 0x0,
+                           memmap[VIRT_TRICKBOX].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "phandle", syscon_ph);
+    g_free(name);
+
+    name = g_strdup_printf("/reboot");
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", syscon_ph);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", REG_SIM_CMD);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", TRICK_RESET);
+    g_free(name);
+
+    name = g_strdup_printf("/poweroff");
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", syscon_ph);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", REG_SIM_CMD);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", TRICK_HALT);
+    g_free(name);
+}
+
+static void create_fdt_flash(MIPSVirtState *s, const MemMapEntry *memmap)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
+    hwaddr flashsize = virt_memmap[VIRT_FLASH].size;
+    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+
+    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg", 2, flashbase, 2,
+                                 flashsize);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
+    g_free(name);
+}
+
+static void create_fdt_fw_cfg(MIPSVirtState *s, const MemMapEntry *memmap)
+{
+    char *nodename;
+    MachineState *mc = MACHINE(s);
+    hwaddr base = memmap[VIRT_FW_CFG].base;
+    hwaddr size = memmap[VIRT_FW_CFG].size;
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(mc->fdt, nodename);
+    qemu_fdt_setprop_string(mc->fdt, nodename, "compatible",
+                            "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg", 2, base, 2, size);
+    g_free(nodename);
+}
+
+static void create_fdt(MIPSVirtState *s, const MemMapEntry *memmap,
+                       const char *cmdline)
+{
+    MachineState *mc = MACHINE(s);
+    uint32_t clk_ph, irq_ph;
+    uint8_t rng_seed[32];
+
+    if (mc->dtb) {
+        mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        if (!mc->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+        goto update_bootargs;
+    } else {
+        mc->fdt = create_device_tree(&s->fdt_size);
+        if (!mc->fdt) {
+            error_report("create_device_tree() failed");
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_string(mc->fdt, "/", "model", "mips-virtio,qemu");
+    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "mips-virtio");
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
+
+    clk_ph = qemu_fdt_alloc_phandle(mc->fdt);
+    qemu_fdt_add_subnode(mc->fdt, "/cpu-refclk");
+    qemu_fdt_setprop_string(mc->fdt, "/cpu-refclk", "compatible",
+                            "fixed-clock");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpu-refclk", "#clock-cells", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpu-refclk", "clock-frequency",
+                          VIRT_CPU_REF_CLK_FREQ);
+    qemu_fdt_setprop_string(mc->fdt, "/cpu-refclk", "clock-output-names",
+                            "cpu-refclk");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpu-refclk", "phandle", clk_ph);
+
+    qemu_fdt_add_subnode(mc->fdt, "/cpus");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
+
+    for (int cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        char *name = g_strdup_printf("/cpus/cpu@%d", cpu);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "img,mips");
+        qemu_fdt_setprop_string(mc->fdt, name, "status", "okay");
+        qemu_fdt_setprop_cell(mc->fdt, name, "reg", cpu);
+        qemu_fdt_setprop_string(mc->fdt, name, "device_type", "cpu");
+        qemu_fdt_setprop_cell(mc->fdt, name, "clocks", clk_ph);
+        g_free(name);
+    }
+
+    create_fdt_memory(s, memmap);
+
+    qemu_fdt_add_subnode(mc->fdt, "/soc");
+    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus");
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
+
+    irq_ph = qemu_fdt_alloc_phandle(mc->fdt);
+
+    create_fdt_cpc(s, memmap, clk_ph, irq_ph);
+    create_fdt_virtio(s, memmap, irq_ph);
+    create_fdt_pcie(s, memmap, irq_ph);
+    create_fdt_reset(s, memmap);
+    create_fdt_uart(s, memmap, irq_ph);
+    create_fdt_rtc(s, memmap, irq_ph);
+    create_fdt_flash(s, memmap);
+    create_fdt_fw_cfg(s, memmap);
+
+update_bootargs:
+    if (cmdline && *cmdline) {
+        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
+    }
+
+    /* Pass seed to RNG */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed,
+                     sizeof(rng_seed));
+    create_fdt_hypervisor(s);
+}
+
+static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
+{
+    uint64_t regaddr;
+    const MemMapEntry *memmap = virt_memmap;
+
+    /* Move CM GCRs */
+    regaddr = cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr, memmap[VIRT_CM].base);
+
+    /* Move & enable GIC GCRs */
+    regaddr = cpu_mips_phys_to_kseg1(NULL, memmap[VIRT_CM].base +
+                                                GCR_GIC_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr,
+                        memmap[VIRT_GIC].base | GCR_GIC_BASE_GICEN_MSK);
+
+    /* Move & enable CPC GCRs */
+    regaddr = cpu_mips_phys_to_kseg1(NULL, memmap[VIRT_CM].base +
+                                                GCR_CPC_BASE_OFS),
+    bl_gen_write_ulong(&p, regaddr,
+                        memmap[VIRT_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
+
+    /*
+     * Setup argument registers to follow the UHI boot protocol:
+     *
+     * a0/$4 = -2
+     * a1/$5 = virtual address of FDT
+     * a2/$6 = 0
+     * a3/$7 = 0
+     */
+    bl_gen_jump_kernel(&p,
+                       true, 0, true, (int32_t)-2,
+                       true, fdt_addr, true, 0, true, 0,
+                       kernel_entry);
+}
+
+static void virt_map_memory(MemoryRegion *sysmem, MemoryRegion *ram,
+                            hwaddr ram_size, hwaddr low_size, hwaddr high_base)
+{
+    MemoryRegion *low_alias = g_new(MemoryRegion, 1);
+
+    memory_region_init_alias(low_alias, NULL, "mips_virt.lomem", ram, 0,
+                             low_size);
+
+    memory_region_add_subregion(sysmem, 0, low_alias);
+
+    if (ram_size > low_size) {
+        MemoryRegion *high_alias = g_new(MemoryRegion, 1);
+        memory_region_init_alias(high_alias, NULL, "mips_virt.himem", ram,
+                                 low_size, ram_size - low_size);
+        memory_region_add_subregion(sysmem, high_base, high_alias);
+    }
+}
+
+static void virt_rom_init(MIPSVirtState *s, MemoryRegion *sysmem)
+{
+    MemoryRegion *boot_alias = g_new(MemoryRegion, 1);
+    s->rom = g_new(MemoryRegion, 1);
+    memory_region_init_ram(s->rom, NULL, "mips_virt.rom",
+                            virt_memmap[VIRT_ROM].size, &error_fatal);
+    memory_region_add_subregion(sysmem, virt_memmap[VIRT_ROM_BOOT].base, s->rom);
+    memory_region_init_alias(boot_alias, NULL, "mips_virt.rom_boot", s->rom,
+                              0, virt_memmap[VIRT_ROM_BOOT].size);
+    memory_region_add_subregion(sysmem, virt_memmap[VIRT_ROM_BOOT].base,
+                                boot_alias);
+}
+
+#define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
+
+static void virt_flash_init(MIPSVirtState *s, hwaddr base, hwaddr size)
+{
+    DriveInfo *dinfo;
+#if TARGET_BIG_ENDIAN
+    int be = 1;
+#else
+    int be = 0;
+#endif
+
+    dinfo = drive_get(IF_PFLASH, 0, 0);
+    s->flash = pflash_cfi01_register(base, "mips_virt.flash", size,
+                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                    VIRT_FLASH_SECTOR_SIZE, 4, 0x89, 0x18, 0x00, 0x00, be);
+}
+
+static inline DeviceState *gpex_pcie_init(MIPSVirtState *s,
+                                          MemoryRegion *sys_mem,
+                                          hwaddr ecam_base, hwaddr ecam_size,
+                                          hwaddr mmio_base, hwaddr mmio_size,
+                                          hwaddr pio_base)
+{
+    DeviceState *dev;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    MemoryRegion *mmio_alias, *mmio_reg;
+    qemu_irq irq;
+    int i;
+
+    dev = qdev_new(TYPE_GPEX_HOST);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam", ecam_reg, 0,
+                             ecam_size);
+    memory_region_add_subregion(get_system_memory(), ecam_base, ecam_alias);
+
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio", mmio_reg,
+                             mmio_base, mmio_size);
+    memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        irq = get_cps_irq(s->cps, PCIE_IRQ + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
+    }
+
+    return dev;
+}
+
+static FWCfgState *create_fw_cfg(const MachineState *mc)
+{
+    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
+    FWCfgState *fw_cfg;
+
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
+                                  &address_space_memory);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
+
+    return fw_cfg;
+}
+
+static void create_platform_bus(MIPSVirtState *s)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+    const MemMapEntry *memmap = virt_memmap;
+    int i;
+    MemoryRegion *sysmem = get_system_memory();
+
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
+    qdev_prop_set_uint32(dev, "mmio_size", memmap[VIRT_PLATFORM_BUS].size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s->platform_bus_dev = dev;
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    for (i = 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
+        qemu_irq irq = get_cps_irq(s->cps, VIRT_PLATFORM_BUS_IRQ + i);
+        sysbus_connect_irq(sysbus, i, irq);
+    }
+
+    memory_region_add_subregion(sysmem, memmap[VIRT_PLATFORM_BUS].base,
+                                sysbus_mmio_get_region(sysbus, 0));
+}
+
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    MIPSVirtState *s = container_of(notifier, MIPSVirtState, machine_done);
+    MachineState *machine = MACHINE(s);
+    int ret, dt_size;
+    bool firmware_loaded = false;
+    /* Leave some space for exception vector */
+    hwaddr dtb_paddr = virt_memmap[VIRT_LOMEM].base + 0x1000;
+
+    if (machine->firmware) {
+        char *fname;
+        int fw_size;
+
+        fname = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
+        if (!fname && !qtest_enabled()) {
+            error_report("Could not find ROM image '%s'", machine->firmware);
+            exit(1);
+        }
+        fw_size = load_image_mr(fname, s->rom);
+        if (fw_size == -1) {
+            error_report("unable to load firmware image '%s'", fname);
+            exit(1);
+        }
+        g_free(fname);
+        firmware_loaded = true;
+    }
+
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
+    if (machine->kernel_filename) {
+        if (firmware_loaded) {
+            /* Just pass those files via fw_cfg */
+            load_image_to_fw_cfg(s->fw_cfg, FW_CFG_KERNEL_SIZE,
+                                 FW_CFG_KERNEL_DATA, machine->kernel_filename,
+                                 true);
+            load_image_to_fw_cfg(s->fw_cfg, FW_CFG_INITRD_SIZE,
+                                 FW_CFG_INITRD_DATA, machine->initrd_filename,
+                                 false);
+
+            if (machine->kernel_cmdline) {
+                fw_cfg_add_i32(s->fw_cfg, FW_CFG_CMDLINE_SIZE,
+                               strlen(machine->kernel_cmdline) + 1);
+                fw_cfg_add_string(s->fw_cfg, FW_CFG_CMDLINE_DATA,
+                                  machine->kernel_cmdline);
+            }
+        } else {
+            uint64_t kernel_entry, kernel_high;
+            ssize_t size;
+
+            size = load_elf(machine->kernel_filename, NULL,
+                            cpu_mips_kseg0_to_phys, NULL, &kernel_entry, NULL,
+                            &kernel_high, NULL, 0, EM_MIPS, 1, 0);
+
+            if (size == -1) {
+                error_report("could not load kernel '%s'",
+                             machine->kernel_filename);
+                exit(1);
+            }
+
+            if (machine->initrd_filename) {
+                const char *name = machine->initrd_filename;
+                hwaddr kernel_end = cpu_mips_kseg0_to_phys(NULL, kernel_high);
+                hwaddr start =
+                    MAX(64 * MiB, QEMU_ALIGN_UP(kernel_end + 1, 1 * MiB));
+                hwaddr maxsz =
+                    MIN(machine->ram_size, virt_memmap[VIRT_LOMEM].size) -
+                    start;
+
+                size = load_ramdisk(name, start, maxsz);
+                if (size == -1) {
+                    size = load_image_targphys(name, start, maxsz);
+                    if (size == -1) {
+                        error_report("could not load ramdisk '%s'", name);
+                        exit(1);
+                    }
+                }
+                qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                      "linux,initrd-start", start);
+                qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                      "linux,initrd-end", start + size);
+            }
+            gen_firmware(memory_region_get_ram_ptr(s->rom), kernel_entry,
+                         cpu_mips_phys_to_kseg0(NULL, dtb_paddr));
+        }
+    }
+
+    memory_region_set_readonly(s->rom, true);
+    ret = fdt_pack(machine->fdt);
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+    /* Update dt_size after pack */
+    dt_size = fdt_totalsize(machine->fdt);
+    /* copy in the device tree */
+    qemu_fdt_dumpdtb(machine->fdt, dt_size);
+    fw_cfg_add_file(s->fw_cfg, "etc/fdt", machine->fdt, dt_size);
+    rom_add_blob_fixed("dtb", machine->fdt, dt_size, dtb_paddr);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                       rom_ptr(dtb_paddr, dt_size));
+}
+
+static void virt_machine_init(MachineState *machine)
+{
+    MIPSVirtState *s = MIPS_VIRT_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    const MemMapEntry *memmap = virt_memmap;
+    int i;
+
+    s->cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
+    clock_set_hz(s->cpuclk, VIRT_CPU_REF_CLK_FREQ);
+
+    s->cps = MIPS_CPS(qdev_new(TYPE_MIPS_CPS));
+    object_property_set_str(OBJECT(s->cps), "cpu-type", machine->cpu_type,
+                            &error_fatal);
+    object_property_set_int(OBJECT(s->cps), "num-core", machine->smp.cpus,
+                            &error_fatal);
+    qdev_connect_clock_in(DEVICE(s->cps), "clk-in", s->cpuclk);
+    sysbus_realize(SYS_BUS_DEVICE(s->cps), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s->cps), 0, 0, 1);
+
+
+    virt_map_memory(system_memory, machine->ram, machine->ram_size,
+                    virt_memmap[VIRT_LOMEM].size,
+                    virt_memmap[VIRT_HIGHMEM].base);
+
+    virt_rom_init(s, system_memory);
+    virt_flash_init(s, memmap[VIRT_FLASH].base, memmap[VIRT_FLASH].size);
+
+    serial_mm_init(system_memory, memmap[VIRT_UART0].base, 0,
+                   get_cps_irq(s->cps, UART0_IRQ), 399193, serial_hd(0),
+                   DEVICE_LITTLE_ENDIAN);
+
+    for (i = 0; i < VIRTIO_COUNT; i++) {
+        sysbus_create_simple("virtio-mmio",
+                             memmap[VIRT_VIRTIO].base +
+                                 i * memmap[VIRT_VIRTIO].size,
+                             get_cps_irq(s->cps, VIRTIO_IRQ + i));
+    }
+
+    gpex_pcie_init(s, system_memory, memmap[VIRT_PCIE_ECAM].base,
+                   memmap[VIRT_PCIE_ECAM].size, memmap[VIRT_PCIE_MMIO].base,
+                   memmap[VIRT_PCIE_MMIO].size, memmap[VIRT_PCIE_PIO].base);
+
+    create_platform_bus(s);
+
+    sysbus_create_simple(TYPE_GOLDFISH_RTC, memmap[VIRT_RTC].base,
+                         get_cps_irq(s->cps, RTC_IRQ));
+
+    sysbus_create_simple(TYPE_MIPS_TRICKBOX, memmap[VIRT_TRICKBOX].base, NULL);
+
+    create_fdt(s, memmap, machine->kernel_cmdline);
+    s->machine_done.notify = virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
+}
+
+static void virt_machine_instance_init(Object *obj)
+{
+}
+
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
+                                                        DeviceState *dev)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
+static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    MIPSVirtState *s = MIPS_VIRT_MACHINE(hotplug_dev);
+
+    if (s->platform_bus_dev) {
+        MachineClass *mc = MACHINE_GET_CLASS(s);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
+            platform_bus_link_device(PLATFORM_BUS_DEVICE(s->platform_bus_dev),
+                                     SYS_BUS_DEVICE(dev));
+        }
+    }
+}
+
+static void virt_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    mc->desc = "MIPS VirtIO board";
+    mc->init = virt_machine_init;
+    mc->max_cpus = 16;
+#ifdef TARGET_MIPS64
+    mc->default_cpu_type = MIPS_CPU_TYPE_NAME("I6400");
+#else
+    mc->default_cpu_type = MIPS_CPU_TYPE_NAME("P5600");
+#endif
+    mc->default_ram_id = "mips_virt_board.ram";
+    mc->block_default_type = IF_VIRTIO;
+    mc->default_display = "virtio";
+    mc->no_cdrom = 1;
+    mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    mc->pci_allow_0_address = true;
+
+    hc->plug = virt_machine_device_plug_cb;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+#ifdef CONFIG_TPM
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
+}
+
+static const TypeInfo virt_machine_typeinfo = {
+    .name = MACHINE_TYPE_NAME("virt"),
+    .parent = TYPE_MACHINE,
+    .class_init = virt_machine_class_init,
+    .instance_init = virt_machine_instance_init,
+    .instance_size = sizeof(MIPSVirtState),
+    .interfaces = (InterfaceInfo[]){ { TYPE_HOTPLUG_HANDLER }, {} },
+};
+
+static void virt_machine_init_register_types(void)
+{
+    type_register_static(&virt_machine_typeinfo);
+}
+
+type_init(virt_machine_init_register_types)
-- 
2.37.1 (Apple Git-137.1)


