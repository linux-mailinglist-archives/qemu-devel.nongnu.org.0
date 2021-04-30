Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CCB36FC4B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:24:27 +0200 (CEST)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcU4A-00045z-GG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBd-0005yL-Ad
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBR-0003wn-Ca
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id z6so9304473wrm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QuUuJ1pUTeudtTr2wsE0zE4ui6UzEIP2HwIFDweRVHQ=;
 b=BFme2z9X8P+InzQHejIy2HXd8gfniw6HcqUL2QrYnM9gSI1J0wu7i4IEfWqemvIsKN
 C9UnzeFH8ub0zaQ4EM09dcdrpIFE9euoJLC9HzExRlT8idi/zNU53vsgly/FGe9bK105
 XVW5E0crB4h4LIfIC6I+egXw+Hs9EJDuy8YpkjDXm4NWgVxAtX6vWhMRJTus0VjzwDRO
 ynkUv8zo0Fzyio8pjYQTh0kyD9oZm9y7kI+WivUqVN1biOmoPdVl5rEXz19N9QOCSUeq
 rnsUT6N+dhUNyWXx6EMobxTnMMQkwpyxgwQlD65+8qFd4y1bht763Ea8XghiQZAxQe2Y
 twKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuUuJ1pUTeudtTr2wsE0zE4ui6UzEIP2HwIFDweRVHQ=;
 b=JtCkQWU71FRgoxt5iraNt0fqcG+QE9AJNdqx4nT8pdGjiss2Ql5L82q9x01GSNYvE9
 Xb5NIGjUBnxqLPHEkbqVgwbbnpSPj7NtPlBTJnAYH3fKDfxzT+f4IFeCs5Mqfeq5ifa/
 x4QNaPEuR48jBjOrYKznm68eGqosPjoOotyzVJpekVgB3SflU0bMXoNJtCB8cMkeeDiI
 UK+nH7AYxrssX9gc2lHPC4wNLscEWtPzx/QHVXoahzvPJv1IEHiur+vQj0pkSWhAhzix
 HGm7qyPZf0ILADKivD4JFmAjUf89PApB7+267IabOnXQBs1L6BxgVNqYwy9RqyoJgzKF
 D9Cw==
X-Gm-Message-State: AOAM5319Z0yP9qwNgTb11ZSFmkzQQCYqx/QqzX2Cq1UJn2cwBeYZKbAQ
 jTdxI75OmeySU4A+KyAPH7EPPtu0JmhCMjqf
X-Google-Smtp-Source: ABdhPJwuSi5hpHOcPyjvEEq6MJWd/OLa0sK8tgIy9vcPAKm+dq24xlAbJTF25KYvTZYt83ZOUoNnFg==
X-Received: by 2002:adf:f74a:: with SMTP id z10mr7059959wrp.406.1619789270766; 
 Fri, 30 Apr 2021 06:27:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] target/arm: Delete unused typedef
Date: Fri, 30 Apr 2021 14:27:37 +0100
Message-Id: <20210430132740.10391-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

The VFPGenFixPointFn typedef is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 095b5c509e1..58cb3e8aafe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -69,8 +69,6 @@ static const char * const regnames[] =
 /* Function prototypes for gen_ functions calling Neon helpers.  */
 typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
                                  TCGv_i32, TCGv_i32);
-/* Function prototypes for gen_ functions for fix point conversions */
-typedef void VFPGenFixPointFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


