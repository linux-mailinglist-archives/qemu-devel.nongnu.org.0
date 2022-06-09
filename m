Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312095449CE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:16:01 +0200 (CEST)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG8u-0005N9-6L
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7r-0001sd-4j
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7e-00060y-O5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id s1so8358409wra.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cex5x9L9Gl/d10/8cuiaJvgz9NAjknIKjSgIAlTWGEg=;
 b=UO2hkPROv7vuihUX1utcuWVxNMFTDbgBcFfusZtlQkk/9VhAHIEPABTXoV/A5CdH/D
 xNSeL/bjHkW+0kDIXRX//0+CLnXbOUuB2k+E6XPdtgdr5yvVUlrshc9QSsZ2/pFhn+DU
 GlXdGda5k3fB3/hMbhImuDEcy0Ms3m+dKl+xxKABfbrdOgQQhlpJ0YVyI4herbssA5SW
 fkaJUmAdR5gQcLYKjb4DCshJAapMuVKAsX+UljFmxD6phzkNV5WVAGFg6G/ZUsja7uD/
 w5qWP2gmUCsGD/H14t6ZuO3+ilobOvLwpiRZJCeNvtN6P1tIOz/xxfdLIxBVCSXXDean
 C6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cex5x9L9Gl/d10/8cuiaJvgz9NAjknIKjSgIAlTWGEg=;
 b=GFOM9rLypc2/QpYdnYgPq7GaC/vMpd1xXezbyOEOFCnDUAnHVTxK0sRoCt+fRIJ79L
 XzlOiYuZ4AzRN/23qrbO+LwrN0Wlfza7Saun7PEV2fpR7fWyO5F5SL0V1/4DMQMtx5tG
 7fvjQWar7DjbI1xigE789KZqX91NZio+FsymP4DaNeo2jyM4NrBMpqR17vm6nl58rGzt
 0OYXMBRkSQO1vYe3qmwOl1iRx3klNW63dP37FUoZxnnuaY3aD/WTj5xmlv+eTDTKqD3b
 /FQZMW/3+aiB1h9vGNYISak+zZMFy1EwXuMfPGdMg+HWYMF7uxWkSJRqXbK6Rjy6h9dT
 N1HA==
X-Gm-Message-State: AOAM532cg53Y0Uv6tQNvZIGXTo+fL+mmc9IgdQ4ovchzyT+Lf3jdNYLg
 l2k1fl8gFIdYXvrjn/p2AxLEDdjAmyForQ==
X-Google-Smtp-Source: ABdhPJzE1wj6FzplAvBiqXD8n3X5c1cXwuh8cu53+lX98E6iA8ESpOkPEC0YwOnrk7Aae8mDCBtd1Q==
X-Received: by 2002:a5d:5222:0:b0:213:b7f7:58fe with SMTP id
 i2-20020a5d5222000000b00213b7f758femr31629529wra.620.1654765593905; 
 Thu, 09 Jun 2022 02:06:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/55] target/arm: Use expand_pred_b in mve_helper.c
Date: Thu,  9 Jun 2022 10:05:33 +0100
Message-Id: <20220609090537.1971756-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use the function instead of the array directly.

Because the function performs its own masking, via the uint8_t
parameter, we need to do nothing extra within the users: the bits
above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
to the local bmask variables, and of course _uq uses the entire
uint64_t result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c5..403b345ea3b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -726,7 +726,7 @@ static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
 
 static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
 {
-    uint16_t bmask = expand_pred_b_data[mask & 3];
+    uint16_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -737,7 +737,7 @@ static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
 
 static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
 {
-    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    uint32_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -748,7 +748,7 @@ static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
 
 static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
 {
-    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    uint64_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
-- 
2.25.1


