Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DE5C527
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:46:45 +0200 (CEST)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi48K-0003BX-9A
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 17:46:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3IH-0004xW-WF
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3IE-0003Wo-7S
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:52:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41095)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3ID-0003Vg-Vp
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:52:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so15282646wrm.8
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NSiFpefnwqGsQxlF73UeZNcosVDLd7kx/8RbZQ5Fgqc=;
 b=HgF/WC6Bw8ZLbR9X7Nj9iRL3HglUY/qrNUFOVkI68FaWm/vsch/wSfYuTYTgxJgF0O
 pR3VwgU1ka3sFuhSOqkRDrKxHnWnQaTgefbL10uZZbLXcPtgBBNrkv1g9YEn5diKYSBj
 2DKuzitpKABxqh2KvBV0oLbGKX0iMfpf9jNplE90+RWWP3yXbdto7jWPMMrKsPo3jGrd
 FS1hFhTpboYRo9daOb5F/JpQJwCo/+jwQU+YDOOhZqdsLbiCO3Tzq/nYG7cKWI3/n9hK
 IawESfUdRwhKBYgAZAFwlwf+G/dQDzbHhpUBypqo2O2N/uvQl6gGx4bgiePIb9arz+0U
 AIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSiFpefnwqGsQxlF73UeZNcosVDLd7kx/8RbZQ5Fgqc=;
 b=R1HFU/FsofmNoAcd1hbl0NPb6AsNHJ7e0gSnyXdk3I0XsllUoMNYd9hHjAyoFmsLl2
 D7i5vuKUrNp2SqhrmiS3J0sgat0c6m5gR/g/kgWa2R7UaCUKEqvo1wqpynELUNovfhP7
 fT6zqeCi4y76ZhMUQOiWGq8GEurRLq90nMH7/2t9qX2QOQBQmNCkIFYzvkUQK1opGf1X
 P1BBS+QI5LMqAUkOU+xG3Ytde38ODwMKogyClgbfVSqe6+opIrfOJDEZ0O7ROYWp6On0
 /1i+9/9szNC+XEztkk30rCPUiMmlWOPxgiGD1trMvNiHTsYuUgwbGmxRmuKHHO1QWdMB
 EIUQ==
X-Gm-Message-State: APjAAAWUEnGlRq47dw3WIxfTk65Du/i3SEJ1kADWA+ja+5CtNNGba8hN
 hjaqTZ2lKcNu/FATIKuy1KgCX+A723oL/Q==
X-Google-Smtp-Source: APXvYqxEX7KgYha/GjNe+vKR+nSMnYUX/6du1q2Ng3NgZa8NLbMSqF+1I1I5wAY8MQva2HeOLj54Xw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr18845683wrr.5.1561999203905;
 Mon, 01 Jul 2019 09:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.40.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:40:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:14 +0100
Message-Id: <20190701163943.22313-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-devel] [PULL 17/46] aspeed/timer: Fix match calculations
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

From: Andrew Jeffery <andrew@aj.id.au>

If the match value exceeds reload then we don't want to include it in
calculations for the next event.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20190618165311.27066-10-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/aspeed_timer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 8d6266b0fd8..745eb8608b5 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -107,6 +107,11 @@ static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
     return t->start + delta_ns;
 }
 
+static inline uint32_t calculate_match(struct AspeedTimer *t, int i)
+{
+    return t->match[i] < t->reload ? t->match[i] : 0;
+}
+
 static uint64_t calculate_next(struct AspeedTimer *t)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -118,12 +123,12 @@ static uint64_t calculate_next(struct AspeedTimer *t)
      * the timer counts down to zero.
      */
 
-    next = calculate_time(t, MAX(t->match[0], t->match[1]));
+    next = calculate_time(t, MAX(calculate_match(t, 0), calculate_match(t, 1)));
     if (now < next) {
         return next;
     }
 
-    next = calculate_time(t, MIN(t->match[0], t->match[1]));
+    next = calculate_time(t, MIN(calculate_match(t, 0), calculate_match(t, 1)));
     if (now < next) {
         return next;
     }
@@ -141,8 +146,10 @@ static uint64_t calculate_next(struct AspeedTimer *t)
         qemu_set_irq(t->irq, t->level);
     }
 
+    next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
     t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
+
+    return calculate_time(t, next);
 }
 
 static void aspeed_timer_mod(AspeedTimer *t)
-- 
2.20.1


