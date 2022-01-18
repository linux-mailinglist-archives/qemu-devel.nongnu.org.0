Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED5492899
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:41:20 +0100 (CET)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pfk-0000ZO-2C
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:41:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDm-0004Dp-SG; Tue, 18 Jan 2022 08:08:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDg-0000Fc-FA; Tue, 18 Jan 2022 08:08:21 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IAwbg6035624; 
 Tue, 18 Jan 2022 13:07:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnv93bgh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IClIjc003686;
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnv93bggj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID25mE007184;
 Tue, 18 Jan 2022 13:07:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3dknw9ba05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7m0d30343508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013AA42041;
 Tue, 18 Jan 2022 13:07:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B19F24204C;
 Tue, 18 Jan 2022 13:07:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0475B2201EB;
 Tue, 18 Jan 2022 14:07:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 23/31] ppc/pnv: remove stack pointer from PnvPHB4
Date: Tue, 18 Jan 2022 14:07:22 +0100
Message-Id: <20220118130730.1927983-24-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Rgpv0A5luD8r47-XzTKSVWJckQObt9Ti
X-Proofpoint-GUID: ZfVBg6xMMUGeLEQrXDTcJUpgCi-H5fkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This pointer was being used for two reasons: pnv_phb4_update_regions()
was using it to access the PHB and phb4_realize() was using it as a way
to determine if the PHB was user created.

We can determine if the PHB is user created via phb->pec, introduced in
the previous patch, and pnv_phb4_update_regions() is no longer using
stack->phb.

Remove the pointer from the PnvPHB4 device.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220114180719.52117-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  2 --
 hw/pci-host/pnv_phb4.c         | 15 ++++-----------
 hw/pci-host/pnv_phb4_pec.c     |  2 --
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 1d27e4c0cb74..a9059b72793d 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -151,8 +151,6 @@ struct PnvPHB4 {
     XiveSource xsrc;
     qemu_irq *qirqs;
=20
-    PnvPhb4PecStack *stack;
-
     QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
 };
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 4933fe57fe48..2efd34518e7f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1573,9 +1573,10 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
     char name[32];
=20
     /* User created PHB */
-    if (!phb->stack) {
+    if (!phb->pec) {
         PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
         PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
+        PnvPhb4PecStack *stack;
         PnvPhb4PecClass *pecc;
         BusState *s;
=20
@@ -1584,7 +1585,7 @@ static void pnv_phb4_realize(DeviceState *dev, Erro=
r **errp)
             return;
         }
=20
-        phb->stack =3D pnv_phb4_get_stack(chip, phb, &local_err);
+        stack =3D pnv_phb4_get_stack(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -1594,18 +1595,12 @@ static void pnv_phb4_realize(DeviceState *dev, Er=
ror **errp)
          * All other phb properties but 'pec' ad 'version' are
          * already set.
          */
-        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->=
pec),
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
                                  &error_abort);
         pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
=20
-        /*
-         * Assign stack->phb since pnv_phb4_update_regions() uses it
-         * to access the phb.
-         */
-        phb->stack->phb =3D phb;
-
         /*
          * Reparent user created devices to the chip to build
          * correctly the device tree.
@@ -1707,8 +1702,6 @@ static Property pnv_phb4_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
-        DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STAC=
K,
-                         PnvPhb4PecStack *),
         DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 22194b8de2ff..ed1d6441821a 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -293,8 +293,6 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4Pe=
cStack *stack,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "version", pecc->version=
,
                             &error_fatal);
-    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
-                             &error_abort);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
--=20
2.31.1


