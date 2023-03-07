Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668566ADDD2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjM-0006GT-1K; Tue, 07 Mar 2023 06:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjK-00064s-Af
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjI-0008F6-LG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQiSJuptmSTzUnUzXG3PeEvpkUGVO3Aw//Tl2NkBFUU=;
 b=fGUYqyeLHkKZPO+6oC0fhX/waoCq1UmXUldI851eSWeivtmBV8K4r2X7sWH4YnXEWbnP/F
 /SW4E63W6/nZV70KnCilGXrJ/KRCdEGo46rCemp+Zv9e1nXM2QTUEm+VEHkED23Ya8dLBD
 xdEMI0lq9P0njj7wEze/IJ1pQ1KLArM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-__mClokgO1-ng7p7OakO1Q-1; Tue, 07 Mar 2023 06:43:38 -0500
X-MC-Unique: __mClokgO1-ng7p7OakO1Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so12829451edd.19
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQiSJuptmSTzUnUzXG3PeEvpkUGVO3Aw//Tl2NkBFUU=;
 b=wHFEV2LdhgQoQJL3/8z9OEnLAAXGPyhbDJsBq4iYFicRqFrbnP2cqBiplC6CV6E6pq
 aOZmEJumtFUQGxRIgecyUHrPlvxGhN78NwFBK8f7YFZFFh6c6UTVB31aQ+iJBsdIuW3q
 uw3D+MpmIeUbhN52AvpcuOxuBEisk0B1nHjDoAUwZgJN72qtxjQiq/WmBrhzWsWgtIuA
 OQ8NhajWfxKX+EUFbKG43pTkNzfRNqnmd3GKuhR9IjPlx1zxZ/x+jbn9VHl9FtQwuQl4
 fFPjvZfpGpx7gw2YkOL5z0pb4bWOdgWrgVFnzzXh7XhaxjqY6HJAGziQiBkruAzfeDBe
 kFIA==
X-Gm-Message-State: AO0yUKWYDlLc8XpsZxbBZFxHB3IHk/eAZbR26U/1RFKeWZw5HrjwwpHg
 3l7TbN31VIl8sPxLrEAMtkz2yL5gNQQiRDbJ2rzvUQ4zxxmi/R/zBtCK97/JUXbXqR1phyIYX9h
 eV+5drDUZouzHzqH3jaqkQd3feOB2zSbAY34MqqNJUjG3UkV/E71TC9U4rQZyv+ilRrM40fenZp
 Y=
X-Received: by 2002:a17:907:dab:b0:8ae:11ca:81de with SMTP id
 go43-20020a1709070dab00b008ae11ca81demr17428750ejc.34.1678189417236; 
 Tue, 07 Mar 2023 03:43:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8gvttryamZCxhsmrPrHfNGQe63XL/I6fg56HOUH7mC/l7HaIs1jrcZ2PQ/yPP4evumfo2Jzw==
X-Received: by 2002:a17:907:dab:b0:8ae:11ca:81de with SMTP id
 go43-20020a1709070dab00b008ae11ca81demr17428733ejc.34.1678189416911; 
 Tue, 07 Mar 2023 03:43:36 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170906454f00b008d8f1b238fdsm6065433ejq.149.2023.03.07.03.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 2/9] qemu-thread-posix: cleanup, fix, document QemuEvent
Date: Tue,  7 Mar 2023 12:43:22 +0100
Message-Id: <20230307114329.158094-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
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

QemuEvent is currently broken on ARM due to missing memory barriers
after qatomic_*().  Apart from adding the memory barrier, a closer look
reveals some unpaired memory barriers too.  Document more clearly what
is going on.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 93d250579741..b2e26e21205b 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -384,13 +384,21 @@ void qemu_event_destroy(QemuEvent *ev)
 
 void qemu_event_set(QemuEvent *ev)
 {
-    /* qemu_event_set has release semantics, but because it *loads*
+    assert(ev->initialized);
+
+    /*
+     * Pairs with both qemu_event_reset() and qemu_event_wait().
+     *
+     * qemu_event_set has release semantics, but because it *loads*
      * ev->value we need a full memory barrier here.
      */
-    assert(ev->initialized);
     smp_mb();
     if (qatomic_read(&ev->value) != EV_SET) {
-        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
+        int old = qatomic_xchg(&ev->value, EV_SET);
+
+        /* Pairs with memory barrier in kernel futex_wait system call.  */
+        smp_mb__after_rmw();
+        if (old == EV_BUSY) {
             /* There were waiters, wake them up.  */
             qemu_futex_wake(ev, INT_MAX);
         }
@@ -399,18 +407,19 @@ void qemu_event_set(QemuEvent *ev)
 
 void qemu_event_reset(QemuEvent *ev)
 {
-    unsigned value;
-
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
-    if (value == EV_SET) {
-        /*
-         * If there was a concurrent reset (or even reset+wait),
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
@@ -418,20 +427,40 @@ void qemu_event_wait(QemuEvent *ev)
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
             /*
-             * Leave the event reset and tell qemu_event_set that there
-             * are waiters.  No need to retry, because there cannot be
-             * a concurrent busy->free transition.  After the CAS, the
-             * event will be either set or busy.
+             * Leave the event reset and tell qemu_event_set that there are
+             * waiters.  No need to retry, because there cannot be a concurrent
+             * busy->free transition.  After the CAS, the event will be either
+             * set or busy.
+             *
+             * This cmpxchg doesn't have particular ordering requirements if it
+             * succeeds (moving the store earlier can only cause qemu_event_set()
+             * to issue _more_ wakeups), the failing case needs acquire semantics
+             * like the load above.
              */
             if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
                 return;
             }
         }
+
+        /*
+         * This is the final check for a concurrent set, so it does need
+         * a smp_mb() pairing with the second barrier of qemu_event_set().
+         * The barrier is inside the FUTEX_WAIT system call.
+         */
         qemu_futex_wait(ev, EV_BUSY);
     }
 }
-- 
2.39.1


