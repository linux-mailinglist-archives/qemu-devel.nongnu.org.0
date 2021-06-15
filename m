Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D540F3A85C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:58:31 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBSQ-0007R8-QN
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFB-0006GP-OP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEi-0000yR-86
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id m18so18854080wrv.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ETK4THhT3bIw5g337eKbOGWg2S9a5ypkXL0/WklkD8s=;
 b=cjwfLoZ63OQ0FOWBCg2j9CIPkRBVwhRc5lTF9KsLnwbr5Jm3B8+CYwuT85gBHehCUd
 nonEhsZxfeNOgSiJoPTpF7NEsJ8ZDnELWIF4RkzbgLUKBhb4EE8ksHuzJeY05ZVYbEAM
 8FnlOCk/zFiAgJzPkBg8++/0KCEXuYKHlVd298/dqmqwxCq3W4HTfJbqqj7si2g+bDYA
 uOz5GMaUxK4//xUEp3XHFGvQukfG5FV1ZrA1zt91AqZhs39a2qwpWBJOBa/o5AOvkPSI
 YlZiaGvEncH5h7ni01PDReym8R3u4zc2rV24r3vkMEGKLumsoFKczcZoM7bU5cUmqOyg
 w0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETK4THhT3bIw5g337eKbOGWg2S9a5ypkXL0/WklkD8s=;
 b=ttubV9IHUo/NdSTPDRUz7q74Bov0n94hAZLYYpgj0PnjxZN+iqvzCD1kfmlFdK/3jn
 UfbdCxWzGSdsrp8bNZLR8tczhSPeiJmR/BYoYKXIcBJoFRg1qaJHP/P7Llyck/NmDV6W
 JqV+HK6mLBSjWP/D+GepiVpzmDucpnCvinPF4PqAtSPgRwYiW0jWv6i084X/8vMXEaxX
 fO5CfvdcFABpvDwW9zRyFU6b8AOarny2xlGfTLsI71fFAGBihxTeXeK0amsbAS5O6eEK
 dZhpK/u6D1lO9wCbnvSjTwzxKilT4IIJagdEUNj69qyKJ5TOOO7/jkohFb0fescHDT2R
 DWVA==
X-Gm-Message-State: AOAM533pvDS08yaK7jbff1XgkQ7YAP7juoetWr1wKbe7b/zCOBC6ylHS
 OkQ40w59qtfL71xfCmw1E99SKzmti9Z32Q==
X-Google-Smtp-Source: ABdhPJzfEAoleojNWV/hTLb5QLJmJvdogzjCKOWd7E2T2xq5XBX3Blyml59dUphm/l6eA7EfxWQq8A==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr26068280wrr.10.1623771857341; 
 Tue, 15 Jun 2021 08:44:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] hw/arm: gsj add i2c comments
Date: Tue, 15 Jun 2021 16:43:50 +0100
Message-Id: <20210615154405.21399-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Adds comments to the board init to identify missing i2c devices.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20210608202522.2677850-2-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index bba23e24fae..eed0da71b8a 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -221,7 +221,21 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     at24c_eeprom_init(soc, 9, 0x55, 8192);
     at24c_eeprom_init(soc, 10, 0x55, 8192);
 
-    /* TODO: Add additional i2c devices. */
+    /*
+     * i2c-11:
+     * - power-brick@36: delta,dps800
+     * - hotswap@15: ti,lm5066i
+     */
+
+    /*
+     * i2c-12:
+     * - ucd90160@6b
+     */
+
+    /*
+     * i2c-15:
+     * - pca9548@75
+     */
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.20.1


