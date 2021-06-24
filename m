Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580D3B2B62
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:27:48 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLeF-000083-7M
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaQ-00019H-IS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaP-0001zM-6p
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so5140969wms.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95CO2cub1d4DnpPQZ+/zlTbJN/w6WVtkbtfzlWs4fTI=;
 b=ksDzswNCckDxji3Bl6trfWAvEnm6F14FwFoOYX/9QRPMoSZ41YFEJKvLqwrGfBeCdb
 Lc77OJEyi3IXXX8UvrNlbT7tTAthwLo7tdTUEV0UqwpU3CUGuvSo2KxS2my3me2ewvlk
 SwdobRd8ipVSX97iBaQONjv9gKL4hBD/dQxleUcvw/zZZLXwcfOO+VknMqfzUudknEPG
 cggQ8pZZfXbdtjWtPGH1L+woBmSrMydwGqGAlUv5xZkKf41LDjdnuB/WUsOdxpSR0Eha
 3HJOcfEBKA4SHiT0LYrxdR0eCvBZRJ9wnRrnaNBAx38f12AC3IQGp0pn6fedwqiu9m6c
 E1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=95CO2cub1d4DnpPQZ+/zlTbJN/w6WVtkbtfzlWs4fTI=;
 b=inX2Odvmgaxfvlaa9yMZ/KykthyHshl1mqAFWWa/vgN/1Cev6F5E1QzoK50yGXijsw
 F/t6rpzm/jQJl5MoshEPbWO1jDeR82SbEl9txttOoq0s5txXKsfuyOs+fXilJDYoAchz
 vGi2E3FSWfovrH5b+5TUC6o0gsq0TD3MOhtUNq+bH9cNSnWIpQy5m+Yr9wnZQsQAEYLV
 ZDYjidBPXQpdr7o+PEZQ39wSLNVkFS00arzLw8WCJKh0BAXXcGoKt7HEhbgJlRsCg0Pm
 oRMRoj6E6zXAswReo2GjcPk8MT+VEV5tu7GVUMCxVXQ07nZIh1LxxpYkvIJiVrTdauCR
 KRtA==
X-Gm-Message-State: AOAM533rTXyQNtDp+wCIiGGkLEg+VePoU3u9jIQMZ30qX93I2GTuKZNK
 ODQsDt5vhmMc54q19v43Ta+vtUl4GgNCuA==
X-Google-Smtp-Source: ABdhPJwD9cVJ/Hez0SmaBYUYmV+jWEe0QU4M9sGVC0+R+7aU1lKGHSeIb2uGroldqbLT4CSZUGwsXw==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr2992920wmj.19.1624526627738; 
 Thu, 24 Jun 2021 02:23:47 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v5sm8047679wml.26.2021.06.24.02.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:23:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] !fixup hw/rx: rx62n switch renesas_timer.
Date: Thu, 24 Jun 2021 11:23:34 +0200
Message-Id: <20210624092336.1078504-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624092336.1078504-1-f4bug@amsat.org>
References: <20210624092336.1078504-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixup while reviewing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/rx/rx62n.h | 3 +--
 hw/rx/rx62n.c         | 6 +++---
 hw/rx/Kconfig         | 1 -
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index c35bf3998c7..a34b845e1e7 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -26,7 +26,6 @@
 
 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
-#include "hw/timer/renesas_tmr.h"
 #include "hw/timer/renesas_timer.h"
 #include "hw/char/renesas_sci.h"
 #include "qemu/units.h"
@@ -55,7 +54,7 @@ struct RX62NState {
 
     RXCPU cpu;
     RXICUState icu;
-    RTMRState tmr[RX62N_NR_TMR];
+    RenesasTMUState tmr[RX62N_NR_TMR];
     RenesasCMTState cmt[RX62N_NR_CMT];
     RSCIState sci[RX62N_NR_SCI];
 
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index fa5add9f9db..626d027a2db 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -163,13 +163,13 @@ static void register_tmr(RX62NState *s, int unit)
     int i, irqbase;
 
     object_initialize_child(OBJECT(s), "tmr[*]",
-                            &s->tmr[unit], TYPE_RENESAS_TMR);
+                            &s->tmr[unit], TYPE_RENESAS_TMU);
     tmr = SYS_BUS_DEVICE(&s->tmr[unit]);
     qdev_prop_set_uint64(DEVICE(tmr), "input-freq", s->pclk_freq_hz);
     sysbus_realize(tmr, &error_abort);
 
-    irqbase = RX62N_TMR_IRQ + TMR_NR_IRQ * unit;
-    for (i = 0; i < TMR_NR_IRQ; i++) {
+    irqbase = RX62N_TMR_IRQ + TMU_NR_IRQ * unit;
+    for (i = 0; i < TMU_NR_IRQ; i++) {
         sysbus_connect_irq(tmr, i, s->irq[irqbase + i]);
     }
     sysbus_mmio_map(tmr, 0, RX62N_TMR_BASE + unit * 0x10);
diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
index f9cb892633a..845ef416e38 100644
--- a/hw/rx/Kconfig
+++ b/hw/rx/Kconfig
@@ -1,7 +1,6 @@
 config RX62N_MCU
     bool
     select RX_ICU
-    select RENESAS_TMR
     select RENESAS_TIMER
     select RENESAS_SCI
 
-- 
2.31.1


