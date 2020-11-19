Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69A2B9D5F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:09:37 +0100 (CET)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs7Q-0008UJ-9Y
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvN-0001EP-6F
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:05 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvA-0004H7-Jb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:04 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so8027305wrt.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CsDF4FovkQi5FbhTGn1IjOoZht88RJrc3jvTDPCJ+f4=;
 b=PuyNaGaF/liAFUxlvAqlL68JNMTQgeT9qx3MW8WXIeFb/KHkQaF1HIlaCeFvwnPvAd
 NYknIsTIJqoD99La5wvArLw4NBOYHqTV1+XDMFe7o8F1Gvy1DtjNzOyMClWIZLKWa8d8
 sYnYMuul4BOC8/BwQUeK7c1l7ajthde9UFlPgs+wOTUW5MYJp11QlMCWhNjOuFlbJcMh
 7BoXpe6s4sJ6yfiwPIH+2VeFu4nYP2rMlr+fbuDNaaEZFmTW0ldXOwSKnoNHO36u/qXJ
 XvO0XNqSZluFbhKIHN0ESs/gViP55GsAj58GrP8YpUQY98qdrt3J1kfQ1JjVD0OkXT+w
 BFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CsDF4FovkQi5FbhTGn1IjOoZht88RJrc3jvTDPCJ+f4=;
 b=Eh+AqojEncY9dpaOeFTRLLNoHKdJoULhin+N4NCq4+vddsswFwEw05F0UULEsw2RLv
 IsMsXXtatJtC2tVA3xtze8og+p+kiWJp5RCCUqEqxwzU8REQZdJCNH8bxiW77D83lLei
 OT92uUD8GmmQV2g0Azm0/suR0qwBXN7IQV/B/fGYD4ZDyHwoPvtZC4RU69xLYw4DDSh5
 PsSJ1iqqiZBIYc/oM93xkFM0b5wQ3+jEsE15Hz/58393s/nw6JSi3e8ZEjjxbQtTz66f
 KNguFtsH1icq83Bh7+pYZUJl5SLlKwArGH08xCG3wiOCtr8QtqXcGdh10Q/3PSPgLBro
 w6Fg==
X-Gm-Message-State: AOAM5309z0idlZBb2HT8OqhxmzMIf6KDx0dMo2P9AfxMLxalklR2b+oC
 RRWw4R9kc5joX1s92EPfAwbFIexsLgLSaQ==
X-Google-Smtp-Source: ABdhPJwkEj8B0IdamVUakuI9eF8iGFtDWObx7Y6mmXPmbKA4tgbu+altv592CpAG/x4nByC0dlPXwg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr12479025wrs.100.1605823010527; 
 Thu, 19 Nov 2020 13:56:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] hw/arm/armv7m: Correct typo in QOM object name
Date: Thu, 19 Nov 2020 21:56:16 +0000
Message-Id: <20201119215617.29887-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Correct a typo in the name we give the NVIC object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 944f261dd05..8224d4ade9f 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -136,7 +136,7 @@ static void armv7m_instance_init(Object *obj)
 
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
 
-    object_initialize_child(obj, "nvnic", &s->nvic, TYPE_NVIC);
+    object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
 
-- 
2.20.1


