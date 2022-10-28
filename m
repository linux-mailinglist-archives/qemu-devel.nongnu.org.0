Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921776117EA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooST2-0004fS-4y; Fri, 28 Oct 2022 12:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSb-00083J-Am; Fri, 28 Oct 2022 12:43:57 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSZ-0000x4-EB; Fri, 28 Oct 2022 12:43:57 -0400
Received: by mail-oi1-x22e.google.com with SMTP id t10so6713221oib.5;
 Fri, 28 Oct 2022 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBrwTuwxTINYomi1VC9LETpZYFuYBfHxFA0/fjQxWuU=;
 b=n8RdTvikdtfnLjDOjgsRZ0BUm9QuCyz4gGTsEeiIGthWnEhXKS/YLvBF83C6B+YU4q
 zNXFNhv9XjnSc8yRcRmGy+E58uGhDKYWVh20sArCSYA0kQZt9NGVFWUaR/dAKZ31k2Lx
 /d3ASWFfGTnFFKA9DXb6Memy7Gk4TOWQADm3gh3wrxXAlKBsxrtlxNauurZExO39lYsd
 zkybTceb7wGpbS/m2ndZOofZ/Pi0idQVm/Aj80IsVO8B82iaBQ3ubXc+rZCUZOB/R0eX
 +JWf5b8BPDf9WGv6IvwSoxmj032/R8/cryRqAlJ444lzSoU9K9lnOWFcxO7JkR6sbD4L
 zoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBrwTuwxTINYomi1VC9LETpZYFuYBfHxFA0/fjQxWuU=;
 b=dm44e/818JbaIk8OnZOwZz7GThlxoLxMlgtN0PokNz7dpeA4iYmul81Y+01XiSbzgX
 PoS8sLYrftj1Qr5pYljrw2qOEi/msyR0SAKNeDgXr20k0z+7bMHYep55iBRfBAshmuz0
 D6fcFHLZO3r2YmUrD5YkuSxSGFs9i96m3JlA2Mq864qTPvcHwkolf3rySw5PH+FHR4TG
 G1fm54L3xK1LJHxoJsIGfcH1LiV0XLmAul3GIaIePfAW/m6Pn0eSHrJ+0oeOQ6o+Snpv
 HrVnIlwzUbQmSgVwW+HyV23f3yBtYec2Q5m7z1xD43n+GkRo/VVxLTDg5Bc8N335To1w
 FYpQ==
X-Gm-Message-State: ACrzQf2vWh2jvfTpyWu56xRSvLVxNBC4EMoRPiGciv2INc4P7+go9hDh
 rzKejkEim2X+J+gIcEsS3W48juHcGtJEgw==
X-Google-Smtp-Source: AMsMyM4Qow+KNFDa62Ej9REYbgilX4TFTx1AAFliQfbBydV0cHU/yIe5GGfC4RpNh5UZRUpFX1T2yA==
X-Received: by 2002:a05:6808:140a:b0:355:230f:b7f1 with SMTP id
 w10-20020a056808140a00b00355230fb7f1mr8645740oiv.8.1666975433737; 
 Fri, 28 Oct 2022 09:43:53 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 53/62] ppc4xx_sdram: Generalise bank setup
