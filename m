Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8C3A8425
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:38:34 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltB97-00058z-Fj
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6T-0001Ve-Hb; Tue, 15 Jun 2021 11:35:49 -0400
Received: from zamok.crans.org ([185.230.79.1]:60226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6I-0004kv-8x; Tue, 15 Jun 2021 11:35:49 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 7FBBBE008B; Tue, 15 Jun 2021 17:35:28 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2 0/3] STM32VLDISCOVERY Machine Model
Date: Tue, 15 Jun 2021 17:34:37 +0200
Message-Id: <20210615153440.1307729-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds the STM32VLDISCOVERY Machine to QEMU

Information on the board is available at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

Alexandre Iooss (3):
  stm32f100: Add the stm32f100 SoC
  stm32vldiscovery: Add the STM32VLDISCOVERY Machine
  docs/system: arm: Add stm32 boards description

 MAINTAINERS                             |  13 ++
 default-configs/devices/arm-softmmu.mak |   1 +
 docs/system/arm/stm32.rst               |  66 +++++++++
 docs/system/target-arm.rst              |   1 +
 hw/arm/Kconfig                          |  10 ++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
 hw/arm/stm32vldiscovery.c               |  66 +++++++++
 include/hw/arm/stm32f100_soc.h          |  57 ++++++++
 9 files changed, 398 insertions(+)
 create mode 100644 docs/system/arm/stm32.rst
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 hw/arm/stm32vldiscovery.c
 create mode 100644 include/hw/arm/stm32f100_soc.h

-- 
2.25.1


