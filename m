Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828405705FE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:42:39 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAucQ-0003Ih-HY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvu-00072H-4U
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvh-0002ng-UD
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id h17so7183289wrx.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H39kaTMy9J7xwr8e9kYgt0j0csqMDxRmuwJQoBhCvKw=;
 b=d+Ji1fHzNjRMybbKZMKDlRaldwg6kI9RSlLnXAhq6yZqZVq0i7Ii+nyEhfm0Ruz9KN
 WhJs+clqJ41qYa1Et7NX8D/UOIa13x4SOtRubnDWf3wQQKY1jM+kExwFlcfF2hWgJGCB
 FXuVgsmJ/BOGwJ6q450MxJhps3jGY3XaIlaETDxVw33uIJ/0s/g6RXKiGzUh2u7/8I4m
 C41F8zz2JHDxZYlFXLPLIiqPyjvCHq65EtP8eYhpVNjmluh0OAJZsy1uEPy00qu1MDPi
 3V7U3kW/EGLoZ6qFhmxzQuVDdvC1bQAlcydQZ3SVnuycBKIPpkUimFxsloPy824RC0CJ
 CmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H39kaTMy9J7xwr8e9kYgt0j0csqMDxRmuwJQoBhCvKw=;
 b=0KCSUSbkie0wmIY0Fgt7HSzBKPPYLJghO+ZeMOXlRQ0ESm0XOm2LKqJfiZx7VNAPuT
 XOP7vDxJO+EQ+t09DA2IwE2JEo3eqNyDXbzPtC0F2BZFLjHR1NFkL0gHx8maJiHL/UHl
 dEWTwt7XoiB5fmIVzprM5WT0mEqy2kLRqNhDD2mVnIvjnUVtYtTTVOvPaqCUL5X2yTuU
 3lUtwHKS1g94gfb+z8EIMs5X7mVB0jKXNbRyOgquEatmEmBSoweXnL9RhQY4y2Q/Obdh
 0zu4ekozT9K8aYbP2QYzmFIoByGh4+olOy1+BvGDKHcuJQ7QCymXxx3u2nQ3jUGlFjvE
 p6hg==
X-Gm-Message-State: AJIora+zPVa8pZtEXg/pdkMyCaWn45YZXzprGDmS7ADY4oZht7igSW5o
 CsYx3ygoIypEPE66D8QOdto2HnGje3inKA==
X-Google-Smtp-Source: AGRyM1um3VwFhsppHo27aEoeIp8NcPT1U4SvGNuHIqE9mdYi3Ppf4QHxHnwNzXmxYk3acRZuQMDjfg==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr16722577wrt.680.1657547908737; 
 Mon, 11 Jul 2022 06:58:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/45] target/arm: Only set ZEN in reset if SVE present
Date: Mon, 11 Jul 2022 14:57:48 +0100
Message-Id: <20220711135750.765803-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-44-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9c58be8b146..9b544438432 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,11 +204,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.25.1


