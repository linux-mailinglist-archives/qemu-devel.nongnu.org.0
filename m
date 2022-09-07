Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2A5B002B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:18:28 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrCV-0003E9-9D
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4x-0004vX-8b
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4u-0004pz-JZ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537991; x=1694073991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbWza4xHbVq2N6+uuUpys/RBAEeQj9My/bU3ni4I/q4=;
 b=KYfOQ5kS3/mpqLv9oov8jP04eSW5tQXMp4oT4Vl2cnNU6z76ffXNKzSW
 U7H49Dd6wY3Z2LSwtrSrzfquayMq4Uj71KcHPbPga2uxDlOgDnzkcZRFm
 GAi/Y8f/yQAPRWavjfcDS9F81RbZGWc9AHgZcL7imaCC1ocpLenBF7Lnl
 OupsS2Kg943B0Vs5PP0f5eIUlX3wHZlhXuMPN37uHUzWh8DMnyyFI05Pq
 e9DN/XfjRw1TK0dA0Weub2y0XtbQaXl2Ch0m+Qc3dY7wnvOBBN38nDADO
 Gev1ZPkDJ6jKkVV3TPbXVzYukPt1ZGcie+nNCYx8KDTc50qyT5IZUpPZG g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715106"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:16 +0800
IronPort-SDR: MR2dfEYs5/T6qgYDfjbTMpDqx4GrlTENzjtZ0n6eH941R1Qe4df45BnNGl+JAYZYl3PvWQbB0S
 r8YEi4sPdhvHxEjaE3zYxdXdIumP4suR+utLDuALWKxuEoNDiBAO8wXkUem+CRBe5XT2POWFU9
 Y84uUM50bk12Smd2eNjZQshUPtlKGXMs/5/6bnpRBwtXPA0UE1yHX6g2NkbQ+wkOypSTfVOBCU
 ybMlghjr8o/+B7hAJWI/2zD3hOht7tghu4wYtoFWovwSMK/65coCstDxeftumLD6P9FAMsX/bs
 ZXeoIu6Xfd8HCiZXRr1rmgim
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:15 -0700
IronPort-SDR: wb5cwwMfLe9p5xftbC4x9Lnxq047B0uINB5p2t5zJ2kDV+B0hW8hfrZIdC3M7f5IkDHojfcCl6
 aQlbYnpLSyCmc/M8wT5Su/va/7ZmyfgkNDMesU5uku6uk4vQVwPMVWnAtZtDUqduPODaFHIuRg
 0KG3TztLqT21EWmxJFSKWWaMlDLuHq8GVQ2tKMUjtAU0R8URk3xtXlZIEsXYEN5SXqrFFfdUNe
 Gg6SL42FSgJHB5z3Z2bKpEMxP4gXolIZG57adeIEWLoh8Z+xjbW6KWJBbyYrxW4OQjCrM8wJG0
 OW8=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:17 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/44] hw/core: fix platform bus node name
Date: Wed,  7 Sep 2022 10:03:43 +0200
Message-Id: <20220907080353.111926-35-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Message-id: 20220810184612.157317-5-mail@conchuod.ie
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.2


