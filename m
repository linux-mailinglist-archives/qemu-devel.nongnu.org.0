Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD9569090
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:23:07 +0200 (CEST)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98jy-0007ds-FQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dv4w=XL=kaod.org=clg@ozlabs.org>)
 id 1o98ik-0006m7-Bn; Wed, 06 Jul 2022 13:21:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dv4w=XL=kaod.org=clg@ozlabs.org>)
 id 1o98ii-0005nT-5s; Wed, 06 Jul 2022 13:21:50 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LdRD32NSvz4xZB;
 Thu,  7 Jul 2022 03:21:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LdRD03zn3z4xTq;
 Thu,  7 Jul 2022 03:21:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] docs: aspeed: Minor updates
Date: Wed,  6 Jul 2022 19:21:31 +0200
Message-Id: <20220706172131.809255-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=dv4w=XL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Some more controllers have been modeled recently. Reflect that in the
list of supported devices. New machines were also added.

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


