Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47C5C49C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 22:56:51 +0200 (CEST)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi3M3-0005Wo-0w
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 16:56:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43903)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3CN-0000P0-Ue
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:46:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3CJ-0000ai-QC
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:46:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42169)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3CD-0000WX-Qw
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:46:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so15244614wrl.9
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 13:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mZ6UaTHJQ/2uqJDbG+FXLikrSjiMTyAKTGAbvzcGyPU=;
 b=h7t6IQeAD2YH1nRXEGZwMsApACnrIidZ2SNCxC0shTAl4sTs6gdpS+r7NkRkaRIfV/
 Rlvk0jiHGAR5FiLDCO/3oc5JDg1y674JUuBGLMq1R5Di/DEoUL/X2uWcMlt4JIeZ7l2u
 HUwU9CgIQlJQqWiEH6YcS1Qp9yof+tC+SeNTW80q5E81OUb+8zGvcEzFVntYHB1xLbLZ
 O5XYV+JfNe9O8JwuVhpaOBTxhBWcnsq7dEV6FIyRMRUVZtwhdu0V1VtTCxjcdO1eXIxc
 do1uvvKP3yPmA4D07WboTXi7smFG+a2ZxS0j66976BGNGkjnqz8yh30OntMnnZbKz/oZ
 Oq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZ6UaTHJQ/2uqJDbG+FXLikrSjiMTyAKTGAbvzcGyPU=;
 b=tBBukOcQZgigUFBzPgTd/7sB6lCsctP0w/FFQhPmBijS3J7+BPt/zGJc8dVWjmHzhf
 QrbxPWGqmyh1jIp9+hJXb+1I6srn633zKpfqwwauZ7sYoXQMJOXdfRfxoDnoY6Fqs+sa
 MGMwAKfFEj4t6fkmIlQ+6f9NSXu1KXlCluqEezEj42u85LP1OGt6cD8IzrNwfRUjHaaw
 Z/EIhIBmN/epz5sjyR+jGvojndHab1BMP1frpQ17Aoq16rPWDC/nb2u/KcSVFY3m7sYK
 d+u10Q7xUn5FKtBlhgCt6+sPB10R1RchNTEmgTM+HBs+dnxrosvsVWLVRshzvIa6lWiW
 P5NQ==
X-Gm-Message-State: APjAAAVY9pvDZdBwBKgIS2Yvn9kAER6+m0b+D3EaEM/tFRLIgAUd67Ma
 Que4970N1t/f+gEh2SySdd5SoQURuKQXuA==
X-Google-Smtp-Source: APXvYqzrPHZuKwQLUqEUxTV/KIuOkrhKrBReEj7+ui6PfON5bX4YPDIer2IfRkQqWfxdfU+vRFyrkg==
X-Received: by 2002:adf:f589:: with SMTP id f9mr20206113wro.90.1561999202886; 
 Mon, 01 Jul 2019 09:40:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.40.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:40:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:13 +0100
Message-Id: <20190701163943.22313-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: [Qemu-devel] [PULL 16/46] aspeed/timer: Status register contains
 reload for stopped timer
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

From the datasheet:

  This register stores the current status of counter #N. When timer
  enable bit TMC30[N * b] is disabled, the reload register will be
  loaded into this counter. When timer bit TMC30[N * b] is set, the
  counter will start to decrement. CPU can update this register value
  when enable bit is set.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20190618165311.27066-9-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/aspeed_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 537f072cf87..8d6266b0fd8 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -187,7 +187,11 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
 
     switch (reg) {
     case TIMER_REG_STATUS:
-        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        if (timer_enabled(t)) {
+            value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        } else {
+            value = t->reload;
+        }
         break;
     case TIMER_REG_RELOAD:
         value = t->reload;
-- 
2.20.1


