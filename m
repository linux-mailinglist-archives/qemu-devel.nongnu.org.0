Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A0467AC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:41:41 +0200 (CEST)
Received: from localhost ([::1]:54202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbr8u-0008I0-Ud
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39289)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbqJb-0004XN-Tz
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbqJZ-0003YI-Lb
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:48:39 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbqJX-0003SF-Lg
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:48:35 -0400
Received: by mail-wr1-x444.google.com with SMTP id n4so3439356wrs.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y/GuCM+htQJxVNj9wpaJsriigpxg4M/lN2SgW++LMIQ=;
 b=KIf3qLrdzY/ShAkF8aEn6dNzEELD95uK7Z4JDC2i7SMHzuSLvNu5YNHJQ49bhW9Snb
 2S3h0qv6Oarp/pkE981+oH2t67GBS1qDhOQBkMRKS3Kfr/jO9vN2B86PhNt87nIEl+U8
 srz45+qEY063XcJrIjsQSWilYFlyqcnxjQAjTKBst5z2wm+upUc/wIrpuHKt2HhKnWeN
 uEAz6uuQm6f2+wR8dANFVPf/n7UELr87MbJ78H9lrzI1BTCA62dX8NUJ5Lps5IKiL972
 4XGT8sY5zJd4dMHAibwOB7TqhEdXF66wrFvMP8yJvt+CiWU6gIgjAHS0tZB0AP0P2ygg
 ONSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/GuCM+htQJxVNj9wpaJsriigpxg4M/lN2SgW++LMIQ=;
 b=bEDBL5mj1vO6Jw+OJBuEUnBxuYbw6hOeS8mR3M9dsckTCWn2nG/Fhr1cmYEjqt8oqk
 wCKp74DhhAoCvtfKs8ty0zwyLab9xJVMzX5wTrDkLkpUAkbgIyVcf2slBDBhr7ixqKeO
 r5SkT5dBQeDDW3LbowXZZuPGLwOvYxBNRoZ0DPE/FiKFtqXEZ0dawTAPr++B0M29FPOj
 uC6NptFJ+72KZBhWlwKklMCETI27RuXe/OXdIhlkxMBtzSs1lK9rMS/GsdGHFxcLz4Gt
 L4BnmFxM/yfs4pwEoUeyYF3jHnDoiiJPzBXOjUUeKi5cliRu7dvvzEH5Q1dvhFgzY7Kz
 DoXg==
X-Gm-Message-State: APjAAAX7baljET1DRlA1FSHVwvKNIHIva9SLB1p5n9nTvqq/GMQeRmz0
 q7IpsPBWXH34S3dXQ/Y4ofKHWQ==
X-Google-Smtp-Source: APXvYqxVUf6JvHOanL8dF2IVjKwd1oGeV3pXYF+V2mgjUB/SYLQakIn++C4cuZoumvcJchN68wNaiQ==
X-Received: by 2002:adf:f951:: with SMTP id q17mr37939614wrr.173.1560534509447; 
 Fri, 14 Jun 2019 10:48:29 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id l12sm9601398wrb.81.2019.06.14.10.48.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:48:27 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 807721FFAA;
 Fri, 14 Jun 2019 18:12:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:32 +0100
Message-Id: <20190614171200.21078-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH  v3 22/50] *-user: plugin syscalls
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
Cc: Riku Voipio <riku.voipio@iki.fi>, "Emilio G. Cota" <cota@braap.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 bsd-user/syscall.c   | 9 +++++++++
 linux-user/syscall.c | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 84a983a9a1..50e47d217c 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -323,6 +323,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     gemu_log("freebsd syscall %d\n", num);
 #endif
     trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+    qemu_plugin_vcpu_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
+                             arg8);
     if(do_strace)
         print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
@@ -404,6 +406,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     if (do_strace)
         print_freebsd_syscall_ret(num, ret);
     trace_guest_user_syscall_ret(cpu, num, ret);
+    qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
     return ret;
  efault:
     ret = -TARGET_EFAULT;
@@ -422,6 +425,8 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
     gemu_log("netbsd syscall %d\n", num);
 #endif
     trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
+    qemu_plugin_vcpu_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0,
+                             0);
     if(do_strace)
         print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
@@ -480,6 +485,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
     if (do_strace)
         print_netbsd_syscall_ret(num, ret);
     trace_guest_user_syscall_ret(cpu, num, ret);
+    qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
     return ret;
  efault:
     ret = -TARGET_EFAULT;
@@ -498,6 +504,8 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
     gemu_log("openbsd syscall %d\n", num);
 #endif
     trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
+    qemu_plugin_vcpu_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0,
+                             0);
     if(do_strace)
         print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
@@ -556,6 +564,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
     if (do_strace)
         print_openbsd_syscall_ret(num, ret);
     trace_guest_user_syscall_ret(cpu, num, ret);
+    qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
     return ret;
  efault:
     ret = -TARGET_EFAULT;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b187c1281d..7f3cfdee84 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11724,6 +11724,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 
     trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4,
                              arg5, arg6, arg7, arg8);
+    qemu_plugin_vcpu_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
+                             arg8);
 
     if (unlikely(do_strace)) {
         print_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
@@ -11736,5 +11738,6 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
     }
 
     trace_guest_user_syscall_ret(cpu, num, ret);
+    qemu_plugin_vcpu_syscall_ret(cpu, num, ret);
     return ret;
 }
-- 
2.20.1


