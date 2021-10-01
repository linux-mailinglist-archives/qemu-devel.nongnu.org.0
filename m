Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A741F343
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:39:42 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMVV-0007Fn-BJ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM50-0004oD-3e
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:14 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4u-00054W-4J
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:13 -0400
Received: by mail-qk1-x733.google.com with SMTP id c7so9853912qka.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=U//2ifMmkqOL6DQASXcBeNMQnns/b181XCtp0N2yXnltdQ86YBODzqctMlykc1krMJ
 a6OfT5oJqO8z6IEr4HElTpJVWLgBFZeCoXDc5WW70n4RPQz2zZ3+AK6PFNinzvrVYmM+
 lfqxPqVIz2GoLGThWhMAfLtqUKNu38o2QBVfG9QaSbaLR9rWol2WXtq4rvIfJPzl2r+X
 s0uhkvN6YYGPFBFdW7z0rNCPKlNqCY5XTB9YSKjaBoCB5FVIDhyBvvt2Zva3oGRkWEHy
 5FEzgWHxT6lBl8eQlneySIcyW0gpdk+gkpn3KM90FgS+uRLmpfqD6/R3Tk3qFhd+N8Je
 7m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=Ot2tkdeYC8R2nzHvp3otBf4TaOamPU4/iVx+wYW1bova4R1wLm365zAXIIKXmFLmN4
 iUzcPu8wpvBQ6B4YcYt4KKZpcxiN23sEIePRtqtWxD5e2lrDrdyVJl8oAA/UEb7iu4hS
 CTkQU+NcRfdfhlqvB5Nn0O/RbOnW/Jrtf1amAzU392HA/2iemd2LBRx0tFqeYUCX9j7S
 D5CnuYEZnbvlqlaLWvwV2tnzWh7SGPPu2Cdg30uQrYX4/cZKfOD+bynuml9GhdzjaW+Y
 cKJ3M8YdKtWP35HMSmDFNEcz1hRnwO0lZR98PrRjgPjR9/GyJ/I2VQBEGr+Dz77UCNKo
 vm6g==
X-Gm-Message-State: AOAM5319qDZ6ko3RMeiWr6+ifoyYdzHlOpzbJ00WgXopKBoyXXSxhB9M
 KSB4BA3EGIm5b7Lmsl+fOa7NNcz3tguTUQ==
X-Google-Smtp-Source: ABdhPJwZBK+kuCNODQef30MFac+OMpZCwsXgQSQV22GFzcYA90ZtRGD+wpkZH9SvOKfKXh18K943bA==
X-Received: by 2002:a37:bf02:: with SMTP id p2mr10702194qkf.503.1633108327052; 
 Fri, 01 Oct 2021 10:12:07 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/41] target/arm: Fixup comment re handle_cpu_signal
Date: Fri,  1 Oct 2021 13:11:26 -0400
Message-Id: <20211001171151.1739472-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1


