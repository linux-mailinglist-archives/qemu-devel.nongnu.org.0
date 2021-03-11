Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB9337C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:12:46 +0100 (CET)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPnh-0002Jk-Fh
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u1xKYAgKCqYcaNGUZYNMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk9-00075x-0q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:05 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:56966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u1xKYAgKCqYcaNGUZYNMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk5-0000ZC-F5
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:04 -0500
Received: by mail-pg1-x54a.google.com with SMTP id q36so7652717pgb.23
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=yAL/yyoZZPWjcmwCMPRsFSWdFs7eZBoEqYgq7Pmudw0=;
 b=QjuHfBsyqYoCWim5cuXkvevxlIAxF99Ta021Bt+UP4ervXCf4teAQNjVLrY3TMBulr
 xsJQCewongAyDJZ6d+Cez1gW5bBsC869QRlU/YBbhia4I77sj3P7zaWxJy40LVmCPGIs
 ObWZRUPMa3GuzNVDPq2f4dH7YzwW1vdce9f7eUjZ05m/7ou38a3PNafcrMjzekPfH1PF
 rc5+YBhDF3SqkFnAt/KWw7t+hduq0c+vBDgNRWHEwdxa6LAf1JZ80DbE128g1BSoZ8zZ
 B6/y4S781yh9DAMGiysNVH24d6LiCTFnHE2oaKgIWhomYeQ4StCIytTggMDgNoXl7hGa
 +vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yAL/yyoZZPWjcmwCMPRsFSWdFs7eZBoEqYgq7Pmudw0=;
 b=idvSQbpcNQL4LR04wq5fOr5zZnME8G5QWc1rF5FRwKqrAEtqFM2F15cxLBNaI5Gnls
 nuXXqMLhQPsM2hQy9NF4HRLx6PJxsqggWTMinIrOajBOW2RTAbvQXM2OSJKh/PJHmwOY
 AUisg65RD7+bozmKXPi3Umdv19T83d3jpjvjpqtffR3nSo94EEwg/a2Lnlvnjj5gVQA/
 vn2M+KHZUlrqbCdwGP3XjKtwGvG2AuVRz3j9+EcmFQ1CXPFBi3SKFN2LHTYAMHxETOIE
 ESpEnUh5a7Z5VhEO8RquY9OfCIRZtSoLiBc1xpfwqsaHkKv+Kw51J2xSQ6TUC3tSRmY/
 2lfQ==
X-Gm-Message-State: AOAM530Q82tyGFBb4eZRRiACCIKekIWTGVRwhFakbByKUg7GcHIto4mo
 +o4y6JYBSqB8wAq0kLrZPDVWfz0CNW1xyw==
X-Google-Smtp-Source: ABdhPJx4+6t67c2PLyJB0rUIf16xiz5cVVcfXEAwFIwoSz31Ytnwr7KwVLvkerAefEySNTnKnt66HyYQ+Zdaag==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:9b84:b029:e5:ee87:6840 with SMTP
 id y4-20020a1709029b84b02900e5ee876840mr9567521plp.82.1615486139208; Thu, 11
 Mar 2021 10:08:59 -0800 (PST)
Date: Thu, 11 Mar 2021 10:08:51 -0800
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
Message-Id: <20210311180855.149764-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 1/5] hw/misc: Add GPIOs for duty in NPCM7xx PWM
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3u1xKYAgKCqYcaNGUZYNMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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

This patch adds GPIOs in NPCM7xx PWM module for its duty values.
The purpose of this is to connect it to the MFT module to provide
an input for measuring a PWM fan's RPM. Each PWM module has
NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
one PWM instance and can connect to multiple fan instances in MFT.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/npcm7xx_pwm.c         | 4 ++++
 include/hw/misc/npcm7xx_pwm.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index ce192bb274..2be5bd25c6 100644
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
2.31.0.rc2.261.g7f71774620-goog


