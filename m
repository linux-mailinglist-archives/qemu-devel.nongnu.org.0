Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC15106C3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:23:22 +0200 (CEST)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPqM-0000GQ-1b
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0002YI-OR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmV-0004Lz-A8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a11so7470966pff.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtRmXlsOxeVOyDOQBenqjq06keYpCIdFa3N3ui9g9FQ=;
 b=Tmp/u/OGcMCpu5xMjc019OXaLZ88WXwF+9yvUdJun4TxxrAmIypzUUjCdSEMd2CqKk
 UPxdMkKYB+WuNvC/aKbVPT5XT1ViIBwnMDBi1DRyuYiczKUioy5INWTz9TC/6LITT87i
 O/23oNcfJLPGMbqXaBKCuFnZPIWBSLYad1rlf0jD5syhYZTSpjR7VxOTgrW3tuRYOLya
 Ju3xbHcfz8zVtN3YsrAuWTyfQzMG67RNKPM21gqPOcNFyTFaRBIL4Jf3JtgV7vdu6HCb
 CIAuuZwCexYVW7AWMU5YCxwKHGMigBU00/fV4+SHxLgScn+n70+kZ8i/H7NDAGtj9Isr
 oxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtRmXlsOxeVOyDOQBenqjq06keYpCIdFa3N3ui9g9FQ=;
 b=I/V4qJoPu4nRtzy4RWV7ZOYeNZ63ErXQS6ApUkhwAU2RBUumpwTke6x4Dp9IydfG+j
 k3bKoR6juQ+d7IxWLC9a441w2Nxbg7wL4xoj6lG1VIBnR4XNgQi+kA1kxjIUroNiqtIQ
 Y8EiHOt7DDk9JB0LFcXaR3Qsv1xrM+6s8lTdtKOtXyxkenbFfsSdu7KDCL6TsbivK3Hx
 XOCH1T1uHbM0m/1Hl70zANY+DBgLloNRnwzOaRObs6DbmQNN9VLz/ocICzcE97w5vXEc
 bCuSUC2yqt2K4v3zNLRlAZ5/lJgSWXgQKOX1KMoY4OrYaCQjQJgvf3Rplz7W4466YcRF
 xcxw==
X-Gm-Message-State: AOAM533vAEkItYMmd5TrNnAVqCUI+fCL59qs8IaDISRE/8mcgYJvowXD
 nMSdxSShVcQe8TucYv7LBzW+D7GWZ6PGpA==
X-Google-Smtp-Source: ABdhPJz+FDxKXWNJ4h6moGmTNB0AF5JTjizGz9EQ3HMXvkliRmNe2QofuLTwOwHnztsy/pw6b09N+g==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id
 j2-20020aa783c2000000b00505723f6acemr26064489pfn.86.1650997159068; 
 Tue, 26 Apr 2022 11:19:19 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/68] linux-user/nios2: Use force_sig_fault for EXCP_DEBUG
Date: Tue, 26 Apr 2022 11:18:11 -0700
Message-Id: <20220426181907.103691-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the simpler signal interface, which forces us to supply
the missing PC value to si_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-13-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index f37850fe81..e725036628 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     int trapnr, ret;
 
     for (;;) {
@@ -121,10 +120,7 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
             break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
-- 
2.34.1


