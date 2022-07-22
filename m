Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4657DA88
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:01:28 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmf9-0001nh-Qv
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHL-0008FB-Pa; Fri, 22 Jul 2022 02:36:53 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHK-00018X-4F; Fri, 22 Jul 2022 02:36:51 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq08b319Wz4xGJ;
 Fri, 22 Jul 2022 16:36:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq08W3Fqtz4xFy;
 Fri, 22 Jul 2022 16:36:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Date: Fri, 22 Jul 2022 08:36:02 +0200
Message-Id: <20220722063602.128144-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722063602.128144-1-clg@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

A mx25l25635f chip model is generally found on these machines. It's
newer and uses 4B opcodes which is better to exercise the support in
the Linux kernel.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1c611284819d..7e95abc55b09 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1157,7 +1157,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2400-a1";
     amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
     amc->fmc_model = "n25q256a";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size       = 256 * MiB;
@@ -1208,7 +1208,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
     amc->fmc_model = "mx25l25635e";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
@@ -1258,7 +1258,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
     mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
-    amc->fmc_model = "mx25l25635e";
+    amc->fmc_model = "mx25l25635f";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
     amc->i2c_init  = witherspoon_bmc_i2c_init;
-- 
2.35.3


