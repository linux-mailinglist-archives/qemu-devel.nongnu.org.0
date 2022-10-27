Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E25A610168
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:17:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7l8-0001oV-LG; Thu, 27 Oct 2022 14:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gZ-0001tG-TU
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gS-0002Xu-4w
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5E4jh8QbP8+WLcJHGneB6r2xcqGW+0H7OhlyYB+9BUY=;
 b=Whc9fWiX1I1lCpVhTNFiNzQXdGkmQDJnFxULIjjScA7gFhxozT3+cyCzr6cBjmtUvPhtGZ
 nQCMxcyu3y0fgiUFrhFmkHQUXIHQQVvwgKY0N2GkKc+TTgtotJKKKKg8waXim2u9al0ePZ
 u/U1ledhBoGa7HkSlnrjrYDq4HmPz/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-rbRaC4UfNEKc-KqXL39yeA-1; Thu, 27 Oct 2022 14:32:49 -0400
X-MC-Unique: rbRaC4UfNEKc-KqXL39yeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E2E811E75;
 Thu, 27 Oct 2022 18:32:49 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C45D61121320;
 Thu, 27 Oct 2022 18:32:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 39/58] coroutine-lock: add missing coroutine_fn annotation to
 prototypes
Date: Thu, 27 Oct 2022 20:31:27 +0200
Message-Id: <20221027183146.463129-40-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

The functions are marked coroutine_fn in the definition.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-7-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/coroutine.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index aae33cce17..d848489b65 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -276,7 +276,7 @@ void qemu_co_rwlock_init(CoRwlock *lock);
  * of a parallel writer, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_rdlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
 
 /**
  * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
@@ -285,7 +285,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock);
  * to the caller of the current coroutine; another writer might run while
  * @qemu_co_rwlock_upgrade blocks.
  */
-void qemu_co_rwlock_upgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
 
 /**
  * Downgrades a write-side critical section to a reader.  Downgrading with
@@ -293,20 +293,20 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock);
  * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
  * may also sometimes be necessary for correctness.
  */
-void qemu_co_rwlock_downgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock);
 
 /**
  * Write Locks the mutex. If the lock cannot be taken immediately because
  * of a parallel reader, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_wrlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock);
 
 /**
  * Unlocks the read/write lock and schedules the next coroutine that was
  * waiting for this lock to be run.
  */
-void qemu_co_rwlock_unlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock);
 
 typedef struct QemuCoSleep {
     Coroutine *to_wake;
-- 
2.37.3


