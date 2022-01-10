Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30648A240
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72fm-0007Rz-Ej
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3k6ncYQcKCm4hQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1n72cl-0003NX-Cd
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:54:43 -0500
Received: from [2607:f8b0:4864:20::b49] (port=38711
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3k6ncYQcKCm4hQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1n72ci-0003F3-Hy
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:54:43 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 s65-20020a254544000000b00610e12497adso12627317yba.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=SuYqbvL+od1K2zudHtgw6FszJJfcsY/PS1aX5B0xQ8g=;
 b=YnzLEtGrapfi56hZwEK4oWaFj/YUbc60W7cJmZrsEI4envPLNJs+g6KxTIkcfrNg3K
 Ifo2nbV+B+QnVHI4b/WJ2i8pX7sHpSxEhzc8su4YlcVSvzWoTUrAuKRFlBnwMX8gf/4K
 nW29dvH4xZYtvuL70jQaKD56sZRN+zECtU1CzQXfBrhBXfRN6Ce9MlN8ebtPyyfmgOhC
 Gm35ki2ozMziw+Ay6hZ/jb5tpPaGlbSH35ZF2U2V6YqY49gYpg64k1fvZB0d5PxjKwLd
 TD1HwuAS+LA7o19xSXdl2116vw/v0r9bVPurmJ2Y4F9XKbLmII2E8XSuCZQST4EyyT5P
 y9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SuYqbvL+od1K2zudHtgw6FszJJfcsY/PS1aX5B0xQ8g=;
 b=Xc3LKUWYCGU52wsNw3BZD7EGYIdVe3FyXQpdCbdUyujZzpLLItxiNvSGgD/IObxh8F
 r4YSL16tHe1K/FBSgtv/26OsJLvvB6Bt96ROkvc77kGTsgO19/Vlw1bNd4LawipEqdMU
 x6/I7lX8zwZ0W92K7j1CrKkLMcxwimPD9XbvR7roNbsaZWIq4O+N7yTk4cmUsxdQ9MLm
 A1MaySA0sozyftFpxEMBBUa7xlGGSryzpaX4rU6BVFeq3k5ZkgTxb58pE9vOpjK1JreM
 +PyjljFt/0Nf5A0sayJJQBE7gGD8dymmHQgmyma8Tz33xuioy7Ss11EUQ/3h7TcBgd5e
 uuLQ==
X-Gm-Message-State: AOAM530eQYm7f0DgGKTIE/QzjxO+sxTjDJQsyMdjzdS3idj1/w/pt/fq
 fWFDjsYTE0d2SbkgYLSVe/CBXtNIqbvo
X-Google-Smtp-Source: ABdhPJyEOl8C/9N3DeUPpxZoXRch9rcmI6n5kJ9/TUELrjG/OylB1oCnia5a5jgRUqMd6+IjR67hMwRo6Eqs
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:cecb:: with SMTP id
 x194mr1270752ybe.677.1641851283537; Mon, 10 Jan 2022 13:48:03 -0800 (PST)
Date: Mon, 10 Jan 2022 13:47:55 -0800
In-Reply-To: <20220110214755.810343-1-venture@google.com>
Message-Id: <20220110214755.810343-3-venture@google.com>
Mime-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 2/2] hw/arm: Enable smbus on arm virt machine.
From: Patrick Venture <venture@google.com>
To: crauer@google.com, peter.maydell@linaro.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3k6ncYQcKCm4hQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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

From: Chris Rauer <crauer@google.com>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Chris Rauer <crauer@google.com>
---
 docs/system/arm/virt.rst |  4 +++
 hw/arm/Kconfig           |  1 +
 hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++
 hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  3 +++
 5 files changed, 87 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..e357143f6b 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -30,6 +30,7 @@ The virt board supports:
 - An RTC
 - The fw_cfg device that allows a guest to obtain data from QEMU
 - A PL061 GPIO controller
