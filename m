Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5D489EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:59:21 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ywy-0006wq-9u
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp7-0007Is-R9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:17 -0500
Received: from [2a00:1450:4864:20::532] (port=33370
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp5-00065f-3e
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:12 -0500
Received: by mail-ed1-x532.google.com with SMTP id b13so3407220edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAztriVYxVoG2QzJ07skul6hi2knt8UFHmQWJ7Gn4yY=;
 b=zEgLh2pSumSJ1j0gfjG9Upi7PVsbOKL1zwd2F7nqVD002kPhY0FpYO/q3ZvUOhPhsH
 s9EwR8hRs32GDKEUT/s5c1IzWU8t6Iq0MCSCSE90ULTR/QZBvoI5Y1PI7QdAzZai2eN2
 qAzL8ikLax4+hphNEylkky5pNlwqNYN+I6LAQAOuybvs4MaU7si6QOjqVLvXwa4mu4Y4
 fF6VcnlaDiB6S7mfjlrrVCDQECAATjp4nBoN4/UBI1/8oR91JhU10xphyF6mlsCdaUsY
 RdkYijU+gq8bVnO4Iu/Z56Qefxeymma53KFcj0FhMM6uUOinXWNQEuMypReDjlJIk4kV
 Ip+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAztriVYxVoG2QzJ07skul6hi2knt8UFHmQWJ7Gn4yY=;
 b=tWMhqbi6geOHMCpPASGN26xksMOF3EQZF7QAgL5KUAJrPsMDQRYO89COdyydncgPzX
 lM9D4os73ORC6zARnThcdn1aT8Keqy6HohxlXh4u5Z3vMtf5hYPu3NoWNq2h32ucWOd9
 MelDSiyMQn6zhupdXypWomwa507nqsYt4e2XGfk8UUDBizFNo39EZapjL5jn1xe5vWgS
 WD6w6OgTjpU39t33RZ6Ty4xpLyM0lMIvEaQjY110b44rhKMGSISwfHVuvBbqMzhv8TPy
 hcfregsJEUChQHudGDycGpZxOJl7b9kMzJkrM0bQGDCle522NroIzOXOpgSI5OXGSXrW
 HXRg==
X-Gm-Message-State: AOAM533/j7nTQTO6zeioo8GxdadmtQxkvONOmYycWXALIKfA6WzkvCv8
 owY/RDhiW9Zv5OkLcgsrhVcw8Co7HRvfIQ==
X-Google-Smtp-Source: ABdhPJzg4IXsmVH9tXG1K0CTYGUErxw+/8FhpRuNDVcCvr5qN4P6QNaZTIj06TBFGUh0MRKsqKSadw==
X-Received: by 2002:a17:907:1c08:: with SMTP id
 nc8mr662908ejc.711.1641837069386; 
 Mon, 10 Jan 2022 09:51:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b4sm2679617ejl.129.2022.01.10.09.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A5FB1FFBB;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/6] hw/arm: wire-up memory from the Pico board and the SoC
Date: Mon, 10 Jan 2022 17:51:01 +0000
Message-Id: <20220110175104.2908956-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the memory aside from the external flash is a feature of the SoC
itself. However the flash is part of the board and different RP2040
boards can choose to wire up different amounts of it.

For now add unimplemented devices for all the rp2040 peripheral
blocks. Before we can boot more of the ROM we will need to model at
least the SIO and CLOCKS blocks.

For now CPU#1 starts disabled as it needs a working CPUID register so
it can identify itself before sleeping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/arm/rp2040.h |   9 +++-
 hw/arm/raspi_pico.c     |  20 +++++++
 hw/arm/rp2040.c         | 113 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 137 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/rp2040.h b/include/hw/arm/rp2040.h
index 6bf4a4e57e..760cef98fc 100644
--- a/include/hw/arm/rp2040.h
+++ b/include/hw/arm/rp2040.h
@@ -25,7 +25,14 @@ struct RP2040State {
 
     ARMv7MState armv7m[RP2040_NCPUS];
 
-    MemoryRegion container;
+    /* RP2040 regions */
+    MemoryRegion *memory; /* from board */
+    MemoryRegion memory_alias[RP2040_NCPUS - 1];
+
+    MemoryRegion rom;    /* internal mask rom */
+    MemoryRegion sram03; /* shared SRAM0-3 banks */
+    MemoryRegion sram4;  /* non-stripped SRAM4 */
+    MemoryRegion sram5;  /* non-stripped SRAM5 */
 };
 
 
