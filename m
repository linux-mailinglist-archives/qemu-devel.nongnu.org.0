Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23D48C448
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:59:14 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dDd-0000Rr-IH
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cF0-0006Ya-9M; Wed, 12 Jan 2022 06:56:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEy-0007YH-ES; Wed, 12 Jan 2022 06:56:33 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBPFTG013867; 
 Wed, 12 Jan 2022 11:56:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhv9qvdn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:27 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBiA4T018476;
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhv9qvdkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBnGbb025517;
 Wed, 12 Jan 2022 11:56:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjas86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBlI9121627264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:47:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 347B1A4ED8;
 Wed, 12 Jan 2022 11:56:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5CF1A4EDF;
 Wed, 12 Jan 2022 11:56:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 374D42201C6;
 Wed, 12 Jan 2022 12:56:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 27/34] pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
Date: Wed, 12 Jan 2022 12:55:44 +0100
Message-Id: <20220112115551.987666-28-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Wv7OEHtkONWJRPuKEs5nQIjNp0q-tQh
X-Proofpoint-ORIG-GUID: xErXL4ylV268z5cmwnlbg2S-txMyIVXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1034 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The logic inside pnv_pec_phb_offset() will be useful in the next patch
to determine the stack that should contain a PHB4 device.

Move the function to pnv_phb4.c and make it public since there's no
pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
parameter and make the function return 'phb-id' directly. And rename it
to pnv_phb4_pec_get_phb_id() to be even clearer about the function
intent.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220110143346.455901-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  2 ++
 hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 88dc6abb1ca7..5ee996ebc650 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -15,6 +15,7 @@
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
=20
+typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
 typedef struct PnvChip PnvChip;
@@ -131,6 +132,7 @@ struct PnvPHB4 {
=20
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
+int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
=20
 /*
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 83dedc878a57..2223b985b269 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1069,6 +1069,23 @@ static const TypeInfo pnv_phb4_iommu_memory_region=
_info =3D {
     .class_init =3D pnv_phb4_iommu_memory_region_class_init,
 };
=20
+/*
+ * Return the index/phb-id of a PHB4 that belongs to a
+ * pec->stacks[stack_index] stack.
+ */
+int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
+{
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    int index =3D pec->index;
+    int offset =3D 0;
+
+    while (index--) {
+        offset +=3D pecc->num_stacks[index];
+    }
+
+    return offset + stack_index;
+}
+
 /*
  * MSI/MSIX memory region implementation.
  * The handler handles both MSI and MSIX.
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index f3e4fa0c8297..49360de8c858 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -374,19 +374,6 @@ static void pnv_pec_instance_init(Object *obj)
     }
 }
=20
-static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
-{
-    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
-    int index =3D pec->index;
-    int offset =3D 0;
-
-    while (index--) {
-        offset +=3D pecc->num_stacks[index];
-    }
-
-    return offset;
-}
-
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(dev);
@@ -405,7 +392,7 @@ static void pnv_pec_realize(DeviceState *dev, Error *=
*errp)
     for (i =3D 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack =3D &pec->stacks[i];
         Object *stk_obj =3D OBJECT(stack);
-        int phb_id =3D pnv_pec_phb_offset(pec) + i;
+        int phb_id =3D pnv_phb4_pec_get_phb_id(pec, i);
=20
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort)=
;
--=20
2.31.1


