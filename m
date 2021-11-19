Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6045757A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:29:16 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7hL-0002rd-OG
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:29:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7R1-00072J-4P
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:27 -0500
Received: from [2a00:1450:4864:20::32e] (port=54824
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qz-0006PF-6p
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i12so9144150wmq.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mt9b+5cqbBIgzp6O9dytn7/9Xl0Ujk3opErV/gQqZLs=;
 b=QvKRb7k4cg3krRjLg5rfJHieJhIouk97Bd0HMqBWG8+AMfSynuHdKM3kCu3V4RvII8
 32ZhWMtegJj4z1G6m5LCQUWGyxlXmjwC22I1h1nliHT8AFWl3fQqgHPUOoNjEOM+8YM9
 nnqWSfgzRRj3wd/Dig5cJRJHQYexuI8QzNp+IIiq2zkl2wi2fWDkyE7nmU6KeMYf0fcJ
 ZpobR4u4Cxh2Q4pgGQpJt7nCDncUNQG01vTtEPyvh7ipEB5ve7lV5JpWy4qSkl1sXVMR
 AOX0v/AG6KXFK7bJGvSF6XTbfTI5b/htEprJ5+9ogx3VWwlsQRiDceO7VtkO4S3snZXB
 QsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mt9b+5cqbBIgzp6O9dytn7/9Xl0Ujk3opErV/gQqZLs=;
 b=4AEsfd5EeBNKbPQjAWMMABWEoTPSuEVRQ9O1t1sXdbkkFpaQALc6kSbwMGidX8LkHr
 IpPohTqLl/VxhpXvBsYicVV/iCG2pZVEyq8ZDTu07FkgRfjm/pQWsZ5CsGopG7D0QzI4
 VHErG0jcg9rjSZ3bzgv6xiZ2b3ta6OYYv5G2YNcFVMXRUJQoFbuKSBAk6CgfsvHwozXn
 3/OGjcytrazmG+C67aHLZ9JjkOJMoRfbHZaruEMx5RvobeQKgru0FnO8e9i84OEVrlcg
 SZIXto2h/cGSBAlQ8xlm50LLgxi4aRrZr2m24bkSq3ZIy2SN3DTBXUo79PyV3EfTX80w
 +SgQ==
X-Gm-Message-State: AOAM532+z53tJA1fzMZyna+/tQmLq9yjPt+IDRdAbXLFASnzne99oxY5
 8hgiBO9CBdz8kIXdEt5fTKLhMyvQF1g=
X-Google-Smtp-Source: ABdhPJxSYvg82L4HMFpad2FMKqLnfaD1/mG9Bv+O7ymoAbs19NX9KZtZx4qRWoUrDcEcNrpe5rX3DA==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr1430453wmc.89.1637341939121; 
 Fri, 19 Nov 2021 09:12:19 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 s13sm13170110wmc.47.2021.11.19.09.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 3/5] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Date: Fri, 19 Nov 2021 18:12:00 +0100
Message-Id: <20211119171202.458919-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119171202.458919-1-f4bug@amsat.org>
References: <20211119171202.458919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce TYPE_VGA_MMIO, a sysbus device.

While there is no change in the vga_mmio_init()
interface, this is a migration compatibility break
of the MIPS Acer Pica 61 Jazz machine (pica61).

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga-mmio.c | 134 +++++++++++++++++++++++++++++-------------
 1 file changed, 94 insertions(+), 40 deletions(-)

diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 0aefbcf53a0..d1c5f31c134 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -2,6 +2,7 @@
  * QEMU MMIO VGA Emulator.
  *
  * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2021 Philippe Mathieu-Daudé
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -23,21 +24,34 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/bitops.h"
-#include "qemu/units.h"
-#include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "hw/display/vga.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "vga_int.h"
-#include "ui/pixel_ops.h"
 
-#define VGA_RAM_SIZE (8 * MiB)
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0: VGA I/O registers
+ *  + sysbus MMIO region 1: VGA MMIO registers
+ *  + sysbus MMIO region 2: VGA memory
+ */
 
