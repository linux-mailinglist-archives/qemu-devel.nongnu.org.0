Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C627E3DBBEC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:17:50 +0200 (CEST)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UGj-0006iC-SA
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFg-0004le-0b
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFc-0008SL-FC
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b11so6412221wrx.6
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qdsJPOGId78mowOWjxsBg3oGgGP3Tn6FPHFa9MGGUUk=;
 b=PhR2e5GtlUv/4uB7WBnrgj3CZF4WMProYoU/08hwbftn1aYSB/DJT9ltmJaHlRFZJ/
 wZrzYmyKokBvWPJxwPsIx/j2BGtwNnFvJ0nEXulj8yh8iTpjik5BXkcKsDAPvo2M3MKe
 eiIJ5Ivn7Ar029I6d6g8dpBoc3G1SrOM6HdM0MfSq5jzmlWZH8o3L+X60bFyO1JVh0F5
 vZiRPtKD19M+3m6pJNs5T8Mv3a4/81foyeZ7D23yEtnvGT9sc9YDoepnqdXDjXM4Xv+r
 Bsy2pWch56zW9CLYPh5n/v3h7/zheG09L8pr7a0aCCsBJbF0ZbGsOqdQQRPMUXlHI6gl
 oJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdsJPOGId78mowOWjxsBg3oGgGP3Tn6FPHFa9MGGUUk=;
 b=hcqhk7aF1nhrnzgX+bSe+4it8aLpXHdt8KRdAf1o1T3f+npyc8Dkl+zs89NrwlUbvr
 5qUGoJuUvfoBU/R+AYKgNvipiXcSrCPAowbzKzQZxKNVEvbut2bqXAuw4h3ReAQ21EI+
 DX4sxeBUaQd/1PH6VfiCPbaRUKgHMB2TZEQdQ+AYb7Z9a16t55ydSLRA0gJdIpadwNSo
 KOzemAIvKp2AO2nBbhk0QeyYD87eB5Pm/T0BQ/B2hnzwIhmirh+VN7FUrkId5i7hOWbY
 DRHmVzAdWidrZl6T8OhfydfImzDSnsAcEK4f4zWlX8G7mv5V72pQeIwS41u+wM3I5wIq
 QOiQ==
X-Gm-Message-State: AOAM5313lhJGM21fvc2tx4srDy6l5PohieiU8e60YBG9BbrtzGIYSgR7
 Y2NM8w64dLvwbM0pZ/MTEhKbww==
X-Google-Smtp-Source: ABdhPJwN+jczn/hv7zQVJx3RgjLl6lVhk64yLfyMrI74GFKupCOetIXcw9Z61K337rrEz6KwFUFVFA==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr3599223wrq.322.1627658199180; 
 Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Re-indent sdiv and udiv helpers
Date: Fri, 30 Jul 2021 16:16:35 +0100
Message-Id: <20210730151636.17254-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730151636.17254-1-peter.maydell@linaro.org>
References: <20210730151636.17254-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


