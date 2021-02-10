Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4031732D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:20:03 +0100 (CET)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xq6-0005Dl-7o
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fFgkYAgKCsU75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbt-0000nI-EH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:23 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:56811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fFgkYAgKCsU75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbK-0000lH-Hf
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:18 -0500
Received: by mail-pj1-x1049.google.com with SMTP id gx14so2320407pjb.6
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=tGiwJtNWcNrF2oJEPJ9dczHgfUm5ZHksIPHaIdpVLjc=;
 b=N+iKnnlUJHr788nkTxsXWdQGsG5zaMsDRFG3dyks3xOYKVrotqVeH+dn4rTgktnT32
 4F8jNVoM2KuEEzzCsR9+ox1jqDasZk9pRaRpjinPOwD4wVBYsGyaz+Js3q2G7yslt34n
 ZKaXsBxyIIkHavoDo4Bze6V6alDFFj0NrWCU2R8n2CKLW2JcPy4ebX0YAY+P35R1R6P6
 vnTEMNi7maO+p+7vLZeFvpd6SBVDOW/GQ5tejBRWmp55MT9IrljCH9Vhx2UrDVJzPvCY
 aOz6kQlF1myFDOyvM/4Eu8XtYIGJ/U2lM+vFAJMOyS5ZAsYTo33A1ISPix/Hyx8zlJMh
 k8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tGiwJtNWcNrF2oJEPJ9dczHgfUm5ZHksIPHaIdpVLjc=;
 b=ftpzdF4x/Ew3JURb2UImKqERH+0AUzrp38J2JL5nnjOTgrbAoQdmf2Bir1ZDCmi1ir
 P2TMS6s0e6MXDyxaKgIdq748stOvntA3BnDih2WSiDQ1Unxwvj7ueJhUyacTBnvOtdWC
 HhXGMzh7J5SdmOY5Ntunsfo2UjoTSesrNSNu09Vy+8jd1Zic0vJvERscHnHZfcEGfjZL
 cUQMklXd/xA4gFDTyJu106woRHY3U5h/a4AKtpB09BkOZEGlaV8rTeP01+yISGRC/wx3
 VSgWgUmCu6zxQucPps1oy+3ezxZEFW6NMUIvLDQJ/cl6n/FqVNNKmoONzlUHNyCA/+Sz
 oDdQ==
X-Gm-Message-State: AOAM530cjHq2pe6ZyJ4yRKZ5d1qFvlT3FIBIBXLA0tYV7Ptf5VsMaHEK
 s4ezPDUyWaX1Cdrorajd8etjZs7wmR6swA==
X-Google-Smtp-Source: ABdhPJxp6Ye7eBh0H/W0D37UswF04QTBMYMeDi+4jMqj7wuGzBl+ZlEqQ5GKIFle5TT15aBX3TlBELKCeqtYYA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:a8d:b029:1ba:71d1:fe3c with SMTP
 id b13-20020a056a000a8db02901ba71d1fe3cmr5004489pfl.51.1612994684011; Wed, 10
 Feb 2021 14:04:44 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:24 -0800
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
Message-Id: <20210210220426.3577804-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 3/5] hw/arm: Add I2C sensors and EEPROM for GSJ machine
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3fFgkYAgKCsU75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

Add AT24 EEPROM and temperature sensors for GSJ machine.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index be017b997a..4e6f4ffe90 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -370,6 +370,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
     select SSI
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 47a215bd01..fbf6ce8e02 100644
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
@@ -104,6 +105,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
+static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
+                              uint32_t rsize)
+{
+    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
+
 static void npcm750_evb_i2c_init(NPCM7xxState *soc)
 {
     /* lm75 temperature sensor on SVB, tmp105 is compatible */
@@ -116,6 +128,20 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void quanta_gsj_i2c_init(NPCM7xxState *soc)
+{
+    /* GSJ machine have 4 max31725 temperature sensors, tmp105 is compatible. */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
+
+    at24c_eeprom_init(soc, 9, 0x55, 8192);
+    at24c_eeprom_init(soc, 10, 0x55, 8192);
+
+    /* TODO: Add additional i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -141,6 +167,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
+    quanta_gsj_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.478.g8a0d178c01-goog


