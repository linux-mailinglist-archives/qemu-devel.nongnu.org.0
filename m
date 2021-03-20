Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78123342D24
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:45:46 +0100 (CET)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbvF-0002gQ-Gi
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn5-00032X-B0
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn3-0004Fo-QF
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:19 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h13so14028062eds.5
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOTtqQ1GqfCDk2mShrLCLuCwUnyYqPWN4bH2H+UmRI8=;
 b=d6aEufXYSJved5N2un3csV6hO7nw6dV7AH6C5EsjQil81UStphfQfJY4gQ86HYO87J
 qnB4XmhBD+vVFGC4si866ae8tuqh6Xs0MoZVrwB+HTi+XRN4vIhGQLOoNri5uLSdASJ4
 P2KphUGWsg9uWIe5EFJ8A/KZEcDCwJz8CPoxIn/tb4L5vOXC24l4o1qvTDL3DdBmcSZc
 UVnUr7EV/gBxGRgRaVHFOfnW1AYJv+p2VgIpWCsQA6eiD3+FGq4En2yKwKloozotH2j8
 me6Edv6htK6kyScGym8jcmDaOvBrfoFgfMIWI5V6BIcdd9SqMf+RU8VIJuglwbQwYf9o
 jXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOTtqQ1GqfCDk2mShrLCLuCwUnyYqPWN4bH2H+UmRI8=;
 b=ZNHEzM+Vwlrfsd86lo7233vcG1tSDaIfJSqk7bA8AF8wCYvJ8vMqxBd2yaWff5YQqX
 Y7KlaryXxoPoC9/16O1wYff2RuMqaPJVI8oE+TPeCR//yrNxsWQO3DsNswT8r+ZgLVHi
 rYIL5DrvzB55XeJKX4F53FHZ1Q84NvF4uZbZ43J6o5Ql1pwnVjOE+plJA6M6sLXNNc8a
 epzSYRip+lp3II7FyGPzVyq3NN117ZV/8/OZSyyQLjR/QO2vfszjU9AlfHWyG1scfSca
 bw/0RJD5WUBYb6PnHpuVkaJTdAEBPTHz3pHRxuNeaVajgotP2/AIOoP7/Si8j/5HpKZt
 RK+Q==
X-Gm-Message-State: AOAM533qr8TDL0U7V+/qhtVohVHxNG+p/O5I18i3F50SjNxqZUc9blxk
 NEisqro5atOHx1dpVIMLvPdcZA==
X-Google-Smtp-Source: ABdhPJxt29BP8t5HbS4l1O0iZHbkQuXrDClFGYTwR0duK0TMe7/+NixB7qhv2aMD9JRSk+xz9Wq3mw==
X-Received: by 2002:a05:6402:614:: with SMTP id
 n20mr15344467edv.58.1616247436513; 
 Sat, 20 Mar 2021 06:37:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id oy8sm5346287ejb.58.2021.03.20.06.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80D0F1FF96;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/14] linux-user/riscv: initialise the TaskState
 heap/stack info
Date: Sat, 20 Mar 2021 13:37:00 +0000
Message-Id: <20210320133706.21475-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arguably the target_cpu_copy_regs function for each architecture is
misnamed as a number of the architectures also take the opportunity to
fill out the TaskState structure. This could arguably be factored out
into common code but that would require a wider audit of the
architectures. For now just replicate for riscv so we can correctly
report semihosting information for SYS_HEAPINFO.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312102029.17017-5-alex.bennee@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 6767f941e8..74a9628dc9 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -135,4 +135,9 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
         exit(EXIT_FAILURE);
     }
+
+    ts->stack_base = info->start_stack;
+    ts->heap_base = info->brk;
+    /* This will be filled in on the first SYS_HEAPINFO call.  */
+    ts->heap_limit = 0;
 }
-- 
2.20.1


