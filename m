Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466450A50C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:13:17 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZQi-0000UK-Ld
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdO-0005o8-Qp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:20 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdN-0007HX-9n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:18 -0400
Received: by mail-il1-x134.google.com with SMTP id d4so3252713iln.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwV7h+cRAVlBMNxIV8xTU8C+Bl+pxTzWQ3OYqttL/GI=;
 b=BxM1FJlmscGPBFByibhZl9u4CzIDwgUxyuZ4L5GOUD0qroCyt8FJx6C1FG1evk/Bym
 F77PJvl+8TEwYxvAr2Io8aLl6mAVFmbTh6RZROD1Xt2CvYcUGNUgZ1acE+qBx5sod3uD
 qvau20IPis07qoW8IOS0KQ4lxViXY+fitpHwsqYnl0u3wuLb55UBiN6mE7uZbUgk+wqc
 7zdTnjdO0KabK5qnRmGyhrsG3Hu51eSCtN+uk+r5uj6D9jNMxvdB7eFhO8yAGHQkoSY+
 IRNOFIy82WBHGWFujyYlHS/bC+sS5rDt0s7vJ5LiQIzQb3IJnKx+vh88bPZD/pn/joIQ
 LvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HwV7h+cRAVlBMNxIV8xTU8C+Bl+pxTzWQ3OYqttL/GI=;
 b=lg3E5UHyFEGWQWxcG8gy1VEz1Vw+5FlnVVtKM9O+Ne2T8GC9Rem9VrOMcm1zlUSvVN
 WFGQEgvly3AsaZfYQ6YvnO8T7WJaSAPsRNXQG+ytR0/nw3LU0S3/NIPXYUqrDkdXsWrN
 ngsjZaTqGdqzs0gu+USlivGce+xVKvoqYZvqYJZMPouTiVfqDnCCgI2ybUv+KWy7J93g
 199ve5RbWtAdqIWpp7hr4UEA1sKlV2CGvqbs0V3IMb0E1KBd3OZ5H6wxwSFaY+P3cV+f
 s4vQhRrv0BA2yxFaBBi3iPQKR78797s1wjwvFiQNaDw0iubKB/ws1qM4bMzM8qIpnoAt
 5Dhg==
X-Gm-Message-State: AOAM533ay8GWzNIO35AjeMXpsV58FMibj+ubweRRZYFNoq1B8o5oBMLV
 z+BDOxLx5p2DvS6lUl1B3Q7wczjHo6Cg7g==
X-Google-Smtp-Source: ABdhPJzs71I226j4qz+35yQaSRYfz+gxmyC4AkS6peDiy024BB7ZKsCHXSr8lKR8VxikTyNZKYxoCg==
X-Received: by 2002:a05:6e02:1a6b:b0:2cc:1eef:9c8c with SMTP id
 w11-20020a056e021a6b00b002cc1eef9c8cmr89733ilv.256.1650554534952; 
 Thu, 21 Apr 2022 08:22:14 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:22:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 64/64] tests/tcg/nios2: Add test-shadow-1
Date: Thu, 21 Apr 2022 08:17:35 -0700
Message-Id: <20220421151735.31996-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x134.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a regression test for tcg indirect global lowering.

This appeared with nios2, with cps != 0, so that we use
indirection into the shadow register set.  An indirect
call verifies alignment of rA.  The use of rA was live
across the brcond leading to a tcg_debug_assert failure.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.softmmu-target |  1 +
 tests/tcg/nios2/test-shadow-1.S         | 37 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 tests/tcg/nios2/test-shadow-1.S

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index 70664db81c..b5f6a08848 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -27,3 +27,4 @@ QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
+TESTS += test-shadow-1
diff --git a/tests/tcg/nios2/test-shadow-1.S b/tests/tcg/nios2/test-shadow-1.S
new file mode 100644
index 0000000000..33076ddf59
--- /dev/null
+++ b/tests/tcg/nios2/test-shadow-1.S
@@ -0,0 +1,37 @@
+/*
+ * Regresion test for TCG indirect global lowering.
+ */
+
+#include "semicall.h"
+
+	.text
+	.set noat
+	.align	2
+	.globl	main
+	.type	main, @function
+
+main:
+	/* Initialize r0 in shadow register set 1. */
+	movhi	at, 1			/* PRS=1, CRS=0, RSIE=0, PIE=0 */
+	wrctl	status, at
+	wrprs	zero, zero
+
+	/* Change current register set to 1. */
+	movi	at, 1 << 10		/* PRS=0, CRS=1, RSIE=0, PIE=0 */
+	wrctl	estatus, at
+	movia	ea, 1f
+	eret
+
+	/* Load address for callr, then end TB. */
+1:	movia	at, 3f
+	br	2f
+
+	/* Test case! TCG abort on indirect lowering across brcond. */
+2:	callr	at
+
+	/* exit(0) */
+3:	movi	r4, HOSTED_EXIT
+	movi	r5, 0
+	semihosting_call
+
+	.size	main, . - main
-- 
2.34.1


