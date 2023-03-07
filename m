Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02426ADDD8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjO-0006g0-MK; Tue, 07 Mar 2023 06:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjM-0006Us-QK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjL-0008FO-2m
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSkvATht7CbRsghwuS5jLyOCAgTCld6ffCjxjQQFVDc=;
 b=HtpI4KxoTdfzL+fwSi4md0D+X2VdP+5FYzmDsAJfE/VLdYGWrdIhwRJz708Cgrgw2IEtZb
 SfDItDLZeMt33qmLEiQvD8rQ6cHuaHUQS1/lcoNd79bSMD3fF36sIkXQUDVH6Ck8z0U/ua
 UDa42SPVrOD89HzGQ1RPKWS5gCcbrn0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-dL3Jj-zlNVKaJ3DKxTAlJw-1; Tue, 07 Mar 2023 06:43:41 -0500
X-MC-Unique: dL3Jj-zlNVKaJ3DKxTAlJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so8379315eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSkvATht7CbRsghwuS5jLyOCAgTCld6ffCjxjQQFVDc=;
 b=MJ9ZiPZHcat1Cz8NnEFl8dtlCGROdhPYvbdORrfDslxxMYcv5l+1+KpdjmSJWdBn3H
 7nMbjwO7V7vo4PjugCkzgerGi/HIVSIt+Zvh6M9djkLXQtvDQHszwniAvvrMzkIVgIDf
 Tg+YAs6abBFW74yJv7EL0VbiE/pqb2Cr7LVBlfW9HAcZoVw4MTzG+JZiBdRX9dR30R8y
 RjmGafpakAMSsVSH7Y0WCGZ2UpACxf5fR7u6U+kMkf7XbfREYUZr50h3UZhNL+KsN4RD
 8gCF4uk9H0ZCF+d9UJhkk1ma0EsDv9YxsGnKvAbBU9WNjh0mRnVeLLU1Eq/i3pAJfOx/
 yd4w==
X-Gm-Message-State: AO0yUKXt5+9a5V5+EB+rLp7/AywlGf+0APghaoLeHj+rXRnY7CMxQpLW
 7S1J+vNK7bUW4tWt+b2ldKSFZPoMzioxKBpn+z/XiQSOtFQAF5u8vdEzbX0scpSvEwtD+S7zVea
 TV8K+ypscY2gKfAx1i4K2MEufuxJ8TxYbbMwaPdi3vaLSIkwqwhDrHIlxOXTZBWVD5QOVWyfYGf
 E=
X-Received: by 2002:aa7:c44e:0:b0:4b8:9a32:ec07 with SMTP id
 n14-20020aa7c44e000000b004b89a32ec07mr11946140edr.39.1678189419719; 
 Tue, 07 Mar 2023 03:43:39 -0800 (PST)
X-Google-Smtp-Source: AK7set917WSe64k1idcaRQhtSc+TWxrQYZ1U4yRiQtC/AUtTMaexrio7sDlwR9QSxl1Dz3XrpIN17w==
X-Received: by 2002:aa7:c44e:0:b0:4b8:9a32:ec07 with SMTP id
 n14-20020aa7c44e000000b004b89a32ec07mr11946129edr.39.1678189419420; 
 Tue, 07 Mar 2023 03:43:39 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a508a93000000b004c3e3a6136dsm6559443edj.21.2023.03.07.03.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 3/9] qemu-thread-win32: cleanup, fix, document QemuEvent
Date: Tue,  7 Mar 2023 12:43:23 +0100
Message-Id: <20230307114329.158094-4-pbonzini@redhat.com>
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
index 69db254ac7c1..a7fe3cc345f0 100644
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


