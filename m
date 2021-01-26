Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D903048DC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:42:14 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UE9-00042m-3C
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3am4QYAgKCo8FD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5S-0004az-Rp
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:14 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:37157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3am4QYAgKCo8FD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5H-00047b-Kt
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:14 -0500
Received: by mail-pl1-x649.google.com with SMTP id c5so10232119plr.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=0PFajRoJ1DQ0XYaobEENMylsgDeBQsfIucOzPRxM9DY=;
 b=Lh8Eael0nAszss1OY0l67Svp6F1n2VyjD/bI1A7HM60gbeSJW5wKy+FeAhzbWDdXo4
 KginxIYrHRPxr3XKEjNEml+RjaOuFIYY0/TPW3HhkgnhLN1Ynj/NUn1BjGPGNBeuUys0
 7g01SrQ5DZABfV61wnyDrfVfMVXKCQMX+0I2cUfyVyZZGOdFZa+vOeN77pRZR477/1Ml
 Unnt+BDYmwnJWUd5/NyrVyMbmVHfqyHJNK9UYIpFqcfFeIvegYMaBNiZkfavcWO5uTiU
 YKqjSqHMQI/dMD2FlUTxXF7418yIkY++rqZEsUkbE+Hb+OyqWpYlzaD1uaABpnPPUI1O
 BnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0PFajRoJ1DQ0XYaobEENMylsgDeBQsfIucOzPRxM9DY=;
 b=C37DVAbM4pV8Bz8uJr5UHO6D+6rNIRKFAsDQY37P+eUmmQxiovz/8h9S4YClrew09E
 VBkLZvOz9OoXvwxL64o29QwVcHiUww+csXYgdHOFjC1Uxo8C5y18YJyzmpBUIxENJS+M
 dHG6hsWEZj/h4t7CrES6OKtYfqTif/EpOTs/MXEu61X6oSPoKBzE7jWLUaNX4HBm/ouw
 8YrqJw/0JIXHxNw6ECyvBr6EoBgqL6GqBSnB5j0uArTB60aTDHAOw//Kx5WCNuPQlFXI
 NmNqGI35QTKVKPGEGjtGFqWZFXrUSVogKszx9pK0KgDFDRAfnIIFovy+xlp0Os8XQErd
 /NFA==
X-Gm-Message-State: AOAM531JlbLwtiHg+jEvivMr7nBqkkA8LbCRx54hjt1/uTjU4r+HFykN
 v6UrOqSrgOE2nIsDV9va7bZzdCnnIv2fsw==
X-Google-Smtp-Source: ABdhPJwOhdUp/Q1WXe5tIKS4zVq2fH0RBEO4XVSRcyi5BwLRgBSvGuRG4Le6jZk+OrmihfA3aAv3fvkZ5w/HMw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with
 SMTP id o12-20020a056a0015ccb02901ba52823ab8mr6612813pfu.77.1611689578626;
 Tue, 26 Jan 2021 11:32:58 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:35 -0800
In-Reply-To: <20210126193237.1534208-1-wuhaotsh@google.com>
Message-Id: <20210126193237.1534208-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 4/6] hw/arm: Add I2C device tree for Quanta GSJ
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3am4QYAgKCo8FD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

Add an I2C device tree for Quanta GSJ. We only included devices with
existing QEMU implementation, including AT24 EEPROM and temperature
sensors.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 2d82f48848..1418629e06 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -112,6 +113,21 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void quanta_gsj_i2c_init(NPCM7xxState *soc)
+{
+    uint8_t *eeprom_buf0 = g_malloc0(32 * 1024);
+    uint8_t *eeprom_buf1 = g_malloc0(32 * 1024);
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x48);
+    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 9), 0x55, eeprom_buf0);
+    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 10), 0x55, eeprom_buf1);
+
+    /* TODO: Add addtional i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -137,6 +153,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
+    quanta_gsj_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog


