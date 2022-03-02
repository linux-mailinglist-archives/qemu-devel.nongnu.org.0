Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CC4CA33B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:18:09 +0100 (CET)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMzg-0007CB-Ax
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:18:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqK-0008QM-Cn; Wed, 02 Mar 2022 06:08:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqG-0001hR-SE; Wed, 02 Mar 2022 06:08:28 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIMFS022719; 
 Wed, 2 Mar 2022 11:08:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0x82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:14 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AovjQ007473;
 Wed, 2 Mar 2022 11:08:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0x5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2ba7011461;
 Wed, 2 Mar 2022 11:08:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjpg46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B89Ob29163834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C67E42042;
 Wed,  2 Mar 2022 11:08:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F323F4203F;
 Wed,  2 Mar 2022 11:08:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:08 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 52B482201C1;
 Wed,  2 Mar 2022 12:08:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/87] ppc/pnv: fix default PHB4 QOM hierarchy
Date: Wed,  2 Mar 2022 12:06:38 +0100
Message-Id: <20220302110803.849505-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pCAJgZxv5-Z5DDJwHGeTLEM7wqRcS69p
X-Proofpoint-ORIG-GUID: C7h2thapKi58c7noHZuFXb412T35QxPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=351 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Commit 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
changed phb4_pec code to create the default PHB4 objects in
pnv_pec_default_phb_realize(). In this process the stacks[] PEC array was
removed and each PHB4 object is tied together with its PEC via the
phb->pec pointer.

This change also broke the previous QOM hierarchy - the PHB4 objects are
being created and not being parented to their respective chips. This can
be verified by 'info pic' in a powernv9 domain with default settings.
pnv_chip_power9_pic_print_info() will fail to find the PHBs because
object_child_foreach_recursive() won't find any.

The solution is to set the parent chip and the parent bus, in the same
way done for user created PHB4 devices, for all PHB4 devices.

Fixes: 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220218202804.413157-1-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e91249ef641d..846e7d0c3e24 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1568,40 +1568,36 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip =
*chip, PnvPHB4 *phb,
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb =3D PNV_PHB4(dev);
+    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
     PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc =3D &phb->xsrc;
+    BusState *s;
     Error *local_err =3D NULL;
     int nr_irqs;
     char name[32];
=20
-    /* User created PHB */
-    if (!phb->pec) {
-        PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
-        PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
-        BusState *s;
-
-        if (!chip) {
-            error_setg(errp, "invalid chip id: %d", phb->chip_id);
-            return;
-        }
+    if (!chip) {
+        error_setg(errp, "invalid chip id: %d", phb->chip_id);
+        return;
+    }
=20
+    /* User created PHBs need to be assigned to a PEC */
+    if (!phb->pec) {
         phb->pec =3D pnv_phb4_get_pec(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
+    }
=20
-        /*
-         * Reparent user created devices to the chip to build
-         * correctly the device tree.
-         */
-        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+    /* Reparent the PHB to the chip to build the device tree */
+    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
=20
-        s =3D qdev_get_parent_bus(DEVICE(chip));
-        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    s =3D qdev_get_parent_bus(DEVICE(chip));
+    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
     }
=20
     /* Set the "big_phb" flag */
--=20
2.34.1


