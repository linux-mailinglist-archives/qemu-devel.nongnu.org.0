Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA30444ABF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:12:47 +0100 (CET)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOUw-0003wP-PK
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xAaDYQgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1miOKO-0003Ec-Us
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:56 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:56198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xAaDYQgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1miOKH-0002YP-76
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:50 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 t62-20020a625f41000000b004807e0ed462so2105229pfb.22
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=PN6MgwhITl+W/ne1Iazq0YDgkUZK2QrCL2PDFrZEkEY9jTBiQ/i+RVxkUqXBYPh3Ix
 hbYyzLUXLaa36QKnf66odxXD1vbF0IBaOcxMZXPGXgx6jhXDg3lWXGOc/lC52kVtzRHF
 3GyiwsQktn8b475dvv+CwpF8GpeeCFqIqm9rNkjr/zqDPRhaFszAQKqN/8Jre8KwkNxi
 vEnL3BZvG4+6ucEjDB8r0QFuSrUycJ+JnatMSVEtutLIh+5ORds90EeCS96PMdWx2Qs6
 nWnpzWf6TLe8LH9IW7Os0HLa4GL0cVNglWBCRebBv5XhFUOO1P75+k086YUsdpaMtJv1
 hD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=cttTbyKEBuGIeRbBk5rVl7Gwlq3ovQWrQDektsuS93LdFPLMCpM1AqmZqVqbmSGSWE
 /sgPWNbJWHvNOJ76wyNZDG5is7jfvYZZsx6AWjgqRn6uAp87JOykxwKKHtE6FGnY3lBP
 HVf7PadE5eF0ot0+r6DriEhDZzhWpVflIBYfO6Nx/Os3lSUDjHyb/vFQ8OhGKfsFQdGU
 ix3TLcTa/4w5felZlm2br2PpAqyBHDcJOTsdvA1dy+RSyHBWJsf7t3kOzr7F4DB/pe/K
 8Dm0C9+EbQe5mX8QJ1RSQqBgSwa0D0h7MzHLu3JbbJ479uUF8imj0KuvmihwEmbhSH5D
 tfZA==
X-Gm-Message-State: AOAM5301W4e8yj6v9fI0B6KLoI1Q5bzMpJG+j29yKJss+ruR6PUMGz3k
 PgT/UDfJpdsKuJ53tTrSK+JkvDMdXnnimw==
X-Google-Smtp-Source: ABdhPJwMfSwSg294VsfgrPQFrRcCJzdMgwjajYYDcVV/58B6DxsLOyZhwJZuQnde8ko9W0yqZVXxWe/M5eZ3BA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:7756:0:b0:492:656c:3b84 with SMTP id
 s83-20020a627756000000b00492656c3b84mr7372825pfc.43.1635976900343; Wed, 03
 Nov 2021 15:01:40 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:30 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3xAaDYQgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
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
2.33.1.1089.g2158813163f-goog


