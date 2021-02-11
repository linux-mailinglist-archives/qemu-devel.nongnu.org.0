Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB13318B85
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:07:04 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABgV-0005da-Fp
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYu-0007xv-Ry
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYt-0008Nt-0J
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id v1so495890wrd.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PtDeqeyUBjOCMcS5vyrE3R/MbPIwJDRp4dT9irDCFLM=;
 b=EeGDLSAzF//2ZQ4oPh6L0wA5onvEzim4h76ICULhGQ2cM8L+5/D7Itc6e/sDWgU/2e
 SLQdMVHJKU9MGUZ8PiUx1onDgssebtenAtcJXTBYA5GtyhbVAGQ84vZ5oGcTPYhcIS2W
 tImm+fTMWekzaDqXQ6OQaZQzTViNFBzd6kHmLA/Uo8rVYsBBUDS/2mEQzqA3VdlUp+6U
 hr/J1K9urVYPGotc4DT2lci68YAYx+pnw0TRUXWak6811rImvAqF98f9HTj4ibDQT0DZ
 pUBatMXRxGR8UJtY5AmtHkUxPa7aD44KnwPNBsmgRWlrHTdGdSudR1GREfXYiCIjZb5k
 tt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtDeqeyUBjOCMcS5vyrE3R/MbPIwJDRp4dT9irDCFLM=;
 b=gIAJ3WlOfmTX8+htL8Gm2/DEo8an+1L+MkrEmAnhBpsGP5cbplAbCQdzUow607f2uN
 LhXzSKIdaR9JLrsS11Wcf9hOcFFvrfOMXOPtshe98iYAlwcEWc4Y2ZOQeqsU0lEPkrCv
 1xycvzbiAp2SvvnL2mZ1ScUGo4TFGVaoq4SjaTdmOc9C8G90yEs48rZ1TPR6fP0wx0SV
 yu5HzKvNpbHRwQUr4xW51yIeuky8qNOJx4QNLzDM9w1vLi30OJYtk0b2FVpaKH7Y50St
 HYUh2mWxKSdiYup1ijV77uBv+9zwsSr2EreITeGOxqwHgVG4vTrSBKf08mFM9gMiYkRt
 zpYA==
X-Gm-Message-State: AOAM53198f9hMLvPKzPr5BztGUrKzqUTmjgxNFFwk2o1FxKhFbxRarhn
 r0rfDXSWQ7m6yxzhdIUHo9Cb8hBWLIYn6A==
X-Google-Smtp-Source: ABdhPJzRbWuZ6dqyY5QYydHfZrmGx3uHMitsLysXliVEfuQwSyH5V5vwA1SzIQakgd5QnNoAeKXF/g==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr689461wrw.325.1613048349812;
 Thu, 11 Feb 2021 04:59:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] accel/tcg: Add URL of clang bug to comment about our
 workaround
Date: Thu, 11 Feb 2021 12:58:24 +0000
Message-Id: <20210211125900.22777-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

In cpu_exec() we have a longstanding workaround for compilers which
do not correctly implement the part of the sigsetjmp()/siglongjmp()
spec which requires that local variables which are not changed
between the setjmp and the longjmp retain their value.

I recently ran across the upstream clang bug report for this; add a
link to it to the comment describing the workaround, and generally
expand the comment, so that we have a reasonable chance in future of
understanding why it's there and determining when we can remove it,
assuming clang eventually fixes the bug.

Remove the /* buggy compiler */ comments on the #else and #endif:
they don't add anything to understanding and are somewhat misleading
since they're sandwiching the code path for *non*-buggy compilers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210129130330.30820-1-peter.maydell@linaro.org
---
 accel/tcg/cpu-exec.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d9ef69121cb..f2819eec7da 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -773,17 +773,30 @@ int cpu_exec(CPUState *cpu)
     /* prepare setjmp context for exception handling */
     if (sigsetjmp(cpu->jmp_env, 0) != 0) {
 #if defined(__clang__)
-        /* Some compilers wrongly smash all local variables after
-         * siglongjmp. There were bug reports for gcc 4.5.0 and clang.
+        /*
+         * Some compilers wrongly smash all local variables after
+         * siglongjmp (the spec requires that only non-volatile locals
+         * which are changed between the sigsetjmp and siglongjmp are
+         * permitted to be trashed). There were bug reports for gcc
+         * 4.5.0 and clang.  The bug is fixed in all versions of gcc
+         * that we support, but is still unfixed in clang:
+         *   https://bugs.llvm.org/show_bug.cgi?id=21183
+         *
          * Reload essential local variables here for those compilers.
-         * Newer versions of gcc would complain about this code (-Wclobbered). */
+         * Newer versions of gcc would complain about this code (-Wclobbered),
+         * so we only perform the workaround for clang.
+         */
         cpu = current_cpu;
         cc = CPU_GET_CLASS(cpu);
-#else /* buggy compiler */
-        /* Assert that the compiler does not smash local variables. */
+#else
+        /*
+         * Non-buggy compilers preserve these locals; assert that
+         * they have the correct value.
+         */
         g_assert(cpu == current_cpu);
         g_assert(cc == CPU_GET_CLASS(cpu));
-#endif /* buggy compiler */
+#endif
+
 #ifndef CONFIG_SOFTMMU
         tcg_debug_assert(!have_mmap_lock());
 #endif
-- 
2.20.1


