Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A332BC68
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:59:35 +0100 (CET)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZWo-0004rk-EB
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMO-0005Vo-RY; Wed, 03 Mar 2021 16:48:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMN-0002U1-C4; Wed, 03 Mar 2021 16:48:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id d15so10139085wrv.5;
 Wed, 03 Mar 2021 13:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwRUo7hC4h9vgJMC9crYDnluKvk2tzZcvKCkSEg/uSc=;
 b=VGl8wx3paFjSVhst0xwZVNTJfVvVPedOVkbRO5IhEaTM4nkJ/u9cZtz2AN+I70neKU
 lVME3Kx+VPZ9mGv50Y+tBC4C5r4qNzzhoaQFGcodwEeAldpOMcMbfrP5gUyJu4h9u6aN
 xicgkHdiuYUG6j3WSFVJtK+N+xCh20qXDBLgTlznxNLwp60/InFosxGANfxgjR6pzOdF
 Gl4lwdzUO9LhZ2w9HjlXhA4vSGyxRmaA8QGgL9Ir/qNWTlLSFo9NJWLWol/XdORkK22a
 3oy8CU9AXspmg3aHVsQuriCMzeWA4ha9tKBEqTdB+ZxlH2qPdm9Kk3IlaMjbvjrdLg73
 ZKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UwRUo7hC4h9vgJMC9crYDnluKvk2tzZcvKCkSEg/uSc=;
 b=aO/RtSVuldG9pBcLWkqEJipbDZgzDvV/wC0kQ3jW2VP+9MrCq5FOe73o8yZFcvWZCP
 jNTF4qRJS59enoJ2VTo848jdVTauMBMMuCnGugRsW2FkDvoD6BxozpQIJ5cg4saN/G6R
 SyhvvJT+UM2jTaibopbWtSwJc2xZUnG6xEdSBKNZbD1fwVE/UWcYFDNJpUYKn5JlXWeA
 OVMSiQh7Yl4XjkASzdXDDA5gunX+b5++zKGVo2aNlbZpz918eWtVA/OJVOC2bFs8wNtf
 WaKTO1Mf6M0LLMdqyc+n881vsSiZ6mlYGRlGyA/VML47jQ28AsRZItbAKD+PT6ahZNfi
 +SXw==
X-Gm-Message-State: AOAM5338DuseGLC4a1go1iJORNTHWF/ivVFAVd7/yQmimEnN4EOnvDuJ
 9YApTv3o73JXIiQ8ZySYH0nh6YXRYSo=
X-Google-Smtp-Source: ABdhPJxlz6DIchAGvKj7W4FAU5GQPu71/RTvZT2TVu4N9FvUNDg2Ns2Csov7QXRiPjgQP7q5Xx0Sjg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr671741wrn.255.1614808124862; 
 Wed, 03 Mar 2021 13:48:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s3sm14468228wrt.93.2021.03.03.13.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/28] linux-user: Remove dead code
Date: Wed,  3 Mar 2021 22:46:57 +0100
Message-Id: <20210303214708.1727801-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. This code is expanded as empty stub in "hw/core/cpu.h"
anyway, so we can drop it.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed..d7af3ffbc22 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
-    }
 
     return new_env;
 }
-- 
2.26.2


