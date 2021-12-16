Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B177477FD1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:06:21 +0100 (CET)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxytH-0005XB-VL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLz-0004BK-Mc; Thu, 16 Dec 2021 15:27:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24420
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLx-0007Yz-BU; Thu, 16 Dec 2021 15:27:51 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJKnv4027397; 
 Thu, 16 Dec 2021 20:27:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyr22gbkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:25 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKDSR8015184;
 Thu, 16 Dec 2021 20:27:25 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyr22gbk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:25 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKC8NC028584;
 Thu, 16 Dec 2021 20:27:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3cy7sjt0g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRLY941812440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08BDE42049;
 Thu, 16 Dec 2021 20:27:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3A024204B;
 Thu, 16 Dec 2021 20:27:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E8D292201A0;
 Thu, 16 Dec 2021 21:27:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 096/101] ppc/pnv: Introduce a "chip" property under the PHB4
 model
Date: Thu, 16 Dec 2021 21:26:09 +0100
Message-Id: <20211216202614.414266-97-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pGtD1U70I5VuAXaRI2sG2rVkR1vWIvBa
X-Proofpoint-ORIG-GUID: mQcLBWisuUxakZCkmDV9VngspgUrrDUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1034 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=563 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And check the PEC index using the chip class.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-10-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 2 ++
 hw/pci-host/pnv_phb4_pec.c     | 7 +++++++
 hw/ppc/pnv.c                   | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index b2864233641e..8a585c9a42f7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -205,6 +205,8 @@ struct PnvPhb4PecState {
     #define PHB4_PEC_MAX_STACKS     3
     uint32_t num_stacks;
     PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
+
+    PnvChip *chip;
 };
=20
=20
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 9f722729ac50..4b32b5ae6ed4 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -382,6 +382,11 @@ static void pnv_pec_realize(DeviceState *dev, Error =
**errp)
=20
     assert(pec->system_memory);
=20
+    if (pec->index >=3D PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
+        error_setg(errp, "invalid PEC index: %d", pec->index);
+        return;
+    }
+
     /* Create stacks */
     for (i =3D 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack =3D &pec->stacks[i];
@@ -462,6 +467,8 @@ static Property pnv_pec_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
         DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0)=
,
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
+        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
+                         PnvChip *),
         DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory=
,
                      TYPE_MEMORY_REGION, MemoryRegion *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 78436a30ac0e..ceee63c4d01e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1402,6 +1402,8 @@ static void pnv_chip_power9_phb_realize(PnvChip *ch=
ip, Error **errp)
                                 &error_fatal);
         object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
                                 &error_fatal);
+        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
+                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "system-memory",
                                  OBJECT(get_system_memory()), &error_abo=
rt);
         if (!qdev_realize(DEVICE(pec), NULL, errp)) {
--=20
2.31.1


