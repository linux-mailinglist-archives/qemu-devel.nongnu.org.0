Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE7E303082
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 00:50:55 +0100 (CET)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4BdG-0007OP-BG
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 18:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKCtsTRE7LQPEDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbO-0006Fd-H2
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:48:58 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35lgPYAgKCtsTRE7LQPEDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--wuhaotsh.bounces.google.com>)
 id 1l4BbM-00038e-L5
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:48:58 -0500
Received: by mail-pg1-x549.google.com with SMTP id l2so8919668pgi.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=mRCTh8N3GYdCOaCaGlFqMFUkJp0rJ0i4BEUeKzpQ9hW1vK8AcNT6ij0J4irEMjEZCJ
 5OnxJb4TbhFrboNDKEKYjKt9fV9NXN9dXUfEO9nNVGvrQF14SRBaQOby/0GMs1NyZ9Zg
 Njr0zji/DBdO2OlHsbc5ZZm6W6Xx5bjuxsF8f92NjBhPMGoAqxgmqm7ah9UQ0ghxHBH9
 56S+JOH6KhFVlcvUiFGPT9T9MU+xzYYxDQkgRudf34NRoFy0skXb/CzQhjY6TLPfe+01
 hDsdhJ+mg35SNprl5yqHAS+g2TpEX7IlvJAigpSV+KxlBrfB5P7fTxrjOAt8rZW+FQvB
 MNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=I+jzqQbXvQgWEuHn+S1cGshEJkxZZv/tRlV4YBUAhVY=;
 b=ohMYplBBvJ7tyfaIIILpEkxHCx7B166P5hcIbQ0U0qM+oWUGv2gK+9DYQ3vMyi17QZ
 VTVGCQtgOi53V47Txha2afh13LuNUX/vCr3mQzDpIexHIdCQqhhv82D0Evu7xFCrT8M8
 5uX9VfmE9oz80Ig44XUqUAwaISnUKKVnnP9F+rnuRHG8U3ed6W/J2ibJJYd0byapmAKX
 H9dnphdQEmIdPTxuQhgwQpS/je9lSWlAlBu7zxk/yLzkAHRSiObA7Qx9S93dW6fEoXaa
 QZ1qw6FzprPBTZTWDvvbt4e3/d4NB1lBl7jaA7bYpVmBXmVT/L2OzxZISSM71Qy/jD4v
 XmnA==
X-Gm-Message-State: AOAM532gESlNpjSBbRAMuat2m+UN9iGgh1SoXyJtEQmw6ZPoTEfnXwld
 J/KClXJwTc5UQ66n8Cg1TVSw9IleFrbRvg==
X-Google-Smtp-Source: ABdhPJwCxBtjWpteiEJxI0dYDZjWQ7m1nZJzBi5EzLtJpn2EhrpC7Eacsrozx1WxSGDUTLbnLkB4YDowN4VNMA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP
 id s9-20020a170902b189b02900dc41024edfmr3086577plr.80.1611618534131; Mon, 25
 Jan 2021 15:48:54 -0800 (PST)
Date: Mon, 25 Jan 2021 15:48:36 -0800
Message-Id: <20210125234836.607233-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=35lgPYAgKCtsTRE7LQPEDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
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
Cc: qemu-trivial@nongnu.org, wuhaotsh@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

There's a potential arith overflow in npcm7xx_pwm_calculate_duty.
This patch fixes it.

Thanks Peter for finding this out.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c          | 4 ++--
 tests/qtest/npcm7xx_pwm-test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef..90b4f630a0 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -102,9 +102,9 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         if (p->cnr == 0) {
             duty = 0;
         } else if (p->cmr >= p->cnr) {
-            duty = NPCM7XX_PWM_MAX_DUTY;
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c06..f55571b31d 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.30.0.280.ga3ce27912f-goog


