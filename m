Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9AE36FF94
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:34:08 +0200 (CEST)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcX1j-0004TF-6v
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW9-0000Jp-ER; Fri, 30 Apr 2021 13:01:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24718
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW6-0002WO-H7; Fri, 30 Apr 2021 13:01:28 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGYAaB143538; Fri, 30 Apr 2021 13:01:16 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388mt7j6nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UH0PS2017974;
 Fri, 30 Apr 2021 17:01:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8kakx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UH1CxF34341362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:01:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08BF95204F;
 Fri, 30 Apr 2021 17:01:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C07735204E;
 Fri, 30 Apr 2021 17:01:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2396C220193;
 Fri, 30 Apr 2021 19:01:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/18] aspeed/smc: Add extra controls to request DMA
Date: Fri, 30 Apr 2021 19:01:03 +0200
Message-Id: <20210430170108.10261-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0JTYPn7hubjKSKXxKVONG7ejaXQXCg70
X-Proofpoint-GUID: 0JTYPn7hubjKSKXxKVONG7ejaXQXCg70
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1034 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AST2600 SPI controllers have a set of bits to request/grant DMA
access. Add a new SMC feature for these controllers and use it to
check access to the DMA registers.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210407171637.777743-16-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 74 +++++++++++++++++++++++++++++++++----
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 07879fd1c4a7..cdaf165300b6 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -55,6 +55,7 @@ typedef struct AspeedSMCController {
                                const AspeedSegments *seg);
     void (*reg_to_segment)(const struct AspeedSMCState *s, uint32_t reg,
                            AspeedSegments *seg);
+    void (*dma_ctrl)(struct AspeedSMCState *s, uint32_t value);
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4521bbd4864e..189b35637c77 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -127,6 +127,8 @@
=20
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
+#define   DMA_CTRL_REQUEST      (1 << 31)
+#define   DMA_CTRL_GRANT        (1 << 30)
 #define   DMA_CTRL_DELAY_MASK   0xf
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
@@ -228,6 +230,7 @@ static uint32_t aspeed_smc_segment_to_reg(const Aspee=
dSMCState *s,
                                           const AspeedSegments *seg);
 static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t =
reg,
                                       AspeedSegments *seg);
+static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
=20
 /*
  * AST2600 definitions
@@ -257,7 +260,10 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const=
 AspeedSMCState *s,
                                                const AspeedSegments *seg=
);
 static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
                                            uint32_t reg, AspeedSegments =
*seg);
+static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
+
 #define ASPEED_SMC_FEATURE_DMA       0x1
+#define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
=20
 static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
 {
@@ -281,6 +287,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_SMC_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.fmc-ast2400",
         .r_conf            =3D R_CONF,
@@ -299,6 +306,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.spi1-ast2400",
         .r_conf            =3D R_SPI_CONF,
@@ -315,6 +323,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_SPI_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.fmc-ast2500",
         .r_conf            =3D R_CONF,
@@ -333,6 +342,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.spi1-ast2500",
         .r_conf            =3D R_CONF,
@@ -349,6 +359,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.spi2-ast2500",
         .r_conf            =3D R_CONF,
@@ -365,6 +376,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.fmc-ast2600",
         .r_conf            =3D R_CONF,
@@ -383,6 +395,7 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.spi1-ast2600",
         .r_conf            =3D R_CONF,
@@ -395,12 +408,14 @@ static const AspeedSMCController controllers[] =3D =
{
         .segments          =3D aspeed_segments_ast2600_spi1,
         .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .features          =3D ASPEED_SMC_FEATURE_DMA,
+        .features          =3D ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_DMA_GRANT,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
     }, {
         .name              =3D "aspeed.spi2-ast2600",
         .r_conf            =3D R_CONF,
@@ -413,12 +428,14 @@ static const AspeedSMCController controllers[] =3D =
{
         .segments          =3D aspeed_segments_ast2600_spi2,
         .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .features          =3D ASPEED_SMC_FEATURE_DMA,
+        .features          =3D ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_DMA_GRANT,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
+        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
     },
 };
=20
@@ -1240,7 +1257,7 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
     }
 }
=20
-static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
+static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
 {
     if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
         s->regs[R_DMA_CTRL] =3D dma_ctrl;
@@ -1265,6 +1282,46 @@ static void aspeed_smc_dma_ctrl(AspeedSMCState *s,=
 uint64_t dma_ctrl)
     aspeed_smc_dma_done(s);
 }
=20
+static inline bool aspeed_smc_dma_granted(AspeedSMCState *s)
+{
+    if (!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA_GRANT)) {
+        return true;
+    }
+
+    if (!(s->regs[R_DMA_CTRL] & DMA_CTRL_GRANT)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func_=
_);
+        return false;
+    }
+
+    return true;
+}
+
+static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctr=
l)
+{
+    /* Preserve DMA bits  */
+    dma_ctrl |=3D s->regs[R_DMA_CTRL] & (DMA_CTRL_REQUEST | DMA_CTRL_GRA=
NT);
+
+    if (dma_ctrl =3D=3D 0xAEED0000) {
+        /* automatically grant request */
+        s->regs[R_DMA_CTRL] |=3D (DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
+        return;
+    }
+
+    /* clear request */
+    if (dma_ctrl =3D=3D 0xDEEA0000) {
+        s->regs[R_DMA_CTRL] &=3D ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
+        return;
+    }
+
+    if (!aspeed_smc_dma_granted(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func_=
_);
+        return;
+    }
+
+    aspeed_smc_dma_ctrl(s, dma_ctrl);
+    s->regs[R_DMA_CTRL] &=3D ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
+}
+
 static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned int size)
 {
@@ -1297,12 +1354,15 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
     } else if (addr =3D=3D R_INTR_CTRL) {
         s->regs[addr] =3D value;
     } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) {
-        aspeed_smc_dma_ctrl(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) {
+        s->ctrl->dma_ctrl(s, value);
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR &&
+               aspeed_smc_dma_granted(s)) {
         s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR &&
+               aspeed_smc_dma_granted(s)) {
         s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
-    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN &&
+               aspeed_smc_dma_granted(s)) {
         s->regs[addr] =3D DMA_LENGTH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
--=20
2.26.3


