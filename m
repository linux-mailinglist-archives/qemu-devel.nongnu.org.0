Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE474E4D83
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:43:54 +0100 (CET)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWver-0002wv-De
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:43:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQg-00008Q-C9; Wed, 23 Mar 2022 03:29:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQe-0001N6-By; Wed, 23 Mar 2022 03:29:14 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N7FHn9018828; 
 Wed, 23 Mar 2022 07:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eyu5ccegw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N702FJ011992;
 Wed, 23 Mar 2022 07:28:54 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eyu5cceg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N797S7015238;
 Wed, 23 Mar 2022 07:28:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3ew6t8psba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22N7SnKI43123102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:28:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E2B42041;
 Wed, 23 Mar 2022 07:28:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A2474203F;
 Wed, 23 Mar 2022 07:28:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:28:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DF875220121;
 Wed, 23 Mar 2022 08:28:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/5] ppc/pnv: Remove PnvLpcController::psi link
Date: Wed, 23 Mar 2022 08:28:43 +0100
Message-Id: <20220323072846.1780212-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
References: <20220323072846.1780212-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f_m-IPneak5zFTEklUjDOd8E2ysMGlDU
X-Proofpoint-ORIG-GUID: LVcAHL2q6CdH4GFI0DqO6sMCWcBkDLmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=752 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create an anonymous output GPIO line to connect the LPC device with
the PSIHB device and raise the appropriate PSI IRQ line depending on
the processor model.

A temporary __pnv_psi_irq_set() routine is introduced to handle the
transition. It will be removed when all devices raising PSI interrupts
are converted to use GPIOs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_lpc.h |  8 ++------
 hw/ppc/pnv.c             | 18 ++++++++++++------
 hw/ppc/pnv_lpc.c         | 19 ++++---------------
 hw/ppc/pnv_psi.c         | 10 ++++++++++
 4 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
index e893e763dd5f..8a8d1a3d4209 100644
--- a/include/hw/ppc/pnv_lpc.h
+++ b/include/hw/ppc/pnv_lpc.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV LPC controller
  *
- * Copyright (c) 2016, IBM Corporation.
+ * Copyright (c) 2016-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -20,7 +20,6 @@
 #ifndef PPC_PNV_LPC_H
 #define PPC_PNV_LPC_H
=20
-#include "hw/ppc/pnv_psi.h"
 #include "qom/object.h"
=20
 #define TYPE_PNV_LPC "pnv-lpc"
@@ -84,15 +83,12 @@ struct PnvLpcController {
     MemoryRegion xscom_regs;
=20
     /* PSI to generate interrupts */
-    PnvPsi *psi;
+    qemu_irq psi_irq;
 };
=20
-
 struct PnvLpcClass {
     DeviceClass parent_class;
=20
-    int psi_irq;
-
     DeviceRealize parent_realize;
 };
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 00f57c9678e6..8082462bdfb1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -615,24 +615,36 @@ static void pnv_reset(MachineState *machine)
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv8Chip *chip8 =3D PNV8_CHIP(chip);
+    qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IRQ_EXT=
ERNAL);
+
+    qdev_connect_gpio_out(DEVICE(&chip8->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip8->lpc, true, errp);
 }
=20
 static ISABus *pnv_chip_power8nvl_isa_create(PnvChip *chip, Error **errp=
)
 {
     Pnv8Chip *chip8 =3D PNV8_CHIP(chip);
+    qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IRQ_LPC=
_I2C);
+
+    qdev_connect_gpio_out(DEVICE(&chip8->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip8->lpc, false, errp);
 }
=20
 static ISABus *pnv_chip_power9_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
+    qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&chip9->psi), PSIHB9_IRQ_LP=
CHC);
+
+    qdev_connect_gpio_out(DEVICE(&chip9->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip9->lpc, false, errp);
 }
=20
 static ISABus *pnv_chip_power10_isa_create(PnvChip *chip, Error **errp)
 {
     Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
+    qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&chip10->psi), PSIHB9_IRQ_L=
PCHC);
+
+    qdev_connect_gpio_out(DEVICE(&chip10->lpc), 0, irq);
     return pnv_lpc_isa_create(&chip10->lpc, false, errp);
 }
=20
@@ -1223,8 +1235,6 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
                             &PNV_PSI(psi8)->xscom_regs);
=20
     /* Create LPC controller */
-    object_property_set_link(OBJECT(&chip8->lpc), "psi", OBJECT(&chip8->=
psi),
-                             &error_abort);
     qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
     pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_=
regs);
=20
@@ -1508,8 +1518,6 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
                             &PNV_PSI(psi9)->xscom_regs);
=20
     /* LPC */
-    object_property_set_link(OBJECT(&chip9->lpc), "psi", OBJECT(&chip9->=
psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip9->lpc), NULL, errp)) {
         return;
     }
@@ -1713,8 +1721,6 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
                             &PNV_PSI(&chip10->psi)->xscom_regs);
=20
     /* LPC */
