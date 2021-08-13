Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C751F3EBED7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:44:36 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgqp-0002CI-Qa
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iQEXYQgKCvYusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1mEghA-0003js-N7
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:36 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:47694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iQEXYQgKCvYusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh9-0005xE-6u
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:36 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 a62-20020a254d410000b0290592f360b0ccso10605456ybb.14
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=EBDYvPCRpxsguj2bn19Hqr2rt9KDvq/0ddQlCLgiBiE=;
 b=RjYuZjRuZdIIf2w59jM6gFqKJ1uGDYewBkjEFgSvszJWG5SZu/vp2qaqQbxUERFTmn
 rVbO0ZbVbTsKhCc1EJC/RK5UL6nokH8Bo2W14PPe0OMqfwLmBPZR5p03MupP/TLSDF+G
 N0F5zKqflj9X+3fk7aZ/KmIC9IV5hx0zCaeFtFBl3iTwCznKfZH3zzQyeWcOzSLCqx5w
 imdojcKbL7kFsqt7TU/foIH7nM33lujD8OWWxluPNUejvfXxB0MllxdcYp6kjfQttoi4
 0FC6DL7tgJj03il/Am4w037qpHRfP07A3rmUnBaueJF9Hc9fCrmrS8bE8nyqIBRtVsH4
 RW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=EBDYvPCRpxsguj2bn19Hqr2rt9KDvq/0ddQlCLgiBiE=;
 b=Rqc+p9gtRcNDVAQMZAyICEzkeuEDVqTdGT3llLtCTSZDFu4DDQ24vtLtCHZqADDQ5d
 WWbgzeHSmffonUFYCbr7772XohgdPCfLiaco8nvbDqM0igQo91MhuO1giaYrNeCxF+4m
 aGcj7W05luQHfkgeLl2umiF3Mm0EwepQDc0xyT+/SOe3NWODNPF1ejtY737/aaCSx6aV
 zmbKcZtCOrcqFhCmcA5Qru8dIan2CjVjI1+X7Ukp7ajIDhtiEXZssB0ninpdPsjuQeFT
 dazP0WgzGkRSvsdKWYrZsdkTpGzri2fc2/lqfkSuCvIKZC8pS4yM1oXz27vK/ocq5ITk
 KLFg==
X-Gm-Message-State: AOAM531gUBJhP81mxXjxKtvMVKkj24t+LcGaxF5n3hMY5m9GbPedftOI
 48PPsMgSQcTf3tRjFy8o+jSSEyLANiVBpw==
X-Google-Smtp-Source: ABdhPJy+vS9s8MnqRhuoUFiCCYjd46p9gSdd4BDoLEfnhs2VcomKYOnIcCPBIPIRW/Y/8z7uCnH+l+pm+ch+bQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:404f:: with SMTP id
 n76mr6206163yba.494.1628897673685; Fri, 13 Aug 2021 16:34:33 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:50 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3iQEXYQgKCvYusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of read only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
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
2.33.0.rc1.237.g0d66db33f3-goog


