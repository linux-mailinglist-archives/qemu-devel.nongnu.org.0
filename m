Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1D670D4C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvK1-00022p-US; Tue, 17 Jan 2023 18:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJy-000201-NS; Tue, 17 Jan 2023 18:24:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJr-0003K3-Q8; Tue, 17 Jan 2023 18:24:47 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B91FE5C0148;
 Tue, 17 Jan 2023 18:24:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 18:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673997879; x=
 1674084279; bh=mbrmB4JWFUSHT6LTEGlg7GdnuCT3OTDuo2m7Xz6KuJQ=; b=K
 D4XAd4WOtnwoH03hbk6WAf1TpuJvGWBS0c1DpCsvhuv3QEHmMHaqluohxSXaC0fB
 uQ5OHLwAAHyN0kbUiqyw+CKJIT2y/hc91Ho9EIjSf6/dB6pH1V70oHPm6zDs3B8X
 r/7XV4EMnJG/ia+dWgt+FY/mQn45IR60rcO419nsHLpcZCGzicyQiWSW9RCq9xJz
 w+LlJTxb7fk10cziINhcVt8MhNQ29a1kHSbDZwhlUqISGyfN6GDhmmGPV4BugHDM
 IVBXHNCrSZX+A+PwSMH8fKZOB05lrJZLx7y0CkQGo+RD0efgwlcRjtnEYiUyOPj4
 a01k1wQHFg+kErcSpkciA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673997879; x=
 1674084279; bh=mbrmB4JWFUSHT6LTEGlg7GdnuCT3OTDuo2m7Xz6KuJQ=; b=o
 Z4Bn0gO1T4mokbdWQ2v8QwR/V5+SlbPxbW8dWusjtlS+eSIJkZJ5P/17qpozC2tC
 nFU5hLeoLAHVpDQNf7NaUAOpO+PHE77oTJI5pG7POlNmgoHEljozGOQgmQDX9wZR
 Je2qwSaExjS/Z2LXDmwzLGPKXRsU4x7xOROjszfCiQAfUx9KrfDBgpwiHk5y6mxz
 /aBYRErfbD6xG4sHaxb1uPZHhr2h7J8kXrX3YGmET/You/Ac9FkF2s6bfP7G8zhl
 DCqbAd2BjWly7zUCI+ML9T8MzOx0Lr6zh4w/AIgSCwwCO5OXcEGsWEezsBMPNrE3
 qRe0tJLgd6Ibsx2mr8sqw==
X-ME-Sender: <xms:Ny7HY3w7yskS2ad-kW21zd2KfIfyrmzligSJfaJwQgrVZbqBeNlfKg>
 <xme:Ny7HY_TX0kL7AcTV7u9zEqOHJii39Ux-VHsypaHT_uYPdR7N7piZz1q47O66VUj8V
 5fUHNuiH0S8v7u8kyM>
X-ME-Received: <xmr:Ny7HYxWDG4b1YL2Ai4_Sp4K0zv22r9rLkMVmLDslWLB8uOKhbXtfwqVHgVwjTb2ez7ZKbElSmCZRCh4mNlPQLmP5aV_lvZtS49Kr_ewGP-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvffejjeeliefgtdfhieeiuddv
 hfeugedvueffgeetleelgfekudffgfffieduveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Ny7HYxgauyNsvewZBSInKObPFiHqjK4Zw3TduPdaBpmEM82-AZZYBA>
 <xmx:Ny7HY5Bwf2q_B4su4c4xaxi2v4_p9fep4qBK5wT9EPrfLcpWO6zuMA>
 <xmx:Ny7HY6LpCv2_33Nhe_bSg7dHk7UIHqOockoGBvz2oZnzvIaFlf31pw>
 <xmx:Ny7HY91aNcGNCyxlLuijROH0wKZcPHg6MhpxKtabcJSP37GH6DGMyw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:38 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Date: Tue, 17 Jan 2023 15:24:26 -0800
Message-Id: <20230117232427.74496-5-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Create aspeed_eeprom.c and aspeed_eeprom.h
- Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
- Include aspeed_eeprom.h in aspeed.c
- Add fby35_bmc_fruid data
- Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM with data
  from aspeed_eeprom.c

wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
...
user: root
pass: 0penBmc
...
root@bmc-oob:~# fruid-util bb

FRU Information           : Baseboard
---------------           : ------------------
Chassis Type              : Rack Mount Chassis
Chassis Part Number       : N/A
Chassis Serial Number     : N/A
Board Mfg Date            : Fri Jan  7 10:30:00 2022
Board Mfg                 : XXXXXX
Board Product             : Management Board wBMC
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : N/A
root@bmc-oob:~# fruid-util bmc

FRU Information           : BMC
---------------           : ------------------
Board Mfg Date            : Mon Jan 10 21:42:00 2022
Board Mfg                 : XXXXXX
Board Product             : BMC Storage Module
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : Config A
root@bmc-oob:~# fruid-util nic

