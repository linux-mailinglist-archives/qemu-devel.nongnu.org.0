Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C838F36FF4E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:14:32 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWil-0002qd-Qn
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW3-0000Gs-St; Fri, 30 Apr 2021 13:01:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW1-0002VJ-6B; Fri, 30 Apr 2021 13:01:23 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGXKsV052867; Fri, 30 Apr 2021 13:01:16 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388m5nuvj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGwtAO008483;
 Fri, 30 Apr 2021 17:01:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhbam6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UH1Aox36241802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:01:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3758A4067;
 Fri, 30 Apr 2021 17:01:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D66BA405B;
 Fri, 30 Apr 2021 17:01:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 17:01:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F167B220193;
 Fri, 30 Apr 2021 19:01:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/18] hw/misc/aspeed_xdma: Add AST2600 support
Date: Fri, 30 Apr 2021 19:01:01 +0200
Message-Id: <20210430170108.10261-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9yVj6Pg4B1MXJGWC15r9FTT9ITWXW1xA
X-Proofpoint-ORIG-GUID: 9yVj6Pg4B1MXJGWC15r9FTT9ITWXW1xA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300109
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
Cc: qemu-arm@nongnu.org, Eddie James <eajames@linux.ibm.com>,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we introduced support for the AST2600 SoC, the XDMA controller
was forgotten. It went unnoticed because it's not used under emulation.
But the register layout being different, the reset procedure is bogus
and this breaks kexec.

Add a AspeedXDMAClass to take into account the register differences.

Cc: Eddie James <eajames@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
Message-Id: <20210407171637.777743-14-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_xdma.h |  17 ++++-
 hw/arm/aspeed_ast2600.c       |   3 +-
 hw/arm/aspeed_soc.c           |   3 +-
 hw/misc/aspeed_xdma.c         | 124 +++++++++++++++++++++++++++-------
 4 files changed, 121 insertions(+), 26 deletions(-)

diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.=
h
index a2dea96984f3..b1478fd1c681 100644
--- a/include/hw/misc/aspeed_xdma.h
+++ b/include/hw/misc/aspeed_xdma.h
@@ -13,7 +13,10 @@
 #include "qom/object.h"
=20
 #define TYPE_ASPEED_XDMA "aspeed.xdma"
-OBJECT_DECLARE_SIMPLE_TYPE(AspeedXDMAState, ASPEED_XDMA)
+#define TYPE_ASPEED_2400_XDMA TYPE_ASPEED_XDMA "-ast2400"
+#define TYPE_ASPEED_2500_XDMA TYPE_ASPEED_XDMA "-ast2500"
+#define TYPE_ASPEED_2600_XDMA TYPE_ASPEED_XDMA "-ast2600"
+OBJECT_DECLARE_TYPE(AspeedXDMAState, AspeedXDMAClass, ASPEED_XDMA)
=20
 #define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_XDMA_REG_SIZE 0x7C
@@ -28,4 +31,16 @@ struct AspeedXDMAState {
     uint32_t regs[ASPEED_XDMA_NUM_REGS];
 };
=20
+struct AspeedXDMAClass {
+    SysBusDeviceClass parent_class;
+
+    uint8_t cmdq_endp;
+    uint8_t cmdq_wrp;
+    uint8_t cmdq_rdp;
+    uint8_t intr_ctrl;
+    uint32_t intr_ctrl_mask;
+    uint8_t intr_status;
+    uint32_t intr_complete;
+};
+
 #endif /* ASPEED_XDMA_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e0fbb020c770..c60824bfeecb 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -187,7 +187,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
         object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_M=
II);
     }
=20
-    object_initialize_child(obj, "xdma", &s->xdma, TYPE_ASPEED_XDMA);
+    snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname=
);
+    object_initialize_child(obj, "xdma", &s->xdma, typename);
=20
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 8ed29113f79f..4a95d27d9d63 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -199,7 +199,8 @@ static void aspeed_soc_init(Object *obj)
                                 TYPE_FTGMAC100);
     }
=20
-    object_initialize_child(obj, "xdma", &s->xdma, TYPE_ASPEED_XDMA);
+    snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname=
);
+    object_initialize_child(obj, "xdma", &s->xdma, typename);
=20
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
index 533d237e3ce2..1c21577c98c9 100644
--- a/hw/misc/aspeed_xdma.c
+++ b/hw/misc/aspeed_xdma.c
@@ -30,6 +30,19 @@
 #define  XDMA_IRQ_ENG_STAT_US_COMP BIT(4)
 #define  XDMA_IRQ_ENG_STAT_DS_COMP BIT(5)
 #define  XDMA_IRQ_ENG_STAT_RESET   0xF8000000
