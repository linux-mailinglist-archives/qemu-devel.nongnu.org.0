Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4363AB314
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:55:40 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqcV-0000JQ-I1
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqaj-00061y-1h
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqah-0005BU-GQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id j18so3079176wms.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7tkCcGMeSxkeYuEayXQwDf2U36P/eV7M7g2ybGL9KI=;
 b=PHe/VNuEZjHarNlEl0zV5SK1U2ew9APLI9N1IMT49Y/TM0G2Cgk5ilRvuv6j+wwkRW
 Hjx2k2SJ2jvxLoHqL+mYI1swMZi1FKLnBGNTuFNsOAwQdvFZZ5nOIRhODj6Y79+uhLCz
 xBb/EHXEFVAiTP1bzjJDMEGq1VQ7Rra3F09Sxs2jhHCBbCs8wZc8EVdw3Z9MbhN6gsl9
 dkvDv9G1GhJMB/9SRkhKSQfYu1+fwfOagXP5ul9XnrPbPL20DoIDBxdjwmG4kPx5e08G
 scrkwDFIbhrJJxl5aNgaQmiUkrp4GJGKNur1kej7xtURm4M2D+XiMEAKk21/kx+k4LXz
 M8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g7tkCcGMeSxkeYuEayXQwDf2U36P/eV7M7g2ybGL9KI=;
 b=VLXdWxTyeh0p7ESq9P/uVv50na31HfWPREfe2U+KLPW7DicmVU4jQB9MuGQdCEK0VW
 Qb0jBhfNWppM/x+hsa1PWaxEpxP8M0002qPIiFidKiGC4IPtR6yfN3Sx/zbiuVHrOljk
 4tgnevvMBRCAwWlKXGJQL2ADsgKGoWhIMe8JzS0S7iIka/PhXsoKrNiPY9rod5VCa2XG
 z+fJO9a7yWY09xRVgfLN5ZdG7VHvoubbGKbOutffXNq1iDLYepbIt4NTgsEgZHrw10Gu
 CnKpu3VKwVPIXNnmyb/kNTZ4icdq9NXAxLcVlQZ2wR0II6Ro+phSTvPkY1jF0d0CtgYE
 iGSA==
X-Gm-Message-State: AOAM530YVhVPWYlFdj05B7D5ZoQ+XMOW8U5KWEVc42R3VQMvaIwLcZ+r
 +9PW0VzJtYsCGjrLPiNxbDL+5ZnF13NUjg==
X-Google-Smtp-Source: ABdhPJxX8o5tssdyMdEwzOEvB9miVkmjnGy5NDAfe/RoVnCdXeiwbwQcPh8dt1gqYCGWz3CU6FLC9g==
X-Received: by 2002:a1c:e246:: with SMTP id z67mr3294845wmg.119.1623930826042; 
 Thu, 17 Jun 2021 04:53:46 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p187sm4339944wmp.28.2021.06.17.04.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/15] hw/input/lm832x: Define TYPE_LM8323 in public header
Date: Thu, 17 Jun 2021 13:53:21 +0200
Message-Id: <20210617115334.2761573-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define TYPE_LM8323 in the public "hw/input/lm832x.h"
header and use it in hw/arm/nseries.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/lm832x.h | 2 ++
 hw/arm/nseries.c          | 2 +-
 hw/input/lm832x.c         | 1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
index f47e579ff90..2a58ccf8916 100644
--- a/include/hw/input/lm832x.h
+++ b/include/hw/input/lm832x.h
@@ -21,6 +21,8 @@
 #ifndef HW_INPUT_LM832X
 #define HW_INPUT_LM832X
 
+#define TYPE_LM8323 "lm8323"
+
 void lm832x_key_event(DeviceState *dev, int key, int state);
 
 #endif
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 7b82b8682e8..3a51264e3cf 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -417,7 +417,7 @@ static void n810_kbd_setup(struct n800_s *s)
     /* Attach the LM8322 keyboard to the I2C bus,
      * should happen in n8x0_i2c_setup and s->kbd be initialised here.  */
     s->kbd = DEVICE(i2c_slave_create_simple(omap_i2c_bus(s->mpu->i2c[0]),
-                                            "lm8323", N810_LM8323_ADDR));
+                                            TYPE_LM8323, N810_LM8323_ADDR));
     qdev_connect_gpio_out(s->kbd, 0, kbd_irq);
 }
 
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index d2b92b457e3..19a646d9bb4 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -28,7 +28,6 @@
 #include "ui/console.h"
 #include "qom/object.h"
 
-#define TYPE_LM8323 "lm8323"
 OBJECT_DECLARE_SIMPLE_TYPE(LM823KbdState, LM8323)
 
 struct LM823KbdState {
-- 
2.31.1


