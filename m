Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846B6AD1AC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOa-0004Kt-HJ; Mon, 06 Mar 2023 17:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOY-0004Jv-DT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOW-0003W7-Vw
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtOY8UNV2DfBT+9KGY5mEbR/7/aOCUaif3dPvh7XgAU=;
 b=hZFLjoSPbDv0VF0oMYbhXS3jTeQpPjjoCCdz6KVbia8PW+arhwzMpAHJ87r5fugTykMpb3
 mCL8jaSEbWROn06v2CRARya1o3H+HJ+Ca0ENVw0cE2kYgJQINkQJ0ZdXEqZ5m0XJAiX6yI
 wes0Kj8/Xrl8DnXPzQ4L2Re7q6YHMYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-7LKNNxPmMZqtsmyqRmU-Ug-1; Mon, 06 Mar 2023 17:33:21 -0500
X-MC-Unique: 7LKNNxPmMZqtsmyqRmU-Ug-1
Received: by mail-ed1-f70.google.com with SMTP id
 w7-20020a056402268700b004bbcdf3751bso15758096edd.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtOY8UNV2DfBT+9KGY5mEbR/7/aOCUaif3dPvh7XgAU=;
 b=WhUexkql0DUk0N7v26CO6rozhFRJT9h8SFhz07q79TR0IN98DbShGCk4Pvw1GCSSC9
 /N2yQGSvik7aUX0eiMGTxnYlBqYq+hdcqAAA3na5cnnSGHKN1X6sa1gNeBLrVQJDBsbl
 KvMnJl89LxIb6sT5bgyFSb5EsV3y7BGo5h8WNoQIVS/Z8RFdyTxbv07sTqBrJM28q6MH
 ec2u8QUmvGkdDwZhYtG6g0SyMj9Xk5G+DubtpvND1esFcTb7WqjMdFdai5newgwWv4V9
 CRhqOS5KXqfUSQybMVndW8XCKw03/T1PQJs2RM+Dve+Kj4Yczj027myadYCMnJCEKwY+
 Lzgg==
X-Gm-Message-State: AO0yUKVnrmwnjNNatqA/LKbBraDPwklLe6eEm1zQSxKJkwfe52LRz2gG
 Afek4Z8x9RCFivlHFjetbu9jAN/kMM5BptPviueukV3F4t69Jv2OIa6M/ELpSSCevMUJBuwnS+1
 zJmXInvDB+xEV3KkfvfOjZVNXMMaonJ6RLQwZ0khOC5y0/jwLWHufgWbji9iBiNIFZJ9SA4qcgJ
 U=
X-Received: by 2002:aa7:c14e:0:b0:4ac:d2cd:81c7 with SMTP id
 r14-20020aa7c14e000000b004acd2cd81c7mr12355275edp.5.1678142000172; 
 Mon, 06 Mar 2023 14:33:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8L4o/E2dsqmby2n3IdhzUxTZiCHLCgCBEBd4x+nfYZ57O1k/ryFepz+uorZefnL/QM2My1jg==
X-Received: by 2002:aa7:c14e:0:b0:4ac:d2cd:81c7 with SMTP id
 r14-20020aa7c14e000000b004acd2cd81c7mr12355257edp.5.1678141999763; 
 Mon, 06 Mar 2023 14:33:19 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a1709060c5a00b008ec793ac3f4sm5088070ejf.192.2023.03.06.14.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 3/9] qemu-thread-win32: cleanup, fix, document QemuEvent
Date: Mon,  6 Mar 2023 23:33:00 +0100
Message-Id: <20230306223306.84383-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QemuEvent is currently broken on ARM due to missing memory barriers
after qatomic_*().  Apart from adding the memory barrier, a closer look
reveals some unpaired memory barriers that are not really needed and
complicated the functions unnecessarily.  Also, it is relying on
a memory barrier in ResetEvent(); the barrier _ought_ to be there
but there is really no documentation about it, so make it explicit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-win32.c | 82 +++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 26 deletions(-)

diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 69db254ac7c1..970ba5642d7b 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -272,12 +272,20 @@ void qemu_event_destroy(QemuEvent *ev)
 void qemu_event_set(QemuEvent *ev)
 {
     assert(ev->initialized);
-    /* qemu_event_set has release semantics, but because it *loads*
+
+    /*
+     * Pairs with both qemu_event_reset() and qemu_event_wait().
+     *
+     * qemu_event_set has release semantics, but because it *loads*
      * ev->value we need a full memory barrier here.
      */
     smp_mb();
     if (qatomic_read(&ev->value) != EV_SET) {
-        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
+        int old = qatomic_xchg(&ev->value, EV_SET);
+
+        /* Pairs with memory barrier after ResetEvent.  */
+        smp_mb__after_rmw();
+        if (old == EV_BUSY) {
             /* There were waiters, wake them up.  */
             SetEvent(ev->event);
         }
@@ -286,17 +294,19 @@ void qemu_event_set(QemuEvent *ev)
 
 void qemu_event_reset(QemuEvent *ev)
 {
-    unsigned value;
-
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
-    if (value == EV_SET) {
-        /* If there was a concurrent reset (or even reset+wait),
-         * do nothing.  Otherwise change EV_SET->EV_FREE.
-         */
-        qatomic_or(&ev->value, EV_FREE);
-    }
+
+    /*
+     * If there was a concurrent reset (or even reset+wait),
+     * do nothing.  Otherwise change EV_SET->EV_FREE.
+     */
+    qatomic_or(&ev->value, EV_FREE);
+
+    /*
+     * Order reset before checking the condition in the caller.
+     * Pairs with the first memory barrier in qemu_event_set().
+     */
+    smp_mb__after_rmw();
 }
 
 void qemu_event_wait(QemuEvent *ev)
@@ -304,29 +314,49 @@ void qemu_event_wait(QemuEvent *ev)
     unsigned value;
 
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
+
+    /*
+     * qemu_event_wait must synchronize with qemu_event_set even if it does
+     * not go down the slow path, so this load-acquire is needed that
+     * synchronizes with the first memory barrier in qemu_event_set().
+     *
+     * If we do go down the slow path, there is no requirement at all: we
+     * might miss a qemu_event_set() here but ultimately the memory barrier in
+     * qemu_futex_wait() will ensure the check is done correctly.
+     */
+    value = qatomic_load_acquire(&ev->value);
     if (value != EV_SET) {
         if (value == EV_FREE) {
-            /* qemu_event_set is not yet going to call SetEvent, but we are
-             * going to do another check for EV_SET below when setting EV_BUSY.
-             * At that point it is safe to call WaitForSingleObject.
+            /*
+             * Here the underlying kernel event is reset, but qemu_event_set is
+             * not yet going to call SetEvent.  However, there will be another
+             * check for EV_SET below when setting EV_BUSY.  At that point it
+             * is safe to call WaitForSingleObject.
              */
             ResetEvent(ev->event);
 
-            /* Tell qemu_event_set that there are waiters.  No need to retry
-             * because there cannot be a concurrent busy->free transition.
-             * After the CAS, the event will be either set or busy.
+            /*
+             * It is not clear whether ResetEvent provides this barrier; kernel
+             * APIs (KeResetEvent/KeClearEvent) do not.  Better safe than sorry!
+             */
+            smp_mb();
+
+            /*
+             * Leave the event reset and tell qemu_event_set that there are
+             * waiters.  No need to retry, because there cannot be a concurrent
+             * busy->free transition.  After the CAS, the event will be either
+             * set or busy.
              */
             if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
-                value = EV_SET;
-            } else {
-                value = EV_BUSY;
+                return;
             }
         }
-        if (value == EV_BUSY) {
-            WaitForSingleObject(ev->event, INFINITE);
-        }
+
+        /*
+         * ev->value is now EV_BUSY.  Since we didn't observe EV_SET,
+         * qemu_event_set() must observe EV_BUSY and call SetEvent().
+         */
+        WaitForSingleObject(ev->event, INFINITE);
     }
 }
 
-- 
2.39.1


