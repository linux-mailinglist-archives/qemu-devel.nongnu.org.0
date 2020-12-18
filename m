Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1422DE9CB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:34:07 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLVu-0007ym-D2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wwPdXwMKCkQyi2muumrk.iuswks0-jk1krtutmt0.uxm@flex--scw.bounces.google.com>)
 id 1kqLUF-0006jE-0z
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:23 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:49134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wwPdXwMKCkQyi2muumrk.iuswks0-jk1krtutmt0.uxm@flex--scw.bounces.google.com>)
 id 1kqLUD-0007ty-8q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:22 -0500
Received: by mail-qt1-x84a.google.com with SMTP id l7so2403872qth.15
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=mUF/I10tWDEHKh5BtkBg2/H9yhWwQ0Xr0kzGwGeVD8c=;
 b=PtZOWJQ+RybW6ZnJ4QHKX1lVtjbQF2Wf9hrLG0IhmxZQfP6Mr2C1UwdaY0wQLyh2D5
 KlhqU0D777C2GLwU1k2Mlipmu9FysrS6kcsAhag4H2PtNbSIADgbieq+CzdSSCc8GfaC
 nCr8BEC7JvgAjWE6LAGDVD7ljT7OX6Iye5qonuFTC56ZWIW5bxi71Z/AFjR4tUzNiT3Y
 mneRjf4Lyy93llO9Ja7Pie2RbA6x+K9IDuTRxxivwTMVOVXgOf1h94rlQqP2TnjU8N1J
 CJjAlEuhkToIurnCbguBLoUdLFmecwthMks7G4B8b5PgnYjKpjwct5uJh77mpPTC/W4D
 La4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mUF/I10tWDEHKh5BtkBg2/H9yhWwQ0Xr0kzGwGeVD8c=;
 b=gv5CDb7MCZvb4j+BQplMKwBingiN2AEToTe+yJThC8sYY7BQzb3EmPI+c7pBSVnZPx
 WJJp8QrrvTkjELpj4JkGR8ms/C0ikvSi+9CuM1klljW68byzCulnikbeRyvQ/E90u2We
 PepKusJrjD26UpErItOCBHFk1YNwqjmrF+46luR+of5G4/F4IcYXcKZtaEKBiNWl3i6Y
 Ch6zb9B6q73+YMb0gZHSGbvFi7Hkji4xRrB96mf/9ssvjyubf2VNJgcOgp605U4+Vs63
 lF+pwzFGFYXVbJ8jq5DAGguwIwHkVuBXQIZe2R3Qsb4/e8LzSdmKgUHmVY7n1My5crYu
 JXQg==
X-Gm-Message-State: AOAM531Tny5XsHZiGa8PEKeQ4aL8Yz6aiQpkBlRtYQ42vHFe9FPsFvHL
 nsz2ScdsogwnJXaMBveklsvY65+4afTWOruzOZnGX3ClG+G0+JLzeSiymaERBV3ScdrvAjQVy7i
 WQZdW2OlTHn/rn524KfozVdyxIY2+VCMMCoNG6oxJpq8BaS7rKAY2
X-Google-Smtp-Source: ABdhPJy/NPrmrCjWTFDlvtdRAgemLY0H/cRoWsxoOnF4bVFQwpotuiv4vYScFJk6Ks3ZIRZB/ukD05E=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:bec6:: with SMTP id
 f6mr6155475qvj.9.1608319939641; 
 Fri, 18 Dec 2020 11:32:19 -0800 (PST)
Date: Fri, 18 Dec 2020 11:32:10 -0800
In-Reply-To: <20201218193213.3566856-1-scw@google.com>
Message-Id: <20201218193213.3566856-2-scw@google.com>
Mime-Version: 1.0
References: <20201218193213.3566856-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 1/4] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3wwPdXwMKCkQyi2muumrk.iuswks0-jk1krtutmt0.uxm@flex--scw.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Shu-Chun Weng <scw@google.com>
From: Shu-Chun Weng via <qemu-devel@nongnu.org>