-    object_property_set_link(OBJECT(&chip10->lpc), "psi",
-                             OBJECT(&chip10->psi), &error_abort);
     if (!qdev_realize(DEVICE(&chip10->lpc), NULL, errp)) {
         return;
     }
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index bcbca3db9743..ee890e7ab419 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -422,7 +422,6 @@ static const MemoryRegionOps pnv_lpc_mmio_ops =3D {
 static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
 {
     bool lpc_to_opb_irq =3D false;
-    PnvLpcClass *plc =3D PNV_LPC_GET_CLASS(lpc);
=20
     /* Update LPC controller to OPB line */
     if (lpc->lpc_hc_irqser_ctrl & LPC_HC_IRQSER_EN) {
@@ -445,7 +444,7 @@ static void pnv_lpc_eval_irqs(PnvLpcController *lpc)
     lpc->opb_irq_stat |=3D lpc->opb_irq_input & lpc->opb_irq_mask;
=20
     /* Reflect the interrupt */
-    pnv_psi_irq_set(lpc->psi, plc->psi_irq, lpc->opb_irq_stat !=3D 0);
+    qemu_set_irq(lpc->psi_irq, lpc->opb_irq_stat !=3D 0);
 }
=20
 static uint64_t lpc_hc_read(void *opaque, hwaddr addr, unsigned size)
@@ -637,8 +636,6 @@ static void pnv_lpc_power8_class_init(ObjectClass *kl=
ass, void *data)
=20
     xdc->dt_xscom =3D pnv_lpc_dt_xscom;
=20
-    plc->psi_irq =3D PSIHB_IRQ_LPC_I2C;
-
     device_class_set_parent_realize(dc, pnv_lpc_power8_realize,
                                     &plc->parent_realize);
 }
@@ -677,8 +674,6 @@ static void pnv_lpc_power9_class_init(ObjectClass *kl=
ass, void *data)
=20
     dc->desc =3D "PowerNV LPC Controller POWER9";
=20
-    plc->psi_irq =3D PSIHB9_IRQ_LPCHC;
-
     device_class_set_parent_realize(dc, pnv_lpc_power9_realize,
                                     &plc->parent_realize);
 }
@@ -706,8 +701,6 @@ static void pnv_lpc_realize(DeviceState *dev, Error *=
*errp)
 {
     PnvLpcController *lpc =3D PNV_LPC(dev);
=20
-    assert(lpc->psi);
-
     /* Reg inits */
     lpc->lpc_hc_fw_rd_acc_size =3D LPC_HC_FW_RD_4B;
=20
@@ -746,12 +739,9 @@ static void pnv_lpc_realize(DeviceState *dev, Error =
**errp)
                           "lpc-hc", LPC_HC_REGS_OPB_SIZE);
     memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
                                 &lpc->lpc_hc_regs);
-}
=20
-static Property pnv_lpc_properties[] =3D {
-    DEFINE_PROP_LINK("psi", PnvLpcController, psi, TYPE_PNV_PSI, PnvPsi =
*),
-    DEFINE_PROP_END_OF_LIST(),
-};
+    qdev_init_gpio_out(DEVICE(dev), &lpc->psi_irq, 1);
+}
=20
 static void pnv_lpc_class_init(ObjectClass *klass, void *data)
 {
@@ -759,7 +749,6 @@ static void pnv_lpc_class_init(ObjectClass *klass, vo=
id *data)
=20
     dc->realize =3D pnv_lpc_realize;
     dc->desc =3D "PowerNV LPC Controller";
-    device_class_set_props(dc, pnv_lpc_properties);
     dc->user_creatable =3D false;
 }
=20
@@ -803,7 +792,7 @@ static void pnv_lpc_isa_irq_handler_cpld(void *opaque=
, int n, int level)
     }
=20
     if (pnv->cpld_irqstate !=3D old_state) {
-        pnv_psi_irq_set(lpc->psi, PSIHB_IRQ_EXTERNAL, pnv->cpld_irqstate=
 !=3D 0);
+        qemu_set_irq(lpc->psi_irq, pnv->cpld_irqstate !=3D 0);
     }
 }
=20
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index c588a506c7cc..8b6298d4bd96 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -216,6 +216,12 @@ void pnv_psi_irq_set(PnvPsi *psi, int irq, bool stat=
e)
     PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
 }
=20
+static void __pnv_psi_irq_set(void *opaque, int irq, int state)
+{
+    PnvPsi *psi =3D (PnvPsi *) opaque;
+    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
+}
+
 static void pnv_psi_power8_irq_set(PnvPsi *psi, int irq, bool state)
 {
     uint32_t xivr_reg;
@@ -512,6 +518,8 @@ static void pnv_psi_power8_realize(DeviceState *dev, =
Error **errp)
         ics_set_irq_type(ics, i, true);
     }
=20
+    qdev_init_gpio_in(dev, __pnv_psi_irq_set, ics->nr_irqs);
+
     psi->qirqs =3D qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
=20
     /* XSCOM region for PSI registers */
@@ -873,6 +881,8 @@ static void pnv_psi_power9_realize(DeviceState *dev, =
Error **errp)
=20
     psi->qirqs =3D qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->n=
r_irqs);
=20
+    qdev_init_gpio_in(dev, __pnv_psi_irq_set, xsrc->nr_irqs);
+
     /* XSCOM region for PSI registers */
     pnv_xscom_region_init(&psi->xscom_regs, OBJECT(dev), &pnv_psi_p9_xsc=
om_ops,
                 psi, "xscom-psi", PNV9_XSCOM_PSIHB_SIZE);
--=20
2.34.1


