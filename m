Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2D5F780B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:39:28 +0200 (CEST)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmdT-0008SF-P7
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku5-0005Rm-A0
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku3-0003C5-68
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87SwFUkE+1+ARHEzx7Jc86JUCWRXmX6Ofwc5myiLOns=;
 b=SjoyfidK1coVyaZqfTQhVUsEl8ZiHYp60KLfPFnCX5WLuIh3LM6LWenLHBsQJ4tMdeUump
 ur7mMefMIig53dqwiE3pPCZk+8F7ceHDG8KM4+dO8gdXDV2XQRWE3y3fDJoIqWVeMMT+2t
 XhlgDnmy6qEQMplelNaf2VzqvJKbv+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-9TfQGSV6OpGd9xOXh8jcbg-1; Fri, 07 Oct 2022 06:48:23 -0400
X-MC-Unique: 9TfQGSV6OpGd9xOXh8jcbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BCEC811E81;
 Fri,  7 Oct 2022 10:48:23 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A83D2028DC1;
 Fri,  7 Oct 2022 10:48:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 23/50] coroutine-lock: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:25 +0200
Message-Id: <20221007104752.141361-24-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-23-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-coroutine-lock.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 9ad24ab1af..15c82d9348 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -135,7 +135,7 @@ typedef struct CoWaitRecord {
     QSLIST_ENTRY(CoWaitRecord) next;
 } CoWaitRecord;
 
-static void push_waiter(CoMutex *mutex, CoWaitRecord *w)
+static void coroutine_fn push_waiter(CoMutex *mutex, CoWaitRecord *w)
 {
     w->co = qemu_coroutine_self();
     QSLIST_INSERT_HEAD_ATOMIC(&mutex->from_push, w, next);
@@ -332,7 +332,7 @@ void qemu_co_rwlock_init(CoRwlock *lock)
 }
 
 /* Releases the internal CoMutex.  */
-static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+static void coroutine_fn qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 {
     CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
     Coroutine *co = NULL;
@@ -365,7 +365,7 @@ static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
     }
 }
 
-void qemu_co_rwlock_rdlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -390,7 +390,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_unlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -408,7 +408,7 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_downgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners == -1);
@@ -418,7 +418,7 @@ void qemu_co_rwlock_downgrade(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_wrlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -438,7 +438,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_upgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners > 0);
-- 
2.37.3


