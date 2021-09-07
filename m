Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AFF4023D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:10:12 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVFD-0001uJ-1y
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV43-0001Yc-Gr; Tue, 07 Sep 2021 02:58:39 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV3y-0001JA-Ng; Tue, 07 Sep 2021 02:58:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8E2EABCB54E3;
 Tue,  7 Sep 2021 08:58:25 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002824b153e-b420-465c-b4e5-82c8e1d0e55e,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 04/10] aspeed/smc: Drop AspeedSMCController structure
Date: Tue, 7 Sep 2021 08:58:16 +0200
Message-ID: <20210907065822.1152443-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f398d21-7208-4dc1-97bd-34a5a9508b52
X-Ovh-Tracer-Id: 977562597740088169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The characteristics of the Aspeed controllers are described in a
AspeedSMCController structure which is redundant with the
AspeedSMCClass. Move all attributes under the class and adapt the code
to use class attributes instead.

This is a large change but it is functionally equivalent.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  64 ++-
 hw/arm/aspeed_ast2600.c     |   4 +-
 hw/arm/aspeed_soc.c         |   4 +-
 hw/ssi/aspeed_smc.c         | 859 ++++++++++++++++++++----------------
 4 files changed, 510 insertions(+), 421 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index cdaf165300b6..0ea536a44c3a 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -29,35 +29,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-typedef struct AspeedSegments {
-    hwaddr addr;
-    uint32_t size;
-} AspeedSegments;
-
 struct AspeedSMCState;
-typedef struct AspeedSMCController {
-    const char *name;
-    uint8_t r_conf;
-    uint8_t r_ce_ctrl;
-    uint8_t r_ctrl0;
-    uint8_t r_timings;
-    uint8_t nregs_timings;
-    uint8_t conf_enable_w0;
-    uint8_t max_peripherals;
-    const AspeedSegments *segments;
-    hwaddr flash_window_base;
-    uint32_t flash_window_size;
-    uint32_t features;
-    hwaddr dma_flash_mask;
-    hwaddr dma_dram_mask;
-    uint32_t nregs;
-    uint32_t (*segment_to_reg)(const struct AspeedSMCState *s,
-                               const AspeedSegments *seg);
-    void (*reg_to_segment)(const struct AspeedSMCState *s, uint32_t reg,
-                           AspeedSegments *seg);
-    void (*dma_ctrl)(struct AspeedSMCState *s, uint32_t value);
-} AspeedSMCController;
-
 typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
 
@@ -71,18 +43,11 @@ typedef struct AspeedSMCFlash {
 #define TYPE_ASPEED_SMC "aspeed.smc"
 OBJECT_DECLARE_TYPE(AspeedSMCState, AspeedSMCClass, ASPEED_SMC)
 
-struct AspeedSMCClass {
-    SysBusDevice parent_obj;
-    const AspeedSMCController *ctrl;
-};
-
 #define ASPEED_SMC_R_MAX        (0x100 / 4)
 
 struct AspeedSMCState {
     SysBusDevice parent_obj;
 
-    const AspeedSMCController *ctrl;
-
     MemoryRegion mmio;
     MemoryRegion mmio_flash;
     MemoryRegion mmio_flash_alias;
@@ -115,4 +80,33 @@ struct AspeedSMCState {
     uint8_t snoop_dummies;
 };
 
+typedef struct AspeedSegments {
+    hwaddr addr;
+    uint32_t size;
+} AspeedSegments;
+
+struct AspeedSMCClass {
+    SysBusDeviceClass parent_obj;
+
+    uint8_t r_conf;
+    uint8_t r_ce_ctrl;
+    uint8_t r_ctrl0;
+    uint8_t r_timings;
+    uint8_t nregs_timings;
+    uint8_t conf_enable_w0;
+    uint8_t max_peripherals;
+    const AspeedSegments *segments;
+    hwaddr flash_window_base;
+    uint32_t flash_window_size;
+    uint32_t features;
+    hwaddr dma_flash_mask;
+    hwaddr dma_dram_mask;
+    uint32_t nregs;
+    uint32_t (*segment_to_reg)(const AspeedSMCState *s,
+                               const AspeedSegments *seg);
+    void (*reg_to_segment)(const AspeedSMCState *s, uint32_t reg,
+                           AspeedSegments *seg);
+    void (*dma_ctrl)(AspeedSMCState *s, uint32_t value);
+};
+
 #endif /* ASPEED_SMC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d70e8e060c6..c69f27dff62a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -352,7 +352,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
-                    s->fmc.ctrl->flash_window_base);
+                    ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
@@ -367,7 +367,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
-                        s->spi[i].ctrl->flash_window_base);
+                        ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
     /* EHCI */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index ed84502e238a..4f013dd5cd9c 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -310,7 +310,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
