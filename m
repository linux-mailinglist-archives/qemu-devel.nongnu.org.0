Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C062E6017D5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:11 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVx7-0000Wf-Cp
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfX-0002IT-PZ; Mon, 17 Oct 2022 15:21:02 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfV-0002vh-AN; Mon, 17 Oct 2022 15:20:59 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1326637be6eso14352961fac.13; 
 Mon, 17 Oct 2022 12:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNDTB7Q4nIjVVc69bcjY3ZYCC+sosnrGEblK6CaxzkE=;
 b=Vj9TZRCHck+nEYfOaRAL7+XBoHEZoqqXdx2f+vptjemEXm6w23nu2Q9JJk0t+CjYRq
 N7maCS+VI6KC7wGRmbiX+2h1dcA/JrEtmxGMebC7CQbRaNwckAKK6g3vPp5NpFe3Hw0U
 CAggV1WB0WmONys8OCTZyHET3Yfl60sZ5y2npoNnIRbu6ZJ2V5htbEr+O3KmLdYd4eq5
 CeqvLSXjorylO+YOmx4vYu4fHhujCI8ekA6VQDNIiYCcB1xjAsNm/BjC/mmojA47RjWq
 2+UkkMuSjibq9VrMzUDIl7B+HAbbMY3Es0lYCQ1lMmDvGmnmSG3T5qT7dQEaZNX63ld2
 +y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNDTB7Q4nIjVVc69bcjY3ZYCC+sosnrGEblK6CaxzkE=;
 b=1W/PJr+VLkNkwrzW0rhmiFvsOuZKz7FCq/m1LcmTdWwIAoKG3MWborMdpxbXvsRJdL
 lMRe8mloF8W8dRUuJY33yNaAYc/dU/OLU9qTlpy++WPWtDUACcc/aZErEZyV4/AwEBkg
 /CRPphrMPHC6TBlKy/dXgGIk5JigPaEFvSYeKjYDVDNUz6thB+cXwhDY1OQ97frmYLkR
 SOBwf4EXU4WYo9C8Be8BnIaOlA6SlXNynRe1zquur7M6vnid38wqezNOi40p6Oadqs6h
 wQM+boHCaCg6flXNtM9WMMWSCWW3dDWZ/sSv1PswkAirGWq9VclsBD5YhsNhjlZvD40x
 z8fw==
X-Gm-Message-State: ACrzQf0UILyZk3ZByXcxG4KhJapPNTrKh+jukYpqL+yrEtnVW9Y0asrY
 IN0f8msg9Cc8WBqNkpqrPw/dWX9q1Lc=
X-Google-Smtp-Source: AMsMyM7fvuwxBaOulCgYf8n6Jg8gWYPWjxKfWm1CW3CB26YjUxnbonLayrQOEdl9u/cm/4RCKtXdkw==
X-Received: by 2002:a05:6870:c147:b0:136:90c4:ee84 with SMTP id
 g7-20020a056870c14700b0013690c4ee84mr6528286oad.295.1666034455696; 
 Mon, 17 Oct 2022 12:20:55 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 15/38] ppc4xx_sdram: Rename functions to prevent name clashes
Date: Mon, 17 Oct 2022 16:19:46 -0300
Message-Id: <20221017192009.92404-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

Rename functions to avoid name clashes when moving the DDR2 controller
model currently called ppc440_sdram to ppc4xx_devs. This also more
clearly shows which function belongs to which model.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <9c09d10fbf36940ebbe30d7038d69cf3f2e58371.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c  |  2 +-
 hw/ppc/ppc440_bamboo.c  |  2 +-
 hw/ppc/ppc440_uc.c      | 67 +++++++++++++++++++++--------------------
 hw/ppc/ppc4xx_devs.c    | 46 ++++++++++++++--------------
 hw/ppc/sam460ex.c       |  2 +-
 include/hw/ppc/ppc4xx.h |  4 +--
 6 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index b59393d4bd..4092ebc1ab 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -337,7 +337,7 @@ static void ppc405_init(MachineState *machine)
 
     /* Load ELF kernel and rootfs.cpio */
     } else if (kernel_filename && !machine->firmware) {
-        ppc4xx_sdram_enable(&ppc405->soc.sdram);
+        ppc4xx_sdram_ddr_enable(&ppc405->soc.sdram);
         boot_from_kernel(machine, &ppc405->soc.cpu);
     }
 }
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 5c35ba6086..56f47e7509 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -204,7 +204,7 @@ static void bamboo_init(MachineState *machine)
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(uicdev, 14));
     /* Enable SDRAM memory regions, this should be done by the firmware */
-    ppc4xx_sdram_enable(PPC4xx_SDRAM_DDR(dev));
+    ppc4xx_sdram_ddr_enable(PPC4xx_SDRAM_DDR(dev));
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 97e6d5f5b2..edd0781eb7 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -505,7 +505,7 @@ enum {
     SDRAM_PLBADDUHB = 0x50,
 };
 
-static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
+static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
 
