Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB952547E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:10:28 +0200 (CEST)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDGd-0001Ra-18
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZZ-00055N-Jw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZX-0005FD-Uk
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vevcB/4KvrnX08FxSQYOsMcc3AylgVCKvbZyt7Xshqs=;
 b=WnCJeeudavQxhPZhg1yE9gddJJIPOUU4rq74noxTkKHHw6R2g3s5E6hbplgvT1zPTsEQYU
 olXqEqpeI8dN0Go6vCN97Gx8aFWm3Vq2fOGdAgR0D3eqoKUbrnLV9L7hN565tKaNCTUVOP
 95k4nWfTB0Z99zI05yvJGMjOCPRK648=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-skfGdGrTMMCqkuedN4zeyA-1; Thu, 12 May 2022 13:25:54 -0400
X-MC-Unique: skfGdGrTMMCqkuedN4zeyA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec44-20020a0564020d6c00b00425b136662eso3497476edb.12
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vevcB/4KvrnX08FxSQYOsMcc3AylgVCKvbZyt7Xshqs=;
 b=PRPuWN3E6qHoazjOLc9NywyGqg7+ZlbPzymnQLOdTPxD7YXKehnVUO3ippyitwkWRi
 sY94B353apr1gMuP1genkXKdt3hyS+irW4H9eWFGSfkexH3X7lvQhuZMf7v7v/5KbWzc
 BJ8qY2GyttmFqdtyvl7ZjUiIrCRYG0PeFjr253jT+GboljQ8SnMJTryITWssN/OuWgP4
 2l9sVefK54SIDu0fQlGvFHEKArxoebb7UkN3/TQk/SPMBbjOlAP6MbFvT5+h86GdGNsQ
 6EuxITLQSDHCt+oElHroUOMUSeDD/7iSefWWl7vCHvoP71v8yoP/I3Z4EpdqMXcr8a+T
 FyLg==
X-Gm-Message-State: AOAM5327lqBI4aCpJGPOa5C4fpZ1QzF8ROOwnhEOL+ibswNC3Bk8B5DO
 GP9SavuLY2yh+i3FM2IAvVMgsWkzU7pTWZo4rAPGbXAtSoPjS9xrRZV5Jbn9Q09l7vy4hj0ZMV2
 TVsyi/OqFQTmiqUK2ua0SD2cmyy8MJHhYQuPpXLjpRohN6bfuKjw027b21sPeGcFBipI=
X-Received: by 2002:a17:907:1623:b0:6f6:e9ce:9926 with SMTP id
 hb35-20020a170907162300b006f6e9ce9926mr873690ejc.360.1652376352391; 
 Thu, 12 May 2022 10:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu7VZjnPqKdcsMVlstlzckZqTNI8WPhI5LPbDXZPUGw80CnKrBsrtLjPzo99JzTD2+gpRy2g==
X-Received: by 2002:a17:907:1623:b0:6f6:e9ce:9926 with SMTP id
 hb35-20020a170907162300b006f6e9ce9926mr873671ejc.360.1652376352074; 
 Thu, 12 May 2022 10:25:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l9-20020aa7c3c9000000b0042617ba6388sm2754449edr.18.2022.05.12.10.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>
Subject: [PULL 22/27] coroutine-lock: introduce qemu_co_queue_enter_all
Date: Thu, 12 May 2022 19:25:00 +0200
Message-Id: <20220512172505.1065394-23-pbonzini@redhat.com>
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

Because qemu_co_queue_restart_all does not release the lock, it should
be used only in coroutine context.  Introduce a new function that,
like qemu_co_enter_next, does release the lock, and use it whenever
qemu_co_queue_restart_all was used outside coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220427130830.150180-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h   | 13 +++++++++++++
 ui/console.c               |  2 +-
 util/qemu-coroutine-lock.c |  7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c23d41e1ff..e5954635f6 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -234,6 +234,19 @@ void qemu_co_queue_restart_all(CoQueue *queue);
     qemu_co_enter_next_impl(queue, QEMU_MAKE_LOCKABLE(lock))
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock);
 
+/**
+ * Empties the CoQueue, waking the waiting coroutine one at a time.  Unlike
+ * qemu_co_queue_all, this function releases the lock during aio_co_wake
+ * because it is meant to be used outside coroutine context; in that case, the
+ * coroutine is entered immediately, before qemu_co_enter_all returns.
+ *
+ * If used in coroutine context, qemu_co_enter_all is equivalent to
+ * qemu_co_queue_all.
+ */
+#define qemu_co_enter_all(queue, lock) \
+    qemu_co_enter_all_impl(queue, QEMU_MAKE_LOCKABLE(lock))
+void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock);
+
 /**
  * Checks if the CoQueue is empty.
  */
diff --git a/ui/console.c b/ui/console.c
index 15d0f6affd..36c80cd1de 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -221,7 +221,7 @@ static void gui_setup_refresh(DisplayState *ds)
 void graphic_hw_update_done(QemuConsole *con)
 {
     if (con) {
-        qemu_co_queue_restart_all(&con->dump_queue);
+        qemu_co_enter_all(&con->dump_queue, NULL);
     }
 }
 
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5705cfea2e..5b0342faed 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -108,6 +108,13 @@ bool coroutine_fn qemu_co_queue_next(CoQueue *queue)
     return qemu_co_enter_next_impl(queue, NULL);
 }
 
+void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock)
+{
+    while (qemu_co_enter_next_impl(queue, lock)) {
+        /* just loop */
+    }
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.36.0