+- A DesignWare I2C controller
 - An optional SMMUv3 IOMMU
 - hotpluggable DIMMs
 - hotpluggable NVDIMMs
@@ -121,6 +122,9 @@ ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+smbus
+  Set ``on``/``off`` to enable/disable smbus controller. The default is ``off``.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e652590943..692af8c265 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -28,6 +28,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select DESIGNWARE_I2C
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d0f4867fdf..310cd6fb5b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -92,6 +92,26 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_smbus(Aml *scope, const MemMapEntry *smbus_memmap,
+                                           uint32_t i2c_irq, I2CBus *smbus)
+{
+    Aml *dev = aml_device("SMB0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("APMC0D0F")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0x0F)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(smbus_memmap->base,
+                                       smbus_memmap->size, AML_READ_WRITE));
+    aml_append(crs,
+               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                             AML_EXCLUSIVE, &i2c_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
 {
     Aml *dev = aml_device("FWCF");
@@ -862,6 +882,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_cpus(scope, vms);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
+    if (vms->smbus_enabled) {
+        acpi_dsdt_add_smbus(scope, &memmap[VIRT_SMBUS],
+                            (irqmap[VIRT_SMBUS] + ARM_SPI_BASE), vms->smbus);
+    }
     if (vmc->acpi_expose_flash) {
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4593fea1ce..dd2219424d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,6 +76,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "hw/i2c/designware_i2c.h"
 #include "qemu/guest-random.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
@@ -152,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_SMBUS] =              { 0x090c0000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -188,6 +190,7 @@ static const int a15irqmap[] = {
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
     [VIRT_ACPI_GED] = 9,
+    [VIRT_SMBUS] = 10,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -878,6 +881,32 @@ static void create_rtc(const VirtMachineState *vms)
     g_free(nodename);
 }
 
+static void create_smbus(VirtMachineState *vms)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_SMBUS].base;
+    hwaddr size = vms->memmap[VIRT_SMBUS].size;
+    int irq = vms->irqmap[VIRT_SMBUS];
+    const char compat[] = "snps,designware-i2c";
+    MachineState *ms = MACHINE(vms);
+    DeviceState *dev;
+
+    dev = sysbus_create_simple(TYPE_DESIGNWARE_I2C, base,
+                               qdev_get_gpio_in(vms->gic, irq));
+    vms->smbus = (I2CBus *)qdev_get_child_bus(dev, "i2c-bus");
+
+    nodename = g_strdup_printf("/i2c@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
+    g_free(nodename);
+}
+
 static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
@@ -2125,6 +2154,10 @@ static void machvirt_init(MachineState *machine)
 
     vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
 
+    if (vms->smbus_enabled) {
+        create_smbus(vms);
+    }
+
     create_rtc(vms);
 
     create_pcie(vms);
@@ -2400,6 +2433,20 @@ static void virt_set_default_bus_bypass_iommu(Object *obj, bool value,
     vms->default_bus_bypass_iommu = value;
 }
 
+static bool virt_machine_get_smbus(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->smbus_enabled;
+}
+
+static void virt_machine_set_smbus(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->smbus_enabled = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2781,6 +2828,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
 
+    object_class_property_add_bool(oc, "smbus",
+                                   virt_machine_get_smbus,
+                                   virt_machine_set_smbus);
+    object_class_property_set_description(oc, "smbus",
+                                          "Enable SMBUS controller. ");
 }
 
 static void virt_instance_init(Object *obj)
@@ -2828,6 +2880,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* smbus is disabled by default.  */
+    vms->smbus_enabled = false;
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dc6b66ffc8..d28de89695 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_SMBUS,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -148,6 +149,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool smbus_enabled;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
@@ -169,6 +171,7 @@ struct VirtMachineState {
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
     PCIBus *bus;
+    I2CBus *smbus;
     char *oem_id;
     char *oem_table_id;
 };
-- 
2.34.1.575.g55b058a8bb-goog


