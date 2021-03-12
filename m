Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630FF338A71
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:43:28 +0100 (CET)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfGR-0001y1-8D
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuY-0000IC-Gm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:50 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuR-0005Hk-Us
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:50 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r17so52296850ejy.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFsaVWTC97aLR//LGQcQaZjZ1M1CfqA4RZVl1EZCMSk=;
 b=AED4BGQeXcQJTIpKYLHzdqiY9MkCONC/WW97F5pi9+KSmCESx6DbrPepzxNKSjAQxz
 1D84rguFVvhzuOxs+uo8cYf5QP2+qZuaBBZd8Y5x0vNN3Z09hMn7MftkMIYLL9+tmCvw
 asS5kXhb9zcfQ2PmKbGkzTg70J4UAT0bBYqrGu0shBMWin74ZOXFCedo+4R+6HJfQeMv
 4ArcASEdJ6XhQiZfk0McK882iywLcq4jSWIYbcY2eHDR1SXWpWR5W44jWsu8r73zE3vC
 ByBj8FFOZ8SmgecQac6+651h1xOAe9Y9tWMPTAku0/QIjSD74Wlo3zXyI6kWbYJylbvf
 k7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFsaVWTC97aLR//LGQcQaZjZ1M1CfqA4RZVl1EZCMSk=;
 b=fgKT0GtE4ItScJN7v0MYLv2/Zv5yF/M0WXj4QYuzb8+HLd3eWM5bYTJ3EfbU+gwQCz
 y8Y4/1DGbkYwOQ0B0u1N3q1lRJdg6fRat10+JWfEwwNwvOHSMZJ8bpifb2RUkGUWy4qD
 TcZ3p+QFzhSvbaAQPZi5z+3zoFCgK4oiQjakVDGdCotxSYl4f24NitDkQ0sqNZVDOsLc
 PRXuCBXGbW4M72kwdBBv9UDZMxPhdA7wNbVKtDhHyItnu25CzCquIyv916Xn+EFIruBb
 upddIX78hGRN5WkC3vgcBZc5uQOPWv2clwuj4+FA140XOo4bJMeD/BB6HEOcqqxddbvg
 l/YA==
X-Gm-Message-State: AOAM5312J1zr7CxogdgA3OA8mHEn4s04jAFF0oHzZKFCB5FMbscdVZO6
 zcA1rD/Wpn62fVDWvZEKW8kNCw==
X-Google-Smtp-Source: ABdhPJwL3XO8S+QWMLrCm28Y1ol7WHmuehkctYEF5v5aHqfXYKIzJCflQQden7dFzWp8PFep12AVMg==
X-Received: by 2002:a17:907:20c7:: with SMTP id
 qq7mr7529899ejb.528.1615544437474; 
 Fri, 12 Mar 2021 02:20:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm2599440ejf.30.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 120661FF90;
 Fri, 12 Mar 2021 10:20:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/5] linux-user/riscv: initialise the TaskState heap/stack
 info
Date: Fri, 12 Mar 2021 10:20:28 +0000
Message-Id: <20210312102029.17017-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, keithp@keithp.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arguably the target_cpu_copy_regs function for each architecture is
misnamed as a number of the architectures also take the opportunity to
fill out the TaskState structure. This could arguably be factored out
into common code but that would require a wider audit of the
architectures. For now just replicate for riscv so we can correctly
report semihosting information for SYS_HEAPINFO.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