@@ -550,12 +550,12 @@ static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr2_base(uint32_t bcr)
 {
     return (bcr & 0xffe00000) << 2;
 }
 
-static uint64_t sdram_size(uint32_t bcr)
+static uint64_t sdram_ddr2_size(uint32_t bcr)
 {
     uint64_t size;
     int sh;
@@ -581,48 +581,49 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
     object_unparent(OBJECT(&bank->container));
 }
 
-static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
+                               uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
+                                 sdram_ddr2_size(sdram->bank[i].bcr));
         sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
         sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-static void sdram_map_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+            sdram_ddr2_set_bcr(sdram, i,
+                               sdram_ddr2_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr2_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
         }
     }
 }
 
-static uint32_t dcr_read_sdram(void *opaque, int dcrn)
+static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
     ppc440_sdram_t *sdram = opaque;
     uint32_t ret = 0;
@@ -633,8 +634,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
         if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
-            ret = sdram_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
-                            sdram->bank[dcrn - SDRAM_R0BAS].size);
+            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -677,7 +678,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 
 #define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
 
-static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
+static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -704,13 +705,13 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
                 (val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr2_map_bcr(sdram);
                 sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
             } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
                        !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr2_unmap_bcr(sdram);
                 sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
             }
             break;
@@ -723,7 +724,7 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset(void *opaque)
+static void sdram_ddr2_reset(void *opaque)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -744,33 +745,33 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
         s->bank[i].base = ram_banks[i].base;
         s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, s);
+    qemu_register_reset(&sdram_ddr2_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 }
 
-void ppc440_sdram_enable(CPUPPCState *env)
+void ppc4xx_sdram_ddr2_enable(CPUPPCState *env)
 {
     ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21);
     ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000);
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 02ac8ff335..12af90f244 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -86,12 +86,12 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr_base(uint32_t bcr)
 {
     return bcr & 0xFF800000;
 }
 
-static target_ulong sdram_size(uint32_t bcr)
+static target_ulong sdram_ddr_size(uint32_t bcr)
 {
     target_ulong size;
     int sh;
@@ -106,13 +106,13 @@ static target_ulong sdram_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
+                              uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].container);
         memory_region_del_subregion(&sdram->bank[i].container,
@@ -121,38 +121,38 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
     }
     sdram->bank[i].bcr = bcr & 0xFFDEE001;
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
         memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
+                           sdram_ddr_size(bcr));
         memory_region_add_subregion(&sdram->bank[i].container, 0,
                                     &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
+                                    sdram_ddr_base(bcr),
                                     &sdram->bank[i].container);
     }
 }
 
-static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size != 0) {
-            sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
-                                                  sdram->bank[i].size), 1);
+            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
+                                                      sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].ram);
     }
@@ -249,12 +249,12 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr_map_bcr(sdram);
                 sdram->status &= ~0x80000000;
             } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr_unmap_bcr(sdram);
                 sdram->status |= 0x80000000;
             }
             if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
@@ -274,16 +274,16 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             sdram->pmit = (val & 0xF8000000) | 0x07C00000;
             break;
         case 0x40: /* SDRAM_B0CR */
-            sdram_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
             break;
         case 0x44: /* SDRAM_B1CR */
-            sdram_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
             break;
         case 0x48: /* SDRAM_B2CR */
-            sdram_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
             break;
         case 0x4C: /* SDRAM_B3CR */
-            sdram_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
             break;
         case 0x80: /* SDRAM_TR */
             sdram->tr = val & 0x018FC01F;
@@ -370,7 +370,7 @@ static void ppc4xx_sdram_ddr_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ppc4xx_sdram_ddr_props);
 }
 
-void ppc4xx_sdram_enable(Ppc4xxSdramDdrState *s)
+void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s)
 {
     sdram_ddr_dcr_write(s, SDRAM0_CFGADDR, 0x20);
     sdram_ddr_dcr_write(s, SDRAM0_CFGDATA, 0x80000000);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 9c01211b20..b318521b01 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -347,7 +347,7 @@ static void sam460ex_init(MachineState *machine)
     /* FIXME: does 460EX have ECC interrupts? */
     ppc440_sdram_init(env, 1, ram_banks);
     /* Enable SDRAM memory regions as we may boot without firmware */
-    ppc440_sdram_enable(env);
+    ppc4xx_sdram_ddr2_enable(env);
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 78a845399e..fd0b3ca82a 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -37,7 +37,7 @@ typedef struct {
     uint32_t bcr;
 } Ppc4xxSdramBank;
 
-void ppc440_sdram_enable(CPUPPCState *env);
+void ppc4xx_sdram_ddr2_enable(CPUPPCState *env);
 
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         Ppc4xxSdramBank ram_banks[],
@@ -136,6 +136,6 @@ struct Ppc4xxSdramDdrState {
     uint32_t eccesr;
 };
 
-void ppc4xx_sdram_enable(Ppc4xxSdramDdrState *s);
+void ppc4xx_sdram_ddr_enable(Ppc4xxSdramDdrState *s);
 
 #endif /* PPC4XX_H */
-- 
2.37.3


