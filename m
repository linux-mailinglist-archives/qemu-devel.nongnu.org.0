Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F848469413
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:43:46 +0100 (CET)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBTF-00026i-IV
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muBND-0001Cc-6B; Mon, 06 Dec 2021 05:37:31 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:44289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muBN9-0001nM-5E; Mon, 06 Dec 2021 05:37:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 272B1D012029;
 Mon,  6 Dec 2021 11:37:16 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c6c0e776-ecdb-4995-80b6-e3b53c0e55b0,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 04/15] ppc/ppc405: Convert printfs to trace-events
Date: Mon, 6 Dec 2021 11:37:01 +0100
Message-ID: <20211206103712.1866296-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: acfd897a-084d-49ad-b8e8-3f233b57dd7c
X-Ovh-Tracer-Id: 16707228720530688876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and one error message to a LOG_GUEST_ERROR.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_uc.c  | 159 +++++++++++++++-----------------------------
 hw/ppc/trace-events |  20 ++++++
 2 files changed, 74 insertions(+), 105 deletions(-)

diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index e632c408bdf8..e14d61e9b899 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
 #include "hw/i2c/ppc4xx_i2c.h"
@@ -38,15 +39,7 @@
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
-
-//#define DEBUG_OPBA
-//#define DEBUG_SDRAM
-//#define DEBUG_GPIO
-//#define DEBUG_SERIAL
-//#define DEBUG_OCM
-//#define DEBUG_GPT
-//#define DEBUG_CLOCKS
-//#define DEBUG_CLOCKS_LL
+#include "trace.h"
 
 ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
                                 uint32_t flags)
