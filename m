Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A431E828
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:57:09 +0100 (CET)
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg3Y-0008KD-Cy
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuB-0006uU-Nn
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:27 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu9-0007GX-SD
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id w4so2273780wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B5NVJWShkqLmkp8M5PrhYPz2ELSI66dOr5HdtDYREdA=;
 b=wT0jqi7VqE4BoWpQSlohidTwNIMTKUQZ3bqI909iXR2WuPMBaWyzNRcAkaR2iKJhWr
 F4jMPB9BQ3eJgclM0/2+irNz//ZegBi4r18V2OU316EUk85MOg+thw81qWAqvMEI/4bg
 1uNm3yJMltD484+3KD8gFFhVi4a3egROcNl4+7a17R8bNI38NliuF1cStGES8p+X/04y
 8toJJYN+kBhfLXODI/IjmjDXdfqq36n8CZknH4ZBeksrXXbD9JJ+VgnGQZBhs9ds8AwF
 NCkPdbN9lK+sUekmrCbPCGFjXzI3mQkQp/lAQX4zStKBTs+7jhwmrTjwjBGKOhiUpu9U
 7RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B5NVJWShkqLmkp8M5PrhYPz2ELSI66dOr5HdtDYREdA=;
 b=ZxDAWrxd4LY+bVbg2iboV31MedPLBQtBepYbxSBwgjzgiwouYcI/lc5aif+WPkdsLu
 D2yZUNrL/j6ESZD5eVcO3ZgRA+a2YoK/UtGQqX9h2LsTlCnebGQKpRO0IMY0Qp2otIgx
 27mkdGknFq9kscYREa4/cShjU4RnpKJdlSyPHv+BQP5vJw7RfPta5xr8NAqVqfurcmEj
 NWdIvg0/aPQU3IUpKeLofHRemj+GFwjZJRqHBMlokUqICk0Os1VW1j4g/jD725zhUktl
 MH/JPBYWxvMo3WsOKlke/QaI7HpMkI46ccqtRTsInkpHtSM1mm1aBYApnW1iflS/OA1l
 wCBQ==
X-Gm-Message-State: AOAM531Hv+N8sdCbD/tB5BBS01ORDAZ2mjYJSyxaiV+PTT7f5xIpUfwk
 Qu15XWA/OV4QUJiPIO5xVJnoSw==
X-Google-Smtp-Source: ABdhPJzdnosZPNnmqkIHNG1at2vCLiYxGw/2tsTzazeZswWab0cyCXvUrJbr6JjSWNOpOmYi5kNLkw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr2703841wmc.43.1613641644431;
 Thu, 18 Feb 2021 01:47:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm6234457wml.34.2021.02.18.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 082E11FF9A;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/23] accel/tcg: Create io_recompile_replay_branch hook
Date: Thu, 18 Feb 2021 09:46:54 +0000
Message-Id: <20210218094706.23038-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a hook in which to split out the mips and
sh4 ifdefs from cpu_io_recompile.

[AJB: s/stoped/stopped/]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-12-alex.bennee@linaro.org>

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ac3bb051f2..72d791438c 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,16 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @io_recompile_replay_branch: Callback for cpu_io_recompile.
+     *
+     * The cpu has been stopped, and cpu_restore_state_from_tb has been
+     * called.  If the faulting instruction is in a delay slot, and the
+     * target architecture requires re-execution of the branch, then
+     * adjust the cpu state as required and return true.
+     */
+    bool (*io_recompile_replay_branch)(CPUState *cpu,
+                                       const TranslationBlock *tb);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 2c34adccce..99ca6f36b9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -60,6 +60,7 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
@@ -2421,6 +2422,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
+    CPUClass *cc;
     uint32_t n;
 
     tb = tcg_tb_lookup(retaddr);
@@ -2430,11 +2432,18 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     }
     cpu_restore_state_from_tb(cpu, tb, retaddr, true);
 
-    /* On MIPS and SH, delay slot instructions can only be restarted if
-       they were already the first instruction in the TB.  If this is not
-       the first instruction in a TB then re-execute the preceding
-       branch.  */
+    /*
+     * Some guests must re-execute the branch when re-executing a delay
+     * slot instruction.  When this is the case, adjust icount and N
+     * to account for the re-execution of the branch.
+     */
     n = 1;
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->tcg_ops->io_recompile_replay_branch &&
+        cc->tcg_ops->io_recompile_replay_branch(cpu, tb)) {
+        cpu_neg(cpu)->icount_decr.u16.low++;
+        n = 2;
+    }
 #if defined(TARGET_MIPS)
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
         && env->active_tc.PC != tb->pc) {
-- 
2.20.1


