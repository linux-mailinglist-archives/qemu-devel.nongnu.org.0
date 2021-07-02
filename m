Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456133BA188
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:44:24 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJSx-0007Km-1k
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLe-0002gu-NI
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLd-00042p-84
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6434545wmj.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOJ2AWq2wxlaeERjjMTMns7W7OqhadIfD9DbevBL6vY=;
 b=ZwNVl21NM8+vaDgEv9+dcEyK16tS/Xa80+qWTAVIDYTzaEQDGoQLLRYHUvMlTAo4PR
 X0coVEGw5niRrBhhf/VY+qfTODurMqUyMi2vd6il7NjlMA+DPJuhbbCYakPX2ZcvPaU0
 JcOdoI7jK+42ilZ20gr17hHe2zfvpp7a5jx5vryAolNvy23awje5IPRJOo6vP1q9K4an
 BxX+Mu6iKk0uC42Q7tz9+GRiE5pGt3TPf8S3EN53eHdzwmoKbXs2VZnmcSo5zqfUuBGh
 lud1x7VRExQm7tCGrxvd6n3JIRK3Wvx+1A8XDnVSDN5vys/ddBBGkSB1TynI8dNKnuAo
 OPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UOJ2AWq2wxlaeERjjMTMns7W7OqhadIfD9DbevBL6vY=;
 b=Ehc55sgb8YKtF0OlL4x1SAk1MUUsWXis+NZ7SC/3pv8LB/NZ2ouSiZZehG88VKFSBt
 EtzLs8GdtRMGANmuYO+54GxssaHdSJ+iwlrepBZyjIiloYouRKTA5kyhSGCHX3k+sZUP
 uutzS/2JUzB4N+l9s1kJ2LG8++XVma914TaVf6t7ZJKr63yXf8w8pqkQgOCNSP44fZQf
 2Vvoo0O6iY0C2qodBUQGq6MG0KArN9UaDTLGD0If7/faEV5jSY48h+UdwGOQ+dHfeYhI
 p+Q4hPmt+2Jpzp3o0B8JWL9gGTkXu3hqTHPO6LOEMgrKiW5OlmCwafD+t+zrOXouoeFM
 fIig==
X-Gm-Message-State: AOAM533OIww1VBhu/UWk7VyzrizUzBkLJ16Ahx3i0oYp9vNdys5URyDH
 HOIFqMcjBRQPt55P4PT8C4cA8B+kibdYj43n
X-Google-Smtp-Source: ABdhPJyrkJpQrH5Ie0670mbo2ZKPOlJkrIOcEGS8vU0jF1v86O0336FBlmEmR4ov98MWw7xtib5Zzg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr16840389wmc.65.1625233007796; 
 Fri, 02 Jul 2021 06:36:47 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id z6sm3203990wrh.67.2021.07.02.06.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] g364fb: use RAM memory region for framebuffer
Date: Fri,  2 Jul 2021 15:35:47 +0200
Message-Id: <20210702133557.60317-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since the migration stream is already broken, we can use this opportunity to
change the framebuffer so that it is migrated as a RAM memory region rather
than as an array of bytes.

In particular this helps the output of the analyze-migration.py tool which
no longer contains a huge array representing the framebuffer contents.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625163554.14879-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/g364fb.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 8f1725432cd..87effbf2b0f 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -22,6 +22,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "ui/console.h"
@@ -33,7 +34,6 @@
 
 typedef struct G364State {
     /* hardware */
-    uint8_t *vram;
     uint32_t vram_size;
     qemu_irq irq;
     MemoryRegion mem_vram;
@@ -125,7 +125,7 @@ static void g364fb_draw_graphic8(G364State *s)
         xcursor = ycursor = -65;
     }
 
-    vram = s->vram + s->top_of_screen;
+    vram = memory_region_get_ram_ptr(&s->mem_vram) + s->top_of_screen;
     /* XXX: out of range in vram? */
     data_display = dd = surface_data(surface);
     snap = memory_region_snapshot_and_clear_dirty(&s->mem_vram, 0, s->vram_size,
@@ -274,6 +274,8 @@ static inline void g364fb_invalidate_display(void *opaque)
 
 static void g364fb_reset(G364State *s)
 {
+    uint8_t *vram = memory_region_get_ram_ptr(&s->mem_vram);
+
     qemu_irq_lower(s->irq);
 
     memset(s->color_palette, 0, sizeof(s->color_palette));
@@ -283,7 +285,7 @@ static void g364fb_reset(G364State *s)
     s->ctla = 0;
     s->top_of_screen = 0;
     s->width = s->height = 0;
-    memset(s->vram, 0, s->vram_size);
+    memset(vram, 0, s->vram_size);
     g364fb_invalidate_display(s);
 }
 
@@ -450,11 +452,10 @@ static int g364fb_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_g364fb = {
     .name = "g364fb",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .post_load = g364fb_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_VBUFFER_UINT32(vram, G364State, 1, NULL, vram_size),
         VMSTATE_BUFFER_UNSAFE(color_palette, G364State, 0, 256 * 3),
         VMSTATE_BUFFER_UNSAFE(cursor_palette, G364State, 0, 9),
         VMSTATE_UINT16_ARRAY(cursor, G364State, 512),
@@ -474,15 +475,12 @@ static const GraphicHwOps g364fb_ops = {
 
 static void g364fb_init(DeviceState *dev, G364State *s)
 {
-    s->vram = g_malloc0(s->vram_size);
-
     s->con = graphic_console_init(dev, 0, &g364fb_ops, s);
 
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &g364fb_ctrl_ops, s,
                           "ctrl", 0x180000);
-    memory_region_init_ram_ptr(&s->mem_vram, NULL, "vram",
-                               s->vram_size, s->vram);
-    vmstate_register_ram(&s->mem_vram, dev);
+    memory_region_init_ram(&s->mem_vram, NULL, "g364fb.vram", s->vram_size,
+                           &error_fatal);
     memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
 }
 
-- 
2.31.1


