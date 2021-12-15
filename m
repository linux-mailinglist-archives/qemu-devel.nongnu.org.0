Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5D47611A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:52:38 +0100 (CET)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZOH-0006lE-OD
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiv-0005od-HL; Wed, 15 Dec 2021 12:05:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXik-0004wW-VO; Wed, 15 Dec 2021 12:05:42 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaop006132; 
 Wed, 15 Dec 2021 17:05:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cykt6rye6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGfusF007501;
 Wed, 15 Dec 2021 17:05:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cykt6rycp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2kBQ004398;
 Wed, 15 Dec 2021 17:05:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH529942926370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 092B3AE053;
 Wed, 15 Dec 2021 17:05:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD4FFAE045;
 Wed, 15 Dec 2021 17:05:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:01 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 02FF1220247;
 Wed, 15 Dec 2021 18:05:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 095/102] ppc/pnv: Introduce a num_pecs class attribute for PHB4
 PEC devices
Date: Wed, 15 Dec 2021 18:03:50 +0100
Message-Id: <20211215170357.321643-83-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QULnBAzWKbqxrt4DNHYmAyYrcvPj-4u0
X-Proofpoint-GUID: y-7p_2K06n5jCmKsUjXNx8lA82wix1z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 clxscore=1034 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER9 processor comes with 3 PHB4 PEC (PCI Express Controller) and
each PEC can have several PHBs :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

A num_pecs class attribute represents better the logic units of the
POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
This will ease adding support for user created devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-8-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h |  2 ++
 hw/ppc/pnv.c         | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index aa08d79d24de..c781525277db 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -53,6 +53,7 @@ struct PnvChip {
     PnvCore      **cores;
=20
     uint32_t     num_phbs;
+    uint32_t     num_pecs;
=20
     MemoryRegion xscom_mmio;
     MemoryRegion xscom;
@@ -136,6 +137,7 @@ struct PnvChipClass {
     uint64_t     chip_cfam_id;
     uint64_t     cores_mask;
     uint32_t     num_phbs;
+    uint32_t     num_pecs;
=20
     DeviceRealize parent_realize;
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e75fc999ee11..2fc2b0dff7a3 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -667,7 +667,7 @@ static void pnv_chip_power9_pic_print_info(PnvChip *c=
hip, Monitor *mon)
     pnv_xive_pic_print_info(&chip9->xive, mon);
     pnv_psi_pic_print_info(&chip9->psi, mon);
=20
-    for (i =3D 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    for (i =3D 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
         for (j =3D 0; j < pec->num_stacks; j++) {
             pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
@@ -1344,15 +1344,13 @@ static void pnv_chip_power9_instance_init(Object =
*obj)
=20
     object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER=
);
=20
-    for (i =3D 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    /* Number of PECs is the chip default */
+    chip->num_pecs =3D pcc->num_pecs;
+
+    for (i =3D 0; i < chip->num_pecs; i++) {
         object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
                                 TYPE_PNV_PHB4_PEC);
     }
-
-    /*
-     * Number of PHBs is the chip default
-     */
-    chip->num_phbs =3D pcc->num_phbs;
 }
=20
 static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
@@ -1388,7 +1386,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *ch=
ip, Error **errp)
     int i, j;
     int phb_id =3D 0;
=20
-    for (i =3D 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    for (i =3D 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
         PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
         uint32_t pec_nest_base;
@@ -1416,8 +1414,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *ch=
ip, Error **errp)
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr)=
;
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
=20
-        for (j =3D 0; j < pec->num_stacks && phb_id < chip->num_phbs;
-             j++, phb_id++) {
+        for (j =3D 0; j < pec->num_stacks; j++, phb_id++) {
             PnvPhb4PecStack *stack =3D &pec->stacks[j];
             Object *obj =3D OBJECT(&stack->phb);
=20
@@ -1573,7 +1570,7 @@ static void pnv_chip_power9_class_init(ObjectClass =
*klass, void *data)
     k->xscom_core_base =3D pnv_chip_power9_xscom_core_base;
     k->xscom_pcba =3D pnv_chip_power9_xscom_pcba;
     dc->desc =3D "PowerNV Chip POWER9";
-    k->num_phbs =3D 6;
+    k->num_pecs =3D PNV9_CHIP_MAX_PEC;
=20
     device_class_set_parent_realize(dc, pnv_chip_power9_realize,
                                     &k->parent_realize);
--=20
2.31.1


