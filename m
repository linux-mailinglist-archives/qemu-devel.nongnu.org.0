Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4B541F8E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:45:29 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyit6-0007f9-A1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHo-0007ZF-Hl
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHm-0005FX-ML
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/PXw7pEzuqwylRIsTPT0+m7UJmDqzIPfq4d+hlw3f0=;
 b=VZQPz5D0O49u30/alNdpH/X7hh12Wh7zRWng3UZfVdaDToQLHEyymd2bX3ewkOzUElfjkm
 Cc4tt+Y8NK47BmP0/nUm2AFrCsc9fC2YR+h2q50K/Dw1qHDcDbGk17ugWs4C+stayXZS8M
 3upcP+KQodxm08NuC130vgfhdXiHHMs=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-_5spUCrpPVqjvfbi_JS8PQ-1; Tue, 07 Jun 2022 19:06:53 -0400
X-MC-Unique: _5spUCrpPVqjvfbi_JS8PQ-1
Received: by mail-io1-f69.google.com with SMTP id
 i126-20020a6bb884000000b006691e030971so6364039iof.15
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/PXw7pEzuqwylRIsTPT0+m7UJmDqzIPfq4d+hlw3f0=;
 b=wXXBuaF6PZU3EBzhEiGdXfrhJyJSwkFLOBbtauOW01AH3BotapwWRoBwm7NhGDEGck
 qF4iynuSYMjzUzLoAYVYAbmGRotYfeU6lM3kUiJrQisXUNy99JkuEoPJLYsEnZH1ylbF
 X8viyY4uaJ23W88b24WRex5LCUlzE7Bzuh1sHoPSqEKKz0qDU6+0lwSjDZDfBBTX+mE/
 oDaruK8i+G0LaDHQJOwz9quKuYf4c+OcFnmZ/yvl/F7aCfMieWgUUvRK1Pc8rYa30qAo
 hkeFQuYW4tZbAhHQERddp2pPCte2uMZvN9O8q2RTpRAy/VPGP7aXtqoMOI1nzwtUptCs
 gY2w==
X-Gm-Message-State: AOAM531es3Ip4QbICYqb0LPLtxJxSUnTmzYtpsZrRuq0XYzRlP+z12F9
 VdSNTNJzpfxav7xXCrNTifNBUvOavtnaDatPgFUVXY0cWqzRlqHhN102vuoT/2QlMtS1OaRWNRl
 B5hHE+a1Aeov3A24PB2oTcr21kBtALOHL4fQFq5wiQSZvfCiGWMfOESWjSDZ0UBWW
X-Received: by 2002:a05:6638:22c9:b0:32e:d436:be11 with SMTP id
 j9-20020a05663822c900b0032ed436be11mr18426247jat.156.1654643212130; 
 Tue, 07 Jun 2022 16:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcj7Rewtqj/LcT3QJRssRrF2eeqRuF5tEJR/NjQDlZrKx115ZotgCu/7VwER6C0aPyq1AWpQ==
X-Received: by 2002:a05:6638:22c9:b0:32e:d436:be11 with SMTP id
 j9-20020a05663822c900b0032ed436be11mr18426233jat.156.1654643211800; 
 Tue, 07 Jun 2022 16:06:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:51 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 2/5] cpus-common: Add run_on_cpu2()
Date: Tue,  7 Jun 2022 19:06:42 -0400
Message-Id: <20220607230645.53950-3-peterx@redhat.com>
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


