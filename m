Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA174C7151
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:08:43 +0100 (CET)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiZm-0005lh-Gd
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKK-0006hs-Hy; Mon, 28 Feb 2022 10:52:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53640
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKE-0000vi-Vg; Mon, 28 Feb 2022 10:52:44 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SF1RLs016473; 
 Mon, 28 Feb 2022 15:52:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh0p0sjf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:29 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFMhSu020777;
 Mon, 28 Feb 2022 15:52:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh0p0sjeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:29 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlTOK006135;
 Mon, 28 Feb 2022 15:52:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu983fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21SFqPa917367366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEEF34C046;
 Mon, 28 Feb 2022 15:52:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAE784C040;
 Mon, 28 Feb 2022 15:52:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ADE7A2201B4;
 Mon, 28 Feb 2022 16:52:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 00/18] ppc/pnv: Extend the powernv10 machin
Date: Mon, 28 Feb 2022 16:52:04 +0100
Message-Id: <20220228155222.643974-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OIY9OglfqGK4Wzfmb3EnqiOs8eSBFzsl
X-Proofpoint-ORIG-GUID: AJ-NbkM8zX8SNEUuLVlnsoeJ79auTJnM
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1034 bulkscore=0 mlxlogscore=284 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280083
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The skiboot merged in QEMU already has POWER10 support. This series
adds a minimum set of models (XIVE2, PHB5) to boot a baremetal POWER10
machine using the OpenPOWER firmware images.

The major change is the support for the interrupt controller of the
POWER10 processor. XIVE2 is very much like XIVE on POWER9 but the
register interface, the different MMIO regions, the XIVE internal
descriptors have gone through a major cleanup. It was easier to
duplicate the models then to try to adapt the current models.

XIVE2 adds new features. Only some are modeled :

  - Address-based trigger (AB5) mode. Activated by default on the
    PHB5. When using ABT [1], the PHB5 offloads [2] all interrupt
    management on the IC, this to improve latency.
=20=20=20=20
  - P9 compat mode. XIVE2 can be configured to provide a strict P9
    interface for the TIMA.
=20=20=20=20
  - Automatic save & restore of thread context registers. Used in
    KVM [3].
=20=20
  - 8bits thread id. Mostly to validate the model.

Thanks,

C.

[1] https://github.com/open-power/skiboot/commit/2a7e3d203496a016cc90ce91ee=
b2c4e680ebd1d2
[2] https://github.com/open-power/skiboot/commit/5b2d7c79a2049c1bedfaa8a9df=
a19880f980b2ef
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Df5af0a978776

Changes in v4:

  - rebased on upstream

Changes in v3:

  - rebased on upstream
=20=20=20
Changes in v2:

  - Most comments on v1 have been addressed independently and merged

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

 hw/intc/pnv_xive2_regs.h            |  442 ++++++
 include/hw/pci-host/pnv_phb4.h      |   12 +
 include/hw/pci-host/pnv_phb4_regs.h |    3 +
 include/hw/ppc/pnv.h                |   39 +
 include/hw/ppc/pnv_homer.h          |    3 +
 include/hw/ppc/pnv_occ.h            |    2 +
 include/hw/ppc/pnv_xive.h           |   71 +
 include/hw/ppc/pnv_xscom.h          |   15 +
 include/hw/ppc/xive.h               |   10 +-
 include/hw/ppc/xive2.h              |  109 ++
 include/hw/ppc/xive2_regs.h         |  210 +++
 hw/intc/pnv_xive.c                  |   37 +-
 hw/intc/pnv_xive2.c                 | 2128 +++++++++++++++++++++++++++
 hw/intc/spapr_xive.c                |   25 +
 hw/intc/xive.c                      |   77 +-
 hw/intc/xive2.c                     | 1018 +++++++++++++
 hw/pci-host/pnv_phb4.c              |  107 +-
 hw/pci-host/pnv_phb4_pec.c          |   53 +
 hw/ppc/pnv.c                        |  222 ++-
 hw/ppc/pnv_homer.c                  |   64 +
 hw/ppc/pnv_occ.c                    |   16 +
 hw/ppc/pnv_psi.c                    |   38 +-
 hw/intc/meson.build                 |    4 +-
 hw/pci-host/trace-events            |    2 +
 24 files changed, 4666 insertions(+), 41 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 include/hw/ppc/xive2.h
 create mode 100644 include/hw/ppc/xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c
 create mode 100644 hw/intc/xive2.c

--=20
2.34.1


