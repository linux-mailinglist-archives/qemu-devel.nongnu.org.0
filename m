Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C803E46F7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:55:48 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5kp-0001Ht-Md
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5ba-0000Zz-Ig; Mon, 09 Aug 2021 09:46:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bW-0000zy-NF; Mon, 09 Aug 2021 09:46:14 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYVVx061286; Mon, 9 Aug 2021 09:45:54 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aax6c3jf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:45:54 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DhA9i024985;
 Mon, 9 Aug 2021 13:45:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3a9hehc32t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:45:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DjnnT55705954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:45:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE08FAE045;
 Mon,  9 Aug 2021 13:45:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 895C6AE04D;
 Mon,  9 Aug 2021 13:45:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BCB05220032;
 Mon,  9 Aug 2021 15:45:48 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 00/26] ppc/pnv: Extend the powernv10 machine
Date: Mon,  9 Aug 2021 15:45:21 +0200
Message-Id: <20210809134547.689560-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JGIPaCFDVPit98dDJQ3hltU5rx2Bd_7P
X-Proofpoint-ORIG-GUID: JGIPaCFDVPit98dDJQ3hltU5rx2Bd_7P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1034 impostorscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=371 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds the minimum set of models (XIVE2, PHB5) to boot a
baremetal POWER10 machine using the OpenPOWER firmware images.

The major change is the support for the interrupt controller of the
POWER10 processor. XIVE2 is very much like XIVE but the register
interface, the different MMIO regions, the XIVE internal descriptors
have gone through a major cleanup. It was easier to duplicate the
models then to try to adapt the current models. XIVE2 adds some new
set of features. Not all are modeled here but we add the
"Address-based trigger" mode which is activated by default on the
PHB5. When using ABT, the PHB5 offloads all interrupt management on
the IC, this to improve latency.

Thanks,

C.

C=C3=A9dric Le Goater (26):
  ppc: Add a POWER10 DD2 CPU
  ppc/pnv: Change the POWER10 machine to support DD2 only
  ppc/pnv: powerpc_excp: Do not discard HDECR exception when entering
    power-saving mode
  ppc/pnv: Use a simple incrementing index for the chip-id
  ppc/pnv: Distribute RAM among the chips
  ppc/pnv: add a chip topology index for POWER10
  ppc/xive: Export PQ get/set routines
  ppc/xive: Export xive_presenter_notify()
  ppc/xive2: Introduce a XIVE2 core framework
  ppc/xive2: Introduce a presenter matching routine
  ppc/pnv: Add a XIVE2 controller to the POWER10 chip.
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

 hw/intc/pnv_xive2_regs.h            |  442 ++++++
 include/hw/pci-host/pnv_phb4.h      |   11 +
 include/hw/pci-host/pnv_phb4_regs.h |    3 +
 include/hw/ppc/pnv.h                |   74 +-
 include/hw/ppc/pnv_homer.h          |    3 +
 include/hw/ppc/pnv_occ.h            |    2 +
 include/hw/ppc/pnv_xive.h           |   75 +
 include/hw/ppc/pnv_xscom.h          |   15 +
 include/hw/ppc/xive.h               |   18 +-
 include/hw/ppc/xive2.h              |  115 ++
 include/hw/ppc/xive2_regs.h         |  210 +++
 target/ppc/cpu-models.h             |    1 +
 hw/intc/pnv_xive.c                  |   37 +-
 hw/intc/pnv_xive2.c                 | 2127 +++++++++++++++++++++++++++
 hw/intc/spapr_xive.c                |   25 +
 hw/intc/spapr_xive_kvm.c            |    8 +-
 hw/intc/xive.c                      |   91 +-
 hw/intc/xive2.c                     | 1028 +++++++++++++
 hw/pci-host/pnv_phb4.c              |   87 +-
 hw/pci-host/pnv_phb4_pec.c          |   44 +
 hw/ppc/pnv.c                        |  294 +++-
 hw/ppc/pnv_core.c                   |    2 +-
 hw/ppc/pnv_homer.c                  |   64 +
 hw/ppc/pnv_occ.c                    |   16 +
 hw/ppc/pnv_psi.c                    |   38 +-
 hw/ppc/pnv_xscom.c                  |    2 +
 target/ppc/cpu-models.c             |    4 +-
 target/ppc/cpu_init.c               |    3 +
 target/ppc/excp_helper.c            |    6 -
 hw/intc/meson.build                 |    4 +-
 hw/pci-host/trace-events            |    2 +
 31 files changed, 4760 insertions(+), 91 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 include/hw/ppc/xive2.h
 create mode 100644 include/hw/ppc/xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c
 create mode 100644 hw/intc/xive2.c

--=20
2.31.1


