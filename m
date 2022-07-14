Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF957551F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:34:50 +0200 (CEST)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3fl-0003X3-OW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NWDQYggKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZK-0004Rg-If
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:10 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NWDQYggKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZH-0007cr-D4
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:09 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d18-20020aa78692000000b0052abaa9a6bbso1515039pfo.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=XcGRWi+Uq3bUGrRo38ZAwYEz0iHOnCK64maUEl9ROXqzjgKpP48sWNnZyOooRbl0dJ
 9neIX9YJNRFq+0paZCzCQi0dl2zrVZlFbgtRU4j24Q26wqSHxRr3FJ8XI6RD0o8e8VPx
 /WOCBfHL2kxq7r7pXGCExeFXSQaxQoYbT7HBa6l5VxVO9ZGODKkNpNgd9ZDtu7kFBxeu
 wrWOTMQ2tLXrZwQhimiAeNREQ0u7HhY3wQPh2j7toNqoDXJHYmLzwALcyr7IpgKmUfWu
 0xtKENKVAHx60e8cSbeSd1WTX+90jvQt/yWYLdawU0rVZM9PfFDItjae5UWTXFRtIXqS
 7eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=wMKMBMgHbCh30yAf3TILzQExiJAXBhCU/OG/pdU1T10M/u3uql0mplr8i6Q3ZUXdkJ
 3AoBF6Qh3KgG+IF+MdS6UAjv02+v4lRHea5U7HDyxj4ypb0ZtkIiWaGoBJp1KS6mbK81
 9XEfBFPPG2IXiywnnvjd+43Gh+ZhLR7j7KmPgY54eLJvtdPcRefas7WmB2dRBP5K9SFB
 Jm3Qfmo7TgsP8PS5H2P3X9SMHUnSH8860FPzCjLd73PJ44RrsYeWCkXHk9hP73bRZW8T
 oMexG8HmyPdDxZMHgzsGXHqelpIu/3s5Ihe6RgAZ3Zj5L4RzFdUUrVvkd/jIRCtqFjBL
 D9bg==
X-Gm-Message-State: AJIora86lD1Cwltd5t2S+sjXezoO1ryRrsIHh6EMFpiy543pGbNz/hft
 ZUUj1mqcgqdHLBuuhGbehZaoVy+BWccnjQ==
X-Google-Smtp-Source: AGRyM1tPKMAm9k3QuNHnZzgWS42WVpY/7SIxkke1Gz871CO8p6+jbx1kVJCKY1d6JyS16YGp4iGCl02PzIbsYA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP
 id u17-20020a170902e5d100b0016bece479e6mr9673854plf.83.1657823285678; Thu, 14
 Jul 2022 11:28:05 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:43 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 4/8] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3NWDQYggKClQIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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


