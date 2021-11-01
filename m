Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2D4423F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:28:25 +0100 (CET)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgj1-0005LG-PL
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3D3eAYQgKChIECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1mhgeo-0001jt-Ou
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:02 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3D3eAYQgKChIECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1mhgen-0002vT-Cy
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:02 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 g20-20020a170902869400b0014002b0f5bcso6674950plo.18
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pXfgJHvome9hq7DD3kgavdSisX+d0Zxf80aI+vn8Zlk=;
 b=F/odgL06mHj9hb0bXbwtWGyI4vGh0hGbE7wVh8tg5zZPV1yWzhOhTzaJCs97hF7+cs
 gB28R6tuzrb9SnodIP3h8BShJ+FMH8xpNJNaMG2SjBTsYjJMFCHE2Z3Pq2Lf16Mo4xFB
 9A3q5HxuFwDb+0kZ3mrn/VzV93rhOwxlKsaF0UHmuFXqqoxvHgsbERdm+0ozpfj3IMdS
 Xgp/X1PFNlDAol8cA9RfrpwuX6eTkVZPLNzi/j2+PZ/BawxOil4iDWbbi36uFwxDutV1
 4I83N6mEt0/UlwGd60wRZmIFqQvVSIh4JD5fk65C12G7izVzvTO0ZCOTk5V3+uuOSbMb
 ZctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pXfgJHvome9hq7DD3kgavdSisX+d0Zxf80aI+vn8Zlk=;
 b=dkj+0SI6gYYh5IF2FydVC3ODffGsff9pWNnaenLnbYflVL65ppmPeCQPJkmDXo1OHp
 +mTpZGuGilZ2A8D8f3qJjZ6AzDJVLQpAtE1AEoYxe3z9fZXdovup6N3fUlL49HfEbnFN
 63EC8PCyql32feVXCe3bZZfHbTvgIIEYAynuPHfFJOF84dlmahFcDt1fmRvk5lKqOb90
 IEXhWIU51+QzlLorrjfwFs9H2f3KSvuI6K6/LBlhjB9AMx2Lv6+xuZW8cex2Q8dVMmfP
 lpTEwko/4yUo5SlVMUr7gb7KWaVpDwQcPedq0b8B+qxFEoqqih694gpQyx25fUElV5ZZ
 yuRw==
X-Gm-Message-State: AOAM531FTyudjB/XYavcY1poNkGyIOnZjuJkoAdNbpQ+le7LbLt6DYj0
 tn3VXJwgTiKD0n8P1oSCQ6CV4eErJgQJ0A==
X-Google-Smtp-Source: ABdhPJw0FKrfqjt+ebZNa7yRazo5cpYYlQ9KbCZV78nQz++Mi5usA4T4XYJoUgHieZPLbe0X8/qRIoxeVcyCzQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:d317:: with SMTP id
 p23mr2266383pju.196.1635809039239; Mon, 01 Nov 2021 16:23:59 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:42 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 2/6] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>, 
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3D3eAYQgKChIECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
2.33.1.1089.g2158813163f-goog


