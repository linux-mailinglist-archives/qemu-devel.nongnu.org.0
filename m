Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12913FEEBA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:34:43 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmra-0000tv-Ms
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTa-0006WB-B6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:54 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTP-0001sV-IA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id F1B8B295DFF;
 Thu,  2 Sep 2021 15:09:31 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043a54f248-b5cc-4643-a9d0-950a90857438,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 00/20] ppc/pnv: Extend the powernv10 machine
Date: Thu, 2 Sep 2021 15:09:08 +0200
Message-ID: <20210902130928.528803-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 116f98ff-1d20-4301-90d9-98170d628d98
X-Ovh-Tracer-Id: 14774903004202699683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Changes in v2:

  - Most comments on v1 have been addressed independently and merged
    in ppc-for-6.2.

Cédric Le Goater (20):
  docs/system: ppc: Update the URL for OpenPOWER firmware images
  ppc/pnv: Add an assert when calculating the RAM distribution on chips
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

 docs/system/ppc/powernv.rst         |    3 +-
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
 hw/ppc/pnv.c                        |  267 +++-
 hw/ppc/pnv_homer.c                  |   64 +
 hw/ppc/pnv_occ.c                    |   16 +
 hw/ppc/pnv_psi.c                    |   38 +-
 hw/intc/meson.build                 |    4 +-
 hw/pci-host/trace-events            |    2 +
 25 files changed, 4680 insertions(+), 43 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 include/hw/ppc/xive2.h
 create mode 100644 include/hw/ppc/xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c
 create mode 100644 hw/intc/xive2.c

-- 
2.31.1


