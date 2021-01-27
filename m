Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54577304E71
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 02:16:05 +0100 (CET)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ZRE-0006Kv-Dm
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 20:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30b0QYAgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1l4ZNA-0004Wl-Sa
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:11:53 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:45549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30b0QYAgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1l4ZN7-0001e9-VC
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:11:52 -0500
Received: by mail-pl1-x64a.google.com with SMTP id 98so219760pla.12
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 17:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=CYEX7CEkLzQdqs4pMJDm4ewLslaQwNz5Up0FfqGNcqc=;
 b=slN3QB5ZyBQvCoFgPJ5OUpGvtfwH0lUOesuoir0crXVHGLdA66VsBFkomEFxOFb2R6
 Ga+6VJvxr2qpgf16vkpCR2fZkLavQkmvfpkiaB+LXyTx9az36BUhEe+J+VSCmp1Ub8BW
 zAOiclf3b0Tg/nJbrG6oJn3YTIvstbQF/DwzaKt2Lnp45G4/kc9EsnixuTLtOTetd3wv
 COnKsRpfqp5YdY5ghxMYfNwVDwv1A4XKY/Z3zc4IQsYO5AJPIlpiWz9rE5JFu4uC5bf+
 F6RW8roCKq3UQ4ZUtgTrucZf9Eb2U1Jq6+1Y9DMoYjiIPP2Q/MYEsnfemu2ey/DzNfSh
 co8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=CYEX7CEkLzQdqs4pMJDm4ewLslaQwNz5Up0FfqGNcqc=;
 b=UCGpWn00OujeE06CbeU3rk3AnLsZfInRbkzknWKe+N/17zFj/GtDvWxSEfOdUFN1G2
 2ssMmF9SKdF13QBMoUgmzGxcKV98cqmhNSiR7MR7C7e4EF7R8GIXrmQUkbCmig47f9dJ
 3ZKTiEpeIv867xwfO13sueIUHt39WR8I9/qg6SuG3+K8YwUcI09i/zM8yV9MFOlIO9L8
 hmAhj8OgGmW3brg/P2iEnP1Q2h6xb0KzjCGYh02c9YcajrReYHVovXA0mT3PatgTnLj3
 tdO9B61ExvCWGI0k1kpS/9eAdSFooIH9GxmPuiPA8ellQVSe8ktinMa6+CAHGye89HAI
 6jRQ==
X-Gm-Message-State: AOAM531WEzNqt0u3/jtmjJCdwgOepIsNfUGN18i2CKztU+QIZiNoQp+v
 iNYeffN7wXUI3LxzpGoq4DAZXPAa5me14Q==
X-Google-Smtp-Source: ABdhPJwznUEZj+z8rnLvfXQzOFxLYzXhUaSc9kJk+Y+SmW/4UAYa7/OZIG+jIigwyQzkaCwyJ0mgSnc9ehGdVw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d48a:b029:de:ae4d:2c7b with SMTP
 id c10-20020a170902d48ab02900deae4d2c7bmr8559923plg.62.1611709905391; Tue, 26
 Jan 2021 17:11:45 -0800 (PST)
Date: Tue, 26 Jan 2021 17:11:42 -0800
Message-Id: <20210127011142.2122790-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=30b0QYAgKCpYMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, qemu-devel@nongnu.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org, hskinnemoen@google.com,
 dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

Fix potential overflow problem when calculating pwm_duty.
1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
   hardware specification.
2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
   can excceed UINT32_MAX, we convert them to uint64_t in computation
   and converted them back to uint32_t.
   (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)

Fixes: CID 1442342
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Doug Evans <dje@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c          | 23 +++++++++++++++++++----
 tests/qtest/npcm7xx_pwm-test.c |  4 ++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef..dabcb6c0f9 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -58,6 +58,9 @@ REG32(NPCM7XX_PWM_PWDR3, 0x50);
 #define NPCM7XX_CH_INV              BIT(2)
 #define NPCM7XX_CH_MOD              BIT(3)
 
+#define NPCM7XX_MAX_CMR             65535
+#define NPCM7XX_MAX_CNR             65535
+
 /* Offset of each PWM channel's prescaler in the PPR register. */
 static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
 /* Offset of each PWM channel's clock selector in the CSR register. */
@@ -96,7 +99,7 @@ static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
 
 static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (p->running) {
         if (p->cnr == 0) {
@@ -104,7 +107,7 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         } else if (p->cmr >= p->cnr) {
             duty = NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
@@ -357,7 +360,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CNR2:
     case A_NPCM7XX_PWM_CNR3:
         p = &s->pwm[npcm7xx_cnr_index(offset)];
-        p->cnr = value;
+        if (value > NPCM7XX_MAX_CNR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cnr value: %u", __func__, value);
+            p->cnr = NPCM7XX_MAX_CNR;
+        } else {
+            p->cnr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
@@ -366,7 +375,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CMR2:
     case A_NPCM7XX_PWM_CMR3:
         p = &s->pwm[npcm7xx_cmr_index(offset)];
-        p->cmr = value;
+        if (value > NPCM7XX_MAX_CMR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cmr value: %u", __func__, value);
+            p->cmr = NPCM7XX_MAX_CMR;
+        } else {
+            p->cmr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c06..3d82654b81 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -272,7 +272,7 @@ static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
 
 static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (cnr == 0) {
         /* PWM is stopped. */
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.30.0.365.g02bc693789-goog