+
+#define XDMA_AST2600_BMC_CMDQ_ADDR   0x14
+#define XDMA_AST2600_BMC_CMDQ_ENDP   0x18
+#define XDMA_AST2600_BMC_CMDQ_WRP    0x1c
+#define XDMA_AST2600_BMC_CMDQ_RDP    0x20
+#define XDMA_AST2600_IRQ_CTRL        0x38
+#define  XDMA_AST2600_IRQ_CTRL_US_COMP    BIT(16)
+#define  XDMA_AST2600_IRQ_CTRL_DS_COMP    BIT(17)
+#define  XDMA_AST2600_IRQ_CTRL_W_MASK     0x017003FF
+#define XDMA_AST2600_IRQ_STATUS      0x3c
+#define  XDMA_AST2600_IRQ_STATUS_US_COMP  BIT(16)
+#define  XDMA_AST2600_IRQ_STATUS_DS_COMP  BIT(17)
+
 #define XDMA_MEM_SIZE              0x1000
=20
 #define TO_REG(addr) ((addr) / sizeof(uint32_t))
@@ -52,56 +65,48 @@ static void aspeed_xdma_write(void *opaque, hwaddr ad=
dr, uint64_t val,
     unsigned int idx;
     uint32_t val32 =3D (uint32_t)val;
     AspeedXDMAState *xdma =3D opaque;
+    AspeedXDMAClass *axc =3D ASPEED_XDMA_GET_CLASS(xdma);
=20
     if (addr >=3D ASPEED_XDMA_REG_SIZE) {
         return;
     }
=20
-    switch (addr) {
-    case XDMA_BMC_CMDQ_ENDP:
+    if (addr =3D=3D axc->cmdq_endp) {
         xdma->regs[TO_REG(addr)] =3D val32 & XDMA_BMC_CMDQ_W_MASK;
-        break;
-    case XDMA_BMC_CMDQ_WRP:
+    } else if (addr =3D=3D axc->cmdq_wrp) {
         idx =3D TO_REG(addr);
         xdma->regs[idx] =3D val32 & XDMA_BMC_CMDQ_W_MASK;
-        xdma->regs[TO_REG(XDMA_BMC_CMDQ_RDP)] =3D xdma->regs[idx];
+        xdma->regs[TO_REG(axc->cmdq_rdp)] =3D xdma->regs[idx];
=20
         trace_aspeed_xdma_write(addr, val);
=20
         if (xdma->bmc_cmdq_readp_set) {
             xdma->bmc_cmdq_readp_set =3D 0;
         } else {
-            xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] |=3D
-                XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_COMP;
+            xdma->regs[TO_REG(axc->intr_status)] |=3D axc->intr_complete=
;
=20
-            if (xdma->regs[TO_REG(XDMA_IRQ_ENG_CTRL)] &
-                (XDMA_IRQ_ENG_CTRL_US_COMP | XDMA_IRQ_ENG_CTRL_DS_COMP))
+            if (xdma->regs[TO_REG(axc->intr_ctrl)] & axc->intr_complete)=
 {
                 qemu_irq_raise(xdma->irq);
+            }
         }
-        break;
-    case XDMA_BMC_CMDQ_RDP:
+    } else if (addr =3D=3D axc->cmdq_rdp) {
         trace_aspeed_xdma_write(addr, val);
=20
         if (val32 =3D=3D XDMA_BMC_CMDQ_RDP_MAGIC) {
             xdma->bmc_cmdq_readp_set =3D 1;
         }
-        break;
-    case XDMA_IRQ_ENG_CTRL:
-        xdma->regs[TO_REG(addr)] =3D val32 & XDMA_IRQ_ENG_CTRL_W_MASK;
-        break;
-    case XDMA_IRQ_ENG_STAT:
+    } else if (addr =3D=3D axc->intr_ctrl) {
+        xdma->regs[TO_REG(addr)] =3D val32 & axc->intr_ctrl_mask;
+    } else if (addr =3D=3D axc->intr_status) {
         trace_aspeed_xdma_write(addr, val);
=20
         idx =3D TO_REG(addr);
-        if (val32 & (XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_CO=
MP)) {
-            xdma->regs[idx] &=3D
-                ~(XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_COMP)=
;
+        if (val32 & axc->intr_complete) {
+            xdma->regs[idx] &=3D ~axc->intr_complete;
             qemu_irq_lower(xdma->irq);
         }
-        break;
-    default:
+    } else {
         xdma->regs[TO_REG(addr)] =3D val32;
-        break;
     }
 }
=20
@@ -127,10 +132,11 @@ static void aspeed_xdma_realize(DeviceState *dev, E=
rror **errp)
 static void aspeed_xdma_reset(DeviceState *dev)
 {
     AspeedXDMAState *xdma =3D ASPEED_XDMA(dev);
+    AspeedXDMAClass *axc =3D ASPEED_XDMA_GET_CLASS(xdma);
=20
     xdma->bmc_cmdq_readp_set =3D 0;
     memset(xdma->regs, 0, ASPEED_XDMA_REG_SIZE);
-    xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] =3D XDMA_IRQ_ENG_STAT_RESET;
+    xdma->regs[TO_REG(axc->intr_status)] =3D XDMA_IRQ_ENG_STAT_RESET;
=20
     qemu_irq_lower(xdma->irq);
 }
