Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E284DAFC8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:20:48 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6dz-0008EY-0j
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5q5-0006lv-J9
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5q4-0002ZS-Ez
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:13 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5q4-0002Z9-6i
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:12 -0400
Received: by mail-wm1-x343.google.com with SMTP id 7so2597999wme.1
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03WlCBecLigWxgy0uEAlie3BbhfPPehObmaYLG7brlM=;
 b=Xz5gXCHqWKuYSqNNSfMGOAzxv0kS8vBU+JXJZUV9MP9h5fFGp2EyMWPPRBvywLP0IY
 pSoUk08RiPLsqXSH+1BgNljjvFelBYrYcAMHIsQJi1eCKtwnAycELUwS7QuzsDicapQy
 wUwSfD9nlX5Fhgf8Ku2BnTSF9khJV04jVKCp47bfS94mosKqqGyxhJxEfPgv9RfuyQ+K
 laldxmLpxCLOi62yv0NhamzOuNmB69ZTpkniacUyMcIOdlt7FP/JbM0Y/J1pK8NFEIo6
 JNKMFL1FDnDB9fn1XghClhLS/WOXQBLGFxvDawdfDdhJlvwEfzXMAdEO6Pai//rOe+9N
 p+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03WlCBecLigWxgy0uEAlie3BbhfPPehObmaYLG7brlM=;
 b=FZI8T8OaKjH1h7MoKTKZcUhnlR0rYtZaBjbXB/K/4kYFLXW/zPI4SHW0+WCWpI/mf1
 MnVneAaE1h79zzOu2w53ItI1oDYOzobL9KqFlVRX44Gz5xRAlXQ1h19XPZqibn00TjkC
 zNTWjn1ec9KqJBdrAPTIKTV93HVACik+yq1gejKpY3tCcfLb2xSwE/V5bArAWXNnVEG/
 vHVgDdSXbSO2YrhA44ccyJft5pvBpSyz6N8Myo1s4lYWkTHlDS+Tvcfq+jE28fRmC7QJ
 bGvdRuc5PfsKYL0+vNpVP7csasxlnBPPb4aKxC4OT2lywtCY3vfbLGsnKSPRDZOYsuVL
 5R5A==
X-Gm-Message-State: APjAAAWc6NigC9xIIw0SIBdkSA/p5IdyIk2anxxXdoG3xMsj1Tzlp1lW
 nH3HmRWtnH/LUMF+2vxn75RPTg6Y2mx2BQ==
X-Google-Smtp-Source: APXvYqy1ZoYtWzGJH2+pSITnqzsFZxZa18WrkhFTPNHgCYsTNAHNewaT2KzSdJEkrwv/CPK9Vu0Hug==
X-Received: by 2002:a1c:ac02:: with SMTP id v2mr2779754wme.85.1571318951000;
 Thu, 17 Oct 2019 06:29:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n15sm2703392wrw.47.2019.10.17.06.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:29:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/timer/lm32_timer: Switch to transaction-based ptimer
 API
Date: Thu, 17 Oct 2019 14:29:00 +0100
Message-Id: <20191017132905.5604-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017132905.5604-1-peter.maydell@linaro.org>
References: <20191017132905.5604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Magnus Damm <magnus.damm@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the lm32_timer code away from bottom-half based ptimers to the
new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the ytimer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/lm32_timer.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index fabde760b2d..3fdecd09fe2 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -30,7 +30,6 @@
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 
 #define DEFAULT_FREQUENCY (50*1000000)
@@ -63,7 +62,6 @@ struct LM32TimerState {
 
     MemoryRegion iomem;
 
-    QEMUBH *bh;
     ptimer_state *ptimer;
 
     qemu_irq irq;
@@ -119,6 +117,7 @@ static void timer_write(void *opaque, hwaddr addr,
         s->regs[R_SR] &= ~SR_TO;
         break;
     case R_CR:
+        ptimer_transaction_begin(s->ptimer);
         s->regs[R_CR] = value;
         if (s->regs[R_CR] & CR_START) {
             ptimer_run(s->ptimer, 1);
@@ -126,10 +125,13 @@ static void timer_write(void *opaque, hwaddr addr,
         if (s->regs[R_CR] & CR_STOP) {
             ptimer_stop(s->ptimer);
         }
+        ptimer_transaction_commit(s->ptimer);
         break;
     case R_PERIOD:
         s->regs[R_PERIOD] = value;
+        ptimer_transaction_begin(s->ptimer);
         ptimer_set_count(s->ptimer, value);
+        ptimer_transaction_commit(s->ptimer);
         break;
     case R_SNAPSHOT:
         error_report("lm32_timer: write access to read only register 0x"
@@ -176,7 +178,9 @@ static void timer_reset(DeviceState *d)
     for (i = 0; i < R_MAX; i++) {
         s->regs[i] = 0;
     }
+    ptimer_transaction_begin(s->ptimer);
     ptimer_stop(s->ptimer);
+    ptimer_transaction_commit(s->ptimer);
 }
 
 static void lm32_timer_init(Object *obj)
@@ -195,10 +199,11 @@ static void lm32_timer_realize(DeviceState *dev, Error **errp)
 {
     LM32TimerState *s = LM32_TIMER(dev);
 
-    s->bh = qemu_bh_new(timer_hit, s);
-    s->ptimer = ptimer_init_with_bh(s->bh, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(timer_hit, s, PTIMER_POLICY_DEFAULT);
 
+    ptimer_transaction_begin(s->ptimer);
     ptimer_set_freq(s->ptimer, s->freq_hz);
+    ptimer_transaction_commit(s->ptimer);
 }
 
 static const VMStateDescription vmstate_lm32_timer = {
-- 
2.20.1


