Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE9565151
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:50:34 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Iiv-0002wZ-7q
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITh-0000wt-Cm
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:49 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITe-0004zB-97
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:49 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so2501996pgb.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPqUahiWt2M7Eg8LZ9lJoQvj046orfAZ2qStTlP4KlU=;
 b=SNJ9yR7wXI0SCMwatGbuW+9FViL3qfuFIcOlajfZJRnR1DJgCFECPJhezGtO4Fx38a
 L0gqZNbNG+2jjmrUtUJAOLn5dzQX3NpP5FKJERrfc9znWANV+n/fCirUDDA4MjKibxmN
 2n/Ao/WGowEoutFeAgw96cFrIVDIA42LdUKk9m9SujuLS9gSIvO4yGUIxZLwX5TEjba2
 Gq0x6UQblTB2//s6DSPWlhZmOIhn6oYrgd1X/ttH9PH+M6ARYFzpd4n/2vFX7kXo8TrW
 rDZpjqfo2CAKbliSoDWcXpQP8v4I/jHklFjDVXFuvs3hx+/W8zR+MR1WUnJCZm00Goj4
 W6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPqUahiWt2M7Eg8LZ9lJoQvj046orfAZ2qStTlP4KlU=;
 b=4sDpzlFp98GbHZT8e6vWdepPE2sqBZcQ8qHKOCu9u75XY2wLMC0SiPdhb6Gxfr0bpJ
 0MbCx9bLVBUmlvH5WIE+VRSgAgFGsnDPrA3mfvBG8qOBzblVFtLPa0cTzBW+VOrDUMpP
 lE92KwH4gH9pLgtKFXwmwgkzIH1BJ60FKcX3v4AXtNMeCN9013Rv7Vq276BKE1QKwjp+
 TVcdKSYkkA6yvIx0o6lzHuXlGuKh8XXp0AQ90gia42K3OxrDe0eIrRNAYLkjv2xpCmM5
 lcNC5eJfJ1lxY64easymDRcEaer4XtgxLWhVkU/w5N9WqITkn6QoJOG9TwXCqBNfHeKM
 7BWg==
X-Gm-Message-State: AJIora83X4suBHOFPUNxFDS4l+JA4/M1jvETBX18voG4Nsiss4CUSP8o
 6XzpnI1u0YRPgcVdJo9q9RD/J2k34JNbWvM9
X-Google-Smtp-Source: AGRyM1vjkRFT1T46lELtVIC+32LcUFzWjoGzyVtOZjJvvWia1pRCzwkSUKN+OWCFQoobIUxMQtSYLw==
X-Received: by 2002:a63:90c7:0:b0:40d:3c0d:33f4 with SMTP id
 a190-20020a6390c7000000b0040d3c0d33f4mr24329021pge.334.1656927284947; 
 Mon, 04 Jul 2022 02:34:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 15/23] hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch
 writing function
Date: Mon,  4 Jul 2022 15:03:49 +0530
Message-Id: <20220704093357.983255-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

1. Initialize the tm struct in toymatch_write() and ls7a_toy_start() to
   fix uninitialized bugs.
2. Fix toymatch_val_to_time function. By the document, when we calculate
   the expiration year, we should first get current year, and replace the
   0-5 bits with toymatch's 26-31 bits.

Fixes: Coverity CID 1489766, 1489763

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-2-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index fe6710310f..b88a90de8b 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -148,8 +148,9 @@ static inline uint64_t toy_time_to_val_year(struct tm tm)
     return year;
 }
 
-static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
+static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
 {
+    qemu_get_timedate(tm, s->offset_toy);
     tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
     tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
     tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
@@ -158,17 +159,18 @@ static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
     tm->tm_year += (FIELD_EX32(val, TOY_MATCH, YEAR) - (tm->tm_year & 0x3f));
 }
 
-static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
+static void toymatch_write(LS7ARtcState *s, uint64_t val, int num)
 {
     int64_t now, expire_time;
+    struct tm tm = {};
 
     /* it do not support write when toy disabled */
     if (toy_enabled(s)) {
         s->toymatch[num] = val;
         /* caculate expire time */
         now = qemu_clock_get_ms(rtc_clock);
-        toymatch_val_to_time(val, tm);
-        expire_time = now + (qemu_timedate_diff(tm) - s->offset_toy) * 1000;
+        toymatch_val_to_time(s, val, &tm);
+        expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
         timer_mod(s->toy_timer[num], expire_time);
     }
 }
@@ -223,7 +225,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 {
     int i;
     uint64_t expire_time, now;
-    struct tm tm;
+    struct tm tm = {};
     /*
      * need to recaculate toy offset
      * and expire time when enable it.
@@ -236,7 +238,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 
     /* recaculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
-        toymatch_val_to_time(s->toymatch[i], &tm);
+        toymatch_val_to_time(s, s->toymatch[i], &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
         timer_mod(s->toy_timer[i], expire_time);
     }
@@ -352,13 +354,13 @@ static void ls7a_rtc_write(void *opaque, hwaddr addr,
         }
         break;
     case SYS_TOYMATCH0:
-        toymatch_write(s, &tm, val, 0);
+        toymatch_write(s, val, 0);
         break;
     case SYS_TOYMATCH1:
-        toymatch_write(s, &tm, val, 1);
+        toymatch_write(s, val, 1);
         break;
     case SYS_TOYMATCH2:
-        toymatch_write(s, &tm, val, 2);
+        toymatch_write(s, val, 2);
         break;
     case SYS_RTCCTRL:
         /* get old ctrl */
-- 
2.34.1


