Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776A47613C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:56:51 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZSM-0001Iv-7z
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiy-0005rC-3L; Wed, 15 Dec 2021 12:05:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXim-0004y3-V9; Wed, 15 Dec 2021 12:05:43 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfZWr026298; 
 Wed, 15 Dec 2021 17:05:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrww9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGfds7026737;
 Wed, 15 Dec 2021 17:05:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrww8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2iVk004364;
 Wed, 15 Dec 2021 17:05:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH54qK38928656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66085A404D;
 Wed, 15 Dec 2021 17:05:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241DBA4053;
 Wed, 15 Dec 2021 17:05:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:04 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 47F71220295;
 Wed, 15 Dec 2021 18:05:03 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 098/102] ppc/pnv: Introduce a num_stack class attribute
Date: Wed, 15 Dec 2021 18:03:53 +0100
Message-Id: <20211215170357.321643-86-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a6xfCjetujqyoiWuga6C_kM5R3-W7FoK
X-Proofpoint-GUID: Ggy-HEQKwr1NZk2zgrgP7M_5gl44A_gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1034 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each PEC device of the POWER9 chip has a predefined number of stacks,
equivalent of a root port complex:

  PEC0 -> 1 stack
  PEC1 -> 2 stacks
  PEC2 -> 3 stacks

Introduce a class attribute to hold these values and remove the
"num-stacks" property.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-11-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  1 +
 hw/pci-host/pnv_phb4_pec.c     | 12 +++++++++++-
 hw/ppc/pnv.c                   |  7 -------
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 8a585c9a42f7..60de3031a622 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -223,6 +223,7 @@ struct PnvPhb4PecClass {
     int stk_compat_size;
     uint64_t version;
     uint64_t device_id;
+    const uint32_t *num_stacks;
 };
=20
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 4b32b5ae6ed4..293909b5cb90 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -377,6 +377,7 @@ static void pnv_pec_instance_init(Object *obj)
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(dev);
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     char name[64];
     int i;
=20
@@ -387,6 +388,8 @@ static void pnv_pec_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
=20
+    pec->num_stacks =3D pecc->num_stacks[pec->index];
+
     /* Create stacks */
     for (i =3D 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack =3D &pec->stacks[i];
@@ -465,7 +468,6 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, v=
oid *fdt,
=20
 static Property pnv_pec_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
-        DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0)=
,
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
                          PnvChip *),
@@ -484,6 +486,13 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecSt=
ate *pec)
     return PNV9_XSCOM_PEC_NEST_BASE + 0x400 * pec->index;
 }
=20
+/*
+ * PEC0 -> 1 stack
+ * PEC1 -> 2 stacks
+ * PEC2 -> 3 stacks
+ */
+static const uint32_t pnv_pec_num_stacks[] =3D { 1, 2, 3 };
+
 static void pnv_pec_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -508,6 +517,7 @@ static void pnv_pec_class_init(ObjectClass *klass, vo=
id *data)
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB4_VERSION;
     pecc->device_id =3D PNV_PHB4_DEVICE_ID;
+    pecc->num_stacks =3D pnv_pec_num_stacks;
 }
=20
 static const TypeInfo pnv_pec_type_info =3D {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ceee63c4d01e..3957a8c3b1ae 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1393,13 +1393,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *c=
hip, Error **errp)
         uint32_t pec_pci_base;
=20
         object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
-        /*
-         * PEC0 -> 1 stack
-         * PEC1 -> 2 stacks
-         * PEC2 -> 3 stacks
-         */
-        object_property_set_int(OBJECT(pec), "num-stacks", i + 1,
-                                &error_fatal);
         object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
--=20
2.31.1


