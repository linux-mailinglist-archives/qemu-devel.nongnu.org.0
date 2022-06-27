Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6F55B947
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:52:18 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mLp-0007ba-Dr
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltU-0002V9-Ba
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:23:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltS-0004xC-AU
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so6992268wrc.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WLTfmFsSYbrlNsXm8wT7ZM68yVYl9HPl9JI5ukxP0vI=;
 b=AQkhiKx3VAIi6Q5sZUKmOMGyiKFmkVEmN+ul8XiVUYS8acLUo9FBPAmbICo4Cr7FSm
 +DduQiZ2ZeovMzQj+HP425WlVcXlfrnXzOKzVRdrshhGYP7itKfpTxDqcELLdUqdjd05
 9WUjhApZqZq5k6u9oLNowgdB1jN4mKn8pgZVZAdMcdOzmiR3VHH83IHoMYdNK1fNM12Q
 f6vL5NVrYY4rbKxEJ+w/i4zq6jX2NyiklHk0dOQkoijia2uwtahJ3F9dCV1i0himK3av
 4tQAytDRgkiexQnGUVYWAXWRW2e/im3t1OV7Q8HAv9I+KOviNvs99b9vlP4u8MpySU2Y
 lOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLTfmFsSYbrlNsXm8wT7ZM68yVYl9HPl9JI5ukxP0vI=;
 b=yqsqYznIdq+EBPFH6ue4mJzz+A5qm4YQT6+aDL3eyFcc3WFUSGbZ9zmvXkzgaWVCjc
 Ox1hBfBKJAk7r1B+D5mZhuagBMxchGAhA6Zo/1mpE8yBC7yLnbM4h3Z6ctG2ZVPbBMCv
 c7eJaZxwx9ULA+sDbJbzrt5YFupHH7wYHK/3Leopm6x6F2hI5grRWf53LyiciIS93Csv
 5c6nOEu7WQevYrv0v/Yv+YWir5CUa7/OuE4bihqtWopjO0kOT+s+Ns43MR4+5dWJbBj9
 2s4zxERm0jpolmRDAM3DBz54Q7FtfNxtqpXPX48CnvFfFeJ9XB6vFAwOJ4U5UGRZGjDm
 4uzw==
X-Gm-Message-State: AJIora8dQrnN+WgTwTCiY+srH6FLqsKmBrVl3OK/PjtpGJlRNKWkp5qx
 Ok4RnpdkXQbqBWRVlZE63p6WcIS8YyQMPg==
X-Google-Smtp-Source: AGRyM1tamNeAJ/MnzKo7Ip6rmrh4hk6OFVsvBC8a6j15rBjZdBAG28AQjjOKbhFOkJ6nG9qYcrm3RQ==
X-Received: by 2002:a05:6000:1689:b0:218:3fb1:fd30 with SMTP id
 y9-20020a056000168900b002183fb1fd30mr11431358wrd.302.1656325376955; 
 Mon, 27 Jun 2022 03:22:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/25] target/arm: Check V7VE as well as LPAE in arm_pamax
Date: Mon, 27 Jun 2022 11:22:36 +0100
Message-Id: <20220627102236.3097629-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

In machvirt_init we create a cpu but do not fully initialize it.
Thus the propagation of V7VE to LPAE has not been done, and we
compute the wrong value for some v7 cpus, e.g. cortex-a15.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1078
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reported-by: He Zhe <zhe.he@windriver.com>
Message-id: 20220619001541.131672-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 07f7a218611..da478104f05 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -47,7 +47,13 @@ unsigned int arm_pamax(ARMCPU *cpu)
         assert(parange < ARRAY_SIZE(pamax_map));
         return pamax_map[parange];
     }
-    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+
+    /*
+     * In machvirt_init, we call arm_pamax on a cpu that is not fully
+     * initialized, so we can't rely on the propagation done in realize.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
+        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
         /* v7 with LPAE */
         return 40;
     }
-- 
2.25.1


