Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFD663D2E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA0x-0006c4-On; Tue, 10 Jan 2023 03:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0v-0006ax-C2
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0q-0006Hn-Jl
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so9187994wms.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=l3/4IQsQcHjdJ8gVMLyumejQnIBIzZNC4o+TDUN2meomeWY//80u0fa+uJLXb3h0Ou
 cEiptMY1EKC4c5ZWx5jRP/2ng4NRdoCbdSCxlp5hV+pEx0KGwZYW5CVfshRKupEN+pFA
 ClFQh9c209MxqQ6KqVBTB5lJXaa89scw2GlJACbx80E7nQPbrpldImBjcs4D3ONNMb3T
 WJP/GC3chwTWjyl+L0raTUvb0qnConk7L8HXQut47mw0glneKfEcLCD3BU9m8r7pAlED
 YPHtf50bL8fEo2Bn4d8ISTxZld37fmSrwInhS6+XdKXZNN/DfQSGen6RoDlFIv7ptyPB
 SVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=U4bC0DPAyO/ocVCoDEYO20Z85x4FRNFs2tk3li6RxDsbjVffy6TBJx6YZFOhcgqf1v
 q+R3E0wppHt/UfEYOJB4bkHlQQ0jomAsVX98tj8mzJJIvPsUx2aTpO8+b1cqFK79MLUP
 BOpOQ7sctMTx9O+9iYK8I4OZqv1CS+fmKSmLPUxS5/AzL3W23cEb3WxDNnWGECxJHBAv
 rZWMXrrrwk3/LfTUKU671v8jklzkofjknHRRUYSp7X0EcuWsu+Gy7ZRST1Iy+OaHSeJD
 BGiNrCe9ZfxpG/7wduwMUzGOiCCRzvkHOU2HupBJoToh+hgX7S/c7YY5HUUXT7Ccyr+3
 56Ew==
X-Gm-Message-State: AFqh2koZ4DK2yyZBolKo9sQPNqeJ0ehseHp+/Fn9neQzMllKEW4l+/9r
 iBYG7Ca2fBXJdCp5DxNTJidOUjYS8WRnt/3s
X-Google-Smtp-Source: AMrXdXsmksKpYFj1w21Vb5Ou+XlScJSgvxIKAUS7GOOBA0fH35GF4YK7ZNwYmDv5YML4Gth3DJLRxw==
X-Received: by 2002:a05:600c:ac8:b0:3d7:7cea:b410 with SMTP id
 c8-20020a05600c0ac800b003d77ceab410mr48540659wmr.33.1673339379237; 
 Tue, 10 Jan 2023 00:29:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm15998885wmb.16.2023.01.10.00.29.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Date: Tue, 10 Jan 2023 09:29:28 +0100
Message-Id: <20230110082932.24386-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
header and use it in hw/arm/musicpal.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/musicpal.c            | 3 ++-
 hw/i2c/bitbang_i2c.c         | 1 -
 include/hw/i2c/bitbang_i2c.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..813232682f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -25,6 +25,7 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
+#include "hw/i2c/bitbang_i2c.h"
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
@@ -1300,7 +1301,7 @@ static void musicpal_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
                                qdev_get_gpio_in(pic, MP_GPIO_IRQ));
-    i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
+    i2c_dev = sysbus_create_simple(TYPE_GPIO_I2C, -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e9a0612a04..ac84bf0262 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -162,7 +162,6 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 
 /* GPIO interface.  */
 
-#define TYPE_GPIO_I2C "gpio_i2c"
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
index 92334e9016..a079e6d70f 100644
--- a/include/hw/i2c/bitbang_i2c.h
+++ b/include/hw/i2c/bitbang_i2c.h
@@ -3,6 +3,8 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_GPIO_I2C "gpio_i2c"
+
 typedef struct bitbang_i2c_interface bitbang_i2c_interface;
 
 #define BITBANG_I2C_SDA 0
-- 
2.38.1


