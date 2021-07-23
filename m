Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602F3D40F9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:38:30 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7109-0005kF-H6
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wq-0006V2-CS
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wo-0002RM-SE
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvPN0aH3/5SMjris6GibIvLCqdDoM69TD+/vZGC1aH4=;
 b=HIa+DsB7JfBONrID03YpKPSdo3RkU3HJfs5sWZ2mhRn/T6AI+2Ih2+XN1Gwx5Fmau2TKAc
 y6X3vI2JwvlNm9AILeqLiZY8Ss0qTW3N+jUrlJMFKedn+dDt+rZ9p63n3e+w6FnuBKJq3A
 DKsfABqrrmfV+tmNG8u9dLxY53ynQ24=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-PaD_ZgVDNYSAI2qHwjcM9g-1; Fri, 23 Jul 2021 15:34:59 -0400
X-MC-Unique: PaD_ZgVDNYSAI2qHwjcM9g-1
Received: by mail-qk1-f200.google.com with SMTP id
 u22-20020ae9c0160000b02903b488f9d348so1850704qkk.20
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvPN0aH3/5SMjris6GibIvLCqdDoM69TD+/vZGC1aH4=;
 b=tmnImGP+Y3DBakyTj+nw2MsEy8YZ8CI1uyn+jrY7tXF/BWr3L8nMz6kIggwqxMlCoV
 3EUVmsw8IfARAT1xxSZRra+UD5gh6aGxsOvjFNEzZ6orwvOLUqEDJ9LM0VSQ+iN/4rnO
 MDEve9+d/P1cc+1fVE3NVCW4MbHXVsG9gCiSRksOsBzjq/+TVDriG8oygZ/zZui9rvUP
 ck6gWV9pyheSQujVN28bUeWvz/1DFCUwLG0ZKR0/yHfu/Hg5nrgzX+iOIAFqy9ayKGLD
 Dg9IFAPZDPbLICr/D/Fn1wMMMg6FeJexe+3aBKSo1JZALT6Le4sXDJy3Hw9R5CRpaeoI
 1clQ==
X-Gm-Message-State: AOAM532xvgx2L2tBGY4qmgBtsR5yQfg3Y6/bbBjTsl9B7YT+7UXBoqdg
 7JAUGLjiwK1u8ilkIL6K53/VFS/V/J09vZ17K1Cln0xHVXhuHR+zI4IITIAA/od1sz5qno5vCLe
 2p74y1jStL/Ycx0KAjG2bH5Edf0IQLuqkgCoxvXw7DFHpqp9BuKdFBpGGSplUBRVw
X-Received: by 2002:ac8:7ca3:: with SMTP id z3mr5360148qtv.118.1627068898858; 
 Fri, 23 Jul 2021 12:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrbQQAKvQjPe2AATj7zCpz5jN1uGJMGcAp0AgL85MDJ145MoJVIYZ7RDkDvaLgwKUG+wDQ9A==
X-Received: by 2002:ac8:7ca3:: with SMTP id z3mr5360126qtv.118.1627068898603; 
 Fri, 23 Jul 2021 12:34:58 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] cpus: Remove the mutex parameter from do_run_on_cpu()
Date: Fri, 23 Jul 2021 15:34:41 -0400
Message-Id: <20210723193444.133412-7-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

We must use the BQL for do_run_on_cpu() without much choice, it means the
parameter is helpless.  Remove it.  Meanwhile use the newly introduced
qemu_cond_wait_iothread() in do_run_on_cpu().

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/cpus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 94c2804192..9131f77f87 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -383,8 +383,7 @@ void qemu_init_cpu_loop(void)
 }
 
 static void
-do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-              QemuMutex *mutex)
+do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item wi;
 
@@ -403,14 +402,14 @@ do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     while (!qatomic_mb_read(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
-        qemu_cond_wait(&qemu_work_cond, mutex);
+        qemu_cond_wait_iothread(&qemu_work_cond);
         current_cpu = self_cpu;
     }
 }
 
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
-    do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
+    do_run_on_cpu(cpu, func, data);
 }
 
 static void qemu_cpu_stop(CPUState *cpu, bool exit)
-- 
2.31.1


