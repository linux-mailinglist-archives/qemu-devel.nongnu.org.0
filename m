Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADACD676C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:33:37 +0200 (CEST)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK3Hr-0005d8-JA
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2px-0003zI-02
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2pv-0007IN-MI
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:44 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42353)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2pv-0007Hg-GL
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:43 -0400
Received: by mail-wr1-x443.google.com with SMTP id n14so20339059wrw.9
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KbaUdY7MQ5XrBad74VXqOTDTlb/EY4vaz3/Ky7Y2Hgo=;
 b=Vd2i8GUBxFhC+4NfhltmxgtjAdoElHrALt7v0/7MMsR2b3BmuTaMiyoogVn5sDK90l
 Uu2V7Us9xkGw/+K4ATN3V/MyIAbCansAP0abwS1lj4rwud0p3+bY7D5sbhzK/AWhXRPA
 +BZK5SU1btKwDjNEgS1LS1CBSWH4OnNpFhye+uXB8XsSu5AuIXWFRgCRXjfz5CJSFheo
 kUm+f7iKK3XESPtJZ4fnFKy4lu9wnSJu8+Y7KlHUa5aFjEvjtgTVjShmbvjlZQDqpNlH
 xSe6t1YhCOsN2QCPD/hzq9Cg7eSjVMl1bxvPOXmuSKsLzwQK40I4TN63OhL/WXVpyT50
 dEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KbaUdY7MQ5XrBad74VXqOTDTlb/EY4vaz3/Ky7Y2Hgo=;
 b=eVGJlBabu4vvW3opFPrDs/nd6A2xvOIbVcnRVGnkHzs/FeA+7MwpI3TQOcnm3jag4T
 MnQlrbYp7GBQ5CJv+eKopLU19fZDuqejIxgH9AeeveKvOQ3oWYGI8JwfitQvUcjISnfv
 aGsDkD1EdpCF1xivOIK2uztURoHwSwzzKKUivt2ScbKF/ePK2hW0DOATQzjHNXmlhq7u
 ij1HvsbSneOeGlTsIfAKeMYCv7ZcwvvQQHf9QGq1kb+my6OSqVMOQdNWzqwatgqY6XLr
 fUhmSD0VCESeRsbKBV523tJ/tO6txTtOOZeit3bYtqCV3WNHhqmKdfDMUzpSsNyCzJ0r
 CfdA==
X-Gm-Message-State: APjAAAVLUZi5h9hKXc5bD1DUUaorVV3iWDnsaA2T6tFBzHsACXUVCOqH
 ADzVcaiENK/P+6dvj3UCckUC9Qbfr9gekQ==
X-Google-Smtp-Source: APXvYqw7eBvPvPLvweNLsHcQ3lYy7PBO+3O6VIm7w+FIwj3elOakrZg1yN2Nh24Zi3v8B53HKj0zyg==
X-Received: by 2002:a05:6000:1252:: with SMTP id
 j18mr26644236wrx.160.1571069082138; 
 Mon, 14 Oct 2019 09:04:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 5sm18029779wrk.86.2019.10.14.09.04.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 09:04:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/68] hw/timer/exynos4210_pwm.c: Switch to transaction-based
 ptimer API
Date: Mon, 14 Oct 2019 17:03:13 +0100
Message-Id: <20191014160404.19553-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014160404.19553-1-peter.maydell@linaro.org>
References: <20191014160404.19553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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

Switch the exynos4210_pwm code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191008171740.9679-15-peter.maydell@linaro.org
---
 hw/timer/exynos4210_pwm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index aa5dca68ef7..59a8c08db0f 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -25,7 +25,6 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/ptimer.h"
 
@@ -150,7 +149,9 @@ static const VMStateDescription vmstate_exynos4210_pwm_state = {
 };
 
 /*
- * PWM update frequency
+ * PWM update frequency.
+ * Must be called within a ptimer_transaction_begin/commit block
+ * for s->timer[id].ptimer.
  */
 static void exynos4210_pwm_update_freq(Exynos4210PWMState *s, uint32_t id)
 {
@@ -281,12 +282,15 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
 
         /* update timers frequencies */
         for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
+            ptimer_transaction_begin(s->timer[i].ptimer);
             exynos4210_pwm_update_freq(s, s->timer[i].id);
+            ptimer_transaction_commit(s->timer[i].ptimer);
         }
         break;
 
     case TCON:
         for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
+            ptimer_transaction_begin(s->timer[i].ptimer);
             if ((value & TCON_TIMER_MANUAL_UPD(i)) >
             (s->reg_tcon & TCON_TIMER_MANUAL_UPD(i))) {
                 /*
@@ -315,6 +319,7 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
                 ptimer_stop(s->timer[i].ptimer);
                 DPRINTF("stop timer %d\n", i);
             }
+            ptimer_transaction_commit(s->timer[i].ptimer);
         }
         s->reg_tcon = value;
         break;
@@ -369,8 +374,10 @@ static void exynos4210_pwm_reset(DeviceState *d)
         s->timer[i].reg_tcmpb = 0;
         s->timer[i].reg_tcntb = 0;
 
+        ptimer_transaction_begin(s->timer[i].ptimer);
         exynos4210_pwm_update_freq(s, s->timer[i].id);
         ptimer_stop(s->timer[i].ptimer);
+        ptimer_transaction_commit(s->timer[i].ptimer);
     }
 }
 
@@ -388,12 +395,12 @@ static void exynos4210_pwm_init(Object *obj)
     Exynos4210PWMState *s = EXYNOS4210_PWM(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     int i;
-    QEMUBH *bh;
 
     for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
-        bh = qemu_bh_new(exynos4210_pwm_tick, &s->timer[i]);
         sysbus_init_irq(dev, &s->timer[i].irq);
-        s->timer[i].ptimer = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+        s->timer[i].ptimer = ptimer_init(exynos4210_pwm_tick,
+                                         &s->timer[i],
+                                         PTIMER_POLICY_DEFAULT);
         s->timer[i].id = i;
         s->timer[i].parent = s;
     }
-- 
2.20.1


