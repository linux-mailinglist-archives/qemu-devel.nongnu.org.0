Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63D575550
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:47:57 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3sS-0004s6-Ju
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WmDQYggKCnktreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zv-0005cg-L1
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:47 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:55859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WmDQYggKCnktreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zt-00082n-SN
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:47 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 k11-20020a170902ce0b00b0016a15fe2627so588021plg.22
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=MLn3dePojaqOfuYboTRLKZVoCwOEvHwBDCuU+uURDISko1txFuo8ogiJvFR0qzgTDJ
 hi5njeMpS6Y2RJ2VZcxZKs1Qi6kaRpb/H4wImmuk/7FSekY6ofs+nlhhuKKWTAdt7XdY
 CZs60l9OutALiiRm98T2m2Cxoy1oCcOY+I38anILmozB8mwAzpVckdFnwU+tXDrbo7cS
 nDELiHm5l5Ptjhyqio6sRjUnh8TE6ycdrmas2dtkG9XPM1NPDFwxzOQeIk/pIsOFl1DB
 eXqdqKocyr+FCUtN0ru4CfIqKJneNVNvvnSiu/Txcvd2pWbdUZu1QIuWL6/ok9mjf9tr
 6SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=pA7zJyz54ADOTyc63W/l/yRccDbBAIvCijPtGUcwrW8sm1wjvCaKGnou5VBIt7XOia
 760UR+/AXngUSmleT8SH2PQIETb5z+qQv0aZwDgnTx7colS/tIZvIqyPefksheVROPb8
 3qxrsmwgp1te/miIVtvK/XUXTnBpM98G+vu7akH/XpbTfh2zQm9gqqOSsw5LGkQQbVLg
 7P9O30fukjdJZ9heDe5f/1A7WwJV3IPkUlfvCSquCkpwEPEr0NIS7dGj3wlCS8JJGzNd
 2pVPSH+O9AhGU5FgA7iu33rJpDaF4lVmQg4dG01HGfOjetzwyBFq8nLPXKUhWQrGdKKh
 GYiQ==
X-Gm-Message-State: AJIora+ypCJoSoOMG81m36fNKfT2kyskIo8NMojqA5RKovkEf3eIuHQD
 MIJgeBxB7gSbHv101f1dgw3yZuYpLMeMkw==
X-Google-Smtp-Source: AGRyM1uUwR3eymv4q+rq9S0ETumR29OKMSec2ejnxNiPYOo1pjnw5iZC+EEKa49zy6T5wBCsW2XAUT6Eml4GhQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr627282pje.0.1657823322905; Thu, 14 Jul
 2022 11:28:42 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:30 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>,
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3WmDQYggKCnktreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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


