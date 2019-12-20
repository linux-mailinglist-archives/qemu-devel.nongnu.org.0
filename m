Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCD5127C83
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:29:03 +0100 (CET)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJH4-0006mm-G1
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iiJF4-0004pH-8c
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iiJF3-0007EF-1f
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:26:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55443)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iiJF2-00079x-Mp
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:26:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id q9so9139008wmj.5
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 06:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BE5AXjPNjkWulE6XTqRNp3vD+tekVrRQDrvKnYuOy1Y=;
 b=DT3P+bgqEdUzmnHE395fiAHLnqNucwlWj9mUZ3LOXvw9U493GaOWSe5bJWgVWIqhDM
 9X9n+CKy5FN86ENWYQMv3tGiVIYursjGzEwRyYQB2sXG42ousDj4DFSVSRregSNyaX8V
 fhKaSxcjmm6aAb+OHV4u6F1tVEl+/n+5CwP/zV4V9fUuqBkmyxqXLalPq8BCEXBcup75
 nxjyVx0bVlGhkE+a/Hb3eUsT94pYTok+HmRbTjf2nYjKKmfbZzbX5ptyuVuuCV5U7Nfh
 MmSj+QKP1ogf37gzEIg8rbRr978wQ6OOh/Tr9i73DgCLYfLsn5f8LvpXAsmVXWxahteL
 N0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BE5AXjPNjkWulE6XTqRNp3vD+tekVrRQDrvKnYuOy1Y=;
 b=ZD8uWpIDRQGfKMwoA8qxgEaM7C2Jq//6IIs2EOmK1GY0eaH4oGzW5JiP4e/fA1kg9I
 kMlztzyx7Zly5++DVDl67YgaPYMSCTkNRM1Ksbe2uN+Aewd5h0B05nemmw5e0oX051aS
 tlapdw3F3OIM2SrfAOQE3w1r8SJk/wuwtlH1x64p28q7WILKeRe4n8PriHZzBbldhIWs
 PUs5BstFoK+NWwa3KvfBgcINtlndIZvlZV0JNCUtqDZZDi0Ya3Js1HeTVbmQo2ui5EUK
 zVqqcqm0egkV/tI5w1tbOpIMMZJ1OjU6rxS/iqcgv60jGDtSSvdiCXWH0jO2qQrD/f+G
 bHpQ==
X-Gm-Message-State: APjAAAXGFwVpZy4ZI+sXJIdiMwqBEiGY4Sp2lagfsxkz1n5Hums0aH8x
 LTPFLDxfZdhsWfFkUWAOXqfdztMFjAFnWw==
X-Google-Smtp-Source: APXvYqya791ge1Xb3a6Pw8YorhCAVkWmmyPfYR1HzwzuD8oa0XyQtuN9lJlr4sVCX0+eG1LB5BnwxA==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr16873295wmc.21.1576852015391; 
 Fri, 20 Dec 2019 06:26:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t5sm9741814wrr.35.2019.12.20.06.26.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 06:26:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
Date: Fri, 20 Dec 2019 14:26:38 +0000
Message-Id: <20191220142644.31076-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142644.31076-1-peter.maydell@linaro.org>
References: <20191220142644.31076-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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

From: Simon Veith <sveith@amazon.de>

There are two issues with the current value of SMMU_BASE_ADDR_MASK:

- At the lower end, we are clearing bits [4:0]. Per the SMMUv3 spec,
  we should also be treating bit 5 as zero in the base address.
- At the upper end, we are clearing bits [63:48]. Per the SMMUv3 spec,
  only bits [63:52] must be explicitly treated as zero.

Update the SMMU_BASE_ADDR_MASK value to mask out bits [63:52] and [5:0].

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Acked-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Message-id: 1576509312-13083-3-git-send-email-sveith@amazon.de
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d190181ef1b..042b4358084 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -99,7 +99,7 @@ REG32(GERROR_IRQ_CFG2, 0x74)
 
 #define A_STRTAB_BASE      0x80 /* 64b */
 
-#define SMMU_BASE_ADDR_MASK 0xffffffffffe0
+#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
 
 REG32(STRTAB_BASE_CFG,     0x88)
     FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
-- 
2.20.1


