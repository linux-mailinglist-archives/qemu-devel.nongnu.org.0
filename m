Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677B575539
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:43:05 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3nk-0008KT-Gw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XWDQYggKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zw-0005dy-F2
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:48 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XWDQYggKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zu-00083G-Vz
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:48 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 u12-20020a170902e5cc00b0016c20d40ec1so585142plf.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=kr16O2/EBSfwSF7VcawKdkp/AJaEhmm7UE+3USm5wXnMc+CTFt9frlkM1Z/A7MUXpH
 Uw7vKwqmSH0M+8DY+9jUNv9cWb0YBtSgXpWeIcnE3z/0LnOedoqIiaZtVB82U6RP1LyM
 f0kHk+S6YLxXsdg9Z/jHBnGB1bSHMEtQ4KYpR8Eug/IIOLKviXHOeTVnNBi2y/tfZYuN
 12Hw+DmqsbiRQMVhNAd0Vji0M3LsYcFb9Z07RI4gJc9BoY8lPtcx9KLetw52MRgP72yD
 QnRrwHslTnFcT9i67oKtn/30QKgu8Byx41Zbvxi7ymug6PvpUpTtCeUpoQAi6KSLIT8s
 gReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=LMMIUPIyDdx19iAg/O5vUXLrXdUQVsMmFlu9zmdqGUxQx/3fFGr8znlymF7KDE6R9g
 GaDjzBW5Tag5qXOcKs53gmVKewPfOHB2CZ05s8LIMD5/JCp3zK0i/Z0zxT6Vrw3sxYDb
 TJ/2gue2K8AZistHg+58ufhxV89PWUv/vK2uHd9Lwfo7l6Edmoeos513k0IMkDGFdEbP
 017IkyfFTpXG/cQLC1rapn0K2Stg98OCh+YBs5ZreJzQ5ZKTvpeIEBvMvgiHTWrEUoGS
 rj9odwGSvvwPGWycz8GetYALMyiXBbqYgY/CyE2+l4o+WY64fEGzwPC7e6eTIM1fXJuC
 4xsw==
X-Gm-Message-State: AJIora9MmUTM47Iavgq0d2vbBDoDnthwc7/v5xFkBjgjTsgiD1w5ljIL
 1T2HE29pVIeM5X1npiXJM2zUpEVPviuYag==
X-Google-Smtp-Source: AGRyM1tHz8svYXQGLYVJOw1RvC2wduk1EUO4iFWdbpTan9FUboZMFx3KZCTHhGjNjHVuUy2eO/bIXz9J8eYzKg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:1bc7:b0:1ef:d6f3:b3d0 with SMTP
 id oa7-20020a17090b1bc700b001efd6f3b3d0mr17441090pjb.4.1657823325466; Thu, 14
 Jul 2022 11:28:45 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:31 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 3/8] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3XWDQYggKCnw1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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


