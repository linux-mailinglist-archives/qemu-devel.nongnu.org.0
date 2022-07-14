Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D7575468
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:06:59 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3Eo-0006fu-7G
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u1nQYggKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1oC38o-0007ID-C2
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:49 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u1nQYggKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1oC38i-0005d3-Ti
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:43 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 rm8-20020a17090b3ec800b001f07b25d636so1625099pjb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=DttwrmR57xLkaUZhlrTbzCDprlscSFViSKthUtCeZfZJkdXsGJFEUHg7YsqyTD8lUz
 6pn7TTkYp0c75hvC0BUjVr1SWIwebRrFy7zuliUPjH1l4IZiVEqV/LR0RxrZWFGOrJeb
 0XzPK1uaJcj//BFEEcCq96/a4QwtgmjLpjINBRjKHps5pg+1GmVSIaW/bMxNUfCq+rXy
 4XZUhWAF2Tzf3r6uKKjHmRYbZA21YXjATTaJSGwNMreow5F7kUAHE1NvpHXLN1nR4pXT
 y3lCftYJtge+AGHZo5G4riu9N4WTtVI8YdB4GVhQMLzGW0bU9mUkwtfqLvajpeszieW/
 uoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=BLMkJkQdJH7Rw7t/apMuSgMfZ8Dfqc5Ov+4NB9rwzf7jvvITDCtuc7MP5R+QT3ids+
 49ja22wQILdKnf1qFn5G8KKGh8dDMOQ7lP6VkyvXkQw65Ovz/MjsPikLk2zvvlnM69HQ
 WnWuHz/4coMv8eyM8+/4plrGlxXLbaXAJ5nPx13Q08bNgfCgMy+pc8HXLdfiY6o4D8EH
 70zLGVgMMIeU969wj9aoHrahggF41W8svcsT2DoTAhyFWrRndkBWH065/6TTMsVBy1Tt
 qDXDP9gMuyyI4mWC4E9RyvZ5wgEsTbZOz+XmtiKy7PVPptQT8W9mlfNzQYUvEdZ2/6Ud
 FqUQ==
X-Gm-Message-State: AJIora/xxAFwbUWszzueCIN5LeIe5jydQnPeSUc2DPm8L1XSan31vbxo
 dx5YGFF/uMn8CcEf+BGwIQHXYwHM36T2iA==
X-Google-Smtp-Source: AGRyM1s6x5rQQW0TRdgsavlJFM+Dg5TcX3yYzt4p6+bBBdh4IL3E1+G3pwhIS0sGwiPJbTs7MxttyDa4Vghrqg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:8cf:b0:522:93a6:46e9 with SMTP
 id s15-20020a056a0008cf00b0052293a646e9mr9921053pfu.62.1657821627807; Thu, 14
 Jul 2022 11:00:27 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:00 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>,
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3u1nQYggKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Originally we read in from SMBus when RXF_STS is cleared. However,
the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
module to read incorrect amount of bytes in FIFO mode when the number
of bytes read changed. This patch fixes this issue.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/npcm7xx_smbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index f18e311556..1435daea94 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
 {
     if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
         s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
-        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
-            npcm7xx_smbus_recv_fifo(s);
-        }
     }
 }
 
@@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
         new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
     }
     s->rxf_ctl = new_ctl;
+    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        npcm7xx_smbus_recv_fifo(s);
+    }
 }
 
 static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.37.0.170.g444d1eabd0-goog


