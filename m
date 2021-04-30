Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F349336FF69
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:22:54 +0200 (CEST)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWqr-0000z5-VW
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW4-0000HS-5V; Fri, 30 Apr 2021 13:01:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW2-0002VL-4Z; Fri, 30 Apr 2021 13:01:23 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGZrms079489; Fri, 30 Apr 2021 13:01:16 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388me5k2s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:16 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGw9xF019431;
 Fri, 30 Apr 2021 17:01:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8kay3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UH1BW835521008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:01:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E5015204E;
 Fri, 30 Apr 2021 17:01:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 26E1C5204F;
 Fri, 30 Apr 2021 17:01:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8B95622016C;
 Fri, 30 Apr 2021 19:01:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/18] aspeed/smc: Add a 'features' attribute to the object
 class
Date: Fri, 30 Apr 2021 19:01:02 +0200
Message-Id: <20210430170108.10261-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cSEmDbjC8fHzgLgJl542PunKe5Cw9f8n
X-Proofpoint-GUID: cSEmDbjC8fHzgLgJl542PunKe5Cw9f8n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1034
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will simplify extensions of the SMC model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210407171637.777743-15-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 44 +++++++++++++++++++++----------------
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6ea2871cd899..07879fd1c4a7 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
-    bool has_dma;
+    uint32_t features;
     hwaddr dma_flash_mask;
     hwaddr dma_dram_mask;
     uint32_t nregs;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 50ea907aef74..4521bbd4864e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -257,6 +257,12 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const=
 AspeedSMCState *s,
                                                const AspeedSegments *seg=
);
 static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
                                            uint32_t reg, AspeedSegments =
*seg);
+#define ASPEED_SMC_FEATURE_DMA       0x1
+
+static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
+{
+    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
+}
=20
 static const AspeedSMCController controllers[] =3D {
     {
@@ -271,7 +277,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_legacy,
         .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
         .flash_window_size =3D 0x6000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_SMC_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -287,7 +293,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_fmc,
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x1FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -305,7 +311,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_spi,
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_SPI_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -321,7 +327,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_fmc,
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -339,7 +345,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_spi1,
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -355,7 +361,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_spi2,
         .flash_window_base =3D ASPEED_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -371,7 +377,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_fmc,
         .flash_window_base =3D ASPEED26_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -389,7 +395,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi1,
         .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -407,7 +413,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi2,
         .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -997,11 +1003,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwad=
dr addr, unsigned int size)
         addr =3D=3D R_CE_CMD_CTRL ||
         addr =3D=3D R_INTR_CTRL ||
         addr =3D=3D R_DUMMY_DATA ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CHECKSUM) ||
         (addr >=3D R_SEG_ADDR0 &&
          addr < R_SEG_ADDR0 + s->ctrl->max_peripherals) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_periph=
erals)) {
@@ -1290,13 +1296,13 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
         s->regs[addr] =3D value & 0xff;
     } else if (addr =3D=3D R_INTR_CTRL) {
         s->regs[addr] =3D value;
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) {
         aspeed_smc_dma_ctrl(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) {
         s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) {
         s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) {
         s->regs[addr] =3D DMA_LENGTH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
@@ -1412,7 +1418,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* DMA support */
-    if (s->ctrl->has_dma) {
+    if (aspeed_smc_has_dma(s)) {
         aspeed_smc_dma_setup(s, errp);
     }
 }
--=20
2.26.3


