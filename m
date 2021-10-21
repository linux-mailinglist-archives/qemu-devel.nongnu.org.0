Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B265436ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:47:00 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd5f-0004Ma-GP
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3E7RxYQgKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1mdczJ-0005DD-6Z
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:27 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3E7RxYQgKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1mdczG-00033H-9V
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:24 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 ms23-20020a17090b235700b001a0d49be015so370135pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=prjL0IYXvRm4Htgay889/PxyOqJwqIRrZSdP/e3VblQ=;
 b=kUTCCJhU11q6/B+hRu+hcJZwYHti5BdJ8ONsVBMWaQfNdwIViTsd42LfdIrVrcEZF8
 xH0e9d13Jky0/9n2AUtDOuP3JtDQAs37j+JwkLDAEC12kZpX0hTwApC4kaTumWlvV0vk
 HsvNSctctIQmBseKJb89/iXiQ7nbW6D4mslyc+GtPGMFY3ijTip/hVEyP1Whmyt7iGH0
 fRBXTXNEVU2M1FkMkLLgiD8QeBnB7PRc+xygVspRBH1SO6wnHJ+lOH2nj/ODI5sQX4cf
 Qk+llLVRxiThjeFpoPcM5CSiMTC13WqdMWfbm4//FGHLn7a1YeZGL6HobROEKWFRHM4v
 Jpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=prjL0IYXvRm4Htgay889/PxyOqJwqIRrZSdP/e3VblQ=;
 b=nPCp/BnNcPHYqGVYaTEb//LzeAfDYBWO33/4f50lVKWLYVSjxm3eBV4iDEtEwsPuef
 EEDQHIg/cXRAZc6erTq6EF2vXx9cnuqYEfAKz1HBO4QdpH3pOJGzcCcvHW8RCRKxaUgC
 U/uZrdjGwCPriMqAwbzGru+gUGbHJ9Hr0LpAhzEWAMKvC9y91eDFI1luzHam92GlMI43
 jISAXjEdeVXfJbT5+cX2e4E8ACWLFWle777q0X/Zo+wqirgGntTqU7Ub23U7NoRUTTYs
 djiBX0WZjkCiCGpX8+vPs9EHINN1VlxO42y29z3Jb+iHXgCQwL98Eto4nDnOCoAVREpq
 uzlw==
X-Gm-Message-State: AOAM530GYWRUp4EWxn723t06c6m0M+5ERlHPpQC1d4XEOtATR2WOhvR0
 iu5UHrWWLsbxy6ZgtP0AGxx+EOhHns+wIw==
X-Google-Smtp-Source: ABdhPJxDO9cacwYoy0zo5m+K7kj1mCOfwHkLO65nEfXdAm7UYu1wU4rIj8QnIrK/8B885sFRGwPNzVyaitRN6Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:4f4c:: with SMTP id
 pj12mr3919834pjb.239.1634841619752; Thu, 21 Oct 2021 11:40:19 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:50 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3E7RxYQgKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.33.0.1079.g6e70778dc9-goog


