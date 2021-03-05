Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D332F339
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:53:43 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFa2-00006f-8j
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3D3tCYAgKChgKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN7-0006hu-IE
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:21 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:51596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3D3tCYAgKChgKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN4-0006z3-0f
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:21 -0500
Received: by mail-qt1-x84a.google.com with SMTP id i16so2375665qtv.18
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=KoXFQAKqmHa7MxP/M5qc4aFRcfh+iQOorfutsM2AqNE=;
 b=DxS1RSK4gaPfSH6kHb3+OL4i1qKQT+zUqCvZBs0SEFi59Zo82pCrzCEnwUd+mI5nn/
 qhxeaAGj8z/d+ebKe3F3IFKoF+kQ6eguI51hheAXp0Nu3bIZUnaP5ZUEz0VLBcdyX8ED
 7esKbpXtdMNI3lVmVAEST8p5alMZ0RTy2CQXoGkhU7BSFHGiEbQifV0r6cCX9KNklUIU
 ne8Hrsyzj38YSyBvvOpRLe9hstnbpTjzzIazvAPYrcEwrkm39bqthIyur16ln4TptfNG
 CxPOR/ulcGUJDO8z/bzP3PUYIzU/DnAG9+qeVVbMzC42rD4FUppqhsgSAccFcO+vyg+X
 GUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KoXFQAKqmHa7MxP/M5qc4aFRcfh+iQOorfutsM2AqNE=;
 b=EkAhY9wPSBBw7xNkHZxQNE5jOtjiaU16iBqHlucdmUQ4a68xmLmmQmzbKcwzsKxv6q
 gidV6nbP8/STtblIsASkV6yaeU+6Y+2J/Icsq0CIluj+XV3yX8qbmQKbeYlmOmy3Y8bE
 BiyJI92CSkH5IqFcRaJNv+MMhoEzv6vi1xRNl7XTwIL/v9w1KHevwX8FIR1tHtzK3MN0
 F8JAQ5OkwVVOUVwa7jSa72Oa7Hb5TKlHeL3K6vrFnlCTRCJTk67TJ17FNerJxMWQ7/Al
 uoAXPIVN5Le/quN2ADokC9oKtXUuWeWntA+HNyAcVyNFYqnNMfTdklbfroBVc/UQRTlM
 R2RA==
X-Gm-Message-State: AOAM532M8ZxvmkbaBIuvi+1ZM5s8i2vPHWzG5SDXT/oMQiLsaMVXJ02+
 SEvgmngIZi1ZVk4p/+j0gGiHh6dgHFBMqA==
X-Google-Smtp-Source: ABdhPJyUxCAe0xQa42EAsWpHRiN1/9kNmpLC1ChvLog0sDWbiXSGyV2ZD0UcqLYWmpPmXm3f+BYq+2EHM/R0xw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:ef11:: with SMTP id
 t17mr10185449qvr.21.1614969615418; Fri, 05 Mar 2021 10:40:15 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:54 -0800
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Message-Id: <20210305183857.3120188-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 1/4] hw/misc: Add GPIOs for duty in NPCM7xx PWM
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3D3tCYAgKChgKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This patch adds GPIOs in NPCM7xx PWM module for its duty values.
The purpose of this is to connect it to the MFT module to provide
an input for measuring a PWM fan's RPM. Each PWM module has
NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
one PWM instance and can connect to multiple fan instances in MFT.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c         | 4 ++++
 include/hw/misc/npcm7xx_pwm.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index dabcb6c0f9..4c48b281ef 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -139,6 +139,7 @@ static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
         trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
                                       p->index, p->duty, duty);
         p->duty = duty;
+        qemu_set_irq(p->module->duty_gpio_out[p->index], p->duty);
     }
 }
 
@@ -483,6 +484,7 @@ static void npcm7xx_pwm_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
 
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->pwm) != NPCM7XX_PWM_PER_MODULE);
     for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
         NPCM7xxPWM *p = &s->pwm[i];
         p->module = s;
@@ -501,6 +503,8 @@ static void npcm7xx_pwm_init(Object *obj)
         object_property_add_uint32_ptr(obj, "duty[*]",
                 &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
     }
+    qdev_init_gpio_out_named(DEVICE(s), s->duty_gpio_out,
+                             "duty-gpio-out", NPCM7XX_PWM_PER_MODULE);
 }
 
 static const VMStateDescription vmstate_npcm7xx_pwm = {
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 5a689d3f66..7ad632a93a 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -77,6 +77,7 @@ typedef struct NPCM7xxPWM {
  * @iomem: Memory region through which registers are accessed.
  * @clock: The PWM clock.
  * @pwm: The PWM channels owned by this module.
+ * @duty_gpio_out: The duty cycle of each PWM channels as a output GPIO.
  * @ppr: The prescaler register.
  * @csr: The clock selector register.
  * @pcr: The control register.
@@ -89,7 +90,8 @@ struct NPCM7xxPWMState {
     MemoryRegion iomem;
 
     Clock       *clock;
-    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
+    NPCM7xxPWM  pwm[NPCM7XX_PWM_PER_MODULE];
+    qemu_irq    duty_gpio_out[NPCM7XX_PWM_PER_MODULE];
 
     uint32_t    ppr;
     uint32_t    csr;
-- 
2.30.1.766.gb4fecdf3b7-goog


