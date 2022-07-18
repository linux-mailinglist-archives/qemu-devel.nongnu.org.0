Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4557857D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:33:20 +0200 (CEST)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRoF-00087R-Hg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHg-0002Ab-2z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHc-0003BY-KD
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e15so11928448wro.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QuX4bqrgJsmwtriilRgKBMrcdhU6Sl9wuLdDCeKIqPA=;
 b=yeo4kAbgcRFI2xj8qr1qnEm+LX1spGKQOX8EAsgQYXamXrLPOwo5AniMVL4Hf52+DR
 ZGnHg3y4INJDBWiyL1KJTHasSHhDYuP2ZuAP11M70BzlCjpu9wO5EPqb6SDM4hpwNSgK
 XBfMlJKtqn+5klVBCX6J/4wxM+VNqTAOL/ZeXa+RW+xXJN27Dup9izN67v2WLQgS9mSv
 0brkD8wyZtlFupPBpT7+DuHu+qZ32W/uZeXaIbQ5zeJpQg5Fw9s+HH4eBD3jECI2HZaQ
 pNakzN1WGCyfIPveZ+TIyj74yRehPRNYNR/flJmpkvyhmchgfoF4Ip10BElg4FQ/mJlU
 Hm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuX4bqrgJsmwtriilRgKBMrcdhU6Sl9wuLdDCeKIqPA=;
 b=ZkLE0CSFF0drlqqwnGk5jAstgYybkinbJGbY89kxV0+Tld49m1+3rkYgXHmmurhfWh
 Uj/lP4/K9FpWoiMQhxR+vSel2/9VjKWq4bLxObKgfEQxlbSXv0WvwKR/mM1cxDIAU543
 LC+0rH15/vwDHdihxsxcsJVOuWS54MGWjXTaICz5gqunb6h7vN3kub4CvVf/1MKCOv7w
 naQ2k6p6N/ovHZds4mpu6Pco3UrjrBGlPe7K7vy+aC+0aiZndnrOntulrbBY/mmVzIy2
 Sg2Tke0c8ko4zphju7tCHz71Ecutfp2XKqMYBxEGwrY/Ept7YfZhk7dyGoiByRxZD0qd
 Eftw==
X-Gm-Message-State: AJIora+0kVivwwjqw+ODgBIiZ9LpKoouHYLDnUb07OnVCWu1UTT6UDUF
 jdbyfuuYPTOiG/sNlVqwtfr5vgIeG/Lm/w==
X-Google-Smtp-Source: AGRyM1sK2vSb56MQTc1HV1gpuHD3i9M9Ea+FvzBL3prUu2jKom0WL6+KC+y9dpp3+F0xVhAFhHTplA==
X-Received: by 2002:a05:6000:1cc:b0:21d:a352:116b with SMTP id
 t12-20020a05600001cc00b0021da352116bmr22210409wrx.418.1658152774160; 
 Mon, 18 Jul 2022 06:59:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] target/arm: Don't set syndrome ISS for loads and stores
 with writeback
Date: Mon, 18 Jul 2022 14:59:19 +0100
Message-Id: <20220718135920.13667-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The architecture requires that for faults on loads and stores which
do writeback, the syndrome information does not have the ISS
instruction syndrome information (i.e. ISV is 0).  We got this wrong
for the load and store instructions covered by disas_ldst_reg_imm9().
Calculate iss_valid correctly so that if the insn is a writeback one
it is false.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1057
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220715123323.1550983-1-peter.maydell@linaro.org
---
 target/arm/translate-a64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b7b64f73584..163df8c6157 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3138,7 +3138,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool is_store = false;
     bool is_extended = false;
     bool is_unpriv = (idx == 2);
-    bool iss_valid = !is_vector;
+    bool iss_valid;
     bool post_index;
     bool writeback;
     int memidx;
@@ -3191,6 +3191,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         g_assert_not_reached();
     }
 
+    iss_valid = !is_vector && !writeback;
+
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-- 
2.25.1


