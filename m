Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F02444AA1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:05:48 +0100 (CET)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOOC-00013g-1T
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wgaDYQgKCu0ljWPdihWVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--wuhaotsh.bounces.google.com>)
 id 1miOKM-0003Dn-9A
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:52 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:47989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wgaDYQgKCu0ljWPdihWVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--wuhaotsh.bounces.google.com>)
 id 1miOKH-0002X5-7m
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:48 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 e10-20020a17090301ca00b00141fbe2569dso1730673plh.14
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=efR0JnoYVaUP6guc+xz5CQ8KCIXNVxNPRHjKAJdjqms=;
 b=YhqHm2sJR2Lu2FuGEcviRLIiLtzzgfaQ+xtE4z28nALoH3CyYCgsDvchTG3zGbGfYV
 bQ2yPjq74VOyOxkP8KKEAI60lAbILu1TTRixvZ7KecEqDRMOdEdxzimkqyGR0h2Si89R
 xEDEmeF90esK++PkqXK7vHzhycoi0vv6XYj4KWO1tn8FVsIi3VNffAV/rjj87DW86uRV
 N7QcbQl3bZfw5qGAltWFi9YIv7GooDBrlJNA+Jm7wQb3EKG25aRfCRuO7/5awYVQPvBm
 PLDTJ8WfVlzpTpxwvE5uTkSYX48B52kxM2VbhD2J5cNSm12sleIYO3gqmomjXnmAv/cK
 rkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=efR0JnoYVaUP6guc+xz5CQ8KCIXNVxNPRHjKAJdjqms=;
 b=r7UQcfqyND34JtH//IhD7op/nnKsI1zg6MBtUCgLjigheG44Zn05E1ZVSfqc9jwZGd
 9vJT5AJO1Z3pAsNcbg/mdWxiZKh3BSx2TNuxTQmZA74YvIuG4sWeo3Sswpet86f9KLgt
 ep3eNsG3562b2gZd7n2ENIs9DtFV3LsOIwLKH+c0Zej5+BoqwtTDSc+W0NVNaEkrJHmX
 4KyRH18peRbnn/BTSj8lwyWzuTAhzk3f8G5MWG2ftWT8oTut25DzCdUShv1MSxpt7qqL
 SVXnq4zd5lqVWIJpY83Oy+Fh++bcSmYjGH2AvlqqtVuBDMN03o1LTqGQ7K4gxM86SuWK
 Rwsw==
X-Gm-Message-State: AOAM532ytgQmkAWceHoXJNn+E19O7SEULuriawNU5dcfYUyCbXasm8m0
 Pjvn6U1A0LNeyrJl4/N/3K0DWHYTgE6Wgw==
X-Google-Smtp-Source: ABdhPJzs7VedtkeLCKM+i1rQemXiLdCkDK8ibOug00aWsctnIs2d77KGXpUCZpAHRpX8bbSH029xw6R64M9Png==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:1c5:b0:141:fbe2:56c1 with SMTP id
 e5-20020a17090301c500b00141fbe256c1mr17610907plh.52.1635976898569; Wed, 03
 Nov 2021 15:01:38 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:29 -0700
Message-Id: <20211103220133.1422879-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3wgaDYQgKCu0ljWPdihWVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.33.1.1089.g2158813163f-goog


