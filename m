Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A819E541F8B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:39:51 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyind-0002dE-VB
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHn-0007Tt-UO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHk-0005FR-U6
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5SDL/3f9u/neTqnxCPoh9gqsnwEb6tm3hePdNROKyA=;
 b=Z5fICTPiyvDJGqPawY7nKeOgxgn1bNIR1KKm/goJNoqtpE+SzCfJqBrfS0dTsH5y+njzBB
 oqpwgD2tLKWgyIdpogjT1Sxbq9+pFmChnxvGLKL/xcQdRAf4JofikVlkwg/SFhf9TRvyKK
 2kMYcqS6PljZ09IABchVuohSLXddnUw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-OEDYHVomNu25aMqEn_3TqQ-1; Tue, 07 Jun 2022 19:06:51 -0400
X-MC-Unique: OEDYHVomNu25aMqEn_3TqQ-1
Received: by mail-il1-f200.google.com with SMTP id
 g8-20020a92cda8000000b002d15f63967eso14632609ild.21
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5SDL/3f9u/neTqnxCPoh9gqsnwEb6tm3hePdNROKyA=;
 b=eeFC+jbhzhaZoXAvXbF0E6RVkTs+Bni6Fl4oBRuYtYNyGccKpVicAi+WluAy8WurJN
 Q8LhfrKd6+f8qL9mvxoyruCIV14rUJed5wzsVRdwi0h5uOckKZSoOxpt8aoojPKVpgDP
 sh6fRrrPIUAC1p6aFZ0lL8Kx3mnYS+6Bwu0yFAuri2ZmR8GNZz1zDeYk9b0gC4dAmWsr
 eE17oke3h3FPUEEeIqdvV0AValSzfYF/1+jngMnOYG4cBKpA7gy6A2UgNtdAiN8OpWol
 f1dXxRHtbr9Nly7ApzBySChuecrINT5HHnSJD6y9BWZYD1TVQSbXfNW8ubfP2iry1a3c
 dyOQ==
X-Gm-Message-State: AOAM530t3Bpkb+zIZwDFF2AG4Q1G4NvWJAZPrukrXbpZOIS7nvMOveiC
 69FtquTna26MVDVtVnXL5kzBsBDGkhb2fc3b2qsC9v8CLl0h/LWLBfxUeNykiWgNpZ1QZ0KKtXH
 3Si4FLD5NaMG3MOl673g71eZFuAT0+bq3knaq0E/JZCQ1uc3ZJhKplKBQKY+30Dud
X-Received: by 2002:a05:6638:3e1b:b0:331:d0b5:18e9 with SMTP id
 co27-20020a0566383e1b00b00331d0b518e9mr2996910jab.207.1654643210350; 
 Tue, 07 Jun 2022 16:06:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgWQRzlAa4dG9MPJCKK5HjtIA8xeducuSvtMdAXx7FoSdy9ojAaY+bYB++9BYXLiBD4jrFjw==
X-Received: by 2002:a05:6638:3e1b:b0:331:d0b5:18e9 with SMTP id
 co27-20020a0566383e1b00b00331d0b518e9mr2996898jab.207.1654643210101; 
 Tue, 07 Jun 2022 16:06:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 1/5] cpus-common: Introduce run_on_cpu_func2 which allows
 error returns
Date: Tue,  7 Jun 2022 19:06:41 -0400
Message-Id: <20220607230645.53950-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607230645.53950-1-peterx@redhat.com>
References: <20220607230645.53950-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

run_on_cpu API does not yet support any way to pass over an error message
to above.  Add a new run_on_cpu_func2 hook to grant possibility of that.

Note that this only changes the cpus-common core, no API is yet introduced
for v2 of the run_on_cpu_func function.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 28 +++++++++++++++++++++++++---
 include/hw/core/cpu.h |  2 ++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index db459b41ce..1db7bbbb88 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -116,9 +116,20 @@ __thread CPUState *current_cpu;
 
 struct qemu_work_item {
     QSIMPLEQ_ENTRY(qemu_work_item) node;
-    run_on_cpu_func func;
+    union {
+        run_on_cpu_func func;     /* When has_errp==false */
+        run_on_cpu_func2 func2;   /* When has_errp==true  */
+    };
     run_on_cpu_data data;
     bool free, exclusive, done;
+
+    /*
+     * Below are only used by v2 of work item, where we allow to return
+     * errors for cpu work items.  When has_errp==true, then: (1) we call
+     * func2 rather than func, and (2) we pass in errp into func2() call.
+     */
+    bool has_errp;
+    Error **errp;
 };
 
 static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
@@ -314,6 +325,17 @@ void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func,
     queue_work_on_cpu(cpu, wi);
 }
 
+static void process_one_work_item(struct qemu_work_item *wi, CPUState *cpu)
+{
+    if (wi->has_errp) {
+        /* V2 of work item, allows errors */
+        wi->func2(cpu, wi->data, wi->errp);
+    } else {
+        /* Old version of work item, no error returned */
+        wi->func(cpu, wi->data);
+    }
+}
+
 void process_queued_cpu_work(CPUState *cpu)
 {
     struct qemu_work_item *wi;
@@ -336,11 +358,11 @@ void process_queued_cpu_work(CPUState *cpu)
              */
             qemu_mutex_unlock_iothread();
             start_exclusive();
-            wi->func(cpu, wi->data);
+            process_one_work_item(wi, cpu);
             end_exclusive();
             qemu_mutex_lock_iothread();
         } else {
-            wi->func(cpu, wi->data);
+            process_one_work_item(wi, cpu);
         }
         qemu_mutex_lock(&cpu->work_mutex);
         if (wi->free) {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 996f94059f..7a303576d0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -252,6 +252,8 @@ typedef union {
 #define RUN_ON_CPU_NULL           RUN_ON_CPU_HOST_PTR(NULL)
 
 typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
+/* Same as run_on_cpu_func but allows to return an error */
+typedef void (*run_on_cpu_func2)(CPUState *cpu, run_on_cpu_data data, Error **errp);
 
 struct qemu_work_item;
 
-- 
2.32.0


