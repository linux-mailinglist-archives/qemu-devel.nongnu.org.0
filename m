Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A8B39A538
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:02:16 +0200 (CEST)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopnT-0003cb-SO
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkc-0008Ao-4q
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkZ-0006pt-12
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id h3so3716298wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OuMFA2eQdlNrszvmIFOtEWyVEhnqtmKjrHNCjbXVytw=;
 b=FlHjFmI6I9FvX7voLKBCUep7AKi2wJW7iNzNtF40PSQKC0gyvAsE5w1hiv+ng1UpbY
 Ewg1Nslg0lQk8MLyrqJAq9ypWShUFAgkz+hckXglv3qp1RhWWEb6vxHPo+GBxwyX/1ZF
 JUnfwkAo/jPehbkLXJpipXaXcUHExNty9Ajgt73s26WI+kwC9ZQL/0epROVMMircQhp0
 YLiTRXNeEoQxQCDR5TxB7lHbummFQCD2PL0HhAnJdyDuAfQNAKQqhFYFQziKFuHn1HiX
 SRj7PACQPWvP1vQvEgLGbLnpeKoTuBtX8f77aoj/aoYLGBJL0UrMoeFtWaCWrHD/h0Xf
 Rhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuMFA2eQdlNrszvmIFOtEWyVEhnqtmKjrHNCjbXVytw=;
 b=P/xafd7BaXIgfqdQW4UApY4rTpE0xwrsnsVkQeL1Iwr01bQJ0m/l9KCOGWx/2EXvjl
 rGdnbGtHGSqXqpzOWXI5hpSe7MBForAVGoeNw/77cEYqqUvDWpVnHJaP7eNxEUSAkabB
 uTV6qXoUp2eU5Zn/lzIpKu3ImNJw29ifGmwYoknCqZAmM+A4OwwtGQTfRJhBtVCHvtiW
 yoBzjOQxbQEaKVcYcsPK169YazldK00mSCM636pVXXOl49xEA1qIy2EWhVhuBkjnWJcy
 Suxxmt6cOMtgcUgEDPe3fHK5BhrmHV/2VOrkmrJ/knGizGS1zRXrcjI1XE2XdNZLaXFL
 LA2w==
X-Gm-Message-State: AOAM5305t1n/sWI9hHWkRaRmYNwUDHN9OVXZlNfYVf97Y+vBtqGWPxiT
 MirQmwaOLZC022sGrSIGGDL9ATBSVrieU1mJ
X-Google-Smtp-Source: ABdhPJxUpxAPyS/nbZUl9hPSuarhQUascleSSOmX966WjDuUN53jmrVbsVlYcgw13lPakAAy0xuM5g==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr26588317wmb.8.1622735953628; 
 Thu, 03 Jun 2021 08:59:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
Date: Thu,  3 Jun 2021 16:58:28 +0100
Message-Id: <20210603155904.26021-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The official punctuation for Arm CPU names uses a hyphen, like
"Cortex-A9". We mostly follow this, but in a few places usage
without the hyphen has crept in. Fix those so we consistently
use the same way of writing the CPU name.

This commit was created with:
  git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210527095152.10968-1-peter.maydell@linaro.org
---
 docs/system/arm/aspeed.rst    | 4 ++--
 docs/system/arm/nuvoton.rst   | 6 +++---
 docs/system/arm/sabrelite.rst | 2 +-
 include/hw/arm/allwinner-h3.h | 2 +-
 hw/arm/aspeed.c               | 6 +++---
 hw/arm/mcimx6ul-evk.c         | 2 +-
 hw/arm/mcimx7d-sabre.c        | 2 +-
 hw/arm/npcm7xx_boards.c       | 4 ++--
 hw/arm/sabrelite.c            | 2 +-
 hw/misc/npcm7xx_clk.c         | 2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index a1911f94031..57ee2bd94fc 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -5,7 +5,7 @@ The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
 Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
 AST2500 with an ARM1176JZS CPU (800MHz) and more recently the AST2600
-with dual cores ARM Cortex A7 CPUs (1.2GHz).
+with dual cores ARM Cortex-A7 CPUs (1.2GHz).
 
 The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
 etc.
@@ -24,7 +24,7 @@ AST2500 SoC based machines :
 
 AST2600 SoC based machines :
 
-- ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex A7)
+- ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
 
 Supported devices
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index d3cf2d9cd7e..ca011bd4797 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -3,19 +3,19 @@ Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
 
 The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex A9 CPU cores, as well as an
+servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
 assortment of peripherals targeted for either Enterprise or Data Center /
 Hyperscale applications. The former is a superset of the latter, so NPCM750 has
 all the peripherals of NPCM730 and more.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
-The NPCM750 SoC has two Cortex A9 cores and is targeted for the Enterprise
+The NPCM750 SoC has two Cortex-A9 cores and is targeted for the Enterprise
 segment. The following machines are based on this chip :
 
 - ``npcm750-evb``       Nuvoton NPCM750 Evaluation board
 
