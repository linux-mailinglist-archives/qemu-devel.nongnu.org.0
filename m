Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF996FEE0D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:52:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px211-0000Tb-C1; Thu, 11 May 2023 04:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px20w-0000TS-Ow
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px20r-0002Hu-QJ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683795059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=96lBFEimLSHy3Xg+JftRfj8tucNYhgSM9zJqOBqPh8Q=;
 b=PtaHYbr+vylotjb0uXvb6ykraWjIuvJjbxUEiC39MsoYAbNaGqK6i+1ecyKZgyUeA604T9
 V+ND/hhPYuqvAn00DOkZp/a5pxoX1M5ytmwbu7xtLOisHawEkXNVKRLLbpiTrKUkjkvx7s
 mOCeO9Oojq7fNy0jke6JzMSpByAUU3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-PAqRjUqhMMuW6oKwGFFqPQ-1; Thu, 11 May 2023 04:50:58 -0400
X-MC-Unique: PAqRjUqhMMuW6oKwGFFqPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0862287082D;
 Thu, 11 May 2023 08:50:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF47342AB8;
 Thu, 11 May 2023 08:50:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] linux-user: Drop uint and ulong
Date: Thu, 11 May 2023 10:50:56 +0200
Message-Id: <20230511085056.13809-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These are types not used anymore anywhere else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c    | 2 +-
 linux-user/syscall.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0aa8ae7356..55dd143a10 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -859,7 +859,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
 
 static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
 {
-    ulong addr;
+    abi_ulong addr;
 
     if ((start | end) & ~qemu_host_page_mask) {
         return false;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98..dd0349712b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -309,16 +309,16 @@ _syscall0(int, sys_gettid)
 #endif
 
 #if defined(TARGET_NR_getdents) && defined(EMULATE_GETDENTS_WITH_GETDENTS)
-_syscall3(int, sys_getdents, uint, fd, struct linux_dirent *, dirp, uint, count);
+_syscall3(int, sys_getdents, unsigned int, fd, struct linux_dirent *, dirp, unsigned int, count);
 #endif
 #if (defined(TARGET_NR_getdents) && \
       !defined(EMULATE_GETDENTS_WITH_GETDENTS)) || \
     (defined(TARGET_NR_getdents64) && defined(__NR_getdents64))
-_syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp, uint, count);
+_syscall3(int, sys_getdents64, unsigned int, fd, struct linux_dirent64 *, dirp, unsigned int, count);
 #endif
 #if defined(TARGET_NR__llseek) && defined(__NR_llseek)
-_syscall5(int, _llseek,  uint,  fd, ulong, hi, ulong, lo,
-          loff_t *, res, uint, wh);
+_syscall5(int, _llseek,  unsigned int,  fd, unsigned long, hi, unsigned long, lo,
+          loff_t *, res, unsigned int, wh);
 #endif
 _syscall3(int, sys_rt_sigqueueinfo, pid_t, pid, int, sig, siginfo_t *, uinfo)
 _syscall4(int, sys_rt_tgsigqueueinfo, pid_t, pid, pid_t, tid, int, sig,
-- 
2.40.1


