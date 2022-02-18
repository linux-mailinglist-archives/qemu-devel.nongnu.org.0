Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A54BB714
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:41:53 +0100 (CET)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0i1-0004IC-01
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:41:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fO-00011S-6M; Fri, 18 Feb 2022 05:39:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0f9-0005fO-8T; Fri, 18 Feb 2022 05:39:09 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9ugKg025082; 
 Fri, 18 Feb 2022 10:38:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea995gxcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbrwv011029;
 Fri, 18 Feb 2022 10:38:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645khcd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcU9e36700590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C42BFA4064;
 Fri, 18 Feb 2022 10:38:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90A8BA4070;
 Fri, 18 Feb 2022 10:38:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A83392201F1;
 Fri, 18 Feb 2022 11:38:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/39] ppc queue
Date: Fri, 18 Feb 2022 11:37:48 +0100
Message-Id: <20220218103827.682032-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yG4bnAwqd26ectgr2Br41sSuR13ZwNwP
X-Proofpoint-GUID: yG4bnAwqd26ectgr2Br41sSuR13ZwNwP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1034 phishscore=0 suspectscore=0 mlxlogscore=400 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
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

The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0220216' into staging (2022-02-16 09:57:11 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220218

for you to fetch changes up to 65e0446c86ee70d2125c1f1d1e36e6c2dfb08642:

  target/ppc: Move common SPR functions out of cpu_init (2022-02-18 08:34:1=
5 +0100)

----------------------------------------------------------------
ppc-7.0 queue

* target/ppc: SPR registration cleanups (Fabiano)
* ppc: nested KVM HV for spapr virtual hypervisor (Nicholas)
* spapr: nvdimm: Introduce spapr-nvdimm device (Shivaprasad)

----------------------------------------------------------------
Fabiano Rosas (27):
      target/ppc: cpu_init: Remove not implemented comments
      target/ppc: cpu_init: Remove G2LE init code
      target/ppc: cpu_init: Group registration of generic SPRs
      target/ppc: cpu_init: Move Timebase registration into the common func=
tion
      target/ppc: cpu_init: Avoid nested SPR register functions
      target/ppc: cpu_init: Move 405 SPRs into register_405_sprs
      target/ppc: cpu_init: Move G2 SPRs into register_G2_sprs
      target/ppc: cpu_init: Decouple G2 SPR registration from 755
      target/ppc: cpu_init: Decouple 74xx SPR registration from 7xx
      target/ppc: cpu_init: Deduplicate 440 SPR registration
      target/ppc: cpu_init: Deduplicate 603 SPR registration
      target/ppc: cpu_init: Deduplicate 604 SPR registration
      target/ppc: cpu_init: Deduplicate 745/755 SPR registration
      target/ppc: cpu_init: Deduplicate 7xx SPR registration
      target/ppc: cpu_init: Move 755 L2 cache SPRs into a function
      target/ppc: cpu_init: Move e300 SPR registration into a function
      target/ppc: cpu_init: Move 604e SPR registration into a function
      target/ppc: cpu_init: Reuse init_proc_603 for the e300
      target/ppc: cpu_init: Reuse init_proc_604 for the 604e
      target/ppc: cpu_init: Reuse init_proc_745 for the 755
      target/ppc: cpu_init: Rename register_ne_601_sprs
      target/ppc: cpu_init: Remove register_usprg3_sprs
      target/ppc: Rename spr_tcg.h to spr_common.h
      target/ppc: cpu_init: Expose some SPR registration helpers
      target/ppc: cpu_init: Move SPR registration macros to a header
      target/ppc: cpu_init: Move check_pow and QOM macros to a header
      target/ppc: Move common SPR functions out of cpu_init

Nicholas Piggin (9):
      target/ppc: raise HV interrupts for partition table entry problems
      spapr: prevent hdec timer being set up under virtual hypervisor
      ppc: allow the hdecr timer to be created/destroyed
      target/ppc: add vhyp addressing mode helper for radix MMU
      target/ppc: make vhyp get_pate method take lpid and return success
      target/ppc: add helper for books vhyp hypercall handler
      target/ppc: Add powerpc_reset_excp_state helper
      target/ppc: Introduce a vhyp framework for nested HV support
      spapr: implement nested-hv capability for the virtual hypervisor

Shivaprasad G Bhat (3):
      nvdimm: Add realize, unrealize callbacks to NVDIMMDevice class
      spapr: nvdimm: Implement H_SCM_FLUSH hcall
      spapr: nvdimm: Introduce spapr-nvdimm device

 include/hw/mem/nvdimm.h                |    2 +
 include/hw/mem/pc-dimm.h               |    1 +
 include/hw/ppc/ppc.h                   |    3 +
 include/hw/ppc/spapr.h                 |   78 +-
 include/hw/ppc/spapr_cpu_core.h        |    5 +
 include/hw/ppc/spapr_nvdimm.h          |    1 +
 target/ppc/cpu.h                       |   49 +-
 target/ppc/{spr_tcg.h =3D> spr_common.h} |   69 +-
 hw/mem/nvdimm.c                        |   16 +
 hw/mem/pc-dimm.c                       |    5 +
 hw/ppc/pegasos2.c                      |    6 +
 hw/ppc/ppc.c                           |   23 +-
 hw/ppc/spapr.c                         |   48 +-
 hw/ppc/spapr_caps.c                    |   14 +-
 hw/ppc/spapr_cpu_core.c                |    6 +-
 hw/ppc/spapr_hcall.c                   |  333 ++++++
 hw/ppc/spapr_nvdimm.c                  |  392 +++++++
 target/ppc/cpu_init.c                  | 1877 ++++++++++------------------=
----
 target/ppc/excp_helper.c               |  118 +-
 target/ppc/helper_regs.c               |  402 +++++++
 target/ppc/mmu-radix64.c               |   40 +-
 target/ppc/translate.c                 |    2 +-
 22 files changed, 2144 insertions(+), 1346 deletions(-)
 rename target/ppc/{spr_tcg.h =3D> spr_common.h} (72%)

