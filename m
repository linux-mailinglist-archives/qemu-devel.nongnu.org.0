Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD645ED79
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:07:50 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa17-0006SC-II
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnh-0003Ml-68
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:53:57 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:42323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZne-0007Rj-Nf
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:53:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DD484CE26EF7;
 Fri, 26 Nov 2021 12:53:51 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0061415a4d5-9839-4abd-b1f2-7ca37a6e4b9a,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 00/18] ppc/pnv: Extend the powernv10 machine
Date: Fri, 26 Nov 2021 12:53:31 +0100
Message-ID: <20211126115349.2737605-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1a3e86de-5d6c-47f4-9f68-b4af82926787
X-Ovh-Tracer-Id: 14613899316411403116
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegieeugfeljeetgfdtkeekteehieeujeeujeefieeggeevvddujedthffgueduteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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

XIVE2 adds some new set of features. Only some are modeled :

  - Address-based trigger (AB5) mode. Activated by default on the
    PHB5. When using ABT [1], the PHB5 offloads [2] all interrupt
    management on the IC, this to improve latency.
    
  - P9 compat mode. XIVE2 can be configured to provide a strict P9
    interface for the TIMA.
    
  - Automatic save & restore of thread context registers. Used in
    KVM [3].
  
  - 8bits thread id. Mostly to validate the model.

Thanks,

C.

[1] https://github.com/open-power/skiboot/commit/2a7e3d203496a016cc90ce91eeb2c4e680ebd1d2
[2] https://github.com/open-power/skiboot/commit/5b2d7c79a2049c1bedfaa8a9dfa19880f980b2ef
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5af0a978776

Changes in v3:

  - rebased on upstream
   
Changes in v2:

  - Most comments on v1 have been addressed independently and merged

Cédric Le Goater (18):
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
 include/hw/pci-host/pnv_phb4.h      |   11 +
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
 hw/intc/pnv_xive2.c                 | 2127 +++++++++++++++++++++++++++
 hw/intc/spapr_xive.c                |   25 +
 hw/intc/xive.c                      |   77 +-
 hw/intc/xive2.c                     | 1017 +++++++++++++
 hw/pci-host/pnv_phb4.c              |   87 +-
 hw/pci-host/pnv_phb4_pec.c          |   44 +
 hw/ppc/pnv.c                        |  265 +++-
 hw/ppc/pnv_homer.c                  |   64 +
 hw/ppc/pnv_occ.c                    |   16 +
 hw/ppc/pnv_psi.c                    |   38 +-
 hw/intc/meson.build                 |    4 +-
 hw/pci-host/trace-events            |    2 +
 24 files changed, 4677 insertions(+), 41 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 include/hw/ppc/xive2.h
 create mode 100644 include/hw/ppc/xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c
 create mode 100644 hw/intc/xive2.c

-- 
2.31.1


