Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB163D40E5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:36:45 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70yR-0000Id-Gq
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wi-0006Cl-9X
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wf-0002M3-GR
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+1Gg6Qd3Ft2AlRxiHvpmsB+B0uldsPLxouTTAZo0PI=;
 b=Rq67QRnx8zG+FjjK0/2Ww91GIqL5NLc4rO7gZk1+bXA7BlnGUiMy7AnDEr7glBMFbTQ1H3
 5XqP3tzFu3HlHVjzcImbKtD9Z+a6PyYe9GJaXZ/+Km7NK5bNIaSpCI6AEE/UW2DC7nJGx5
 zoRc0dv/Ll/ByzBnvy/hSy39tL721RE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-dRRlGShJPP6Z8wfaQbyslg-1; Fri, 23 Jul 2021 15:34:51 -0400
X-MC-Unique: dRRlGShJPP6Z8wfaQbyslg-1
Received: by mail-qv1-f71.google.com with SMTP id
 15-20020a0562140dcfb02902e558bb7a04so2453302qvt.10
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+1Gg6Qd3Ft2AlRxiHvpmsB+B0uldsPLxouTTAZo0PI=;
 b=OY751rltg72WPnNbG4hRw2eAzrNDwRQrM81nPXRmOCOcyJ3VTgsyihW/n+N2xoOC0n
 vzJ9EffC2dVy7kpFNKz4pTJPOpIHvz14NUhE55ne9DWjWcpvCehK/FXEqbM6qpzAhJiq
 UxGZkMjqBMHPSg1iTWC8hXILZaOin9gmwYYpGQ2WiNFXCuZ0Y3HYE9/5w04ieINIuvVM
 bXe7r9OJZ6RhBsxvnzw76YUD9QLQV+rnJc4Sf74pFZ/KmuyWTRSKR42sOfsA7ZiG79TM
 lGpvAC2NxOPtyIl0c/o0Y7CPwNWYu8nCtgEUPqQ5e24JsPLczX/8ba7DCBq/EZlynKmE
 oAtQ==
X-Gm-Message-State: AOAM530ISrAKEIkJjlTepFjQxq9G4iXYvoTcO6iAjN4nuQotCHpNdk6M
 K9mcjw7wcZD2gAtofQhjcmVTJwNtk7JPaeBFyZl0ZRFowCPRC1sE+6Pz4lYtGtFil1KH/gEcLpP
 UCicE68eYCH/qn2Ismfg8Ea4IuVSFjBk9qfWYa2oSC17N5d+fqnVPhqUxYolEgjw7
X-Received: by 2002:ac8:5546:: with SMTP id o6mr5393563qtr.69.1627068890676;
 Fri, 23 Jul 2021 12:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynU7kl1qIcfZA9Ydi42l2IddQ51VSSTc8+/qUuRaDgW9Kj+uTEmXI1CPy72LcvW5ETsAq4VQ==
X-Received: by 2002:ac8:5546:: with SMTP id o6mr5393539qtr.69.1627068890387;
 Fri, 23 Jul 2021 12:34:50 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] cpus: Export queue work related fields to cpu.h
Date: Fri, 23 Jul 2021 15:34:36 -0400
Message-Id: <20210723193444.133412-2-peterx@redhat.com>
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

This patch has no functional change, but prepares for moving the function
do_run_on_cpu() into softmmu/cpus.c.  It does:

  1. Move qemu_work_item into hw/core/cpu.h.
  2. Export queue_work_on_cpu()/qemu_work_cond.

All of them will be used by softmmu/cpus.c later.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 11 ++---------
 include/hw/core/cpu.h | 10 +++++++++-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e58d..d814b2439a 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -27,7 +27,7 @@
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
 static QemuCond exclusive_resume;
-static QemuCond qemu_work_cond;
+QemuCond qemu_work_cond;
 
 /* >= 1 if a thread is inside start_exclusive/end_exclusive.  Written
  * under qemu_cpu_list_lock, read with atomic operations.
@@ -114,14 +114,7 @@ CPUState *qemu_get_cpu(int index)
 /* current CPU in the current thread. It is only valid inside cpu_exec() */
 __thread CPUState *current_cpu;
 
-struct qemu_work_item {
-    QSIMPLEQ_ENTRY(qemu_work_item) node;
-    run_on_cpu_func func;
-    run_on_cpu_data data;
-    bool free, exclusive, done;
-};
-
-static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
+void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
 {
     qemu_mutex_lock(&cpu->work_mutex);
     QSIMPLEQ_INSERT_TAIL(&cpu->work_list, wi, node);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564ce..f62ae88524 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -243,7 +243,15 @@ typedef union {
 
 typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
 
-struct qemu_work_item;
+struct qemu_work_item {
+    QSIMPLEQ_ENTRY(qemu_work_item) node;
+    run_on_cpu_func func;
+    run_on_cpu_data data;
+    bool free, exclusive, done;
+};
+
+void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi);
+extern QemuCond qemu_work_cond;
 
 #define CPU_UNSET_NUMA_NODE_ID -1
 #define CPU_TRACE_DSTATE_MAX_EVENTS 32
-- 
2.31.1


