Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A820D482E8F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 07:52:20 +0100 (CET)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HCd-00065Z-Jw
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 01:52:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gw2-000261-M1; Mon, 03 Jan 2022 01:35:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvz-0007zo-Gz; Mon, 03 Jan 2022 01:35:09 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2034mZHx015657; 
 Mon, 3 Jan 2022 06:34:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbteqhqrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036Y7Qg010692;
 Mon, 3 Jan 2022 06:34:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3dae7jg8pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2036YiFX48562552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:34:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3F742041;
 Mon,  3 Jan 2022 06:34:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFB6C4204F;
 Mon,  3 Jan 2022 06:34:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 Jan 2022 06:34:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EA64D22017E;
 Mon,  3 Jan 2022 07:34:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] ppc/ppc405: Fixes
Date: Mon,  3 Jan 2022 07:34:32 +0100
Message-Id: <20220103063441.3424853-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 93fqdfs93m70rGoJX5gRb62KDatWoYkx
X-Proofpoint-GUID: 93fqdfs93m70rGoJX5gRb62KDatWoYkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=791 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1034
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201030044
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The series starts with a couple of cleanups helping debug. It then
adds back support for 405 timers which was broken 10 years ago.

Thanks,

C.=20

Changes in v2:

 - removed inlining from powerpc_excp() routines
 - fixed a compile breakage with CONFIG_USER_ONLY
 - removed all DEBUG defines from MMU models

C=C3=A9dric Le Goater (9):
  target/ppc: Remove static inline
  target/ppc: Print out literal exception names in logs
  ppc/ppc4xx: Convert printfs()
  ppc/ppc405: Activate MMU logs
  ppc/ppc405: Restore TCR and STR write handlers
  ppc/ppc405: Rework ppc_40x_timers_init() to use a PowerPCCPU
  ppc/ppc405: Fix timer initialization
  ppc/ppc405: Introduce a store helper for SPR_40x_PID
  ppc/ppc405: Dump specific registers

 target/ppc/cpu.h             |   2 +
 target/ppc/helper.h          |   2 +
 target/ppc/spr_tcg.h         |   3 +
 hw/ppc/mpc8544_guts.c        |   9 +-
 hw/ppc/ppc.c                 |  67 +++++++++-----
 hw/ppc/ppc405_uc.c           |   2 -
 hw/ppc/ppc4xx_devs.c         |  39 +++------
 hw/ppc/ppc4xx_pci.c          |  11 ++-
 target/ppc/cpu_init.c        |  33 +++++--
 target/ppc/excp_helper.c     |  87 +++++++++++++++++--
 target/ppc/mmu_common.c      | 164 ++++++++++++++++-------------------
 target/ppc/mmu_helper.c      |  97 ++++++++++-----------
 target/ppc/timebase_helper.c |  10 +++
 target/ppc/translate.c       |  20 +++++
 hw/ppc/trace-events          |   7 ++
 15 files changed, 338 insertions(+), 215 deletions(-)

--=20
2.31.1


