Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61231ABB6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:29:01 +0100 (CET)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuyq-0006Oa-B1
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuib-0000OT-96
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuiU-0000pQ-FR
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id g6so2876007wrs.11
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLRYtNzUYMGlG0RFqU3qAIH1hSNZ0dnsFsh4PVmqjUg=;
 b=er+yNEIb0bQrLtaZ1+LunVihmmkkocBTc7qSiq9MI5iLvtKDfTY3hW+zBIjyj6LUMx
 nwVfGm04Eyb/Z4pyu9CPCDKHasJxocG5gsfdhZFCujBopdXqtrHElnwvOtGL3VJkJo2d
 uh21JjTCb+1QB5AF71wz5EyW1CvIE9CeC4SK/EDXIedtI67EO+A+VzZoJXZFk1/D9l74
 4Nn+wPlXmVaqPVPQ+cHCMfmhbRRUzJr+W4Oxyfv3UXdbhkcaJPMHXr63t0CyIBDB2V6A
 l/DvpAs0FmHFBKeMeVQIwly7yLidaTJzmzUyvrCzUrpWPIhXcGrdktmq5imV5VHt7RfK
 WAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLRYtNzUYMGlG0RFqU3qAIH1hSNZ0dnsFsh4PVmqjUg=;
 b=oGFmBObLp/w+HEQAvr5O4otIIpqJlJnI8C2YQkQYV/HtoSG1LCOaVtbvjIROhtchgg
 YO4d3efhlk/irGnqTT+sSdXMuT2DMaPg0zJNs6Yw28Y3iHPp2g2THHg0iD4kb5YnTHX3
 RKjxWrxDVTJdpPL6DmDDjhY15CLGp/q7Wwf6DLeqoBI5e0PXA1Gjt86Lun3gBsXSbew4
 tRCRlTrwvX9MNk2xn5EXmfCCKG3d5/m6oQY7wimLkidGhH3vKnhtopo4an+YxvfIuJiD
 WjYfagYxQc7G2upBasFgz5xsZTDBisWrIkgu5ZLspu7zoCThYd/b+lLIMOE/kCAAsPZI
 8hjw==
X-Gm-Message-State: AOAM530+YswVdNf3XA2ZHNTPdq9Qx6tubaTvGExeqyNawAI1uP4O2xvR
 qRPWQJCy7tryhowldIoO9iJQEw==
X-Google-Smtp-Source: ABdhPJy6vgHJ0quvVGH42AUD3ICMtIV/2aw6DeRji6FdVcjLfF79GqN6f6BikgxRgzNXaY+FQkmP5g==
X-Received: by 2002:a5d:4ad0:: with SMTP id y16mr8774378wrs.399.1613221924947; 
 Sat, 13 Feb 2021 05:12:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t30sm11717555wra.56.2021.02.13.05.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:12:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 106D21FF9F;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 16/23] accel/tcg: actually cache our partial icount TB
Date: Sat, 13 Feb 2021 13:03:18 +0000
Message-Id: <20210213130325.14781-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
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
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-8-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-17-alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f2819eec7d..d24c1bdb74 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -730,16 +730,17 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
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
+        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
 }
-- 
2.20.1


