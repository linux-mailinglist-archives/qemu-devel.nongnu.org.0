Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58B457565
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:23:41 +0100 (CET)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7bx-0002rk-3m
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qv-0006wU-NX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:17 -0500
Received: from [2a00:1450:4864:20::329] (port=39553
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qq-0006OL-Bg
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso11013417wmr.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LxzL38s3i1AAXjqxVDHxZy+6zklNakdLnL3NVaE6p/A=;
 b=dKD/gw3acY/L6H5ff2pP4SXTZYt+iBDRZKdbp/vM6eH4q0C1j5ozCwVZHt91tKmAtO
 9RNsx+H30ipOej82snAKXNWLHQTdQLsvE5eMnHzcc/c33txs/kq7bNrJrtWU2IyW9mAy
 6RtcpbnesluBNwI6fnUdnjFn8ZA0erFUKhIcQDgketlR10xFkVBb7REhsTyhOe5Aekcb
 mGQlrdhuX+CbTHscribuZOkMr+0N9x/M2qfD4sIlkhiUIPJn/WZ3corHc7JNoYYLC0Ya
 dAc0UXoBcjwUgNWOpwv5sbDr3I7HnfiQ5VMHSsJdHnpwcEhpJD+9rSiJzpaLCXjG+XsH
 PyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LxzL38s3i1AAXjqxVDHxZy+6zklNakdLnL3NVaE6p/A=;
 b=I6huU80dawWUrbCze9dOTi6KjcZus/1xutXPZRDeaJsq4o2yaRZHad/o6mHuH0/L7b
 1BfHPzU11BsFvy4B2j6esHiQs7UlugpfxvWux1aMhvtq07OLhr/CsUye/Df5e31TbCqh
 cBKy6tW8gX7yFjbyvWxhqOgq5u7RreDQfvm++Ul0k9oIWXcpxo5Tpl22azP6wKN2o3mY
 PKQCqDhK9CyfbZX3oj0rgEO5MKVX6wwa2uvgYyifKOVpAjQ7aGzCuFYxVl/oMMRLBH+O
 HPd2NHIs2M+QKIC4Tr+HlItvlKqC6XWloQyGF/SNnuUmEI0pt+mxTR+Cfd1C/htlkmN1
 7G5A==
X-Gm-Message-State: AOAM5321YH3kQLajvrHv8ZyBJ1QqlbLKPSHsNVYAbpYdyzZyfXKf1b28
 cDQ0Cv7+Q/bShrCUuTY2mKIWRnE7RmA=
X-Google-Smtp-Source: ABdhPJyxj1X7BOACa/4u2AFR+B6rHjlLtrS1sK5KF/DiXeb2HH1ekBJ2g5XoUC8PDrCF034On6gm1Q==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr1531250wmq.102.1637341929644; 
 Fri, 19 Nov 2021 09:12:09 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 a141sm12107817wme.37.2021.11.19.09.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 1/5] hw/display: Rename VGA_ISA_MM -> VGA_MMIO
Date: Fri, 19 Nov 2021 18:11:58 +0100
Message-Id: <20211119171202.458919-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119171202.458919-1-f4bug@amsat.org>
References: <20211119171202.458919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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

There is no ISA bus part in the MMIO VGA device, so rename:

 *  hw/display/vga-isa-mm.c -> hw/display/vga-mmio.c
 *  CONFIG_VGA_ISA_MM -> CONFIG_VGA_MMIO
 *  ISAVGAMMState -> VGAMmioState
 *  isa_vga_mm_init() -> vga_mmio_init()

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configs/devices/mips-softmmu/common.mak |  2 +-
 include/hw/display/vga.h                |  2 +-
 hw/display/{vga-isa-mm.c => vga-mmio.c} | 16 ++++++++--------
 hw/mips/jazz.c                          |  2 +-
 hw/display/Kconfig                      |  2 +-
 hw/display/meson.build                  |  2 +-
 hw/mips/Kconfig                         |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)
 rename hw/display/{vga-isa-mm.c => vga-mmio.c} (93%)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 752b62b1e63..d2202c839e0 100644
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
diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 5f7825e0e36..03c65a14218 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -24,7 +24,7 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
-int isa_vga_mm_init(hwaddr vram_base,
+int vga_mmio_init(hwaddr vram_base,
                     hwaddr ctrl_base, int it_shift,
                     MemoryRegion *address_space);
 
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-mmio.c
similarity index 93%
rename from hw/display/vga-isa-mm.c
rename to hw/display/vga-mmio.c
index 7321b7a06d5..8aaf44e7b1d 100644
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
@@ -91,11 +91,11 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
     memory_region_set_coalescing(vga_io_memory);
 }
 
-int isa_vga_mm_init(hwaddr vram_base,
+int vga_mmio_init(hwaddr vram_base,
                     hwaddr ctrl_base, int it_shift,
                     MemoryRegion *address_space)
 {
-    ISAVGAMMState *s;
+    VGAMmioState *s;
 
     s = g_malloc0(sizeof(*s));
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index f5a26e174d5..8f345afd137 100644
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
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a2306b67d87..a1b159becd7 100644
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
index 861c43ff984..adc53dd8b6c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -18,7 +18,7 @@
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
-softmmu_ss.add(when: 'CONFIG_VGA_ISA_MM', if_true: files('vga-isa-mm.c'))
+softmmu_ss.add(when: 'CONFIG_VGA_MMIO', if_true: files('vga-mmio.c'))
 softmmu_ss.add(when: 'CONFIG_VMWARE_VGA', if_true: files('vmware_vga.c'))
 softmmu_ss.add(when: 'CONFIG_BOCHS_DISPLAY', if_true: files('bochs-display.c'))
 
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index b4c5549ce84..725525358d9 100644
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
2.31.1


