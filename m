Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9F59A2D0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:13:53 +0200 (CEST)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5ZA-0001S1-PR
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hl-0007uj-Es; Fri, 19 Aug 2022 12:55:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:14264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hh-0000xV-Co; Fri, 19 Aug 2022 12:55:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5DD417475F9;
 Fri, 19 Aug 2022 18:55:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 36A827470B9; Fri, 19 Aug 2022 18:55:47 +0200 (CEST)
Message-Id: <f6d9eec237e5cc84a314d8eb67294212f93076ef.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 08/20] ppc4xx_sdram: Drop extra zeros for readability
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:47 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Constants that are written zero padded for no good reason are hard to
read, it's easier to see what is meant if it's just 0 or 1 instead.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc4xx_devs.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 375834a52b..bfe7b2d3a6 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -49,31 +49,31 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
 
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
@@ -104,7 +104,7 @@ static target_ulong sdram_size(uint32_t bcr)
 static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bank[i].bcr & 0x00000001) {
+    if (sdram->bank[i].bcr & 1) {
         /* Unmap RAM */
         trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
                                  sdram_size(sdram->bank[i].bcr));
@@ -115,7 +115,7 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
         object_unparent(OBJECT(&sdram->bank[i].container));
     }
     sdram->bank[i].bcr = bcr & 0xFFDEE001;
-    if (enabled && (bcr & 0x00000001)) {
+    if (enabled && (bcr & 1)) {
         trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
         memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
@@ -136,7 +136,7 @@ static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
             sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
                                                   sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0x00000000, 0);
+            sdram_set_bcr(sdram, i, 0, 0);
         }
     }
 }
@@ -213,7 +213,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
         break;
     default:
         /* Avoid gcc warning */
-        ret = 0x00000000;
+        ret = 0;
         break;
     }
 
@@ -306,18 +306,18 @@ static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
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
2.30.4