Also reorder blocks so that they are all in the same order everywhere.

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
v1 -> v2:
  Updated print_fcntl().

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/strace.c       | 39 ++++++++++++++++++++++++++++++++-------
 linux-user/syscall.c      | 10 ++++++++++
 linux-user/syscall_defs.h | 14 ++++++++------
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e00275fcb5..227812c07e 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2066,11 +2066,34 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
         break;
     case TARGET_F_SETLEASE:
         qemu_log("F_SETLEASE,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
         break;
     case TARGET_F_GETLEASE:
         qemu_log("F_GETLEASE");
         break;
+#ifdef F_DUPFD_CLOEXEC
+    case TARGET_F_DUPFD_CLOEXEC:
+        qemu_log("F_DUPFD_CLOEXEC,");
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+        break;
+#endif
+    case TARGET_F_NOTIFY:
+        qemu_log("F_NOTIFY,");
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+        break;
+#ifdef F_GETOWN_EX
+    case TARGET_F_GETOWN_EX:
+        qemu_log("F_GETOWN_EX,");
+        print_pointer(arg2, 1);
+        break;
+#endif
+#ifdef F_SETOWN_EX
+    case TARGET_F_SETOWN_EX:
+        qemu_log("F_SETOWN_EX,");
+        print_pointer(arg2, 1);
+        break;
+#endif
+#ifdef F_SETPIPE_SZ
     case TARGET_F_SETPIPE_SZ:
         qemu_log("F_SETPIPE_SZ,");
         print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
@@ -2078,14 +2101,16 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
     case TARGET_F_GETPIPE_SZ:
         qemu_log("F_GETPIPE_SZ");
         break;
-    case TARGET_F_DUPFD_CLOEXEC:
-        qemu_log("F_DUPFD_CLOEXEC,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+#endif
+#ifdef F_ADD_SEALS
+    case TARGET_F_ADD_SEALS:
+        qemu_log("F_ADD_SEALS,");
+        print_raw_param("0x"TARGET_ABI_FMT_lx, arg2, 1);
         break;
-    case TARGET_F_NOTIFY:
-        qemu_log("F_NOTIFY,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
+    case TARGET_F_GET_SEALS:
+        qemu_log("F_GET_SEALS");
         break;
+#endif
     default:
         print_raw_param(TARGET_ABI_FMT_ld, arg1, 0);
         print_pointer(arg2, 1);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7bf99beb18..be39cf8215 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6596,6 +6596,14 @@ static int target_to_host_fcntl_cmd(int cmd)
     case TARGET_F_GETPIPE_SZ:
         ret = F_GETPIPE_SZ;
         break;
+#endif
+#ifdef F_ADD_SEALS
+    case TARGET_F_ADD_SEALS:
+        ret = F_ADD_SEALS;
+        break;
+    case TARGET_F_GET_SEALS:
+        ret = F_GET_SEALS;
+        break;
 #endif
     default:
         ret = -TARGET_EINVAL;
@@ -6888,6 +6896,8 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
     case TARGET_F_GETLEASE:
     case TARGET_F_SETPIPE_SZ:
     case TARGET_F_GETPIPE_SZ:
+    case TARGET_F_ADD_SEALS:
+    case TARGET_F_GET_SEALS:
         ret = get_errno(safe_fcntl(fd, host_cmd, arg));
         break;
 
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index b934d0b606..1beaa71d37 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2376,12 +2376,14 @@ struct target_statfs64 {
 #endif
 
 #define TARGET_F_LINUX_SPECIFIC_BASE 1024
-#define TARGET_F_SETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 0)
-#define TARGET_F_GETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 1)
-#define TARGET_F_DUPFD_CLOEXEC (TARGET_F_LINUX_SPECIFIC_BASE + 6)
-#define TARGET_F_SETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 7)
-#define TARGET_F_GETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 8)
-#define TARGET_F_NOTIFY  (TARGET_F_LINUX_SPECIFIC_BASE+2)
+#define TARGET_F_SETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 0)
+#define TARGET_F_GETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 1)
+#define TARGET_F_DUPFD_CLOEXEC       (TARGET_F_LINUX_SPECIFIC_BASE + 6)
+#define TARGET_F_NOTIFY              (TARGET_F_LINUX_SPECIFIC_BASE + 2)
+#define TARGET_F_SETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 7)
+#define TARGET_F_GETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 8)
+#define TARGET_F_ADD_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 9)
+#define TARGET_F_GET_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 10)
 
 #include "target_fcntl.h"
 
-- 
2.29.2.684.gfbc64c5ab5-goog


