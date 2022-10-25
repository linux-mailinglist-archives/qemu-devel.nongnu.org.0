Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9ED60D0B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLkY-0008UK-2P; Tue, 25 Oct 2022 11:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkU-0008Rp-71; Tue, 25 Oct 2022 11:21:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkS-00051u-K3; Tue, 25 Oct 2022 11:21:49 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbJT55J6z4xGk;
 Wed, 26 Oct 2022 02:21:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbJQ6TKCz4xGG;
 Wed, 26 Oct 2022 02:21:42 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 16/16] arm/aspeed: Replace mx25l25635e chip model
Date: Tue, 25 Oct 2022 17:20:42 +0200
Message-Id: <20221025152042.278287-17-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A mx25l25635f chip model is generally found on these machines. It's
newer and uses 4B opcodes which is better to exercise the support in
the Linux kernel.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-9-clg@kaod.org>
Message-Id: <20221013161241.2805140-11-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc5c1e167773..f8bc6d4a1406 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1099,7 +1099,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2400-a1";
     amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
     amc->fmc_model = "n25q256a";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size       = 256 * MiB;
@@ -1150,7 +1150,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
     amc->fmc_model = "mx25l25635e";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
@@ -1200,7 +1200,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
     mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
-    amc->fmc_model = "mx25l25635e";
+    amc->fmc_model = "mx25l25635f";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
     amc->i2c_init  = witherspoon_bmc_i2c_init;
-- 
2.37.3


