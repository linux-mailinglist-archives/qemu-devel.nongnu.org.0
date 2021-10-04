Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464CE42136C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 18:02:10 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQPo-0007bu-68
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 12:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQB4-0001K5-1f
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:54 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAy-0001Ca-Ex
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D414321ABC;
 Mon,  4 Oct 2021 15:46:36 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a91b2e3d-af22-4da8-8225-9874c57d7b9a,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/4] aspeed/smc: Improve support for the alternate boot
 function
Date: Mon, 4 Oct 2021 17:46:31 +0200
Message-ID: <20211004154635.394258-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b76390c4-a03e-4caf-a19e-0f37c5433b23
X-Ovh-Tracer-Id: 2439825100510563110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The Aspeed SoCs have a dual boot function for firmware fail-over
recovery. The system auto-reboots from the second flash if the main
flash does not boot successfully within a certain amount of time. This
function is called alternate boot (ABR) in the FMC controllers.

On the AST2600, the ABR registers controlling the 2nd watchdog timer
were moved from the watchdog register to the FMC controller. To
control WDT2 through the FMC model register set, this series creates a
local address space on top of WDT2 memory region.

To test on the fuji-bmc machine, run :

    devmem 0x1e620064
    devmem 0x1e78504C 

    devmem 0x1e620064 32 0xffffffff
    devmem 0x1e620064
    devmem 0x1e78504C
    
Thanks

C.


Cédric Le Goater (4):
  aspeed/wdt: Add trace events
  aspeed/smc: Dump address offset in trace events
  aspeed/wdt: Add an alias for the MMIO region
  aspeed/smc: Improve support for the alternate boot function

 include/hw/ssi/aspeed_smc.h      |  3 ++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/arm/aspeed_ast2600.c          |  2 +
 hw/ssi/aspeed_smc.c              | 84 ++++++++++++++++++++++++++++++--
 hw/watchdog/wdt_aspeed.c         | 20 ++++++--
 hw/ssi/trace-events              |  1 +
 hw/watchdog/trace-events         |  4 ++
 7 files changed, 107 insertions(+), 8 deletions(-)

-- 
2.31.1


