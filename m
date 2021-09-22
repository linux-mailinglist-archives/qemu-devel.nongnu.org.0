Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3D4141A9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:24:29 +0200 (CEST)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvgC-0005Fo-Iu
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWr-0001KX-Br
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:49 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWn-0007T1-C7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:49 -0400
Received: by mail-io1-xd32.google.com with SMTP id b10so1920123ioq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MC3awmL5TaW0wcLRlKah2nBls+h6DuoytKG/ajQlDzU=;
 b=SEIkpoQoTZ7lkK4RPEz0u5mCTDSK36Wrad2KX/4tPkHNH7J0Y7wFR5b/EJKP/fib20
 rQJAxJ/Cy8SetDQoqOvSnlgoN6FWl0IFHDgw07qkUXn1PmIVFROrurN59atLYx0qvJvF
 lD7i43ThDSE+CQcc4N/bShkCu2nOTGr5X8FopjrvD9Qz9EIG1hybQrgs7p9IVdPBjFLc
 bXa7ah59Rz2SIHhhLy8yp1YUpLMe0YtFNRcEvh2I7FI5gDD+Znw0q/5Y2a3tTQhogL+2
 vb0WrYp6RqlYial9YA152ja3bDp3fL4pt3LuvwATnPfMpl/JlJz6Hbz4sfRTzmxE3eou
 8DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MC3awmL5TaW0wcLRlKah2nBls+h6DuoytKG/ajQlDzU=;
 b=V00KIyMq+UsMZOjUDPMsy7uVKUO84Ha0evXw8bvZCJefp6ed/TKqALpqrUgeGLDBtU
 1W/ooln+ZsA9oHMDuAhniXsXuRRS6X0kOgVNXf5kg4FhzBEVK3T/b1O6s4ofm8PaG/WM
 jm4i0oYe2CW6X536BUhNy81mOJzPrxzY1hhT9gl81ssqyL5kkb0xdb8KS8xfvLuN0uOR
 jZ278TDFI9pugdrL3Zzv069PKefveBsnjCpeflvsOfp8A9ht0f4XdKSsnWn05r/9K2DP
 alLz06TLQ5R8gLPcVisaHuc6h9ZhopB78q6PqY3cVgzU1FEk5+pD4pHP2ZYxFlG8PMFr
 W04Q==
X-Gm-Message-State: AOAM533mHv5RAH+yb4iRxXgi5YYR3dbWpZN+oRlT4jMAKgcD+4rQm4GU
 Sh0ehV3R7hMdVn0rueLbycn5hhsXLziuvF3dYHo=
X-Google-Smtp-Source: ABdhPJxGZm7R5x8J8xQM6Jk4AOUb4lUwLO9Gpj6KZJyJIR/p5WnK40weUriY+YIHT//Xftqz0MGfJA==
X-Received: by 2002:a5d:8185:: with SMTP id u5mr3077158ion.173.1632291283995; 
 Tue, 21 Sep 2021 23:14:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] bsd-user: TARGET_RESET define is unused, remove it
Date: Wed, 22 Sep 2021 00:14:27 -0600
Message-Id: <20210922061438.27645-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_cpu.h   | 2 --
 bsd-user/x86_64/target_arch_cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 978e8066af..b28602adbb 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5f5ee602f9..5172b230f0 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
-- 
2.32.0