-The NPCM730 SoC has two Cortex A9 cores and is targeted for Data Center and
+The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
 Hyperscale applications. The following machines are based on this chip :
 
 - ``quanta-gsj``        Quanta GSJ server BMC
diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
index 71713310e3a..4ccb0560afe 100644
--- a/docs/system/arm/sabrelite.rst
+++ b/docs/system/arm/sabrelite.rst
@@ -10,7 +10,7 @@ Supported devices
 
 The SABRE Lite machine supports the following devices:
 
- * Up to 4 Cortex A9 cores
+ * Up to 4 Cortex-A9 cores
  * Generic Interrupt Controller
  * 1 Clock Controller Module
  * 1 System Reset Controller
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index cc308a5d2c9..63025fb27c8 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -18,7 +18,7 @@
  */
 
 /*
- * The Allwinner H3 is a System on Chip containing four ARM Cortex A7
+ * The Allwinner H3 is a System on Chip containing four ARM Cortex-A7
  * processor cores. Features and specifications include DDR2/DDR3 memory,
  * SD/MMC storage cards, 10/100/1000Mbit Ethernet, USB 2.0, HDMI and
  * various I/O modules.
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3fe6c55744f..0eafc791540 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -947,7 +947,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
-    mc->desc       = "Aspeed AST2600 EVB (Cortex A7)";
+    mc->desc       = "Aspeed AST2600 EVB (Cortex-A7)";
     amc->soc_name  = "ast2600-a1";
     amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
@@ -966,7 +966,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
-    mc->desc       = "OpenPOWER Tacoma BMC (Cortex A7)";
+    mc->desc       = "OpenPOWER Tacoma BMC (Cortex-A7)";
     amc->soc_name  = "ast2600-a1";
     amc->hw_strap1 = TACOMA_BMC_HW_STRAP1;
     amc->hw_strap2 = TACOMA_BMC_HW_STRAP2;
@@ -1003,7 +1003,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
-    mc->desc       = "IBM Rainier BMC (Cortex A7)";
+    mc->desc       = "IBM Rainier BMC (Cortex-A7)";
     amc->soc_name  = "ast2600-a1";
     amc->hw_strap1 = RAINIER_BMC_HW_STRAP1;
     amc->hw_strap2 = RAINIER_BMC_HW_STRAP2;
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index ce16b6b3174..77fae874b16 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -67,7 +67,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
 
 static void mcimx6ul_evk_machine_init(MachineClass *mc)
 {
-    mc->desc = "Freescale i.MX6UL Evaluation Kit (Cortex A7)";
+    mc->desc = "Freescale i.MX6UL Evaluation Kit (Cortex-A7)";
     mc->init = mcimx6ul_evk_init;
     mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
     mc->default_ram_id = "mcimx6ul-evk.ram";
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index e896222c34c..935d4b0f1cd 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -67,7 +67,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
 
 static void mcimx7d_sabre_machine_init(MachineClass *mc)
 {
-    mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex A7)";
+    mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex-A7)";
     mc->init = mcimx7d_sabre_init;
     mc->max_cpus = FSL_IMX7_NUM_CPUS;
     mc->default_ram_id = "mcimx7d-sabre.ram";
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e37865..698be46d303 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -299,7 +299,7 @@ static void npcm750_evb_machine_class_init(ObjectClass *oc, void *data)
 
     npcm7xx_set_soc_type(nmc, TYPE_NPCM750);
 
-    mc->desc = "Nuvoton NPCM750 Evaluation Board (Cortex A9)";
+    mc->desc = "Nuvoton NPCM750 Evaluation Board (Cortex-A9)";
     mc->init = npcm750_evb_init;
     mc->default_ram_size = 512 * MiB;
 };
@@ -311,7 +311,7 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
 
     npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
 
-    mc->desc = "Quanta GSJ (Cortex A9)";
+    mc->desc = "Quanta GSJ (Cortex-A9)";
     mc->init = quanta_gsj_init;
     mc->default_ram_size = 512 * MiB;
 };
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 42348e5cb15..29fc777b613 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -105,7 +105,7 @@ static void sabrelite_init(MachineState *machine)
 
 static void sabrelite_machine_init(MachineClass *mc)
 {
-    mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex A9)";
+    mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
     mc->ignore_memory_transaction_failures = true;
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index a1ee67dc9a1..0b61070c52f 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -35,7 +35,7 @@
 #define NPCM7XX_CLOCK_REF_HZ            (25000000)
 
 /* Register Field Definitions */
-#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex A9 Cores */
+#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex-A9 Cores */
 
 #define PLLCON_LOKI     BIT(31)
 #define PLLCON_LOKS     BIT(30)
-- 
2.20.1


