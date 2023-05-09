Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E296FC250
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHR-0005EQ-PV; Tue, 09 May 2023 05:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHN-0005DU-2U
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHL-0004ip-8i
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbuSBHr1MC6PAa/zfDpEwyHM5lMDqO3acWiR6BPy9jk=;
 b=Y9LzrMerE9CJw+UNXwzhXZ+caHRh4lCSmWWPR6O+iq10cf3LrFH7OxZR7TFZvvqvjcWdYx
 B7OEnv5iErS0CUvpupbOh0v1+I7CzTpl/kLNLHhwH7qP0XwylXioUuaE0Pxrm3tUmvyvrN
 ZTZZ+GUMPIpk6B763Vw0R98Oni/xpt0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-xrKvDfkBO7eOCGd77_-8WQ-1; Tue, 09 May 2023 05:05:01 -0400
X-MC-Unique: xrKvDfkBO7eOCGd77_-8WQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-969ea6699fdso70885466b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623099; x=1686215099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbuSBHr1MC6PAa/zfDpEwyHM5lMDqO3acWiR6BPy9jk=;
 b=E7ahUv3gw9wjFdhAMQz0PO9319LfgxDxGz7c8/4I+5JbnfEAHN+rfktEhWa2sp9E7r
 K6wbvwtWNzFV35nPnquT3cDrkLn3APKJhGTcMiVozbu86MQ4eAO0HvarxiF9BFEolTXb
 wEbAZGT3GEjMFayoKfTXHf4Kfu8rs8j2LHmx8wnKlBSU4BbhkX7AORXcqjeJ0XDAXljA
 woVioKropENKQghTOWJj84SwpUKesMakYLAYqyJ5+VRC3Y3n+l+z5o+uiBK1odYuqFd4
 lFCXVAYuErHCtFpde5V239kqB6GDQO+kWn1qb6+qPEo/W3pyc21urOBNb4D8ialjVfoT
 WXxg==
X-Gm-Message-State: AC+VfDzx1QU1eULHbEydOeyaFbcnsefofE5FZrgNU75tA7zL2qmUH1uQ
 Jzg2RiazkldCGTrDEAk4geCdmywU/TUKkJpMPAbUee6RAggiqJzS5si6lWZkaBgCxW2froXAna5
 eisE7+zj9fnP9WsqMhBACQhzbYqmSRTUeQZMX9+29htW23z3UeFHHXDaZYcgLC93sQVPQkh/SWH
 0=
X-Received: by 2002:a17:907:6d0b:b0:965:5cba:4a16 with SMTP id
 sa11-20020a1709076d0b00b009655cba4a16mr11999489ejc.77.1683623099564; 
 Tue, 09 May 2023 02:04:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5LWxvhnVXExdpEpRa5LmpZydZ0TKL8B5LRAuqbFL3lgh5w83DCZuU7JBz1YJNTpSiJnMi/BQ==
X-Received: by 2002:a17:907:6d0b:b0:965:5cba:4a16 with SMTP id
 sa11-20020a1709076d0b00b009655cba4a16mr11999466ejc.77.1683623099196; 
 Tue, 09 May 2023 02:04:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gf25-20020a170906e21900b0094edfbd475csm1035216ejb.127.2023.05.09.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:04:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/16] rcu: remove qatomic_mb_set, expand comments
Date: Tue,  9 May 2023 11:04:38 +0200
Message-Id: <20230509090453.37884-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.40.1


