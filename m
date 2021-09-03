Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB44400630
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:53:57 +0200 (CEST)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFG7-0001wj-MY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF43-00047q-UK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:27 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:59113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF3x-0002EY-FR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E72AE200FB;
 Fri,  3 Sep 2021 19:41:10 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00554399cb2-b15e-4992-a51e-961bc0883cf8,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] aspeed queue
Date: Fri, 3 Sep 2021 21:40:54 +0200
Message-ID: <20210903194108.131403-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 112cc02d-c77f-4a06-8bf1-8e09f8552cbf
X-Ovh-Tracer-Id: 8815233322417097510
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210903

for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:

  hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)

----------------------------------------------------------------
Aspeed patches :

* MAC enablement fixes (Guenter)
* Watchdog  and pca9552 fixes (Andrew)
* GPIO fixes (Joel)
* AST2600A3 SoC and DPS310 models (Joel)
* New Fuji BMC machine (Peter)

----------------------------------------------------------------
Andrew Jeffery (3):
      watchdog: aspeed: Sanitize control register values
      watchdog: aspeed: Fix sequential control writes
      misc/pca9552: Fix LED status register indexing in pca955x_get_led()

Guenter Roeck (2):
      hw: arm: aspeed: Enable eth0 interface for aspeed-ast2600-evb
      hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for g220a

Joel Stanley (6):
      hw: aspeed_gpio: Simplify 1.8V defines
      hw: aspeed_gpio: Clarify GPIO controller name
      arm/aspeed: rainier: Add i2c eeproms and muxes
      aspeed: Emulate the AST2600A3
      hw/misc: Add Infineon DPS310 sensor model
      arm/aspeed: Add DPS310 to Witherspoon and Rainier

Peter Delevoryas (3):
      hw/arm/aspeed: Initialize AST2600 UART clock selection registers
      hw/arm/aspeed: Allow machine to set UART default
      hw/arm/aspeed: Add Fuji machine type

 include/hw/arm/aspeed.h          |   1 +
 include/hw/arm/aspeed_soc.h      |   1 +
 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/watchdog/wdt_aspeed.h |   1 +
 hw/arm/aspeed.c                  | 178 +++++++++++++++++++++++++++++--
 hw/arm/aspeed_ast2600.c          |  14 +--
 hw/arm/aspeed_soc.c              |   8 +-
 hw/gpio/aspeed_gpio.c            |  97 +++++++++--------
 hw/misc/aspeed_scu.c             |  40 +++++--
 hw/misc/pca9552.c                |   2 +-
 hw/sensor/dps310.c               | 225 +++++++++++++++++++++++++++++++++++++++
 hw/watchdog/wdt_aspeed.c         |  26 ++++-
 hw/arm/Kconfig                   |   1 +
 hw/sensor/Kconfig                |   4 +
 hw/sensor/meson.build            |   1 +
 15 files changed, 525 insertions(+), 76 deletions(-)
 create mode 100644 hw/sensor/dps310.c

