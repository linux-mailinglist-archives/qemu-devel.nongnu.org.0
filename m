Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03154F9B6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:57:12 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DPL-0003Uq-Aq
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHb-0003iw-36
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHY-0008Ca-Bk
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/PXw7pEzuqwylRIsTPT0+m7UJmDqzIPfq4d+hlw3f0=;
 b=UKkLwF1Vc9VLRucu16n4U9hlB6I39Nn5tmSo0ltdU4JffQfsRRtbQmhbELIK3tQtTC8Pcv
 r00UZLwE0DTak1bmc126ftLXL3/otBMtQ0m7RiK7F3s2GPybb66W9zSqV6mWhoQShAC4N4
 Qd/eKXafncia/wRq1AAywl/kSfbYlc0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-ZV-U1A2YPSKAu0KM2BZQ_g-1; Fri, 17 Jun 2022 10:49:04 -0400
X-MC-Unique: ZV-U1A2YPSKAu0KM2BZQ_g-1
Received: by mail-io1-f71.google.com with SMTP id
 z137-20020a6bc98f000000b00669b0a179c7so2637266iof.6
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/PXw7pEzuqwylRIsTPT0+m7UJmDqzIPfq4d+hlw3f0=;
 b=ou+R3Ihn6QFIDPqmpBMPfRdbN9MZ5rOpnDgucv3sBec1iVjaga05DbcDORKflBj+zv
 Quej19LVi3x2vpkvxpuvrZ61qi6teLADm4CP+mlghbn21BHu/BZ4AKaENAIizFKGy9po
 lnnxFUBtJaaSOSC4nZPJDQR8R09hL3YAV/Hm3NN8Kia9mHKvNYRgKkHZe1rSZA2vcyLc
 7xj+OfYKkXH8X0SHpZBahT6dHBshhDrdt7fhPCE2PR3d3l3Oyr3L9+nuvdeCvKkik33a
 v0Wke9w2PWfoa3frB/EgC07vHIQ7BfLhOxpCFDwivesJI84meMTpUCtF7DJDbo+JFHZQ
 FtTA==
X-Gm-Message-State: AJIora+UWkgp5bp9Ux7pw/bAxWxJpK9sJ4HjuKvxtAM90qd0FOpk6Cbf
 FVnpZLudXxg6FNCrGdZ67gfodlxGBKv8OfT+85ink3tDLK+HcnfJQRPcAJwujvr+o5bZBslErq6
 DByHdblWXMmjFcgOklU14gKVTRwYnpV94P7Jqwqn49u1Nkl+tV5ir2V+Bj5T9mvsM
X-Received: by 2002:a05:6638:2486:b0:331:f9b9:a8ef with SMTP id
 x6-20020a056638248600b00331f9b9a8efmr5452868jat.139.1655477344007; 
 Fri, 17 Jun 2022 07:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBBqYD+/sD/XX4jJkPOXcBhQa61tP3yHCuQjvlmvoMdyFnlv2icOEsUcj0KskCh7AVdaXpng==
X-Received: by 2002:a05:6638:2486:b0:331:f9b9:a8ef with SMTP id
 x6-20020a056638248600b00331f9b9a8efmr5452844jat.139.1655477343722; 
 Fri, 17 Jun 2022 07:49:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.49.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:49:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 2/5] cpus-common: Add run_on_cpu2()
Date: Fri, 17 Jun 2022 10:48:54 -0400
Message-Id: <20220617144857.34189-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
References: <20220617144857.34189-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

This version of run_on_cpu() allows to take an Error** to detect errors.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 27 +++++++++++++++++++++++++++
 include/hw/core/cpu.h | 26 ++++++++++++++++++++++++++
 softmmu/cpus.c        |  6 ++++++
 3 files changed, 59 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 1db7bbbb88..1d67c0c655 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -167,6 +167,33 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     }
 }
 
+void do_run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
+                    QemuMutex *mutex, Error **errp)
+{
+    struct qemu_work_item wi;
+
+    if (qemu_cpu_is_self(cpu)) {
+        func2(cpu, data, errp);
+        return;
+    }
+
+    wi.func2 = func2;
+    wi.data = data;
+    wi.done = false;
+    wi.free = false;
+    wi.exclusive = false;
+    wi.has_errp = true;
+    wi.errp = errp;
+
+    queue_work_on_cpu(cpu, &wi);
+    while (!qatomic_mb_read(&wi.done)) {
+        CPUState *self_cpu = current_cpu;
+
+        qemu_cond_wait(&qemu_work_cond, mutex);
+        current_cpu = self_cpu;
+    }
+}
+
 void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item *wi;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7a303576d0..4bb40a03cf 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -709,6 +709,19 @@ bool cpu_is_stopped(CPUState *cpu);
 void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
                    QemuMutex *mutex);
 
+/**
+ * do_run_on_cpu2:
+ * @cpu: The vCPU to run on.
+ * @func2: The function to be executed.
+ * @data: Data to pass to the function.
+ * @mutex: Mutex to release while waiting for @func2 to run.
+ * @errp: The Error** pointer to be passed into @func2.
+ *
+ * Used internally in the implementation of run_on_cpu2.
+ */
+void do_run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
+                    QemuMutex *mutex, Error **errp);
+
 /**
  * run_on_cpu:
  * @cpu: The vCPU to run on.
@@ -719,6 +732,19 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
  */
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
+/**
+ * run_on_cpu2:
+ * @cpu: The vCPU to run on.
+ * @func: The function to be executed.
+ * @data: Data to pass to the function.
+ * @errp: The Error** pointer to be passed into @func2.
+ *
+ * Schedules the function @func2 for execution on the vCPU @cpu, capture
+ * any error and put it into *@errp when provided.
+ */
+void run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
+                 Error **errp);
+
 /**
  * async_run_on_cpu:
  * @cpu: The vCPU to run on.
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23b30484b2..898363a1d0 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -391,6 +391,12 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
     do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
 }
 
+void run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
+                 Error **errp)
+{
+    do_run_on_cpu2(cpu, func2, data, &qemu_global_mutex, errp);
+}
+
 static void qemu_cpu_stop(CPUState *cpu, bool exit)
 {
     g_assert(qemu_cpu_is_self(cpu));
-- 
2.32.0


