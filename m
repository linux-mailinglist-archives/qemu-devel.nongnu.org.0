Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D984CA2E6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:11:54 +0100 (CET)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMtc-00047s-VL
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqC-0008GV-Ht; Wed, 02 Mar 2022 06:08:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqA-0001gJ-9T; Wed, 02 Mar 2022 06:08:20 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229rYLK026093; 
 Wed, 2 Mar 2022 11:08:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpsdms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3A6A017784;
 Wed, 2 Mar 2022 11:08:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B879A40960348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB115207A;
 Wed,  2 Mar 2022 11:08:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A8D295207B;
 Wed,  2 Mar 2022 11:08:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1D09D2201C1;
 Wed,  2 Mar 2022 12:08:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/87] ppc queue
Date: Wed,  2 Mar 2022 12:06:36 +0100
Message-Id: <20220302110803.849505-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oG3fotS0diTnZsx_htpXMzwUViLz1aoH
X-Proofpoint-ORIG-GUID: oG3fotS0diTnZsx_htpXMzwUViLz1aoH
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=796
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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

The following changes since commit 09591fcf6eb3157ab9c50a9fbbef5f8a567fb49f:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20220228' =
into staging (2022-03-01 15:55:31 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220302

for you to fetch changes up to 169518430562b454a1531610d2711c6b920929f6:

  hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice() (2022-03-02 06:5=
1:40 +0100)

----------------------------------------------------------------
ppc-7.0 queue

* ppc/pnv fixes
* PMU EBB support
* target/ppc: PowerISA Vector/VSX instruction batch
* ppc/pnv: Extension of the powernv10 machine with XIVE2 ans PHB5 models
* spapr allocation cleanups

----------------------------------------------------------------
Bernhard Beschow (1):
      hw/ppc/pnv: Determine ns16550's IRQ number from QOM property

C=C3=A9dric Le Goater (18):
      ppc/xive2: Introduce a XIVE2 core framework
      ppc/xive2: Introduce a presenter matching routine
      ppc/pnv: Add a XIVE2 controller to the POWER10 chip
      ppc/pnv: Add a OCC model for POWER10
      ppc/pnv: Add POWER10 quads
      ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
      ppc/pnv: Add a HOMER model to POWER10
      ppc/psi: Add support for StoreEOI and 64k ESB pages (POWER10)
      ppc/xive2: Add support for notification injection on ESB pages
      ppc/xive: Add support for PQ state bits offload
      ppc/pnv: Add support for PQ offload on PHB5
      ppc/pnv: Add support for PHB5 "Address-based trigger" mode
      pnv/xive2: Introduce new capability bits
      ppc/pnv: add XIVE Gen2 TIMA support
      pnv/xive2: Add support XIVE2 P9-compat mode (or Gen1)
      xive2: Add a get_config() handler for the router configuration
      pnv/xive2: Add support for automatic save&restore
      pnv/xive2: Add support for 8bits thread id

Daniel Henrique Barboza (19):
      ppc/pnv: fix default PHB4 QOM hierarchy
      target/ppc: make power8-pmu.c CONFIG_TCG only
      target/ppc: finalize pre-EBB PMU logic
      target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
      target/ppc: trigger PERFM EBBs from power8-pmu.c
      hw/ppc/spapr.c: use g_autofree in spapr_dt_chosen()
      hw/ppc/spapr.c: fail early if no firmware found in machine_init()
      hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_set_string()
      hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_get_string()
      hw/ppc/spapr_caps.c: use g_autofree in spapr_caps_add_properties()
      hw/ppc/spapr_drc.c: use g_auto in spapr_dt_drc()
      hw/ppc/spapr_drc.c: use g_autofree in drc_realize()
      hw/ppc/spapr_drc.c: use g_autofree in drc_unrealize()
      hw/ppc/spapr_drc.c: use g_autofree in spapr_dr_connector_new()
      hw/ppc/spapr_drc.c: use g_autofree in spapr_drc_by_index()
      hw/ppc/spapr_numa.c: simplify spapr_numa_write_assoc_lookup_arrays()
      spapr_pci_nvlink2.c: use g_autofree in spapr_phb_nvgpu_ram_populate_d=
t()
      hw/ppc/spapr_rtas.c: use g_autofree in rtas_ibm_get_system_parameter()
      hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice()

Leandro Lupori (2):
      target/ppc: implement plxsd/pstxsd
      target/ppc: implement plxssp/pstxssp

Lucas Coutinho (3):
      target/ppc: Move vexts[bhw]2[wd] to decodetree
      target/ppc: Implement vextsd2q
      target/ppc: implement lxvr[bhwd]/stxvr[bhwd]x

Lucas Mateus Castro (alqotel) (3):
      target/ppc: moved vector even and odd multiplication to decodetree
      target/ppc: Moved vector multiply high and low to decodetree
      target/ppc: vmulh* instructions without helpers

Luis Pires (1):
      target/ppc: Introduce TRANS*FLAGS macros

Matheus Ferst (29):
      target/ppc: Move Vector Compare Equal/Not Equal/Greater Than to decod=
etree
      target/ppc: Move Vector Compare Not Equal or Zero to decodetree
      target/ppc: Implement Vector Compare Equal Quadword
      target/ppc: Implement Vector Compare Greater Than Quadword
      target/ppc: Implement Vector Compare Quadword
      target/ppc: implement vstri[bh][lr]
      target/ppc: implement vclrlb
      target/ppc: implement vclrrb
      target/ppc: implement vcntmb[bhwd]
      target/ppc: implement vgnb
      target/ppc: move vs[lr][a][bhwd] to decodetree
      target/ppc: implement vslq
      target/ppc: implement vsrq
      target/ppc: implement vsraq
      target/ppc: move vrl[bhwd] to decodetree
      target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to decodetree
      target/ppc: implement vrlq
      target/ppc: implement vrlqnm
      target/ppc: implement vrlqmi
      target/ppc: Move vsel and vperm/vpermr to decodetree
      target/ppc: Move xxsel to decodetree
      target/ppc: move xxperm/xxpermr to decodetree
      target/ppc: Move xxpermdi to decodetree
      target/ppc: Implement xxpermx instruction
      tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
      target/ppc: Implement xxeval
      target/ppc: Implement xxgenpcv[bhwd]m instruction
      target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
      target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]

