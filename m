Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA77A55BEB6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:22:21 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64c8-0007ui-Hu
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FM-00038N-R9
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:44 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FL-0008KP-BP
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id q18so9998071pld.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cx0XUly4xDUnFuxMUIgi+30WH5Nxa4Rsb47NOld+zjg=;
 b=l66yS15f/TsFaCYp2EwBL+NjZGLcdFq3LPpM1JqJCptCKbm7lG4C8vd+H0GP8op17c
 UOo1m3Ji1MMEwTJgvJTPp7Jjto4M+sVT/vjatCCGngegbd8KT0dTDIh2xBCc9+J8ekoL
 r3H0N5gr7KtkCORS6u7j5lb5VtH9MTBBSS1MruTdPuu4jWM+aWXs3HAXIBBZ9xJ6Pm6d
 O7p32poB6cFv8xcINhBzhfClVYQnaTXZSS39LgGQW8qw8Vyk6h6ceev68pxWHpNeP3ve
 FWGkQSZtSimc9zJm6WagkY9yUr5ShaVPJons4cqUw/22XA0AlCa3ixdXTSlZznWP8mKf
 TfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cx0XUly4xDUnFuxMUIgi+30WH5Nxa4Rsb47NOld+zjg=;
 b=Ld29HLaU0RT8e+3DO0gYGqHBUK2w4tHkrgzFheDXsTuBLNzB90FDifIeP2gk6v6yGg
 CGDi0ACyCExNJMybYKEfELXqL1+aB2o/3uzo4MeolkDoKiu32gN2tLKasgh4NGYDBGqj
 C87wsqh47w+cgXZIrM4Gg134gijHPE66G91onLsUEV8s14Mq3lj/nhAYWSWG532dh3E6
 SjFPB+K6SO0FJIS6yx1r3EvdU4xauj/OhXmNVKkHNn3C2mWPeQIXUl/ri4NzFsCgnhWP
 EumZT2n+zO1TZjMz+n1QAS/1kY4pamJwQ0/diauCHyKgKt4lYvRqrEJXLZGsDf4H8RXF
 So0g==
X-Gm-Message-State: AJIora+drpNYEKbTeGYHneel5Y1g9NJ5hVIkUacxs0VMp1pO0B2512fU
 QlqtCh7xEfv6SkEksXz52rXDaj6zb8+apg==
X-Google-Smtp-Source: AGRyM1vgsopf8aOqiWnT4/Vd77Pg7WFPqqyr2OG3GatZwdS07CJlhMydcyR7UkI1wrp3jJQOf3CAKA==
X-Received: by 2002:a17:90b:1b08:b0:1ec:b29a:4580 with SMTP id
 nu8-20020a17090b1b0800b001ecb29a4580mr25089976pjb.59.1656392082010; 
 Mon, 27 Jun 2022 21:54:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/60] semihosting: Move common-semi.h to include/semihosting/
Date: Tue, 28 Jun 2022 10:23:17 +0530
Message-Id: <20220628045403.508716-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This header is not private to the top-level semihosting directory,
so place it in the public include directory.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {semihosting => include/semihosting}/common-semi.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {semihosting => include/semihosting}/common-semi.h (100%)

diff --git a/semihosting/common-semi.h b/include/semihosting/common-semi.h
similarity index 100%
rename from semihosting/common-semi.h
rename to include/semihosting/common-semi.h
-- 
2.34.1


