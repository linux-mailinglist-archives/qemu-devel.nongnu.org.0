Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513E4665BB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:47:57 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnNM-00014R-Ht
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:47:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIL-0000PX-3f
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:45 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIG-0005ET-IE
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D42CD2205F;
 Thu,  2 Dec 2021 14:42:37 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001cd160538-621a-41f9-9d7f-d43f66d0d91c,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 00/14] ppc/pnv: Add support for user created PHB3/PHB4 devices
Date: Thu, 2 Dec 2021 15:42:21 +0100
Message-ID: <20211202144235.1276352-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41380790-7a66-40ab-adf5-f80183cc6284
X-Ovh-Tracer-Id: 15806790267990149926
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On the POWER8 processor, powernv8 machine, PHB3 devices can simply be
created with :

   -device pnv-phb3,chip-id=0,index=1 

with a maximum of 3 PHB3s per chip, each PHB3 adding a new PCIe bus.

On the POWER9 processor, powernv9 machine, the logic is different. The
the chip comes with 3 PHB4 PECs (PCI Express Controller) and each PEC
can have several PHBs :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

The PEC devices can be created with :

   -device pnv-phb4-pec,chip-id=0,index=1

And the number of added PHB4 devices depends on the PEC index. Each
PHB4 adds a new PCIe bus.

The following changes are mostly cleanups and improvements of the
PHB3/4 realize routines to enable support. One important change is
related to the way the powernv machine populates the device tree. It
depends on the object hierarchy and it is necessary to reparent user
created devices to the chip they belong to (see PATCH 5). PHB3 is a
little more sophisticated because of its SysBusDevice nature (see
PATCH 6).

Thanks,

C.

Cédric Le Goater (14):
  ppc/pnv: Reduce the maximum of PHB3 devices
  ppc/pnv: Drop "num-phbs" property
  ppc/pnv: Move mapping of the PHB3 CQ regions under pnv_pbcq_realize()
  ppc/pnv: Introduce support for user created PHB3 devices
  ppc/pnv: Reparent user created PHB3 devices to the PnvChip
  ppc/pnv: Complete user created PHB3 devices
  ppc/pnv: Introduce a num_pecs class attribute for PHB4 PEC devices
  ppc/pnv: Introduce version and device_id class atributes for PHB4
    devices
  ppc/pnv: Introduce a "chip" property under the PHB4 model
  ppc/pnv: Introduce a num_stack class attribute
  ppc/pnv: Compute the PHB index from the PHB4 PEC model
  ppc/pnv: Remove "system-memory" property for he PHB4 PEC model
  ppc/pnv: Move realize of PEC stacks under the PEC model
  ppc/pnv: Introduce support for user created PHB4 devices

 include/hw/pci-host/pnv_phb3.h |   3 +
 include/hw/pci-host/pnv_phb4.h |   5 ++
 include/hw/ppc/pnv.h           |   7 +-
 hw/pci-host/pnv_phb3.c         |  27 ++++++-
 hw/pci-host/pnv_phb3_pbcq.c    |  11 +++
 hw/pci-host/pnv_phb4_pec.c     |  96 ++++++++++++++++++++++---
 hw/ppc/pnv.c                   | 125 ++++++++++++++-------------------
 7 files changed, 190 insertions(+), 84 deletions(-)

-- 
2.31.1


