Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C024CB127
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:19:49 +0100 (CET)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWNw-00081E-Vt
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxw-0005uG-0y
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:57 -0500
Received: from [2a00:1450:4864:20::434] (port=37883
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxt-00005i-6d
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id bk29so4690214wrb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I6iTHbTYl4zCFK0q1Q7m/0Mob7a5vYQevNvaNiwiXcI=;
 b=RCUOuRjYGzpbgHdUeT4fY9dc5L/d4gkh/GM0Tjb5hBHh56bevqySbncmJZ/++V94D6
 Ufrb0iisQmQNzmuyjUlCXrV+8zUM3ykRM8KIexIWx+kXxo6k1PGDSGbB8lrSPwIkHjx9
 PySYvR9cIU9tu51MRopuv7msdmiI9qYc9IQlLuEZPzee+lcw9ZPdjMLxtsyOVcYIFwdm
 dDDBypKH5YTtwo5l/Tfy0C2ovcoFp1sf7ArLc9Tm2aJzXNE8Uy25D5xGeXLPIRsqdHUE
 SjVdbGvg5weWuSC5J6nRG1gmj9McqrvGrYzP+CVxxQReGt+p05MHBiET54Pc17ElozMl
 d+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6iTHbTYl4zCFK0q1Q7m/0Mob7a5vYQevNvaNiwiXcI=;
 b=ypJqB8+tI3zc+oiBmrgO82J1ojY7s8uHBHtI00bPW88eJn3uXpIaotIK15wq8+AzOf
 RRX+mA0iKKHsEim7d7KUFFROQ+SI3TQeHpj9rRstY5OPTO9IyfKC/ruEZdV+E9gJef8R
 DfTWOeiqFOsO59I5+qypiIH6ANIojkEbeN1iBXHD/mEAqcj9Ef6Pxtrg4wmi0k5tD6mj
 ZGNwAtAh9A0mF5SHgJxPEFb16r9gW3e0u9PnB3pXDtdmSOzNMeWja9yEmsLIa1NhzBCm
 Qkj+RcFnYXTosWdOH3diO3DxvaEld0seYVFosQJMYjoWI+dwW6hy3+dq3F89Vo/oFOQX
 cxXQ==
X-Gm-Message-State: AOAM532Ot8XK/tVJ3jPMkE5C2aDw/8wSXTcYiUSnpkO1Vb0Gn4/IAiBh
 7TZqXtM9FxM2q78K+ZMcuMlP2jPHO1eEAQ==
X-Google-Smtp-Source: ABdhPJwsZDRQ69pzKQSKyPUixMXVbs7CJkNZqXiMjUH6bA0tNlKfF/B1juMt7aGXSTvtItXcS9OsBw==
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr16228866wrh.407.1646254371910; 
 Wed, 02 Mar 2022 12:52:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] target/arm: Advertise all page sizes for -cpu max
Date: Wed,  2 Mar 2022 20:52:26 +0000
Message-Id: <20220302205230.2122390-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

We support 16k pages, but do not advertize that in ID_AA64MMFR0.

The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
to the same support as stage1 lookups.  This setting is deprecated, so
indicate support for all stage2 page sizes directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220301215958.157011-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d88662cef68..2fdc16bf182 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1


