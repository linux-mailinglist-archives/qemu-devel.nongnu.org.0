Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FEE4F45A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:51:00 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbs0p-0005XW-7D
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31sRMYggKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com>)
 id 1nbroa-0004JC-Dz
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:23 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:49750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31sRMYggKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com>)
 id 1nbroX-00033v-G4
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:20 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 y37-20020a056a001ca500b004fe3eccd4e4so413675pfw.16
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PJkYwqMkzDWevpN4JSEirjsB9sRVwWBrMadKQoMbs+k=;
 b=oUCCOhz45ULpir8adZNxJMRvepe+nryUjeI8s3O00htDqUpqjWIj+EjMmFhSzZZdzB
 8FyA+SNLDDGzBi1E/tzK4/IVD0y67+hmlJFptYYxcScY/h1RSKzFVx9cT6zY1O4Ru1j3
 n+SUI0QEsRlVsX2CNWu4F8ix7ZO5zeL7bqVhvT8DCkpxoPWAoCQLgrSJZoSf/CR0eONd
 HA3T/GQzpzZTK/mA+3KQFqGCnpgA32J863OQfiVyK1d5YyOdmSxZIX9TxiVJ3+GCx4Ba
 vbqLxM+Fh/9NKyfRtstLyqXkOR3wzs/8j5hJiWQsQagOT92qWxmROi8f0E125yap1Xhj
 svHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PJkYwqMkzDWevpN4JSEirjsB9sRVwWBrMadKQoMbs+k=;
 b=deiCMnjNSNQH8oA4ZZ8Ehdxhs+xFqkYs6qhiSDEa3Ebij4Hk+GizexcgCcgWWvopf2
 OwEKatPBhfgb8MhVcnPIzpaRUT5bDuNHDXzn40ftYP/kyl271hJDatzIC/kUvAiZxzbv
 5c0uVUPJW+zY+QOJzqwSnKTeF/ZV7uqPxmR6xIdJLU/vwXPsFsYxpVnLTxnqkic8NEGH
 9+1wWm9mc6q9PU2YQKDSSXYlIsioT8lZlM+3RrcEpS6BVfVKntyReNeRA5BcPM9h8H2X
 X7l3n++aQXhV335IhUhhNBXyqmO6DRmE8+6i1Mji3iL7VeO5SgyFt1z93aJOSTjagam0
 8hlg==
X-Gm-Message-State: AOAM532EcGnXCooiB4CMQHTOVN6q6e3uf0P8m69XPx9MZClIjctFZNdZ
 HsckM5wU4bwBFsxJKRshR8d91UBaEOjTlQ==
