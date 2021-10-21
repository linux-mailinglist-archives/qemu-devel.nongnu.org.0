Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77F436AE2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:49:46 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd8L-0007bz-C0
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FrRxYQgKClcLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1mdczN-0005DX-5S
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:30 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FrRxYQgKClcLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1mdczJ-0003Dy-Hs
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:28 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 z8-20020a170903018800b0013f23528cb6so645697plg.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fAqAMR6EyliijFOAc7rsq13AWc3asmznUg+7CYurHZc=;
 b=TwjCUAYn0+gDtVov0Hf7YCnyrQBjfS9WoC0+l7khILqNiHf4gnYF4GWFboiuuConop
 2cOqFnAuLPjN1dnhG/2W/nS4SULd7UQrBZ3OGcmXSlwa6D143l5VJzOQu3MldHLFfohD
 mMOGBE4srruZO+zCCLjzh8MlPPVuuGctXsjxrp/lcm8JPXlx1SECE1W0HINs0jp+Z/4n
 OFWFmcrice8/Qe+/AFFlnmtZbZDM9Vb2HBm251VihrrmKibc4ILLXXyTVla2yeYA5ZUD
 MvJ6qenupUhvx1cgF5zq3Mm2+OIgm07DJIvMksHJCHM7ZtY45JgUTw3aWhHS93IFNPFL
 QuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fAqAMR6EyliijFOAc7rsq13AWc3asmznUg+7CYurHZc=;
 b=WxyqZkLyfwsvsvXacqopwW4zZMDJ4uYS71Qu7cn1wv7YdK/ZraThjT9sG1oKtO0b63
 drrSLny4J8e4evANB/YWz8eNoXMfey3vfJf3a4fD5Owqa9qTMPlMYb9pLsV91C50Fz7P
 X6gpq5Q/+GYff8hNjNEZBo/AET8CRrv/IGD0EWhqfRJC/Zg8iE7KpNUwUdgYCTLaqwla
 DZuEDLiQPqdX2WyusS98Jz/uszWMMUkZH/ETugw85Mk6nHoeIhsyDFcaKIpX93HpfwAB
 nSdPV+kvs3ftpANmJPvV3y/ZGgfm9z+v3nGQ6LvDQcihUAMBDT08LPjd/8oWnLub9Ufn
 wVYg==
X-Gm-Message-State: AOAM530K0tf7/AIyLUoTMlbV1MlfHknUagx6ja3oUEIEuz5iQWVD5KY4
 d+Qi9T1eS1DQ5vUA64HOOSkBULr/JyBKuA==
X-Google-Smtp-Source: ABdhPJxj161If3ZQiMkUJUCgahJK6OaRIK5W5xZHqrNtDbktdSJhnZJx2LNqFNNbrFYQq/NblS4DtPJmbsrHUw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:6902:b0:13f:c1cd:88f1 with SMTP
 id j2-20020a170902690200b0013fc1cd88f1mr6853697plk.36.1634841622820; Thu, 21
 Oct 2021 11:40:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:52 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3FrRxYQgKClcLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com;
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
2.33.0.1079.g6e70778dc9-goog


