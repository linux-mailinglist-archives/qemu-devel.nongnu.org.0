Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35B3B3BE1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 07:00:08 +0200 (CEST)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwdwl-0001M6-6p
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 01:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwduE-0006Lj-EB
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:30 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lwduB-0002Bu-Jb
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:57:30 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so8081213oth.9
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 21:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRGgK+8gsAvxrhOSu8DT3+UE2/pwzl1fU8P2Xkyd9YE=;
 b=NE9nIolsiU1Z6XiwXkii5dgLoHN/8ctnl1Aq4dkoZTn5SoNv7y5nLndQPqCOYMFkAW
 cHoWqt5n7iIs+6oxKl0dIKYN53PrTTU9R95zkpXgyRyFUakkZaaVoiwOaGTyv/8vZzKq
 PYOvLwVOdtDq4d6RG9RgtZXxqLCt4jju0CicxqI83TRvlUycuDKOZb9U5QLfWVYpfYKE
 mY2tA+nKXw3AqV+A3zJvlohZFngqved1j6fjCnNmmJxYwahUoz81KHJ7Thr+GHZO6OYt
 DdhEFeHgEYwe5/3qN4yLb/pIk4/wKKfI+H7T+zAeye79UtrJa+LNW4xEnCt+YFG88TsW
 B+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRGgK+8gsAvxrhOSu8DT3+UE2/pwzl1fU8P2Xkyd9YE=;
 b=XwLrTPI4p/SHgCdwtIIvki1hPg1FtxgG/JrXBJ6mLCXcTyDHcIGU2U0aHB/VFy21s6
 fVUmg3W5ExLGGtvtcZchifgQJeAIpr16J5+XnxxQlC4ZwqFjBoDyR2Y/x51dierPb/Q1
 P125zuofH4Buq3I3hXSQ4Pxmby/TvkDJoZ58ZhBote/CQlsgOV1JcpQKFxsNlC9BRsR9
 +xEmBH2q6WTUikPjOGLvv0sE0lV6BtgjZwR1fftHm3yM+MGPikqeuzvNMjLr0Ps9gBcq
 yKtc+2bAwAXlzXS1JH/rvC9fa8As+bashATsYVSl/JYzkdnTZoOd2Cwhk6gLSkdXIBjL
 l8Pw==
X-Gm-Message-State: AOAM533YSeEbjAVsq14F6YUx1oT4VovZd2b2gV6ow8i55111JzrYZy1F
 R3eSx01MX7NqAi+zwCyCWab09y5kMmY9CY2D
X-Google-Smtp-Source: ABdhPJzo0OUmSjyHAsiS3zNhEQin5Ke7Zj//oM4pdAx/tbac7CWH3jKm7m/D6Sj38W2coHC5JxNYVg==
X-Received: by 2002:a9d:d09:: with SMTP id 9mr7757562oti.16.1624597046284;
 Thu, 24 Jun 2021 21:57:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p10sm1243157otf.45.2021.06.24.21.57.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Jun 2021 21:57:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] tcg: Use correct trap number for page faults on *BSD
 systems
Date: Thu, 24 Jun 2021 22:57:07 -0600
Message-Id: <20210625045707.84534-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210625045707.84534-1-imp@bsdimp.com>
References: <20210625045707.84534-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::332;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x332.google.com
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org,
 Mark Johnston <markj@FreeBSD.org>, pbonzini@redhat.com,
 Juergen Lock <nox@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
used by Linux and represents the intel hardware trap vector. The BSD kernels,
however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
handlers. This is true for i386 and x86_64, though the name of the trap hanlder
can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it instead to
avoid uglier ifdefs.

Signed-off-by: Mark Johnston <markj@FreeBSD.org>
Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[ Rework to avoid ifdefs and expand it to i386 ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 accel/tcg/user-exec.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fb2d43e6a9..e2d0165670 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -254,28 +254,35 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 
 #if defined(__NetBSD__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define EIP_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_eip))
 #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__OpenBSD__)
+#include <machine/trap.h>
 #define EIP_sig(context)     ((context)->sc_eip)
 #define TRAP_sig(context)    ((context)->sc_trapno)
 #define ERROR_sig(context)   ((context)->sc_err)
 #define MASK_sig(context)    ((context)->sc_mask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #else
 #define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -301,34 +308,42 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = EIP_sig(uc);
     trapno = TRAP_sig(uc);
     return handle_cpu_signal(pc, info,
-                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             trapno == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
 #elif defined(__x86_64__)
 
 #ifdef __NetBSD__
+#include <machine/trap.h>
 #define PC_sig(context)       _UC_MACHINE_PC(context)
 #define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__OpenBSD__)
+#include <machine/trap.h>
 #define PC_sig(context)       ((context)->sc_rip)
 #define TRAP_sig(context)     ((context)->sc_trapno)
 #define ERROR_sig(context)    ((context)->sc_err)
 #define MASK_sig(context)     ((context)->sc_mask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define PC_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_rip))
 #define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #else
 #define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
 #define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -346,7 +361,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.22.1


