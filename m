Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29635442403
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:32:08 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgmd-0002Qs-A6
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3N3eAYQgKCjosqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfU-0002Fv-LU
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:44 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3N3eAYQgKCjosqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfS-00030P-F3
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:44 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 f92-20020a25a465000000b005bea37bc0baso28375342ybi.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=KjjhAw3K9MXqFjIQgMemsuTd8nJ8JJvWb1RLNXCDCdGXh9lHXJjQ5/23S3LwHNqVZs
 K2cfUHiT2U7D+3vRqky/9LSgM+jMSvEYZLTg7jmvW5eWgcM8MleEjM8LQigFsmjl9sdw
 Mf2kdmdMmCPpkr5EtleGd/WdzLQ1w6Wfjl0JHZ+f4Yhh1iVOCy+m5Wp2M1btE1epSQVG
 ql8ORQW6Fh36WoLIIMsQdLFO6HlyW4z3HPXV0jBnZwf/hHr/BdUaA+CEl3TWTiXwEMDg
 ZDeXSroO1OBXLNn+UrkkDXP35ywe6tEJqFMlXZkNMZ1HEGP1nBajMlQANDug8F4HiOjS
 K9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=rHD91pAsbG//uhY2rQ5vtNbKrGDW8x1eBMmh3foNLzog7AmjZak2TRFJ5dkFqPxcst
 /IUOw8AplkhIzO4L6RoWh22vb14lcgb1uCsW33MaLS3I9Hacjx/aGUGZbmXhNJRJcn0V
 o1JnJJF0HnFDJ0GCQ0Z8lH6CmBVQRmcM/XDi4MslfY9M+si8Yo3vACeBprjkANOfbYtl
 0REOVMMCe7D4c6VkUpu8ExwvjoZSQcxFuBimgGI/Ga+NIr6gZfPZJe96VVqmmYvjeodl
 MkSwXXUccJZzewbSApebkYjNleZZf0edMB5ZxnIQukccwyAtRXnLk7FZDJuiHdG1PDdq
 mEJg==
X-Gm-Message-State: AOAM5325pe1nOHX16aApZ7wlZYlRrvIx4/AE+s2JMkyUpWR8ZDnM+YNp
 GywFIxbLEdJSne312Ad4I45GWec5LKt/yg==
X-Google-Smtp-Source: ABdhPJybrhvySMlSXkwVPZEttdPtSxSi0vsrn9AYRmm543qrontwoxEy3e1phJPmVJ3QtXl9Pz9lnsjA+BI3Ow==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a5b:786:: with SMTP id
 b6mr35849908ybq.112.1635809079185; Mon, 01 Nov 2021 16:24:39 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:44 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 4/6] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3N3eAYQgKCjosqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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


