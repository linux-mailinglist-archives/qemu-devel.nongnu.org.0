Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BC34CE81
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:10:15 +0200 (CEST)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpmg-00061t-N5
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfv-0000Ga-VO
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfu-0004jl-9y
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id e18so12400449wrt.6
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTPxFERU7JNP+dRRV3lyj7Z5hAmDZqNFOETfABGGYiA=;
 b=T+4Cnz8cTi8a/W5kriEn/jvoMXL3wa9aVK55x5JiDxm7bxLSaKDHDpGLMB2H86jIaZ
 4puNlKbZl6wkxJ2P09sk2o6O1xQk4MZ0EOWludd92zyPc3hTQIZjvHJefOLBB0NtX4sj
 gAHkf9cFoRjShO0BvWubE8KzWw5NkomUe/tcsUZgy8MWjyZk83jed+2aRm/9wGjR+x4L
 7OZeLzIiyxcZKeW8OeLPJ7oIXqLufMx+zyC8VyC5Dz0zJG79ZixTMBaDQz7oOIDegFbH
 tbUPOltl9ocdo8YNQRy8W0Vy+/Fi77hLr8bp/T8oxS0JSuxAoZlk0ECZXnVcNlXaL7NI
 +gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTPxFERU7JNP+dRRV3lyj7Z5hAmDZqNFOETfABGGYiA=;
 b=l70fUwiy3aNSC96xyg80Bnd0WY08GbzmCgl9TBXWATTGl4A1Iu5DJluTV8vMrlL7dY
 Qj2/UCX8ZS0SX6jUyH9K8Bz6L7KkbMW4gdvHyz8/cN33ka5oIvm/OEhCVrXsyJosPuit
 t6Ih5jEbmL7sZbXVAUW+VDPZyVETOzgzsTEPOoa91VVJ2GOG4x29kqG9Lju+vU/gjZNR
 s/VLrdqpZyqeGsOXdR+uxIA/QW8O5bh+d9XIg7C6SJzFCHR3NnURAivTQjXpS8oo77k9
 /Gjs3Fjw8rzsJ2F7KQaI4k5IJYZ+H7AClA6JDwyniMWtInFtzOYCUfKtMogaK9NvD9pX
 mlGA==
X-Gm-Message-State: AOAM53281/4odag6LNyD4boKhcHluvf9zsUp1eByddny+gaz7LLIME2r
 nlXSPG9aflPCyHyEaHCB8xfjIJlLG1Fmvzex
X-Google-Smtp-Source: ABdhPJyVhzZ+Sekz0qC6oPkNsLYdDorDdixs11TFkODdyDRBWoHNkzjyCaIo3fSUYDMB7R7s15lsbA==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr27608041wrm.273.1617015792968; 
 Mon, 29 Mar 2021 04:03:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm19297187wrr.53.2021.03.29.04.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0136C1FF92;
 Mon, 29 Mar 2021 12:03:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16 bit
 call (WIP)
Date: Mon, 29 Mar 2021 12:03:03 +0100
Message-Id: <20210329110303.15235-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer compilers complain about non-matching constraints:

  test-i386.c:1393:5: error: asm operand 2 probably doesn’t match constraints [-Werror]
   1393 |     asm volatile ("lcall %1, %2"
        |     ^~~

It seems the plain "i" immediate constraint is a little too lax here.
What we are actually dealing with is a 32 bit offset into a particular
segment. I think that is "Ts" (Address operand without segment
register).

[AJB: however this just seems to push it a bit further down the road:

test-i386.c:1393: Error: operand type mismatch for `lcall'

Inline ASM constraints are hard :-/]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/i386/test-i386.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index 18d5609665..6d8aeccfb5 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1392,15 +1392,15 @@ void test_code16(void)
     /* call the first function */
     asm volatile ("lcall %1, %2"
                   : "=a" (res)
-                  : "i" (MK_SEL(1)), "i" (&code16_func1): "memory", "cc");
+                  : "i" (MK_SEL(1)), "Ts" (&code16_func1): "memory", "cc");
     printf("func1() = 0x%08x\n", res);
     asm volatile ("lcall %2, %3"
                   : "=a" (res), "=c" (res2)
-                  : "i" (MK_SEL(1)), "i" (&code16_func2): "memory", "cc");
+                  : "i" (MK_SEL(1)), "Ts" (&code16_func2): "memory", "cc");
     printf("func2() = 0x%08x spdec=%d\n", res, res2);
     asm volatile ("lcall %1, %2"
                   : "=a" (res)
-                  : "i" (MK_SEL(1)), "i" (&code16_func3): "memory", "cc");
+                  : "i" (MK_SEL(1)), "Ts" (&code16_func3): "memory", "cc");
     printf("func3() = 0x%08x\n", res);
 }
 #endif
-- 
2.20.1


