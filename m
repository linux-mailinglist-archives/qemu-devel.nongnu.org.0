Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2103BA190
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:47:25 +0200 (CEST)
Received: from localhost ([::1]:36326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJVs-0007WG-GT
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJM3-0003pW-Qq
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLz-0004FZ-7X
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso5906749wme.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mP6GfEEKKXaBd1tf8TIMMHcK8n5QD1fCIHiJmE/WS14=;
 b=ViY3nhI6gmCOFWVmlnuH+/UzDULmVfCuImnZd7Q14XbdTPiAEPvvkg1nnobBh1qA6n
 hYaHwWC5Ez97331EPIHwSqL/ZhtiCUEM1X3YECy48Mga/auki5S97ZR4Tn6litaynEL2
 8TH0TXzSmK0cRbbogO0rPANb6jan1wTiUf414/pKg7M6dt94Iod13CH2sR7UXHblkpaG
 uesewqFMgUCgxr8eXE+8wgx6UPLgaJWQ8ep6qBCmZqugCpfNM4XPmxDKjUl486t0dPTO
 iTBcpG1piaNIoEjcZ991q7JQDEXdfStB8mjTxe1CCq2TNOAYG2xJYpykMxk7knbuImJt
 jUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mP6GfEEKKXaBd1tf8TIMMHcK8n5QD1fCIHiJmE/WS14=;
 b=MdXrgeh8gEkgo18kj9xAt/k9xJ2LlILRAgBIyXDEZenDfKOkisf1rSlzSWp3haOUCG
 1ZNV2XL4Zi/RRBItUYqj0cY6H7S/AOR6c2Bv5HXnow/PevyHzl56wGtL9R92Ae+4f8j9
 pOPHIF8ElgRtEgrKPdxBwPnNXWvQWTSOdLzBPeFsMcEpwQK/fx1JO3DB3eBibDs7yNBr
 jgDlDNV4dSUoF4eV8xUMKBokw2nrzf+NKLElViPIRBI1vXFBum0GBshu9K0MmLBTht9Z
 p++oyhi3xieSOqNx15tUoG9D205uBunWYU4dQ5bGuTNDXCDxaUsbaS0TxCYuLpCAynwn
 G06w==
X-Gm-Message-State: AOAM531QNpA8UxRlKStsBXt+tLLob/djsNC7FjSlGuB9IsJlvvqcOw7P
 8KQbLiv+WmjVVp1ArBaBqQRlTr6npHU4KdCc
X-Google-Smtp-Source: ABdhPJzbv1kB3Yq7JKnSuetxw1I8iMndxrSmXsnsj4Tim8X3eOIe9C5gzqq0FTHXrnc1Q0zOWUDWjQ==
X-Received: by 2002:a05:600c:14c6:: with SMTP id
 i6mr4491759wmh.169.1625233029634; 
 Fri, 02 Jul 2021 06:37:09 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id 204sm3353242wma.30.2021.07.02.06.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] hw/mips/jazz: move PROM and checksum calculation from
 dp8393x device to board
Date: Fri,  2 Jul 2021 15:35:51 +0200
Message-Id: <20210702133557.60317-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Message-Id: <20210625065401.30170-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/jazz.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1e1cf8154e7..89ca8bb9107 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -119,6 +119,8 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
 
+#define SONIC_PROM_SIZE 0x1000
+
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
@@ -137,6 +139,7 @@ static void mips_jazz_init(MachineState *machine,
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
     MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
+    MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
     NICInfo *nd;
     DeviceState *dev, *rc4030;
     SysBusDevice *sysbus;
@@ -228,6 +231,10 @@ static void mips_jazz_init(MachineState *machine,
                           NULL, "dummy_dma", 0x1000);
     memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
 
+    memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-jazz.prom",
+                           SONIC_PROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space, 0x8000b000, dp8393x_prom);
+
     /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
     memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
     memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
@@ -275,6 +282,9 @@ static void mips_jazz_init(MachineState *machine,
             nd->model = g_strdup("dp83932");
         }
         if (strcmp(nd->model, "dp83932") == 0) {
+            int checksum, i;
+            uint8_t *prom;
+
             qemu_check_nic_model(nd, "dp83932");
 
             dev = qdev_new("dp8393x");
@@ -285,8 +295,19 @@ static void mips_jazz_init(MachineState *machine,
             sysbus = SYS_BUS_DEVICE(dev);
             sysbus_realize_and_unref(sysbus, &error_fatal);
             sysbus_mmio_map(sysbus, 0, 0x80001000);
-            sysbus_mmio_map(sysbus, 1, 0x8000b000);
             sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(rc4030, 4));
+
+            /* Add MAC address with valid checksum to PROM */
+            prom = memory_region_get_ram_ptr(dp8393x_prom);
+            checksum = 0;
+            for (i = 0; i < 6; i++) {
+                prom[i] = nd->macaddr.a[i];
+                checksum += prom[i];
+                if (checksum > 0xff) {
+                    checksum = (checksum + 1) & 0xff;
+                }
+            }
+            prom[7] = 0xff - checksum;
             break;
         } else if (is_help_option(nd->model)) {
             error_report("Supported NICs: dp83932");
-- 
2.31.1


