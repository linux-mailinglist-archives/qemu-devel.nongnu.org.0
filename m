Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692C5754B8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:12:51 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3KU-00084t-Du
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vVnQYggKCs4GE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC38u-0007UQ-Rz
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vVnQYggKCs4GE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0005dr-IH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 r7-20020aa79627000000b00528beaf82c3so1479891pfg.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=gNr+pIu8sqZJcM8nYeCB4Hv+y2dCsdaYgq3UkqxXTll2ZZR9Dh4ZVn5+kLZ3fKWyVU
 gAItdCii/WZ1pvOB0nYQ67xMINF3uruWE1Zxg0ePGgVi9zgiB1vNJIMtxV6MDgdcn5Cx
 7sdQOVQ9bmRFPGjw5WdaCBlHjY0nBiCpq1H0V2NKzSFX1l3sbi2aCLemtlWchX9g70Zj
 pmZwBxdmfizeOQ/NnZa5s1j2AWHk8jMCtdfvxZNtCYNDwvTgISAniiJzoo/ttk99p8YS
 iMx3qmfHQq4KQvzJkwJStduCkrOoPdn0AShqXrEN8AtUdoZRdUU1/mv1zEmklPlCSjlb
 oCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=Sl0dwc/mZq+E0Azmc4L3KqLHidAu1LI9H3a60vTmqx0bYM5gpyKGeonpRr6bRV9HmV
 W+cnopV1tgjCosU1OhYnBCCjvVqPlkXx+30w+hhy+J5pTqgXXOsy/Ds3hsFXclmmpRvE
 NuKiUhi9ofdG0ylT3JsQE0c8aEYOtP7LMUBmnfDPunNPwZPLo7FcgIWM9dJlQTlCC1eE
 uATyWSVe4JJsKlFTN9gle/KPj4KHz6vw165lhPREt1QvXi8HNeRwE5kdMh+Lz1uXS3w5
 LMoLB67lJw1sq8/icvy8VHdHbv7/RZ5ZHvjnMOpH41HOPgFFnNAFbb6Bt2XsowNNPq5T
 p9HA==
X-Gm-Message-State: AJIora+MFPeo/VfZksDZPFmgdjyGGbLkD2YYf5tLSQG5xg/xOy1/vTtx
 BsmGdMJgOBr0i6IPUwcchferaTo27VHXjQ==
X-Google-Smtp-Source: AGRyM1uOvYKKh7/BZDVAF86eSyshrXbbnLArW9FmFFF7R5FlULWmTeDwNtZ4eTYrjaWb75Iy9NDPgVR14Np3bw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:a607:b0:16b:dd81:bf8b with SMTP
 id u7-20020a170902a60700b0016bdd81bf8bmr9311725plq.84.1657821629396; Thu, 14
 Jul 2022 11:00:29 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:01 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3vVnQYggKCs4GE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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


