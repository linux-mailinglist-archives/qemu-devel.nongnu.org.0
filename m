Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16866ACDF
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 18:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjvE-0005uV-53; Sat, 14 Jan 2023 12:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuw-0005Kp-MK; Sat, 14 Jan 2023 12:02:07 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuv-0005Ut-4G; Sat, 14 Jan 2023 12:02:06 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6064F5C00DF;
 Sat, 14 Jan 2023 12:02:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 14 Jan 2023 12:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715724; x=1673802124; bh=nm
 78oN9BBO1E0nwvftxvIO+6A3EDc/cOD893O1ZxQgk=; b=wTBHU0HbJ6YQFQm/9t
 458KezZqouEmOpNZf/X94c3R+xPQkQBbqpc7uILPHGnXBHoYQQ9gfMXPCYz7AUj4
 TdH4GKkrdmkPb9Z7iBEgyIdBIYPBjwmEmUtFECTZyKFJAjbK5urYO7iRVfl+/UdR
 PvgJoqN6JJor+0+V3PBv8vwKu4f62lUvJsBShNRkjr+UFN2dEeyYusTCaOZUdFB8
 DQb6STNIjUy4I8DFcSFUXPFqbaTumxGxSGHpyeyEhzLriwIxfh72fO2bBQ51+Xki
 mib52bJQyYbLGSvORzOWV3lOX1jlGKotTTiKy97kdFS1SRVYgoOMaw9jhtDRtnyQ
 ssfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715724; x=1673802124; bh=nm78oN9BBO1E0
 nwvftxvIO+6A3EDc/cOD893O1ZxQgk=; b=DiquBDJ5lySS9yG3bxwXHRNdHwsPk
 7sIgOkkGRVxjew72S2ndmWsUzK4ricIoIvQvnskACTwvDRmWZ1ZWxaL1aPrQqRdM
 vzcyY2CLpDXznlO8YFNutj7v/P31fNSEjuGoKW0xfjQUigy16wD8pCnYtGxE+CIP
 WfmXXefo9hwh6GkAeSkXkHOsLmVP4gEsqqXvspfu5K0yS9CorWz+z90m1rUU/SIN
 NLUZ072RUyztC57Jr3R2+XdW06QGmUbBhVO01VSyb6AwzztxYCQ4oJUfvkqcHdsO
 3euyabzerzhUC8P4EeU4N96r6U2RgpSLeg2ysdsw3TUoXjwcpQNILZmTQ==
X-ME-Sender: <xms:CuDCY1s6KcVpwsUsvgpSHoxmcJxJiew2pJKFEYoomnNIV7N26s-Ecw>
 <xme:CuDCY-e21fqUWRPXyyEyEPmd2gn1G3mQjeXzkaR2_JZvnA0Wr4hIoEM4oIjIWL9Kk
 QoMOK3Wbok4wA8iPCs>
X-ME-Received: <xmr:CuDCY4zCprWu64h9TYbDEcAKGYhUAKK39TmqtyBxyVp2GkUQfnSw3l2Hm7SrpHrqFR7hnPojcOrk0sTdxS4SzuVagdjZEHZlz8A6RVtdbBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:CuDCY8MJvjA5FvoazovtRsyGFgM_eqtjMNmH31xINUyufy0x64uiLA>
 <xmx:CuDCY18et9MBFQ9dGpXhIuxmAmDxl1StA8C6oBfbGd-bqmWgLIn9bw>
 <xmx:CuDCY8Xku4x3qjNdOuDdnovcXej0ApBnFKqSnQosvi-XHvjk-5ziaA>
 <xmx:DODCYxRm-0tMV8eQvXXVFxp4OIxMby9hkB5hPnoufANhbP9Obfz9HA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:02:01 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/arm/npcm7xx: Remove local copy of at24c_eeprom_init
Date: Sat, 14 Jan 2023 09:01:49 -0800
Message-Id: <20230114170151.87833-5-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
References: <20230114170151.87833-1-peter@pjd.dev>
MIME-Version: 1.0
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

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/npcm7xx_boards.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 6bc6f5d2fe29..9b31207a06e9 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
-{
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
-}
-
 static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
                                       NPCM7xxState *soc, const int *fan_counts)
 {
@@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 0x55, 8192);
 
     /*
      * i2c-11:
@@ -360,7 +350,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
-    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru */
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
-    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcfru */
 
     /* TODO: Add remaining i2c devices. */
 }
-- 
2.39.0


