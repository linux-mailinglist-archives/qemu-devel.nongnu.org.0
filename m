Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB8A9561
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 23:43:45 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5d44-00028W-2s
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 17:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cBQ-00081E-WA
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cBP-0000fI-6c
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:47:16 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:38271)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cBO-0000d7-W6
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:47:15 -0400
Received: from player691.ha.ovh.net (unknown [10.108.42.5])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 9E57F204ED8
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 22:47:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 9EA0D98B278B;
 Wed,  4 Sep 2019 20:47:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:44 +0200
Message-Id: <20190904204659.13878-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2508504995051244305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.129
Subject: [Qemu-devel] [RFC PATCH 00/15] aspeed: Add support for the AST2600
 SoC
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The most important Aspeed models are reworked with an object class to
introduce the AST2600 variant. A model for the AST2600 SoC and a
simple AST2600 EVB machine is proposed at the end of the series. It
can boot the OpenBMC firmware image which is currently used for HW
bringup.

I would like to have some feedback on the approach taken to
instantiate the correct type of a device model for a given SoC and
also on the AST2600 SoC model itself as it has some significant
difference with the previous.

This series is based on the previous Aspeed series :

  http://patchwork.ozlabs.org/cover/1157492/

Thanks,

C.

C=C3=A9dric Le Goater (9):
  aspeed/timer: Introduce an object class per SoC
  aspeed/timer: Add support for control register 3
  aspeed/timer: Add support for AST2600
  aspeed/timer: Add support for IRQ status register on the AST2600
  aspeed/sdmc: Introduce an object class per SoC
  watchdog/aspeed: Introduce an object class per SoC
  aspeed/smc: Add support for the AST2600 SoC
  aspeed: add support for the AST2600 eval board
  aspeed: add support for the Aspeed MII controller of the AST2600

Joel Stanley (5):
  hw: aspeed_scu: Add AST2600 support
  aspeed/sdmc: Add AST2600 support
  hw: wdt_aspeed: Add AST2600 support
  aspeed: Parameterise number of MACs
  aspeed/soc: Add ASPEED Video stub

Rashmica Gupta (1):
  hw/gpio: Add in AST2600 specific implementation

 include/hw/arm/aspeed_soc.h      |  17 ++-
 include/hw/misc/aspeed_scu.h     |   8 +-
 include/hw/misc/aspeed_sdmc.h    |  20 ++-
 include/hw/net/ftgmac100.h       |  17 +++
 include/hw/ssi/aspeed_smc.h      |   2 +
 include/hw/timer/aspeed_timer.h  |  18 +++
 include/hw/watchdog/wdt_aspeed.h |  19 ++-
 hw/arm/aspeed.c                  |  18 +++
 hw/arm/aspeed_soc.c              | 243 +++++++++++++++++++++++++++---
 hw/gpio/aspeed_gpio.c            | 142 +++++++++++++++++-
 hw/misc/aspeed_scu.c             | 186 ++++++++++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 250 +++++++++++++++++++++++--------
 hw/net/ftgmac100.c               | 162 ++++++++++++++++++++
 hw/ssi/aspeed_smc.c              | 129 +++++++++++++++-
 hw/timer/aspeed_timer.c          | 209 +++++++++++++++++++++++---
 hw/watchdog/wdt_aspeed.c         | 151 ++++++++++++-------
 16 files changed, 1403 insertions(+), 188 deletions(-)

--=20
2.21.0


