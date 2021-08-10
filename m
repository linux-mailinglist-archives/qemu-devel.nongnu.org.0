Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755A3E5A50
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:46:14 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDR93-0002H0-64
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDR7L-0001Ai-Rc; Tue, 10 Aug 2021 08:44:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDR7K-0005mg-5C; Tue, 10 Aug 2021 08:44:27 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ACXC59061060; Tue, 10 Aug 2021 08:44:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab5k4e12f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 08:44:10 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17ACXSY9061917;
 Tue, 10 Aug 2021 08:44:10 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab5k4e11c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 08:44:10 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17AChBNv013333;
 Tue, 10 Aug 2021 12:44:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3a9ht8ne85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 12:44:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17ACi5xO55837158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 12:44:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3A1842054;
 Tue, 10 Aug 2021 12:44:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B8142049;
 Tue, 10 Aug 2021 12:44:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 10 Aug 2021 12:44:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.85])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 305EA22016B;
 Tue, 10 Aug 2021 14:44:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PULL ppc] powernv queue
Date: Tue, 10 Aug 2021 14:44:03 +0200
Message-Id: <20210810124403.771769-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: awY1AgOq-vaeOKSK_iRZUv7Zb6tSL4Gr
X-Proofpoint-GUID: YMy_-tTmmyAocQUqu-5xic922QMu8Prf
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_05:2021-08-10,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1034 suspectscore=0 impostorscore=0
 mlxlogscore=847 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100080
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb:

  Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-powernv-20210810

for you to fetch changes up to 91a6b62df830d51f2b6b2ea00b3c92231d0ba9dc:

  ppc/pnv: update skiboot to commit 820d43c0a775. (2021-08-10 14:18:51 +020=
0)

----------------------------------------------------------------
ppc/pnv: update skiboot image

----------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      ppc/pnv: update skiboot to commit 820d43c0a775.

 pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
 roms/skiboot        |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

