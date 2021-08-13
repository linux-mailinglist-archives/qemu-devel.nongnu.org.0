Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF73EBED5
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:41:25 +0200 (CEST)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgnj-0004qX-Nq
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hwEXYQgKCvQsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh9-0003fZ-CC
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:35 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:51715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hwEXYQgKCvQsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh7-0005vi-Pu
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:35 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 2-20020a17090a1742b0290178de0ca331so7777757pjm.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dc7dxPtCmrgpci5KEojWBc04+d02fyLLaA9F/0tdfw0=;
 b=c5N6Yd0qw/VS0Ke72ilXoCIflTKZUbV2KCiEhUlBBzLAeItvYJnWtYtED6kKFURDDc
 U8Arjq4ROH4CWuTcXoMlkSsrJPHZbl6D5H5hZPtk4rXUxuc5U0nlk7+kfLk+inSRniUf
 uzOIFMBH/hIVYNBL/djlqsLccRogTme+f7c7KoHXOq4vgwlhAyx9JvmBplM9LNvYShFf
 CwFAlohzz6n6aFnCKB8Um9nORAT6flMEaZO8PNSKxvV6sIQ54OdJz2RDQ5F3asHCF8oc
 akeQ3iGmiroa0zX6dRy1Haezoe5ruGJ71nTICpxdEcv9KJfv3HmBPuFUiJMkqxUW63jG
 jRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dc7dxPtCmrgpci5KEojWBc04+d02fyLLaA9F/0tdfw0=;
 b=T2f0m+1jtIgIfmXXtwXADLrJqPNzbVCLCc4JDlIzmBmjeObtIPj/HZJI4xUlo8hQNJ
 BhtC+76iD9zayN0AcWgijlYS5eKo3nLjxIqjiYsu0+vg8tI4QCz/jTEKKLg8vmEhdtNd
 sCo+CowJkh3nPOzaBfh3c7g2rhDl4Pf1WeTghXJbj+AMyCbsIKhDnMKXU4cSXNndGfyk
 gN7mRL5vkyNruDg6jPnStn0VcQXWYZKwtgPs7TeQFhg5SBoiSJnazcFh3ORqzVunggvT
 BRQ3+in7C5+tYG8vTz8TRUi2DCogfxxLzRa+qO5Bn2D7qnDh8iqm5xQlj5QBg5FAdVEk
 DPOA==
X-Gm-Message-State: AOAM532tqFstKHOdmQJ+jJm41Hbzryi29hq+OqwqKdFTgqkFnmDnvoRu
 TdHixnKXkQP7MzARUKmMUzyyfhY8C1Wnwg==
X-Google-Smtp-Source: ABdhPJxTdr7Lout0nFYtQxXSwzX21ELxyssrg9pIbrTvQiuZ3jrjm8pXljvN0JC1SnhU71Wt/vCHO4EoZb/rDQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:aa7:8058:0:b029:332:9da3:102d with SMTP
 id y24-20020aa780580000b02903329da3102dmr4667268pfm.21.1628897671891; Fri, 13
 Aug 2021 16:34:31 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:49 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3hwEXYQgKCvQsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
---
 hw/adc/npcm7xx_adc.c           | 2 +-
 tests/qtest/npcm7xx_adc-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 0f0a9f63e2..47fb9e5f74 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -36,7 +36,7 @@ REG32(NPCM7XX_ADC_DATA, 0x4)
 #define NPCM7XX_ADC_CON_INT     BIT(18)
 #define NPCM7XX_ADC_CON_EN      BIT(17)
 #define NPCM7XX_ADC_CON_RST     BIT(16)
-#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_CONV    BIT(13)
 #define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
 
 #define NPCM7XX_ADC_MAX_RESULT      1023
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 5ce8ce13b3..aaf127dd42 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -50,7 +50,7 @@
 #define CON_INT     BIT(18)
 #define CON_EN      BIT(17)
 #define CON_RST     BIT(16)
-#define CON_CONV    BIT(14)
+#define CON_CONV    BIT(13)
 #define CON_DIV(rv) extract32(rv, 1, 8)
 
 #define FST_RDST    BIT(1)
-- 
2.33.0.rc1.237.g0d66db33f3-goog