diff --git a/hw/arm/raspi_pico.c b/hw/arm/raspi_pico.c
index 9826f4d608..76839e93bf 100644
--- a/hw/arm/raspi_pico.c
+++ b/hw/arm/raspi_pico.c
@@ -22,6 +22,7 @@ struct PiPicoMachineState {
     MachineState parent_obj;
     /*< public >*/
     RP2040State soc;
+    MemoryRegion flash;
 };
 typedef struct PiPicoMachineState PiPicoMachineState;
 
@@ -37,14 +38,33 @@ typedef struct PiPicoMachineClass PiPicoMachineClass;
 DECLARE_OBJ_CHECKERS(PiPicoMachineState, PiPicoMachineClass,
                      PIPICO_MACHINE, TYPE_PIPICO_MACHINE)
 
+#define RP2040_XIP_BASE   0x10000000
 
 static void pipico_machine_init(MachineState *machine)
 {
     PiPicoMachineState *s = PIPICO_MACHINE(machine);
+    MemoryRegion *sysmem = get_system_memory();
+    Error **errp = &error_fatal;
 
     /* Setup the SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP2040);
+    object_property_set_link(OBJECT(&s->soc), "memory", OBJECT(sysmem), errp);
+
+    /*
+     * The flash device it external to the SoC and mounted on the
+     * PiPico board itself. We will "load" the actual contents with
+     * armv7_load_kernel later although we still rely on the SoC's
+     * mask ROM to get to it.
+     */
+    const uint32_t flash_size = 256 * KiB;
+    memory_region_init_rom(&s->flash, NULL, "pico.flash0", flash_size, errp);
+    memory_region_add_subregion(sysmem, RP2040_XIP_BASE, &s->flash);
+
+
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
+
+    /* This assumes the "kernel" is positioned in the XIP Flash block */
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, RP2040_XIP_BASE);
 }
 
 static void pipico_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/rp2040.c b/hw/arm/rp2040.c
index 2feedc0da8..c6cc9b7165 100644
--- a/hw/arm/rp2040.c
+++ b/hw/arm/rp2040.c
@@ -7,10 +7,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
 #include "hw/arm/armv7m.h"
 #include "hw/arm/rp2040.h"
+#include "hw/misc/unimp.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 
@@ -27,6 +28,11 @@ typedef struct RP2040Class {
 #define RP2040_GET_CLASS(obj) \
     OBJECT_GET_CLASS(RP2040Class, (obj), TYPE_RP2040)
 
+/* See Table 2.2.2 in the RP2040 Datasheet */
+#define RP2040_SRAM_BASE  0x20000000
+#define RP2040_SRAM4_BASE 0x20040000
+#define RP2040_SRAM5_BASE 0x20041000
+
 static void rp2040_init(Object *obj)
 {
     RP2040State *s = RP2040(obj);
@@ -37,6 +43,16 @@ static void rp2040_init(Object *obj)
         object_initialize_child(obj, name, &s->armv7m[n], TYPE_ARMV7M);
         qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
                              ARM_CPU_TYPE_NAME("cortex-m0"));
+        /*
+         * Confusingly ARMv7M creates it's own per-core container so
+         * we need to alias additional regions to avoid trying to give
+         * a region two parents.
+         */
+        if (n > 0) {
+            memory_region_init_alias(&s->memory_alias[n - 1], obj,
+                                     "system-memory.alias", s->memory,
+                                     0, -1);
+        }
     }
 }
 
@@ -46,14 +62,104 @@ static void rp2040_realize(DeviceState *dev, Error **errp)
     Object *obj = OBJECT(dev);
     int n;
 
