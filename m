Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD786017D3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:06 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVx3-0000J2-HI
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfK-00025L-CD; Mon, 17 Oct 2022 15:20:46 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfI-0002u7-Gw; Mon, 17 Oct 2022 15:20:46 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-132fb4fd495so14361834fac.12; 
 Mon, 17 Oct 2022 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZQykwjZqwGTWxOf/YzIbRogh8MERmGIFs/3pjISJgM=;
 b=B17mBJl5YQ9SwiXghfxIL45MSI8gqErR1N/2cRIFSjDl24ru+2brM3vZzRQUyQesl8
 vPUn2RqZlicKzqU4W/5O1BgUa7AbxaZOLpK0u5GwiWwqVLnsWXMQCt8MseCUxruXVwr1
 8vkuvcl1PSN1EJ0FjblUqsaXZB46gzcRo9PaVBlQkXClQCAfCQQo/Dg6JnQgRZidqZ9F
 PbC5Yc53oKHYs47uh6cjoRnzXHe0hxduhWW2Yg3wJCUsbabLlhrwzacr7caBiob4jBWi
 5bKS2FaOTzUy3FwbO8Sz3Ih8MNepzIkqf0odaPoBtCuwJmH5o+3b/N3mxjGJ7uUsJf9A
 234w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ZQykwjZqwGTWxOf/YzIbRogh8MERmGIFs/3pjISJgM=;
 b=mTFKqlBtWK4QXYraOnOrMNxMgO7W+8XeWEq2rXu9ecZ3tC+X0I2Db97R1IA33EOH+f
 VhbO8vARZnfRZ00DCJJKIjwVFkaX2ZVCzNMMjg15GEYl/lCwN02AjZ9ZMZ5QLkMw7xI9
 yMBYU9PH3jIi5BV1eb7Ky2X2yDVJrz7ekGVR2QwvqFfspv0B8d81KbbNJjUFk84kOYqN
 djK8EKyxhZhPR6LMvchuacp+mE83RYBLswga4TgFa8tNOMh3w8DHt30+LqIfb5S5J36x
 joLofYtbdObH0yY24SmKA+nB6b4XqUILF30iDvx5dQk7QOz6YzIrj/51mkljOP7EBcCT
 7xDw==
X-Gm-Message-State: ACrzQf3cUsJ5W1z2EfNA4Nzl7aCQFvgTrtlq4yy+/B97KKAnVOCq+0yK
 gAqRgjlXE8ZvnOD229wAjmQc810uBkA=
X-Google-Smtp-Source: AMsMyM6xOUkVxNzvXMy74Anisu609Z+PfH94mFT1JQpY4JdpofKtJgnH/2oWPIc0V4OD41RlApruzw==
X-Received: by 2002:a05:6870:f2a6:b0:136:6442:4b52 with SMTP id
 u38-20020a056870f2a600b0013664424b52mr16171190oap.282.1666034442722; 
 Mon, 17 Oct 2022 12:20:42 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/38] ppc4xx_sdram: Drop extra zeros for readability
Date: Mon, 17 Oct 2022 16:19:41 -0300
Message-Id: <20221017192009.92404-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Constants that are written zero padded for no good reason are hard to
read, it's easier to see what is meant if it's just 0 or 1 instead.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <93974622c3d398c7d3a3488b678b74c3807849de.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_devs.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 3d700e5c85..02ac8ff335 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -54,31 +54,31 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
 
     switch (ram_size) {
     case 4 * MiB:
-        bcr = 0x00000000;
+        bcr = 0;
         break;
     case 8 * MiB:
-        bcr = 0x00020000;
+        bcr = 0x20000;
         break;
     case 16 * MiB:
-        bcr = 0x00040000;
+        bcr = 0x40000;
         break;
     case 32 * MiB:
-        bcr = 0x00060000;
+        bcr = 0x60000;
         break;
     case 64 * MiB:
-        bcr = 0x00080000;
+        bcr = 0x80000;
         break;
     case 128 * MiB:
-        bcr = 0x000A0000;
+        bcr = 0xA0000;
         break;
     case 256 * MiB:
-        bcr = 0x000C0000;
+        bcr = 0xC0000;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
                       ram_size);
-        return 0x00000000;
+        return 0;
     }
     bcr |= ram_base & 0xFF800000;
     bcr |= 1;
@@ -109,7 +109,7 @@ static target_ulong sdram_size(uint32_t bcr)
 static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bank[i].bcr & 0x00000001) {
+    if (sdram->bank[i].bcr & 1) {
         /* Unmap RAM */
         trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
                                  sdram_size(sdram->bank[i].bcr));
@@ -120,7 +120,7 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
         object_unparent(OBJECT(&sdram->bank[i].container));
     }
     sdram->bank[i].bcr = bcr & 0xFFDEE001;
-    if (enabled && (bcr & 0x00000001)) {
+    if (enabled && (bcr & 1)) {
         trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
         memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
@@ -141,7 +141,7 @@ static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
             sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
                                                   sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0x00000000, 0);
+            sdram_set_bcr(sdram, i, 0, 0);
         }
     }
 }
@@ -218,7 +218,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
         break;
     default:
         /* Avoid gcc warning */
-        ret = 0x00000000;
+        ret = 0;
         break;
     }
 
@@ -311,18 +311,18 @@ static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
 {
     Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
 
-    sdram->addr = 0x00000000;
-    sdram->bear = 0x00000000;
-    sdram->besr0 = 0x00000000; /* No error */
-    sdram->besr1 = 0x00000000; /* No error */
-    sdram->cfg = 0x00000000;
-    sdram->ecccfg = 0x00000000; /* No ECC */
-    sdram->eccesr = 0x00000000; /* No error */
+    sdram->addr = 0;
+    sdram->bear = 0;
+    sdram->besr0 = 0; /* No error */
+    sdram->besr1 = 0; /* No error */
+    sdram->cfg = 0;
+    sdram->ecccfg = 0; /* No ECC */
+    sdram->eccesr = 0; /* No error */
     sdram->pmit = 0x07C00000;
     sdram->rtr = 0x05F00000;
     sdram->tr = 0x00854009;
     /* We pre-initialize RAM banks */
-    sdram->status = 0x00000000;
+    sdram->status = 0;
     sdram->cfg = 0x00800000;
 }
 
-- 
2.37.3