@@ -287,13 +280,9 @@ struct ppc4xx_opba_t {
 
 static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_opba_t *opba;
+    ppc4xx_opba_t *opba = opaque;
     uint32_t ret;
 
-#ifdef DEBUG_OPBA
-    printf("%s: addr " TARGET_FMT_plx "\n", __func__, addr);
-#endif
-    opba = opaque;
     switch (addr) {
     case 0x00:
         ret = opba->cr;
@@ -306,19 +295,17 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
+    trace_opba_readb(addr, ret);
     return ret;
 }
 
 static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    ppc4xx_opba_t *opba;
+    ppc4xx_opba_t *opba = opaque;
+
+    trace_opba_writeb(addr, value);
 
-#ifdef DEBUG_OPBA
-    printf("%s: addr " TARGET_FMT_plx " val %08" PRIx32 "\n", __func__, addr,
-           value);
-#endif
-    opba = opaque;
     switch (addr) {
     case 0x00:
         opba->cr = value & 0xF8;
@@ -353,10 +340,9 @@ static void ppc4xx_opba_init(hwaddr base)
 {
     ppc4xx_opba_t *opba;
 
+    trace_opba_init(base);
+
     opba = g_malloc0(sizeof(ppc4xx_opba_t));
-#ifdef DEBUG_OPBA
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x002);
     memory_region_add_subregion(get_system_memory(), base, &opba->io);
     qemu_register_reset(ppc4xx_opba_reset, opba);
@@ -707,20 +693,14 @@ struct ppc405_gpio_t {
 
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
 {
-#ifdef DEBUG_GPIO
-    printf("%s: addr " TARGET_FMT_plx " size %d\n", __func__, addr, size);
-#endif
-
+    trace_ppc405_gpio_read(addr, size);
     return 0;
 }
 
 static void ppc405_gpio_write(void *opaque, hwaddr addr, uint64_t value,
                               unsigned size)
 {
-#ifdef DEBUG_GPIO
-    printf("%s: addr " TARGET_FMT_plx " size %d val %08" PRIx32 "\n",
-           __func__, addr, size, value);
-#endif
+    trace_ppc405_gpio_write(addr, size, value);
 }
 
 static const MemoryRegionOps ppc405_gpio_ops = {
@@ -737,10 +717,9 @@ static void ppc405_gpio_init(hwaddr base)
 {
     ppc405_gpio_t *gpio;
 
+    trace_ppc405_gpio_init(base);
+
     gpio = g_malloc0(sizeof(ppc405_gpio_t));
-#ifdef DEBUG_GPIO
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
     memory_region_add_subregion(get_system_memory(), base, &gpio->io);
     qemu_register_reset(&ppc405_gpio_reset, gpio);
@@ -770,25 +749,19 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
                                  uint32_t isarc, uint32_t isacntl,
                                  uint32_t dsarc, uint32_t dsacntl)
 {
-#ifdef DEBUG_OCM
-    printf("OCM update ISA %08" PRIx32 " %08" PRIx32 " (%08" PRIx32
-           " %08" PRIx32 ") DSA %08" PRIx32 " %08" PRIx32
-           " (%08" PRIx32 " %08" PRIx32 ")\n",
-           isarc, isacntl, dsarc, dsacntl,
-           ocm->isarc, ocm->isacntl, ocm->dsarc, ocm->dsacntl);
-#endif
+    trace_ocm_update_mappings(isarc, isacntl, dsarc, dsacntl, ocm->isarc,
+                              ocm->isacntl, ocm->dsarc, ocm->dsacntl);
+
     if (ocm->isarc != isarc ||
         (ocm->isacntl & 0x80000000) != (isacntl & 0x80000000)) {
         if (ocm->isacntl & 0x80000000) {
             /* Unmap previously assigned memory region */
-            printf("OCM unmap ISA %08" PRIx32 "\n", ocm->isarc);
+            trace_ocm_unmap("ISA", ocm->isarc);
             memory_region_del_subregion(get_system_memory(), &ocm->isarc_ram);
         }
         if (isacntl & 0x80000000) {
             /* Map new instruction memory region */
-#ifdef DEBUG_OCM
-            printf("OCM map ISA %08" PRIx32 "\n", isarc);
-#endif
+            trace_ocm_map("ISA", isarc);
             memory_region_add_subregion(get_system_memory(), isarc,
                                         &ocm->isarc_ram);
         }
@@ -799,9 +772,7 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
             /* Beware not to unmap the region we just mapped */
             if (!(isacntl & 0x80000000) || ocm->dsarc != isarc) {
                 /* Unmap previously assigned memory region */
-#ifdef DEBUG_OCM
-                printf("OCM unmap DSA %08" PRIx32 "\n", ocm->dsarc);
-#endif
+                trace_ocm_unmap("DSA", ocm->dsarc);
                 memory_region_del_subregion(get_system_memory(),
                                             &ocm->dsarc_ram);
             }
@@ -810,9 +781,7 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
             /* Beware not to remap the region we just mapped */
             if (!(isacntl & 0x80000000) || dsarc != isarc) {
                 /* Map new data memory region */
-#ifdef DEBUG_OCM
-                printf("OCM map DSA %08" PRIx32 "\n", dsarc);
-#endif
+                trace_ocm_map("DSA", dsarc);
                 memory_region_add_subregion(get_system_memory(), dsarc,
                                             &ocm->dsarc_ram);
             }
@@ -988,14 +957,12 @@ static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t *gpt)
 
 static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_gpt_t *gpt;
+    ppc4xx_gpt_t *gpt = opaque;
     uint32_t ret;
     int idx;
 
-#ifdef DEBUG_GPT
-    printf("%s: addr " TARGET_FMT_plx "\n", __func__, addr);
-#endif
-    gpt = opaque;
+    trace_ppc4xx_gpt_read(addr, size);
+
     switch (addr) {
     case 0x00:
         /* Time base counter */
@@ -1044,14 +1011,11 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
                              unsigned size)
 {
-    ppc4xx_gpt_t *gpt;
+    ppc4xx_gpt_t *gpt = opaque;
     int idx;
 
-#ifdef DEBUG_I2C
-    printf("%s: addr " TARGET_FMT_plx " val %08" PRIx32 "\n", __func__, addr,
-           value);
-#endif
-    gpt = opaque;
+    trace_ppc4xx_gpt_write(addr, size, value);
+
     switch (addr) {
     case 0x00:
         /* Time base counter */
@@ -1144,14 +1108,13 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
     ppc4xx_gpt_t *gpt;
     int i;
 
+    trace_ppc4xx_gpt_init(base);
+
     gpt = g_malloc0(sizeof(ppc4xx_gpt_t));
     for (i = 0; i < 5; i++) {
         gpt->irqs[i] = irqs[i];
     }
     gpt->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt);
-#ifdef DEBUG_GPT
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4);
     memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
     qemu_register_reset(ppc4xx_gpt_reset, gpt);
@@ -1215,17 +1178,14 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
     VCO_out = 0;
     if ((cpc->pllmr[1] & 0x80000000) && !(cpc->pllmr[1] & 0x40000000)) {
         M = (((cpc->pllmr[1] >> 20) - 1) & 0xF) + 1; /* FBMUL */
-#ifdef DEBUG_CLOCKS_LL
-        printf("FBMUL %01" PRIx32 " %d\n", (cpc->pllmr[1] >> 20) & 0xF, M);
-#endif
+        trace_ppc405ep_clocks_compute("FBMUL", (cpc->pllmr[1] >> 20) & 0xF, M);
         D = 8 - ((cpc->pllmr[1] >> 16) & 0x7); /* FWDA */
-#ifdef DEBUG_CLOCKS_LL
-        printf("FWDA %01" PRIx32 " %d\n", (cpc->pllmr[1] >> 16) & 0x7, D);
-#endif
+        trace_ppc405ep_clocks_compute("FWDA", (cpc->pllmr[1] >> 16) & 0x7, D);
         VCO_out = (uint64_t)cpc->sysclk * M * D;
         if (VCO_out < 500000000UL || VCO_out > 1000000000UL) {
             /* Error - unlock the PLL */
-            printf("VCO out of range %" PRIu64 "\n", VCO_out);
+            qemu_log_mask(LOG_GUEST_ERROR, "VCO out of range %" PRIu64 "\n",
+                          VCO_out);
 #if 0
             cpc->pllmr[1] &= ~0x80000000;
             goto pll_bypass;
@@ -1246,54 +1206,43 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
     }
     /* Now, compute all other clocks */
     D = ((cpc->pllmr[0] >> 20) & 0x3) + 1; /* CCDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("CCDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 20) & 0x3, D);
-#endif
+     trace_ppc405ep_clocks_compute("CCDV", (cpc->pllmr[0] >> 20) & 0x3, D);
     CPU_clk = PLL_out / D;
     D = ((cpc->pllmr[0] >> 16) & 0x3) + 1; /* CBDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("CBDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 16) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("CBDV", (cpc->pllmr[0] >> 16) & 0x3, D);
     PLB_clk = CPU_clk / D;
     D = ((cpc->pllmr[0] >> 12) & 0x3) + 1; /* OPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("OPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 12) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("OPDV", (cpc->pllmr[0] >> 12) & 0x3, D);
     OPB_clk = PLB_clk / D;
     D = ((cpc->pllmr[0] >> 8) & 0x3) + 2; /* EPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("EPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 8) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("EPDV", (cpc->pllmr[0] >> 8) & 0x3, D);
     EBC_clk = PLB_clk / D;
     D = ((cpc->pllmr[0] >> 4) & 0x3) + 1; /* MPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("MPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 4) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("MPDV", (cpc->pllmr[0] >> 4) & 0x3, D);
     MAL_clk = PLB_clk / D;
     D = (cpc->pllmr[0] & 0x3) + 1; /* PPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("PPDV %01" PRIx32 " %d\n", cpc->pllmr[0] & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("PPDV", cpc->pllmr[0] & 0x3, D);
     PCI_clk = PLB_clk / D;
     D = ((cpc->ucr - 1) & 0x7F) + 1; /* U0DIV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("U0DIV %01" PRIx32 " %d\n", cpc->ucr & 0x7F, D);
-#endif
+    trace_ppc405ep_clocks_compute("U0DIV", cpc->ucr & 0x7F, D);
     UART0_clk = PLL_out / D;
     D = (((cpc->ucr >> 8) - 1) & 0x7F) + 1; /* U1DIV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("U1DIV %01" PRIx32 " %d\n", (cpc->ucr >> 8) & 0x7F, D);
-#endif
+    trace_ppc405ep_clocks_compute("U1DIV", (cpc->ucr >> 8) & 0x7F, D);
     UART1_clk = PLL_out / D;
-#ifdef DEBUG_CLOCKS
-    printf("Setup PPC405EP clocks - sysclk %" PRIu32 " VCO %" PRIu64
-           " PLL out %" PRIu64 " Hz\n", cpc->sysclk, VCO_out, PLL_out);
-    printf("CPU %" PRIu32 " PLB %" PRIu32 " OPB %" PRIu32 " EBC %" PRIu32
-           " MAL %" PRIu32 " PCI %" PRIu32 " UART0 %" PRIu32
-           " UART1 %" PRIu32 "\n",
-           CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk,
-           UART0_clk, UART1_clk);
-#endif
+
+    if (trace_event_get_state_backends(TRACE_PPC405EP_CLOCKS_SETUP)) {
+        g_autofree char *trace = g_strdup_printf(
+            "Setup PPC405EP clocks - sysclk %" PRIu32 " VCO %" PRIu64
+            " PLL out %" PRIu64 " Hz\n"
+            "CPU %" PRIu32 " PLB %" PRIu32 " OPB %" PRIu32 " EBC %" PRIu32
+            " MAL %" PRIu32 " PCI %" PRIu32 " UART0 %" PRIu32
+            " UART1 %" PRIu32 "\n",
+            cpc->sysclk, VCO_out, PLL_out,
+            CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk,
+            UART0_clk, UART1_clk);
+        trace_ppc405ep_clocks_setup(trace);
+    }
+
     /* Setup CPU clocks */
     clk_setup(&cpc->clk_setup[PPC405EP_CPU_CLK], CPU_clk);
     /* Setup PLB clock */
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 602adb83157b..ada644652d94 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -144,3 +144,23 @@ ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added window %d of
 ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pcia) "Added window %d of size=0x%x from CPU=0x%" PRIx64 " to PCI=0x%" PRIx64
 ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
 ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRIx64 " = 0x%" PRIx32 " size 0x%" PRIx32
+
+# ppc405_boards.c
+opba_readb(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
+opba_writeb(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " = 0x%" PRIx64
+opba_init(uint64_t addr) "offet 0x%" PRIx64
+
+ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
+ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
+ppc405_gpio_init(uint64_t addr) "offet 0x%" PRIx64
+
+ocm_update_mappings(uint32_t isarc, uint32_t isacntl, uint32_t dsarc, uint32_t dsacntl, uint32_t ocm_isarc, uint32_t ocm_isacntl, uint32_t ocm_dsarc, uint32_t ocm_dsacntl) "OCM update ISA 0x%08" PRIx32 " 0x%08" PRIx32 " (0x%08" PRIx32" 0x%08" PRIx32 ") DSA 0x%08" PRIx32 " 0x%08" PRIx32" (0x%08" PRIx32 " 0x%08" PRIx32 ")"
+ocm_map(const char* prefix, uint32_t isarc) "OCM map %s 0x%08" PRIx32
+ocm_unmap(const char* prefix, uint32_t isarc) "OCM unmap %s 0x%08" PRIx32
+
+ppc4xx_gpt_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
+ppc4xx_gpt_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
+ppc4xx_gpt_init(uint64_t addr) "offet 0x%" PRIx64
+
+ppc405ep_clocks_compute(const char *param, uint32_t param2, uint32_t val) "%s 0x%1" PRIx32 " %d"
+ppc405ep_clocks_setup(const char *trace) "%s"
-- 
2.31.1


