Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A24B4D85FA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:33:19 +0100 (CET)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkp1-0007kK-V0
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:33:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTkmM-00069x-Cy; Mon, 14 Mar 2022 09:30:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTkmK-0000XV-1u; Mon, 14 Mar 2022 09:30:30 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ED73Qa032179; 
 Mon, 14 Mar 2022 13:30:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6s21t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 13:30:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ED7KvS009907;
 Mon, 14 Mar 2022 13:30:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6ryvv-67
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 13:30:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ECvOfQ013741;
 Mon, 14 Mar 2022 13:05:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3erk58kgmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 13:05:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22ED5JgC44433758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 13:05:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E064CA40B7;
 Mon, 14 Mar 2022 13:05:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A622FA409B;
 Mon, 14 Mar 2022 13:05:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Mar 2022 13:05:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C0114220150;
 Mon, 14 Mar 2022 14:05:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] ppc/pnv: Remove user-created PHB{3,4,5} devices
Date: Mon, 14 Mar 2022 14:05:14 +0100
Message-Id: <20220314130514.529931-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qnuy0DlglRaFulZ6IfW6fHd3HOQZn09P
X-Proofpoint-ORIG-GUID: 4zBcwxRdSzi91xAB1BMJ9v7n1qhliOsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_08,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1034 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140083
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

On a real system with POWER{8,9,10} processors, PHBs are sub-units of
the processor, they can be deactivated by firmware but not plugged in
or out like a PCI adapter on a slot. Nevertheless, having user-created
PHBs in QEMU seemed to be a good idea for testing purposes :

 1. having a limited set of PHBs speedups boot time.
 2. it is useful to be able to mimic a partially broken topology you
    some time have to deal with during bring-up.

PowerNV is also used for distro install tests and having libvirt
support eases these tasks. libvirt prefers to run the machine with
-nodefaults to be sure not to drag unexpected devices which would need
to be defined in the domain file without being specified on the QEMU
command line. For this reason :

 3. -nodefaults should not include default PHBs

User-created PHB{3,4,5} devices satisfied all these needs but reality
proves to be a bit more complex, internally when modeling such
devices, and externally when dealing with the user interface.

Req 1. and 2. can be simply addressed differently with a machine option:
"phb-mask=3D<uint>", which QEMU would use to enable/disable PHB device
nodes when creating the device tree.

For Req 3., we need to make sure we are taking the right approach. It
seems that we should expose a new type of user-created PHB device, a
generic virtualized one, that libvirt would use and not one depending
on the processor revision. This needs more thinking.

For now, remove user-created PHB{3,4,5} devices. All the cleanups we
did are not lost and they will be useful for the next steps.

Fixes: 5bc67b052b51 ("ppc/pnv: Introduce user creatable pnv-phb4 devices"=
)
Fixes: 1f6a88fffc75 ("ppc/pnv: Introduce support for user created PHB3 de=
vices")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h       |  1 -
 hw/pci-host/pnv_phb3.c     | 33 ++------------------
 hw/pci-host/pnv_phb4.c     | 62 ++------------------------------------
 hw/pci-host/pnv_phb4_pec.c |  7 ++---
 hw/ppc/pnv.c               | 25 +--------------
 5 files changed, 10 insertions(+), 118 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 1e34ddd502d8..86cb7d7f971b 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -190,7 +190,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
=20
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
-void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
=20
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index aafd46b635e8..ac801ac83582 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -994,30 +994,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error=
 **errp)
     PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
     int i;
=20
-    /* User created devices */
-    if (!phb->chip) {
-        Error *local_err =3D NULL;
-        BusState *s;
-
-        phb->chip =3D pnv_get_chip(pnv, phb->chip_id);
-        if (!phb->chip) {
-            error_setg(errp, "invalid chip id: %d", phb->chip_id);
-            return;
-        }
-
-        /*
-         * Reparent user created devices to the chip to build
-         * correctly the device tree.
-         */
-        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
-
-        s =3D qdev_get_parent_bus(DEVICE(phb->chip));
-        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
     if (phb->phb_id >=3D PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
         error_setg(errp, "invalid PHB index: %d", phb->phb_id);
         return;
@@ -1077,10 +1053,7 @@ static void pnv_phb3_realize(DeviceState *dev, Err=
or **errp)
=20
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
=20
-    if (defaults_enabled()) {
-        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                                 TYPE_PNV_PHB3_ROOT_PORT);
-    }
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PO=
RT);
 }
=20
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1131,7 +1104,7 @@ static void pnv_phb3_class_init(ObjectClass *klass,=
 void *data)
     dc->realize =3D pnv_phb3_realize;
     device_class_set_props(dc, pnv_phb3_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable =3D true;
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo pnv_phb3_type_info =3D {
@@ -1201,7 +1174,7 @@ static void pnv_phb3_root_port_class_init(ObjectCla=
ss *klass, void *data)
=20
     device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
                                     &rpc->parent_realize);
-    dc->user_creatable =3D true;
+    dc->user_creatable =3D false;
=20
     k->vendor_id =3D PCI_VENDOR_ID_IBM;
     k->device_id =3D 0x03dc;
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index d1a911f988b7..b30176209303 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1545,70 +1545,14 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE)=
;
 }