-typedef struct VGAMmioState {
+#define TYPE_VGA_MMIO "vga-mmio"
+OBJECT_DECLARE_SIMPLE_TYPE(VGAMmioState, VGA_MMIO)
+
+struct VGAMmioState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     VGACommonState vga;
-    int it_shift;
-} VGAMmioState;
+    MemoryRegion iomem;
+    MemoryRegion lowmem;
+
+    uint8_t it_shift;
+};
 
-/* Memory mapped interface */
 static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
     VGAMmioState *s = opaque;
@@ -65,43 +79,83 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void vga_mmio_reset(DeviceState *dev)
+{
+    VGAMmioState *d = VGA_MMIO(dev);
+    VGACommonState *s = &d->vga;
+
+    vga_common_reset(s);
+}
+
 int vga_mmio_init(hwaddr vram_base,
                     hwaddr ctrl_base, int it_shift,
                     MemoryRegion *address_space)
 {
-    VGAMmioState *s;
-    MemoryRegion *s_ioport_ctrl, *vga_io_memory;
+    DeviceState *dev;
+    SysBusDevice *s;
 
-    s = g_malloc0(sizeof(*s));
+    dev = qdev_new(TYPE_VGA_MMIO);
+    qdev_prop_set_uint8(dev, "it_shift", it_shift);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
 
-    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
-    s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, NULL);
-
-    s->it_shift = it_shift;
-    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
-    memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
-                          "vga-mm-ctrl", 0x100000);
-    memory_region_set_flush_coalesced(s_ioport_ctrl);
-
-    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
-    /* XXX: endianness? */
-    memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
-                          "vga-mem", 0x20000);
-
-    vmstate_register(NULL, 0, &vmstate_vga_common, s);
-
-    memory_region_add_subregion(address_space, ctrl_base, s_ioport_ctrl);
-    s->vga.bank_offset = 0;
-    memory_region_add_subregion(address_space,
-                                vram_base + 0x000a0000, vga_io_memory);
-    memory_region_set_coalescing(vga_io_memory);
-
-    s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
-
-    memory_region_add_subregion(address_space,
-                                VBE_DISPI_LFB_PHYSICAL_ADDRESS,
-                                &s->vga.vram);
+    sysbus_mmio_map(s, 0, ctrl_base);
+    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
+    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
 
     return 0;
 }
+
+static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
+{
+    VGAMmioState *s = VGA_MMIO(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,
+                          "vga-mmio", 0x100000);
+    memory_region_set_flush_coalesced(&s->iomem);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    /* XXX: endianness? */
+    memory_region_init_io(&s->lowmem, OBJECT(dev), &vga_mem_ops, &s->vga,
+                          "vga-lowmem", 0x20000);
+    memory_region_set_coalescing(&s->lowmem);
+    sysbus_init_mmio(sbd, &s->lowmem);
+
+    s->vga.bank_offset = 0;
+    s->vga.global_vmstate = true;
+    vga_common_init(&s->vga, OBJECT(dev));
+    sysbus_init_mmio(sbd, &s->vga.vram);
+    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
+}
+
+static Property vga_mmio_properties[] = {
+    DEFINE_PROP_UINT8("it_shift", VGAMmioState, it_shift, 0),
+    DEFINE_PROP_UINT32("vgamem_mb", VGAMmioState, vga.vram_size_mb, 8),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vga_mmio_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = vga_mmio_realizefn;
+    dc->reset = vga_mmio_reset;
+    dc->vmsd = &vmstate_vga_common;
+    device_class_set_props(dc, vga_mmio_properties);
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+}
+
+static const TypeInfo vga_mmio_info = {
+    .name          = TYPE_VGA_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VGAMmioState),
+    .class_init    = vga_mmio_class_initfn,
+};
+
+static void vga_mmio_register_types(void)
+{
+    type_register_static(&vga_mmio_info);
+}
+
+type_init(vga_mmio_register_types)
-- 
2.31.1


