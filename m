Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A652548D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:17:00 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDMx-0005uK-Ck
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZY-000531-1k
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZW-0005F3-AT
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLiUgLlqQ+CAPpx3xtG4C86yzSNWMgqSbb0iyBnKLuA=;
 b=iuqcmnyyGNfYNwH7ERrMPeJ2YoIegSJM7IvNdQWDO3AweEIfrykTQO7f7UPcTmrZA/+n3C
 3g12rj/1O15i/V9qvEsXKLuvZexCHUvSnTOBTdqnoz1RG1XtIe/OCD6uA4Pzxe/km9iP9v
 miVb+u8VmC3Qk9X4rCAA9j8IACpyeng=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-sNCQ6A3VOx6N5MY1HaOfIg-1; Thu, 12 May 2022 13:25:52 -0400
X-MC-Unique: sNCQ6A3VOx6N5MY1HaOfIg-1
Received: by mail-ed1-f70.google.com with SMTP id
 dn26-20020a05640222fa00b00425e4b8efa9so3503262edb.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLiUgLlqQ+CAPpx3xtG4C86yzSNWMgqSbb0iyBnKLuA=;
 b=yCWXshqPGCYyC62s7AWb6U6YM9y3JVsIDPa0BISrpfcmGX5nOfPY7vV1eLpekhSIzC
 /3tLT7HjiGnYDFIaC7q4vzqTGQWd7SRbWVo7rWEHiXOwhLg96Sxd+t9rOZxjSr2Y5QEv
 zsxL8D53rYrW/0RhiN5tIyFFUdoXxuaWOVxGmYOyRvGHUuSgcyK2y88BMlazG0+NR7R+
 beQQwlVs+iGV3ZtQCuCZ/+2vGkWzA/pdMkRyu83z0Wm0srspcTl7IxZs/g+bN6+h0L9l
 XtQ3cUktgx/7w9uo+95/uK6juPERxnTf1N+qUsCYJTTtdK00YGJQH6NhSUrEA4OHUTzH
 XOIw==
X-Gm-Message-State: AOAM531AgpuMDw+hB6IU5tO3YoGEEM/XTjSKR3bVFlSFpKIejpFBjNHi
 qnt0m448XbxGtHwpPQP7v2FTjFGQfNY5JnWTQyEsIKXoA2cB/GPiSJPJwIrvCaobSlS4iPhWQg2
 OcdKKZezcxTekfMb8ucAYBQewj48YbJeizgghJss6qMGzVDBm/tjqu6iwaCRwd9PK4i8=
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr36015270edz.13.1652376350785; 
 Thu, 12 May 2022 10:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSxY3ayjkzk7BGOa9rI8d4j3z58JO4d/NrOJzRkjoPy7DGI8I9oCRFi9AH2mRwCKtALHIcHw==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr36015257edz.13.1652376350567; 
 Thu, 12 May 2022 10:25:50 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170906828300b006f3ef214dc2sm2323327ejx.40.2022.05.12.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Subject: [PULL 21/27] coroutine-lock: qemu_co_queue_next is a coroutine-only
 qemu_co_enter_next
Date: Thu, 12 May 2022 19:24:59 +0200
Message-Id: <20220512172505.1065394-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_co_queue_next is basically the same as qemu_co_enter_next but
without a QemuLockable argument.  That's perfectly fine, but only
as long as the function is marked coroutine_fn.  If used outside
coroutine context, qemu_co_queue_wait will attempt to take the lock
and that is just broken: if you are calling qemu_co_queue_next outside
coroutine context, the lock is going to be a QemuMutex which cannot be
taken twice by the same thread.

The patch adds the marker and reimplements qemu_co_queue_next in terms of
qemu_co_enter_next_impl, to remove duplicated code and to clarify that the
latter also works in coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220427130830.150180-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h   |  7 ++++---
 util/qemu-coroutine-lock.c | 21 +++++++--------------
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 284571badb..c23d41e1ff 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -208,11 +208,12 @@ void qemu_co_queue_init(CoQueue *queue);
 void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 
 /**
- * Removes the next coroutine from the CoQueue, and wake it up.
+ * Removes the next coroutine from the CoQueue, and queue it to run after
+ * the currently-running coroutine yields.
  * Returns true if a coroutine was removed, false if the queue is empty.
- * OK to run from coroutine and non-coroutine context.
+ * Used from coroutine context, use qemu_co_enter_next outside.
  */
-bool qemu_co_queue_next(CoQueue *queue);
+bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
 
 /**
  * Empties the CoQueue; all coroutines are woken up.
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..5705cfea2e 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -67,7 +67,7 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
-static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
+void qemu_co_queue_restart_all(CoQueue *queue)
 {
     Coroutine *next;
 
@@ -78,23 +78,10 @@ static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
     while ((next = QSIMPLEQ_FIRST(&queue->entries)) != NULL) {
         QSIMPLEQ_REMOVE_HEAD(&queue->entries, co_queue_next);
         aio_co_wake(next);
-        if (single) {
-            break;
-        }
     }
     return true;
 }
 
-bool qemu_co_queue_next(CoQueue *queue)
-{
-    return qemu_co_queue_do_restart(queue, true);
-}
-
-void qemu_co_queue_restart_all(CoQueue *queue)
-{
-    qemu_co_queue_do_restart(queue, false);
-}
-
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
 {
     Coroutine *next;
@@ -115,6 +102,12 @@ bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
     return true;
 }
 
+bool coroutine_fn qemu_co_queue_next(CoQueue *queue)
+{
+    /* No unlock/lock needed in coroutine context.  */
+    return qemu_co_enter_next_impl(queue, NULL);
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.36.0