V=C3=ADctor Colombo (11):
      target/ppc: Implement vmsumcud instruction
      target/ppc: Implement vmsumudm instruction
      target/ppc: Implement xvtlsbb instruction
      target/ppc: Remove xscmpnedp instruction
      target/ppc: Refactor VSX_SCALAR_CMP_DP
      target/ppc: Implement xscmp{eq,ge,gt}qp
      target/ppc: Move xscmp{eq,ge,gt}dp to decodetree
      target/ppc: Move xs{max, min}[cj]dp to use do_helper_XX3
      target/ppc: Refactor VSX_MAX_MINC helper
      target/ppc: Implement xs{max,min}cqp
      target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions

 hw/intc/pnv_xive2_regs.h            |  442 ++++++++
 include/hw/pci-host/pnv_phb4.h      |   12 +
 include/hw/pci-host/pnv_phb4_regs.h |    3 +
 include/hw/ppc/pnv.h                |   39 +
 include/hw/ppc/pnv_homer.h          |    3 +
 include/hw/ppc/pnv_occ.h            |    2 +
 include/hw/ppc/pnv_xive.h           |   71 ++
 include/hw/ppc/pnv_xscom.h          |   15 +
 include/hw/ppc/xive.h               |   10 +-
 include/hw/ppc/xive2.h              |  109 ++
 include/hw/ppc/xive2_regs.h         |  210 ++++
 include/tcg/tcg-op-gvec.h           |   22 +
 target/ppc/cpu.h                    |   10 +-
 target/ppc/helper.h                 |  155 ++-
 target/ppc/power8-pmu.h             |    4 +-
 target/ppc/insn32.decode            |  234 +++-
 target/ppc/insn64.decode            |   56 +-
 hw/intc/pnv_xive.c                  |   37 +-
 hw/intc/pnv_xive2.c                 | 2128 +++++++++++++++++++++++++++++++=
++++
 hw/intc/spapr_xive.c                |   25 +
 hw/intc/xive.c                      |   77 +-
 hw/intc/xive2.c                     | 1018 +++++++++++++++++
 hw/pci-host/pnv_phb4.c              |  143 ++-
 hw/pci-host/pnv_phb4_pec.c          |   53 +
 hw/ppc/pnv.c                        |  227 +++-
 hw/ppc/pnv_homer.c                  |   64 ++
 hw/ppc/pnv_occ.c                    |   16 +
 hw/ppc/pnv_psi.c                    |   38 +-
 hw/ppc/spapr.c                      |   31 +-
 hw/ppc/spapr_caps.c                 |   22 +-
 hw/ppc/spapr_drc.c                  |   47 +-
 hw/ppc/spapr_numa.c                 |   16 +-
 hw/ppc/spapr_pci_nvlink2.c          |   10 +-
 hw/ppc/spapr_rtas.c                 |   25 +-
 hw/ppc/spapr_vio.c                  |    6 +-
 target/ppc/cpu_init.c               |   20 +-
 target/ppc/excp_helper.c            |   81 ++
 target/ppc/fpu_helper.c             |  219 ++--
 target/ppc/int_helper.c             |  406 ++++---
 target/ppc/machine.c                |    6 +-
 target/ppc/power8-pmu.c             |   39 +-
 target/ppc/translate.c              |   58 +-
 tcg/tcg-op-gvec.c                   |  146 +++
 target/ppc/translate/vmx-impl.c.inc | 1348 ++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |   59 +-
 target/ppc/translate/vsx-impl.c.inc |  842 +++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |   67 --
 tcg/ppc/tcg-target.c.inc            |    6 +
 hw/intc/meson.build                 |    4 +-
 hw/pci-host/trace-events            |    2 +
 target/ppc/meson.build              |    2 +-
 51 files changed, 7737 insertions(+), 948 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 include/hw/ppc/xive2.h
 create mode 100644 include/hw/ppc/xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c
 create mode 100644 hw/intc/xive2.c

