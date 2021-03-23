Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DD3465FA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:09:21 +0100 (CET)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkWu-0001Nc-Dr
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHV-00079d-KN
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:26 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHT-0002tc-1Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:25 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hq27so28248211ejc.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ux9gndpePTB7xFhEug2RxX0KYTVZW4sPDeYInZ3GRdc=;
 b=Ezq+FfpaZSe8ODVhh1msn9HFloS7zcQIqxP+mZE5VYH4fXsxu1/DvuA3qM6dAU6aEe
 ajF00Hpbz2Nn/Iqpy23ah+Zg1JR8cuOr9bh0A/89wDsfFJyUqoKy/zbHAqprKcbMggJ8
 UMrHQ1js/SPJXXvP15W0QcRpilkZdsvIXbBIHBu+Wl+hvKFDswlU+iGKHiJJZ6BOno3d
 uInIbuvGFcIINH38eeNlIaB7EksBPNJsCEFOYR2ULCtsfE9+v5zBJIEUY1CJuskl4ma4
 oXTM1Rup9sbdng1aS1Ytbsp9EcEEoFNYXYIVSLwEWAqmYnuFixFyvFjtXGAsowExG4We
 sJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ux9gndpePTB7xFhEug2RxX0KYTVZW4sPDeYInZ3GRdc=;
 b=ESUmfvBvEevZ3yAVyZknqxC2g1iyupkbFUb0Q5fy1bbI/KEtnuP+8F9tVzBUSNMk/J
 atK5qeKtxG6QJGTzgWRf/lGlAFUYDXXO7w2cNIPpyE0zPZrli55ZVCJ4coiRWZlQwjfR
 eU+2QEC9GHPSAxb6WvdBYE418EbqJL3LSpkvriJ4FP7YDaY+F+BffAw7BYhSk2+k1hUc
 nH9arnLsXVF1liBpvtd7jMGHeALOthHAhpejuGQG7AbKXDI7tNBRv40xBlRwXnGn3IDT
 NS2OwIFDZ6vKrNZOO+HXv+0XhStBOMOfM0UqyrVftMHu2hChKJURBcaMkxHgFYJWFrWD
 F5cw==
X-Gm-Message-State: AOAM5304noICfh9lmN2JLrUsBe9kE1FyAVQOAlE0MvMvniJQHVx5sMlR
 VjwQ8Qy2KO8kgi+BsVGXa80uJdQeyqPDN5jg
X-Google-Smtp-Source: ABdhPJzNNiOdRkL8D3ppyGS7M96e4Q3E0z2dOqhiy+7fBvw4icHxRaxw23M22qqwbyPgfciffvvHbw==
X-Received: by 2002:a17:906:814b:: with SMTP id
 z11mr5789546ejw.290.1616518401853; 
 Tue, 23 Mar 2021 09:53:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a26sm13936406edm.15.2021.03.23.09.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11E2E1FF96;
 Tue, 23 Mar 2021 16:53:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/22] linux-user/riscv: initialise the TaskState
 heap/stack info
Date: Tue, 23 Mar 2021 16:52:54 +0000
Message-Id: <20210323165308.15244-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210312102029.17017-5-alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-9-alex.bennee@linaro.org>
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


