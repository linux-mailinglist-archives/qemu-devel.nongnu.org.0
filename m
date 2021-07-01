Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5DC3B9885
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 00:14:22 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4wv-0006rL-TG
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 18:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36z3eYAgKCuwcObRSfgcUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--oanderso.bounces.google.com>)
 id 1lz4vf-0005n3-Qr
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:13:03 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36z3eYAgKCuwcObRSfgcUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--oanderso.bounces.google.com>)
 id 1lz4vd-00006m-Ug
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:13:03 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 o9-20020a6561490000b0290226fc371410so5044777pgv.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=m71lZzRC7hVmf2lDz/jDXE9saDRisXowlTsGw5b6gZk=;
 b=dgbffJon6jEyH4mES8JcLY/8Zhg5jHFL+PZAknZZiM+lKLKet0lzRBoCziDYgzYlDY
 IVBl/cok0qY986c9MsZDMSLnBCDwr4sOhEsXkyHxYF7xm80vP1HrN0xAwFLXjqk7KWz+
 0+uQfBwKXrmjiV4H1wqAhIneva0bjCBJAkcoDcnF+rYX1jYbblHTXBFT0XiojLjvDCWx
 oE3Q7+i8XAN38bMbg7FN0Bw0B2fD6b+6UdvF934nOdFaSALWZqcU0uNb8cqhbh1Q8k1W
 OMPlklMZwwYdY+X8j+7Pu7LAndnn4s+EG3zjezdJKogVckxdkVh6ymd1V2LATCBcx9Up
 WEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=m71lZzRC7hVmf2lDz/jDXE9saDRisXowlTsGw5b6gZk=;
 b=k4w5/eFBWbNmf6R8KylkI6oRkSx+gk5lGAr7liwFipH95MpZbdjtZrBF5JJgwW+UVR
 tIy+Eh38c8IDT4g9RHKKFecXEZD5JdOfjF98B5KYc5M+MMkZcXmL6x4GPopaFXUiA5SI
 FQclenhFzCTTo2ctOA/uZXA7UgtYrT9+RnzsdZe512pxP4nuFkk2IlEef6YDttYTJtXm
 Od3MEBLiVry9F56M/H8sENGKHW7zknzpbKk1CCS9+0ZoM5hdimGbmOhtoNr3KDiQS3O5
 DksNBeU7RigRJDVL/n4xg/yfxzd5DzssAzHtH86IUHwoD1gjGV1ebBffi52uYQMsifPA
 YStQ==
X-Gm-Message-State: AOAM530WuK4TG/Ppge9Ci/nctNjBnNK9cCdbi+ZZaiQ1ZmQbJIyD1hTs
 DyxLRMyVQ1fCJZ+/KVKJ0un5oc6+SBFjhg==
X-Google-Smtp-Source: ABdhPJxMwk00SEswXc5O1LReMv+Dk0dRmQuG0tZ83XEqUvecu1blkU8is0YHRri68JUJucMKPkVpqJV2tZT0Ow==
X-Received: from oanderso-specialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:7ff5])
 (user=oanderso job=sendgmr) by 2002:a17:90a:a393:: with SMTP id
 x19mr158217pjp.1.1625177579207; Thu, 01 Jul 2021 15:12:59 -0700 (PDT)
Date: Thu,  1 Jul 2021 22:12:55 +0000
Message-Id: <20210701221255.107976-1-oanderso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] fd-trans: Fix race condition on reallocation of the
 translation table.
From: Owen Anderson <oanderso@google.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Owen Anderson <oanderso@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=36z3eYAgKCuwcObRSfgcUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--oanderso.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -96
X-Spam_score: -9.7
X-Spam_bar: ---------
X-Spam_report: (-9.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.056,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mapping from file-descriptors to translator functions is not guarded
on realloc which may cause invalid function pointers to be read from a
previously deallocated mapping.

Signed-off-by: Owen Anderson <oanderso@google.com>
---
 linux-user/fd-trans.c |  1 +
 linux-user/fd-trans.h | 55 +++++++++++++++++++++++++++++++++++++------
 linux-user/main.c     |  3 +++
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 23adaca836..86b6f484d3 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -267,6 +267,7 @@ enum {
 };
 
 TargetFdTrans **target_fd_trans;
+QemuMutex target_fd_trans_lock;
 unsigned int target_fd_max;
 
 static void tswap_nlmsghdr(struct nlmsghdr *nlh)
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index a3fcdaabc7..1b9fa2041c 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -16,6 +16,8 @@
 #ifndef FD_TRANS_H
 #define FD_TRANS_H
 
+#include "qemu/lockable.h"
+
 typedef abi_long (*TargetFdDataFunc)(void *, size_t);
 typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);
 typedef struct TargetFdTrans {
@@ -25,12 +27,23 @@ typedef struct TargetFdTrans {
 } TargetFdTrans;
 
 extern TargetFdTrans **target_fd_trans;
+extern QemuMutex target_fd_trans_lock;
 
 extern unsigned int target_fd_max;
 
+static inline void fd_trans_init(void)
+{
+    qemu_mutex_init(&target_fd_trans_lock);
+}
+
 static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->target_to_host_data;
     }
     return NULL;
@@ -38,7 +51,12 @@ static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
 
 static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->host_to_target_data;
     }
     return NULL;
@@ -46,13 +64,19 @@ static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
 
 static inline TargetFdAddrFunc fd_trans_target_to_host_addr(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->target_to_host_addr;
     }
     return NULL;
 }
 
-static inline void fd_trans_register(int fd, TargetFdTrans *trans)
+static inline void internal_fd_trans_register_unsafe(int fd,
+                                                     TargetFdTrans *trans)
 {
     unsigned int oldmax;
 
@@ -67,18 +91,35 @@ static inline void fd_trans_register(int fd, TargetFdTrans *trans)
     target_fd_trans[fd] = trans;
 }
 
-static inline void fd_trans_unregister(int fd)
+static inline void fd_trans_register(int fd, TargetFdTrans *trans)
+{
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_register_unsafe(fd, trans);
+}
+
+static inline void internal_fd_trans_unregister_unsafe(int fd)
 {
     if (fd >= 0 && fd < target_fd_max) {
         target_fd_trans[fd] = NULL;
     }
 }
 
+static inline void fd_trans_unregister(int fd)
+{
+    if (fd < 0) {
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_unregister_unsafe(fd);
+}
+
 static inline void fd_trans_dup(int oldfd, int newfd)
 {
-    fd_trans_unregister(newfd);
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_unregister_unsafe(newfd);
     if (oldfd < target_fd_max && target_fd_trans[oldfd]) {
-        fd_trans_register(newfd, target_fd_trans[oldfd]);
+        internal_fd_trans_register_unsafe(newfd, target_fd_trans[oldfd]);
     }
 }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 2fb3a366a6..37ed50d98e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -48,6 +48,7 @@
 #include "target_elf.h"
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
+#include "fd-trans.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
@@ -829,6 +830,8 @@ int main(int argc, char **argv, char **envp)
     cpu->opaque = ts;
     task_settid(ts);
 
+    fd_trans_init();
+
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
-- 
2.32.0.93.g670b81a890-goog


