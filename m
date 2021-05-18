Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1C3880BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:47:56 +0200 (CEST)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5h5-00079p-Pn
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cBikYAcKCj0udmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1lj5b1-0005zM-Av
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:40624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cBikYAcKCj0udmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1lj5az-0003dN-Nf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 e138-20020a25e7900000b029050df4b648fcso8757358ybh.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DzfR3PCsNMjQmYWVC9UhsWtMuFHRpsDlBm2LP+qjcYs=;
 b=lIGtAhi8l7VO5+/+rIEeLeg+gXhm+PjhNpR57/2LfHnKVAmmiGPOcAGxv5qx8YhyDX
 jqo7iBSFWdvE434Veco6SGRwQDblDOko8GJYvRlCopNdvXQ1vMJzVBYTITkFglVDnxLp
 Qdx94oA/evCWU1EJ1osCYyhSKzpfmwWevhk0MUvFBLjgtsFEo9qyPwRMY1SMykrw4eP8
 h5Rz5I+79/AelIuHGOjursVbHNQayT+EHRLhSb6zQUFCtOU7/y8hWTwi3USOUnRS5jTE
 mywQ/ehhKdY6EvIXbojFHpLRJ1/mKa/2CIgb+hR/3sLMb7W4niFlxf5ZYjZAFYKGVN6R
 XA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DzfR3PCsNMjQmYWVC9UhsWtMuFHRpsDlBm2LP+qjcYs=;
 b=DRXpLkAzMKWfl3XD7ZSdLBLrOsFj2afAGtVAIDpvFqHyDaZxW/ogfa5wCjGV+hq8xC
 eP8yVviTm0DGb075771Y1u5DHH4JS1VT3TssiCx9ZgPtGFtsGSC9UVK1qeox/rcwZpfD
 Pig+wGC+EOf9R6bdHQZDVo73GHJ8O6p4EiWhCka7uv+t/Ed74cAlqwOXTNkdCA66kCay
 KM+F+loIc8KILlgSvDMUjkZzGYttPedo8+bCIy9iGeOobCeat1QwsmoVqrsg8cOr6JR4
 2/aK4QAN1e7/1KkZIrOUBsvxNrPaWPEHPy+HCUyguYdY5D+qVhbDwG5IUuQxYXGSEgTU
 4uLw==
X-Gm-Message-State: AOAM532fe9sfqsHHfuSmJ3MVry0VUAVDN+wQCrwwmX9/oChJYweX02Xx
 l5gTu7hpQ4Z0xIuNX+BNEsU65G4w5pLQ
X-Google-Smtp-Source: ABdhPJxOqRwQwDlAS+hkNxxiKKe2rLKVraybp3K8DubOtmb5RnY1rVyguNWUIklxodvH8z6QWTFMHU+UTlVA
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:d55:: with SMTP id
 82mr9742425ybn.502.1621366896312; 
 Tue, 18 May 2021 12:41:36 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:16 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-3-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 2/4] hw/arm: gsj add pca9548
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3cBikYAcKCj0udmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Tested: Quanta-gsj firmware booted.

i2c /dev entries driver
I2C init bus 1 freq 100000
I2C init bus 2 freq 100000
I2C init bus 3 freq 100000
I2C init bus 4 freq 100000
I2C init bus 8 freq 100000
I2C init bus 9 freq 100000
at24 9-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 10 freq 100000
at24 10-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 12 freq 100000
I2C init bus 15 freq 100000
i2c i2c-15: Added multiplexed i2c bus 16
i2c i2c-15: Added multiplexed i2c bus 17
i2c i2c-15: Added multiplexed i2c bus 18
i2c i2c-15: Added multiplexed i2c bus 19
i2c i2c-15: Added multiplexed i2c bus 20
i2c i2c-15: Added multiplexed i2c bus 21
i2c i2c-15: Added multiplexed i2c bus 22
i2c i2c-15: Added multiplexed i2c bus 23
pca954x 15-0075: registered 8 multiplexed busses for I2C switch pca9548

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/Kconfig          | 1 +
 hw/arm/npcm7xx_boards.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b1..9d1c2a6f7b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -377,6 +377,7 @@ config NPCM7XX
     select SERIAL
     select SSI
     select UNIMP
+    select PCA954X
 
 config FSL_IMX25
     bool
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9b7a7cd201..f0a96564e2 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,6 +18,7 @@
 
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-core.h"
@@ -231,10 +232,7 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
      * - ucd90160@6b
      */
 
-    /*
-     * i2c-15:
-     * - pca9548@75
-     */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 15), "pca9548", 0x75);
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.31.1.751.gd2f1c929bd-goog


