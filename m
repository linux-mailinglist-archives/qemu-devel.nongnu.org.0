Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DC55BF19
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:28:12 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65ds-0003MR-09
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FO-0003AO-J1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:48 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FN-0008G4-1B
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:46 -0400
Received: by mail-pf1-x432.google.com with SMTP id d17so10917841pfq.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1ZDBnw0lkX4YrNv7Tv2EuCi+urg5qVqojkVKbH0n5o=;
 b=bW1hkOw0g1LQIwRhdUCsQaWncsdyCzDFT7smCy7T3Db3H8UF+545sgjayWESM+yE3b
 xTYRiIL7ORCFC7PBAXioKTvoDsPkT28o393Xonq+MKH+eZOGad0RVtQJb+K95lxo8k9k
 k1zm9eO99jNISYqOrfC9fN0GdfX98Qb+hTallkY86zCGUvKlykWNIKjeP7k+5cl7iLR7
 Vgabfd8GMxaR82Hc5gWNlt+xjVcl0cCN3g0WZULNQwhEolBjhLTRUwoN04/CDvOXY9m/
 pCOkK4fOrqrnpj4OXz4/iguhn5vesO9Mjs3P3PWNKMQWHBwo85I/0GFAU76dETRgWs1l
 0q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1ZDBnw0lkX4YrNv7Tv2EuCi+urg5qVqojkVKbH0n5o=;
 b=kLUIycZNPTqlxGt//LRxyWiU3aKjbcVKnGDhwWMpirM7R5/68IJMv5ve45IfXJDPMf
 0+KFKsjALTCjQY8vqvkfayriplbZQpEu67dUcVmJW+3uXhnD7A+ZO31a9L67qXf2ZOFm
 ++K2+kWYlxCH3U5u8O3PUPxOUhNUvlMBosAKOlyhQ0lF04cie2AIEUndL9eNDYXvRvRp
 StgnwxxNLVCUMa6GitWOw8lFnzSunhMgwuKO2cI8SDuj7EwqENVqeQYABUK0u+a9IUAq
 DvCY5X0094bn0fgAL7RFQMbtQO+1Zi0JWPJkYvlI6UEw/IQhnBLb35CLAXolLD9JFJDW
 xL3w==
X-Gm-Message-State: AJIora+kOzilW46a4MYoyN9AcROt1X7uCCDJvCq26J++BeSgLec4CSgt
 sbwVsMZ49Zm1I5HJtDknWfPqchDBU9aDdA==
X-Google-Smtp-Source: AGRyM1srh/kAImLiIvmA6M0kyMH/93FXXtGaHHIG83DeDHBTJC6CamAcPp7nqcrhJZ6ZnHW60ZIk4g==
X-Received: by 2002:a63:6d7:0:b0:411:51f2:6de2 with SMTP id
 206-20020a6306d7000000b0041151f26de2mr3187221pgg.184.1656392084269; 
 Mon, 27 Jun 2022 21:54:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 15/60] semihosting: Remove GDB_O_BINARY
Date: Tue, 28 Jun 2022 10:23:18 +0530
Message-Id: <20220628045403.508716-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The value is zero, and gdb always opens files in binary mode.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index cebbad2355..92c1375b15 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -92,21 +92,20 @@
 #define GDB_O_APPEND  0x008
 #define GDB_O_CREAT   0x200
 #define GDB_O_TRUNC   0x400
-#define GDB_O_BINARY  0
 
 static int gdb_open_modeflags[12] = {
     GDB_O_RDONLY,
-    GDB_O_RDONLY | GDB_O_BINARY,
+    GDB_O_RDONLY,
+    GDB_O_RDWR,
     GDB_O_RDWR,
-    GDB_O_RDWR | GDB_O_BINARY,
     GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
-    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
-    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
     GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
-    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY,
+    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
+    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
-    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
 };
 
 static int open_modeflags[12] = {
-- 
2.34.1