-                    s->fmc.ctrl->flash_window_base);
+                    ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
@@ -323,7 +323,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
                         sc->memmap[ASPEED_DEV_SPI1 + i]);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
-                        s->spi[i].ctrl->flash_window_base);
+                        ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
     /* EHCI */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b6684d6f38d0..ae14c384b60c 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -169,11 +169,6 @@
 #define ASPEED_SMC_R_SPI_MAX (0x20 / 4)
 #define ASPEED_SMC_R_SMC_MAX (0x20 / 4)
 
-#define ASPEED_SOC_SMC_FLASH_BASE   0x10000000
-#define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
-#define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
-#define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
-
 /*
  * DMA DRAM addresses should be 4 bytes aligned and the valid address
  * range is 0x40000000 - 0x5FFFFFFF (AST2400)
@@ -186,8 +181,8 @@
  *   0: 4 bytes
  *   0x7FFFFF: 32M bytes
  */
-#define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
-#define DMA_FLASH_ADDR(s, val)  ((val) & (s)->ctrl->dma_flash_mask)
+#define DMA_DRAM_ADDR(asc, val)   ((val) & (asc)->dma_dram_mask)
+#define DMA_FLASH_ADDR(asc, val)  ((val) & (asc)->dma_flash_mask)
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
 
 /* Flash opcodes. */
@@ -201,315 +196,25 @@
  * controller. These can be changed when board is initialized with the
  * Segment Address Registers.
  */
-static const AspeedSegments aspeed_segments_legacy[] = {
-    { 0x10000000, 32 * 1024 * 1024 },
-};
-
-static const AspeedSegments aspeed_segments_fmc[] = {
-    { 0x20000000, 64 * 1024 * 1024 }, /* start address is readonly */
-    { 0x24000000, 32 * 1024 * 1024 },
-    { 0x26000000, 32 * 1024 * 1024 },
-    { 0x28000000, 32 * 1024 * 1024 },
-    { 0x2A000000, 32 * 1024 * 1024 }
-};
-
-static const AspeedSegments aspeed_segments_spi[] = {
-    { 0x30000000, 64 * 1024 * 1024 },
-};
-
-static const AspeedSegments aspeed_segments_ast2500_fmc[] = {
-    { 0x20000000, 128 * 1024 * 1024 }, /* start address is readonly */
-    { 0x28000000,  32 * 1024 * 1024 },
-    { 0x2A000000,  32 * 1024 * 1024 },
-};
-
-static const AspeedSegments aspeed_segments_ast2500_spi1[] = {
-    { 0x30000000, 32 * 1024 * 1024 }, /* start address is readonly */
-    { 0x32000000, 96 * 1024 * 1024 }, /* end address is readonly */
-};
-
-static const AspeedSegments aspeed_segments_ast2500_spi2[] = {
-    { 0x38000000, 32 * 1024 * 1024 }, /* start address is readonly */
-    { 0x3A000000, 96 * 1024 * 1024 }, /* end address is readonly */
-};
-static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
-                                          const AspeedSegments *seg);
-static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t reg,
-                                      AspeedSegments *seg);
-static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
-
-/*
- * AST2600 definitions
- */
-#define ASPEED26_SOC_FMC_FLASH_BASE   0x20000000
-#define ASPEED26_SOC_SPI_FLASH_BASE   0x30000000
-#define ASPEED26_SOC_SPI2_FLASH_BASE  0x50000000
-
-static const AspeedSegments aspeed_segments_ast2600_fmc[] = {
-    { 0x0, 128 * MiB }, /* start address is readonly */
-    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
-    { 0x0, 0 }, /* disabled */
-};
-
-static const AspeedSegments aspeed_segments_ast2600_spi1[] = {
-    { 0x0, 128 * MiB }, /* start address is readonly */
-    { 0x0, 0 }, /* disabled */
-};
-
-static const AspeedSegments aspeed_segments_ast2600_spi2[] = {
-    { 0x0, 128 * MiB }, /* start address is readonly */
-    { 0x0, 0 }, /* disabled */
-    { 0x0, 0 }, /* disabled */
-};
-
-static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
-                                               const AspeedSegments *seg);
-static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
-                                           uint32_t reg, AspeedSegments *seg);
-static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
+static const AspeedSegments aspeed_2400_fmc_segments[];
+static const AspeedSegments aspeed_2400_spi1_segments[];
+static const AspeedSegments aspeed_2500_fmc_segments[];
+static const AspeedSegments aspeed_2500_spi1_segments[];
+static const AspeedSegments aspeed_2500_spi2_segments[];
+static const AspeedSegments aspeed_2600_fmc_segments[];
 
 #define ASPEED_SMC_FEATURE_DMA       0x1
 #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
 #define ASPEED_SMC_FEATURE_WDT_CONTROL 0x4
 
