Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4C4E4D7E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:41:34 +0100 (CET)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvcb-00085S-Gc
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:41:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQe-0008V0-MI; Wed, 23 Mar 2022 03:29:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14982
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQc-0001Mq-QP; Wed, 23 Mar 2022 03:29:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N5fvc2002861; 
 Wed, 23 Mar 2022 07:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywmn1nd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:54 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N7Sdei012983;
 Wed, 23 Mar 2022 07:28:54 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywmn1ncu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N79DeO032479;
 Wed, 23 Mar 2022 07:28:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ew6t8psx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22N7SsS341681402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:28:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61B58A405C;
 Wed, 23 Mar 2022 07:28:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259F2A4054;
 Wed, 23 Mar 2022 07:28:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:28:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7800D220294;
 Wed, 23 Mar 2022 08:28:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/5] ppc/pnv: Remove PnvOCC::psi link
Date: Wed, 23 Mar 2022 08:28:44 +0100
Message-Id: <20220323072846.1780212-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
References: <20220323072846.1780212-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -9u138wG7_KEGGMFx1Bf87xjbDp5LRQF
X-Proofpoint-GUID: Z7z2_zOsWXyeCBYTvN29DNw87kWLSSz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1034 mlxscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=726 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Use an anonymous output GPIO line to connect the OCC device with the
PSIHB device and raise the appropriate PSI IRQ line depending on the
processor model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_occ.h |  7 ++-----
 hw/ppc/pnv.c             | 12 ++++++------
 hw/ppc/pnv_occ.c         | 16 ++++------------
 3 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index f982ba002481..90a81dae2b8d 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV Emulation of a few OCC related registers
  *
- * Copyright (c) 2015-2017, IBM Corporation.
+ * Copyright (c) 2015-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -20,7 +20,6 @@
 #ifndef PPC_PNV_OCC_H
 #define PPC_PNV_OCC_H
=20
-#include "hw/ppc/pnv_psi.h"
 #include "qom/object.h"
=20
 #define TYPE_PNV_OCC "pnv-occ"
@@ -44,19 +43,17 @@ struct PnvOCC {
     /* OCC Misc interrupt */
     uint64_t occmisc;
=20
-    PnvPsi *psi;
+    qemu_irq psi_irq;
=20
     MemoryRegion xscom_regs;
     MemoryRegion sram_regs;
 };
=20
-
 struct PnvOCCClass {
     DeviceClass parent_class;
=20
     int xscom_size;
     const MemoryRegionOps *xscom_ops;
-    int psi_irq;
 };
=20
 #define PNV_OCC_SENSOR_DATA_BLOCK_BASE(i)                               =
\
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8082462bdfb1..0e3cff8aa47b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1254,12 +1254,12 @@ static void pnv_chip_power8_realize(DeviceState *=
dev, Error **errp)
     }
=20
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip8->occ), "psi", OBJECT(&chip8->=
psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip8->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV_XSCOM_OCC_BASE, &chip8->occ.xscom_=
regs);
+    qdev_connect_gpio_out(DEVICE(&chip8->occ), 0,
+                          qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IR=
Q_OCC));
=20
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(), PNV_OCC_SENSOR_BASE=
(chip),
@@ -1529,12 +1529,12 @@ static void pnv_chip_power9_realize(DeviceState *=
dev, Error **errp)
                                             (uint64_t) PNV9_LPCM_BASE(ch=
ip));
=20
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip9->occ), "psi", OBJECT(&chip9->=
psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip9->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV9_XSCOM_OCC_BASE, &chip9->occ.xscom=
_regs);
+    qdev_connect_gpio_out(DEVICE(&chip9->occ), 0, qdev_get_gpio_in(
+                              DEVICE(&chip9->psi), PSIHB9_IRQ_OCC));
=20
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(), PNV9_OCC_SENSOR_BAS=
E(chip),
@@ -1732,13 +1732,13 @@ static void pnv_chip_power10_realize(DeviceState =
*dev, Error **errp)
                                             (uint64_t) PNV10_LPCM_BASE(c=
hip));
=20
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip10->occ), "psi", OBJECT(&chip10=
->psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip10->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
                             &chip10->occ.xscom_regs);
+    qdev_connect_gpio_out(DEVICE(&chip10->occ), 0, qdev_get_gpio_in(
+                              DEVICE(&chip10->psi), PSIHB9_IRQ_OCC));
=20
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(),
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 4ed66f5e1fcc..9fa6d91d3122 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
 #include "hw/ppc/pnv_xscom.h"
@@ -51,13 +52,12 @@
 static void pnv_occ_set_misc(PnvOCC *occ, uint64_t val)
 {
     bool irq_state;
-    PnvOCCClass *poc =3D PNV_OCC_GET_CLASS(occ);
=20
     val &=3D 0xffff000000000000ull;
=20
     occ->occmisc =3D val;
     irq_state =3D !!(val >> 63);
-    pnv_psi_irq_set(occ->psi, poc->psi_irq, irq_state);
+    qemu_set_irq(occ->psi_irq, irq_state);
 }
=20
 static uint64_t pnv_occ_power8_xscom_read(void *opaque, hwaddr addr,
@@ -168,7 +168,6 @@ static void pnv_occ_power8_class_init(ObjectClass *kl=
ass, void *data)
=20
     poc->xscom_size =3D PNV_XSCOM_OCC_SIZE;
     poc->xscom_ops =3D &pnv_occ_power8_xscom_ops;
-    poc->psi_irq =3D PSIHB_IRQ_OCC;
 }
=20
 static const TypeInfo pnv_occ_power8_type_info =3D {
@@ -241,7 +240,6 @@ static void pnv_occ_power9_class_init(ObjectClass *kl=
ass, void *data)
     dc->desc =3D "PowerNV OCC Controller (POWER9)";
     poc->xscom_size =3D PNV9_XSCOM_OCC_SIZE;
     poc->xscom_ops =3D &pnv_occ_power9_xscom_ops;
-    poc->psi_irq =3D PSIHB9_IRQ_OCC;
 }
=20
 static const TypeInfo pnv_occ_power9_type_info =3D {
@@ -269,8 +267,6 @@ static void pnv_occ_realize(DeviceState *dev, Error *=
*errp)
     PnvOCC *occ =3D PNV_OCC(dev);
     PnvOCCClass *poc =3D PNV_OCC_GET_CLASS(occ);
=20
-    assert(occ->psi);
-
     occ->occmisc =3D 0;
=20
     /* XScom region for OCC registers */
@@ -281,12 +277,9 @@ static void pnv_occ_realize(DeviceState *dev, Error =
**errp)
     memory_region_init_io(&occ->sram_regs, OBJECT(dev), &pnv_occ_sram_op=
s,
                           occ, "occ-common-area",
                           PNV_OCC_SENSOR_DATA_BLOCK_SIZE);
-}
=20
-static Property pnv_occ_properties[] =3D {
-    DEFINE_PROP_LINK("psi", PnvOCC, psi, TYPE_PNV_PSI, PnvPsi *),
-    DEFINE_PROP_END_OF_LIST(),
-};
+    qdev_init_gpio_out(DEVICE(dev), &occ->psi_irq, 1);
+}
=20
 static void pnv_occ_class_init(ObjectClass *klass, void *data)
 {
@@ -294,7 +287,6 @@ static void pnv_occ_class_init(ObjectClass *klass, vo=
id *data)
=20
     dc->realize =3D pnv_occ_realize;
     dc->desc =3D "PowerNV OCC Controller";
-    device_class_set_props(dc, pnv_occ_properties);
     dc->user_creatable =3D false;
 }
=20
--=20
2.34.1


