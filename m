Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF46F160A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:51:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLgr-00073f-4P; Fri, 28 Apr 2023 06:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLgp-00073X-5y
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLgm-0003Sz-Vw
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M9BwZWX83XEr1/tBB+cKe+g4P/wyrCYw+NaEwBd0zFY=;
 b=KDKhmI3C1H50hDvEfBC3utZvTnDIY3+VewtsJFEtraNA2yruPRi8AHOsK5DCxmoC3PLDCo
 s64xlETRr6cTAPv/ROrxwXx6HUwBEYbaqL1x69+3nXHdBSTs/vN9fWm6Hh5OnJEySvD9XC
 TmJmLbrBCD2R3Z14cxq6L0MESmYRuGA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-z3l7jZwXPPyBGrPurRnG5Q-1; Fri, 28 Apr 2023 06:50:54 -0400
X-MC-Unique: z3l7jZwXPPyBGrPurRnG5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f96ecfb40cso3592998f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682679037; x=1685271037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9BwZWX83XEr1/tBB+cKe+g4P/wyrCYw+NaEwBd0zFY=;
 b=dkDRRldKgjQHHxaSElwjf/q6lU+iboMg1U1ctWZWjzAPL5Ac1M0fLo5ZawSBRw3jDw
 MwO3wl7HlAP5Y75nEGcJ7eUXa4+7KhfR56j2a5XdBHb2RWg3cKl6k0XTbFPQjYXQ9cR1
 hsz6JngF1n6SQwovRadBNQ5zod03bUqwPTOMsmpfdWf3JctGHHJF2b+mPZYlCMSjRVCD
 tYr2xkWiqAVfXP4FBcEUPnQafFtZIGpviA3cX3UxHlK0Wa9+TyUt3N2KdOM703GDtZ1y
 Iy/8l6GBlnwwybwEt39x0vTPGR9bpdelWfGJk41sClTiTWPfsRRN66Wek2wSyRAXlaio
 iHXw==
X-Gm-Message-State: AC+VfDx5vGRqLM1/4Q1ErgWbbMPl1dvrPtG0Xh8odOGP0dze9BjiTrs/
 77afleOq7Z3L0E6jZQhOgK5Owis9fHKuIzygGxVQr3PEd3ROvtS1Wm7GQxTX40X2RJhgxNLlDgf
 /luS5j0uMcYxI1+ky2+9BSgZFDNJfMD/SYDz4DUCIo6z6RGLeaEl1Z+dW/v+KgD2g69FuLqpvpu
 8=
X-Received: by 2002:adf:ebcd:0:b0:2ff:1e0f:fb2 with SMTP id
 v13-20020adfebcd000000b002ff1e0f0fb2mr3168600wrn.13.1682679037212; 
 Fri, 28 Apr 2023 03:50:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5fdYucJNpXPQwuXtSfQC6J2NDa3U4xKPZTPgrv92pMoVb7KpXf8JHeDn5IJHE3ku3tBTdDOQ==
X-Received: by 2002:adf:ebcd:0:b0:2ff:1e0f:fb2 with SMTP id
 v13-20020adfebcd000000b002ff1e0f0fb2mr3168586wrn.13.1682679036677; 
 Fri, 28 Apr 2023 03:50:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adff008000000b002f6176cc6desm20833351wro.110.2023.04.28.03.50.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:50:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] rcu: remove qatomic_mb_set, expand comments
Date: Fri, 28 Apr 2023 12:50:35 +0200
Message-Id: <20230428105035.134089-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/rcu.h |  5 ++++-
 util/rcu.c         | 24 +++++++++++-------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 313fc414bc2a..661c1a146872 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -87,7 +87,10 @@ static inline void rcu_read_lock(void)
     ctr = qatomic_read(&rcu_gp_ctr);
     qatomic_set(&p_rcu_reader->ctr, ctr);
 
-    /* Write p_rcu_reader->ctr before reading RCU-protected pointers.  */
+    /*
+     * Read rcu_gp_ptr and write p_rcu_reader->ctr before reading
+     * RCU-protected pointers.
+     */
     smp_mb_placeholder();
 }
 
diff --git a/util/rcu.c b/util/rcu.c
index b6d6c71cff5c..e5b6e52be6f8 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -83,12 +83,6 @@ static void wait_for_readers(void)
          */
         qemu_event_reset(&rcu_gp_event);
 
-        /* Instead of using qatomic_mb_set for index->waiting, and
-         * qatomic_mb_read for index->ctr, memory barriers are placed
-         * manually since writes to different threads are independent.
-         * qemu_event_reset has acquire semantics, so no memory barrier
-         * is needed here.
-         */
         QLIST_FOREACH(index, &registry, node) {
             qatomic_set(&index->waiting, true);
         }
@@ -96,6 +90,10 @@ static void wait_for_readers(void)
         /* Here, order the stores to index->waiting before the loads of
          * index->ctr.  Pairs with smp_mb_placeholder() in rcu_read_unlock(),
          * ensuring that the loads of index->ctr are sequentially consistent.
+         *
+         * If this is the last iteration, this barrier also prevents
+         * frees from seeping upwards, and orders the two wait phases
+         * on architectures with 32-bit longs; see synchronize_rcu().
          */
         smp_mb_global();
 
@@ -104,7 +102,7 @@ static void wait_for_readers(void)
                 QLIST_REMOVE(index, node);
                 QLIST_INSERT_HEAD(&qsreaders, index, node);
 
-                /* No need for mb_set here, worst of all we
+                /* No need for memory barriers here, worst of all we
                  * get some extra futex wakeups.
                  */
                 qatomic_set(&index->waiting, false);
@@ -149,26 +147,26 @@ void synchronize_rcu(void)
 
     /* Write RCU-protected pointers before reading p_rcu_reader->ctr.
      * Pairs with smp_mb_placeholder() in rcu_read_lock().
+     *
+     * Also orders write to RCU-protected pointers before
+     * write to rcu_gp_ctr.
      */
     smp_mb_global();
 
     QEMU_LOCK_GUARD(&rcu_registry_lock);
     if (!QLIST_EMPTY(&registry)) {
-        /* In either case, the qatomic_mb_set below blocks stores that free
-         * old RCU-protected pointers.
-         */
         if (sizeof(rcu_gp_ctr) < 8) {
             /* For architectures with 32-bit longs, a two-subphases algorithm
              * ensures we do not encounter overflow bugs.
              *
              * Switch parity: 0 -> 1, 1 -> 0.
              */
-            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
+            qatomic_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
             wait_for_readers();
-            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
+            qatomic_set(&rcu_gp_ctr, rcu_gp_ctr ^ RCU_GP_CTR);
         } else {
             /* Increment current grace period.  */
-            qatomic_mb_set(&rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR);
+            qatomic_set(&rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR);
         }
 
         wait_for_readers();
-- 
2.40.0


