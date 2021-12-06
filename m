Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080646AD29
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:49:52 +0100 (CET)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMnv-0007gV-LN
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMk3-0001Bl-9D
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:51 -0500
Received: from [2a00:1450:4864:20::32b] (port=43598
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMk1-00079A-Gr
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so910738wmc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 14:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5k3RRBPujACcqHFQADio8BD2t3DHIvuu1P9AHplVN/s=;
 b=mfggu546xl6qhBmw0oXMBv8YEsZnScAURco5xYlJjpBZnBEQLXvuVBnFQWPW01X821
 MNiQuYg6FnlFNtRVUo+A0bbEG6GSlGUqN3KxG65vRho/8qt2K66FrJGPIRExfB/Dmo5I
 IGpLI0Lahd5Ku89iWwOselZVqYcvWb7vJA5RpbStKAznwMzkz8ytXnDikBxZH1p2B67E
 Uf3JhFrQ8v4DLQ/rsbGPF6TLjcgra4HmliKXXlarTGZWfcVIvFQAkT6Lm5SAHwlblYus
 b366KTHavyVWVmPPR0sj0J3kRptfWNDizneGGGZdPWbGJnlf5OchNzJ8xU+f5SkFlh7+
 dqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5k3RRBPujACcqHFQADio8BD2t3DHIvuu1P9AHplVN/s=;
 b=ppV/Kde/Cywc5zvaLH8JxmxpQ9E8+dFc291uS5nfS9guXlYE7rNl1W0v0t6ToEDEij
 Rg489NRCfHQ3ko19Dx7FkuWyW4DJzFXVMAitEeQZk4vkgJHq8I8es3XSo39qJq8t1z33
 dYlRHWFsdbbZqk7D1sfLfGksJQU4C0PRSEqdmf2KwgSUF4kdHh1J7uCu+wm07IwYDsgs
 Rf+/7T9ocXhYjeVjoWPBNofqMi6L1wMFYg3Rr0c8rFuTTwHJhZk8CQPi5OeIcWRn9Gyv
 MpbAfqvd4qFqIyKp1E1yUl2tHRWP2KSU0Es64pOGYIqtS7N8AkoNM854rV6RgkwNIIig
 gJSA==
X-Gm-Message-State: AOAM532YBF8MoH1Mf/l/jzsyyyMR2+pIgUPhgGyJplTMnK2fF134fkso
 VDg+yVWXqi76n3LXbQrtfyVO+w9V47w=
X-Google-Smtp-Source: ABdhPJxHOVfmKJvWweqDO+0v8U4ih3M5o5Hf1yKJjDznOjX28bzeka3h1FsFulnQJUmkonEkf/2cPQ==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr1880664wme.23.1638830747764;
 Mon, 06 Dec 2021 14:45:47 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id p8sm12354815wrx.25.2021.12.06.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:45:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Date: Mon,  6 Dec 2021 23:45:27 +0100
Message-Id: <20211206224528.563588-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206224528.563588-1-f4bug@amsat.org>
References: <20211206224528.563588-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce TYPE_VGA_MMIO, a sysbus device.

While there is no change in the vga_mmio_init()
interface, this is a migration compatibility break
of the MIPS Acer Pica 61 Jazz machine (pica61).

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/display/vga.h |   2 +
 hw/display/vga-mmio.c    | 132 +++++++++++++++++++++++++++------------
 2 files changed, 94 insertions(+), 40 deletions(-)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index c16a5c26dae..98b2e560f9b 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -24,6 +24,8 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
+#define TYPE_VGA_MMIO "vga-mmio"
+
 int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
                   int it_shift, MemoryRegion *address_space);
 
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 5671fdb920f..10bde32af5c 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -23,21 +23,34 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/bitops.h"
-#include "qemu/units.h"
-#include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "hw/display/vga.h"
+#include "hw/sysbus.h"
+#include "hw/display/vga.h"
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
@@ -65,42 +78,81 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void vga_mmio_reset(DeviceState *dev)
+{
+    VGAMmioState *s = VGA_MMIO(dev);
+
+    vga_common_reset(&s->vga);
+}
+
 int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
                   int it_shift, MemoryRegion *address_space)
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
2.33.1


