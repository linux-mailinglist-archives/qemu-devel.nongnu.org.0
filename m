Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E619C3AA64F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:50:50 +0200 (CEST)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdQv-0007EZ-SV
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJZ-0000Ku-6E; Wed, 16 Jun 2021 17:43:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJW-0006Ba-JD; Wed, 16 Jun 2021 17:43:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c9so4263687wrt.5;
 Wed, 16 Jun 2021 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7tkCcGMeSxkeYuEayXQwDf2U36P/eV7M7g2ybGL9KI=;
 b=MXyh0QJxX4897RGnRCyxdlv7qycF6ckt+c71prZb0zkZuaBofoDZwufM4OcMbzmvc/
 +qxJMxNHy4/Y446EGjCXTc7GnXMGA2t4TvyXgFZ856k1CsguNf6mhGCdG6YHBP+luI+t
 ZinCUZk85pxZ0FCM4Rmgx38ISZUBYxeuqAlDUSU3SdMdPZ7KuceT4Z2Ow+Btxw+jxICt
 /6Cd7cT1JDx61xqMIpuE+Ez5y2XGp7NZn1/2jm+Zg8UBlxIpn35H4xN/TjKpfSGgA3Ut
 HHskDbJ1lYjc/c4oEwmNbVN2Ns2tLjk41Uep/UAxAvsBfhob9JmmOm7HqXFvgnvSAXkD
 DaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g7tkCcGMeSxkeYuEayXQwDf2U36P/eV7M7g2ybGL9KI=;
 b=WmFrqo3+lSq3luyNqIzkv7AZYtN0eOmO3RnHzsyupk/gCWS4/UFaYJJpRh2zpGYfN0
 Yt3h843JsiDT0sp2HtQ79AbZPU+yEF8L8w5xHMvZVj8H3KMlTJgaQh4sjx6d59Uo+nZK
 8Wm7rI5Zvrid8s/3Q7cqk/+h6o/579O+JkMzG+66v4F4KUaoDeM5ARuQ54xTwNs3GDnF
 w3UZoKtkIxjF/cy6i7pR4YNpuCqjrxo02HqQF+aeFkhNof8+9tsexAXSxa8NQb4sbpf8
 795ZStZjr6baBKXgWHTMWX0DgbJrXROOqrpikxq3GQCUp71tezNPIlVIidCwmAPUYh0B
 S9vQ==
X-Gm-Message-State: AOAM530Z57MbC77LzcMbCWKVw8tXYju+3Jf2zjg+bDZt/96G2ofxfGcv
 1AZuQBV251o0Dg4nZeRnxCQqOqbzisXwXA==
X-Google-Smtp-Source: ABdhPJynUDqQJyXLKSbnVFL98/uei8Rv/tGLQkbPls0tPGBMgig48jVQemFb286ZWmXTMHYyK9MBKw==
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr1475921wrr.284.1623879788243; 
 Wed, 16 Jun 2021 14:43:08 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n42sm5915203wms.29.2021.06.16.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/15] hw/input/lm832x: Define TYPE_LM8323 in public header
Date: Wed, 16 Jun 2021 23:42:41 +0200
Message-Id: <20210616214254.2647796-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
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


