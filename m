Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B050B596
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:52:30 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqtp-0008Kx-Ta
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA9-00059i-TV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA8-0002t7-3o
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:17 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so7622795wmb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ivxQ1qvgY8YzLhlS8QE+z47bKLIgh4ThHo8REAZyZdE=;
 b=uLqY0t8acPwAsFT6XUl6HDrfqj1001TsoDz/02yMPefsoftRtO/7oI/ZbFFSIcsLWu
 nYw2LuG/mR1jZqblOcUXPGZjFiAkApPm2m3kPmirDB4nfKhx5BG93IzF9HKZkkDtgGj7
 Ih7ZLTnlTfMFoM0J/q8oVoKbkili/C3XvQ0txFW3/7amRMEdLR3ST+yCFpSluHZ7hdiO
 VKrp6+hpdv6Yeez+x/jTKfbLopM4w+HlhxaD4vTyXd4w/+cPQHp0YAD6K7g4RddPjELJ
 ANAI4m6UbbNnOzISw/XooB04lTYxc1HIsSDURW7B0cyGYuSqQwMj+kHU6VIUbAYnASjv
 +G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivxQ1qvgY8YzLhlS8QE+z47bKLIgh4ThHo8REAZyZdE=;
 b=RTvxFhKJZURnB5K9rqOETtiB1ZpX1FPzS4reFslZdziuK76/DBVIl4pB7M0Yw4OVRY
 NtjaVLWIcG8vhuODzM4E+ND7cSQsYo60vynsje9jCtxM3WW1VBMsdZaaot8Vwh14RO/z
 9YoxycT5z9D3EJqxlmIyXV+ntFu1T5lMS5M1q0Fnu3ScL5soWCeM8iDJq+Cuq15SWauc
 t23ijqy6dChjm8KxbNCm6VFWpNxIYpD0eeGOIv9TgsMxcb3pBxsZKRqpUfitACXX8NRL
 UgcYAViXtwxPKoePAN84B2xYvQrkH/m82ptxgBKdlpkm03sDhYuyH8nr/UlXjgL/Sr4J
 I1Og==
X-Gm-Message-State: AOAM532Jn2Vpj6RT+hnrHUAmSuZN8/CZsOIxk7cnwqPbTx2ql+enJyNd
 vEdbghP8SyYjqwjby/nbrGo6NOC/++sgag==
X-Google-Smtp-Source: ABdhPJw5n1Lmzt4E854B8I7mcjQyqw6A4W03hwTe7uQBJExqlfl6fH4d8IfqcFYCdw3sNIXaA4FxSg==
X-Received: by 2002:a05:600c:240a:b0:38e:af6f:510f with SMTP id
 10-20020a05600c240a00b0038eaf6f510fmr12556963wmp.46.1650621914605; 
 Fri, 22 Apr 2022 03:05:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/61] target/arm: Update SCR_EL3 bits to ARMv8.8
Date: Fri, 22 Apr 2022 11:04:14 +0100
Message-Id: <20220422100432.2288247-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Update SCR_EL3 fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 564821eeded..cc8f7f74eab 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1545,6 +1545,18 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_FIEN              (1U << 21)
 #define SCR_ENSCXT            (1U << 25)
 #define SCR_ATA               (1U << 26)
+#define SCR_FGTEN             (1U << 27)
+#define SCR_ECVEN             (1U << 28)
+#define SCR_TWEDEN            (1U << 29)
+#define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
+#define SCR_TME               (1ULL << 34)
+#define SCR_AMVOFFEN          (1ULL << 35)
+#define SCR_ENAS0             (1ULL << 36)
+#define SCR_ADEN              (1ULL << 37)
+#define SCR_HXEN              (1ULL << 38)
+#define SCR_TRNDR             (1ULL << 40)
+#define SCR_ENTP2             (1ULL << 41)
+#define SCR_GPF               (1ULL << 48)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
-- 
2.25.1


