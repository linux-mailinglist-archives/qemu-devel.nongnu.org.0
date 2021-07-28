Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619E3D9564
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:38:43 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oS2-0001ra-IG
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLn-0006EP-MK
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLj-00079p-QX
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5Slmf2i54K2urMqTX3wgmu72x7kFks3at6kBlMJW5o=;
 b=X+6OOHhlFD3HGTVwtmDtjjx5GoCE4vyCnA+5lSKPCdTw9IgV/PCRTZZ2AVNSTMIWNVF66B
 AKJZvGjji3KAd0QCLd69Zy3z+UH2Qq/Dn+ml9p1Qsfj1nfhVRYnM4uKgvMDfR/+IhDOgkj
 KWsVhJQl+QmkBWhUxHQWoksIUC1EeXs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-Zw1IQQxGMj6kF2ezpFuBgQ-1; Wed, 28 Jul 2021 14:32:08 -0400
X-MC-Unique: Zw1IQQxGMj6kF2ezpFuBgQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 j13-20020a0cf30d0000b029032dd803a7edso2489307qvl.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5Slmf2i54K2urMqTX3wgmu72x7kFks3at6kBlMJW5o=;
 b=d41YRFG1Z81xrupNUNPL4pUQkt6bRVAElc4ttQvtKyl8obKBqcJl4GSRizK9/fHCWg
 Kh3uqFbGNj1z6nZGtbMPD04tsUJ/aWH4aNMDBnxH6vkX4sG/MMxgwpGq1JQ17h6iJhRE
 KO455Fs9Jvjm7E/AVwcXk+96UUSmOh/t3SibA8xKnXVgdKGgvYfL4WgVkLvVrH/xXqmZ
 Bv5b2VUPEicYpT5KleGp8NFBr0dRAMb87Wt03ELl0zArJl6eKtXfupnthWAcgdZQflpu
 WgWxSQL2lTRv4i9KSl8jDwnSuC7SWwRp7T/0/2jjGo8p5p+tVazKgQWcbVWkCUKdp42H
 fnyg==
X-Gm-Message-State: AOAM532t7sh6BO/jiR8UqNhYoYlp76KYOocMsVwbezxDNEA2ENWe+Tz3
 /Gg/CGPIXrkTvkSW2RRIGqp3bdMeHbNb0DTHDzFgByYu/vzUSNZagVN+wdL1v1jCj1P1PE7Iw3Q
 Xz8+/6DVfWg3n2HmASnFENAMKj0AD+qBGrSQ3z6lPThTtiWSViEpwPdIE1ba1kFLr
X-Received: by 2002:ad4:4442:: with SMTP id l2mr1080170qvt.2.1627497127101;
 Wed, 28 Jul 2021 11:32:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZe5u2WJsfh9BacRTr3laH/AP0S2k1YYGAMpHiBEhLlsaQGmazmvIBrvDu3JwujMWeNRuGYQ==
X-Received: by 2002:ad4:4442:: with SMTP id l2mr1080153qvt.2.1627497126860;
 Wed, 28 Jul 2021 11:32:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:32:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] memory: Assert on no ongoing memory transaction before
 release BQL
Date: Wed, 28 Jul 2021 14:31:50 -0400
Message-Id: <20210728183151.195139-8-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firstly, add a "prepare" function before unlocking BQL.  There're only three
places that can release the BQL: unlock(), cond_wait() or cond_timedwait().

Make sure we don't have any more ongoing memory transaction when releasing the
BQL.  This will trigger an abort if we misuse the QEMU memory model, e.g., when
calling run_on_cpu() during a memory commit.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory-internal.h | 1 +
 softmmu/cpus.c                 | 9 +++++++++
 softmmu/memory.c               | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 9fcc2af25c..3124b91c4b 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -35,6 +35,7 @@ static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
 
 FlatView *address_space_get_flatview(AddressSpace *as);
 void flatview_unref(FlatView *view);
+bool memory_region_has_pending_transaction(void);
 
 extern const MemoryRegionOps unassigned_mem_ops;
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 9154cd7e78..4d190f9076 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
+#include "exec/memory-internal.h"
 #include "sysemu/hw_accel.h"
 #include "exec/exec-all.h"
 #include "qemu/thread.h"
@@ -66,6 +67,11 @@
 
 static QemuMutex qemu_global_mutex;
 
+static void qemu_mutex_unlock_iothread_prepare(void)
+{
+    assert(!memory_region_has_pending_transaction());
+}
+
 bool cpu_is_stopped(CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
@@ -520,16 +526,19 @@ void qemu_mutex_unlock_iothread(void)
 {
     g_assert(qemu_mutex_iothread_locked());
     iothread_locked = false;
+    qemu_mutex_unlock_iothread_prepare();
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
 void qemu_cond_wait_iothread(QemuCond *cond)
 {
+    qemu_mutex_unlock_iothread_prepare();
     qemu_cond_wait(cond, &qemu_global_mutex);
 }
 
 void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
 {
+    qemu_mutex_unlock_iothread_prepare();
     qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 35b2568fc2..62ec00b52d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -176,6 +176,12 @@ static bool memory_region_has_pending_update(void)
     return memory_region_update_pending || ioeventfd_update_pending;
 }
 
+bool memory_region_has_pending_transaction(void)
+{
+    return memory_region_transaction_depth ||
+        memory_region_has_pending_update();
+}
+
 static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
                                            MemoryRegionIoeventfd *b)
 {
-- 
2.31.1


