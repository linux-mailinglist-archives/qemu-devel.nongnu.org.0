Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680724A47C0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:08:21 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWPl-0001gN-3S
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ3-0006BP-JN; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00053U-8J; Mon, 31 Jan 2022 06:09:41 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VAc0S5017225; 
 Mon, 31 Jan 2022 11:08:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wtjck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2JVZ004596;
 Mon, 31 Jan 2022 11:08:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3dvvuj2kvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8E1S41222454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 684D04C04A;
 Mon, 31 Jan 2022 11:08:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E2444C044;
 Mon, 31 Jan 2022 11:08:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4EF4A220149;
 Mon, 31 Jan 2022 12:08:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/41] ppc queue
Date: Mon, 31 Jan 2022 12:07:30 +0100
Message-Id: <20220131110811.619053-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QpWPJwDCsXSebskxo3FIwJgmeoJ8CUX8
X-Proofpoint-ORIG-GUID: QpWPJwDCsXSebskxo3FIwJgmeoJ8CUX8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=680 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cfe63e46be0a1f8a7fd2fd5547222f8344a43279:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2022-01-27-v2=
' into staging (2022-01-27 15:45:13 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220130

for you to fetch changes up to 4537d62dcece45183632298272abfb4859418cc0:

  target/ppc: Remove support for the PowerPC 602 CPU (2022-01-28 21:38:17 +=
0100)

----------------------------------------------------------------
ppc 7.0 queue:

* Exception and TLB fixes for the 405 CPU (Fabiano and Cedric)
* spapr fixes (Alexey and Daniel)
* PowerNV PHB3/4 fixes (Frederic and Daniel)
* PowerNV XIVE improvements (Cedric)
* 603 CPUs fixes (Christophe)
* Book-E exception fixes (Vitaly)
* Misc compile issues  (Philippe and Fabiano)
* Exception model rework for the BookS CPUs (Fabiano)
* Exception model rework for the 74xx CPUs (Fabiano)
* Removal of 602 CPUs

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr: Force 32bit when resetting a core

Christophe Leroy (1):
      target/ppc: 603: fix restore of GPRs 0-3 on rfi

C=C3=A9dric Le Goater (4):
      ppc/xive: check return value of ldq_be_dma()
      target/ppc: Fix test on mmu_model in hreg_compute_hflags_value()
      ppc/ppc405: Fix TLB flushing
      target/ppc: Remove support for the PowerPC 602 CPU

Daniel Henrique Barboza (4):
      ppc/pnv: use a do-while() loop in pnv_phb3_translate_tve()
      ppc/pnv: use a do-while() loop in pnv_phb4_translate_tve()
      target/ppc: fix 'skip KVM' cond in cpu_interrupt_exittb()
      spapr.c: check bus !=3D NULL in spapr_get_fw_dev_path()

Fabiano Rosas (28):
      target/ppc: Put do_rfi under a TCG-only block
      target/ppc: 405: Rename MSR_POW to MSR_WE
      target/ppc: 405: Add missing MSR_ME bit
      target/ppc: Introduce powerpc_excp_40x
      target/ppc: Simplify powerpc_excp_40x
      target/ppc: 405: Critical exceptions cleanup
      target/ppc: 405: Machine check exception cleanup
      target/ppc: 405: External exception cleanup
      target/ppc: 405: System call exception cleanup
      target/ppc: 405: Alignment exception cleanup
      target/ppc: 405: Debug exception cleanup
      target/ppc: 405: Data Storage exception cleanup
      target/ppc: 405: Instruction storage interrupt cleanup
      target/ppc: 405: Program exception cleanup
      target/ppc: 405: Watchdog timer exception cleanup
      target/ppc: Introduce powerpc_excp_books
      target/ppc: Simplify powerpc_excp_books
      target/ppc: books: Machine Check exception cleanup
      target/ppc: books: External interrupt cleanup
      target/ppc: books: Program exception cleanup
      target/ppc: Introduce powerpc_excp_74xx
      target/ppc: Simplify powerpc_excp_74xx
      target/ppc: 74xx: Machine Check exception cleanup
      target/ppc: 74xx: External interrupt cleanup
      target/ppc: 74xx: Program exception cleanup
      target/ppc: 74xx: System Call exception cleanup
      target/ppc: 74xx: System Reset interrupt cleanup
      target/ppc: 74xx: Set SRRs directly in exception code

Frederic Barrat (1):
      ppc/pnv: Fail DMA access if page permissions are not correct

Philippe Mathieu-Daud=C3=A9 (1):
      hw/ppc/vof: Add missing includes

Vitaly Cheptsov (1):
      target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E

 include/hw/ppc/vof.h         |   5 +
 target/ppc/cpu-models.h      |   1 -
 target/ppc/cpu.h             |   9 +-
 target/ppc/helper.h          |   2 +-
 hw/intc/pnv_xive.c           |  22 +-
 hw/pci-host/pnv_phb3.c       |  17 +-
 hw/pci-host/pnv_phb4.c       |  17 +-
 hw/ppc/spapr.c               |   2 +-
 hw/ppc/spapr_cpu_core.c      |   5 +
 hw/ppc/spapr_vof.c           |   2 -
 hw/ppc/vof.c                 |   1 -
 target/ppc/cpu-models.c      |   2 -
 target/ppc/cpu_init.c        | 150 +---------
 target/ppc/excp_helper.c     | 674 +++++++++++++++++++++++++++++++++++++++=
+++-
 target/ppc/helper_regs.c     |  12 +-
 target/ppc/int_helper.c      |  21 --
 target/ppc/mfrom_table_gen.c |  34 ---
 target/ppc/mmu_common.c      |  18 +-
 target/ppc/mmu_helper.c      |  12 +-
 target/ppc/translate.c       |  32 +-
 target/ppc/mfrom_table.c.inc |  78 -----
 21 files changed, 761 insertions(+), 355 deletions(-)
 delete mode 100644 target/ppc/mfrom_table_gen.c
 delete mode 100644 target/ppc/mfrom_table.c.inc

