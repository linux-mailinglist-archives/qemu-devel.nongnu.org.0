Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978D518E74
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:13:20 +0200 (CEST)
Received: from localhost ([::1]:38766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlytb-0005qa-3Q
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWW-0002Hp-Lc
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWS-0003cn-Op
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:27 -0400
Received: by mail-pj1-x1031.google.com with SMTP id o69so14879539pjo.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=XqoIEfXhd7BNceb0kMrO9zkTaldhqCjVxLq04bcUc930Z6ZsliYjlWM5p5uheI2UXG
 o0VmD0Y285TgVLMnHdSfL6w7pMlulkyPyvfOmmSpm6Qpwa0sDO3UfKg9bVq0caIPM7BB
 wvHXpYcFG6VR1YIRpX31G5FhuZD/NyLUB5AFEGUhSBGaShydujFcF01EhL4CYOHMr8nv
 zYtSG852v6QjDjAFEMUyxvEk46J2Q0T/+5OdOerEodalHHY6COrmYSADLtwxacfnrdjS
 IBwOc57uVHDxLnorIoAptMuSK3VofXVpHDHAPygVTkdInPkzYTwjJGEUMCe4zJSmaB5b
 aJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=qr8n0ORqjQIiO+BTWY+KDAx6kCll2hPhTA6ysBTbQWaMYKcB/tBPzD/VN1bfnzfmF1
 q5N4iFZ+WdCdcNbwzLwsCGyxgIKzYBzQM6Yv1pNrf8JK8uFaNCQLvZGjSs4PzMwIYgzk
 yvHOp8ygGm2CMnBSTmVe8jh5ezv4br3N2hluKyjMlFrMLOlirbznYIcOo9CfS8uGkmz6
 S33aNvBLFrc7BH8jUZEzt2asfnkZJX3tJr2d1qM8n3llcgwfcYCM+kNAdtcGbwKOUOse
 0ieHM0scL9RvpDyQHrLDfmbF7mI/65IM5VBWAjr5TyfHTsUitGXy/GMk+lzDh/gbhJqB
 /wGQ==
X-Gm-Message-State: AOAM533aZ7gqxWKeSmExHXLRifbvCwNA1LfjRqXeCectJTd77WTFjI/U
 yUhs+oNGa4Omgl7KkENYYLplwuyIElvhVw==
X-Google-Smtp-Source: ABdhPJzIePYQ6F1YY3jiZDQRfbMLXvW144Y1/kNE4A9ZJFtIT/jr7BJ8VTpfSO/aKvnkomOgsREt5A==
X-Received: by 2002:a17:902:bc46:b0:15c:f32f:39bf with SMTP id
 t6-20020a170902bc4600b0015cf32f39bfmr19278504plz.32.1651607360084; 
 Tue, 03 May 2022 12:49:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/74] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
Date: Tue,  3 May 2022 12:48:04 -0700
Message-Id: <20220503194843.1379101-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation of qemu_semihosting_console_inc does not
defer to gdbstub, but only reads from the fifo in console.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 0238f540f4..4f6217bf10 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -41,11 +41,10 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
  * qemu_semihosting_console_inc:
  * @env: CPUArchState
  *
- * Receive single character from debug console. This may be the remote
- * gdb session if a softmmu guest is currently being debugged. As this
- * call may block if no data is available we suspend the CPU and will
- * re-execute the instruction when data is there. Therefore two
- * conditions must be met:
+ * Receive single character from debug console.  As this call may block
+ * if no data is available we suspend the CPU and will re-execute the
+ * instruction when data is there. Therefore two conditions must be met:
+ *
  *   - CPUState is synchronized before calling this function
  *   - pc is only updated once the character is successfully returned
  *
-- 
2.34.1