FRU Information           : NIC
---------------           : ------------------
Board Mfg Date            : Tue Nov  2 08:51:00 2021
Board Mfg                 : XXXXXXXX
Board Product             : Mellanox ConnectX-6 DX OCP3.0
Board Serial              : XXXXXXXXXXXXXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXXXXXXXXX
Board FRU ID              : FRU Ver 0.02
Product Manufacturer      : XXXXXXXX
Product Name              : Mellanox ConnectX-6 DX OCP3.0
Product Part Number       : XXXXXXXXXXXXXXXXXXXXX
Product Version           : A9
Product Serial            : XXXXXXXXXXXXXXXXXXXXXXXX
Product Custom Data 3     : ConnectX-6 DX

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c                 | 10 +++--
 hw/arm/aspeed_eeprom.c          | 78 +++++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h          | 16 +++++++
 hw/arm/meson.build              |  1 +
 include/hw/nvram/eeprom_at24c.h | 14 ++++++
 5 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.c
 create mode 100644 hw/arm/aspeed_eeprom.h

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c929c61d582a..382965f82c38 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/aspeed_eeprom.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
@@ -940,9 +941,12 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
 
     at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
     at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
-    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
-    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init_rom(i2c[8], 0x50, 32 * KiB, fby35_nic_fruid,
+                          sizeof(fby35_nic_fruid));
+    at24c_eeprom_init_rom(i2c[11], 0x51, 128 * KiB, fby35_bb_fruid,
+                          sizeof(fby35_bb_fruid));
+    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
+                          sizeof(fby35_bmc_fruid));
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
new file mode 100644
index 000000000000..9d0700d4b709
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.c
@@ -0,0 +1,78 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#include "aspeed_eeprom.h"
+
+const uint8_t fby35_nic_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0xd7,
+    0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xdd,
+    0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f, 0x6e,
+    0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20, 0x4f,
+    0x43, 0x50, 0x33, 0x2e, 0x30, 0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xcc, 0x46, 0x52, 0x55, 0x20, 0x56, 0x65, 0x72,
+    0x20, 0x30, 0x2e, 0x30, 0x32, 0xc0, 0xc0, 0xc0, 0xc1, 0x00, 0x00, 0x2f,
+    0x01, 0x11, 0x19, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0xdd, 0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f,
+    0x6e, 0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20,
+    0x4f, 0x43, 0x50, 0x33, 0x2e, 0x30, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xd3, 0x41, 0x39, 0x20, 0x20, 0x20, 0x20, 0x20,
+    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+    0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xc0, 0xc0, 0xc0, 0xc0, 0xcd, 0x43, 0x6f, 0x6e, 0x6e, 0x65, 0x63,
+    0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0xc1, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0xdb, 0xc0, 0x82, 0x30, 0x15, 0x79, 0x7f, 0xa6, 0x00,
+    0x01, 0x18, 0x0b, 0xff, 0x08, 0x00, 0xff, 0xff, 0x64, 0x00, 0x00, 0x00,
+    0x00, 0x03, 0x20, 0x01, 0xff, 0xff, 0x04, 0x46, 0x00, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0x01, 0x81, 0x09, 0x15, 0xb3, 0x10, 0x1d, 0x00,
+    0x24, 0x15, 0xb3, 0x00, 0x02, 0xeb, 0x8a, 0x95, 0x5c,
+};
+
+const uint8_t fby35_bb_fruid[] = {
+    0x01, 0x00, 0x01, 0x03, 0x10, 0x00, 0x00, 0xeb, 0x01, 0x02, 0x17, 0xc3,
+    0x4e, 0x2f, 0x41, 0xc3, 0x4e, 0x2f, 0x41, 0xc1, 0x00, 0x00, 0x00, 0x23,
+    0x01, 0x0d, 0x00, 0xb6, 0xd2, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xd5, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x6d, 0x65, 0x6e, 0x74,
+    0x20, 0x42, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x77, 0x42, 0x4d, 0x43, 0xcd,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa8, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x4e, 0x2f,
+    0x41, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43,
+};
+
+const uint8_t fby35_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
new file mode 100644
index 000000000000..bc4475a85f24
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#ifndef ASPEED_EEPROM_H
+#define ASPEED_EEPROM_H
+
+#include "qemu/osdep.h"
+
+extern const uint8_t fby35_nic_fruid[309];
+extern const uint8_t fby35_bb_fruid[224];
+extern const uint8_t fby35_bmc_fruid[200];
+
+#endif
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 76d4d650e42e..f70e8cfd4545 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
+  'aspeed_eeprom.c',
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 5c9149331144..521005334fc1 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -19,6 +19,20 @@
  * @bus, and drop the reference to it (the device is realized).
  */
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+
+/*
+ * Create and realize an AT24C EEPROM device on the heap with initialization
+ * data.
+ * @bus: I2C bus to put it on
+ * @address: I2C address of the EEPROM slave when put on a bus
+ * @rom_size: size of the EEPROM
+ * @init_rom: Array of initialization data to initialize EEPROM memory
+ * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
+ *
+ * Create the device state structure, initialize it, put it on the specified
+ * @bus, and drop the reference to it (the device is realized). Copies the data
+ * from @init_rom to the beginning of the EEPROM memory buffer.
+ */
 I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
                                 const uint8_t *init_rom, uint32_t init_rom_size);
 
-- 
2.39.0


