Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E7D48C3E9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:26:11 +0100 (CET)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7che-0002Yj-AW
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEr-0006Tb-Cd; Wed, 12 Jan 2022 06:56:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEn-0007VB-Nq; Wed, 12 Jan 2022 06:56:24 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBC0pG016818; 
 Wed, 12 Jan 2022 11:56:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhac0kfgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBlpeh025184;
 Wed, 12 Jan 2022 11:56:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhjc6bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBu2UE37356028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A329552067;
 Wed, 12 Jan 2022 11:56:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 72B5552051;
 Wed, 12 Jan 2022 11:56:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 91EA222016C;
 Wed, 12 Jan 2022 12:56:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/34] ppc queue
Date: Wed, 12 Jan 2022 12:55:17 +0100
Message-Id: <20220112115551.987666-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Qr8_0KUhezYe1GvYoFi4jhfm3DLLCPt
X-Proofpoint-ORIG-GUID: 5Qr8_0KUhezYe1GvYoFi4jhfm3DLLCPt
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=753 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7bb1272f40bdbdebcaec1737c412dcb52e414842:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-reque=
st' into staging (2022-01-11 14:20:42 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220112

for you to fetch changes up to f83460bb203a49dd1693bf8b664d2a935a5be621:

  ppc/pnv: use stack->pci_regs[] in pnv_pec_stk_pci_xscom_write() (2022-01-=
12 11:28:27 +0100)

----------------------------------------------------------------
ppc 7.0 queue:

* New SLOF for PPC970 and POWER5+ (Alexey)
* Fixes for POWER5+ pseries (Cedric)
* Updates of documentation (Leonardo and Thomas)
* First step of exception model cleanup (Fabiano)
* User created PHB3/PHB4 devices (Daniel and Cedric)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

C=C3=A9dric Le Goater (9):
      Merge tag 'qemu-slof-20220110' of github.com:aik/qemu into ppc-7.0
      target/ppc: Add popcntb instruction to POWER5+ processors
      spapr: Fix support of POWER5+ processors
      target/ppc: Add extra float instructions to POWER5P processors
      ppc/pnv: Attach PHB3 root port device when defaults are enabled
      ppc/pnv: Introduce support for user created PHB3 devices
      ppc/pnv: Reparent user created PHB3 devices to the PnvChip
      ppc/pnv: Complete user created PHB3 devices
      ppc/pnv: Move num_phbs under Pnv8Chip

Daniel Henrique Barboza (14):
      pnv_phb3.c: add unique chassis and slot for pnv_phb3_root_port
      pnv_phb4.c: add unique chassis and slot for pnv_phb4_root_port
      pnv_phb4.c: make pnv-phb4-root-port user creatable
      pnv_phb4.c: check if root port exists in rc_config functions
      pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
      pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
      pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
      pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in pnv_pec_dt_xscom()
      ppc/pnv: set phb4 properties in stk_realize()
      ppc/pnv: move PHB4 XSCOM init to phb4_realize()
      ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
      ppc/pnv: Introduce user creatable pnv-phb4 devices
      ppc/pnv: turn pnv_phb4_update_regions() into static
      ppc/pnv: use stack->pci_regs[] in pnv_pec_stk_pci_xscom_write()

Fabiano Rosas (8):
      target/ppc: powerpc_excp: Extract software TLB logging into a function
      target/ppc: powerpc_excp: Keep 60x/7x5 soft MMU logs active
      target/ppc: powerpc_excp: Group unimplemented exceptions
      target/ppc: Add HV support to ppc_interrupts_little_endian
      target/ppc: Add MSR_ILE support to ppc_interrupts_little_endian
      target/ppc: Use ppc_interrupts_little_endian in powerpc_excp
      target/ppc: Introduce a wrapper for powerpc_excp
      target/ppc: Set the correct endianness for powernv memory dumps

Leonardo Garcia (1):
      docs: Clarifications and formatting changes in ppc docs.

Thomas Huth (2):
      docs/system/ppc: Merge the PEF information into the pseries page
      MAINTAINERS: Improve the PowerPC machines section

 docs/papr-pef.txt               |  30 ---
 docs/specs/ppc-spapr-hcalls.rst |  21 +-
 docs/system/ppc/pseries.rst     |  75 +++++--
 include/hw/pci-host/pnv_phb3.h  |   4 +-
 include/hw/pci-host/pnv_phb4.h  |  14 +-
 include/hw/ppc/pnv.h            |   8 +-
 target/ppc/cpu.h                |  25 ++-
 hw/pci-host/pnv_phb3.c          |  57 ++++-
 hw/pci-host/pnv_phb4.c          | 486 ++++++++++++++++++++++++++++++++++++=
----
 hw/pci-host/pnv_phb4_pec.c      | 347 ++--------------------------
 hw/ppc/pnv.c                    |  55 ++++-
 hw/ppc/spapr.c                  |  10 +-
 target/ppc/arch_dump.c          |   2 +-
 target/ppc/cpu_init.c           |   2 +
 target/ppc/excp_helper.c        | 185 +++++----------
 MAINTAINERS                     |  12 +-
 pc-bios/README                  |   2 +-
 pc-bios/slof.bin                | Bin 991920 -> 992384 bytes
 roms/SLOF                       |   2 +-
 19 files changed, 737 insertions(+), 600 deletions(-)
 delete mode 100644 docs/papr-pef.txt

