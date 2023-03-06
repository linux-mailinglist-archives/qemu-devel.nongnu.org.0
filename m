Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D746AD1AA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOh-0004PA-Da; Mon, 06 Mar 2023 17:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOf-0004O5-Gp
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOe-0003YT-8G
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOHH4yPNJZf+Sa0450BcZZrU7cumuCnXGhvsXLoiMX8=;
 b=X+2k4iU2GYI8SPXoA6l218yLSa1YOx8xOPLM3sX3rPbytGFn/rSpTvKbVQ8I48UeX5bM6V
 Gz4+1scSjDAR/j0qiDBCBR2exJj+UWCoHocMgnId0/yirDQtVpSLhxLK0k/CiqAf38ria2
 JQxY1A85wW5yi0bImsdz/k042TPHLxs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-YGC-_Pk_Nl6Ad4MBdmmSRg-1; Mon, 06 Mar 2023 17:33:30 -0500
X-MC-Unique: YGC-_Pk_Nl6Ad4MBdmmSRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so3694951edc.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOHH4yPNJZf+Sa0450BcZZrU7cumuCnXGhvsXLoiMX8=;
 b=TiLkg7DPpwpeKGpxedF9cPedoIa+pk7Lz7j5pxp0OLAX2xcM3oplJghOexAnAzde9l
 lMuzIg/qsT1lr1vlk8Tvd3851SC2vZlBudUvF06I/dqtH8fRnOTCZ2rdxDMTsL+2FPfF
 0rqR/2woZ2xAaWjD8s3iQuH8BRNW0lBHNDXsABHYA5eQXjrX8giSbi2DBsMhqBZ2UkGs
 /Qkb78jIsrRH4/XnSQB/FEgDETngXPy6abQtNx5B6zuvG6kcdWXlzHcComeCUo9C3/3D
 eCXAciXsj7X3poDIrW0CYhTrfR6ZYPlDSpqKtNQYlZJPUwS8q9jJnNtDuaXPtU/Xi3hL
 H8zg==
X-Gm-Message-State: AO0yUKWZxyNCzH+HnXACtU7V2YNmDHZt0pFkff48hsN5ZE/0HUtkUPG4
 WkKN/0xliwcuekfGyOnjv9Tar2OYwQE0gIOQ4ppa8wiIW2borogvCFqBe10iQyiJN8jUPWTLRJR
 G5YQs2QDlM/fYj9J+NWd/4gAG56kPdOVavtegzea0gj5HkYl1cOCA4cgoxqAqCbPWaISMRVKhF2
 8=
X-Received: by 2002:aa7:c1d6:0:b0:4c1:88e:6ac9 with SMTP id
 d22-20020aa7c1d6000000b004c1088e6ac9mr11309673edp.10.1678142008895; 
 Mon, 06 Mar 2023 14:33:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZOQDrKBDC+rHid1ppyEqqqrU4e3oCRRUFTha6BjHi1Z5w/FeAF6EqHD+wBDNGu2WOsfoyEg==
X-Received: by 2002:aa7:c1d6:0:b0:4c1:88e:6ac9 with SMTP id
 d22-20020aa7c1d6000000b004c1088e6ac9mr11309658edp.10.1678142008624; 
 Mon, 06 Mar 2023 14:33:28 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 dx11-20020a170906a84b00b008e493b7bb61sm5089287ejb.153.2023.03.06.14.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 6/9] qemu-coroutine-lock: add smp_mb__after_rmw()
Date: Mon,  6 Mar 2023 23:33:03 +0100
Message-Id: <20230306223306.84383-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

mutex->from_push and mutex->handoff in qemu-coroutine-lock implement
the familiar pattern:

   write a                                  write b
   smp_mb()                                 smp_mb()
   read b                                   read a

The memory barrier is required by the C memory model even after a
SEQ_CST read-modify-write operation such as QSLIST_INSERT_HEAD_ATOMIC.
Add it and avoid the unclear qatomic_mb_read() operation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 58f3f771817b..84a50a9e9117 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -201,10 +201,16 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     trace_qemu_co_mutex_lock_entry(mutex, self);
     push_waiter(mutex, &w);
 
+    /*
+     * Add waiter before reading mutex->handoff.  Pairs with qatomic_mb_set
+     * in qemu_co_mutex_unlock.
+     */
+    smp_mb__after_rmw();
+
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
      * a concurrent unlock() the responsibility of waking somebody up.
      */
-    old_handoff = qatomic_mb_read(&mutex->handoff);
+    old_handoff = qatomic_read(&mutex->handoff);
     if (old_handoff &&
         has_waiters(mutex) &&
         qatomic_cmpxchg(&mutex->handoff, old_handoff, 0) == old_handoff) {
@@ -303,6 +309,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
         }
 
         our_handoff = mutex->sequence;
+        /* Set handoff before checking for waiters.  */
         qatomic_mb_set(&mutex->handoff, our_handoff);
         if (!has_waiters(mutex)) {
             /* The concurrent lock has not added itself yet, so it
-- 
2.39.1


