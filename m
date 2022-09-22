Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3965E5FB5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:20:43 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJJy-0003J7-W1
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuI-0004Xp-Ey
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuF-0003OS-KN
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlRpmw13yJeY3J6UUIbgkGjukH3jdpT3L4F+RsRzNo4=;
 b=YanAbPBMjD9QymQ3XkjtkJtODQfVAZjyExHoh+nwz6jTYxGaqWvrwH0zNKqB0jIDgN9HSI
 oWU9vkue2dMDEvM6z2leVfuAKXJVZ+hdhBoJYgd4hSA3SsitzLRj29dHZkSMAc/rHZpPcK
 9pTSQ8KZD660KKJjgffXDoeV4p9Ojjs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-6LSp7yXeNUGOfMBn5JBU5A-1; Thu, 22 Sep 2022 04:50:00 -0400
X-MC-Unique: 6LSp7yXeNUGOfMBn5JBU5A-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a05640226c500b00451ec193793so6220131edd.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jlRpmw13yJeY3J6UUIbgkGjukH3jdpT3L4F+RsRzNo4=;
 b=gD+wSFvOsajbtGaJ+VBxgpIyCC4HF5vujjgRwN0oX0w/73bObxHRBEXZPyulF2Ritk
 WtqFdbv17+UuR4+tmfpoOMqGTMTEvQfuDzmjoIy8H4Kz7Rv6T547lyjtPIXtY+yBcNQf
 cn+LHgXVWk1AW3PHFR8p4LuqOO9IwMxKVTMuW7knZhcL44gASNnPqPEUD6Svk2gFkZbD
 LSh9kqWd/lw9SaUWsVcJxywEb+Iz5P8FY2RrhXq8WfaWh1Ewg+Tf5z4aA5pi0z1ul6To
 Zq5f1hxienQqGFYf2o6TiJirRt1nq7vlF/vFiPdC2i1weOG67mIqeEAepSjTBbGx9rmp
 kByw==
X-Gm-Message-State: ACrzQf1k/lo4jzFD1zmcGbAonUk3Bn86tN+BXPy8MJGtIhCMD/FKwcRd
 puvqj3yPDQzWOqeJeG5iceRGMp/sxfZt9WeCHYFfnUrnAQAxaAmLoBew9Gwb8+nhGCyA3arlc5h
 9iyIcCeGoMwIjXfd4Np+Nmbt0eyiVSc/rdcyUNQJLLSIipOJj/uZ84Y/vnwXgNeTUNFE=
X-Received: by 2002:a17:907:97d1:b0:780:26c9:1499 with SMTP id
 js17-20020a17090797d100b0078026c91499mr1793143ejc.371.1663836598852; 
 Thu, 22 Sep 2022 01:49:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72rT8ihUE4xzn+H1NVMPs5/DtDo1rot23CMOz7Tg0ofooezRv1uP6pznS7C177EOeS5DwIFA==
X-Received: by 2002:a17:907:97d1:b0:780:26c9:1499 with SMTP id
 js17-20020a17090797d100b0078026c91499mr1793120ejc.371.1663836598592; 
 Thu, 22 Sep 2022 01:49:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a056402414e00b0043bea0a48d0sm3297390eda.22.2022.09.22.01.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 22/26] coroutine-lock: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:20 +0200
Message-Id: <20220922084924.201610-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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


