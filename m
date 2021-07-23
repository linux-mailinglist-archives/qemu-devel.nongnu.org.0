Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98183D40FC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:39:32 +0200 (CEST)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7119-0008WI-Sm
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wk-0006EY-BL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wj-0002NI-0g
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nJr1OIK9JzzTcb6zN39xsOpq6xGnkL38wz1B933W1o=;
 b=QO++jyhs9+ju9iEq44XNhqHao/0kolVHX62wHrWnBAfLZVXRTQtS6T0mRbB21WzxypnrrD
 ueScEa5xgAGu0YJvc7lunamKbUWJJuf4gUWh2vEf8T2UzvynZb3t/hZGGz3duhHDaRpVVI
 ciVm5da+ydMoN1YDKWaKzJcw8B2m1mI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-DxTyuV3qPx-UEnQgH4Gj3g-1; Fri, 23 Jul 2021 15:34:55 -0400
X-MC-Unique: DxTyuV3qPx-UEnQgH4Gj3g-1
Received: by mail-qv1-f69.google.com with SMTP id
 kl8-20020a0562145188b02902e01fc8ee77so2350950qvb.21
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nJr1OIK9JzzTcb6zN39xsOpq6xGnkL38wz1B933W1o=;
 b=Azfi2T++nngwtCtBIVoRTEDS1ooqPGbEszuucU7/nCjuAd0ffIx+wBAbU2eNePBtED
 PJ3oEmLLAXbAV6XIHaW4AGZB2x8trnzMoA+B+f7YBtHdPGIMvhLmOW7dBz8m9NL65/7t
 7HPIQ64Lhh7OmLCD+FbuyklHOAaNS+r7hQFUjLi1eet8P5M+ipXReYNJlzkREI71oN+k
 ObsRrVx/+4nXZUylGzzZif3BXUxg8BcsDgIb6JCErfxKZMIqvpXEDnUz8p8bk3YRINnd
 5Q6JswpXs7cBrUCTKxS2ryWUcL/+mJwVN7A3RG6rXAum42KdUU7bX5cjm6YaS34Kl6JG
 f6Xw==
X-Gm-Message-State: AOAM530DidLV9qHe8bXvMVjjMjZNqI/DGm92cb73TyXrIuXp3FSbWADn
 J2+3i/XOSBpm4zzj0ALQLBQMa7bWeNNLJ9CtWE7f+Y/30JZCjIJbtWyG9lOnlOTuiZ6T4JO5M7L
 geCY36YFSAhrfre6q7oti49N6B1WNQqK6VZvmfV8kHJR6gubqHD/+tlijYKqHedul
X-Received: by 2002:a05:622a:118b:: with SMTP id
 m11mr5365852qtk.4.1627068894235; 
 Fri, 23 Jul 2021 12:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVgx/1MPdWQqQu5JCFh8k64eflGOMGofHgj5uGDlwt6au7QdIxNaC0Jb6i7Lz7xsHNvX9gnQ==
X-Received: by 2002:a05:622a:118b:: with SMTP id
 m11mr5365835qtk.4.1627068893946; 
 Fri, 23 Jul 2021 12:34:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:52 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] memory: Introduce
 memory_region_transaction_{push|pop}()
Date: Fri, 23 Jul 2021 15:34:38 -0400
Message-Id: <20210723193444.133412-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_transaction_{begin|commit}() could be too big when finalizing a
memory region.  E.g., we should never attempt to update address space topology
during the finalize() of a memory region.  Provide helpers for further use.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..1a3e9ff8ad 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1079,10 +1079,20 @@ static void address_space_update_topology(AddressSpace *as)
     address_space_set_flatview(as);
 }
 
+static void memory_region_transaction_push(void)
+{
+    memory_region_transaction_depth++;
+}
+
+static void memory_region_transaction_pop(void)
+{
+    memory_region_transaction_depth--;
+}
+
 void memory_region_transaction_begin(void)
 {
     qemu_flush_coalesced_mmio_buffer();
-    ++memory_region_transaction_depth;
+    memory_region_transaction_push();
 }
 
 void memory_region_transaction_commit(void)
@@ -1092,7 +1102,7 @@ void memory_region_transaction_commit(void)
     assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    --memory_region_transaction_depth;
+    memory_region_transaction_pop();
     if (!memory_region_transaction_depth) {
         if (memory_region_update_pending) {
             flatviews_reset();
-- 
2.31.1


