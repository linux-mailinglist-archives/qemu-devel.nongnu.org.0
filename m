Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E5457570
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:26:06 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7eI-0007J9-0c
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qx-0006x8-0K
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:19 -0500
Received: from [2a00:1450:4864:20::330] (port=41891
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7Qv-0006Om-GD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso8074974wmf.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZHCEhn6PI0jEPNaBscG3od0nMbxmuG7wPeTVim4TAJw=;
 b=A9ZmrFMRh665OwWuOKxRRDyIsLEpA8Zj7qbknL9H8g8+X9fP1DadhI3ZNcOLeTxSOj
 NZ8dvn/brifUrUl6TIA5RRP7ofRzepO2IBa3fbl8mirNxZ2T7WetfP47cxFc1KgJK/Q/
 2v8akLpW4RCUMzeHHDYSLQwj1E6zL0QUN2vk15m4vWDikAlg8RkOrUaUuokg9fNY1Rr0
 YQDJd1wZQS7JKZO8ksCKVCI5/8ujwbVleste2O8UsHUc55j0iCQ9SOGrs0Oz5Hv6P0oq
 bGW6OajDLDTNBF/ue8YG9qm+ZP9GGohG2hhrvVTPrcYLyfeAQkQoES1TYRECHfo+i5mx
 vM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZHCEhn6PI0jEPNaBscG3od0nMbxmuG7wPeTVim4TAJw=;
 b=6azLy2nEXBmXSDnAbMPLlov8+o02jA+ThycPNLuDMOnEBYCmoYkUmJIguFfVNQF2GY
 mK5zDlsiWj3XfA5QKPLNPSDvXgs6SQS9hlqP2sFHGmLT4qLRAYwdh7L7S69+BPzgNmuQ
 MLo0/tWdYN1Rnew/ULJT7dXlH2GeVgVZUUb/H0d0tpYD5WicN8DeDShaIRyKa8Ejc4jD
 NjiZO2CMSzz2fKoViCnfKg8BnWX6GBasUW7RKs/Co1ELPTojdUDcES+XpNTRb10PPoLl
 s+1xp1pteShMj5TpTqFjNFxaDRXxqDiyAhEmgZPvFmDnCZZOXWcO7EKHu+vGTtgp89T/
 qBsA==
X-Gm-Message-State: AOAM532tbEEcxUJhKyCfHxXekbVqPZ+bDi5AnHkMh7EhcW55wHJ7ZDqN
 3S3TTvyrUKY8x+mSJFbKoth65YF/YWA=
X-Google-Smtp-Source: ABdhPJxciEIeb/JWdRbjE8tRo5Y2MEwumyIAE4hxP+NVwrtwzAY6Ve7Y3pnhOMPuzZmfLsIIqK+eqQ==
X-Received: by 2002:a1c:8002:: with SMTP id b2mr1560819wmd.2.1637341934483;
 Fri, 19 Nov 2021 09:12:14 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 be3sm12384948wmb.1.2021.11.19.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 2/5] hw/display/vga-mmio: Inline vga_mm_init()
Date: Fri, 19 Nov 2021 18:11:59 +0100
Message-Id: <20211119171202.458919-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119171202.458919-1-f4bug@amsat.org>
References: <20211119171202.458919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Inline vga_mm_init() in vga_mmio_init() to simplify the
next patch review. Kind of.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga-mmio.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 8aaf44e7b1d..0aefbcf53a0 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -65,12 +65,19 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
-                        hwaddr ctrl_base, int it_shift,
-                        MemoryRegion *address_space)
+int vga_mmio_init(hwaddr vram_base,
+                    hwaddr ctrl_base, int it_shift,
+                    MemoryRegion *address_space)
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
@@ -89,20 +96,6 @@ static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
     memory_region_add_subregion(address_space,
                                 vram_base + 0x000a0000, vga_io_memory);
     memory_region_set_coalescing(vga_io_memory);
-}
-
-int vga_mmio_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space)
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
2.31.1


