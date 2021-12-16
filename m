Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BF477FEC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:12:55 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyze-0005pp-5E
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM4-0004Yt-U1; Thu, 16 Dec 2021 15:27:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13624
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM0-0007aY-Gn; Thu, 16 Dec 2021 15:27:55 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIK43o005070; 
 Thu, 16 Dec 2021 20:27:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye12hsmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:24 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGJVKHT008928;
 Thu, 16 Dec 2021 20:27:24 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye12hsm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCR78024540;
 Thu, 16 Dec 2021 20:27:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k9j4ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRJUK31916490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B6F9A405F;
 Thu, 16 Dec 2021 20:27:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49B8CA4060;
 Thu, 16 Dec 2021 20:27:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 936972201A0;
 Thu, 16 Dec 2021 21:27:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 094/101] ppc/pnv: Introduce a num_pecs class attribute for PHB4
 PEC devices
Date: Thu, 16 Dec 2021 21:26:07 +0100
Message-Id: <20211216202614.414266-95-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kJYa3v7_pVguICCO3Rm9O1CsquGZAXRN
X-Proofpoint-ORIG-GUID: p2nS8-bu59ush8aUMS8d9_U6HSRTPWTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
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


