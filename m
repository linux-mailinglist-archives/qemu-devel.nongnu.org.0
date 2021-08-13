Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92D3EBECA
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:36:37 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgj6-0006iB-7j
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hgEXYQgKCvMrpcVjoncbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh7-0003b4-IE
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:33 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hgEXYQgKCvMrpcVjoncbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh6-0005uO-7l
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:33 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 o3-20020a2541030000b0290557cf3415f8so10779945yba.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fBTb7vyUBBK9c1WMPvEoozt6gZbXUJdhxvxRA+h09qU=;
 b=ofcB2VN8m0Da4rY+DIfxwdFxB2gUHDl6lMYKOlSg/ybyVvMsE5mfr1QGAqaWJ4Pnww
 vhniN22CnNJRoDr/bgerZwF3ZHwpZa3GYLTNk+gTjxLBKMpVyPuvX1swR49JPxgNC/eJ
 w3DVHYLC73mvuH0dN7LUYHC6Ds4JbgKUc66rDv2D0yyetwW2nXD5i1k+s+ISYmpoVxj2
 Iu4CKvh6afDzcO+wS+6APrYaYI9Auc6pXjhSijNcXc0kGPOsSaO7gyt6ziiCXeXdweFe
 B3yh62aH6Q3Kv/OJOvdVhu68Wdr+il7kY3XrWe/gucbHiZOpoD2wLT/XQDWxPzWg1Sho
 pHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fBTb7vyUBBK9c1WMPvEoozt6gZbXUJdhxvxRA+h09qU=;
 b=KhNYUqgbVufHH7SXzOdGJel7PZr+ZOnT0a2Wa2yFU8TL08ASBVFQJS4VdjFInCvOat
 bNsjKfjEcZApicSzuyZAPmOflucDWYHPaIWmEaNBL+YDsiGwhMrs3xJogHalnDcPT748
 4bb37G/iqUDRJUSNV3+so+yMUzFDtQcRUrsgDuWpRQUCz2EwvbsvfkEQ4IWXXdHXchQG
 kuMw52ZVB06/DZBcxT/DXfBpYCh/8oHf1mGADy6vL25+qIyiDawGt0AqU6/C2QWM3exx
 84Wh3KR0Y/s6g7XRCOKSe25sSBxsBVaus0S7hA72XZQ7XBihqnjbBM4UAsi4xeQtVyaD
 S9PQ==
X-Gm-Message-State: AOAM530v15ghy6mn+kefz+KHF+4hJISNLMbYpe6a7oMXjFhTEC2B8JFa
 A0e19KmjTQY7X5FD0Zi1/MuLFZYziye6sQ==
X-Google-Smtp-Source: ABdhPJw7ieKwnyxA5GXNzygkCUYN4qRdc0eU8imBHJ+ThPvxBt5UAr2yPlOESNqR+GFV6MAcdy1siKunFJgEXw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:ba44:: with SMTP id
 z4mr5728340ybj.476.1628897670502; Fri, 13 Aug 2021 16:34:30 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:48 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 2/7] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3hgEXYQgKCvMrpcVjoncbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Originally we read in from SMBus when RXF_STS is cleared. However,
the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
module to read incorrect amount of bytes in FIFO mode when the number
of bytes read changed. This patch fixes this issue.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
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
2.33.0.rc1.237.g0d66db33f3-goog


