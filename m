Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13774908C0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:34:05 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RD3-0006Yw-2M
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:34:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7M-0003Cz-AM; Mon, 17 Jan 2022 07:28:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46212
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7K-0007wB-Pb; Mon, 17 Jan 2022 07:28:12 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HAw1vG008715; 
 Mon, 17 Jan 2022 12:28:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dn75vstq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HBebaE005310;
 Mon, 17 Jan 2022 12:28:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dn75vstpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HCCmiD020533;
 Mon, 17 Jan 2022 12:27:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw8u27f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:27:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HCRvga31195410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 12:27:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131DC4C058;
 Mon, 17 Jan 2022 12:27:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3AEF4C04A;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4224A22010B;
 Mon, 17 Jan 2022 13:27:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/3] ppc/pnv: Remove PHB4 version property
Date: Mon, 17 Jan 2022 13:27:53 +0100
Message-Id: <20220117122753.1655504-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220117122753.1655504-1-clg@kaod.org>
References: <20220117122753.1655504-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OBemvLndYGGg4dA2M6FMpiKNLIZnHr6a
X-Proofpoint-GUID: 0Sszhqe9ptS9ZAW55AeeGP9VAlDHsXBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_05,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0
 clxscore=1034 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170077
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.32,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and grab the PHB version from the PEC class directly when needed.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c     | 9 +--------
 hw/pci-host/pnv_phb4_pec.c | 3 ---
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index c688976caec9..a78add75b043 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -672,7 +672,7 @@ static uint64_t pnv_phb4_reg_read(void *opaque, hwadd=
r off, unsigned size)
=20
     switch (off) {
     case PHB_VERSION:
-        return phb->version;
+        return PNV_PHB4_PEC_GET_CLASS(phb->pec)->version;
=20
         /* Read-only */
     case PHB_PHB4_GEN_CAP:
@@ -1575,7 +1575,6 @@ static void pnv_phb4_realize(DeviceState *dev, Erro=
r **errp)
     if (!phb->pec) {
         PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
         PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
-        PnvPhb4PecClass *pecc;
         BusState *s;
=20
         if (!chip) {
@@ -1589,11 +1588,6 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
             return;
         }
=20
-        /* All other phb properties are already set */
-        pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->pec);
-        object_property_set_int(OBJECT(phb), "version", pecc->version,
-                                &error_fatal);
-
         /*
          * Reparent user created devices to the chip to build
          * correctly the device tree.
@@ -1688,7 +1682,6 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, =
uint32_t srcno)
 static Property pnv_phb4_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
-        DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
         DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index a3c4b4ef850c..40d89fda56e5 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -117,7 +117,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
                                         Error **errp)
 {
     PnvPHB4 *phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack_no);
=20
     object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
@@ -126,8 +125,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
                             &error_fatal);
     object_property_set_int(OBJECT(phb), "index", phb_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(phb), "version", pecc->version,
-                            &error_fatal);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
--=20
2.31.1


