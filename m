Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C39436AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:43:58 +0200 (CEST)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd2j-0000aO-Vs
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FbRxYQgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1mdczP-0005F9-1y
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:34 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:53893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FbRxYQgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1mdczI-00038O-1a
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:29 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 z12-20020a655a4c000000b0029506c80060so560716pgs.20
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wQVZTwCslLUnQZGHmdjXJxmy+NVCTnayBulUiUM5Lv0=;
 b=YAOpda+wIs+eFGI05S3c7byL+JHH/fMQDsU1QWxZIb5hEBMseh54Wv55zJ5mdggSJI
 Mg0lLwfJEPe47nmlZ7x5PNZE58tUzpyJi5lW00V6vmRYCk3ogdgwQoEmEFgcYMDtOdxi
 QC+UwtDvedersO622F70hq/mDTK/qilJ+6OOVyFO5G/CljShAeSvsR42s5jVRfJUISBl
 eVDZ7RI+CL2IgVJ2SoaQaL6+yKLUmnmzjnbbW3vUzdkk9UzaySoPiogWZ2Shg8xmrZQt
 7Y46XcHQPHl/ap5CLnCpw6QfMMliSdK1/HFYuiBS0ObyGqTZLdnPBjmdKxudreNjsiBQ
 /RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wQVZTwCslLUnQZGHmdjXJxmy+NVCTnayBulUiUM5Lv0=;
 b=pvCTOkgGlqMCnF06enFxte1OFuNEi83blNEaBdE0SIyw6dnvMuHg9PPP0/LDKWkAO+
 41XzoeqkdpvAR16LKsZcEeINBzfZ57lmQF/8jYr7SpVwabWaQ+3JNiyp88OgWgC9vXWr
 aFq88QkjSHAVfqMpj+3pURNsXY1OGjGabRX+Sm98OTNfzPmRE8ERgyG1R94KNaPiwTrD
 BkyACdelB0ck6EiXQncl03NqLT7g4Zyo3ctodNE6AMi6nb9ktPnv4zOHs2qOOBJhd5JV
 ujIQPuYeWiuGJEuYWKKhp+0RizhPdvOgI07hWQn1g+qwc7x90z0D0hWLvzJFQ484F4uv
 1xHw==
X-Gm-Message-State: AOAM531wpplNkU7RQWoZX3fswylIJZsN+aQOc1eKy1cDazkUna8W26IG
 w+3WZDrEAimMl3pr6w1fLc/y0YQtR4bZsw==
X-Google-Smtp-Source: ABdhPJykbUzbEtQ5d6c5OccUXxQZ56FJaAv9djKqJJzndQcDrb0XNXl1i+9H49cigqnsrVULwWq/ZHunJvgQBQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP
 id c17-20020a170902b691b029012d02b6d116mr6599083pls.71.1634841621124; Thu, 21
 Oct 2021 11:40:21 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:51 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 2/7] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3FbRxYQgKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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
2.33.0.1079.g6e70778dc9-goog


