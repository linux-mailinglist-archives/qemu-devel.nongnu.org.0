Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320DDAECA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 15:52:45 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6Cp-0008By-T4
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5q8-0006rr-8C
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5q6-0002aW-TP
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:16 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5q6-0002aG-NF
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:29:14 -0400
Received: by mail-wm1-x344.google.com with SMTP id m18so2560082wmc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DYhYWIpkNTGZF6Z7QvCMAVE0Xe2dndRrS+aQ9kDVJU=;
 b=JpIAGpxLCgSwDtZrOYQwwXmH8wvqQi2nN93EWLtgdI5UoP7UBMUPa8kIFZ2UGfUnmp
 4VqglKksv1TWYynkwZEtkhldoKdoYUFmbxa0884FEZZqGlYmYPiC2SyRu0lqQf33tKcZ
 53tKg4Z2G7NIXkQ7gKMMvYYIjKjpWqS+dCSLvvGia/27cXaZj0yUPqSw3bbr2l6fRRkP
 b7DMdYgfWaEZFTLbR+He7Nqo/ExtFZIWy9RDON2lrjExvO6FtPIUPYOys3NQyksvMIdY
 YyBJ9qZAth4xBvjE4UAlSn3IT9zby/+XMUXnp7fNWApstG1f/CC8X0pFJr/3TinK6xb/
 DF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DYhYWIpkNTGZF6Z7QvCMAVE0Xe2dndRrS+aQ9kDVJU=;
 b=TJ85vTbW8Oe+dMOeUL4H+UG1EM6IviEIIzzLglpoDPm9mikDHmdWfQEe0A+ceRZWPF
 QLabFclQZVO0OrK4y4g7fCCPFvizHx665X+HTkDuMvfoBahoMhbbb8QZl5+CaoLLaydb
 wTCOB898elEESZAnfjZ0rCXba0EeJCmXmgpgYIlhaa3InsM7G5VIGsfusAKY+Cx2e0mT
 JUuo9ANW61UZ2C+M9ylqBATngq21OJAvSFpcY2yvkqZekYYeELB6zRt/Jy8oyupQd7OS
 h+7sLBONtHg2j3PTCjD3eVO+94g9bxmegHkcalcehgTyDUsvXsgFIyv8DNb9U/HR8Ohr
 pouQ==
X-Gm-Message-State: APjAAAWbqzvvohYHrNoUwcUIXSCu1Hd7Rfe7mpmJFEOXuNiKUxY0zf5s
 pRQMkV1/9vBIswuhiBH6ehrzHlOKSjeN4A==
X-Google-Smtp-Source: APXvYqwUWpWY0YO5ufLSjDlW6ZgD1ILOlVuJv+JSCRzkfbDNGMUnrnyhHZGAfi5zlrN0s0WR7o1OFA==
X-Received: by 2002:a1c:2e4c:: with SMTP id u73mr2840343wmu.94.1571318953016; 
 Thu, 17 Oct 2019 06:29:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n15sm2703392wrw.47.2019.10.17.06.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:29:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hw/watchdog/milkymist-sysctl.c: Switch to
 transaction-based ptimer API
Date: Thu, 17 Oct 2019 14:29:01 +0100
Message-Id: <20191017132905.5604-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017132905.5604-1-peter.maydell@linaro.org>
References: <20191017132905.5604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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

Switch the milkymist-sysctl code away from bottom-half based
ptimers to the new transaction-based ptimer API.  This just requires
adding begin/commit calls around the various places that modify the
ptimer state, and using the new ptimer_init() function to create the
timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/milkymist-sysctl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 5193c038501..66f86541114 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -31,7 +31,6 @@
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 
 enum {
@@ -71,8 +70,6 @@ struct MilkymistSysctlState {
 
     MemoryRegion regs_region;
 
-    QEMUBH *bh0;
-    QEMUBH *bh1;
     ptimer_state *ptimer0;
     ptimer_state *ptimer1;
 
@@ -161,14 +158,19 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
         s->regs[addr] = value;
         break;
     case R_TIMER0_COMPARE:
+        ptimer_transaction_begin(s->ptimer0);
         ptimer_set_limit(s->ptimer0, value, 0);
         s->regs[addr] = value;
+        ptimer_transaction_commit(s->ptimer0);
         break;
     case R_TIMER1_COMPARE:
+        ptimer_transaction_begin(s->ptimer1);
         ptimer_set_limit(s->ptimer1, value, 0);
         s->regs[addr] = value;
+        ptimer_transaction_commit(s->ptimer1);
         break;
     case R_TIMER0_CONTROL:
+        ptimer_transaction_begin(s->ptimer0);
         s->regs[addr] = value;
         if (s->regs[R_TIMER0_CONTROL] & CTRL_ENABLE) {
             trace_milkymist_sysctl_start_timer0();
@@ -179,8 +181,10 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
             trace_milkymist_sysctl_stop_timer0();
             ptimer_stop(s->ptimer0);
         }
+        ptimer_transaction_commit(s->ptimer0);
         break;
     case R_TIMER1_CONTROL:
+        ptimer_transaction_begin(s->ptimer0);
         s->regs[addr] = value;
         if (s->regs[R_TIMER1_CONTROL] & CTRL_ENABLE) {
             trace_milkymist_sysctl_start_timer1();
@@ -191,6 +195,7 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
             trace_milkymist_sysctl_stop_timer1();
             ptimer_stop(s->ptimer1);
         }
+        ptimer_transaction_commit(s->ptimer0);
         break;
     case R_ICAP:
         sysctl_icap_write(s, value);
@@ -263,8 +268,12 @@ static void milkymist_sysctl_reset(DeviceState *d)
         s->regs[i] = 0;
     }
 
+    ptimer_transaction_begin(s->ptimer0);
     ptimer_stop(s->ptimer0);
+    ptimer_transaction_commit(s->ptimer0);
+    ptimer_transaction_begin(s->ptimer1);
     ptimer_stop(s->ptimer1);
+    ptimer_transaction_commit(s->ptimer1);
 
     /* defaults */
     s->regs[R_ICAP] = ICAP_READY;
@@ -292,13 +301,15 @@ static void milkymist_sysctl_realize(DeviceState *dev, Error **errp)
 {
     MilkymistSysctlState *s = MILKYMIST_SYSCTL(dev);
 
-    s->bh0 = qemu_bh_new(timer0_hit, s);
-    s->bh1 = qemu_bh_new(timer1_hit, s);
-    s->ptimer0 = ptimer_init_with_bh(s->bh0, PTIMER_POLICY_DEFAULT);
-    s->ptimer1 = ptimer_init_with_bh(s->bh1, PTIMER_POLICY_DEFAULT);
+    s->ptimer0 = ptimer_init(timer0_hit, s, PTIMER_POLICY_DEFAULT);
+    s->ptimer1 = ptimer_init(timer1_hit, s, PTIMER_POLICY_DEFAULT);
 
+    ptimer_transaction_begin(s->ptimer0);
     ptimer_set_freq(s->ptimer0, s->freq_hz);
+    ptimer_transaction_commit(s->ptimer0);
+    ptimer_transaction_begin(s->ptimer1);
     ptimer_set_freq(s->ptimer1, s->freq_hz);
+    ptimer_transaction_commit(s->ptimer1);
 }
 
 static const VMStateDescription vmstate_milkymist_sysctl = {
-- 
2.20.1


