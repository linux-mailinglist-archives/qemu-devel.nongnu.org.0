Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F35AC340
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:37:55 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkCY-0002LS-4n
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1N-0007ob-3J
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1L-00030v-I0
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso4047497wmq.1
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0FTDZ6g8QqQ2hyeBebMAc1epUTGYlrXgHLi8o6Y8evU=;
 b=ACCRbBV2KKKjfydEg6LUcCU0es7lB8dYhBWxXEGOlXiRykGYTZ/6esdDO34qyMIzCo
 utGzyWVMt9x2H9GOC/f8VoSAxpeyhn1slcsg98ScOj5czeBkGx71CSYWKOZyZHCis4rQ
 Lv0L5mxd/+vebVqnv5YyIL6O5sSgdOKFNpuizZkMShS7n6lS2Etz2ZrDXwFM8fkftVZy
 OzGFtocsDd7/Tnedu/QsPsjwNu8ZBHCG528tp9P1+/1ie2M9zY1IMmYBbMUrMvngOYtd
 qTmAxaf/ZO4+e4YFwpsO+NCqevu2F2mgsyOE7GaVHNKbyc52hu3E3mFNsNHe9+8+xB8M
 Hdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0FTDZ6g8QqQ2hyeBebMAc1epUTGYlrXgHLi8o6Y8evU=;
 b=Yh4vnfTEQKagI4v48qlHy6NVH2KV5bzNEXwk6iuG2uDTZA/yE4xyu9Uf9NqTBE+vzN
 AGmkuS9HmocDSb7NLAsS0ju8aPIC4cARTYpfqlrfVn+E/3RA2A0tdIVvsc480rPmUp6d
 O+sj3PxMk/xuKEzurBnqR9Ezmnr0E/UX4AUYA0xEPLcfiqvh03vG8Hj0im7dUGvXk8/6
 QRzcCTcTFbsA13R0dXvIN8jZS3ttJI5CyKF2zrdBlWERFS+YPJMpcPQsd9zDqUfKU6w0
 uFcu7/iPsE/2w/6E2RFfgDDs2VK5vCO8+Ux+p/OhsjDfYgCW+AmdNgliR0aRIApBw6V0
 XCIQ==
X-Gm-Message-State: ACgBeo0ilkmfYQ+7CW2imcKWSitn9m4HTF8oDWAWpOR3g3Dy5O3J3X4R
 IMjQEp1fKy6Su8+9PpO27/13zqQ4LQo=
X-Google-Smtp-Source: AA6agR4/odvqz8fgpEcUbXKX2KPBkvGhyhxoNF+wKO8Jku9wSHkT7Y+oP7ro357mEQP+Q5nXWlszMQ==
X-Received: by 2002:a05:600c:ace:b0:3a5:b495:854d with SMTP id
 c14-20020a05600c0ace00b003a5b495854dmr7535789wmr.86.1662276377948; 
 Sun, 04 Sep 2022 00:26:17 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm12968576wmc.8.2022.09.04.00.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/11] hw/openrisc: Initialize timer time at startup
Date: Sun,  4 Sep 2022 08:26:02 +0100
Message-Id: <20220904072607.44275-7-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The last_clk time was initialized at zero, this means when we calculate
the first delta we will calculate 0 vs current time which could cause
unnecessary hops.

This patch moves timer initialization to the cpu reset.  There are two
resets registered here:

 1. Per cpu timer mask (ttmr) reset.
 2. Global cpu timer (last_clk and ttcr) reset, attached to the first
    cpu only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/cputimer.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..10163b391b 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "sysemu/reset.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -122,6 +123,24 @@ static void openrisc_timer_cb(void *opaque)
     qemu_cpu_kick(CPU(cpu));
 }
 
+/* Reset the per CPU counter state. */
+static void openrisc_count_reset(void *opaque)
+{
+    OpenRISCCPU *cpu = opaque;
+
+    if (cpu->env.is_counting) {
+        cpu_openrisc_count_stop(cpu);
+    }
+    cpu->env.ttmr = 0x00000000;
+}
+
+/* Reset the global timer state. */
+static void openrisc_timer_reset(void *opaque)
+{
+    or1k_timer->ttcr = 0x00000000;
+    or1k_timer->last_clk = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
 static const VMStateDescription vmstate_or1k_timer = {
     .name = "or1k_timer",
     .version_id = 1,
@@ -136,10 +155,11 @@ static const VMStateDescription vmstate_or1k_timer = {
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
-    cpu->env.ttmr = 0x00000000;
 
+    qemu_register_reset(openrisc_count_reset, cpu);
     if (or1k_timer == NULL) {
         or1k_timer = g_new0(OR1KTimerState, 1);
+        qemu_register_reset(openrisc_timer_reset, cpu);
         vmstate_register(NULL, 0, &vmstate_or1k_timer, or1k_timer);
     }
 }
-- 
2.37.2


