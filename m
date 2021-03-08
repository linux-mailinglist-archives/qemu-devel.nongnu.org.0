Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB1331576
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:05:48 +0100 (CET)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKGJ-0000YD-If
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlK-0007Xi-0T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:46 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl0-0007DS-MT
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id v15so12329027wrx.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NkgfjHifXa+4FrF0AQ8Os4BS+pn0bK0Hd28SCsYgWvo=;
 b=Il6H/5U/ezn3Oi72iThvZVcz7FJ9gY07yFGcoMK/VEEl1u8VyYPgARpaH8ZB9f7OgV
 g+x/4vmqYDlYu5qcpVUKNcjdQQXWiG5zAjp/wOItSMwjZMbk3EFOIBajEi0/0m3rfB+q
 lC7rYc5G+iE7f9Bzw27pJYsyDM0INA0wtUzaHEJb/AgTsj32yTNe+clPZr2BYxXcQn0k
 w2fBgWI88w4Xgs09DCHAVsqGuu+jO2eFPIpPbwxO6VAXKieUnksq2EODoYFWbYb5iF5I
 ULW9rRjZtLdyb75Bf+ct4WP3GTmsBt+rG5s2mUhNcaby8en88oMZ6aRj4XwuxE0PJEmH
 3Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NkgfjHifXa+4FrF0AQ8Os4BS+pn0bK0Hd28SCsYgWvo=;
 b=n2Wb5MYpDtOQQabAVQS4sMtqANnNL7cMw9NDxWVjarOHzz+Hv9AmDBJpg7KIcDEk/u
 t/IRuAMTYu9iGapQmbGUziZ33WJ9BGHfveUMoU3CjnxxUGx/ni8JNOdqslIgQ8n38d/G
 afT+T2rxBAr2q1c9AaY8PcvkNEIn4yigcQ/ACTdfGqhdvbflnyPDHb/Zrbi99yDfNItk
 5WkhGP14QcvVwbffwFjxTmXm0487lpivwlq/+dDkuNDFbRHH0V7SRQ7iXFo+hJneSNmi
 z/piVrdCUgVqwepxD0qX3uJMCJLiKZvx9kUogUxoNtx2eU/TDT1EFCkwrxWYI7Exrh2U
 F/Xg==
X-Gm-Message-State: AOAM532R5sraMghJbBecEqW8NbKfPgVhp384tXFUEXXqFfFJHtWvLEgP
 fKPFtsKzKD8T9HpAzAAClnD0iEO/EVmOhQ==
X-Google-Smtp-Source: ABdhPJyQYJC/srQ+GjhhdRF7vqHMMTuE1W7NKQwBn5zvBWfI8/6v7pOukgv6DHQFkfaBpGVHhNOxMg==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr24032558wrq.54.1615224805477; 
 Mon, 08 Mar 2021 09:33:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/54] hw/timer/renesas_tmr: Prefix constants for CSS values
 with CSS_
Date: Mon,  8 Mar 2021 17:32:43 +0000
Message-Id: <20210308173244.20710-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The #defines INTERNAL and CASCADING represent different possible
values for the TCCR.CSS register field; prefix them with CSS_ to make
this more obvious, before we add more defines to represent the
other possible values of the field in the next commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219223241.16344-2-peter.maydell@linaro.org
---
 hw/timer/renesas_tmr.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index e03a8155b2b..22260aaaba5 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -46,8 +46,8 @@ REG8(TCCR, 10)
   FIELD(TCCR, CSS,   3, 2)
   FIELD(TCCR, TMRIS, 7, 1)
 
-#define INTERNAL  0x01
-#define CASCADING 0x03
+#define CSS_INTERNAL  0x01
+#define CSS_CASCADING 0x03
 #define CCLR_A    0x01
 #define CCLR_B    0x02
 
@@ -72,7 +72,7 @@ static void update_events(RTMRState *tmr, int ch)
         /* event not happened */
         return ;
     }
-    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CASCADING) {
+    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CSS_CASCADING) {
         /* cascading mode */
         if (ch == 1) {
             tmr->next[ch] = none;
@@ -130,7 +130,7 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
     if (delta > 0) {
         tmr->tick = now;
 
-        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == INTERNAL) {
+        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CSS_INTERNAL) {
             /* timer1 count update */
             elapsed = elapsed_time(tmr, 1, delta);
             if (elapsed >= 0x100) {
@@ -139,11 +139,11 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
             tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
         }
         switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
-        case INTERNAL:
+        case CSS_INTERNAL:
             elapsed = elapsed_time(tmr, 0, delta);
             tcnt[0] = tmr->tcnt[0] + elapsed;
             break;
-        case CASCADING:
+        case CSS_CASCADING:
             if (ovf > 0) {
                 tcnt[0] = tmr->tcnt[0] + ovf;
             }
@@ -330,7 +330,7 @@ static uint16_t issue_event(RTMRState *tmr, int ch, int sz,
                 qemu_irq_pulse(tmr->cmia[ch]);
             }
             if (sz == 8 && ch == 0 &&
-                FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CASCADING) {
+                FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CSS_CASCADING) {
                 tmr->tcnt[1]++;
                 timer_events(tmr, 1);
             }
@@ -362,7 +362,7 @@ static void timer_events(RTMRState *tmr, int ch)
     uint16_t tcnt;
 
     tmr->tcnt[ch] = read_tcnt(tmr, 1, ch);
-    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) != CASCADING) {
+    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) != CSS_CASCADING) {
         tmr->tcnt[ch] = issue_event(tmr, ch, 8,
                                     tmr->tcnt[ch],
                                     tmr->tcora[ch],
-- 
2.20.1


