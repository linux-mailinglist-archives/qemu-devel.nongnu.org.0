Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414EF3BA19F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:49:22 +0200 (CEST)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJXl-0003L4-9o
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJM7-000427-A3
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJM5-0004Gm-Q7
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so9118259wms.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hM5jFlzSYXmgSnw6kDffxFRxISxlO+HVFgqFqsltpDQ=;
 b=cSSDa3oV+PY0+J8L2l2wGPTpdpORwDur2Xp9tzxHg4DoMgOnZNQAazXFibMwxEhGu2
 Y8BQNDgnDsOwsczO0b2gUlsNU/FuGODTg1hCmVX4VUsZRyQjTnpxlCjZKhd1sov20G3h
 WM7qPMa/6pMA3dM/vrfT4biQBOZIzj/G0/fDjyVxR3IeM+FRnUjeYvmYN9Y//U3ULnAv
 3shLyFeO2hmFwkSREQS/BbLCLwNrOVA4yQABNbaKDBtA7zkU/tOExx6oF5GTTeN0Gwgu
 k/cnr/hBIjFj820LZwjfG6ydruLyQc8aRlm9M6ESd6Xe5r9nAv+4MoHoR4g8rDdgPxpE
 bHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hM5jFlzSYXmgSnw6kDffxFRxISxlO+HVFgqFqsltpDQ=;
 b=EL4jBBuO7NjOUMwO5Q1L79DeGb+LT3IspgbsHYrsekjA1K/oihUl0NKMdOOM3PldlO
 lT6cmWVhSu05AJ4q3Hnsi6ug6x2yzv+O6vOnK8b/pCb+SDa3O6ycZ+NeNBzyuZLH0vUs
 uvRarHV0uCKs5d2mJ0OiHaRh5nTvflFcGFSuSUkmJO4YyYXv+DNs8rcOwpecCYjAoDO5
 xXzs9Y9utxtQCpz1rmTmZhloHzPYKHVzQNdettXyGyEIFivcSd9kgHQsvumCuFckhOsk
 cykI91ZntigzCSG/skpP1EjeC4aXFCKxz9vSHcYnsWEB8FtsoXEEItyzRtp68N/Yn1Uc
 kb9Q==
X-Gm-Message-State: AOAM531ScJYGNkBphoCT8Y/1nCpI2Q5Fv7Qr1pXuAvzya8BPhU5Oe7Et
 AY8lJLgEFFlRZ2kiX9jTVVs6p7re4wH6U71M
X-Google-Smtp-Source: ABdhPJxEh0epQX1hiViElOcLV+9aiVzEKSyFo71kY8PhdieWv6izyPh1J+wFZmfxndg5hVy4nyJo8g==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr16285008wmq.11.1625233036229; 
 Fri, 02 Jul 2021 06:37:16 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id z8sm3757939wrw.18.2021.07.02.06.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] hw/m68k/q800: move PROM and checksum calculation from
 dp8393x device to board
Date: Fri,  2 Jul 2021 15:35:52 +0200
Message-Id: <20210702133557.60317-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This is in preparation for each board to have its own separate bit storage
format and checksum for storing the MAC address.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 11376daa858..491f283a17a 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -70,6 +70,8 @@
 #define NUBUS_SUPER_SLOT_BASE 0x60000000
 #define NUBUS_SLOT_BASE       0xf0000000
 
+#define SONIC_PROM_SIZE       0x1000
+
 /*
  * the video base, whereas it a Nubus address,
  * is needed by the kernel to have early display and
@@ -211,8 +213,10 @@ static void q800_init(MachineState *machine)
     int32_t initrd_size;
     MemoryRegion *rom;
     MemoryRegion *io;
+    MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
+    uint8_t *prom;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
-    int i;
+    int i, checksum;
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
@@ -319,9 +323,25 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, SONIC_BASE);
-    sysbus_mmio_map(sysbus, 1, SONIC_PROM_BASE);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
 
+    memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-q800.prom",
+                           SONIC_PROM_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), SONIC_PROM_BASE,
+                                dp8393x_prom);
+
+    /* Add MAC address with valid checksum to PROM */
+    prom = memory_region_get_ram_ptr(dp8393x_prom);
+    checksum = 0;
+    for (i = 0; i < 6; i++) {
+        prom[i] = nd_table[0].macaddr.a[i];
+        checksum += prom[i];
+        if (checksum > 0xff) {
+            checksum = (checksum + 1) & 0xff;
+        }
+    }
+    prom[7] = 0xff - checksum;
+
     /* SCC */
 
     dev = qdev_new(TYPE_ESCC);
-- 
2.31.1


