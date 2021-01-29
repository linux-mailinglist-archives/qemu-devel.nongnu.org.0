Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3430893A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:06:12 +0100 (CET)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5TTX-0007Dt-Df
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5TRA-0006VO-3J
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:03:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5TR2-0008Q0-3y
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:03:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d16so8724947wro.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jrHCzYEOR6RGyxkb27YD16QM66K/JnzVSwnRZy93A9U=;
 b=p0TtoS6E8Tm+npN5BV+4bqKXAHqMEY1mwHtP9Tcz5zQOxHaeWvXcCuXEPb1KHzCLbb
 yvt8wUfN8BzvsB7Ige1Ji2KEA+UsPHsisjj+HatVBDALXjEkokqqtcZBaXm6HVp0VrAf
 F41iUivTnow3plPZ3SCnP9EXVC7v60gGac4r/UTBnGbwhM202Q6x7aJeLvkh8zO9HcZT
 sAPJttOGNgrcZSpE/eVV55KxOAYVwzaO3yMpO50Tq/W/0txRusGOm0k0I3MIwLHrlAJv
 wreYj1xq/dU/1sTSfFtWKIKe5ycUW4sV/8ra/iszhDQlgHpdfoPEEkMj/7ZkFogVwJ1Z
 YbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jrHCzYEOR6RGyxkb27YD16QM66K/JnzVSwnRZy93A9U=;
 b=uaZW8f23emdZDsPww5hJ0JWyAHK6UiW/OatUZEGFVzvS38AB9TC74pDCp4XU9rXf/y
 BMkc+Vv489WVQFOJQaQ0CnxVJcePUU00AUiaY5axz2ypqF7L3wNQA2kLjGdlcJZ4GGuR
 wO+eo/t/uI1d8Gkk+IZ1480hBhJodpSQnyT5qTfjTPC8SSpigJ68/hjmHtY2ryV+xYUj
 P7GBj0J6zucRl4KSBygcfoTSbir8Fh44ThD727SV1c03a3oHzG9F9Y6lya5F9eQjCdUM
 7KqOJ6J7yuIAVVuHXSOeyr58uuKklgFVE3V/FKRJrrLAeIcCsSXIiksKtx4ejSq6KHWP
 bX0w==
X-Gm-Message-State: AOAM530Ry64EWqkfEn4qnK8Xo3dnO2lFuhOCMk32QdC8BINlHc9dW4Bn
 n97ZORxKlK8j/pzvFYQutckYy2bAvYOZzg==
X-Google-Smtp-Source: ABdhPJweuigdp/Vfz1tViY3sXR8yVqso0fI6WwxtG7NEBnI4zsl3SoYJmgX5Lo/4s/OGVecBHDFidw==
X-Received: by 2002:adf:e3c2:: with SMTP id k2mr4379878wrm.337.1611925412747; 
 Fri, 29 Jan 2021 05:03:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m22sm9640383wrh.66.2021.01.29.05.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:03:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Add URL of clang bug to comment about our
 workaround
Date: Fri, 29 Jan 2021 13:03:30 +0000
Message-Id: <20210129130330.30820-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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
 Richard Henderson <richard.henderson@linaro.org>
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
---
 accel/tcg/cpu-exec.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6d017e46dd8..0abdae6f9f3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -772,17 +772,30 @@ int cpu_exec(CPUState *cpu)
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


