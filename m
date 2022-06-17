Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD054F9A9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:52:43 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DKz-0006Fm-J0
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHY-0003cQ-0y
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHU-0008CI-Tv
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5SDL/3f9u/neTqnxCPoh9gqsnwEb6tm3hePdNROKyA=;
 b=YstJnHlE5tAltaCPDxkftMOEMs0+0jA5OYZiWGJbD2v8fJe50KyAugakgS9L2IhcFSEhig
 nrAfdqZOwKs6VCQzN+1VJGLKMupr9X/OVS/3IkX83h5jD2K5g7DqaYgKk0bdqEl4+MTUng
 rhvmdvIGtlNyRdxlcSTLwB5oZ3j3ACo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-9x-90ReYN5eJoOMC_z9rtw-1; Fri, 17 Jun 2022 10:49:03 -0400
X-MC-Unique: 9x-90ReYN5eJoOMC_z9rtw-1
Received: by mail-il1-f200.google.com with SMTP id
 w7-20020a056e021c8700b002d3bc8e95cbso2802594ill.3
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5SDL/3f9u/neTqnxCPoh9gqsnwEb6tm3hePdNROKyA=;
 b=mdfcRfBVEaRy4SaKDvuwxwKYMt7L1Zhk+8fZ+3N8iFMs4hLnyjwWzf7s1qAsCXapBQ
 Jynw1qAqJCPjXJRS+TLQkW5PLDGa8SaXxT8nDS0vRF+dfSgMayMyRKKKrDdpgfnbpnKx
 ouxRk7zRgO6mCymHcg+P7MzwzkV3Bqwpx7Oadat1RyNAdmwT2tRdriUARsGg0SdTpdeC
 YRjBo3yVoYLzfk7w0WEBoGIiKn9N0aaDAjOtMWffUXmUKr/7A+e7RpuErMvZnel/peQR
 cgICxV2OXOCAJTaFBY1ME1+URpl+ZyexT+XYxgWvJJzyXDeVGUSQQn5BjLlhzxuWdbtx
 Obew==
X-Gm-Message-State: AJIora/6epxpC5ysPfTGNkZ9PWLOQMzWo7hNZV8q0BzyhMYGyjRmxQoy
 N3pFTY4rMZQ6AO3yO8YEU6JylSK6Z1VEvBF+QYGAC4cIG2VM7gVSUK2udRgppxH/RXan1yK/+PY
 KrRSkHkS/a5iaQ7pKlFn3Y03p2fpD6kIdgf6+be3xnxBV+Bqputn7vPvukXdGMbco
X-Received: by 2002:a05:6e02:198c:b0:2d8:e8bd:d8ff with SMTP id
 g12-20020a056e02198c00b002d8e8bdd8ffmr1164826ilf.66.1655477342098; 
 Fri, 17 Jun 2022 07:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/O7kGfVBZ/hAahW0L8thCJgr1GWgNaA/SlNgtqxHdE6Nt7rlDLoGzK0OgwS3zyQ7T7M86+w==
X-Received: by 2002:a05:6e02:198c:b0:2d8:e8bd:d8ff with SMTP id
 g12-20020a056e02198c00b002d8e8bdd8ffmr1164800ilf.66.1655477341815; 
 Fri, 17 Jun 2022 07:49:01 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.49.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:49:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 1/5] cpus-common: Introduce run_on_cpu_func2 which allows
 error returns
Date: Fri, 17 Jun 2022 10:48:53 -0400
Message-Id: <20220617144857.34189-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
References: <20220617144857.34189-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


