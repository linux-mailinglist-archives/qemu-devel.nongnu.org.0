Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0A3172EB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:08:33 +0100 (CET)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xey-000330-T2
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3elgkYAgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbj-0000ly-Od
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:11 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3elgkYAgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbJ-0000kk-Fx
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:09 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id v196so4071425ybv.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=dpq8MEr8Yyy5k0UaGwfFoovmuecOr53Phwau+fJ4meU=;
 b=f3DWpwM3e+qDv3BFHwSB+Uz1a06s9x70SsCjXwLZXBFKS9EEzeCT6wXqvK3gcctc/s
 K9kCL/t00SUNx+6pEps59fDtL1XWjAXWc9Kn1Ncai+XRUAzyMsrV7LtChYNoQqIeDbZg
 aAeMikuC7k/+qTnRm8brl5cvPWb4qoBFU6DlCMlygoW5SFn78NyMAfdBHLNJoXp+AD6q
 ocgJRhT7BXAt4RNdd5Gh1zmx5mP5WwCs9X/sziwaxJONuYl5dOMUZ4atlkvIIGq+qwrM
 j6BY0ce0gaicVKHb+IlEP/qsj8axDzunGrUOfFFHF1xPjswkeQAYNjnSxWdTkkrIZWX+
 7sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dpq8MEr8Yyy5k0UaGwfFoovmuecOr53Phwau+fJ4meU=;
 b=Lja+TarVhyB0guB+cdjwAEttjHMN51nXu//yni6675XmdvLVoS0d9qS+4bW8bTNzPB
 plTVFCwa0cPpp2AaLGHxIjpY6VM7Tl6yFwtBglBJbn6b4OjPRSi9L2RDg3MP/YFyfyaF
 LFFlnpomwHv+XbFuQ/oJI8TNR3uaray929xmN6tR1KAfa6yEPwuyjX4Cs/i/RjhZk+DI
 XPLnLE7otVtZ5R/G4guFzksisSX2X0xETdAU3YIPm/NqewZcFaHh5UkVQZWx3nsPa8DZ
 1nvEFATWPHtl2EkiwIC72VNckM7hZA16rfL36u5AcUaapv/V6HryerGEd6muV+g/cAJh
 /E2Q==
X-Gm-Message-State: AOAM530ijr/Zv+QdifcsGBFH2Iql3RKnIos3qL2DPZ5V5Y4H01IcAiPJ
 QKZV4/ESYOCZ6FOGVGWx2NK4fMfZg3NX2g==
X-Google-Smtp-Source: ABdhPJx3M8NdJucEn5HMUTHw/s+8cZsZWNryHZQk00OIC1cTxsS9quoGyhZcyVBzSQTSWNlHUcuBZRM1GOhSpw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:b74d:: with SMTP id
 e13mr7373447ybm.405.1612994682358; Wed, 10 Feb 2021 14:04:42 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:23 -0800
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
Message-Id: <20210210220426.3577804-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 2/5] hw/arm: Add I2C sensors for NPCM750 eval board
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3elgkYAgKCsM53qjx21qpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

Add I2C temperature sensors for NPCM750 eval board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01..47a215bd01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,24 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    /* lm75 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    /* lm75 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    /* tmp100 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +126,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.478.g8a0d178c01-goog


