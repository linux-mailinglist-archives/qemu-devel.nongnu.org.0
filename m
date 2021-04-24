Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C552136A228
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:38:01 +0200 (CEST)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLI8-0007Va-SY
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKil-0005wL-V7
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:27 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiO-0004Ln-P0
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:27 -0400
Received: by mail-io1-xd2f.google.com with SMTP id g125so3395578iof.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGhuygBexU6sDyrgbBDXbEgL9owYCnZh70/eHV+xwYk=;
 b=Tv+nvPoyyptTH6QTahYmGYMu6TJ4EjFIx60HwIRagdYyAaDpoNtC7zIkYwKpOoyra9
 jE8ydzl1TggEizQcsBoyQu8RzZk0xyEbpkcAyBsPFsXlm5iZ/tvBNTKg9s6Xt8tGtZUv
 NwH9GXN6nUhtobdfXTDmUASIdSrWyKE7099CTNW0rohg6SMagIAsCDsZSpFjE9M6kUmW
 O21cDuS6v+jYtq8Ul5KaOJYtiCx5KHJtglSbj700pfKDn4XNPCjrskn1eBHi80G6vMcm
 +ppxDW+qXspHDawFjVg7PJ6s8KzQWa/vJ62vrEwY1Buy5Gn0Kld7QEa3fuyh5NK+k7EJ
 6I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGhuygBexU6sDyrgbBDXbEgL9owYCnZh70/eHV+xwYk=;
 b=blIWq/KmXY/Y0U8Iev3osOg5URYureA/HgoMc2jLcS47laVOnNd+Zhar6oA59k6KFA
 coXno9QaK64USKYuUsPRyk59Bs3ILvOAJnXgLmoj3oP6vvK2nCEU/qiNzA95rdH9ZUa7
 M6etttjzBdWLjqGMugo+5/yDRUq3Jet9f5tBLsIQkIFJGWN2kusjfyBf1Kj93t/u638U
 0ZaA6SCjdbAJF+MtR4kY0NdoFVefBZQFdcFzjf3fL2nQoAQLUTdlzcPhFCuLik2xN9oH
 FOiBSNZdQEM4rsk+u3EOv/PbSTvaxMNAkv2Qp9+cIRwXbNnaqYXdTWLRhkvk7rQ6UNnm
 IpCg==
X-Gm-Message-State: AOAM532sNS7hoCjyn2eNseiIzEDDwSkOLd6vYDwGUg9ZyQvqZZfKJQCy
 u3Nc/1SFDuB47tRvHlNBfZ4gYVc0VKptyhFD
X-Google-Smtp-Source: ABdhPJzGbw8cvneBiQkxvLiyqYNp9e2ha7dSk4gWYXKaBxI7CqpRKc76kdOorD/XrZreLh5EpKucQA==
X-Received: by 2002:a05:6638:3293:: with SMTP id
 f19mr8616995jav.0.1619280062522; 
 Sat, 24 Apr 2021 09:01:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:02 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/48] bsd-user: style tweak: fold long lines
Date: Sat, 24 Apr 2021 10:00:11 -0600
Message-Id: <20210424160016.15200-44-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 5e033e8bf4..46c0e29841 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -28,8 +28,6 @@
 #include "qemu-common.h"
 #include "user/syscall-trace.h"
 
-//#define DEBUG
-
 static abi_ulong target_brk;
 static abi_ulong target_original_brk;
 
@@ -78,7 +76,8 @@ static abi_long do_obreak(abi_ulong new_brk)
     new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page + 1);
     mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
                                         PROT_READ | PROT_WRITE,
-                                        MAP_ANON | MAP_FIXED | MAP_PRIVATE, -1, 0));
+                                        MAP_ANON | MAP_FIXED | MAP_PRIVATE,
+                                        -1, 0));
 
     if (!is_error(mapped_addr))
         target_brk = new_brk;
@@ -221,8 +220,9 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
 }
 
 /* XXX this needs to be emulated on non-FreeBSD hosts... */
-static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong oldp,
-                          abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
+static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen,
+                                  abi_ulong oldp, abi_ulong oldlenp,
+                                  abi_ulong newp, abi_ulong newlen)
 {
     abi_long ret;
     void *hnamep, *holdp, *hnewp = NULL;
@@ -268,7 +268,8 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
     abi_ulong base;
     int i;
 
-    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
     for (i = 0; i < count; i++) {
@@ -294,7 +295,8 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     abi_ulong base;
     int i;
 
-    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
     for (i = 0; i < count; i++) {
@@ -373,7 +375,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_FREEBSD_NR_mmap:
         ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
+                                    target_to_host_bitmask(arg4,
+                                                           mmap_flags_tbl),
                                     arg5,
                                     arg6));
         break;
@@ -393,10 +396,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_FREEBSD_NR_syscall:
     case TARGET_FREEBSD_NR___syscall:
-        ret = do_freebsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, arg7, arg8, 0);
+        ret = do_freebsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4,
+                                 arg5, arg6, arg7, arg8, 0);
         break;
     default:
-        ret = get_errno(syscall(num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
+        ret = get_errno(syscall(num, arg1, arg2, arg3, arg4, arg5, arg6,
+                                arg7, arg8));
         break;
     }
  fail:
@@ -463,7 +468,8 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_NETBSD_NR_mmap:
         ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
+                                    target_to_host_bitmask(arg4,
+                                                           mmap_flags_tbl),
                                     arg5,
                                     arg6));
         break;
@@ -472,7 +478,8 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_NETBSD_NR_syscall:
     case TARGET_NETBSD_NR___syscall:
-        ret = do_netbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, 0);
+        ret = do_netbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5,
+                                arg6, 0);
         break;
     default:
         ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
@@ -536,13 +543,15 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         if (!(p = lock_user_string(arg1)))
             goto efault;
         ret = get_errno(open(path(p),
-                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
+                             target_to_host_bitmask(arg2,
+                                                    fcntl_flags_tbl),
                              arg3));
         unlock_user(p, arg1, 0);
         break;
     case TARGET_OPENBSD_NR_mmap:
         ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
+                                    target_to_host_bitmask(arg4,
+                                                           mmap_flags_tbl),
                                     arg5,
                                     arg6));
         break;
@@ -551,7 +560,8 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_OPENBSD_NR_syscall:
     case TARGET_OPENBSD_NR___syscall:
-        ret = do_openbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, 0);
+        ret = do_openbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4,
+                                 arg5, arg6, 0);
         break;
     default:
         ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-- 
2.22.1


