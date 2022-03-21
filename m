Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3774E20D0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:59:09 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWC0S-0002kr-U6
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:59:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBnC-0002ov-Th; Mon, 21 Mar 2022 02:45:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWBn9-0006sM-MO; Mon, 21 Mar 2022 02:45:25 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L1JbPK007374; 
 Mon, 21 Mar 2022 06:45:05 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exfkrv62s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:05 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L6i826030227;
 Mon, 21 Mar 2022 06:45:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3ew6t8jr91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 06:45:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L6j0UJ30605814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 06:45:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A51854C040;
 Mon, 21 Mar 2022 06:45:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7409F4C046;
 Mon, 21 Mar 2022 06:45:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Mar 2022 06:45:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.112])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 84339220187;
 Mon, 21 Mar 2022 07:44:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 0/3] ppc queue
Date: Mon, 21 Mar 2022 07:44:55 +0100
Message-Id: <20220321064458.1517999-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kgm2RULr3NYTUj-WkucAfINJ2vQLjhsR
X-Proofpoint-ORIG-GUID: Kgm2RULr3NYTUj-WkucAfINJ2vQLjhsR
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1034 malwarescore=0 mlxlogscore=491 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210042
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2058fdbe81e2985c226a026851dd26b146d3395c:

  Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu into=
 staging (2022-03-19 11:28:54 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220321

for you to fetch changes up to 3515553bf625ad48aa90210379c4f387c2596093:

  target/ppc: Replicate Double->Single-Precision result (2022-03-20 23:35:2=
7 +0100)

----------------------------------------------------------------
ppc-7.0 queue :

* ISA v3.1 vector instruction fixes
* Compilation fix regarding 'struct pt_regs' definition

----------------------------------------------------------------
Khem Raj (1):
      ppc64: Avoid pt_regs struct definition

Lucas Coutinho (1):
      target/ppc: Replicate Double->Single-Precision result

Richard Henderson (1):
      target/ppc: Replicate double->int32 result for some vector insns

 linux-user/include/host/ppc/host-signal.h   | 38 ------------
 linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++-
 target/ppc/fpu_helper.c                     | 93 +++++++++++++++++++++++++=
----
 3 files changed, 124 insertions(+), 49 deletions(-)
 delete mode 100644 linux-user/include/host/ppc/host-signal.h