-static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
-{
-    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
-}
-
-static inline bool aspeed_smc_has_wdt_control(const AspeedSMCState *s)
-{
-    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
-}
-
-static const AspeedSMCController controllers[] = {
-    {
-        .name              = "aspeed.smc-ast2400",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 1,
-        .segments          = aspeed_segments_legacy,
-        .flash_window_base = ASPEED_SOC_SMC_FLASH_BASE,
-        .flash_window_size = 0x6000000,
-        .features          = 0x0,
-        .nregs             = ASPEED_SMC_R_SMC_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.fmc-ast2400",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 5,
-        .segments          = aspeed_segments_fmc,
-        .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA,
-        .dma_flash_mask    = 0x0FFFFFFC,
-        .dma_dram_mask     = 0x1FFFFFFC,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.spi1-ast2400",
-        .r_conf            = R_SPI_CONF,
-        .r_ce_ctrl         = 0xff,
-        .r_ctrl0           = R_SPI_CTRL0,
-        .r_timings         = R_SPI_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = SPI_CONF_ENABLE_W0,
-        .max_peripherals   = 1,
-        .segments          = aspeed_segments_spi,
-        .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = 0x0,
-        .nregs             = ASPEED_SMC_R_SPI_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.fmc-ast2500",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 3,
-        .segments          = aspeed_segments_ast2500_fmc,
-        .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA,
-        .dma_flash_mask    = 0x0FFFFFFC,
-        .dma_dram_mask     = 0x3FFFFFFC,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.spi1-ast2500",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 2,
-        .segments          = aspeed_segments_ast2500_spi1,
-        .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
-        .flash_window_size = 0x8000000,
-        .features          = 0x0,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.spi2-ast2500",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 2,
-        .segments          = aspeed_segments_ast2500_spi2,
-        .flash_window_base = ASPEED_SOC_SPI2_FLASH_BASE,
-        .flash_window_size = 0x8000000,
-        .features          = 0x0,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.fmc-ast2600",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 1,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 3,
-        .segments          = aspeed_segments_ast2600_fmc,
-        .flash_window_base = ASPEED26_SOC_FMC_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA,
-        .dma_flash_mask    = 0x0FFFFFFC,
-        .dma_dram_mask     = 0x3FFFFFFC,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.spi1-ast2600",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 2,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 2,
-        .segments          = aspeed_segments_ast2600_spi1,
-        .flash_window_base = ASPEED26_SOC_SPI_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA |
-                             ASPEED_SMC_FEATURE_DMA_GRANT,
-        .dma_flash_mask    = 0x0FFFFFFC,
-        .dma_dram_mask     = 0x3FFFFFFC,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
-    }, {
-        .name              = "aspeed.spi2-ast2600",
-        .r_conf            = R_CONF,
-        .r_ce_ctrl         = R_CE_CTRL,
-        .r_ctrl0           = R_CTRL0,
-        .r_timings         = R_TIMINGS,
-        .nregs_timings     = 3,
-        .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_peripherals   = 3,
-        .segments          = aspeed_segments_ast2600_spi2,
-        .flash_window_base = ASPEED26_SOC_SPI2_FLASH_BASE,
-        .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA |
-                             ASPEED_SMC_FEATURE_DMA_GRANT,
-        .dma_flash_mask    = 0x0FFFFFFC,
-        .dma_dram_mask     = 0x3FFFFFFC,
-        .nregs             = ASPEED_SMC_R_MAX,
-        .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
-        .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
-        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
-    },
-};
-
-/*
- * The Segment Registers of the AST2400 and AST2500 have a 8MB
- * unit. The address range of a flash SPI peripheral is encoded with
- * absolute addresses which should be part of the overall controller
- * window.
- */
-static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
-                                          const AspeedSegments *seg)
-{
-    uint32_t reg = 0;
-    reg |= ((seg->addr >> 23) & SEG_START_MASK) << SEG_START_SHIFT;
-    reg |= (((seg->addr + seg->size) >> 23) & SEG_END_MASK) << SEG_END_SHIFT;
-    return reg;
-}
-
-static void aspeed_smc_reg_to_segment(const AspeedSMCState *s,
-                                      uint32_t reg, AspeedSegments *seg)
-{
-    seg->addr = ((reg >> SEG_START_SHIFT) & SEG_START_MASK) << 23;
-    seg->size = (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - seg->addr;
-}
-
-/*
- * The Segment Registers of the AST2600 have a 1MB unit. The address
- * range of a flash SPI peripheral is encoded with offsets in the overall
- * controller window. The previous SoC AST2400 and AST2500 used
- * absolute addresses. Only bits [27:20] are relevant and the end
- * address is an upper bound limit.
- */
-#define AST2600_SEG_ADDR_MASK 0x0ff00000
-
-static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
-                                               const AspeedSegments *seg)
+static inline bool aspeed_smc_has_dma(const AspeedSMCClass *asc)
 {
-    uint32_t reg = 0;
-
-    /* Disabled segments have a nil register */
-    if (!seg->size) {
-        return 0;
-    }
-
-    reg |= (seg->addr & AST2600_SEG_ADDR_MASK) >> 16; /* start offset */
-    reg |= (seg->addr + seg->size - 1) & AST2600_SEG_ADDR_MASK; /* end offset */
-    return reg;
+    return !!(asc->features & ASPEED_SMC_FEATURE_DMA);
 }
 
