Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F831563D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:46:03 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y1S-0003ZB-Gm
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk8-0003CS-D9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:08 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk6-0007r3-R8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id j11so4158095wmi.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLoHyoIh1M9yTgnlc4zbWUCZ8MEEKdj0MabvYTrqb/0=;
 b=Hn67e/YGVD27SZi5AWZq2SgTKq0p4yhaYsrRFTKCYYTNcVO4eWjaZytEqxzTGgOCFN
 Cd3QBqxUB/Re8BP5XTSRqdBU2OUeayPOY+UVFxbo260NujHPxPaPJyEt6bBsjsSM2qgF
 EP7GOdB+gYgUoT5uL5PzF18oA+dmMh+kn9UTjrPkf8ax8IJzTnlteaV2ZVEIscVRSE1h
 vBNP4MjZctY1W8A6u064wufX++kyf8127Wwk+tkD/TXNLOnrbJqQGcuSRWH1qfW4fEwA
 8PQQvCZVtJ6HYJHdAbgdt/EkvEPGO6vYvHTXRmltITBRCrKYDcqdBWbcA8FHeVgCre/Q
 icVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLoHyoIh1M9yTgnlc4zbWUCZ8MEEKdj0MabvYTrqb/0=;
 b=coXSW84/UcL9lPkCxNCF1yZh/IOzflRxZHueDfaGgbc80snwuQRkujEySojd8W53U7
 MA6bib5U9IUq3G4J+gD9ZmZFIGC4WJp6qZjqqxtjp/mHJjTu5WYDQvV671DycnLUfiuE
 RaEWsQM8y2/5TgbdafBzGnerYO/n11zxyYRPVbirPBWfU0hzQ9beL8nZ26wDBlnZUxGD
 yPAm6vMdXYeo2Vw4pwfCMwX7YbsBpEpHe5NXUwFuZVTJ74jyGtbcWPt0tiZJ8NwJPVz4
 ZPuFeroQkYenyckJiZtZ4yGTs9zNxEyttQ3NLW2ZOdfvMTF/B5JnebOeu4w+LekDuL6j
 oOcg==
X-Gm-Message-State: AOAM533z2XkAF1OsBHlX/9MuBQwu+qfRtX3WElAMUUAoFcG06GuWbT6A
 0lD3yv5BePzO1rwwb/zuXgOexA==
X-Google-Smtp-Source: ABdhPJykNrgr53AS9c2JgwrCOXcqR0yJDEUMhBCOCK2GFLRs2wekemRGutyZD+W9GsEn2ngQJjcpuQ==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr4727349wmj.175.1612895285458; 
 Tue, 09 Feb 2021 10:28:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm9554487wmk.0.2021.02.09.10.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAA841FF93;
 Tue,  9 Feb 2021 18:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/12] accel/tcg: actually cache our partial icount TB
Date: Tue,  9 Feb 2021 18:27:43 +0000
Message-Id: <20210209182749.31323-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we exit a block under icount with instructions left to execute we
might need a shorter than normal block to take us to the next
deterministic event. Instead of creating a throwaway block on demand
we use the existing compile flags mechanism to ensure we fetch (or
compile and fetch) a block with exactly the number of instructions we
need.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d9ef69121c..7f477af891 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -730,16 +730,18 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-    insns_left = MIN(0xffff, cpu->icount_budget);
+    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
-    if (!cpu->icount_extra && insns_left < tb->icount) {
-        /* Execute any remaining instructions, then let the main loop
-         * handle the next event.
-         */
-        if (insns_left > 0) {
-            cpu_exec_nocache(cpu, insns_left, tb, false);
-        }
+
+    /*
+     * If the next tb has more instructions than we have left to
+     * execute we need to ensure we find/generate a TB with exactly
+     * insns_left instructions in it.
+     */
+    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
+        g_assert(insns_left < CF_COUNT_MASK);
+        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
 }
-- 
2.20.1


