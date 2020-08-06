Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A423DAB4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 15:26:33 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3fui-0001vk-AM
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 09:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpe-0001Gz-HM; Thu, 06 Aug 2020 09:21:18 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpZ-0000tV-BW; Thu, 06 Aug 2020 09:21:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BF0474DAE2AB;
 Thu,  6 Aug 2020 15:21:08 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053f3e17a0-b33b-4a08-9b3a-0aa6ab0db0cc,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 00/19] aspeed: mostly cleanups and some extensions
Date: Thu, 6 Aug 2020 15:20:47 +0200
Message-ID: <20200806132106.747414-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2ed42eb-d824-4af0-8202-4a73f2f3f160
X-Ovh-Tracer-Id: 271341881511545638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Various fixes improving the support of Aspeed machines.

Thanks,

C.

Cédric Le Goater (16):
  m25p80: Return the JEDEC ID twice for mx25l25635e
  m25p80: Add support for mx25l25635f
  m25p80: Add support for n25q512ax3
  aspeed/scu: Fix valid access size on AST2400
  aspeed/smc: Fix MemoryRegionOps definition
  aspeed/smc: Fix max_slaves of the legacy SMC device
  aspeed/sdhci: Fix reset sequence
  ftgmac100: Fix registers that can be read
  ftgmac100: Fix interrupt status "Packet transmitted on ethernet"
  ftgmac100: Fix interrupt status "Packet moved to RX FIFO"
  ftgmac100: Change interrupt status when a DMA error occurs
  ftgmac100: Check for invalid len and address before doing a DMA
    transfer
  ftgmac100: Fix integer overflow in ftgmac100_do_tx()
  ftgmac100: Improve software reset
  aspeed/sdmc: Simplify calculation of RAM bits
  aspeed/smc: Open AHB window of the second chip of the AST2600 FMC
    controller

Joel Stanley (2):
  aspeed/sdmc: Perform memory training
  aspeed/sdmc: Allow writes to unprotected registers

erik-smit (1):
  hw/arm/aspeed: Add board model for Supermicro X11 BMC

 include/hw/misc/aspeed_sdmc.h |  13 +++-
 hw/arm/aspeed.c               |  35 ++++++++++
 hw/block/m25p80.c             |   4 +-
 hw/misc/aspeed_scu.c          |   9 +--
 hw/misc/aspeed_sdmc.c         | 125 +++++++++++++++++++---------------
 hw/net/ftgmac100.c            |  45 ++++++++----
 hw/sd/aspeed_sdhci.c          |  10 ++-
 hw/ssi/aspeed_smc.c           |   6 +-
 8 files changed, 167 insertions(+), 80 deletions(-)

-- 
2.25.4


