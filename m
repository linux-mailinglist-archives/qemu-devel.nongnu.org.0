Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67F671146
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:43:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHyPJ-0005Wo-2F; Tue, 17 Jan 2023 21:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPG-0005Vd-BQ; Tue, 17 Jan 2023 21:42:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPC-0006qS-HD; Tue, 17 Jan 2023 21:42:30 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E4555C010A;
 Tue, 17 Jan 2023 21:42:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 17 Jan 2023 21:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674009745; x=
 1674096145; bh=/z5U/bvy3nZwmSKAXilwZUN8/rmqH1ZvMvC9F3Q3LpE=; b=E
 1Ls6n/9A2EugeR8r9bnALQrOMgUztISQotkw2XzJoX19gnew/DDH+NUwhMSNgfIG
 KCZtzhi3z75tLcbEahpE7dbf6URMCjhhhybw+uyP2XiwHRkMlbMX6w75hBNMj8Gu
 KmYOxmHhy+dGxbI50dbkFS3vZyj2oDQ1osmvxtXFIpA5f3f59tOAdgJxIEnqSJUD
 c/gPosG+QWH3XyEaaAfHWztIxxYmAGcELbJgl3/I1tZZc7V6a9dEpQ+TlA4EQf7h
 oZ0shP8b1qy4fFE/y89aDjipxaA4B6KJ/hx0bnfxNkJGPVnSc/yv01L6PMHEX/cD
 zBXDdQnHndthN/SgCNsyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674009745; x=
 1674096145; bh=/z5U/bvy3nZwmSKAXilwZUN8/rmqH1ZvMvC9F3Q3LpE=; b=M
 OWa0S/ikbDO6NyNrfak0zX2ud0uy6hTV1qhGHiSDwYVcSu7GR01fMuN5ub0JIEnW
 RK5OJx9IWnZMIJbV0+hg+D99MwN6uKU9ifj0GUtGxk48OfhrDtpsV+n7qshEipq8
 Sp/7gTMPaC4SKqj/HHUBTIevySCk+/K5+P9cLDBsMqeoAOi3kxTyOw+3I4bg6UF4
 m5oczT+RH96q5wkki72kpV3PwUEf6/BMVaZjc/v++TJgmSwk5uICMK7icWow8hCt
 7SiZb5ySxOOf3t7sQCFKYQmiE9Zb72RY+zHkuMWzuOJF0JXPy0yPh82eTRVVAKAq
 ZBcTUBwJROR7Kn29PnsNg==
X-ME-Sender: <xms:kVzHY1hrwxdrXtyP0hBN_AFolDmZJgU519wOXPSmp7iMDTWfwwkCOQ>
 <xme:kVzHY6Dguz0YuuI821KBg42qBrMSBt6jCVEGd7DZxpS8XBzIewfXXpqetDXnefMIw
 ESOxacgeegAfdfJ0aQ>
X-ME-Received: <xmr:kVzHY1G8rt8MxvozEyNpth7mPJMquOrbVXRt3XjG1pMFVHEZBZrsSQm101t17vw4-Qy6AGJvwX4Nu6Uh0yl_THCDM6SIJ-6PdjpQAvet8yI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvffejjeeliefgtdfhieeiuddv
 hfeugedvueffgeetleelgfekudffgfffieduveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:kVzHY6RgJlg8oVT2XmvSovc7oUskFRjduO9paghU1mh4VfllXPQqMA>
 <xmx:kVzHYyxCno6TKRU1rQ3t8z8hW_2CZIV5SKnNRyWXQdCYrJ4AxfuhMA>
 <xmx:kVzHYw5RTJJF1YRH4KGJ6GqlyBkh2L29-fZrP-XYH-YUtE7PZ0CbOg>
 <xmx:kVzHYxlbORW3eSPUCPx4ZbeRTXTpBIipdDKJFgfkWZUBIgH2kZ8K9w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 21:42:23 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v4 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Date: Tue, 17 Jan 2023 18:42:13 -0800
Message-Id: <20230118024214.14413-5-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118024214.14413-1-peter@pjd.dev>
References: <20230118024214.14413-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
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
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c        | 10 ++++--
 hw/arm/aspeed_eeprom.c | 78 ++++++++++++++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h | 16 +++++++++
 hw/arm/meson.build     |  1 +
 4 files changed, 102 insertions(+), 3 deletions(-)
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
-- 
2.39.0


