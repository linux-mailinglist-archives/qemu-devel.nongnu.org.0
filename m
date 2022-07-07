Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6356A1F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:29:57 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qdn-0001Pf-UN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbe-0007hZ-Bu
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:42 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbc-0006vK-8w
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso10602095wmq.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x7q49pbHqiNhp6s8X7a930pM0d8tXto2/NQsdnE4Rdc=;
 b=LpkFFRe6OJFDG8RBo2wl7yS2KT43+hihwLv3A8gJ4NnUY/bdQH0ONBbpKKTIuWbRwn
 S9iBdq2Kf6S5hetnor/lmnV+cmvzo1/nuMcA8vuBESHkGru1C9XdykQ+VGuujqBub8GM
 bocH6XoyDRy0Oo5599unqXQzYLGPEc9gbwibvbPmr16YMGwCFlg8DZ4cAtlYZgZLIwMr
 5iFBUKG+lue/nWoeXe44AdI5GI3FLU053td0WzbGVnj1NWWZdTpw6AmM5+3bM7VWM6f8
 3SrwSrhXLdaX1tc6jFPBPM91bQHVBPg7wreCAkEDlDmdthXQwIXRPx42/57Lpp24VR8C
 tCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x7q49pbHqiNhp6s8X7a930pM0d8tXto2/NQsdnE4Rdc=;
 b=1H4zcOqAjMmujOdqfdxVbL3/F7KsjTbw6mZh4hRNuLPtlj6zC6oGO+psBgOic2T6vL
 xIE5KsoYXVjfyAThdA+dtKBPuBVyZaiMW5mBrZUCc2w2Piq/0f6blB0QI0ru2zwP1wGB
 +Cyh0Imqw5PziR8DkuNnYJdmWRBF77iJk2y6B0nBX9R8kbdXbZhT1TSOFrfd4aZfCvva
 TVOn+pj80vTEKxUwttHdpg9CCOmXYSb/OVPRKBHheuZWFckBU96e5a9Co2Hm7qtWvY2h
 yXXq5KPtTd8hc5hg56lbIeo7PGhI0i6fSDQjT5sHqq0qRTS+O/+5lIo2XKyImlNMTPAr
 jKQA==
X-Gm-Message-State: AJIora/2Xnb9xIs0+aIRrnilHbA/mrx06Cg7zIpWdg75oG7IsDb3PTks
 z4QsV1Fgn/omdKk2wZcY7iQ8hgVQyds9SA==
X-Google-Smtp-Source: AGRyM1vLorXebQsiv4dnAs+GYSgJf/k/29saLxWvv6EiXtWKUBRhyJ2ZPZN61YsRYRu+snpHUYqujQ==
X-Received: by 2002:a05:600c:4c17:b0:3a2:d44e:2fdf with SMTP id
 d23-20020a05600c4c1700b003a2d44e2fdfmr755633wmp.144.1657196858757; 
 Thu, 07 Jul 2022 05:27:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] target/arm: Fix MTE check in sve_ldnfff1_r
Date: Thu,  7 Jul 2022 13:27:27 +0100
Message-Id: <20220707122734.288929-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

The comment was correct, but the test was not:
disable mte if tagged is *not* set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1654c0bbf9e..db15d03ded8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5986,7 +5986,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Disable MTE checking if the Tagged bit is not set.  Since TBI must
      * be set within MTEDESC for MTE, !mtedesc => !mte_active.
      */
-    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
+    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
         mtedesc = 0;
     }
 
-- 
2.25.1


