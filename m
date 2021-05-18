Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B13880AE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:44:56 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5eB-0002nz-AW
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3bBikYAcKCjkqZiopmZbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--venture.bounces.google.com>)
 id 1lj5ax-0005p1-Th
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:35 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3bBikYAcKCjkqZiopmZbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--venture.bounces.google.com>)
 id 1lj5aw-0003aO-6o
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:35 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 b66-20020a25cb450000b02905076ea039f1so13976397ybg.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dOyxWuIBx/Xq8N62SLAFrwjy4K72LHjzmIiChhjukB4=;
 b=MemlwoHfXUz/49Tlljb/Zxkafax0rtWVgl8vgSuHj7jRp+QET/GHWHAuXKaL94U0IH
 WdbI8/uFqe4j5mDcHFu9Eq4NzmknuF5Vfg7bfQVAd7qgledlo21q+c/DZCHe+Bb7IJw6
 KhP/q5WJkdZFkpD/HeZXVpOrt7O/25B/VzA2N5yQCVxBW7a+COFuilaB/8QWsyxZQjbI
 WvCAIGaoT4dNPUYMkZvFN7SDntfOodxzEM6eIKLpK+ZyXvEbuvWNuSaqdE991KBJ/Zjw
 RWlBmHjZD94BYcO+4JrVfGYJ68lFmeARbiOWf39lx4yiyvdhVDU4OEFEmEFwq8IDNgLA
 EAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dOyxWuIBx/Xq8N62SLAFrwjy4K72LHjzmIiChhjukB4=;
 b=ZhFkbtsorjwTFjUbMhyechYPrxRK1G94vb0XPGju3zhDeWD+peMGh8awT2u30wd7Le
 qlV1C7+g29ObbRm9q2BU5zpP/199AH8wUdDWtHxdeH8K0uLfxuFlPYKomAueBWsXf3Tw
 mg2ZKepefzUWv2wZZbm41A08orT2VmHEdiUOqiTk1dIKhX3IX8pfWcSpS3ExNEV4UErb
 M3Or7K5qm5BltSUt8gj/VRMeHldtZgphiM+8qR/r5M6CB/5k5+iGxiqb8yYoZSHqWJsI
 8mkaQTqtpebZqlel1LlOKEWpv1KTZo60QejU9cvxqsGTbYx7elHYwUz06+S6D2st9IwR
 LbAg==
X-Gm-Message-State: AOAM5300KqWe2fFY0KqC894J1YwUAggKUyJbQXmATpk+f1r5FMlWuIlh
 gt+UI60p+cHY2LqQyhmJ+jXSGVszZUPW
X-Google-Smtp-Source: ABdhPJzhCZ4QPipc/b7lcWrlKS2CY+iDjllRo5wFAn3ZclXA1dR1tnO6awBay7725BMJzn1Ljmrplgg9pUch
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:883:: with SMTP id
 125mr5487570ybi.523.1621366892306; 
 Tue, 18 May 2021 12:41:32 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:15 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-2-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 1/4] hw/arm: gsj add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3bBikYAcKCjkqZiopmZbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--venture.bounces.google.com;
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

Adds comments to the board init to identify missing i2c devices.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e3786..9b7a7cd201 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -220,7 +220,21 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
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
2.31.1.751.gd2f1c929bd-goog


