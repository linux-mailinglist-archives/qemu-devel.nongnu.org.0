Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF648829E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:51:18 +0100 (CET)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66gS-0007S6-Sy
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IQ-0005Hs-Vo
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:56 -0500
Received: from [2607:f8b0:4864:20::d31] (port=42727
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IL-0003Js-FX
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:48 -0500
Received: by mail-io1-xd31.google.com with SMTP id o7so10063314ioo.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zybZPjB8nKU1WribOLJ/TrFoY2QK+pom/GELtkI+EXk=;
 b=MIKQBWRAOLTcjTYsIGUsn6z0jZpSiei9pliaseQhXcYhQHcfJT5C2LbHbGQYwnbgVL
 58LfzwT+UTLshI9JDiJUDFdIr/wbYqOZ3rsxF0ZAVCXXCGWT7dTUuT0CAJxLtqGDhyge
 SoUKWA7a3autQPq0TRWXsb9BvUTeoX55nBYAi8R01o5vtE3l80lPs1Yq1dq5tH0bjiQB
 odOzXPjfm1IO5ZnCJXlxnrJ3sggH/zYqBwOQX4yyK4RL132iuLAVRg60qq28Ifp6kUEJ
 C3X0CHIyNTwZBrSyScy1OWnDsE++wyjdWm8cLXIparjs57dBQmbPzcf1r5i7k5upOYay
 SKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zybZPjB8nKU1WribOLJ/TrFoY2QK+pom/GELtkI+EXk=;
 b=Iq6DOvicAG1vIW+I55pRObr0ryXZFLQY8vC3YWsFsZ+DtixVkGGZlFnMUnwtlwQvQ3
 Jz2YY3QWATQJ+je1ngsJRfsjPCf1GsmadntmuMwSrbRAqW4bRofjDUWauOjNwBVzxYpd
 N/E2zZ9d235XGZT5egcY7T35gncr2Jv7u3iJM2NAsYDpydBYeVpBWAKaeE1B14dvcyUf
 xlAMTnrZaKZWipOvo9Yt73VfqABhylMfBTCaHDmDaoJeJAtYipIIJCtIdCK6IA6Ysj8D
 EcudPsN0OMqT6S6EnLQLGz6WLoxa4Y6pDCtPNcyKHrWyKqzXq5rSZbXSdGuKw/Rql+u8
 XdXg==
X-Gm-Message-State: AOAM533zn/AnEXNfGAGTOUaQRTjjXf3K72+x4Tye40EpSkACtRYkaAEr
 0+50NDId+9VuogEsy243fSBQrR0/SLCsfRJR
X-Google-Smtp-Source: ABdhPJwAuZ+H+KGwkPwod1D1275UtD34caBoTTLl0SD02m5azU0xSZl9ppSgthKRGeb8rkVwfMniRw==
X-Received: by 2002:a05:6602:13c4:: with SMTP id
 o4mr32584418iov.152.1641627463714; 
 Fri, 07 Jan 2022 23:37:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/37] bsd-user/mips*: Remove mips support
Date: Sat,  8 Jan 2022 00:37:01 -0700
Message-Id: <20220108073737.5959-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD is dropping support for mips starting with FreeBSD 14. mips
support has been removed from the bsd-user fork because updating it for
new signal requirements will take too much time. Remove it here since it
is a distraction.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
 bsd-user/mips/target_syscall.h        | 52 --------------------
 bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
 bsd-user/mips64/target_syscall.h      | 53 --------------------
 4 files changed, 243 deletions(-)
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h

diff --git a/bsd-user/mips/target_arch_sysarch.h b/bsd-user/mips/target_arch_sysarch.h
deleted file mode 100644
index 6da803a408e..00000000000
--- a/bsd-user/mips/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips/target_syscall.h b/bsd-user/mips/target_syscall.h
deleted file mode 100644
index aacc6ddf9fc..00000000000
--- a/bsd-user/mips/target_syscall.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *  mips system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS_SYSCALL_H_
-#define _MIPS_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips"
-#else
-#define UNAME_MACHINE "mipsel"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH   UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS_SYSCALL_H_ */
diff --git a/bsd-user/mips64/target_arch_sysarch.h b/bsd-user/mips64/target_arch_sysarch.h
deleted file mode 100644
index e6f9c00d5f6..00000000000
--- a/bsd-user/mips64/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips64 sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips64/target_syscall.h b/bsd-user/mips64/target_syscall.h
deleted file mode 100644
index bf4c598b136..00000000000
--- a/bsd-user/mips64/target_syscall.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- *  mips64 system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS64_SYSCALL_H_
-#define _MIPS64_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips64"
-#else
-#define UNAME_MACHINE "mips64el"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH  UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS64_SYSCALL_H_ */
-- 
2.33.1


