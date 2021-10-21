Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF43436AE4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:49:51 +0200 (CEST)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd8Q-0007oZ-Tn
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HbRxYQgKCl4SQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1mdcza-0005KS-Pl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:43 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:53053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HbRxYQgKCl4SQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1mdczU-0003d4-9W
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:42 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 m2-20020a17090a158200b001a18e07bfc0so851787pja.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=gsgS+O+ZnQJT7cHjvt2nqC1oppN/KoIkhcZMh9EV80E=;
 b=DEN1RpXuJ84cLn3R3buhE8QzacxLK+sdpZq2cfvoWpxYXAeO5XZn3rr86eecHzHxbi
 HzI56kUO5cvWy3EuIUWUXf/0BRhOX1nMK3dMb9jowDVHblA3773RPTju8Uem8dd2KdIP
 8m7c0tAVgPaCRbBcHF1+3z2jDv8y2ocHqdKFlp39Pa6kCC5wkq6XH4PQou4fEHYPajEs
 CETKELzIfCFRP1K0Y6whc5u4jgoYWkBeMwHGIhfQwWnL74a9XR/qObk8AP+eVeeGAUvJ
 wwTHZlLEm4R/4DHwVQitpCmUzJvOEDsAJtkRGa2grflln+P7Dlo0u8N0VpU3oRwTTc2x
 djGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=gsgS+O+ZnQJT7cHjvt2nqC1oppN/KoIkhcZMh9EV80E=;
 b=j5mETtQgzWfTW26Iow9EiKqSj9Xrga7cyqAOGch11pRmjbG9rLuPgvBDh2npR9P0xM
 AtmCN9735RpQ4NcrdLdpVs1cb5omlmsZgQlLr7rFeiJ1bxcMVeBNZErzxBFH6Z2kCvYd
 QKjk4GIjxG17WCMSzM1rg7aCVEmYgR94Y8RtPrMfCSOH8kb/L1+qFoQuVtOlLmStgjrU
 S9K7qv1kFlUDRuZk8ff2VOr2jK0pbtW7xYwZC5LNvHJRAfvcG0NBMBbwbb/Hj9X92ABU
 xw6UEj214cO/KNWQN5eYLPD/VTXZcOgGI5O3ox+Lax2oLjlsnMVD+yoib2chkFBxlgjj
 kLyA==
X-Gm-Message-State: AOAM532TtznUdcEssxrxK1Y6BbGrKfTfm5ZDna/iK/jQ6guZnvCXA5KK
 pOZA5/Kqc4v+GBylbyHW++iRTWTq2iyORA==
X-Google-Smtp-Source: ABdhPJwcHK5ql4bYRKsT3/g61JAYkhteUPzNPE+zMQJWgIvKWxhsDcfLLUWZSTVq6KwflMRk96Bw3BJvxlS3AQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:138a:b0:44c:b200:38d7 with SMTP
 id t10-20020a056a00138a00b0044cb20038d7mr7294064pfg.5.1634841629377; Thu, 21
 Oct 2021 11:40:29 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:56 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3HbRxYQgKCl4SQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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

The ID can be used to indicate SMBus modules when adding
dynamic devices to them.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 2ab0080e0b..72953d65ef 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
         object_initialize_child(obj, "smbus[*]", &s->smbus[i],
                                 TYPE_NPCM7XX_SMBUS);
+        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
     }
 
     object_initialize_child(obj, "ehci", &s->ehci, TYPE_NPCM7XX_EHCI);
-- 
2.33.0.1079.g6e70778dc9-goog


