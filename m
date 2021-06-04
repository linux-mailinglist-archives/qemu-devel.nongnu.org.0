Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11539BD52
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:35:54 +0200 (CEST)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCnZ-0005B1-Ia
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCI8-0008U9-P6
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHf-0005rw-OP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id z8so9801943wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGeDOwWwESs2gGWztkDCsxwH9lAbDgWWcLiqhQ1nuks=;
 b=hVeY+N7UJ5et154mehRHnRJzJGgbp6XaKvWItU7A/3rgLqBR3rBdNSkWExUdU0ZEUZ
 wFG5aqQoqI2mfSyuLKvsYw/67HV50BVqWEWpVBraEdpQ2iX2ehB4L0BSDjSCNfilmmW8
 TCjPvmM8KxWP98yUHOANBY9t34wnQvNfUJ8TutmTd4OxQnv0M7+fmbqG2MfXxrEJSB5X
 YX7//QICp46LtXEIdXRrXotqnuA9wlf6QWFhG6Gdb1mS0Mf9Jo+F+T3q5JeCVn4YJ3wq
 /WbBZDi1pn8voRQ5Hr6lrs0b4Lqma0yehoLpxgb1Gxr3pvmYihGORlppyYvHU4rCdzaK
 nFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LGeDOwWwESs2gGWztkDCsxwH9lAbDgWWcLiqhQ1nuks=;
 b=KOBk9kc2ze0KKt0Pa2Ba6g7rIn0L5SoI45MPSGLfiBefrRRqk0gE1fmWEbk6/cKl2e
 VUW6gItYhbG/InuxgVcaSTlqL9WTlxd+zCh9A/ejffVmiNSRiKNq5CTj7Sgc3gNveVL6
 2OrcmSWWr6ZY+R9jSr3LtQIF8QzEdsD51RuhYXpFUbT5+T95n641QiU9KHZd/kahXkm5
 Aln90ANsgkGCG/52TwjAqQHE3FMtolicU8ju+6y6gr5LGhgW8RvTJIGvH+TGOfyMR6EY
 MfZVMuzV+/EhqFkIf9mxq9wFp0rdl2EPezt+CSJkK+1MaYJ/DwvjqhfbXLW84OZ9CXbs
 xrZA==
X-Gm-Message-State: AOAM532+IJu9yoWqaofKgrOfTR3EKREMbAZ9DqE1uWj9UJ5YLJJXAPMg
 Hsrq6Wjwl/gi1Y8nnbFPgDcSjQ==
X-Google-Smtp-Source: ABdhPJwcNbZVK++BkKK9TWzZm4+G96dB4jZAXsgR9Aj2f3SvGT5ZSP9XpD3p37EDsInv423HVIk9ZQ==
X-Received: by 2002:adf:e109:: with SMTP id t9mr4610797wrz.372.1622822574450; 
 Fri, 04 Jun 2021 09:02:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e27sm7421445wra.50.2021.06.04.09.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 322761FFCB;
 Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 52/99] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Date: Fri,  4 Jun 2021 16:52:25 +0100
Message-Id: <20210604155312.15902-53-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-cpu.h        | 2 +-
 target/arm/cpu-sysemu.c         | 2 +-
 target/arm/tcg/sysemu/tcg-cpu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index 0ee8ba073b..7e62f92d16 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -24,7 +24,7 @@
 
 #ifndef CONFIG_USER_ONLY
 /* Do semihosting call and set the appropriate return value. */
-void handle_semihosting(CPUState *cs);
+void tcg_handle_semihosting(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 0e872b2e55..7569241339 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -1153,7 +1153,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      * must be handled here.
      */
     if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
+        tcg_handle_semihosting(cs);
         return;
     }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index af9d3905d7..2c395f47e7 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -52,7 +52,7 @@
  * We only see semihosting exceptions in TCG only as they are not
  * trapped to the hypervisor in KVM.
  */
-void handle_semihosting(CPUState *cs)
+void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-- 
2.20.1


