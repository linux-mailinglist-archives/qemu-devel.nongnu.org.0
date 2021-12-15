Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF8476079
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:17:17 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYq4-0004lJ-Mu
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiL-0004zQ-1q; Wed, 15 Dec 2021 12:05:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiH-0004im-8f; Wed, 15 Dec 2021 12:05:12 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGkqao036010; 
 Wed, 15 Dec 2021 17:04:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjdw3552-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH4668000965;
 Wed, 15 Dec 2021 17:04:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k975ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4dgW44564924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18D8411C066;
 Wed, 15 Dec 2021 17:04:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA6D011C064;
 Wed, 15 Dec 2021 17:04:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:38 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 149F2220295;
 Wed, 15 Dec 2021 18:04:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 064/102] ppc/ppc405: Convert printfs to trace-events
Date: Wed, 15 Dec 2021 18:03:19 +0100
Message-Id: <20211215170357.321643-52-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Y1FfcDpQphZvSate_LVMFFPl5X187el
X-Proofpoint-ORIG-GUID: 2Y1FfcDpQphZvSate_LVMFFPl5X187el
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and one error message to a LOG_GUEST_ERROR.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-5-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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
=20
 ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
                                 uint32_t flags)
@@ -287,13 +280,9 @@ struct ppc4xx_opba_t {
=20
 static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_opba_t *opba;
+    ppc4xx_opba_t *opba =3D opaque;
     uint32_t ret;
=20
-#ifdef DEBUG_OPBA
-    printf("%s: addr " TARGET_FMT_plx "\n", __func__, addr);
-#endif
-    opba =3D opaque;
     switch (addr) {
     case 0x00:
         ret =3D opba->cr;
@@ -306,19 +295,17 @@ static uint64_t opba_readb(void *opaque, hwaddr add=
r, unsigned size)
         break;
     }
=20
+    trace_opba_readb(addr, ret);
     return ret;
 }
=20
 static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    ppc4xx_opba_t *opba;
