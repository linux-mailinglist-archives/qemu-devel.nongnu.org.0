Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CFC5FD9AC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:57:23 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixm6-0003DP-T2
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSz-0001Wr-91
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSx-00045b-Ns
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdDoyT0lop3J/es469dq/DCk1xlE21mkYbcqsSC+DX0=;
 b=KIn81dp07BH+1M+tniJbvmWhI6xzDn6Ba0CAy+YKkhXmm2e7HRN2l3Vx0Ue8XeA9x1mwdQ
 nYx5mNicF1aCVFtxauO8IVXlxo8g6YapRzZhkiKyyyrLk8soazHgEB/rAvOpSCV4L7+FVo
 iZCeN2MPzNO4Q9bg67+kPIhe0xT5bQk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-w8a-rmKzNhSTSQXl4Cu_EA-1; Thu, 13 Oct 2022 08:37:33 -0400
X-MC-Unique: w8a-rmKzNhSTSQXl4Cu_EA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso1420510edc.21
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdDoyT0lop3J/es469dq/DCk1xlE21mkYbcqsSC+DX0=;
 b=imIo8ELmyUzeza2hhwxIKS4fv3Pwr2RdIX2YozUM/owV5Zqlgcn3J5gYU2PaRwkzE8
 3izwkVZDl7shraBozSsanGpAX9s2DuHg+BWQx7B1o2KgV6dsBmsxepds3M1WRSSVpWl0
 QJXjQ8v8KHZmcZmfvZtet2CYC3KVaqA2cwz3uMD52rIizqk2IflJUuMDHm5l0rAXiVOj
 AF2C1H0933hDAXugSKAkiiiNhRyQ4Q54T9lZZ/efMCfQIusjEM6z1Qp5j/HtchpEy6Pu
 La94vOdByfyc5mvFqQ7uI3AUeUX0Fz8bdDONkR/IGNOoWogyLoABjpAGw5fmPAE490mf
 gyPA==
X-Gm-Message-State: ACrzQf1s7XklXSp/AbNdKBU7P15dBboyeIr2l3yhCj3sREHPI1IZlU+f
 ckCSj9A84+E87qiSoLGwHOxWPRM+yOg6T608VmRTqZR9eJuArYO5DOe3/+EwWrJ7mcDD/JISr5Z
 NMpAYvIzkffRCJTm5WJ/R3OEkq/v960+zM7SmWH6OcqMWxdHH1qqJafcPKmiI+aX146I=
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id
 fj2-20020a1709069c8200b0078157524f2bmr25415489ejc.561.1665664651530; 
 Thu, 13 Oct 2022 05:37:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DQJlBZrnDp3dsbbIIJqLFiOqxzPqTOoh/03Vhrn3c0QE1K7INt9j5INmeaudMpCB4HB2ZMA==
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id
 fj2-20020a1709069c8200b0078157524f2bmr25415469ejc.561.1665664651220; 
 Thu, 13 Oct 2022 05:37:31 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090653c700b0078d175d6dc5sm2902764ejo.201.2022.10.13.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 06/24] coroutine-lock: add missing coroutine_fn annotation to
 prototypes
Date: Thu, 13 Oct 2022 14:36:53 +0200
Message-Id: <20221013123711.620631-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

The functions are marked coroutine_fn in the definition.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index aae33cce17..d848489b65 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -276,7 +276,7 @@ void qemu_co_rwlock_init(CoRwlock *lock);
  * of a parallel writer, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_rdlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
 
 /**
  * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
@@ -285,7 +285,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock);
  * to the caller of the current coroutine; another writer might run while
  * @qemu_co_rwlock_upgrade blocks.
  */
-void qemu_co_rwlock_upgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
 
 /**
  * Downgrades a write-side critical section to a reader.  Downgrading with
@@ -293,20 +293,20 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock);
  * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
  * may also sometimes be necessary for correctness.
  */
-void qemu_co_rwlock_downgrade(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock);
 
 /**
  * Write Locks the mutex. If the lock cannot be taken immediately because
  * of a parallel reader, control is transferred to the caller of the current
  * coroutine.
  */
-void qemu_co_rwlock_wrlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock);
 
 /**
  * Unlocks the read/write lock and schedules the next coroutine that was
  * waiting for this lock to be run.
  */
-void qemu_co_rwlock_unlock(CoRwlock *lock);
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock);
 
 typedef struct QemuCoSleep {
     Coroutine *to_wake;
-- 
2.37.3


