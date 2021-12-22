Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFDA47CD3C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:02:50 +0100 (CET)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzveE-000732-0v
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIr-0008Nd-4k; Wed, 22 Dec 2021 01:40:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIp-0003CF-1G; Wed, 22 Dec 2021 01:40:44 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM2dpaf007620; 
 Wed, 22 Dec 2021 06:40:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3f18hfv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6Zdj2026164;
 Wed, 22 Dec 2021 06:40:32 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3f18hfuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6abT7023595;
 Wed, 22 Dec 2021 06:40:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3d1799suk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BM6WDf436569460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:32:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A135F11C050;
 Wed, 22 Dec 2021 06:40:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6086A11C04A;
 Wed, 22 Dec 2021 06:40:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:40:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 97A6422010B;
 Wed, 22 Dec 2021 07:40:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/8] ppc/ppc405: Fixes 
Date: Wed, 22 Dec 2021 07:40:17 +0100
Message-Id: <20211222064025.1541490-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eJ5AimpiHExDZ2bkMbGCSGKCgaGmbDtL
X-Proofpoint-GUID: dXwe5yBSCrhMvHk4LRC8sEHS9Jhu8kV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=733
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The series starts with a couple of cleanups helpping debug. It then
adds back support for 405 timers which was broken 10 years ago.

Thanks,

C.=20

C=C3=A9dric Le Goater (8):
  target/ppc: Print out literal exception names in logs
  ppc/ppc4xx: Convert printfs()
  ppc/ppc405: Activate MMU logs
  ppc/ppc405: Restore TCR and STR write handlers
  ppc/ppc405: Rework ppc_40x_timers_init() to use a PowerPCCPU
  ppc/ppc405: Fix timer initialization
  ppc/ppc405: Introduce a store helper for SPR_40x_PID
  ppc/ppc405: Dump specific registers

 target/ppc/cpu.h             |  2 +
 target/ppc/helper.h          |  2 +
 target/ppc/spr_tcg.h         |  3 ++
 hw/ppc/mpc8544_guts.c        |  9 +++--
 hw/ppc/ppc.c                 | 67 +++++++++++++++++++++-----------
 hw/ppc/ppc405_uc.c           |  2 -
 hw/ppc/ppc4xx_devs.c         | 39 ++++++-------------
 hw/ppc/ppc4xx_pci.c          | 11 ++++--
 target/ppc/cpu_init.c        | 17 ++++++--
 target/ppc/excp_helper.c     | 75 +++++++++++++++++++++++++++++++++++-
 target/ppc/mmu_common.c      |  4 +-
 target/ppc/mmu_helper.c      |  2 +-
 target/ppc/timebase_helper.c | 10 +++++
 target/ppc/translate.c       | 20 ++++++++++
 hw/ppc/trace-events          |  7 ++++
 15 files changed, 203 insertions(+), 67 deletions(-)

--=20
2.31.1


