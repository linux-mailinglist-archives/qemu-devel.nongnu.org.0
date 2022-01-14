Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C048E4A4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:59:57 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GZ2-0002m2-8C
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUf-0007cn-KD
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUd-0007Vt-1o
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+bYqZZPcQ4/iUFWZFgkt0+6DR4Lu9NyDLSI30jgDZo=;
 b=fg2peesre3QvnNf16K45NFS9W5PHFmpMkYcPzvsK5I5ioYZ/jh3OcKPfhtiVsxBrQ/Km6x
 Zu6LAZLfC9Tvt1IKMnQ1u05wRl+qGG6oQexgxdrbZoFHLtYMRMKP3hMz8+hcDn7iOc75gW
 +81tMYSHIduaf3J5Nd+WK9F2/WtxU9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Xul6wxPlODqRcXhK_Vxbnw-1; Fri, 14 Jan 2022 01:55:19 -0500
X-MC-Unique: Xul6wxPlODqRcXhK_Vxbnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF22080D680;
 Fri, 14 Jan 2022 06:55:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 126F04699B;
 Fri, 14 Jan 2022 06:55:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED9C218007B7; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] hw/display: Rename VGA_ISA_MM -> VGA_MMIO
Date: Fri, 14 Jan 2022 07:53:16 +0100
Message-Id: <20220114065326.782420-11-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

There is no ISA bus part in the MMIO VGA device, so rename:

 *  hw/display/vga-isa-mm.c -> hw/display/vga-mmio.c
 *  CONFIG_VGA_ISA_MM -> CONFIG_VGA_MMIO
 *  ISAVGAMMState -> VGAMmioState
 *  isa_vga_mm_init() -> vga_mmio_init()

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211206224528.563588-2-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/vga.h                |  5 ++---
 hw/display/{vga-isa-mm.c => vga-mmio.c} | 19 +++++++++----------
 hw/mips/jazz.c                          |  2 +-
 configs/devices/mips-softmmu/common.mak |  2 +-
 hw/display/Kconfig                      |  2 +-
 hw/display/meson.build                  |  2 +-
 hw/mips/Kconfig                         |  2 +-
 7 files changed, 16 insertions(+), 18 deletions(-)
 rename hw/display/{vga-isa-mm.c => vga-mmio.c} (90%)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 5f7825e0e368..c16a5c26dae9 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -24,8 +24,7 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
-int isa_vga_mm_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space);
+int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
+                  int it_shift, MemoryRegion *address_space);
 
 #endif
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-mmio.c
similarity index 90%
rename from hw/display/vga-isa-mm.c
rename to hw/display/vga-mmio.c
index 7321b7a06d59..4ffe3afe32db 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-mmio.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ISA MM VGA Emulator.
+ * QEMU MMIO VGA Emulator.
  *
  * Copyright (c) 2003 Fabrice Bellard
  *
@@ -32,15 +32,15 @@
 
 #define VGA_RAM_SIZE (8 * MiB)
 
-typedef struct ISAVGAMMState {
+typedef struct VGAMmioState {
     VGACommonState vga;
     int it_shift;
-} ISAVGAMMState;
+} VGAMmioState;
 
 /* Memory mapped interface */
 static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
-    ISAVGAMMState *s = opaque;
+    VGAMmioState *s = opaque;
 
     return vga_ioport_read(&s->vga, addr >> s->it_shift) &
         MAKE_64BIT_MASK(0, size * 8);
@@ -49,7 +49,7 @@ static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 static void vga_mm_write(void *opaque, hwaddr addr, uint64_t value,
                          unsigned size)
 {
-    ISAVGAMMState *s = opaque;
+    VGAMmioState *s = opaque;
 
     vga_ioport_write(&s->vga, addr >> s->it_shift,
                      value & MAKE_64BIT_MASK(0, size * 8));
@@ -65,7 +65,7 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
+static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
                         hwaddr ctrl_base, int it_shift,
                         MemoryRegion *address_space)
 {
@@ -91,11 +91,10 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
     memory_region_set_coalescing(vga_io_memory);
 }
 
-int isa_vga_mm_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space)
+int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
+                  int it_shift, MemoryRegion *address_space)
 {
-    ISAVGAMMState *s;
+    VGAMmioState *s;
 
     s = g_malloc0(sizeof(*s));
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index f5a26e174d58..8f345afd137a 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -274,7 +274,7 @@ static void mips_jazz_init(MachineState *machine,
         }
         break;
     case JAZZ_PICA61:
-        isa_vga_mm_init(0x40000000, 0x60000000, 0, get_system_memory());
+        vga_mmio_init(0x40000000, 0x60000000, 0, get_system_memory());
         break;
     default:
         break;
diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 752b62b1e636..d2202c839e03 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -7,7 +7,7 @@ CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
 CONFIG_VGA_ISA=y
-CONFIG_VGA_ISA_MM=y
+CONFIG_VGA_MMIO=y
 CONFIG_VGA_CIRRUS=y
 CONFIG_VMWARE_VGA=y
 CONFIG_SERIAL=y
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a2306b67d87c..a1b159becd76 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -49,7 +49,7 @@ config VGA_ISA
     depends on ISA_BUS
     select VGA
 
-config VGA_ISA_MM
+config VGA_MMIO
     bool
     select VGA
 
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 861c43ff9847..adc53dd8b6cc 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -18,7 +18,7 @@ softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xenfb.c'))
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
-softmmu_ss.add(when: 'CONFIG_VGA_ISA_MM', if_true: files('vga-isa-mm.c'))
+softmmu_ss.add(when: 'CONFIG_VGA_MMIO', if_true: files('vga-mmio.c'))
 softmmu_ss.add(when: 'CONFIG_VMWARE_VGA', if_true: files('vmware_vga.c'))
 softmmu_ss.add(when: 'CONFIG_BOCHS_DISPLAY', if_true: files('bochs-display.c'))
 
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index b4c5549ce844..725525358d96 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -16,7 +16,7 @@ config JAZZ
     select I8254
     select I8257
     select PCSPK
-    select VGA_ISA_MM
+    select VGA_MMIO
     select G364FB
     select DP8393X
     select ESP
-- 
2.34.1


