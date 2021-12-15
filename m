Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20D476110
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:51:09 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZMq-0002sZ-Kl
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiy-0005rF-3a; Wed, 15 Dec 2021 12:05:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXim-0004xb-Cs; Wed, 15 Dec 2021 12:05:44 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaJv006131; 
 Wed, 15 Dec 2021 17:05:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cykt6ryfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFH0fWl004527;
 Wed, 15 Dec 2021 17:05:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cykt6rye7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH43K3000920;
 Wed, 15 Dec 2021 17:05:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k9760g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFH53Uo46661962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9644DAE05A;
 Wed, 15 Dec 2021 17:05:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E972AE056;
 Wed, 15 Dec 2021 17:05:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:03 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 77B27220247;
 Wed, 15 Dec 2021 18:05:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 097/102] ppc/pnv: Introduce a "chip" property under the PHB4
 model
Date: Wed, 15 Dec 2021 18:03:52 +0100
Message-Id: <20211215170357.321643-85-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t0HsogkHKRC_a59HYIHSbpP1toFgDhD0
X-Proofpoint-GUID: WT2Siw2s_J22csuYKe4E3DpSa_THQ3wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 clxscore=1034 mlxlogscore=574 adultscore=0 phishscore=0 impostorscore=0
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


