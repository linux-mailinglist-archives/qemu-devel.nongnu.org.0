Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510665544FC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:58:18 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3x7p-0000BU-48
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5J-0005gX-0I; Wed, 22 Jun 2022 05:55:41 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5G-0004hm-9N; Wed, 22 Jun 2022 05:55:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzf1Mfjz4xYD;
 Wed, 22 Jun 2022 19:55:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzc2XQGz4xD9;
 Wed, 22 Jun 2022 19:55:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/19] aspeed queue
Date: Wed, 22 Jun 2022 11:55:01 +0200
Message-Id: <20220622095520.3683321-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f200ff158d5abcb974a6b597a962b6b2fbea2b06:

  Merge tag 'pull-tcg-20220621' of https://gitlab.com/rth7680/qemu into staging (2022-06-21 13:47:20 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220622

for you to fetch changes up to 92a45bde8cf4257f755ce718fbf7db5f2d607a15:

  hw: m25p80: fixing individual test failure when tests are running in isolation (2022-06-22 09:49:34 +0200)

----------------------------------------------------------------
aspeed queue:

* Extra avocado tests using buildroot images
* Conversion of the I2C model to the registerfield interface
* Support for the I2C new register interface on AST2600
* Various I2C enhancements
* I2C support for the AST1030
* Improvement of the Aspeed SMC and m25p80 qtest

----------------------------------------------------------------
Cédric Le Goater (8):
      aspeed: Remove fake RTC device on ast2500-evb
      test/avocado/machine_aspeed.py: Move OpenBMC tests
      test/avocado/machine_aspeed.py: Add tests using buildroot images
      test/avocado/machine_aspeed.py: Add I2C tests to ast2500-evb
      test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
      test/avocado/machine_aspeed.py: Add an I2C RTC test
      aspeed/i2c: Add ast1030 controller models
      aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always

Iris Chen (1):
      hw: m25p80: fixing individual test failure when tests are running in isolation

Joe Komlodi (6):
      hw/registerfields: Add shared fields macros
      aspeed: i2c: Migrate to registerfields API
      aspeed: i2c: Use reg array instead of individual vars
      aspeed: i2c: Add new mode support
      aspeed: i2c: Add PKT_DONE IRQ to trace
      aspeed: i2c: Move regs and helpers to header file

Joel Stanley (1):
      aspeed/hace: Add missing newlines to unimp messages

Klaus Jensen (2):
      hw/i2c/aspeed: rework raise interrupt trace event
      hw/i2c/aspeed: add DEV_ADDR in old register mode

Troy Lee (1):
      aspeed: Add I2C buses to AST1030 model

 include/hw/i2c/aspeed_i2c.h         | 289 ++++++++++++-
 include/hw/registerfields.h         |  70 +++
 hw/arm/aspeed.c                     |  17 +-
 hw/arm/aspeed_ast10x0.c             |  18 +
 hw/i2c/aspeed_i2c.c                 | 820 ++++++++++++++++++++++--------------
 hw/misc/aspeed_hace.c               |   4 +-
 tests/qtest/aspeed_smc-test.c       |  74 +++-
 hw/i2c/trace-events                 |   2 +-
 tests/avocado/boot_linux_console.py |  43 --
 tests/avocado/machine_aspeed.py     | 136 ++++++
 10 files changed, 1095 insertions(+), 378 deletions(-)

