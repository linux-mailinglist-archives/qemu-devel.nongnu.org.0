Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314A575552
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:49:06 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3tZ-0006UJ-5P
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3X2DQYggKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a0-0005r2-KX
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:52 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3X2DQYggKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zx-00085F-WA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:52 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 l16-20020a170902f69000b0016bf6a77effso577322plg.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=mf0oDkX7fjw1v48O0pywLMLCuTCMDdPWLFJp44Qw4B7l6CV+7FO38XDw+8tvASslJN
 hyUiCc6pMp5XkHZSDV6pB5dNqVKR84RW7+sV56uXOmAmZVJMkQ8gAS2UKQLCgsgoixQd
 sxDrywkKOqe0YoIF9ggx9yMkUY9RKDTY1VkQsHC0PS3oxm0OKnAEzYyurE0CoyoQNROh
 tGqUtCNuVp8hWnxbNFZDJUSAAdYm5+aGTSxyL3g1w8DKbtaWQQMhMARvRVXUzbe7tsN3
 7YTQ2b0TEw9/o9RhnQuK0sRjnrhmbAHQJcxPd1TnT94btxVhtlHuihj+6G7zfLylzPHY
 JIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=RFTYIuU2wFwOkHDXpofU5kpUTPF0fg2OEx1PJgEsqEickS1GBmrXcn17VGChrj0sTj
 v+Elo6VUyOP0UeTXR/j0QHgVWMjsN2p8coQQ8d4y1kokE1UaImoOaTDJ0YFAjYk7Oigb
 XfoQuoyX2PELhpOPEX+EpbMY4vRiUCMCikDYkK5g06OYbTsGaiXvvrIa+N3hJvar1rd8
 Dh8Hl5oiu+DcBb7rVWW32jaKjFG24u4HaYstjY72+qDVP1T55+c6VNCJu3h7qqJULfTz
 u46aBGfmachezOfXywYPMa0BE379CslzkH7CjZ2FymixuvIFF3yXzE6HNRHTaC7BxtWd
 57CA==
X-Gm-Message-State: AJIora+DBUVBSN0cf1x46jS8S9BAPzGmuwLoGhWmRBR5HufD81PZVrB3
 V7hLgBk5oPpQ2kIM2H7qSwuSMqCihFcAmA==
X-Google-Smtp-Source: AGRyM1st6RhAplA74H0c+ffisHfRmkY5ozgz7DSxEM4Y6vG+SK5T1iyWdVzlsazPVSrNJtXNJ2iwnNZCLKCovA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr627285pje.0.1657823327147; Thu, 14 Jul
 2022 11:28:47 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:32 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 4/8] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3X2DQYggKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of write only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.37.0.170.g444d1eabd0-goog


