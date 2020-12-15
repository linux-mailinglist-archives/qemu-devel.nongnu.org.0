Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2A2DB2CE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:42:16 +0100 (CET)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEL1-0004dq-Hp
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kpEJh-000472-FD; Tue, 15 Dec 2020 12:40:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kpEJc-0007zD-Oj; Tue, 15 Dec 2020 12:40:53 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BFHWGrW095168; Tue, 15 Dec 2020 12:40:32 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ewttk83w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 12:40:32 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BFHWbOx005268;
 Tue, 15 Dec 2020 17:40:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 35cng83g6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 17:40:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BFHeS9g16974108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 17:40:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33D9C52052;
 Tue, 15 Dec 2020 17:40:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id EDE9F5204F;
 Tue, 15 Dec 2020 17:40:27 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2EA4B22010B;
 Tue, 15 Dec 2020 18:40:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] spapr/xive: Make spapr_xive_pic_print_info() static
Date: Tue, 15 Dec 2020 18:40:25 +0100
Message-Id: <20201215174025.2636824-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_12:2020-12-15,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1034 priorityscore=1501 mlxlogscore=855 bulkscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150114
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_SOFTFAIL=0.665,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr_xive.h | 2 --
 hw/intc/spapr_xive.c        | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 26c8d90d7196..b282960ad90d 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -66,8 +66,6 @@ typedef struct SpaprXiveClass {
  */
 #define SPAPR_XIVE_BLOCK_ID 0x0
=20
-void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
-
 struct SpaprMachineState;
 void spapr_xive_hcall_init(struct SpaprMachineState *spapr);
 void spapr_xive_mmio_set_enabled(SpaprXive *xive, bool enable);
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index caedd312d745..801bc1934160 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -156,7 +156,7 @@ static void spapr_xive_end_pic_print_info(SpaprXive *=
xive, XiveEND *end,
 #define spapr_xive_in_kernel(xive) \
     (kvm_irqchip_in_kernel() && (xive)->fd !=3D -1)
=20
-void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
+static void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
 {
     XiveSource *xsrc =3D &xive->source;
     int i;
--=20
2.26.2


