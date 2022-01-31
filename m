Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089194A5080
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:50:06 +0100 (CET)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdcj-0002a3-52
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:50:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnk-00053r-1g
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::134] (port=37392
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002cS-Ov
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:23 -0500
Received: by mail-il1-x134.google.com with SMTP id z4so12420254ilz.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIwWr4XQkvp7rEwjOGXmWZZadDj8kG6ZitoG4k00onk=;
 b=FOphxRvuBD4S0RNhmNtnhkO3QkRgy4HOtkoHcLsYsoqhQXdJaWS0cShK6dVqdVdxE7
 IYlfOpwSRd8ZNfBAwt76apHO96kGPR4NGueBHm7JorHVzsr2604hf7mmwEeZpdXythqu
 e2GhhpGRWGpsUUoIo8zpFkJi1szWVdk2zSwfncLN/7HQI60+Azic/dMJ1RpZoXrp+iyZ
 8LaloBi2xauR48de3CRKJUTo+C79/MuIv/+QKeCrZaQaymViTc9nJOTNTdxm6o4S8s1Y
 0Hqup/gsF1y2sT27MmSXHzpH8Rux/rv9hAVamUuOdDQwfuZKe3LvSf12WyznYjRE6Z9h
 6Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIwWr4XQkvp7rEwjOGXmWZZadDj8kG6ZitoG4k00onk=;
 b=CCW81W/t6/dGNy2ionU50hoXTsK3duOP4a21vUJT2yKQ1ppuIlXhudA2bsO7t4N1/e
 wjHfsRiFHldz+G1U0thhYlpYikr8gn2v3yALcEHs9CFMLN2al5cjfg2qjLCD5TMubLvL
 cfLw3qMK//mEC0Mwwx2fdK1FVxY4scXcs/QKWq44q/0StJ/bsyWkYQu6++wYJLgYz+PS
 QiuDeHphVoNGTzDqYjppEhnsckWSOYvrEjcNTImUfZdeXDBatigh2BC0kV1K8/EfVmc7
 T8c9pnufxVIGx6Goo5Iq55zw4xXUC4pahETW6gGG05TkZuU9/WnLt/aSGt132lq8XJnz
 nzew==
X-Gm-Message-State: AOAM530co6oSb+3YzwskrYdvTsczZ8aUyFqpKqdB/Kqh5tnnCESYVMcK
 AV0ti1G0T+iyy1OXL/VfG7I55rbtUcFAUQ==
X-Google-Smtp-Source: ABdhPJz94Iw1AG4kbvBNH/LyUtaiW3nzlKU//Q/OLqGtqz2VD9wBgAbJWDUrCrLNrJ1ZDzWt2IudIA==
X-Received: by 2002:a05:6e02:1d08:: with SMTP id
 i8mr13132561ila.121.1643658999099; 
 Mon, 31 Jan 2022 11:56:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/40] bsd-user/signal-common.h: Move signal functions
 prototypes to here
Date: Mon, 31 Jan 2022 12:56:05 -0700
Message-Id: <20220131195636.31991-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h    | 1 +
 bsd-user/i386/target_arch_cpu.h   | 1 +
 bsd-user/qemu.h                   | 8 --------
 bsd-user/signal-common.h          | 6 ++++++
 bsd-user/x86_64/target_arch_cpu.h | 1 +
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c526fc73502..b7f728fd667 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -21,6 +21,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "any"
 
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index b28602adbbd..472a96689fc 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -20,6 +20,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 671b26f00cc..99c37fc9942 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -199,14 +199,6 @@ print_openbsd_syscall(int num,
 void print_openbsd_syscall_ret(int num, abi_long ret);
 extern int do_strace;
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 6207417d39e..f9a9d1e01aa 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -9,6 +9,12 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+void process_pending_signals(CPUArchState *env);
+void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
+void signal_init(void);
 
 #endif
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5172b230f09..14def48adb5 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -20,6 +20,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-- 
2.33.1


