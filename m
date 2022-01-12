Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A248C492
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:17:18 +0100 (CET)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dV7-0008V0-57
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFM-00074n-Vt; Wed, 12 Jan 2022 06:56:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4896
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFJ-0007ZK-6H; Wed, 12 Jan 2022 06:56:54 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAVGdc017179; 
 Wed, 12 Jan 2022 11:56:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhtkr6f6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:30 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBjZe3002843;
 Wed, 12 Jan 2022 11:56:30 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhtkr6f59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:29 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmEap022278;
 Wed, 12 Jan 2022 11:56:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3df28a91he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuPgA45875638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12622A4ED6;
 Wed, 12 Jan 2022 11:56:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB8B3A4ECC;
 Wed, 12 Jan 2022 11:56:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1D8712201C6;
 Wed, 12 Jan 2022 12:56:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 33/34] ppc/pnv: turn pnv_phb4_update_regions() into static
Date: Wed, 12 Jan 2022 12:55:50 +0100
Message-Id: <20220112115551.987666-34-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mFplMtzUh7zhQy-4oWcOaGAn5Pjk0nBJ
X-Proofpoint-ORIG-GUID: ntq-4IkywF37YbCwsqVfbrR6n_42lcPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=913
 clxscore=1034 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Its only callers are inside pnv_phb4.c.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220111131027.599784-6-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  1 -
 hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 82f054cf218a..4b7ce8a7239f 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -131,7 +131,6 @@ struct PnvPHB4 {
 };
=20
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
-void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ffa1453eee26..be29174f13c5 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,6 +868,32 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *op=
aque, hwaddr addr,
     return stack->nest_regs[reg];
 }
=20
+static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
+{
+    PnvPHB4 *phb =3D stack->phb;
+
+    /* Unmap first always */
+    if (memory_region_is_mapped(&phb->mr_regs)) {
+        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
+    }
+    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
+        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio)=
;
+    }
+
+    /* Map registers if enabled */
+    if (memory_region_is_mapped(&stack->phbbar)) {
+        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
+    }
+
+    /* Map ESB if enabled */
+    if (memory_region_is_mapped(&stack->intbar)) {
+        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mm=
io);
+    }
+
+    /* Check/update m32 */
+    pnv_phb4_check_all_mbt(phb);
+}
+
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec =3D stack->pec;
@@ -1796,32 +1822,6 @@ static void pnv_phb4_register_types(void)
=20
 type_init(pnv_phb4_register_types);
=20
-void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
-{
-    PnvPHB4 *phb =3D stack->phb;
-
-    /* Unmap first always */
-    if (memory_region_is_mapped(&phb->mr_regs)) {
-        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
-    }
-    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
-        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio)=
;
-    }
-
-    /* Map registers if enabled */
-    if (memory_region_is_mapped(&stack->phbbar)) {
-        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
-    }
-
-    /* Map ESB if enabled */
-    if (memory_region_is_mapped(&stack->intbar)) {
-        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mm=
io);
-    }
-
-    /* Check/update m32 */
-    pnv_phb4_check_all_mbt(phb);
-}
-
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
 {
     uint32_t offset =3D phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
--=20
2.31.1


