Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B248C4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:39:04 +0100 (CET)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dqB-0005yc-PP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFK-00073Z-4d; Wed, 12 Jan 2022 06:56:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64576
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFI-0007Yq-FC; Wed, 12 Jan 2022 06:56:53 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CApS5X009479; 
 Wed, 12 Jan 2022 11:56:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkut9xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:29 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CAwSoW013591;
 Wed, 12 Jan 2022 11:56:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkut9wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmRB7031229;
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3df289h2y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuOd230671174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 655325204E;
 Wed, 12 Jan 2022 11:56:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 237DA52057;
 Wed, 12 Jan 2022 11:56:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7451E22016C;
 Wed, 12 Jan 2022 12:56:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 32/34] ppc/pnv: Introduce user creatable pnv-phb4 devices
Date: Wed, 12 Jan 2022 12:55:49 +0100
Message-Id: <20220112115551.987666-33-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9hUVrHV9OatVjMZIwVU73RuVWk2EidvS
X-Proofpoint-GUID: BYlaUFpEySxv2mf7cbc_J43ujvjzDrxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This patch introduces pnv-phb4 user creatable devices that are created
in a similar manner as pnv-phb3 devices, allowing the user to interact
with the PHBs directly instead of creating PCI Express Controllers that
will create a certain amount of PHBs per controller index.

We accomplish this by doing the following:

- add a pnv_phb4_get_stack() helper to retrieve which stack an user
created phb4 would occupy;

- when dealing with an user created pnv-phb4 (detected by checking if
phb->stack is NULL at the start of phb4_realize()), retrieve its stack
and initialize its properties as done in stk_realize();

- use 'defaults_enabled()' in stk_realize() to avoid creating and
initializing a 'stack->phb' qdev that might be overwritten by an user
created pnv-phb4 device. This process is wrapped into a new helper
called pnv_pec_stk_default_phb_realize().

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220111131027.599784-5-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c     | 74 ++++++++++++++++++++++++++++++++++++--
 hw/pci-host/pnv_phb4_pec.c | 17 +++++++--
 hw/ppc/pnv.c               |  2 ++
 3 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e25adb88604c..ffa1453eee26 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1487,15 +1487,85 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE)=
;
 }
=20
+static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
+                                           Error **errp)
+{
+    Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
+    int chip_id =3D phb->chip_id;
+    int index =3D phb->phb_id;
+    int i, j;
+
+    for (i =3D 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of stacks it supports
+         * and see if the given phb4 index matches a stack.
+         */
+        PnvPhb4PecState *pec =3D &chip9->pecs[i];
+
+        for (j =3D 0; j < pec->num_stacks; j++) {
+            if (index =3D=3D pnv_phb4_pec_get_phb_id(pec, j)) {
+                return &pec->stacks[j];
+            }
+        }
+    }
+
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing P=
EC",
+               chip_id, index);
+
+    return NULL;
+}
+
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb =3D PNV_PHB4(dev);
     PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc =3D &phb->xsrc;
+    Error *local_err =3D NULL;
     int nr_irqs;
     char name[32];
=20
-    assert(phb->stack);
+    /* User created PHB */
+    if (!phb->stack) {
+        PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
+        PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
+        PnvPhb4PecClass *pecc;
+        BusState *s;
+
+        if (!chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+
+        phb->stack =3D pnv_phb4_get_stack(chip, phb, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /* All other phb properties but 'version' are already set */
+        pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
+        object_property_set_int(OBJECT(phb), "version", pecc->version,
+                                &error_fatal);
+
+        /*
+         * Assign stack->phb since pnv_phb4_update_regions() uses it
+         * to access the phb.
+         */
+        phb->stack->phb =3D phb;
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+
+        s =3D qdev_get_parent_bus(DEVICE(chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
=20
     /* Set the "big_phb" flag */
     phb->big_phb =3D phb->phb_id =3D=3D 0 || phb->phb_id =3D=3D 3;
@@ -1600,7 +1670,7 @@ static void pnv_phb4_class_init(ObjectClass *klass,=
 void *data)
     dc->realize         =3D pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  =3D false;
+    dc->user_creatable  =3D true;
=20
     xfc->notify         =3D pnv_phb4_xive_notify;
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d4c52a5d284c..7fe7f1f007dd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -19,6 +19,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
=20
 #include <libfdt.h>
=20
@@ -275,9 +276,9 @@ static const TypeInfo pnv_pec_type_info =3D {
     }
 };
=20
-static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
+static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
+                                            Error **errp)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec =3D stack->pec;
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
@@ -292,11 +293,23 @@ static void pnv_pec_stk_realize(DeviceState *dev, E=
rror **errp)
                             &error_fatal);
     object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
                              &error_abort);
+
     if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
     }
 }
=20
+static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
+{
+    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
+
+    if (!defaults_enabled()) {
+        return;
+    }
+
+    pnv_pec_stk_default_phb_realize(stack, errp);
+}
+
 static Property pnv_pec_stk_properties[] =3D {
         DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
         DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index fe7e67e73a3c..837146a2fbbe 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1960,6 +1960,8 @@ static void pnv_machine_power9_class_init(ObjectCla=
ss *oc, void *data)
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
     pmc->dt_power_mgt =3D pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
 }
=20
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
--=20
2.31.1


