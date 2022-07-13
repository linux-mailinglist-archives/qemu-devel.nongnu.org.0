Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281DA5730C0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:17:43 +0200 (CEST)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXYz-0004np-Sq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBp-00089I-5K; Wed, 13 Jul 2022 03:53:46 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:60413
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBm-0002b7-Ib; Wed, 13 Jul 2022 03:53:44 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHR6VMgz4ySc;
 Wed, 13 Jul 2022 17:53:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHP48sHz4ySW;
 Wed, 13 Jul 2022 17:53:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>
Subject: [PULL 13/19] docs: aspeed: Minor updates
Date: Wed, 13 Jul 2022 09:52:49 +0200
Message-Id: <20220713075255.2248923-14-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Some more controllers have been modeled recently. Reflect that in the
list of supported devices. New machines were also added.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220706172131.809255-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 445095690c04..6c5b05128ea8 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -31,7 +31,10 @@ AST2600 SoC based machines :
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
 - ``rainier-bmc``          IBM Rainier POWER10 BMC
 - ``fuji-bmc``             Facebook Fuji BMC
+- ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
+- ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
+- ``qcom-firework-bmc``    Qualcomm Firework BMC
 
 Supported devices
 -----------------
@@ -40,7 +43,7 @@ Supported devices
  * Interrupt Controller (VIC)
  * Timer Controller
  * RTC Controller
- * I2C Controller
+ * I2C Controller, including the new register interface of the AST2600
  * System Control Unit (SCU)
  * SRAM mapping
  * X-DMA Controller (basic interface)
@@ -57,6 +60,10 @@ Supported devices
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
  * ADC
+ * Secure Boot Controller (AST2600)
+ * eMMC Boot Controller (dummy)
+ * PECI Controller (minimal)
+ * I3C Controller
 
 
 Missing devices
@@ -68,12 +75,10 @@ Missing devices
  * Super I/O Controller
  * PCI-Express 1 Controller
  * Graphic Display Controller
- * PECI Controller
  * MCTP Controller
  * Mailbox Controller
  * Virtual UART
  * eSPI Controller
- * I3C Controller
 
 Boot options
 ------------
@@ -154,6 +159,8 @@ Supported devices
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
  * ADC
+ * Secure Boot Controller
+ * PECI Controller (minimal)
 
 
 Missing devices
@@ -161,7 +168,6 @@ Missing devices
 
  * PWM and Fan Controller
  * Slave GPIO Controller
- * PECI Controller
  * Mailbox Controller
  * Virtual UART
  * eSPI Controller
-- 
2.35.3


