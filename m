Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82B4760F2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:43:37 +0100 (CET)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZFY-0002yG-Fu
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXio-0005k0-0h; Wed, 15 Dec 2021 12:05:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXii-0004vN-8o; Wed, 15 Dec 2021 12:05:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfdB4014350; 
 Wed, 15 Dec 2021 17:05:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfdp008s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:11 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGfgbx014740;
 Wed, 15 Dec 2021 17:05:11 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfdp007s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KKu024949;
 Wed, 15 Dec 2021 17:05:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH56Bx22151508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1280011C066;
 Wed, 15 Dec 2021 17:05:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEE1E11C069;
 Wed, 15 Dec 2021 17:05:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:05 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E425B220295;
 Wed, 15 Dec 2021 18:05:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 100/102] ppc/pnv: Remove "system-memory" property from PHB4 PEC
Date: Wed, 15 Dec 2021 18:03:55 +0100
Message-Id: <20211215170357.321643-88-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jjDSvA_lSZIRbJPULiZ_ARzYX9zW-sp2
X-Proofpoint-ORIG-GUID: Esesb_BM0-gGAOVCwH5NkqrCsfT9yGIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxlogscore=681 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This is not useful and will be in the way for support of user created
PHB4 devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-13-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 6 +-----
 hw/ppc/pnv.c               | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index a7dd4173d598..dfed2af0f7df 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -124,7 +124,7 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opa=
que, hwaddr addr,
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec =3D stack->pec;
-    MemoryRegion *sysmem =3D pec->system_memory;
+    MemoryRegion *sysmem =3D get_system_memory();
     uint64_t bar_en =3D stack->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
     char name[64];
@@ -394,8 +394,6 @@ static void pnv_pec_realize(DeviceState *dev, Error *=
*errp)
     char name[64];
     int i;
=20
-    assert(pec->system_memory);
-
     if (pec->index >=3D PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
         error_setg(errp, "invalid PEC index: %d", pec->index);
         return;
@@ -486,8 +484,6 @@ static Property pnv_pec_properties[] =3D {
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
                          PnvChip *),
-        DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory=
,
-                     TYPE_MEMORY_REGION, MemoryRegion *),
         DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 712200264be2..57a5180bccf2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1396,8 +1396,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *ch=
ip, Error **errp)
                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
                                  &error_fatal);
-        object_property_set_link(OBJECT(pec), "system-memory",
-                                 OBJECT(get_system_memory()), &error_abo=
rt);
         if (!qdev_realize(DEVICE(pec), NULL, errp)) {
             return;
         }
--=20
2.31.1


