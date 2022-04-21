Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F1509E9F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:36:10 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV6W-00024u-FQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpx-000314-Jc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpv-0003Tf-Kj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p18so6213873wru.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f6gs5lG3WvFi/GkMdFvvztB0m3oPJAErdAfbpm6CH1E=;
 b=A1oBjf+NwbvPyCzVI+knnD1KV5tPL1S0fAOZzBtYJRbVPwUtOZ6ZqSnSWS6SXWvs6f
 w1u5X1ypjyQwfVkvIM5iCof95Q5TzqeqaYSnRTtuwLqJQ3QswtPNGiTHfQU2ciuVh2fV
 q/a8Hanodlu5hAIiX8N+RN/RK07OkMk0C+ttDyihSd6YInHnoptaJrfs20E2EBsMxdIK
 6xwmVl97rP+Q3PX2q4ACS8Tzr5IxNGo5LfcfkIrf6Rui/xgTWm6QyVkxzcDA3ma7PLWE
 ttn4Wb9nxkwZeoyOVhcLimxZtqO/56HS9HBV/aukOFqZyM1/m3sSpQBRkf6Yi0rHI0Td
 OR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6gs5lG3WvFi/GkMdFvvztB0m3oPJAErdAfbpm6CH1E=;
 b=uJZazpUE/tOX5HRmT7v3838cjO+NBvO0+48l0j/kXEc7+iEP396kelOSLX4/tvpVVB
 ZZOw6Ac59PWLm/a+9ZYOJNFjSNee1p6fxqn3knNo0C07YY3COVAze0gFgheJaEYwmGuU
 0YhgpXjIJkdLNXLmNmfCdKTvyVxLW1VRFcYffuCcaE+xUa16jFv2WlDBj9iVJd2ILSAP
 25AX6JGKx5r9nHA3dukoMnl3WDrrkMbj8acWMNCdjgmuVQ8lwGhsWGFDQyIw0wKCWUNb
 AKmcWF8cAx2kvWdRSvJGT2JhHRsyoMDT9HC9PsUSZToUqjmtYjuBRbT5bcw4gNHL3wfd
 jVoQ==
X-Gm-Message-State: AOAM531MUewyuI+1YCmMdvRuy0iZu/tLOtOqztSLn63fZuQoFga76ULC
 R6HizXfTOzOiG/BgFgct9cUxA2BMxvxFmA==
X-Google-Smtp-Source: ABdhPJxpJ4iw0vL4F15EhCjAE21V7nV2XkvI8a1KQDpXapyiGSl4+V+zdp1T6nKZ+rD5ZldW2jYZLQ==
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr19822561wrp.407.1650539938191; 
 Thu, 21 Apr 2022 04:18:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/31] hw/arm/exynos4210: Drop int_gic_irq[] from Exynos4210Irq
 struct
Date: Thu, 21 Apr 2022 12:18:26 +0100
Message-Id: <20220421111846.2011565-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The only time we use the int_gic_irq[] array in the Exynos4210Irq
struct is in the exynos4210_realize() function: we initialize it with
the GPIO inputs of the a9mpcore device, and then a bit later on we
connect those to the outputs of the internal combiner.  Now that the
a9mpcore object is easily accessible as s->a9mpcore we can make the
connection directly from one device to the other without going via
this array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-5-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h | 1 -
 hw/arm/exynos4210.c         | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 215c039b414..923ce987627 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -82,7 +82,6 @@
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-    qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
     qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ef4d646eb91..60fc5a2ffe7 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -252,9 +252,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
-    for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
-        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
-    }
 
     /* Cache controller */
     sysbus_create_simple("l2x0", EXYNOS4210_L2X0_BASE_ADDR, NULL);
@@ -281,7 +278,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
-        sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
-- 
2.25.1


