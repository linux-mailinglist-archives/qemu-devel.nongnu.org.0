Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD6482EA3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:10:52 +0100 (CET)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HUY-0002BO-GY
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gw6-0002A8-7U; Mon, 03 Jan 2022 01:35:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gw0-000806-Fn; Mon, 03 Jan 2022 01:35:13 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2035UxLg012954; 
 Mon, 3 Jan 2022 06:34:50 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbnkyddsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:50 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036YWf4023290;
 Mon, 3 Jan 2022 06:34:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3daek8yq3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2036YjPx39518678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:34:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BEFDA406A;
 Mon,  3 Jan 2022 06:34:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 570B6A4060;
 Mon,  3 Jan 2022 06:34:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 Jan 2022 06:34:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id AC0FB2201BB;
 Mon,  3 Jan 2022 07:34:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] ppc/ppc4xx: Convert printfs()
Date: Mon,  3 Jan 2022 07:34:35 +0100
Message-Id: <20220103063441.3424853-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103063441.3424853-1-clg@kaod.org>
References: <20220103063441.3424853-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B1yGKTYD7Obs2s3G-eaYXHoyF3DpdW1I
X-Proofpoint-ORIG-GUID: B1yGKTYD7Obs2s3G-eaYXHoyF3DpdW1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1034
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201030044
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.drobear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a QEMU log primitive for errors and trace events for debug.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.drobear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211222064025.1541490-3-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/mpc8544_guts.c |  9 ++++++---
 hw/ppc/ppc4xx_devs.c  | 39 +++++++++++----------------------------
 hw/ppc/ppc4xx_pci.c   | 11 +++++++----
 hw/ppc/trace-events   |  5 +++++
 4 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index e8d2d51c20c0..a26e83d0484b 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -19,6 +19,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "sysemu/runstate.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -82,7 +83,9 @@ static uint64_t mpc8544_guts_read(void *opaque, hwaddr =
addr,
         value =3D env->spr[SPR_E500_SVR];
         break;
     default:
-        fprintf(stderr, "guts: Unknown register read: %x\n", (int)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unknown register 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
         break;
     }
=20
@@ -101,8 +104,8 @@ static void mpc8544_guts_write(void *opaque, hwaddr a=
ddr,
         }
         break;
     default:
-        fprintf(stderr, "guts: Unknown register write: %x =3D %x\n",
-                (int)addr, (unsigned)value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown register 0x%" HWADDR=
_PRIx
+                       " =3D 0x%" PRIx64 "\n", __func__, addr, value);
         break;
     }
 }
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 980c48944fc7..e7d82ae5016c 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -35,14 +35,7 @@
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-
-/*#define DEBUG_UIC*/
-
-#ifdef DEBUG_UIC
-#  define LOG_UIC(...) qemu_log_mask(CPU_LOG_INT, ## __VA_ARGS__)
-#else
-#  define LOG_UIC(...) do { } while (0)
-#endif
+#include "trace.h"
=20
 static void ppc4xx_reset(void *opaque)
 {
@@ -137,8 +130,9 @@ static uint32_t sdram_bcr (hwaddr ram_base,
         bcr =3D 0x000C0000;
         break;
     default:
-        printf("%s: invalid RAM size " TARGET_FMT_plx "\n", __func__,
-               ram_size);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __fun=
c__,
+                      ram_size);
         return 0x00000000;
     }
     bcr |=3D ram_base & 0xFF800000;
@@ -171,10 +165,8 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int=
 i,
 {
     if (sdram->bcr[i] & 0x00000001) {
         /* Unmap RAM */
-#ifdef DEBUG_SDRAM
-        printf("%s: unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\=
n",
-               __func__, sdram_base(sdram->bcr[i]), sdram_size(sdram->bc=
r[i]));
-#endif
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
+                                 sdram_size(sdram->bcr[i]));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->containers[i]);
         memory_region_del_subregion(&sdram->containers[i],
@@ -183,10 +175,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int=
 i,
     }
     sdram->bcr[i] =3D bcr & 0xFFDEE001;
     if (enabled && (bcr & 0x00000001)) {
-#ifdef DEBUG_SDRAM
-        printf("%s: Map RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\n"=
,
-               __func__, sdram_base(bcr), sdram_size(bcr));
-#endif
+        trace_ppc4xx_sdram_unmap(sdram_base(bcr), sdram_size(bcr));
         memory_region_init(&sdram->containers[i], NULL, "sdram-container=
s",
                            sdram_size(bcr));
         memory_region_add_subregion(&sdram->containers[i], 0,
@@ -216,10 +205,8 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
     int i;
=20
     for (i =3D 0; i < sdram->nbanks; i++) {
-#ifdef DEBUG_SDRAM
-        printf("%s: Unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\=
n",
-               __func__, sdram_base(sdram->bcr[i]), sdram_size(sdram->bc=
r[i]));
-#endif
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
+                                 sdram_size(sdram->bcr[i]));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->ram_memories[i]);
     }
@@ -316,16 +303,12 @@ static void dcr_write_sdram (void *opaque, int dcrn=
, uint32_t val)
         case 0x20: /* SDRAM_CFG */
             val &=3D 0xFFE00000;
             if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
-#ifdef DEBUG_SDRAM
-                printf("%s: enable SDRAM controller\n", __func__);
-#endif
+                trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
                 sdram_map_bcr(sdram);
                 sdram->status &=3D ~0x80000000;
             } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000))=
 {
-#ifdef DEBUG_SDRAM
-                printf("%s: disable SDRAM controller\n", __func__);
-#endif
+                trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
                 sdram_unmap_bcr(sdram);
                 sdram->status |=3D 0x80000000;
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 304a29349c2e..5df97e6d156f 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -20,6 +20,7 @@
  * 4xx SoCs, such as the 440EP. */
=20
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
@@ -152,8 +153,9 @@ static void ppc4xx_pci_reg_write4(void *opaque, hwadd=
r offset,
         break;
=20
     default:
-        printf("%s: unhandled PCI internal register 0x%lx\n", __func__,
-               (unsigned long)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                     "%s: unhandled PCI internal register 0x%" HWADDR_PR=
Ix "\n",
+                     __func__, offset);
         break;
     }
 }
@@ -218,8 +220,9 @@ static uint64_t ppc4xx_pci_reg_read4(void *opaque, hw=
addr offset,
         break;
=20
     default:
-        printf("%s: invalid PCI internal register 0x%lx\n", __func__,
-               (unsigned long)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid PCI internal register 0x%" HWADDR_PRI=
x "\n",
+                      __func__, offset);
         value =3D 0;
     }
=20
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index ada644652d94..0c55aa501471 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -164,3 +164,8 @@ ppc4xx_gpt_init(uint64_t addr) "offet 0x%" PRIx64
=20
 ppc405ep_clocks_compute(const char *param, uint32_t param2, uint32_t val=
) "%s 0x%1" PRIx32 " %d"
 ppc405ep_clocks_setup(const char *trace) "%s"
+
+# ppc4xx_devs.c
+ppc4xx_sdram_enable(const char *trace) "%s SDRAM controller"
+ppc4xx_sdram_unmap(uint64_t addr, uint64_t size) "Unmap RAM area 0x%" PR=
Ix64 " size 0x%" PRIx64
+ppc4xx_sdram_map(uint64_t addr, uint64_t size) "Map RAM area 0x%" PRIx64=
 " size 0x%" PRIx64
--=20
2.31.1