+    if (!s->memory) {
+        error_setg(errp, "%s: memory property was not set", __func__);
+        return;
+    }
+
+    /* initialize internal 16 KB internal ROM */
+    memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
+    memory_region_add_subregion(s->memory, 0, &s->rom);
+
+    /* SRAM (Main 256k bank + two 4k banks)*/
+    memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB, errp);
+    memory_region_add_subregion(s->memory, RP2040_SRAM_BASE, &s->sram03);
+
+    memory_region_init_ram(&s->sram4, obj, "rp2040.sram4", 4 * KiB, errp);
+    memory_region_add_subregion(s->memory, RP2040_SRAM4_BASE, &s->sram4);
+
+    memory_region_init_ram(&s->sram5, obj, "rp2040.sram5", 4 * KiB, errp);
+    memory_region_add_subregion(s->memory, RP2040_SRAM5_BASE, &s->sram5);
+
+    /* Map all the devices - see table 2.2.2 from the datasheet */
+
+    /* APB Peripherals */
+    create_unimplemented_device("rp2040.sysinfo",  0x40000000, 0x4000);
+    create_unimplemented_device("rp2040.syscfg",   0x40004000, 0x4000);
+    create_unimplemented_device("rp2040.clocks",   0x40008000, 0x4000);
+    create_unimplemented_device("rp2040.resets",   0x4000c000, 0x4000);
+    create_unimplemented_device("rp2040.psm",      0x40010000, 0x4000);
+    create_unimplemented_device("rp2040.iobnk0",   0x40014000, 0x4000);
+    create_unimplemented_device("rp2040.ioqspi",   0x40018000, 0x4000);
+    create_unimplemented_device("rp2040.padsbnk0", 0x4001c000, 0x4000);
+    create_unimplemented_device("rp2040.padsqspi", 0x40020000, 0x4000);
+    create_unimplemented_device("rp2040.xosc",     0x40024000, 0x4000);
+
+    create_unimplemented_device("rp2040.pllsys", 0x40028000, 0x4000);
+    create_unimplemented_device("rp2040.pllusb", 0x4002c000, 0x4000);
+    create_unimplemented_device("rp2040.busctrl", 0x40030000, 0x4000);
+    create_unimplemented_device("rp2040.uart0", 0x40034000, 0x4000);
+    create_unimplemented_device("rp2040.uart1", 0x40038000, 0x4000);
+    create_unimplemented_device("rp2040.spi0", 0x4003c000, 0x4000);
+    create_unimplemented_device("rp2040.spi1", 0x40040000, 0x4000);
+    create_unimplemented_device("rp2040.i2c0", 0x40044000, 0x4000);
+    create_unimplemented_device("rp2040.i2c1", 0x40048000, 0x4000);
+    create_unimplemented_device("rp2040.adc", 0x4004c000, 0x4000);
+    create_unimplemented_device("rp2040.pwm", 0x40050000, 0x4000);
+    create_unimplemented_device("rp2040.timer", 0x40054000, 0x4000);
+    create_unimplemented_device("rp2040.watchdog", 0x40058000, 0x4000);
+    create_unimplemented_device("rp2040.rtc", 0x4005c000, 0x4000);
+    create_unimplemented_device("rp2040.rosc", 0x40060000, 0x4000);
+    create_unimplemented_device("rp2040.vreg&reset", 0x40064000, 0x4000);
+    create_unimplemented_device("rp2040.tbman", 0x4006c000, 0x4000);
+
+    /* AHB-Lite Peripherals */
+    create_unimplemented_device("rp2040.dmabase",  0x50000000, 0x1000);
+
+    /* USB */
+    create_unimplemented_device("rp2040.usbram",   0x50100000, 0x10000);
+    create_unimplemented_device("rp2040.usbregs",  0x50110000, 0x10000);
+
+    /* Remaining AHB-Lite peripherals */
+    create_unimplemented_device("rp2040.pi00",     0x50200000, 0x10000);
+    create_unimplemented_device("rp2040.pi01",     0x50300000, 0x10000);
+
+    /* IOPORT Peripherals */
+    create_unimplemented_device("rp2040.sio",      0xd0000000, 0x10000000);
+
+    /*
+     * Cortex-M0+ internal peripherals (PPB_BASE) are handled by
+     * the v7m model and live at 0xe0000000.
+     */
+
+    /* TODO: deal with stripped aliases */
+
     for (n = 0; n < RP2040_NCPUS; n++) {
         Object *cpuobj = OBJECT(&s->armv7m[n]);
+        MemoryRegion *mr = n == 0 ? s->memory : &s->memory_alias[n - 1];
+        object_property_set_link(cpuobj, "memory", OBJECT(mr), errp);
+
+        /*
+         * FIXME: temp hack - until more of the logic is emulated we
+         * can't let the second CPU run off into the wild.
+         */
+        if (n > 0) {
+            object_property_set_bool(cpuobj, "start-powered-off",
+                                     true, &error_fatal);
+        }
+
         if (!sysbus_realize(SYS_BUS_DEVICE(cpuobj), errp)) {
             return;
         }
     }
 }
 
+static Property rp2040_soc_properties[] = {
+    DEFINE_PROP_LINK("memory", RP2040State, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void rp2040_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -61,14 +167,13 @@ static void rp2040_class_init(ObjectClass *oc, void *data)
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m0");
     dc->realize = rp2040_realize;
-    /* any props? */
+    device_class_set_props(dc, rp2040_soc_properties);
 };
 
 static const TypeInfo rp2040_types[] = {
     {
         .name           = TYPE_RP2040,
-        /* .parent         = TYPE_SYS_BUS_DEVICE, */
-        .parent         = TYPE_DEVICE,
+        .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(RP2040State),
         .instance_init  = rp2040_init,
         .class_size     = sizeof(RP2040Class),
-- 
2.30.2


