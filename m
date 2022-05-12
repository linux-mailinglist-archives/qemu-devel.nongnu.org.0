Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70135253E6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:41:19 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCoQ-0004rU-9k
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZP-0004xs-M7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZN-0005BL-TW
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nt4NoE+itQ1YxoH9G6rm3kR+DRwjNaGA8NvgBXXpBMQ=;
 b=RgdWaVd8s+icvth3eWhji2WDXth/CGzDMA6tvVz/t7izw96HmKyYinHSwKINhmVvyOEkBs
 QnHDsX6PUC+78hRT6D1eWd8iYolNUmvL/LzLwNb4b+n355togo/qQfOVQk7FbqmH8ioL8D
 YG5J8leHFwt/XomryH1RI5MTm6mA9AU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-AgwGCZUNMym8zrxnKypMbA-1; Thu, 12 May 2022 13:25:41 -0400
X-MC-Unique: AgwGCZUNMym8zrxnKypMbA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec44-20020a0564020d6c00b00425b136662eso3497239edb.12
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nt4NoE+itQ1YxoH9G6rm3kR+DRwjNaGA8NvgBXXpBMQ=;
 b=OJc4CRqg3k1l0n3708N9dMkcMwDsyhrEN55slA5mfuz+CIx+YC+LqSj9oWRYbEoT5Z
 5ZhOHO9M+KJ+SWiI9fcZtTW3X13uSKs9pGZ9+Q6ReI4+bM4mZ9CPI6w8hRLf2a1hRWFX
 1HOx4I87EdMbCunYPbyvab/OgFQiPCRxOCPJ21Zps2aM5U0ytKjtLQ1l/DVLiB2y9tgQ
 4yhrutExsQoWiUwzdW/fX6zhtPalbG97j4Fdr5XTCkGcIZ69kfRNsHwJqnyGNmjkGTDF
 B8D72yfqMXpJXmSZc5ahxCAZ8KoPqx1VrRvvjF8CvyqcSxOsUok7pyvIVArH2mhKxjF7
 h+4A==
X-Gm-Message-State: AOAM532NDraXJ4sj0hpqHTllVA4HPCjU/hwGraVIXpzOXlxSZOwjYO3U
 R+rdJ4sBNuKlnbVmJhJ4yjo5ddT/CawRtAbtkxNvh48vFFy4yY6JnsKAoKriZONwPm8vDxzUINu
 aWgzDz4yhqwMq7yyXQOEfwSoMJFVmB7286cKf3BqYOtbfIV0oxbg9UfzlK2kiPc9rTFA=
X-Received: by 2002:a17:907:6089:b0:6f8:5933:7062 with SMTP id
 ht9-20020a170907608900b006f859337062mr842692ejc.169.1652376340208; 
 Thu, 12 May 2022 10:25:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgFQzunrx13pjrt1G94foytHAKo6mz0Q3g+5C8278jhv6wMmjSH/ufrPhy5IHjXzNot2nmrw==
X-Received: by 2002:a17:907:6089:b0:6f8:5933:7062 with SMTP id
 ht9-20020a170907608900b006f859337062mr842668ejc.169.1652376339892; 
 Thu, 12 May 2022 10:25:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 qt25-20020a170906ecf900b006f3ef214e2fsm2290383ejb.149.2022.05.12.10.25.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] machine: move more memory validation to Machine object
Date: Thu, 12 May 2022 19:24:53 +0200
Message-Id: <20220512172505.1065394-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

This allows setting memory properties without going through
vl.c, and have them validated just the same.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414165300.555321-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 21 +++++++++++++++++++--
 softmmu/vl.c      | 17 +++--------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8aab5416dd..3264c1e11d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -21,12 +21,14 @@
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
+#include "qom/object_interfaces.h"
 #include "hw/sysbus.h"
 #include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/numa.h"
+#include "sysemu/xen.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
@@ -1301,8 +1303,23 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
        clock values from the log. */
     replay_checkpoint(CHECKPOINT_INIT);
 
-    if (machine_class->default_ram_id && machine->ram_size &&
-        numa_uses_legacy_mem() && !machine->memdev) {
+    if (!xen_enabled()) {
+        /* On 32-bit hosts, QEMU is limited by virtual address space */
+        if (machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
+            error_setg(errp, "at most 2047 MB RAM can be simulated");
+            return;
+        }
+    }
+
+    if (machine->memdev) {
+        ram_addr_t backend_size = object_property_get_uint(OBJECT(machine->memdev),
+                                                           "size",  &error_abort);
+        if (backend_size != machine->ram_size) {
+            error_setg(errp, "Machine memory size does not match the size of the memory backend");
+            return;
+        }
+    } else if (machine_class->default_ram_id && machine->ram_size &&
+               numa_uses_legacy_mem()) {
         if (!create_default_memdev(current_machine, mem_path, errp)) {
             return;
         }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f6deec9380..edba74f075 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2027,24 +2027,13 @@ static void qemu_resolve_machine_memdev(void)
             error_report("Memory backend '%s' not found", ram_memdev_id);
             exit(EXIT_FAILURE);
         }
-        backend_size = object_property_get_uint(backend, "size",  &error_abort);
-        if (have_custom_ram_size && backend_size != current_machine->ram_size) {
-            error_report("Size specified by -m option must match size of "
-                         "explicitly specified 'memory-backend' property");
-            exit(EXIT_FAILURE);
+        if (!have_custom_ram_size) {
+            backend_size = object_property_get_uint(backend, "size",  &error_abort);
+            current_machine->ram_size = backend_size;
         }
-        current_machine->ram_size = backend_size;
         object_property_set_link(OBJECT(current_machine),
                                  "memory-backend", backend, &error_fatal);
     }
-
-    if (!xen_enabled()) {
-        /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (current_machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
-            error_report("at most 2047 MB RAM can be simulated");
-            exit(1);
-        }
-    }
 }
 
 static void parse_memory_options(const char *arg)
-- 
2.36.0


