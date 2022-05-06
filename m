Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C870951DD8B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0kI-0007kI-L5
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i0-0005NL-VW
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-000526-4i
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k2so10681170wrd.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bOxIOXkxIovtGJKfDrlFz7G6tvoSu0yK5tycQxFKtgU=;
 b=LFJvEg7EPUuS+Imjoiisw6voPKs7IkJkmV4cPoO6Aiwi9HPYr1UiH9Yhm2rk1COJ/A
 rK07dAwJln5wVSyEIKsLRTKnlsSSJ/xxrFZQrdh1cmokSGFuHkrhG3vEeZ16NlOy8NQ/
 H0xgGAdVqQDR7Nw4E6hm00y57zPdiPjPlkYhOJj9uof1A9bpxNNs2XSzkhedWrBS0Lix
 EchE+N8hrCs2a3s2WKKMYdvxl62pw8b+Htb8FeOl6gjSKf1fQWHZC9li60rd8OT+jh6f
 9i81sNv7betxt+/9P9ImywfpwTkOwU08aNiqz1BzbawwmtxGhTIWyZ+Wyh5lBaItHDxI
 Y4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOxIOXkxIovtGJKfDrlFz7G6tvoSu0yK5tycQxFKtgU=;
 b=JP3gaVg3ruodNNIxuONpRxXdZM4V7EFybJ0JYMpAwkNLlNt0Nn7aYlp+KMLV5t6GXK
 axh3tB9zLolmydhJsz4qv/UYhszIp58uN0tICoGAgi4x/Pe+oXd+FH3IM24IF/mKEu1A
 RTPFx1FK1stMh7JUrfQVvjBJe3FpLU+LUHwPx5DvSYJO50wfY+QeasWJ21LGnEIfsxpS
 ai37iZJN68JpWlKurir+S2Jj71+2FBdfuSfgt1ZCqrDoI+qhAZtOTWJJ2YBwBWJ16qRJ
 6MwdbNrPbRkg6eAGcHWlDTMbQRq+icrNitCVU2rwS3PmQnp+xeHRH4df1Wz9kHmOZihA
 GaWg==
X-Gm-Message-State: AOAM530WEsFh7PfnycgFoU7E8muzO8O61dczgRM7dClF5AtntQONRhv9
 Mil6pahjeyR+wbsaa0+wMU4QGQ==
X-Google-Smtp-Source: ABdhPJxFxnbjNJSp3+7/oFRo6qr1i6zI+dp3AdwJ8VHujRyc99W7t7qmQQwW9+v5LlUyKNSjv8yh7g==
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr3396746wrb.407.1651854092561; 
 Fri, 06 May 2022 09:21:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/intc/arm_gicv3: report correct PRIbits field in
 ICV_CTLR_EL1
Date: Fri,  6 May 2022 17:21:25 +0100
Message-Id: <20220506162129.2896966-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

As noted in the comment, the PRIbits field in ICV_CTLR_EL1 is
supposed to match the ICH_VTR_EL2 PRIbits setting; that is, it is the
virtual priority bit setting, not the physical priority bit setting.
(For QEMU currently we always implement 8 bits of physical priority,
so the PRIbits field was previously 7, since it is defined to be
"priority bits - 1".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9efba798f82..d3b92a36636 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -657,7 +657,7 @@ static uint64_t icv_ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * should match the ones reported in ich_vtr_read().
      */
     value = ICC_CTLR_EL1_A3V | (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->vpribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
 
     if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VEOIM) {
         value |= ICC_CTLR_EL1_EOIMODE;
-- 
2.25.1


