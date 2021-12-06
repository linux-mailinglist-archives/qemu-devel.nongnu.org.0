Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619846AD6D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 23:51:56 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muMpv-0002oc-5T
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 17:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjx-0000yG-Bn
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:46 -0500
Received: from [2a00:1450:4864:20::332] (port=42640
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muMjv-000788-TW
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 17:45:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so910917wmd.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 14:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S41Bx0PKiSXj39RU/0leVOxf7HhF7IplspLzvzcX9jo=;
 b=bfTiKK0ie48Zzhd/6+NWdFwhQtmXBzuzMaDCJJ6m+JpgkEWfHExFDwj99BxfnU7jmB
 qrT/blDWe8PZGnM34w4Fjyo8FM633YUtaviCddZdO7s9ZeClBLgNOXjZsjxs8Jg/5atu
 FCPu49KGtPAYc28khvS3O1YgJJXIpQKRTX/yBItjntaORnPQtMUgJaZN9K4000m3I89+
 TY2u1+o3Y7TdHDdOxvWcyxD+ezM5dscAuJjz8/KbHcZYp9JX2pYnfTAYgGiS6rn+e5P4
 2xubWPn0h07A6zigNYW91OV6+eVqTNITXsKkkNhlFppEHBjg9hfj12QQYen2wJZEQN8/
 v+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S41Bx0PKiSXj39RU/0leVOxf7HhF7IplspLzvzcX9jo=;
 b=57fhF4cIZX5Uv/wqP584A3m4fxkjI3d9YCvR+Gz58480sIrlE0ZsjpxeiNo1sK/OiX
 DPaUVoMXruIwC5sak37Hy7EQhNpoDKAlSrG1aBbkpWPS85vKm5zxXjgvwMTElNl5Su7z
 NARxOHsQjPoNqVeqJWMfxc/WHJ0lHnVA9uXI5wM3JZWK3gxbhD4zFBkYpsP19cEtHnXV
 /haTv6SHcCUYuEMmcfZgZ0hVRFElPaiaAbOX9llscX1FlnP5MHe2PWRDmUy4dRX0UGLl
 DmsOiUBox5Nf9i8kPF298FnFS0Sn2Ag5TFPiHkKcn/g8mleu7HptdByh25aLXGTeZdo9
 RzRA==
X-Gm-Message-State: AOAM532N+YDHA9RGVXIMtDaY16pwlWR2OuTA3OoUjXAN3mMePlz0NFF7
 P9LeDCOCT9PbHMs2jN0LyyIwTlDH6p4=
X-Google-Smtp-Source: ABdhPJzQXbtPT/sONIhv8YJt57FFC1QYctFVBdWaja3Z7Mqlagr2qvi+ivONXVQYeARXsYFZwkq5aw==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr1442471wml.105.1638830742381; 
 Mon, 06 Dec 2021 14:45:42 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l8sm750832wmc.40.2021.12.06.14.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:45:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/display/vga-mmio: Inline vga_mm_init()
Date: Mon,  6 Dec 2021 23:45:26 +0100
Message-Id: <20211206224528.563588-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206224528.563588-1-f4bug@amsat.org>
References: <20211206224528.563588-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Inline vga_mm_init() in vga_mmio_init() to simplify the
next patch review. Kind of.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga-mmio.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 4ffe3afe32d..5671fdb920f 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -65,12 +65,18 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
-                        hwaddr ctrl_base, int it_shift,
-                        MemoryRegion *address_space)
+int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
+                  int it_shift, MemoryRegion *address_space)
 {
+    VGAMmioState *s;
     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
 
+    s = g_malloc0(sizeof(*s));
+
+    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
+    s->vga.global_vmstate = true;
+    vga_common_init(&s->vga, NULL);
+
     s->it_shift = it_shift;
     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
@@ -89,19 +95,6 @@ static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
     memory_region_add_subregion(address_space,
                                 vram_base + 0x000a0000, vga_io_memory);
     memory_region_set_coalescing(vga_io_memory);
-}
-
-int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
-                  int it_shift, MemoryRegion *address_space)
-{
-    VGAMmioState *s;
-
-    s = g_malloc0(sizeof(*s));
-
-    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
-    s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, NULL);
-    vga_mm_init(s, vram_base, ctrl_base, it_shift, address_space);
 
     s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
 
-- 
2.33.1


