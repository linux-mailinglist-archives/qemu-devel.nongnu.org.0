Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C4563088
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:47:34 +0200 (CEST)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DFN-0006Om-5Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D8Y-000057-1i
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41868 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D8V-0002rG-IH
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:29 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S9;
 Fri, 01 Jul 2022 17:34:09 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 07/11] hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
Date: Fri,  1 Jul 2022 17:34:03 +0800
Message-Id: <20220701093407.2150607-8-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S9
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfJr43AFW3Jw43ZFyUAwb_yoW8KFy8pF
 4UZwn7tFyfZF10grZ7Arn7A3WUJa1kJrySqr1UCan5u345uw15JFn5Xay8AFZ7tFZagws3
 ZF4kArn5JF17G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix 'calculate' spelling errors.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/rtc/ls7a_rtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index 85cd2d22a5..e8b75701e4 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -156,7 +156,7 @@ static void toymatch_write(LS7ARtcState *s, uint64_t val, int num)
     /* it do not support write when toy disabled */
     if (toy_enabled(s)) {
         s->toymatch[num] = val;
-        /* caculate expire time */
+        /* calculate expire time */
         now = qemu_clock_get_ms(rtc_clock);
         toymatch_val_to_time(s, val, &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
@@ -171,7 +171,7 @@ static void rtcmatch_write(LS7ARtcState *s, uint64_t val, int num)
     /* it do not support write when toy disabled */
     if (rtc_enabled(s)) {
         s->rtcmatch[num] = val;
-        /* caculate expire time */
+        /* calculate expire time */
         expire_ns = ticks_to_ns(val) - ticks_to_ns(s->offset_rtc);
         timer_mod_ns(s->rtc_timer[num], expire_ns);
     }
@@ -181,7 +181,7 @@ static void ls7a_toy_stop(LS7ARtcState *s)
 {
     int i;
 
-    /* delete timers, and when re-enabled, recaculate expire time */
+    /* delete timers, and when re-enabled, recalculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
         timer_del(s->toy_timer[i]);
     }
@@ -191,7 +191,7 @@ static void ls7a_rtc_stop(LS7ARtcState *s)
 {
     int i;
 
-    /* delete timers, and when re-enabled, recaculate expire time */
+    /* delete timers, and when re-enabled, recalculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
         timer_del(s->rtc_timer[i]);
     }
@@ -205,7 +205,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 
     now = qemu_clock_get_ms(rtc_clock);
 
-    /* recaculate expire time and enable timer */
+    /* recalculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
         toymatch_val_to_time(s, s->toymatch[i], &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
@@ -218,7 +218,7 @@ static void ls7a_rtc_start(LS7ARtcState *s)
     int i;
     uint64_t expire_time;
 
-    /* recaculate expire time and enable timer */
+    /* recalculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
         expire_time = ticks_to_ns(s->rtcmatch[i]) - ticks_to_ns(s->offset_rtc);
         timer_mod_ns(s->rtc_timer[i], expire_time);
-- 
2.31.1