@@ -144,6 +150,73 @@ static const VMStateDescription aspeed_xdma_vmstate =
=3D {
     },
 };
=20
+static void aspeed_2600_xdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedXDMAClass *axc =3D ASPEED_XDMA_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 XDMA Controller";
+
+    axc->cmdq_endp =3D XDMA_AST2600_BMC_CMDQ_ENDP;
+    axc->cmdq_wrp =3D XDMA_AST2600_BMC_CMDQ_WRP;
+    axc->cmdq_rdp =3D XDMA_AST2600_BMC_CMDQ_RDP;
+    axc->intr_ctrl =3D XDMA_AST2600_IRQ_CTRL;
+    axc->intr_ctrl_mask =3D XDMA_AST2600_IRQ_CTRL_W_MASK;
+    axc->intr_status =3D XDMA_AST2600_IRQ_STATUS;
+    axc->intr_complete =3D XDMA_AST2600_IRQ_STATUS_US_COMP |
+        XDMA_AST2600_IRQ_STATUS_DS_COMP;
+}
+
+static const TypeInfo aspeed_2600_xdma_info =3D {
+    .name =3D TYPE_ASPEED_2600_XDMA,
+    .parent =3D TYPE_ASPEED_XDMA,
+    .class_init =3D aspeed_2600_xdma_class_init,
+};
+
+static void aspeed_2500_xdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedXDMAClass *axc =3D ASPEED_XDMA_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 XDMA Controller";
+
+    axc->cmdq_endp =3D XDMA_BMC_CMDQ_ENDP;
+    axc->cmdq_wrp =3D XDMA_BMC_CMDQ_WRP;
+    axc->cmdq_rdp =3D XDMA_BMC_CMDQ_RDP;
+    axc->intr_ctrl =3D XDMA_IRQ_ENG_CTRL;
+    axc->intr_ctrl_mask =3D XDMA_IRQ_ENG_CTRL_W_MASK;
+    axc->intr_status =3D XDMA_IRQ_ENG_STAT;
+    axc->intr_complete =3D XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT=
_DS_COMP;
+};
+
+static const TypeInfo aspeed_2500_xdma_info =3D {
+    .name =3D TYPE_ASPEED_2500_XDMA,
+    .parent =3D TYPE_ASPEED_XDMA,
+    .class_init =3D aspeed_2500_xdma_class_init,
+};
+
+static void aspeed_2400_xdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedXDMAClass *axc =3D ASPEED_XDMA_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 XDMA Controller";
+
+    axc->cmdq_endp =3D XDMA_BMC_CMDQ_ENDP;
+    axc->cmdq_wrp =3D XDMA_BMC_CMDQ_WRP;
+    axc->cmdq_rdp =3D XDMA_BMC_CMDQ_RDP;
+    axc->intr_ctrl =3D XDMA_IRQ_ENG_CTRL;
+    axc->intr_ctrl_mask =3D XDMA_IRQ_ENG_CTRL_W_MASK;
+    axc->intr_status =3D XDMA_IRQ_ENG_STAT;
+    axc->intr_complete =3D XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT=
_DS_COMP;
+};
+
+static const TypeInfo aspeed_2400_xdma_info =3D {
+    .name =3D TYPE_ASPEED_2400_XDMA,
+    .parent =3D TYPE_ASPEED_XDMA,
+    .class_init =3D aspeed_2400_xdma_class_init,
+};
+
 static void aspeed_xdma_class_init(ObjectClass *classp, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(classp);
@@ -158,10 +231,15 @@ static const TypeInfo aspeed_xdma_info =3D {
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(AspeedXDMAState),
     .class_init    =3D aspeed_xdma_class_init,
+    .class_size    =3D sizeof(AspeedXDMAClass),
+    .abstract      =3D true,
 };
=20
 static void aspeed_xdma_register_type(void)
 {
     type_register_static(&aspeed_xdma_info);
+    type_register_static(&aspeed_2400_xdma_info);
+    type_register_static(&aspeed_2500_xdma_info);
+    type_register_static(&aspeed_2600_xdma_info);
 }
 type_init(aspeed_xdma_register_type);
--=20
2.26.3


