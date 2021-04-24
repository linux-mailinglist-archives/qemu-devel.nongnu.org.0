Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C516136A204
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:17:28 +0200 (CEST)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKyF-0000Mt-Rz
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKip-00063f-3J
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:31 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiT-0004M5-1t
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:30 -0400
Received: by mail-io1-xd31.google.com with SMTP id e186so1610808iof.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lT0iyUwum8EZCC05GDsUg7mVcpTBPEwFXTcaOzq9xxc=;
 b=KQmmT9ItVuV0KbjLcWsXYkRQx6OWg9YSSARRAXegwTpAhxoPDOd8QB/O4xfiVBOEHH
 SPEXMxppR72hMWOgDlvVZtZ+TkFj66YFuv5n88bkgGCOQ2ixZIKeRTNzYCuTl9VqWm0s
 7qnW6pEoWzubq8CZteXpLqj97U2590jmgqH4/xEZiZRUZCr8zOxHcvp/2rOYRmpasoOE
 5blO4cXezk/cWjdYBWacAoIM7A6PwLuoU6YqpPsBb/KfDncAfoNvWm/N6/gMnczMFCWR
 v6XlUKd/ZmGUtJ2LlCohaBVXSZTxIvM07zykU4fQvqcHX9t9qqGYKGzCIbi5Q0yvcny9
 FjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lT0iyUwum8EZCC05GDsUg7mVcpTBPEwFXTcaOzq9xxc=;
 b=T9VNLrZcLzUi4qulJ47wKk471GWmtlRp1Bp24CU+OEVaV6NkekKC74CNvoNTGZuBcn
 p+CiWsCM+v+rWe0PipQ3DMVvSGIZJltwVfO9XjT0NlTwr7lD6K8tPUGMWRT0TH0vQFtf
 N1vteoGCmCME3pyvc41VtfYALsE4pYQx4RbEo6HYwCtyq/t5rv5HN00iA92Uwh619ZVe
 Maj2RZd7DZ6Q9wcIpmTtTLLDB45dh5gaONK04YL2eiI8UfsMtCHYtJazA6FSXefL7qOJ
 wB7xr6oLM1SRZohMsTY41Ay3oFM2N0zR85KK7NLjOxEshD/33NnOsPkKKJXV3Mw786WE
 plAw==
X-Gm-Message-State: AOAM530c5kZwP9UfaLaKzxHRfMA0YE4ezQMpYLia7CRw0e1RYm7e20m6
 FdnX6cn64u6gfu9Av2zfu4y8lDryykOq5yuf
X-Google-Smtp-Source: ABdhPJzJRk/K3YdbJQjdMLYYjd/otHo41G+9uuDFiKGqI6BKYLOGwCaRFyoMkhMI3JDuzxFYm1T1DA==
X-Received: by 2002:a02:a04d:: with SMTP id f13mr1994100jah.38.1619280065909; 
 Sat, 24 Apr 2021 09:01:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:05 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/48] bsd-user: style tweak: don't assign in if statement.
Date: Sat, 24 Apr 2021 10:00:15 -0600
Message-Id: <20210424160016.15200-48-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
 bsd-user/syscall.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 1f6b93923c..1851311acd 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -245,13 +245,18 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen,
     if (oldlenp) {
         get_user_ual(oldlen, oldlenp);
     }
-    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1))) {
+    hnamep = lock_user(VERIFY_READ, namep, namelen, 1);
+    if (!hnamep) {
         return -TARGET_EFAULT;
     }
-    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1))) {
-        return -TARGET_EFAULT;
+    if (newp) {
+        hnewp = lock_user(VERIFY_READ, newp, newlen, 1);
+        if (!hnewp) {
+            return -TARGET_EFAULT;
+        }
     }
-    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0))) {
+    holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0);
+    if (!holdp) {
         return -TARGET_EFAULT;
     }
     holdlen = oldlen;
@@ -368,14 +373,16 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_FREEBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
+        p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_FREEBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
+        p = lock_user(VERIFY_READ, arg2, arg3, 1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(write(arg1, p, arg3));
@@ -395,7 +402,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         }
         break;
     case TARGET_FREEBSD_NR_open:
-        if (!(p = lock_user_string(arg1))) {
+        p = lock_user_string(arg1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(open(path(p),
@@ -479,21 +487,24 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_NETBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
+        p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_NETBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
+        p = lock_user(VERIFY_READ, arg2, arg3, 1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(write(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         break;
     case TARGET_NETBSD_NR_open:
-        if (!(p = lock_user_string(arg1))) {
+        p = lock_user_string(arg1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(open(path(p),
@@ -565,21 +576,24 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_OPENBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
+        p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_OPENBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
+        p = lock_user(VERIFY_READ, arg2, arg3, 1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(write(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         break;
     case TARGET_OPENBSD_NR_open:
-        if (!(p = lock_user_string(arg1))) {
+        p = lock_user_string(arg1);
+        if (!p) {
             goto efault;
         }
         ret = get_errno(open(path(p),
-- 
2.22.1


