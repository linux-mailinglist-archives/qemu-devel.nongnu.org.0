Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E154B4B1198
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:23:26 +0100 (CET)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBI6-0003cN-1m
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93v-0001vr-Gs; Thu, 10 Feb 2022 08:00:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93p-00049G-6r; Thu, 10 Feb 2022 08:00:38 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21AAMgpt000435; 
 Thu, 10 Feb 2022 13:00:19 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4r7jpm52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw2pI030325;
 Thu, 10 Feb 2022 13:00:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggkg4cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0DBn40567184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92D2342061;
 Thu, 10 Feb 2022 13:00:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6199042056;
 Thu, 10 Feb 2022 13:00:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5E52C22016C;
 Thu, 10 Feb 2022 14:00:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/42] ppc queue
Date: Thu, 10 Feb 2022 13:59:26 +0100
Message-Id: <20220210130008.2599950-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WE-olIssG94419CWmIam9n9HEb-nnAYB
X-Proofpoint-ORIG-GUID: WE-olIssG94419CWmIam9n9HEb-nnAYB
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=974 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100068
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220=
208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220210

for you to fetch changes up to 10717c26dbe1c138ba6af6d09a3bb9958d4fe3f2:

  spapr/vof: Install rom and nvram binaries (2022-02-09 09:08:56 +0100)

----------------------------------------------------------------
ppc-7.0 queue

* Exception model rework (Fabiano)
* Unused CPU models removal (Fabiano and C=C3=A9dric)
* Fix for VOF installation (Alexey)
* Misc fixes

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr/vof: Install rom and nvram binaries

Cornelia Huck (1):
      docs: rstfy confidential guest documentation

C=C3=A9dric Le Goater (2):
      target/ppc: Fix radix logging
      target/ppc: Remove PowerPC 601 CPUs

Fabiano Rosas (37):
      target/ppc: Remove 440x4 CPU
      target/ppc: Introduce powerpc_excp_booke
      target/ppc: Simplify powerpc_excp_booke
      target/ppc: booke: Critical exception cleanup
      target/ppc: booke: Machine Check cleanups
      target/ppc: booke: Data Storage exception cleanup
      target/ppc: booke: Instruction storage exception cleanup
      target/ppc: booke: External interrupt cleanup
      target/ppc: booke: Alignment interrupt cleanup
      target/ppc: booke: System Call exception cleanup
      target/ppc: booke: Watchdog Timer interrupt
      target/ppc: booke: System Reset exception cleanup
      target/ppc: Merge exception model IDs for 6xx CPUs
      target/ppc: Introduce powerpc_excp_6xx
      target/ppc: Simplify powerpc_excp_6xx
      target/ppc: 6xx: Critical exception cleanup
      target/ppc: 6xx: Machine Check exception cleanup
      target/ppc: 6xx: External interrupt cleanup
      target/ppc: 6xx: Program exception cleanup
      target/ppc: 6xx: System Call exception cleanup
      target/ppc: 6xx: System Reset interrupt cleanup
      target/ppc: 6xx: Software TLB exceptions cleanup
      target/ppc: 6xx: Set SRRs directly in exception code
      target/ppc: Merge 7x5 and 7x0 exception model IDs
      target/ppc: Introduce powerpc_excp_7xx
      target/ppc: Simplify powerpc_excp_7xx
      target/ppc: 7xx: Machine Check exception cleanup
      target/ppc: 7xx: External interrupt cleanup
      target/ppc: 7xx: Program exception cleanup
      target/ppc: 7xx: System Call exception cleanup
      target/ppc: 7xx: System Reset cleanup
      target/ppc: 7xx: Software TLB cleanup
      target/ppc: 7xx: Set SRRs directly in exception code
      target/ppc: Remove powerpc_excp_legacy
      target/ppc: powerpc_excp: Move common code to the caller function
      target/ppc: Assert if MSR bits differ from msr_mask during exceptions
      target/ppc: books: Remove excp_model argument from ppc_excp_apply_ail

V=C3=ADctor Colombo (1):
      target/ppc: Change VSX instructions behavior to fill with zeros

 .../confidential-guest-support.rst}                |  15 +-
 .../i386/amd-memory-encryption.rst}                | 102 ++-
 docs/system/index.rst                              |   1 +
 docs/system/ppc/pseries.rst                        |   2 +
 docs/system/target-i386.rst                        |   1 +
 target/ppc/cpu-models.h                            |   3 -
 target/ppc/cpu-qom.h                               |  20 +-
 target/ppc/cpu.h                                   |  39 +-
 target/ppc/helper.h                                |  13 -
 target/ppc/mmu-hash32.h                            |   9 -
 target/ppc/spr_tcg.h                               |   8 -
 hw/ppc/ppc.c                                       |  21 -
 hw/ppc/prep.c                                      |   9 +-
 linux-user/ppc/cpu_loop.c                          |  16 -
 target/ppc/cpu-models.c                            |   8 -
 target/ppc/cpu_init.c                              | 331 +-------
 target/ppc/excp_helper.c                           | 917 +++++++++++------=
----
 target/ppc/fpu_helper.c                            |  26 +-
 target/ppc/helper_regs.c                           |  10 -
 target/ppc/int_helper.c                            |  66 --
 target/ppc/machine.c                               |   5 +-
 target/ppc/misc_helper.c                           |  40 -
 target/ppc/mmu-hash32.c                            |  48 +-
 target/ppc/mmu-radix64.c                           |   8 +-
 target/ppc/mmu_common.c                            |  21 -
 target/ppc/mmu_helper.c                            |  84 --
 target/ppc/timebase_helper.c                       |  20 -
 target/ppc/translate.c                             | 842 -----------------=
--
 target/ppc/translate/fp-impl.c.inc                 | 179 ----
 target/ppc/translate/vsx-impl.c.inc                |   4 +-
 MAINTAINERS                                        |   2 +-
 pc-bios/meson.build                                |   2 +
 32 files changed, 607 insertions(+), 2265 deletions(-)
 rename docs/{confidential-guest-support.txt =3D> system/confidential-guest=
-support.rst} (77%)
 rename docs/{amd-memory-encryption.txt =3D> system/i386/amd-memory-encrypt=
ion.rst} (62%)