X-Google-Smtp-Source: ABdhPJxOLfZe3C1MqFC3YBeWzMokhRbmWqLm4SV5zE1jXU5QHnwk46Ni2phZDtNAOXJbAKZ7H896Z7VemfOTKQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:4d45:0:b0:4fd:cfb8:5af0 with SMTP id
 a66-20020a624d45000000b004fdcfb85af0mr5801340pfb.8.1649198294253; Tue, 05 Apr
 2022 15:38:14 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:40 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-12-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 11/11] hw/arm: Add NPCM845 Evaluation board
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=31sRMYggKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Patrick Venture <venture@google.com>
---
 hw/arm/meson.build       |   2 +-
 hw/arm/npcm8xx_boards.c  | 257 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm8xx.h |  20 +++
 3 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/npcm8xx_boards.c

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index cf824241c5..e813cd72fa 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -14,7 +14,7 @@ arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
-arm_ss.add(when: 'CONFIG_NPCM8XX', if_true: files('npcm8xx.c'))
+arm_ss.add(when: 'CONFIG_NPCM8XX', if_true: files('npcm8xx.c', 'npcm8xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
new file mode 100644
index 0000000000..2290473d12
--- /dev/null
+++ b/hw/arm/npcm8xx_boards.c
@@ -0,0 +1,257 @@
+/*
+ * Machine definitions for boards featuring an NPCM8xx SoC.
+ *
+ * Copyright 2022 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "chardev/char.h"
+#include "hw/arm/npcm8xx.h"
+#include "hw/core/cpu.h"
+#include "hw/loader.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "qemu/datadir.h"
+#include "qemu/units.h"
+#include "sysemu/block-backend.h"
+
+#define NPCM845_EVB_POWER_ON_STRAPS 0x000017ff
+
+static const char npcm8xx_default_bootrom[] = "npcm8xx_bootrom.bin";
+
+static void npcm8xx_load_bootrom(MachineState *machine, NPCM8xxState *soc)
+{
+    const char *bios_name = machine->firmware ?: npcm8xx_default_bootrom;
+    g_autofree char *filename = NULL;
+    int ret;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_report("Could not find ROM image '%s'", bios_name);
+        if (!machine->kernel_filename) {
+            /* We can't boot without a bootrom or a kernel image. */
+            exit(1);
+        }
+        return;
+    }
+    ret = load_image_mr(filename, machine->ram);
+    if (ret < 0) {
+        error_report("Failed to load ROM image '%s'", filename);
+        exit(1);
+    }
+}
+
+static void npcm8xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
+                                  const char *flash_type, DriveInfo *dinfo)
+{
+    DeviceState *flash;
+    qemu_irq flash_cs;
+
+    flash = qdev_new(flash_type);
+    if (dinfo) {
+        qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+    qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
+
+    flash_cs = qdev_get_gpio_in_named(flash, SSI_GPIO_CS, 0);
+    qdev_connect_gpio_out_named(DEVICE(fiu), "cs", cs_no, flash_cs);
+}
+
+static void npcm8xx_connect_dram(NPCM8xxState *soc, MemoryRegion *dram)
+{
+    memory_region_add_subregion(get_system_memory(), NPCM8XX_DRAM_BA, dram);
+
+    object_property_set_link(OBJECT(soc), "dram-mr", OBJECT(dram),
+                             &error_abort);
+}
+
+static NPCM8xxState *npcm8xx_create_soc(MachineState *machine,
+                                        uint32_t hw_straps)
+{
+    NPCM8xxMachineClass *nmc = NPCM8XX_MACHINE_GET_CLASS(machine);
+    MachineClass *mc = MACHINE_CLASS(nmc);
+    Object *obj;
+
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
+        error_report("This board can only be used with %s",
+                     mc->default_cpu_type);
+        exit(1);
+    }
+
+    obj = object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
+                                &error_abort, NULL);
+    object_property_set_uint(obj, "power-on-straps", hw_straps, &error_abort);
+
+    return NPCM8XX(obj);
+}
+
+static I2CBus *npcm8xx_i2c_get_bus(NPCM8xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm8xx_init_pwm_splitter(NPCM8xxMachine *machine,
+                                      NPCM8xxState *soc, const int *fan_counts)
+{
+    SplitIRQ *splitters = machine->fan_splitter;
+
+    /*
+     * PWM 0~3 belong to module 0 output 0~3.
+     * PWM 4~7 belong to module 1 output 0~3.
+     */
+    for (int i = 0; i < NPCM8XX_NR_PWM_MODULES; ++i) {
+        for (int j = 0; j < NPCM7XX_PWM_PER_MODULE; ++j) {
+            int splitter_no = i * NPCM7XX_PWM_PER_MODULE + j;
+            DeviceState *splitter;
+
+            if (fan_counts[splitter_no] < 1) {
+                continue;
+            }
+            object_initialize_child(OBJECT(machine), "fan-splitter[*]",
+                                    &splitters[splitter_no], TYPE_SPLIT_IRQ);
+            splitter = DEVICE(&splitters[splitter_no]);
+            qdev_prop_set_uint16(splitter, "num-lines",
+                                 fan_counts[splitter_no]);
+            qdev_realize(splitter, NULL, &error_abort);
+            qdev_connect_gpio_out_named(DEVICE(&soc->pwm[i]), "duty-gpio-out",
+                                        j, qdev_get_gpio_in(splitter, 0));
+        }
+    }
+}
+
+static void npcm8xx_connect_pwm_fan(NPCM8xxState *soc, SplitIRQ *splitter,
+                                    int fan_no, int output_no)
+{
+    DeviceState *fan;
+    int fan_input;
+    qemu_irq fan_duty_gpio;
+
+    g_assert(fan_no >= 0 && fan_no <= NPCM7XX_MFT_MAX_FAN_INPUT);
+    /*
+     * Fan 0~1 belong to module 0 input 0~1.
+     * Fan 2~3 belong to module 1 input 0~1.
+     * ...
+     * Fan 14~15 belong to module 7 input 0~1.
+     * Fan 16~17 belong to module 0 input 2~3.
+     * Fan 18~19 belong to module 1 input 2~3.
+     */
+    if (fan_no < 16) {
+        fan = DEVICE(&soc->mft[fan_no / 2]);
+        fan_input = fan_no % 2;
+    } else {
+        fan = DEVICE(&soc->mft[(fan_no - 16) / 2]);
+        fan_input = fan_no % 2 + 2;
+    }
+
+    /* Connect the Fan to PWM module */
+    fan_duty_gpio = qdev_get_gpio_in_named(fan, "duty", fan_input);
+    qdev_connect_gpio_out(DEVICE(splitter), output_no, fan_duty_gpio);
+}
+
+static void npcm845_evb_i2c_init(NPCM8xxState *soc)
+{
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm8xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
+static void npcm845_evb_fan_init(NPCM8xxMachine *machine, NPCM8xxState *soc)
+{
+    SplitIRQ *splitter = machine->fan_splitter;
+    static const int fan_counts[] = {2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0};
+
+    npcm8xx_init_pwm_splitter(machine, soc, fan_counts);
+    npcm8xx_connect_pwm_fan(soc, &splitter[0], 0x00, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[0], 0x01, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[1], 0x02, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[1], 0x03, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[2], 0x04, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[3], 0x06, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[3], 0x07, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[4], 0x08, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[4], 0x09, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[5], 0x0a, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[5], 0x0b, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[6], 0x0c, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[6], 0x0d, 1);
+    npcm8xx_connect_pwm_fan(soc, &splitter[7], 0x0e, 0);
+    npcm8xx_connect_pwm_fan(soc, &splitter[7], 0x0f, 1);
+}
+
+static void npcm845_evb_init(MachineState *machine)
+{
+    NPCM8xxState *soc;
+
+    soc = npcm8xx_create_soc(machine, NPCM845_EVB_POWER_ON_STRAPS);
+    npcm8xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm8xx_load_bootrom(machine, soc);
+    npcm8xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm845_evb_i2c_init(soc);
+    npcm845_evb_fan_init(NPCM8XX_MACHINE(machine), soc);
+    npcm8xx_load_kernel(machine, soc);
+}
+
+static void npcm8xx_set_soc_type(NPCM8xxMachineClass *nmc, const char *type)
+{
+    NPCM8xxClass *sc = NPCM8XX_CLASS(object_class_by_name(type));
+    MachineClass *mc = MACHINE_CLASS(nmc);
+
+    nmc->soc_type = type;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = sc->num_cpus;
+}
+
+static void npcm8xx_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+    mc->default_ram_id = "ram";
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+}
+
+static void npcm845_evb_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM8xxMachineClass *nmc = NPCM8XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm8xx_set_soc_type(nmc, TYPE_NPCM8XX);
+
+    mc->desc = "Nuvoton NPCM845 Evaluation Board (Cortex-A35)";
+    mc->init = npcm845_evb_init;
+    mc->default_ram_size = 1 * GiB;
+};
+
+static const TypeInfo npcm8xx_machine_types[] = {
+    {
+        .name           = TYPE_NPCM8XX_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(NPCM8xxMachine),
+        .class_size     = sizeof(NPCM8xxMachineClass),
+        .class_init     = npcm8xx_machine_class_init,
+        .abstract       = true,
+    }, {
+        .name           = MACHINE_TYPE_NAME("npcm845-evb"),
+        .parent         = TYPE_NPCM8XX_MACHINE,
+        .class_init     = npcm845_evb_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(npcm8xx_machine_types)
diff --git a/include/hw/arm/npcm8xx.h b/include/hw/arm/npcm8xx.h
index a474c7991b..771bfae377 100644
--- a/include/hw/arm/npcm8xx.h
+++ b/include/hw/arm/npcm8xx.h
@@ -51,6 +51,26 @@
 
 #define NPCM8XX_NR_PWM_MODULES 3
 
+typedef struct NPCM8xxMachine {
+    MachineState        parent;
+    /*
+     * PWM fan splitter. each splitter connects to one PWM output and
+     * multiple MFT inputs.
+     */
+    SplitIRQ            fan_splitter[NPCM8XX_NR_PWM_MODULES *
+                                     NPCM7XX_PWM_PER_MODULE];
+} NPCM8xxMachine;
+
+
+typedef struct NPCM8xxMachineClass {
+    MachineClass        parent;
+
+    const char          *soc_type;
+} NPCM8xxMachineClass;
+
+#define TYPE_NPCM8XX_MACHINE MACHINE_TYPE_NAME("npcm8xx")
+OBJECT_DECLARE_TYPE(NPCM8xxMachine, NPCM8xxMachineClass, NPCM8XX_MACHINE)
+
 typedef struct NPCM8xxState {
     DeviceState         parent;
 
-- 
2.35.1.1094.g7c7d902a7c-goog


