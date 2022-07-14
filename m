Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF5575527
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:38:12 +0200 (CEST)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3j1-0008Ps-Ur
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3M2DQYggKClIGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZH-0004P5-B7
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:07 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3M2DQYggKClIGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZF-0007ZT-S5
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:07 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 h11-20020a170902f54b00b0016bfdca124fso579215plf.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=kB9++DeA7Tuwm65j9dS/PIkc3ajOl7RxD50DCUI+//OeUMsQE0AWmS94p4OhIm/fn1
 oiNfku8QN5qD+fTJbnebnVWgiOlY85giWrdslJjXZsjyM2M7YzgZK+OK5z9l0ttdNBTn
 +/QBcmWbzf2IMAFmAT4Jmj71uAnlCUcPYPrxmU6a06bO74F0rfRfVLYgEZi19NNDvXCK
 Hdecs54kt/PmGniwMEPQqtSB7vEQ+TPmEmkcpQWZ5A54GyDSqc0VV72ELMJO5NRLZG46
 ++jDsvfVQ+14HqMWxyiR1czTkTqXM/rtDscJh4rm91tF+/c28g8+SwWbBkbnnqeTa04a
 A1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=v+OD0aipnm0kzrZGmoRsbLUa/DYUZ1mmyl2zA7f0XJ5/TdX2CkMOMzeiC0bd5NFj4V
 f1ZAsVGGa1SyWgsusEc0WZcybDDH1V06JHZGBAjSvCNvvW9pOuwq87Mtr6fLrQRouEeq
 coOb7Zlfdhtzn4fZ/sKMFw98+PSWBjdBLz2+i58AaMIQb2s6/pxEIfvIJGt+8bTelaGV
 nj75d0bA2MEYAwpyW8uLwQkqBe4tgW/OCsdCvEMHlAlZ8sFJnFy51sEhbD9QXVZuLw7d
 +dK2CdDpenTmbs4hb3fmTolqMPyREkcxn3SGkK8dOQobobtUHVDjMfbkp5Ui+Pol0kM0
 7IOQ==
X-Gm-Message-State: AJIora+hEiyh25DMMZSoh/5o0s/kEuZFA5pTeiXZDuhDJz7cJCOsGrwu
 CnepKtcLK/Lc4hfCby8sSNCbddLZPXFcBA==
X-Google-Smtp-Source: AGRyM1vXJ0ABwDa022SILpCpo/T0vAt11/A2wcndrzr4au279rxVtgcHSosNvZ6Tv/4kFnis6ATiQz2HMXvvwg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:188e:b0:52a:b545:559f with SMTP
 id x14-20020a056a00188e00b0052ab545559fmr9756292pfh.18.1657823283979; Thu, 14
 Jul 2022 11:28:03 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:42 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 3/8] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3M2DQYggKClIGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c           | 2 +-
 tests/qtest/npcm7xx_adc-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 0f0a9f63e2..47fb9e5f74 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -36,7 +36,7 @@ REG32(NPCM7XX_ADC_DATA, 0x4)
 #define NPCM7XX_ADC_CON_INT     BIT(18)
 #define NPCM7XX_ADC_CON_EN      BIT(17)
 #define NPCM7XX_ADC_CON_RST     BIT(16)
-#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_CONV    BIT(13)
 #define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
 
 #define NPCM7XX_ADC_MAX_RESULT      1023
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 3fa6d9ece0..8048044d28 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -50,7 +50,7 @@
 #define CON_INT     BIT(18)
 #define CON_EN      BIT(17)
 #define CON_RST     BIT(16)
-#define CON_CONV    BIT(14)
+#define CON_CONV    BIT(13)
 #define CON_DIV(rv) extract32(rv, 1, 8)
 
 #define FST_RDST    BIT(1)
-- 
2.37.0.170.g444d1eabd0-goog


