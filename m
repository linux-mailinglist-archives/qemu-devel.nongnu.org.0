Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7F544980
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:54:01 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFnb-0001RW-Dc
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7j-0001oG-D9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7h-0006Aw-U3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6599170wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O7gtIRaRwJ71mlo9jIWS+jCv56ddk4eH5DIeQnFasaQ=;
 b=KzIbGgrv+MHSOzOSIpha96OMEANSnHNIm24FO600IBYEUbg0anhsRIar2ylD9x1A7s
 6M7cENNhORciRZZxn46A/ievk+fjUzkvKbaqmRNa6raQF93ZQUDvvHApiJkcNgmcQ6q5
 itqJjiYv3vmTl3Pw5c1+hKtYWxIEPUzT/9EBkIFLrCiBegFbxMi4K//RUmABfsv2gkxJ
 pfN9BTFn3sSwRkw+e5pkPpJB2wKvCHZjb+82NjfjTLYUzJhKbhm+BVqFbxC8AtgRccnA
 J3LC+c7E/fwsjTgimgEac0pf2T6vMDB4AN2J0PTwooGWd3SmGbrF9gUWhmYOsCVHXLEu
 yGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7gtIRaRwJ71mlo9jIWS+jCv56ddk4eH5DIeQnFasaQ=;
 b=TQ0a0mys14iihJ5Avf5Y6QG4eA3HjIsfIfYhJPzHLJKthAxgN3/KnfGhPCPNbvxnih
 5URLIVU1DqssPqGxLmzLODh4eA8jMokFl+a5w5A7aM7rYVV3oPwnyCWHHFrUQgRdXy2p
 Tnwca94tb6TdDqEtdzqos4uDeXgvt1/jUAudWCdV/jM0rOQtJFHkdHBJRNLXRmtw7U/N
 DUd2orQLqs0Ejag4iPMFbPpVY/0d00lOzbvFuJZjsDefrA6OcWm9hR3phlckhPPVetNE
 7CMHf2zTeEMj2WUHxcVTE9/zPhxHmbLHMb9PKvVe01ngRKh7yiBtVJUkE5V9FmOXeijZ
 Wddw==
X-Gm-Message-State: AOAM533AwYkRoLOgkjzXoi8ZEXQJnpKAYUJdddN1q5nT81HJ4flMqtXG
 JFW66IZLFSiRSOymwyjjq1ser2myFS5Mxg==
X-Google-Smtp-Source: ABdhPJy7mwQMnDUEHcZd23Frp5+wD8g4i2RaHrhFaP56IVp/Qlfj9W2tDiReZLc/E+VxxNejGWvWYA==
X-Received: by 2002:a05:600c:3503:b0:39c:65e0:c070 with SMTP id
 h3-20020a05600c350300b0039c65e0c070mr2227755wmq.161.1654765595611; 
 Thu, 09 Jun 2022 02:06:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/55] target/arm: Export bfdotadd from vec_helper.c
Date: Thu,  9 Jun 2022 10:05:35 +0100
Message-Id: <20220609090537.1971756-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We will need this over in sme_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_internal.h | 13 +++++++++++++
 target/arm/vec_helper.c   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d527fadac1..1f4ed80ff76 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,17 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+/**
+ * bfdotadd:
+ * @sum: addend
+ * @e1, @e2: multiplicand vectors
+ *
+ * BFloat16 2-way dot product of @e1 & @e2, accumulating with @sum.
+ * The @e1 and @e2 operands correspond to the 32-bit source vector
+ * slots and contain two Bfloat16 values each.
+ *
+ * Corresponds to the ARM pseudocode function BFDotAdd.
+ */
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 26c373e522f..9a9c034e36f 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2557,7 +2557,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
 {
     /* FPCR is ignored for BFDOT and BFMMLA. */
     float_status bf_status = {
-- 
2.25.1