-static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
-                                           uint32_t reg, AspeedSegments *seg)
+static inline bool aspeed_smc_has_wdt_control(const AspeedSMCClass *asc)
 {
-    uint32_t start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
-    uint32_t end_offset = reg & AST2600_SEG_ADDR_MASK;
-
-    if (reg) {
-        seg->addr = s->ctrl->flash_window_base + start_offset;
-        seg->size = end_offset + MiB - start_offset;
-    } else {
-        seg->addr = s->ctrl->flash_window_base;
-        seg->size = 0;
-    }
+    return !!(asc->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
 }
 
 #define aspeed_smc_error(fmt, ...)                                      \
@@ -519,15 +224,16 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
                                      const AspeedSegments *new,
                                      int cs)
 {
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSegments seg;
     int i;
 
-    for (i = 0; i < s->ctrl->max_peripherals; i++) {
+    for (i = 0; i < asc->max_peripherals; i++) {
         if (i == cs) {
             continue;
         }
 
-        s->ctrl->reg_to_segment(s, s->regs[R_SEG_ADDR0 + i], &seg);
+        asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + i], &seg);
 
         if (new->addr + new->size > seg.addr &&
             new->addr < seg.addr + seg.size) {
@@ -545,14 +251,15 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
 static void aspeed_smc_flash_set_segment_region(AspeedSMCState *s, int cs,
                                                 uint64_t regval)
 {
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSMCFlash *fl = &s->flashes[cs];
     AspeedSegments seg;
 
-    s->ctrl->reg_to_segment(s, regval, &seg);
+    asc->reg_to_segment(s, regval, &seg);
 
     memory_region_transaction_begin();
     memory_region_set_size(&fl->mmio, seg.size);
-    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_window_base);
+    memory_region_set_address(&fl->mmio, seg.addr - asc->flash_window_base);
     memory_region_set_enabled(&fl->mmio, !!seg.size);
     memory_region_transaction_commit();
 
@@ -562,40 +269,41 @@ static void aspeed_smc_flash_set_segment_region(AspeedSMCState *s, int cs,
 static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
                                          uint64_t new)
 {
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSegments seg;
 
-    s->ctrl->reg_to_segment(s, new, &seg);
+    asc->reg_to_segment(s, new, &seg);
 
     trace_aspeed_smc_flash_set_segment(cs, new, seg.addr, seg.addr + seg.size);
 
     /* The start address of CS0 is read-only */
-    if (cs == 0 && seg.addr != s->ctrl->flash_window_base) {
+    if (cs == 0 && seg.addr != asc->flash_window_base) {
         aspeed_smc_error("Tried to change CS0 start address to 0x%"
                          HWADDR_PRIx, seg.addr);
-        seg.addr = s->ctrl->flash_window_base;
-        new = s->ctrl->segment_to_reg(s, &seg);
+        seg.addr = asc->flash_window_base;
+        new = asc->segment_to_reg(s, &seg);
     }
 
     /*
      * The end address of the AST2500 spi controllers is also
      * read-only.
      */
-    if ((s->ctrl->segments == aspeed_segments_ast2500_spi1 ||
-         s->ctrl->segments == aspeed_segments_ast2500_spi2) &&
-        cs == s->ctrl->max_peripherals &&
-        seg.addr + seg.size != s->ctrl->segments[cs].addr +
-        s->ctrl->segments[cs].size) {
+    if ((asc->segments == aspeed_2500_spi1_segments ||
+         asc->segments == aspeed_2500_spi2_segments) &&
+        cs == asc->max_peripherals &&
+        seg.addr + seg.size != asc->segments[cs].addr +
+        asc->segments[cs].size) {
         aspeed_smc_error("Tried to change CS%d end address to 0x%"
                          HWADDR_PRIx, cs, seg.addr + seg.size);
-        seg.size = s->ctrl->segments[cs].addr + s->ctrl->segments[cs].size -
+        seg.size = asc->segments[cs].addr + asc->segments[cs].size -
             seg.addr;
-        new = s->ctrl->segment_to_reg(s, &seg);
+        new = asc->segment_to_reg(s, &seg);
     }
 
     /* Keep the segment in the overall flash window */
     if (seg.size &&
-        (seg.addr + seg.size <= s->ctrl->flash_window_base ||
-         seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window_size)) {
+        (seg.addr + seg.size <= asc->flash_window_base ||
+         seg.addr > asc->flash_window_base + asc->flash_window_size)) {
         aspeed_smc_error("new segment for CS%d is invalid : "
                          "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
                          cs, seg.addr, seg.addr + seg.size);
@@ -680,8 +388,9 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
 static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
 
-    if (s->ctrl->segments == aspeed_segments_spi) {
+    if (asc->segments == aspeed_2400_spi1_segments) {
         return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
     } else {
         return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
@@ -711,9 +420,10 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
                                               uint32_t addr)
 {
     const AspeedSMCState *s = fl->controller;
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSegments seg;
 
-    s->ctrl->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
     if ((addr % seg.size) != addr) {
         aspeed_smc_error("invalid address 0x%08x for CS%d segment : "
                          "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
@@ -973,6 +683,7 @@ static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
 static void aspeed_smc_reset(DeviceState *d)
 {
     AspeedSMCState *s = ASPEED_SMC(d);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     int i;
 
     memset(s->regs, 0, sizeof s->regs);
@@ -984,13 +695,13 @@ static void aspeed_smc_reset(DeviceState *d)
     }
 
     /* setup the default segment register values and regions for all */
-    for (i = 0; i < s->ctrl->max_peripherals; ++i) {
+    for (i = 0; i < asc->max_peripherals; ++i) {
         aspeed_smc_flash_set_segment_region(s, i,
-                    s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
+                    asc->segment_to_reg(s, &asc->segments[i]));
     }
 
     /* HW strapping flash type for the AST2600 controllers  */
-    if (s->ctrl->segments == aspeed_segments_ast2600_fmc) {
+    if (asc->segments == aspeed_2600_fmc_segments) {
         /* flash type is fixed to SPI for all */
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1);
@@ -998,7 +709,7 @@ static void aspeed_smc_reset(DeviceState *d)
     }
 
     /* HW strapping flash type for FMC controllers  */
-    if (s->ctrl->segments == aspeed_segments_ast2500_fmc) {
+    if (asc->segments == aspeed_2500_fmc_segments) {
         /* flash type is fixed to SPI for CE0 and CE1 */
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1);
@@ -1006,7 +717,7 @@ static void aspeed_smc_reset(DeviceState *d)
 
     /* HW strapping for AST2400 FMC controllers (SCU70). Let's use the
      * configuration of the palmetto-bmc machine */
-    if (s->ctrl->segments == aspeed_segments_fmc) {
+    if (asc->segments == aspeed_2400_fmc_segments) {
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
     }
 
@@ -1017,25 +728,26 @@ static void aspeed_smc_reset(DeviceState *d)
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSMCState *s = ASPEED_SMC(opaque);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(opaque);
 
     addr >>= 2;
 
     if (addr == s->r_conf ||
         (addr >= s->r_timings &&
-         addr < s->r_timings + s->ctrl->nregs_timings) ||
+         addr < s->r_timings + asc->nregs_timings) ||
         addr == s->r_ce_ctrl ||
         addr == R_CE_CMD_CTRL ||
         addr == R_INTR_CTRL ||
         addr == R_DUMMY_DATA ||
-        (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) ||
-        (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) ||
-        (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR) ||
-        (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR) ||
-        (aspeed_smc_has_dma(s) && addr == R_DMA_LEN) ||
-        (aspeed_smc_has_dma(s) && addr == R_DMA_CHECKSUM) ||
+        (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_CTRL) ||
+        (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) ||
+        (aspeed_smc_has_dma(asc) && addr == R_DMA_FLASH_ADDR) ||
+        (aspeed_smc_has_dma(asc) && addr == R_DMA_DRAM_ADDR) ||
+        (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN) ||
+        (aspeed_smc_has_dma(asc) && addr == R_DMA_CHECKSUM) ||
         (addr >= R_SEG_ADDR0 &&
-         addr < R_SEG_ADDR0 + s->ctrl->max_peripherals) ||
-        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_peripherals)) {
+         addr < R_SEG_ADDR0 + asc->max_peripherals) ||
+        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripherals)) {
 
         trace_aspeed_smc_read(addr, size, s->regs[addr]);
 
@@ -1291,7 +1003,9 @@ static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
 
 static inline bool aspeed_smc_dma_granted(AspeedSMCState *s)
 {
-    if (!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA_GRANT)) {
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+
+    if (!(asc->features & ASPEED_SMC_FEATURE_DMA_GRANT)) {
         return true;
     }
 
@@ -1333,6 +1047,7 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned int size)
 {
     AspeedSMCState *s = ASPEED_SMC(opaque);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     uint32_t value = data;
 
     addr >>= 2;
@@ -1341,14 +1056,14 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
 
     if (addr == s->r_conf ||
         (addr >= s->r_timings &&
-         addr < s->r_timings + s->ctrl->nregs_timings) ||
+         addr < s->r_timings + asc->nregs_timings) ||
         addr == s->r_ce_ctrl) {
         s->regs[addr] = value;
     } else if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
         int cs = addr - s->r_ctrl0;
         aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
     } else if (addr >= R_SEG_ADDR0 &&
-               addr < R_SEG_ADDR0 + s->ctrl->max_peripherals) {
+               addr < R_SEG_ADDR0 + asc->max_peripherals) {
         int cs = addr - R_SEG_ADDR0;
 
         if (value != s->regs[R_SEG_ADDR0 + cs]) {
@@ -1358,19 +1073,19 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
         s->regs[addr] = value & 0xff;
     } else if (addr == R_DUMMY_DATA) {
         s->regs[addr] = value & 0xff;
-    } else if (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) {
+    } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_CTRL) {
         s->regs[addr] = value & 0xb;
     } else if (addr == R_INTR_CTRL) {
         s->regs[addr] = value;
-    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) {
-        s->ctrl->dma_ctrl(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR &&
+    } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) {
+        asc->dma_ctrl(s, value);
+    } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_DRAM_ADDR &&
                aspeed_smc_dma_granted(s)) {
-        s->regs[addr] = DMA_DRAM_ADDR(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR &&
+        s->regs[addr] = DMA_DRAM_ADDR(asc, value);
+    } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_FLASH_ADDR &&
                aspeed_smc_dma_granted(s)) {
-        s->regs[addr] = DMA_FLASH_ADDR(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_LEN &&
+        s->regs[addr] = DMA_FLASH_ADDR(asc, value);
+    } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN &&
                aspeed_smc_dma_granted(s)) {
         s->regs[addr] = DMA_LENGTH(value);
     } else {
@@ -1406,24 +1121,22 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedSMCState *s = ASPEED_SMC(dev);
-    AspeedSMCClass *mc = ASPEED_SMC_GET_CLASS(s);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     int i;
     char name[32];
     hwaddr offset = 0;
 
-    s->ctrl = mc->ctrl;
-
     /* keep a copy under AspeedSMCState to speed up accesses */
-    s->r_conf = s->ctrl->r_conf;
-    s->r_ce_ctrl = s->ctrl->r_ce_ctrl;
-    s->r_ctrl0 = s->ctrl->r_ctrl0;
-    s->r_timings = s->ctrl->r_timings;
-    s->conf_enable_w0 = s->ctrl->conf_enable_w0;
+    s->r_conf = asc->r_conf;
+    s->r_ce_ctrl = asc->r_ce_ctrl;
+    s->r_ctrl0 = asc->r_ctrl0;
+    s->r_timings = asc->r_timings;
+    s->conf_enable_w0 = asc->conf_enable_w0;
 
     /* Enforce some real HW limits */
-    if (s->num_cs > s->ctrl->max_peripherals) {
-        aspeed_smc_error("num_cs cannot exceed: %d", s->ctrl->max_peripherals);
-        s->num_cs = s->ctrl->max_peripherals;
+    if (s->num_cs > asc->max_peripherals) {
+        aspeed_smc_error("num_cs cannot exceed: %d", asc->max_peripherals);
+        s->num_cs = asc->max_peripherals;
     }
 
     /* DMA irq. Keep it first for the initialization in the SoC */
@@ -1440,7 +1153,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          TYPE_ASPEED_SMC, s->ctrl->nregs * 4);
+                          TYPE_ASPEED_SMC, asc->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
     /*
@@ -1451,13 +1164,13 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s,
                           TYPE_ASPEED_SMC ".flash",
-                          s->ctrl->flash_window_size);
+                          asc->flash_window_size);
     memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
                              TYPE_ASPEED_SMC ".flash",
-                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
+                             &s->mmio_flash, 0, asc->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
-    s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
+    s->flashes = g_new0(AspeedSMCFlash, asc->max_peripherals);
 
     /*
      * Let's create a sub memory region for each possible peripheral. All
@@ -1466,14 +1179,14 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * module behind to handle the memory accesses. This depends on
      * the board configuration.
      */
-    for (i = 0; i < s->ctrl->max_peripherals; ++i) {
+    for (i = 0; i < asc->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
         snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
         fl->id = i;
         fl->controller = s;
-        fl->size = s->ctrl->segments[i].size;
+        fl->size = asc->segments[i].size;
         memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
                               fl, name, fl->size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
@@ -1481,7 +1194,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     }
 
     /* DMA support */
-    if (aspeed_smc_has_dma(s)) {
+    if (aspeed_smc_has_dma(asc)) {
         aspeed_smc_dma_setup(s, errp);
     }
 }
@@ -1509,13 +1222,11 @@ static Property aspeed_smc_properties[] = {
 static void aspeed_smc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    AspeedSMCClass *mc = ASPEED_SMC_CLASS(klass);
 
     dc->realize = aspeed_smc_realize;
     dc->reset = aspeed_smc_reset;
     device_class_set_props(dc, aspeed_smc_properties);
     dc->vmsd = &vmstate_aspeed_smc;
-    mc->ctrl = data;
 }
 
 static const TypeInfo aspeed_smc_info = {
@@ -1523,23 +1234,407 @@ static const TypeInfo aspeed_smc_info = {
     .parent         = TYPE_SYS_BUS_DEVICE,
     .instance_size  = sizeof(AspeedSMCState),
     .class_size     = sizeof(AspeedSMCClass),
+    .class_init     = aspeed_smc_class_init,
     .abstract       = true,
 };
 
-static void aspeed_smc_register_types(void)
+
+/*
+ * The Segment Registers of the AST2400 and AST2500 have a 8MB
+ * unit. The address range of a flash SPI peripheral is encoded with
+ * absolute addresses which should be part of the overall controller
+ * window.
+ */
+static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
+                                          const AspeedSegments *seg)
 {
-    int i;
+    uint32_t reg = 0;
+    reg |= ((seg->addr >> 23) & SEG_START_MASK) << SEG_START_SHIFT;
+    reg |= (((seg->addr + seg->size) >> 23) & SEG_END_MASK) << SEG_END_SHIFT;
+    return reg;
+}
 
-    type_register_static(&aspeed_smc_info);
-    for (i = 0; i < ARRAY_SIZE(controllers); ++i) {
-        TypeInfo ti = {
-            .name       = controllers[i].name,
-            .parent     = TYPE_ASPEED_SMC,
-            .class_init = aspeed_smc_class_init,
-            .class_data = (void *)&controllers[i],
-        };
-        type_register(&ti);
+static void aspeed_smc_reg_to_segment(const AspeedSMCState *s,
+                                      uint32_t reg, AspeedSegments *seg)
+{
+    seg->addr = ((reg >> SEG_START_SHIFT) & SEG_START_MASK) << 23;
+    seg->size = (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - seg->addr;
+}
+
+static const AspeedSegments aspeed_2400_smc_segments[] = {
+    { 0x10000000, 32 * MiB },
+};
+
+static void aspeed_2400_smc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2400 SMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 1;
+    asc->segments          = aspeed_2400_smc_segments;
+    asc->flash_window_base = 0x10000000;
+    asc->flash_window_size = 0x6000000;
+    asc->features          = 0x0;
+    asc->nregs             = ASPEED_SMC_R_SMC_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2400_smc_info = {
+    .name =  "aspeed.smc-ast2400",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2400_smc_class_init,
+};
+
+static const AspeedSegments aspeed_2400_fmc_segments[] = {
+    { 0x20000000, 64 * MiB }, /* start address is readonly */
+    { 0x24000000, 32 * MiB },
+    { 0x26000000, 32 * MiB },
+    { 0x28000000, 32 * MiB },
+    { 0x2A000000, 32 * MiB }
+};
+
+static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2400 FMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 5;
+    asc->segments          = aspeed_2400_fmc_segments;
+    asc->flash_window_base = 0x20000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x1FFFFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2400_fmc_info = {
+    .name =  "aspeed.fmc-ast2400",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2400_fmc_class_init,
+};
+
+static const AspeedSegments aspeed_2400_spi1_segments[] = {
+    { 0x30000000, 64 * MiB },
+};
+
+static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2400 SPI1 Controller";
+    asc->r_conf            = R_SPI_CONF;
+    asc->r_ce_ctrl         = 0xff;
+    asc->r_ctrl0           = R_SPI_CTRL0;
+    asc->r_timings         = R_SPI_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = SPI_CONF_ENABLE_W0;
+    asc->max_peripherals   = 1;
+    asc->segments          = aspeed_2400_spi1_segments;
+    asc->flash_window_base = 0x30000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = 0x0;
+    asc->nregs             = ASPEED_SMC_R_SPI_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2400_spi1_info = {
+    .name =  "aspeed.spi1-ast2400",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2400_spi1_class_init,
+};
+
+static const AspeedSegments aspeed_2500_fmc_segments[] = {
+    { 0x20000000, 128 * MiB }, /* start address is readonly */
+    { 0x28000000,  32 * MiB },
+    { 0x2A000000,  32 * MiB },
+};
+
+static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 FMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 3;
+    asc->segments          = aspeed_2500_fmc_segments;
+    asc->flash_window_base = 0x20000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2500_fmc_info = {
+    .name =  "aspeed.fmc-ast2500",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2500_fmc_class_init,
+};
+
+static const AspeedSegments aspeed_2500_spi1_segments[] = {
+    { 0x30000000, 32 * MiB }, /* start address is readonly */
+    { 0x32000000, 96 * MiB }, /* end address is readonly */
+};
+
+static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 SPI1 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 2;
+    asc->segments          = aspeed_2500_spi1_segments;
+    asc->flash_window_base = 0x30000000;
+    asc->flash_window_size = 0x8000000;
+    asc->features          = 0x0;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2500_spi1_info = {
+    .name =  "aspeed.spi1-ast2500",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2500_spi1_class_init,
+};
+
+static const AspeedSegments aspeed_2500_spi2_segments[] = {
+    { 0x38000000, 32 * MiB }, /* start address is readonly */
+    { 0x3A000000, 96 * MiB }, /* end address is readonly */
+};
+
+static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 SPI2 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 2;
+    asc->segments          = aspeed_2500_spi2_segments;
+    asc->flash_window_base = 0x38000000;
+    asc->flash_window_size = 0x8000000;
+    asc->features          = 0x0;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2500_spi2_info = {
+    .name =  "aspeed.spi2-ast2500",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2500_spi2_class_init,
+};
+
+/*
+ * The Segment Registers of the AST2600 have a 1MB unit. The address
+ * range of a flash SPI peripheral is encoded with offsets in the overall
+ * controller window. The previous SoC AST2400 and AST2500 used
+ * absolute addresses. Only bits [27:20] are relevant and the end
+ * address is an upper bound limit.
+ */
+#define AST2600_SEG_ADDR_MASK 0x0ff00000
+
+static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
+                                               const AspeedSegments *seg)
+{
+    uint32_t reg = 0;
+
+    /* Disabled segments have a nil register */
+    if (!seg->size) {
+        return 0;
+    }
+
+    reg |= (seg->addr & AST2600_SEG_ADDR_MASK) >> 16; /* start offset */
+    reg |= (seg->addr + seg->size - 1) & AST2600_SEG_ADDR_MASK; /* end offset */
+    return reg;
+}
+
+static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
+                                           uint32_t reg, AspeedSegments *seg)
+{
+    uint32_t start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
+    uint32_t end_offset = reg & AST2600_SEG_ADDR_MASK;
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+
+    if (reg) {
+        seg->addr = asc->flash_window_base + start_offset;
+        seg->size = end_offset + MiB - start_offset;
+    } else {
+        seg->addr = asc->flash_window_base;
+        seg->size = 0;
     }
 }
 
+static const AspeedSegments aspeed_2600_fmc_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 FMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 1;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 3;
+    asc->segments          = aspeed_2600_fmc_segments;
+    asc->flash_window_base = 0x20000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2600_fmc_info = {
+    .name =  "aspeed.fmc-ast2600",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2600_fmc_class_init,
+};
+
+static const AspeedSegments aspeed_2600_spi1_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_2600_spi1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 SPI1 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 2;
+    asc->segments          = aspeed_2600_spi1_segments;
+    asc->flash_window_base = 0x30000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_DMA_GRANT;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2600_spi1_info = {
+    .name =  "aspeed.spi1-ast2600",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2600_spi1_class_init,
+};
+
+static const AspeedSegments aspeed_2600_spi2_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_2600_spi2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 2600 SPI2 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 3;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->max_peripherals   = 3;
+    asc->segments          = aspeed_2600_spi2_segments;
+    asc->flash_window_base = 0x50000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_DMA_GRANT;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_2600_spi2_info = {
+    .name =  "aspeed.spi2-ast2600",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_2600_spi2_class_init,
+};
+
+static void aspeed_smc_register_types(void)
+{
+    type_register_static(&aspeed_smc_info);
+    type_register_static(&aspeed_2400_smc_info);
+    type_register_static(&aspeed_2400_fmc_info);
+    type_register_static(&aspeed_2400_spi1_info);
+    type_register_static(&aspeed_2500_fmc_info);
+    type_register_static(&aspeed_2500_spi1_info);
+    type_register_static(&aspeed_2500_spi2_info);
+    type_register_static(&aspeed_2600_fmc_info);
+    type_register_static(&aspeed_2600_spi1_info);
+    type_register_static(&aspeed_2600_spi2_info);
+}
+
 type_init(aspeed_smc_register_types)
-- 
2.31.1


