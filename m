Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A750B65A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:45:22 +0200 (CEST)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhriz-0006RN-4R
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAS-0005dj-KS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAQ-0002zh-SM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso7632256wml.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F5JxzY641qwLK/UV9n1xJjYcWBo1utd1eisOSylOdzc=;
 b=IbkzBmU8ns9+Kr9vM+cGnoJpbNjXCiI5a2t+w1oC+u2vfERwiiTFn5+2S16VH1to+g
 XY3J9I5N2+uuV4/XvaTQz72qskARdO7yws+DCY8zBgPW5ZdPqleagDxKZz0z1p2cL0cc
 qkSB2T6epdcZUwjdII4JBjeuph0SxIEP4Hp3155dERIydsaXVX3THoCnmauJrnAwDwuS
 sGnR1HCg8PuaLrf9uLtmL0bQMg7+/A9RRFBjkRV/3Xr/M3qQqPCI8SNHQQ5zvBb1RXyD
 zeaqgGFU9eulz5Lj8TSEXgDb5vlqMr+eGxlRgP0oGO2MSwWl2yWlGJFha2xg+QgZ0cHx
 fzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5JxzY641qwLK/UV9n1xJjYcWBo1utd1eisOSylOdzc=;
 b=ewKAvhNI+3GwDSVQ+EjVo/+6be+4a5LduGJXv2iRHUaLQaKRbB/LmOd3E2zg4pBbfq
 a7t1bSN2ItTPxV3/kKIkae8tcvb4OU9HI0D9Kk55CW1T7IN/svhuhrfnhTT6c4grjEp0
 5W8wA2/RMW3SbJ20PIjbSrTCl2mpUbphQpM6hwZ0fNM5BR6GQ8yzdn2EzF0Ffo6tPi4T
 eJ4pxgVg9VAWogiK+yTRjYR3mV6Los4HafutB2CiYzl3JJsSugUUZD6rmcxUtYGAzEmd
 4GHvoWcqN8GQa14tFNfa4oqkr/B36Rr6TWYVRWK3vEt3nddzJz4z6kNtpwFmF8vYnnJ4
 q1DQ==
X-Gm-Message-State: AOAM533iCPqAzxuY+BaRtdUAKenr5f6YSCDicfSA1HbDjBWktDYYEyJA
 OX/42/NsF/ksqR/mhsjNYMQHagWETXVbDw==
X-Google-Smtp-Source: ABdhPJy1wE+1PWHycnoxeJn7pqsN5w9y8L3NHphDxjB+utLDtKOVis+OKHY48RPMkWELToIRLFVUFA==
X-Received: by 2002:a05:600c:240a:b0:38e:af6f:510f with SMTP id
 10-20020a05600c240a00b0038eaf6f510fmr12558318wmp.46.1650621933367; 
 Fri, 22 Apr 2022 03:05:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 61/61] hw/arm/smmuv3: Pass the actual perm to returned
 IOMMUTLBEntry in smmuv3_translate()
Date: Fri, 22 Apr 2022 11:04:32 +0100
Message-Id: <20220422100432.2288247-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiang Chen <chenxiang66@hisilicon.com>

It always calls the IOMMU MR translate() callback with flag=IOMMU_NONE in
memory_region_iommu_replay(). Currently, smmuv3_translate() return an
IOMMUTLBEntry with perm set to IOMMU_NONE even if the translation success,
whereas it is expected to return the actual permission set in the table
entry.
So pass the actual perm to returned IOMMUTLBEntry in the table entry.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 1650094695-121918-1-git-send-email-chenxiang66@hisilicon.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 674623aabea..707eb430c23 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -760,7 +760,7 @@ epilogue:
     qemu_mutex_unlock(&s->mutex);
     switch (status) {
     case SMMU_TRANS_SUCCESS:
-        entry.perm = flag;
+        entry.perm = cached_entry->entry.perm;
         entry.translated_addr = cached_entry->entry.translated_addr +
                                     (addr & cached_entry->entry.addr_mask);
         entry.addr_mask = cached_entry->entry.addr_mask;
-- 
2.25.1


