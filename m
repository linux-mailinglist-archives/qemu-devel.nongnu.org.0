Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DD483D46
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:54:19 +0100 (CET)
Received: from localhost ([::1]:55332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ee9-0003JJ-Qx
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIO-0005pn-BK; Tue, 04 Jan 2022 02:31:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26876
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIL-0008CT-1W; Tue, 04 Jan 2022 02:31:48 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2045ILPX002313; 
 Tue, 4 Jan 2022 07:31:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcfyphug7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O512030606;
 Tue, 4 Jan 2022 07:31:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek9f5yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047VNsM36307286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5F2311C04C;
 Tue,  4 Jan 2022 07:31:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD2211C05E;
 Tue,  4 Jan 2022 07:31:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B127B220144;
 Tue,  4 Jan 2022 08:31:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/26] ppc queue
Date: Tue,  4 Jan 2022 08:30:55 +0100
Message-Id: <20220104073121.3784280-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mx75NLHYZS5bYGAQQlmXfRaXpuqpnJw0
X-Proofpoint-GUID: Mx75NLHYZS5bYGAQQlmXfRaXpuqpnJw0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=826 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:

  Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into st=
aging (2022-01-03 09:34:41 -0800)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220104

for you to fetch changes up to 0625c7760d5451d7436ef0738f763c6bb5141919:

  target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0() (20=
22-01-04 07:55:35 +0100)

----------------------------------------------------------------
ppc 7.0 queue:

* Cleanup of PowerNV PHBs (Daniel and Cedric)
* Cleanup and fixes for PPC405 machine (Cedric)
* Fix for xscvspdpn (Matheus)
* Rework of powerpc exception handling 1/n (Fabiano)
* Optimisation for PMU (Richard and Daniel)

----------------------------------------------------------------
C=C3=A9dric Le Goater (14):
      ppc/pnv: Change the maximum of PHB3 devices for Power8NVL
      ppc/pnv: Remove PHB4 reset handler
      ppc/pnv: Remove the PHB4 "device-id" property
      target/ppc: Improve logging in Radix MMU
      target/ppc: Check effective address validity
      target/ppc: Remove static inline
      target/ppc: Print out literal exception names in logs
      ppc/ppc4xx: Convert printfs()
      ppc/ppc405: Activate MMU logs
      ppc/ppc405: Restore TCR and STR write handlers
      ppc/ppc405: Rework ppc_40x_timers_init() to use a PowerPCCPU
      ppc/ppc405: Fix timer initialization
      ppc/ppc405: Introduce a store helper for SPR_40x_PID
      ppc/ppc405: Dump specific registers

Daniel Henrique Barboza (3):
      pnv_phb3.c: do not set 'root-bus' as bus name
      pnv_phb4.c: do not set 'root-bus' as bus name
      target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0()

Fabiano Rosas (5):
      target/ppc: powerpc_excp: Set alternate SRRs directly
      target/ppc: powerpc_excp: Add excp_vectors bounds check
      target/ppc: powerpc_excp: Set vector earlier
      target/ppc: powerpc_excp: Move system call vectored code together
      target/ppc: powerpc_excp: Stop passing excp_model around

Matheus Ferst (1):
      target/ppc: do not silence snan in xscvspdpn

Richard Henderson (3):
      target/ppc: Cache per-pmc insn and cycle count settings
      target/ppc: Rewrite pmu_increment_insns
      target/ppc: Use env->pnc_cyc_cnt

 include/hw/pci-host/pnv_phb4.h          |   2 -
 target/ppc/cpu.h                        |   5 +
 target/ppc/helper.h                     |   2 +
 target/ppc/mmu-radix64.h                |   1 +
 target/ppc/power8-pmu.h                 |  14 +-
 target/ppc/spr_tcg.h                    |   3 +
 hw/pci-host/pnv_phb3.c                  |   3 +-
 hw/pci-host/pnv_phb4.c                  |  16 +--
 hw/pci-host/pnv_phb4_pec.c              |   3 -
 hw/ppc/mpc8544_guts.c                   |   9 +-
 hw/ppc/pnv.c                            |   2 +-
 hw/ppc/ppc.c                            |  67 ++++++---
 hw/ppc/ppc405_uc.c                      |   2 -
 hw/ppc/ppc4xx_devs.c                    |  39 ++----
 hw/ppc/ppc4xx_pci.c                     |  11 +-
 target/ppc/cpu_init.c                   |  34 +++--
 target/ppc/excp_helper.c                | 187 ++++++++++++++++---------
 target/ppc/fpu_helper.c                 |   5 +-
 target/ppc/helper_regs.c                |   2 +-
 target/ppc/machine.c                    |   2 +
 target/ppc/mmu-radix64.c                |  60 +++++++-
 target/ppc/mmu_common.c                 | 164 +++++++++++-----------
 target/ppc/mmu_helper.c                 |  97 ++++++-------
 target/ppc/power8-pmu.c                 | 238 ++++++++++++++--------------=
----
 target/ppc/timebase_helper.c            |  10 ++
 target/ppc/translate.c                  |  20 +++
 tests/tcg/ppc64le/non_signalling_xscv.c |  37 +++++
 hw/ppc/trace-events                     |   7 +
 tests/tcg/ppc64/Makefile.target         |   4 +-
 tests/tcg/ppc64le/Makefile.target       |   4 +-
 30 files changed, 604 insertions(+), 446 deletions(-)
 create mode 100644 tests/tcg/ppc64le/non_signalling_xscv.c

