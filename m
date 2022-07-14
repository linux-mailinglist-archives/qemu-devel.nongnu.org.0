Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B25754A8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:09:47 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3HV-0003V0-8A
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3v1nQYggKCtAIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC38u-0007Tf-Nm
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:55104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3v1nQYggKCtAIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0005h4-Fi
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 h13-20020a63e14d000000b0040df75eaa2eso1555151pgk.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=RjcVFhyIX4GAEl1mVTudmEFRs/iPMZ4iGAvt+ywGlVMwqNO0+ZlwQxovezRtHh2ib1
 5ttj200phShCuOehgH/E566COzAFwS62ceEQeA6uonyjF3v+JyPvcSJzM2yVFulKt4cZ
 SvJVzh9ZZ3nhX/v7CjYhaYBVyY9U8mUzCAETQKV1MO9l6aOLyOd3o57G6WtHpBkb3C62
 3S0uvygwcGNFi2psnPoKIktT9YVb0lJp/fYG4Y5dGrSoUHbV/zLD+vIBrFFBVZ1USmn6
 1lrmZMQ0DUjn6o5WR4pvbY2KLZ4vlq+da8htFXOV1STrI0ZElksxhQFRRrVZNPcCahTJ
 x8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=eyWx205u7ebjO30VTYHlpjdjQ6118i+IxN7OMIhh+AC/lz63Ac6yV5VolFoZZgRqDe
 n+rOM/mbat7e04MHA6xtYjBMJozYTBfM5NNg5CLRBbQDgPM/v898uGsY0rpsQ2fVn5zE
 3SqHAV8HmjtQ+H7Eglg02jWId0UsJ3hp7B0cC0LGWKIX42KxsLPSU9+aBdmbTcbI60tm
 gjavyZWe71aSxFZxAA9QnOCFuXCJeAz3Tp6lJUgwA0iSt3RiBcynSFTDybntjyUJS85/
 39ouMTk4bP/ZOPjEiXQGmPRZjqTFRErfZCTCpJwLeivWsej9o3W8gNL25lec1AtWG7/n
 3L5A==
X-Gm-Message-State: AJIora9IkFqNIldxJpWbIpsGh9VGpnovEGDeGQzM9zX1bNHI7iTFmCrY
 WKOHQzadBxCs/gkf8RCusJ40FOHx8AUJYg==
X-Google-Smtp-Source: AGRyM1tM8S2V+OA/0TtjBoxheDuWl2fd7Ky708C+nZaj1F2hfII0xax7bOw3H9MYeNo/zbPo/VSRImtltPzJfQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:16cb:0:b0:52a:e731:f2c with SMTP id
 194-20020a6216cb000000b0052ae7310f2cmr9673018pfw.65.1657821631088; Thu, 14
 Jul 2022 11:00:31 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:02 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3v1nQYggKCtAIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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


