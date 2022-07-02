Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F456415C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 18:16:02 +0200 (CEST)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7fmq-00084L-MU
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 12:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7fke-0007CI-Cj; Sat, 02 Jul 2022 12:13:44 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:58101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7fkc-0000a0-Bf; Sat, 02 Jul 2022 12:13:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2DCCE2B05635;
 Sat,  2 Jul 2022 12:13:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 02 Jul 2022 12:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656778417; x=1656782017; bh=6pcsCTAT6UOobcVoPJNWHIdGc
 2h/ZielQl7uytO4ylc=; b=Ydlf7OBiS/mGRYlppsKX5aLUX+hp6FHhUBoVnLv4X
 gXrlXdQk0GCyZRSpwvCuJciSpe6O0HrIenThNvOM4Cs96XUWjWX2TtytuvfMjlyI
 DBA9drrWJ58PSVluhmcMO+ZTLG6Wcrz3TY4f/LqwM2PqjL4mbemwYj9tvvMKGHPg
 lvvFuC6st72m/Xfy85jrseJNNcydRJF8BKBA6+7ERMSHS8io3EaHcS4i+RpZmvM9
 sXbx5BiqY+bttlk/MZ7Ihxx0Knvsb41PWSQq7zCsUjfNrCiRNnEh7/IhCFhR6/OI
 aT1quXzw6GpW5jZUcd0gYJkauEM1a3AYSKrZtGayzvwuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656778417; x=1656782017; bh=6pcsCTAT6UOobcVoPJNWHIdGc2h/Ziel
 Ql7uytO4ylc=; b=c6HbA2Qqm96V+l03Bm6mCUamn52f/75smpweNBB/iYjkJ2yv
 hUnWewCWgmnLn8xNxtCz0A0dTsr8VKWi9AMNIxVluDM7FPs9Mp+cUEAN29b0yTFQ
 HkicWBVQj5GmO3JF+JnPKmSKVKgsrUnIVMCelF9Fmv3b7uMp7AQX+rz9f766TCN3
 xm+qZZZZz1Y9Ni4dvJJw/26GUxfwmVvE74meULYRlXgdSSb2Y0NY7QyaH8Hf7Qll
 Ozr1sDD0+gL88GFVhlAt+QoBw2/qk5rBURsYAXDQnc5J0/Xs+JnucSk+fokEBQRm
 Fgh1no64DMqvbefHFfhnLhPqPx3Va/F+4uMbiQ==
X-ME-Sender: <xms:sW7AYuMrEQERZxj7fxjFs5BGTpX4Z0yUSDwsansEp3AuFke6mvyZiA>
 <xme:sW7AYs-993hEV35KV83nKkn0gxMiysQsHgfRDAsu39MZvYTzNAcYSnheiThj9AkyC
 -hrjLHeHJAyBk8tIuI>
X-ME-Received: <xmr:sW7AYlQjOIos3s6pbG9vtrOenGugowHWSljzv_B3wh3pLVyplNmH10CpHG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehhedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgurhephffvvefufffkofgg
 gfestdekredtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceoph
 gvthgvrhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepvdejgefhkeejjeeitddu
 tddvueegheehfeelteffueegjedutdetgfdvgeevieegnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:sW7AYuvu9_fJ_6KhJUmw7YqVG1jSNaR8ScIfPTTvKy8NwZwHd_R-vg>
 <xmx:sW7AYmegH5wI1dXf2tkeN2-Wsjv-PpyjTgemFF_A-RYou68qLfkJjA>
 <xmx:sW7AYi1ybpXs0QrVTvmAg6RW_BXDJ2FWAevB0DnmKRRscJwopoqrJg>
 <xmx:sW7AYjEck43x2jZBfdRn3D4cs2gDNN9LlkZtGMgz13SvumZUQBtmKW1h8EE>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 12:13:36 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <me@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] aspeed: Create SRAM name from first CPU index
Date: Sat,  2 Jul 2022 09:13:27 -0700
Message-Id: <20220702161327.80501-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <me@pjd.dev>

To support multiple SoC's running simultaneously, we need a unique name for
each RAM region. DRAM is created by the machine, but SRAM is created by the
SoC, since in hardware it is part of the SoC's internals.

We need a way to uniquely identify each SRAM region though, for VM
migration. Since each of the SoC's CPU's has an index which identifies it
uniquely from other CPU's in the machine, we can use the index of any of the
CPU's in the SoC to uniquely identify differentiate the SRAM name from other
SoC SRAM's. In this change, I just elected to use the index of the first CPU
in each SoC.

Signed-off-by: Peter Delevoryas <me@pjd.dev>
---
Interdiff against v1:
  diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
  index b6b6f0d053..677699e54c 100644
  --- a/hw/arm/aspeed_ast10x0.c
  +++ b/hw/arm/aspeed_ast10x0.c
  @@ -159,7 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
       DeviceState *armv7m;
       Error *err = NULL;
       int i;
  -    char name[64];
  +    g_autofree char *sram_name = NULL;
   
       if (!clock_has_source(s->sysclk)) {
           error_setg(errp, "sysclk clock must be wired up by the board code");
  @@ -184,9 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
   
       /* Internal SRAM */
  -    snprintf(name, sizeof(name), "aspeed.sram.%d",
  -             CPU(s->armv7m.cpu)->cpu_index);
  -    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
  +    sram_name = g_strdup_printf("aspeed.sram.%d",
  +                                CPU(s->armv7m.cpu)->cpu_index);
  +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
       if (err != NULL) {
           error_propagate(errp, err);
           return;
  diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
  index 7efb9f888a..64eb5a7b26 100644
  --- a/hw/arm/aspeed_ast2600.c
  +++ b/hw/arm/aspeed_ast2600.c
  @@ -276,7 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
       Error *err = NULL;
       qemu_irq irq;
  -    char name[64];
  +    g_autofree char *sram_name = NULL;
   
       /* IO space */
       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
  @@ -336,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
       }
   
       /* SRAM */
  -    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
  -    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
  +    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
  +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
       if (err) {
           error_propagate(errp, err);
           return;
  diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
  index 1ddba33d2a..0bb6a2f092 100644
  --- a/hw/arm/aspeed_soc.c
  +++ b/hw/arm/aspeed_soc.c
  @@ -239,7 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
       AspeedSoCState *s = ASPEED_SOC(dev);
       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
       Error *err = NULL;
  -    char name[64];
  +    g_autofree char *sram_name = NULL;
   
       /* IO space */
       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
  @@ -260,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
       }
   
       /* SRAM */
  -    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
  -    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
  +    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
  +    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
       if (err) {
           error_propagate(errp, err);
           return;

 hw/arm/aspeed_ast10x0.c | 5 ++++-
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef331771..677699e54c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
+    g_autofree char *sram_name = NULL;
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
-    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d",
+                                CPU(s->armv7m.cpu)->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11..64eb5a7b26 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
     qemu_irq irq;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcd..0bb6a2f092 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.37.0


