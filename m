Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08943736F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:03:46 +0200 (CEST)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdpWj-0003xV-LJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQv-0004Oc-HN
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:45 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:50241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQm-0002rW-PK
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B119F21104;
 Fri, 22 Oct 2021 07:57:32 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:57:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ee643519-0c25-41ca-939b-08e5286bc203,
 74C1FF3A6B8BFE8186BF38A421BAA83045AEA3E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] aspeed queue
Date: Fri, 22 Oct 2021 09:57:27 +0200
Message-ID: <20211022075730.484692-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57722aff-18f6-4b15-8057-6321ce2553c4
X-Ovh-Tracer-Id: 7992763441195158310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20211022

for you to fetch changes up to b12fa6118f4d838d19720ec6476a1666a1b43474:

  speed/sdhci: Add trace events (2021-10-22 09:52:17 +0200)

----------------------------------------------------------------
Aspeed patches :

* New fp5280g2-bmc board (John)
* Small cleanup in Aspeed SMC model (Cedric)

----------------------------------------------------------------
Cédric Le Goater (2):
      aspeed/smc: Use a container for the flash mmio address space
      speed/sdhci: Add trace events

John Wang (1):
      aspeed: Add support for the fp5280g2-bmc board

 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/arm/aspeed.c             | 74 +++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/aspeed_sdhci.c        |  5 +++
 hw/ssi/aspeed_smc.c         | 11 ++++---
 hw/sd/trace-events          |  4 +++
 5 files changed, 91 insertions(+), 5 deletions(-)

