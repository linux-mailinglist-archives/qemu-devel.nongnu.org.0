Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D34E4D61
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:33:29 +0100 (CET)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvUm-0005Wt-KC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:33:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQd-0008Rm-JM; Wed, 23 Mar 2022 03:29:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQc-0001Mh-29; Wed, 23 Mar 2022 03:29:11 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N60VZa012359; 
 Wed, 23 Mar 2022 07:28:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eysuedtdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N79ErA009820;
 Wed, 23 Mar 2022 07:28:53 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eysuedtdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N79UcT000553;
 Wed, 23 Mar 2022 07:28:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3ew6t8psx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22N7SmEB33751300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:28:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB8C311C052;
 Wed, 23 Mar 2022 07:28:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91FC311C04A;
 Wed, 23 Mar 2022 07:28:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:28:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A727D220121;
 Wed, 23 Mar 2022 08:28:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/5] ppc/pnv: Introduce GPIO lines to drive the PSIHB device
Date: Wed, 23 Mar 2022 08:28:41 +0100
Message-Id: <20220323072846.1780212-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6QMgpRUgdXqd0bKNSSUNgR6h2Rv_NfnJ
X-Proofpoint-ORIG-GUID: D3yitKZ53HcJ6vIR7H4davCG2mAjQCFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=656
 adultscore=0 clxscore=1034 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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

Hello,=20

The PSIHB OCC and LPC interrupts are driven by a complex framework
using Object links and class handlers. Simplify the whole with GPIO
lines.

Thanks,

C.

C=C3=A9dric Le Goater (5):
  ppc/pnv: Fix PSI IRQ definition
  ppc/pnv: Remove PnvLpcController::psi link
  ppc/pnv: Remove PnvOCC::psi link
  ppc/pnv: Remove PnvPsiClas::irq_set
  ppc/pnv: Remove usless checks in set_irq handlers

 include/hw/ppc/pnv_lpc.h |  8 ++------
 include/hw/ppc/pnv_occ.h |  7 ++-----
 include/hw/ppc/pnv_psi.h |  7 +------
 hw/ppc/pnv.c             | 30 ++++++++++++++++++------------
 hw/ppc/pnv_lpc.c         | 19 ++++---------------
 hw/ppc/pnv_occ.c         | 16 ++++------------
 hw/ppc/pnv_psi.c         | 36 +++++++++++-------------------------
 7 files changed, 42 insertions(+), 81 deletions(-)

--=20
2.34.1