=20
-static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
-                                         Error **errp)
-{
-    Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
-    int chip_id =3D phb->chip_id;
-    int index =3D phb->phb_id;
-    int i, j;
-
-    for (i =3D 0; i < chip->num_pecs; i++) {
-        /*
-         * For each PEC, check the amount of phbs it supports
-         * and see if the given phb4 index matches an index.
-         */
-        PnvPhb4PecState *pec =3D &chip9->pecs[i];
-
-        for (j =3D 0; j < pec->num_phbs; j++) {
-            if (index =3D=3D pnv_phb4_pec_get_phb_id(pec, j)) {
-                return pec;
-            }
-        }
-    }
-
-    error_setg(errp,
-               "pnv-phb4 chip-id %d index %d didn't match any existing P=
EC",
-               chip_id, index);
-
-    return NULL;
-}
-
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb =3D PNV_PHB4(dev);
-    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
-    PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
     PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc =3D &phb->xsrc;
-    BusState *s;
-    Error *local_err =3D NULL;
     int nr_irqs;
     char name[32];
=20
-    if (!chip) {
-        error_setg(errp, "invalid chip id: %d", phb->chip_id);
-        return;
-    }
-
-    /* User created PHBs need to be assigned to a PEC */
-    if (!phb->pec) {
-        phb->pec =3D pnv_phb4_get_pec(chip, phb, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
-    /* Reparent the PHB to the chip to build the device tree */
-    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
-
-    s =3D qdev_get_parent_bus(DEVICE(chip));
-    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     /* Set the "big_phb" flag */
     phb->big_phb =3D phb->phb_id =3D=3D 0 || phb->phb_id =3D=3D 3;
=20
@@ -1766,7 +1710,7 @@ static void pnv_phb4_class_init(ObjectClass *klass,=
 void *data)
     dc->realize         =3D pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  =3D true;
+    dc->user_creatable  =3D false;
=20
     xfc->notify         =3D pnv_phb4_xive_notify;
 }
@@ -1864,7 +1808,7 @@ static void pnv_phb4_root_port_class_init(ObjectCla=
ss *klass, void *data)
     PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_CLASS(klass);
=20
     dc->desc     =3D "IBM PHB4 PCIE Root Port";
-    dc->user_creatable =3D true;
+    dc->user_creatable =3D false;
=20
     device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
                                     &rpc->parent_realize);
@@ -1894,7 +1838,7 @@ static void pnv_phb5_root_port_class_init(ObjectCla=
ss *klass, void *data)
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
     dc->desc     =3D "IBM PHB5 PCIE Root Port";
-    dc->user_creatable =3D true;
+    dc->user_creatable =3D false;
=20
     k->vendor_id =3D PCI_VENDOR_ID_IBM;
     k->device_id =3D PNV_PHB5_DEVICE_ID;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index a0dfa77c8432..6f1121a9489a 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -120,6 +120,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
     PnvPHB4 *phb =3D PNV_PHB4(qdev_new(pecc->phb_type));
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack_no);
=20
+    object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
     object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
                              &error_abort);
     object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
@@ -150,10 +151,8 @@ static void pnv_pec_realize(DeviceState *dev, Error =
**errp)
     pec->num_phbs =3D pecc->num_phbs[pec->index];
=20
     /* Create PHBs if running with defaults */
-    if (defaults_enabled()) {
-        for (i =3D 0; i < pec->num_phbs; i++) {
-            pnv_pec_default_phb_realize(pec, i, errp);
-        }
+    for (i =3D 0; i < pec->num_phbs; i++) {
+        pnv_pec_default_phb_realize(pec, i, errp);
     }
=20
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e7cd8b62ca43..00f57c9678e6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1141,9 +1141,7 @@ static void pnv_chip_power8_instance_init(Object *o=
bj)
=20
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER=
);
=20
-    if (defaults_enabled()) {
-        chip8->num_phbs =3D pcc->num_phbs;
-    }
+    chip8->num_phbs =3D pcc->num_phbs;
=20
     for (i =3D 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV=
_PHB3);
@@ -1974,23 +1972,6 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int i=
rq)
     return NULL;
 }
=20
-void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
-{
-    Object *parent =3D OBJECT(chip);
-    g_autofree char *default_id =3D
-        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
-
-    if (obj->parent =3D=3D parent) {
-        return;
-    }
-
-    object_ref(obj);
-    object_unparent(obj);
-    object_property_add_child(
-        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
-    object_unref(obj);
-}
-
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
@@ -2130,8 +2111,6 @@ static void pnv_machine_power8_class_init(ObjectCla=
ss *oc, void *data)
=20
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
-
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
 }
=20
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
@@ -2150,8 +2129,6 @@ static void pnv_machine_power9_class_init(ObjectCla=
ss *oc, void *data)
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
     pmc->dt_power_mgt =3D pnv_dt_power_mgt;
-
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
 }
=20
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
--=20
2.34.1