Date: Fri, 28 Oct 2022 13:39:42 -0300
Message-Id: <20221028163951.810456-54-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Currently only base and size are set on initial bank creation and bcr
value is computed on mapping the region. Set bcr at init so the bcr
encoding method becomes local to the controller model and mapping and
unmapping can operate on the bank so it can be shared between
different controller models. This patch converts the DDR2 controller.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <51b957b4b2d714a1072aa2589b979e08411640df.1666194485.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_sdram.c | 91 ++++++++++++++++++++++---------------------
 hw/ppc/trace-events   |  1 +
 2 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 4bc53c8f01..63a33b8fd4 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -105,6 +105,7 @@ static void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
 
 static void sdram_bank_map(Ppc4xxSdramBank *bank)
 {
+    trace_ppc4xx_sdram_map(bank->base, bank->size);
     memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
     memory_region_add_subregion(&bank->container, 0, &bank->ram);
     memory_region_add_subregion(get_system_memory(), bank->base,
@@ -113,11 +114,26 @@ static void sdram_bank_map(Ppc4xxSdramBank *bank)
 
 static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
 {
+    trace_ppc4xx_sdram_unmap(bank->base, bank->size);
     memory_region_del_subregion(get_system_memory(), &bank->container);
     memory_region_del_subregion(&bank->container, &bank->ram);
     object_unparent(OBJECT(&bank->container));
 }
 
+static void sdram_bank_set_bcr(Ppc4xxSdramBank *bank, uint32_t bcr,
+                               hwaddr base, hwaddr size, int enabled)
+{
+    if (memory_region_is_mapped(&bank->container)) {
+        sdram_bank_unmap(bank);
+    }
+    bank->bcr = bcr;
+    bank->base = base;
+    bank->size = size;
+    if (enabled && (bcr & 1)) {
+        sdram_bank_map(bank);
+    }
+}
+
 enum {
     SDRAM0_CFGADDR = 0x010,
     SDRAM0_CFGDATA = 0x011,
@@ -455,6 +471,8 @@ void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
 
 /*****************************************************************************/
 /* DDR2 SDRAM controller */
+#define SDRAM_DDR2_BCR_MASK 0xffe0ffc1
+
 enum {
     SDRAM_R0BAS = 0x40,
     SDRAM_R1BAS,
@@ -528,48 +546,6 @@ static hwaddr sdram_ddr2_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
-                               uint32_t bcr, int enabled)
-{
-    if (sdram->bank[i].bcr & 1) {
-        /* First unmap RAM if enabled */
-        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
-                                 sdram_ddr2_size(sdram->bank[i].bcr));
-        sdram_bank_unmap(&sdram->bank[i]);
-    }
-    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
-    if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
-        sdram_bank_map(&sdram->bank[i]);
-    }
-}
-
-static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size) {
-            sdram_ddr2_set_bcr(sdram, i,
-                               sdram_ddr2_bcr(sdram->bank[i].base,
-                                              sdram->bank[i].size), 1);
-        } else {
-            sdram_ddr2_set_bcr(sdram, i, 0, 0);
-        }
-    }
-}
-
-static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size) {
-            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
-        }
-    }
-}
-
 static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
     Ppc4xxSdramDdr2State *s = opaque;
@@ -628,6 +604,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
     Ppc4xxSdramDdr2State *s = opaque;
+    int i;
 
     switch (dcrn) {
     case SDRAM_R0BAS:
@@ -652,13 +629,25 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
                 (val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_ddr2_map_bcr(s);
+                for (i = 0; i < s->nbanks; i++) {
+                    if (s->bank[i].size) {
+                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                                           s->bank[i].base, s->bank[i].size,
+                                           1);
+                    }
+                }
                 s->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
             } else if ((s->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
                        !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_ddr2_unmap_bcr(s);
+                for (i = 0; i < s->nbanks; i++) {
+                    if (s->bank[i].size) {
+                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                                           s->bank[i].base, s->bank[i].size,
+                                           0);
+                    }
+                }
                 s->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
             }
             break;
@@ -691,6 +680,7 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
         2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
         64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
     };
+    int i;
 
     if (s->nbanks < 1 || s->nbanks > 4) {
         error_setg(errp, "Invalid number of RAM banks");
@@ -701,6 +691,19 @@ static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
         return;
     }
     ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    for (i = 0; i < s->nbanks; i++) {
+        if (s->bank[i].size) {
+            s->bank[i].bcr = sdram_ddr2_bcr(s->bank[i].base, s->bank[i].size);
+            s->bank[i].bcr &= SDRAM_DDR2_BCR_MASK;
+            sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                               s->bank[i].base, s->bank[i].size, 0);
+        } else {
+            sdram_bank_set_bcr(&s->bank[i], 0, 0, 0, 0);
+        }
+        trace_ppc4xx_sdram_init(sdram_ddr2_base(s->bank[i].bcr),
+                                sdram_ddr2_size(s->bank[i].bcr),
+                                s->bank[i].bcr);
+    }
 
     ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
                         s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 956938ebcd..f670e8906c 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -179,3 +179,4 @@ ppc405ep_clocks_setup(const char *trace) "%s"
 ppc4xx_sdram_enable(const char *trace) "%s SDRAM controller"
 ppc4xx_sdram_unmap(uint64_t addr, uint64_t size) "Unmap RAM area 0x%" PRIx64 " size 0x%" PRIx64
 ppc4xx_sdram_map(uint64_t addr, uint64_t size) "Map RAM area 0x%" PRIx64 " size 0x%" PRIx64
+ppc4xx_sdram_init(uint64_t base, uint64_t size, uint32_t bcr) "Init RAM area 0x%" PRIx64 " size 0x%" PRIx64 " bcr 0x%x"
-- 
2.37.3


