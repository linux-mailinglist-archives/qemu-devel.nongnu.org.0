Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527F409A56
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:06:47 +0200 (CEST)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpPq-0005vx-II
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoaF-00040X-Of
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:13:29 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:54901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa9-0000gj-Jh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:13:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6CE2620F7B;
 Mon, 13 Sep 2021 16:13:10 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016d31dd0a-b22b-4840-b1b4-e2c8fdbe2d8b,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] aspeed queue
Date: Mon, 13 Sep 2021 18:12:50 +0200
Message-ID: <20210913161304.3805652-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 13ad9dbf-961a-4d81-a320-14c1e476f21e
X-Ovh-Tracer-Id: 8689132531712035622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedtieekkeelgfduvdeijeeujefhheefjedtleegtdehteejteduuddtjeefjeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80f5:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13' into staging (2021-09-13 11:00:30 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210913

for you to fetch changes up to d7add12e20fa8982f5932ff4dca317c5d2dfe7d9:

  hw/arm/aspeed: Add Fuji machine type (2021-09-13 15:19:20 +0200)

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
 hw/arm/aspeed.c                  | 175 ++++++++++++++++++++++++++++--
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
 15 files changed, 522 insertions(+), 76 deletions(-)
 create mode 100644 hw/sensor/dps310.c

