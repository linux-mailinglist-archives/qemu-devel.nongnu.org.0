Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27594E4D79
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:38:14 +0100 (CET)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvZN-00031X-7S
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:38:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQb-0008Jw-Iw; Wed, 23 Mar 2022 03:29:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQZ-0001Mc-PV; Wed, 23 Mar 2022 03:29:09 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N6d1pr003143; 
 Wed, 23 Mar 2022 07:28:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eytj254nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N62QoK012457;
 Wed, 23 Mar 2022 07:28:56 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eytj254nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:56 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N7Rqro018252;
 Wed, 23 Mar 2022 07:28:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9eskv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22N7H8mc47251760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:17:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97BBEA404D;
 Wed, 23 Mar 2022 07:28:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B9D4A4040;
 Wed, 23 Mar 2022 07:28:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:28:51 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A3D82220294;
 Wed, 23 Mar 2022 08:28:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/5] ppc/pnv: Remove usless checks in set_irq handlers
Date: Wed, 23 Mar 2022 08:28:46 +0100
Message-Id: <20220323072846.1780212-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
References: <20220323072846.1780212-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -zwfVPpainPdVe8_bHXi9H1sUhf_K42s
X-Proofpoint-GUID: oF8qIDCljvn0yfrdgKcBmZiuYIJLSxy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1034 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=548 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_psi.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 950ecca40573..98045ed3d249 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -219,11 +219,6 @@ static void pnv_psi_power8_set_irq(void *opaque, int=
 irq, int state)
     uint32_t src;
     bool masked;
=20
-    if (irq > PSIHB_IRQ_EXTERNAL) {
-        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq)=
;
-        return;
-    }
-
     xivr_reg =3D xivr_regs[irq];
     stat_reg =3D stat_regs[irq];
=20
@@ -813,11 +808,6 @@ static void pnv_psi_power9_set_irq(void *opaque, int=
 irq, int state)
     PnvPsi *psi =3D opaque;
     uint64_t irq_method =3D psi->regs[PSIHB_REG(PSIHB9_INTERRUPT_CONTROL=
)];
=20
-    if (irq > PSIHB9_NUM_IRQS) {
-        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq)=
;
-        return;
-    }
-
     if (irq_method & PSIHB9_IRQ_METHOD) {
         qemu_log_mask(LOG_GUEST_ERROR, "PSI: LSI IRQ method no supported=
\n");
         return;
--=20
2.34.1


