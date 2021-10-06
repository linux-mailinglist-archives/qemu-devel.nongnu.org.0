Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1E424453
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:32:12 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAm3-0004n0-6S
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAda-0007CM-3r
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:26 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdX-00084i-7I
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:25 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 75so3105530pga.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=XvVeHc8DLMvOha5YNgxQTkvMhs7XvYF/LiS4CFDtD/l5hrUxQ2WQxSO1IePsQaAi0k
 8tABLDBlThkah4i8dr64cdZuQrxbn6KZWXkpXcIqfa8eJJtZFtPKT9loSE5UZ5/meTnR
 jo6sxBtFKPq9ocLj+W7SaEzs8EGsJTcitomt6u631RPWpPqOvGrUVHAZlHmec6KRORPY
 B/dfV3G5JOlLKgBgVxoI8saczG7WXgNJjb4aW/1A9J7lhgPgsvrkmPy6XHweyzrukAwO
 LTcwrZQ4P7hu28Z/uq1QeOy66assgzkCvxEXE8sYz4K5zepTgLMwKLPfdwjjFqFRcVAb
 GTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=cSw28JlX5CvH8XSAk4IoGNLmE/fyCtlE1TtJx5w4/WwM5E5p4sslUs9qwHPyOgMvJ0
 EoRqoBQgwqNAq6TOADksFvQRHk11atKuRcL4EKjX0dftJodWUKxULsTismqowX7GAupm
 sojhQYBw5iPFXLIMXTDL8ub58aPMf8NXxxH/nvEXyczmEVXol/79wkp2lwnPtfYz0DAm
 2JnjwrP201vIXVRXl6VdbdCnpSFUIVGb3NYSMPUNaIfWBdG/4S24iqG9yHL7QZw7dGKV
 dwyjej66yHcvgZG59vMD07niWcjx28kEHPTQ+fCuJWNzPRGNGs4AScPSo1LXgQbDjIq4
 AkqA==
X-Gm-Message-State: AOAM532yfnqb/sWCS+mrlikPHzdATU2SWApfAq2QefgqQU1us+hIbUTn
 Ez6h5bW/HNS1uqqP98/CNOF1qDop9VICVQ==
X-Google-Smtp-Source: ABdhPJwxpZbhErR1333hu7aJ3iM5Vo36lvHz1NPosVM1y676cwmPSCHXmnOO3VNeS7VAcWn4Y98lgg==
X-Received: by 2002:aa7:91c2:0:b0:44c:a5a4:43d4 with SMTP id
 z2-20020aa791c2000000b0044ca5a443d4mr4256777pfa.20.1633541001649; 
 Wed, 06 Oct 2021 10:23:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/41] target/arm: Fixup comment re handle_cpu_signal
Date: Wed,  6 Oct 2021 10:22:42 -0700
Message-Id: <20211006172307.780893-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


