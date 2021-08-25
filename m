Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF93F73A5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:49:59 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqTm-00089o-DQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGQ-0004WK-5V
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGO-0005dW-HC
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b6so211040wrh.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uBxA9lRn32o8jxzCzodlCKjwyFhbRGHrLqfALZs17cU=;
 b=S+DbVzvvrqECqKhypbhmuUypvGgRE3lzIRGHnD+P/vT/OE1bm3jDBVgk1bdjPlxCrt
 PGLvyyAmUufPMHI50tG0NnMgJr45rCYWid7BSWiIABef1LUaYhxArwEKiE8MXlbG7fcO
 KZuUJ9lMsNTm4xZt+xEGcN2ogFBEAVmX9ap2/WX8sXoHteRMGapaKyrNM4H/Vrb2jFxQ
 XXfW8WtF1/DakC93sm9QM1lcBJYShbDiHobNXBBsbN5991f1bS8MqSOdm9l9oehG//ww
 MvvrL66Y6J/hwl1nVR6hNEVe2c+NnEVwY+tnEaOhgQg3KApm6bY7qiT3ttZRE5YKlwwL
 jvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBxA9lRn32o8jxzCzodlCKjwyFhbRGHrLqfALZs17cU=;
 b=jOlWpU+qQxSmTEu1rJICb605pb/8uoOjYrxEf68Nf/PBdGJlA+yok+53XBY8WD+9Td
 5ywdss8OJTMiqVOdevXJJGLycTTCe2mrO7vXQUQSR1G5izQO9xrm4LoOIFFSIGx8JWoJ
 luHiIEes8Unb/mjMfswyoH7rw7X2EROh4zunjOx3WnLvFw0a5CEyQdGBvMkauRihQ8Ff
 u+bGbyvi1O/sl0qcNXLNoZmz/5hIKvxVXojBUmiSJlkluTX5ww77H+74G1kVCz2KX8UX
 jLjvjJi/6KAa/0aw4R5Tr65KBA0T19eJIHcV3AlUnETd0X5MIkzeMoXhmMX57WyWbgLf
 2Hng==
X-Gm-Message-State: AOAM531kZOWaqG9hbcqTgLEm3pdub7LlfJbfeQlIOlNjnw9RVFu4q16v
 IMgWiu8gg+j8HNx/zPE8dsIvezoE6fRP+w==
X-Google-Smtp-Source: ABdhPJzT2ypQv06Eo1Jbidr6I7vYT+fmApnMszF32xE2B0KPnfZULB+YKqvJHc3e99ML03CG7rJFAQ==
X-Received: by 2002:adf:ba08:: with SMTP id o8mr21031211wrg.234.1629887767159; 
 Wed, 25 Aug 2021 03:36:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/44] target/arm: Re-indent sdiv and udiv helpers
Date: Wed, 25 Aug 2021 11:35:26 +0100
Message-Id: <20210825103534.6936-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

We're about to make a code change to the sdiv and udiv helper
functions, so first fix their indentation and coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730151636.17254-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf2399..8e9c2a2cf8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9355,17 +9355,20 @@ uint32_t HELPER(uxtb16)(uint32_t x)
 
 int32_t HELPER(sdiv)(int32_t num, int32_t den)
 {
-    if (den == 0)
-      return 0;
-    if (num == INT_MIN && den == -1)
-      return INT_MIN;
+    if (den == 0) {
+        return 0;
+    }
+    if (num == INT_MIN && den == -1) {
+        return INT_MIN;
+    }
     return num / den;
 }
 
 uint32_t HELPER(udiv)(uint32_t num, uint32_t den)
 {
-    if (den == 0)
-      return 0;
+    if (den == 0) {
+        return 0;
+    }
     return num / den;
 }
 
-- 
2.20.1


