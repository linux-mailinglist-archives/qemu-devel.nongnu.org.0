Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982D2D5A89
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:29:33 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knL4e-0003AE-7D
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKRH-0001oZ-23
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:57 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR6-0007BI-ED
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:50 -0500
Received: by mail-wr1-x444.google.com with SMTP id 91so5148609wrj.7
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ooHjKj5Ndp5pD0CA5cS7KzNA6LKH6qDCEuw8GlWYL/A=;
 b=SRw+VdqPl9s+50dnCp/tdmLxxQewnT8Wj6KGVlnI9rYVP9KJWyOy3MiENjzbBYqD98
 EqbJy7pjf2RD30+4m+OHDk4DLTwp8Wpf51vgg0rnAjmhC2Hs46dGo+RP1aWxbDTpiZo6
 vW/pMzwI3fgj5Lq+EeWyU4hjk0rHkwviEbxiIexQkO+sgKSprCojQ4VQ142kXtAWzdNl
 Q4hDmChgxGMVPBDMxdD66xlFZBtaBr6hMwVvHSCqo8Sfs0xQb7rdCUIQ5VbWZy7xAn3C
 fSb8am5tJP4ToNqhFkPN6e94jdhspoxFKcvXziddi3BRmgMD2BLdxYIs0R3LjuIVVxWf
 ZcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooHjKj5Ndp5pD0CA5cS7KzNA6LKH6qDCEuw8GlWYL/A=;
 b=uhqY1RCg4mE6P4J6hWcCvYAViScl5wwbw3LIjKBM+3uF3FtuilwHJ1j5DDwaoajh80
 +s1ZpxGW8HAAcsOYAPWa2pNHnIrvf/hCujjktVQbNKAK3OBH/RcPtXhk4wl1U/zTI54P
 3glvOGanvgx8bVmhGk5G2vSkeibgdSaurr7idWaRkm2lxos/7O0bEBTK7vNu044iRtEf
 kaG7mAAHGbVXCWZEY8xo6oO8xIgrIi46x4USMYqHEhTUdw+F+OF9u9lna+97puKBsn4N
 EaGTmsuyCLBvDWcN7t+pGkea/Ve9npSJOMwlrUhcCpzN/6Oq9gmWMNvqbVImm/MOLs7Z
 Y0Ow==
X-Gm-Message-State: AOAM5309U8jnp9eRYHdkOxBBZhslGunS1zAGmUQOnSvsqQjvpJ2rQ8fl
 Ivo980j4HfGOy6erkaU68LthvBhvlVTN6A==
X-Google-Smtp-Source: ABdhPJx5/n8Yu6qGUO///ZN2+TU4A6cvPKusdImx0xq8tUknahl8yx+w3TU9aogHJBA+rBxF1qCppg==
X-Received: by 2002:adf:e710:: with SMTP id c16mr7849013wrm.295.1607600918991; 
 Thu, 10 Dec 2020 03:48:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] hw/arm/armv7m: Correct typo in QOM object name
Date: Thu, 10 Dec 2020 11:47:56 +0000
Message-Id: <20201210114756.16501-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-28-peter.maydell@linaro.org
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


