Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7851FB13
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:13:46 +0200 (CEST)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Kj-0002rQ-2B
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fu-0005L1-C0
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fp-000371-7t
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1ImhP8nQI3nDHWkOKXvAHXmp0Nf/es+1XlM7xHuiCI=;
 b=FNxzZ7p3bWmRb/oiac7IlEhRF8XJtI4SsxdDm0aFHCfdWUMtuH1ZruwN0m6YUxPZa4AoUx
 K+4mXT3RgtIXnitd+6otk/0cb4mx8dk33k34Hcvd0U0BUEl2sZT1+TxoCHP8bW4z4ktzeR
 I4nz00ix7UYXGpNnCTFbhM0LARLImfk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-DnO5QeK_ODymTAQc-FvXJQ-1; Mon, 09 May 2022 06:31:23 -0400
X-MC-Unique: DnO5QeK_ODymTAQc-FvXJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso9699711wma.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1ImhP8nQI3nDHWkOKXvAHXmp0Nf/es+1XlM7xHuiCI=;
 b=eeQbBMiJjD/gc6GWcXpE2cTMigtluXMlVUL9VfC5knY+DVDUaFzB4RJ6M1RVnl5igU
 pJEEAzrg+yf5mDhNDs+n06Q3k15kTC9XejEHIzfQ8ffqdJgAFu238lcpKQn8qkExczHZ
 sONtlQR3VMCENMueiBk61nGc0sWh514qNpLa5j8ggbAuk5sbAL5TaZ+SC2qsc0PHupbv
 zdp1jdnX5hWql6PMF/Zf8S1T2V0CxtS5LCiMQxiCv2008b2U/LgbMOl9xjvXaCHltjbp
 WM4yiq4KM2rIpBm+lRsH87ozjNaXkEUxE9MZosZCeR7OUkZw5n4Q1qUECXPa0wQulbIw
 X3/A==
X-Gm-Message-State: AOAM531EZ++Z+b/KK1KM3WxwwskpC8qeiq5Co1jWTSYE/TK57vZazGOR
 83yDxd1xlwu+Le8OIX1BnPclsr83owDC21WvD4vh37S8sU9tsPGdY5OH4XAtPXaUmsOUM+E9B0I
 a85xbAlDWZwy8clDYnibzxFZfkvJtEIfD6YGgGrBcSUWlozzC4IIB/G0qNJ23cAi1DFM=
X-Received: by 2002:a05:600c:354e:b0:394:89ba:e211 with SMTP id
 i14-20020a05600c354e00b0039489bae211mr6820325wmq.86.1652092281733; 
 Mon, 09 May 2022 03:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwrtmejcE2KvtHcKKSIUg1n/w9WJliHPzsKywv9QEaldkHqgD+BrWM3jFbztDrxxNIF1AD3g==
X-Received: by 2002:a05:600c:354e:b0:394:89ba:e211 with SMTP id
 i14-20020a05600c354e00b0039489bae211mr6820292wmq.86.1652092281290; 
 Mon, 09 May 2022 03:31:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a1cf701000000b003942a244ed6sm13037466wmh.27.2022.05.09.03.31.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/26] coroutine-lock: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:15 +0200
Message-Id: <20220509103019.215041-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..ec55490b52 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -144,7 +144,7 @@ typedef struct CoWaitRecord {
     QSLIST_ENTRY(CoWaitRecord) next;
 } CoWaitRecord;
 
-static void push_waiter(CoMutex *mutex, CoWaitRecord *w)
+static void coroutine_fn push_waiter(CoMutex *mutex, CoWaitRecord *w)
 {
     w->co = qemu_coroutine_self();
     QSLIST_INSERT_HEAD_ATOMIC(&mutex->from_push, w, next);
@@ -341,7 +341,7 @@ void qemu_co_rwlock_init(CoRwlock *lock)
 }
 
 /* Releases the internal CoMutex.  */
-static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+static void coroutine_fn qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 {
     CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
     Coroutine *co = NULL;
@@ -374,7 +374,7 @@ static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
     }
 }
 
-void qemu_co_rwlock_rdlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -399,7 +399,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_unlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -417,7 +417,7 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_downgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners == -1);
@@ -427,7 +427,7 @@ void qemu_co_rwlock_downgrade(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_wrlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -447,7 +447,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_upgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners > 0);
-- 
2.35.1


