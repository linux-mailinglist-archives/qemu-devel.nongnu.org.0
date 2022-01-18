Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15DF492804
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:09:09 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pAa-0004yf-M0
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:09:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDD-0003by-8e; Tue, 18 Jan 2022 08:07:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37766
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDB-0000CU-K9; Tue, 18 Jan 2022 08:07:46 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IBsH2P030346; 
 Tue, 18 Jan 2022 13:07:37 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnt4dp5fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:37 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7U2o006542;
 Tue, 18 Jan 2022 13:07:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3dknw9baus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7WpA44171588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1E7F4C040;
 Tue, 18 Jan 2022 13:07:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6615C4C044;
 Tue, 18 Jan 2022 13:07:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 759E922016C;
 Tue, 18 Jan 2022 14:07:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/31] ppc queue
Date: Tue, 18 Jan 2022 14:06:59 +0100
Message-Id: <20220118130730.1927983-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4xfWhiOTuX8RVtLfJB6XyXINQ0nlRBwr
X-Proofpoint-GUID: 4xfWhiOTuX8RVtLfJB6XyXINQ0nlRBwr
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=649 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
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

The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2022011=
5' into staging (2022-01-16 20:12:23 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220118

for you to fetch changes up to ba49190107ee9803fb2f336b15283b457384b178:

  ppc/pnv: Remove PHB4 version property (2022-01-18 12:56:31 +0100)

----------------------------------------------------------------
ppc 7.0 queue:

* More documentation updates (Leonardo)
* Fixes for the 7448 CPU (Fabiano and Cedric)
* Final removal of 403 CPUs and the .load_state_old handler (Cedric)
* More cleanups of PHB4 models (Daniel and Cedric)

----------------------------------------------------------------
C=C3=A9dric Le Goater (6):
      target/ppc: Remove last user of .load_state_old
      target/ppc: Finish removal of 401/403 CPUs
      target/ppc: Fix 7448 support
      ppc/pnv: Move root port allocation under pnv_pec_default_phb_realize()
      ppc/pnv: Add a 'rp_model' class attribute for the PHB4 PEC
      ppc/pnv: Remove PHB4 version property

Daniel Henrique Barboza (18):
      ppc/pnv: use PHB4 obj in pnv_pec_stk_pci_xscom_ops
      ppc/pnv: move PCI registers to PnvPHB4
      ppc/pnv: move phbbar to PnvPHB4
      ppc/pnv: move intbar to PnvPHB4
      ppc/pnv: change pnv_phb4_update_regions() to use PnvPHB4
      ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
      ppc/pnv: move nest_regs[] to PnvPHB4
      ppc/pnv: change pnv_pec_stk_update_map() to use PnvPHB4
      ppc/pnv: move nest_regs_mr to PnvPHB4
      ppc/pnv: move phb_regs_mr to PnvPHB4
      ppc/pnv: introduce PnvPHB4 'pec' property
      ppc/pnv: reduce stack->stack_no usage
      ppc/pnv: remove stack pointer from PnvPHB4
      ppc/pnv: move default_phb_realize() to pec_realize()
      ppc/pnv: remove PnvPhb4PecStack::stack_no
      ppc/pnv: make PECs create and realize PHB4s
      ppc/pnv: remove PnvPhb4PecStack object
      ppc/pnv: rename pnv_pec_stk_update_map()

Fabiano Rosas (1):
      tests/avocado: ppc: Add smoke tests for MPC7400 and MPC7450 families

Leonardo Garcia (6):
      docs: rSTify ppc-spapr-hotplug.txt.
      docs: Rename ppc-spapr-hotplug.txt to ppc-spapr-hotplug.rst.
      Link new ppc-spapr-hotplug.rst file to pseries.rst.
      rSTify ppc-spapr-uv-hcalls.txt.
      Rename ppc-spapr-uv-hcalls.txt to ppc-spapr-uv-hcalls.rst.
      Link new ppc-spapr-uv-hcalls.rst to pseries.rst.

 docs/specs/ppc-spapr-hotplug.rst   | 510 +++++++++++++++++++++++++++++++++=
++++
 docs/specs/ppc-spapr-hotplug.txt   | 409 -----------------------------
 docs/specs/ppc-spapr-uv-hcalls.rst |  89 +++++++
 docs/specs/ppc-spapr-uv-hcalls.txt |  76 ------
 docs/system/ppc/pseries.rst        |   8 +-
 include/hw/pci-host/pnv_phb4.h     |  80 +++---
 target/ppc/cpu.h                   |   1 -
 target/ppc/helper.h                |   1 -
 hw/pci-host/pnv_phb4.c             | 299 +++++++++++-----------
 hw/pci-host/pnv_phb4_pec.c         | 121 +++------
 target/ppc/cpu-models.c            |   9 +-
 target/ppc/machine.c               | 136 ----------
 target/ppc/misc_helper.c           |   9 -
 target/ppc/translate.c             |  16 +-
 tests/avocado/ppc_74xx.py          | 123 +++++++++
 15 files changed, 940 insertions(+), 947 deletions(-)
 create mode 100644 docs/specs/ppc-spapr-hotplug.rst
 delete mode 100644 docs/specs/ppc-spapr-hotplug.txt
 create mode 100644 docs/specs/ppc-spapr-uv-hcalls.rst
 delete mode 100644 docs/specs/ppc-spapr-uv-hcalls.txt
 create mode 100644 tests/avocado/ppc_74xx.py