+    ppc4xx_opba_t *opba =3D opaque;
+
+    trace_opba_writeb(addr, value);
=20
-#ifdef DEBUG_OPBA
-    printf("%s: addr " TARGET_FMT_plx " val %08" PRIx32 "\n", __func__, =
addr,
-           value);
-#endif
-    opba =3D opaque;
     switch (addr) {
     case 0x00:
         opba->cr =3D value & 0xF8;
@@ -353,10 +340,9 @@ static void ppc4xx_opba_init(hwaddr base)
 {
     ppc4xx_opba_t *opba;
=20
+    trace_opba_init(base);
+
     opba =3D g_malloc0(sizeof(ppc4xx_opba_t));
-#ifdef DEBUG_OPBA
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x00=
2);
     memory_region_add_subregion(get_system_memory(), base, &opba->io);
     qemu_register_reset(ppc4xx_opba_reset, opba);
@@ -707,20 +693,14 @@ struct ppc405_gpio_t {
=20
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned siz=
e)
 {
-#ifdef DEBUG_GPIO
-    printf("%s: addr " TARGET_FMT_plx " size %d\n", __func__, addr, size=
);
-#endif
-
+    trace_ppc405_gpio_read(addr, size);
     return 0;
 }
=20
 static void ppc405_gpio_write(void *opaque, hwaddr addr, uint64_t value,
                               unsigned size)
 {
-#ifdef DEBUG_GPIO
-    printf("%s: addr " TARGET_FMT_plx " size %d val %08" PRIx32 "\n",
-           __func__, addr, size, value);
-#endif
+    trace_ppc405_gpio_write(addr, size, value);
 }
=20
 static const MemoryRegionOps ppc405_gpio_ops =3D {
@@ -737,10 +717,9 @@ static void ppc405_gpio_init(hwaddr base)
 {
     ppc405_gpio_t *gpio;
=20
+    trace_ppc405_gpio_init(base);
+
     gpio =3D g_malloc0(sizeof(ppc405_gpio_t));
-#ifdef DEBUG_GPIO
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio=
", 0x038);
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
+    trace_ocm_update_mappings(isarc, isacntl, dsarc, dsacntl, ocm->isarc=
,
+                              ocm->isacntl, ocm->dsarc, ocm->dsacntl);
+
     if (ocm->isarc !=3D isarc ||
         (ocm->isacntl & 0x80000000) !=3D (isacntl & 0x80000000)) {
         if (ocm->isacntl & 0x80000000) {
             /* Unmap previously assigned memory region */
-            printf("OCM unmap ISA %08" PRIx32 "\n", ocm->isarc);
+            trace_ocm_unmap("ISA", ocm->isarc);
             memory_region_del_subregion(get_system_memory(), &ocm->isarc=
_ram);
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
             if (!(isacntl & 0x80000000) || ocm->dsarc !=3D isarc) {
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
             if (!(isacntl & 0x80000000) || dsarc !=3D isarc) {
                 /* Map new data memory region */
-#ifdef DEBUG_OCM
-                printf("OCM map DSA %08" PRIx32 "\n", dsarc);
-#endif
+                trace_ocm_map("DSA", dsarc);
                 memory_region_add_subregion(get_system_memory(), dsarc,
                                             &ocm->dsarc_ram);
             }
@@ -988,14 +957,12 @@ static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t =
*gpt)
=20
 static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size=
)
 {
-    ppc4xx_gpt_t *gpt;
+    ppc4xx_gpt_t *gpt =3D opaque;
     uint32_t ret;
     int idx;
=20
-#ifdef DEBUG_GPT
-    printf("%s: addr " TARGET_FMT_plx "\n", __func__, addr);
-#endif
-    gpt =3D opaque;
+    trace_ppc4xx_gpt_read(addr, size);
+
     switch (addr) {
     case 0x00:
         /* Time base counter */
@@ -1044,14 +1011,11 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwa=
ddr addr, unsigned size)
 static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
                              unsigned size)
 {
-    ppc4xx_gpt_t *gpt;
+    ppc4xx_gpt_t *gpt =3D opaque;
     int idx;
=20
-#ifdef DEBUG_I2C
-    printf("%s: addr " TARGET_FMT_plx " val %08" PRIx32 "\n", __func__, =
addr,
-           value);
-#endif
-    gpt =3D opaque;
+    trace_ppc4xx_gpt_write(addr, size, value);
+
     switch (addr) {
     case 0x00:
         /* Time base counter */
@@ -1144,14 +1108,13 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq=
 irqs[5])
     ppc4xx_gpt_t *gpt;
     int i;
=20
+    trace_ppc4xx_gpt_init(base);
+
     gpt =3D g_malloc0(sizeof(ppc4xx_gpt_t));
     for (i =3D 0; i < 5; i++) {
         gpt->irqs[i] =3D irqs[i];
     }
     gpt->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt)=
;
-#ifdef DEBUG_GPT
-    printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
-#endif
     memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4=
);
     memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
     qemu_register_reset(ppc4xx_gpt_reset, gpt);
@@ -1215,17 +1178,14 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc=
_t *cpc)
     VCO_out =3D 0;
     if ((cpc->pllmr[1] & 0x80000000) && !(cpc->pllmr[1] & 0x40000000)) {
         M =3D (((cpc->pllmr[1] >> 20) - 1) & 0xF) + 1; /* FBMUL */
-#ifdef DEBUG_CLOCKS_LL
-        printf("FBMUL %01" PRIx32 " %d\n", (cpc->pllmr[1] >> 20) & 0xF, =
M);
-#endif
+        trace_ppc405ep_clocks_compute("FBMUL", (cpc->pllmr[1] >> 20) & 0=
xF, M);
         D =3D 8 - ((cpc->pllmr[1] >> 16) & 0x7); /* FWDA */
-#ifdef DEBUG_CLOCKS_LL
-        printf("FWDA %01" PRIx32 " %d\n", (cpc->pllmr[1] >> 16) & 0x7, D=
);
-#endif
+        trace_ppc405ep_clocks_compute("FWDA", (cpc->pllmr[1] >> 16) & 0x=
7, D);
         VCO_out =3D (uint64_t)cpc->sysclk * M * D;
         if (VCO_out < 500000000UL || VCO_out > 1000000000UL) {
             /* Error - unlock the PLL */
-            printf("VCO out of range %" PRIu64 "\n", VCO_out);
+            qemu_log_mask(LOG_GUEST_ERROR, "VCO out of range %" PRIu64 "=
\n",
+                          VCO_out);
 #if 0
             cpc->pllmr[1] &=3D ~0x80000000;
             goto pll_bypass;
@@ -1246,54 +1206,43 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc=
_t *cpc)
     }
     /* Now, compute all other clocks */
     D =3D ((cpc->pllmr[0] >> 20) & 0x3) + 1; /* CCDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("CCDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 20) & 0x3, D);
-#endif
+     trace_ppc405ep_clocks_compute("CCDV", (cpc->pllmr[0] >> 20) & 0x3, =
D);
     CPU_clk =3D PLL_out / D;
     D =3D ((cpc->pllmr[0] >> 16) & 0x3) + 1; /* CBDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("CBDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 16) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("CBDV", (cpc->pllmr[0] >> 16) & 0x3, D=
);
     PLB_clk =3D CPU_clk / D;
     D =3D ((cpc->pllmr[0] >> 12) & 0x3) + 1; /* OPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("OPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 12) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("OPDV", (cpc->pllmr[0] >> 12) & 0x3, D=
);
     OPB_clk =3D PLB_clk / D;
     D =3D ((cpc->pllmr[0] >> 8) & 0x3) + 2; /* EPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("EPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 8) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("EPDV", (cpc->pllmr[0] >> 8) & 0x3, D)=
;
     EBC_clk =3D PLB_clk / D;
     D =3D ((cpc->pllmr[0] >> 4) & 0x3) + 1; /* MPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("MPDV %01" PRIx32 " %d\n", (cpc->pllmr[0] >> 4) & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("MPDV", (cpc->pllmr[0] >> 4) & 0x3, D)=
;
     MAL_clk =3D PLB_clk / D;
     D =3D (cpc->pllmr[0] & 0x3) + 1; /* PPDV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("PPDV %01" PRIx32 " %d\n", cpc->pllmr[0] & 0x3, D);
-#endif
+    trace_ppc405ep_clocks_compute("PPDV", cpc->pllmr[0] & 0x3, D);
     PCI_clk =3D PLB_clk / D;
     D =3D ((cpc->ucr - 1) & 0x7F) + 1; /* U0DIV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("U0DIV %01" PRIx32 " %d\n", cpc->ucr & 0x7F, D);
-#endif
+    trace_ppc405ep_clocks_compute("U0DIV", cpc->ucr & 0x7F, D);
     UART0_clk =3D PLL_out / D;
     D =3D (((cpc->ucr >> 8) - 1) & 0x7F) + 1; /* U1DIV */
-#ifdef DEBUG_CLOCKS_LL
-    printf("U1DIV %01" PRIx32 " %d\n", (cpc->ucr >> 8) & 0x7F, D);
-#endif
+    trace_ppc405ep_clocks_compute("U1DIV", (cpc->ucr >> 8) & 0x7F, D);
     UART1_clk =3D PLL_out / D;
-#ifdef DEBUG_CLOCKS
-    printf("Setup PPC405EP clocks - sysclk %" PRIu32 " VCO %" PRIu64
-           " PLL out %" PRIu64 " Hz\n", cpc->sysclk, VCO_out, PLL_out);
-    printf("CPU %" PRIu32 " PLB %" PRIu32 " OPB %" PRIu32 " EBC %" PRIu3=
2
-           " MAL %" PRIu32 " PCI %" PRIu32 " UART0 %" PRIu32
-           " UART1 %" PRIu32 "\n",
-           CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk,
-           UART0_clk, UART1_clk);
-#endif
+
+    if (trace_event_get_state_backends(TRACE_PPC405EP_CLOCKS_SETUP)) {
+        g_autofree char *trace =3D g_strdup_printf(
+            "Setup PPC405EP clocks - sysclk %" PRIu32 " VCO %" PRIu64
+            " PLL out %" PRIu64 " Hz\n"
+            "CPU %" PRIu32 " PLB %" PRIu32 " OPB %" PRIu32 " EBC %" PRIu=
32
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
@@ -144,3 +144,23 @@ ppc440_pcix_update_pim(int idx, uint64_t size, uint6=
4_t la) "Added window %d of
 ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pci=
a) "Added window %d of size=3D0x%x from CPU=3D0x%" PRIx64 " to PCI=3D0x%"=
 PRIx64
 ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " =3D=
 0x%" PRIx32
 ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr =
0x%" PRIx64 " =3D 0x%" PRIx32 " size 0x%" PRIx32
+
+# ppc405_boards.c
+opba_readb(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " =3D 0x%" PRI=
x32
+opba_writeb(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " =3D 0x%" PR=
Ix64
+opba_init(uint64_t addr) "offet 0x%" PRIx64
+
+ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size =
%d"
+ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%"=
 PRIx64 " size %d =3D 0x%" PRIx64
+ppc405_gpio_init(uint64_t addr) "offet 0x%" PRIx64
+
+ocm_update_mappings(uint32_t isarc, uint32_t isacntl, uint32_t dsarc, ui=
nt32_t dsacntl, uint32_t ocm_isarc, uint32_t ocm_isacntl, uint32_t ocm_ds=
arc, uint32_t ocm_dsacntl) "OCM update ISA 0x%08" PRIx32 " 0x%08" PRIx32 =
" (0x%08" PRIx32" 0x%08" PRIx32 ") DSA 0x%08" PRIx32 " 0x%08" PRIx32" (0x=
%08" PRIx32 " 0x%08" PRIx32 ")"
+ocm_map(const char* prefix, uint32_t isarc) "OCM map %s 0x%08" PRIx32
+ocm_unmap(const char* prefix, uint32_t isarc) "OCM unmap %s 0x%08" PRIx3=
2
+
+ppc4xx_gpt_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %=
d"
+ppc4xx_gpt_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" =
PRIx64 " size %d =3D 0x%" PRIx64
+ppc4xx_gpt_init(uint64_t addr) "offet 0x%" PRIx64
+
+ppc405ep_clocks_compute(const char *param, uint32_t param2, uint32_t val=
) "%s 0x%1" PRIx32 " %d"
+ppc405ep_clocks_setup(const char *trace) "%s"
--=20
2.31.1


