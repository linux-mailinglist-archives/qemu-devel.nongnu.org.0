Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F35436AED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:52:19 +0200 (CEST)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mddAo-0003J8-CB
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GLRxYQgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mdczW-0005Ha-Jf
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:39 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GLRxYQgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mdczM-0003N6-Ql
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:32 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 q3-20020aa79823000000b0044d24283b63so900693pfl.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sFeWotbATGCBS+Vm4EPPVmJiHPouAImlbzZwfeR8ZU4=;
 b=kzA6SMeGRFmINTqMvfFCGDb4pKj7WsKRaC1t4Yx1IagxtJGT3TWDjN1InWcE0kMdVx
 +0lixEtUTBkoq2Knj6leTDd0rbGOoE70ngO4wQM2FuRCvjqV8n5NjowK7ldEdAFcXxDR
 34TOZEa0jEIrwt06pXHIv2zQRcG1pzxvRLqJS60yiHYkLca6FlRKZieBxGoZ7TJCIwG6
 4I4x6LHJRq+aY9XL3s/NWB30jBuyH1lQxy26W+U9fsMbyQyubFVKUUKHKCaIYDUeRzSH
 5xtkicAgqF4uuaQB1bYsUp+7U0IBK4gI6ELggxZYHKLFAa3BBMWn2Twcwe3RC3jQoVO4
 0bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sFeWotbATGCBS+Vm4EPPVmJiHPouAImlbzZwfeR8ZU4=;
 b=jdgWa3l8ihqHNgEZ3NfSH51JlRUwQotw031iDLhMA3vxTWXQVw2pPv3WSnD+RsMAUG
 yhCqej/wvP3gRiZ22BehT9GeHWSHXYttY1th5UtlHxTgI6fmd/l+/MoJc/BrGEIXBQ5q
 t6iO1bF/XnGoDpY4MsOg5LzEFRSAwphADKxiFmRWevvivjt+m5bl+zoCLVYkx5VwGRL2
 EN9l1A54/NHn9wUZ/JEo4F3YgwuTdL9cnY2Z8SNPg78n0mYkuBbo+JswSJawoNT9jR1W
 asvngcIHoN6Pc8ENDEK9srsLDjQe6f5dxpC4QPIMkw99Zd2Hl/dUGWTjqR/yxlRZ7v6R
 4nBw==
X-Gm-Message-State: AOAM530QNFQF7RC6kFe4LL4t63k4saTD53VIBap+HUGhWprQiIx8BTsp
 szoub8C2SAx1Dhe/OI4BTzzeh+nhdqKybg==
X-Google-Smtp-Source: ABdhPJy5YL0V58TR9RmA9wtADtSJi9xEuXrexaEe76PA03Y1bOmI9TE+cugpKRBtsKxQST834UbcVoi210NsVg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:acc:b0:44b:ff29:621b with SMTP
 id c12-20020a056a000acc00b0044bff29621bmr7362396pfl.32.1634841624479; Thu, 21
 Oct 2021 11:40:24 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:53 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3GLRxYQgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
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
2.33.0.1079.g6e70778dc9-goog


