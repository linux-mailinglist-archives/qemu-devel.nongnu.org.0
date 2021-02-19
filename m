Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62B320163
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:34:45 +0100 (CET)
Received: from localhost ([::1]:56994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEMG-0001Jd-9z
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKM-0000S8-Tt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:48 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKK-0002el-UU
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id n8so10583859wrm.10
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxgdPie+RvUTCfVCQTi2pXFqOkbO/zZNwTKdKRCc0hU=;
 b=jik1ALj6iSGRmktAn/ORa6p/FS0vdMhar2lVVUFdj786s2C8JrMhjLk3PP1oBIGHu2
 pr8Ug6kRQWxpMtRwOdraMMntS2xblQnNirbWPjbDDNg5g6c8JDaNAkjEX+Fd6ynAnzlM
 5Fa+U60TK54ls67xNPcZIFJyD4i6A8lwOsKR8RYtpbUSnhs/SlXqlh57deEKigNsThgs
 3KUHLVjVjgQKGTgzeBT+tcS1pE1pzz7p8y670LSD0DoxDISs3TkYBGy4pP7sga7wumAf
 CUnDxtZoTFAKYba0aQefiowdg2Zyi9mwIHJBt1KE3DSrQNZn/ngu76i/qeIw3Dtl6qNr
 gg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxgdPie+RvUTCfVCQTi2pXFqOkbO/zZNwTKdKRCc0hU=;
 b=mJh7B1PTtpMZY9UjpLAbKL5MC1bwW07kWKCgSvrOtSYF65APG5Dqi+8Fen0nH2xgdq
 Q7bQmiOZOe7O2vez4RfbxcingfFl8Hmw2hIurLnA+kQ3mKyXF6iBo/Y1deEIBtqTCEDF
 9eoQ82nyGIREnK0q2mT9i1kCeNYOIGcT96/Ne8pteFety7BJfUWWC0z+AeSzOrY8uCwc
 ZwML7lrH3bcVXXHLDMh0ghd8dM4RBl7h9Xu/JZfFMEiVG4EAdyhD0Oi+Pf68t+t4FmJe
 gT5fobEqPmx34TxV0Z4RZDfaLH37QYLyFQVFTmY429bMm9MllHFFnCySKJs2KmTZ8och
 Zqag==
X-Gm-Message-State: AOAM533aY336cb0APfVfMNfnqOpifzHs8WHejQ6iAil2UKwA0/VTH+MO
 oCfegD16+/yUgIrQi7IBsuW8RHazBO+GIA==
X-Google-Smtp-Source: ABdhPJzDpC0LSc2vy8nbDr7z4ZWI7wWIMHAuSP44nE32lN16nvWD/KFlj+FNFTNMHk9FC1XHTV7H6g==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr3189867wrt.41.1613773963551; 
 Fri, 19 Feb 2021 14:32:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t15sm13370654wmi.48.2021.02.19.14.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:32:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/timer/renesas_tmr: Prefix constants for CSS values
 with CSS_
Date: Fri, 19 Feb 2021 22:32:39 +0000
Message-Id: <20210219223241.16344-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219223241.16344-1-peter.maydell@linaro.org>
References: <20210219223241.16344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The #defines INTERNAL and CASCADING represent different possible
values for the TCCR.CSS register field; prefix them with CSS_ to make
this more obvious, before we add more defines to represent the
other possible values of the field in the next commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


