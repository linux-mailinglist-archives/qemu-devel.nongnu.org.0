Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB006A8259
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5U-0007g5-0s; Thu, 02 Mar 2023 07:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5S-0007en-CY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5Q-0002vh-Q8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IC9YpBiB1X9C010J2ggHCxhALP+ZulP8Lfe1CvAAGbg=;
 b=VCjuDskjh7xzTFOeXDMovg7fjrUNpSiTMBc/S9qOdBkFMdMboXlOyoP00tExqdSKe/lK75
 1fVpFEmOV2s8BgYATKMRAh4hfq1z1af9u2O8CiezjY/VxWtuwvqw6q9oE4AAHtfarX1TNV
 kO/qljphwSCRb8cViCF9Gln8ZhJtLKg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-jkxSycEENyG-wZDQlA8wsA-1; Thu, 02 Mar 2023 07:31:02 -0500
X-MC-Unique: jkxSycEENyG-wZDQlA8wsA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so1207071wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IC9YpBiB1X9C010J2ggHCxhALP+ZulP8Lfe1CvAAGbg=;
 b=1VlE+HBG4doUp5p+f/hGi9VPvygBGOtWqiHZNJ311E4dTlxFvbbvkNwhYSaBgZuGVx
 xtDJxShZ0tUT8YNrVLOWMjKy/lzCxaDqVB9ZWkw/H5jz2DX3zPZ5r1QRL2otiuqQK7b7
 /uZoZ09aVjcs5EbdvBtGrmc5fDbA6a4ELrlcSB9pPh29ot9uWVsrA2qpI+/0IPh9H6ki
 lJOafk3b43y09MgsEnGvgNxrFKZD0Z2oyJN+ZUkByO46cZzVNLuJ68AECPB6W43OLiuR
 ycozCXqJEHi6YLnu+CT4vYyuUnkljxpmaXUIuwA0qAwhJ5jLDBa31+GYoPHm0zYPbpgg
 3X/A==
X-Gm-Message-State: AO0yUKV6bVQnz0FqzPVBzTCOWryGvG6felGad9wow8EjMJvj2B6J1LZK
 v7SMsHT+yAl7qTm5I8MvTVfM0QP558hRVOKAXV65rjHSWQ1meNQtDAmYpD318YO9KFBUcjwN1Fl
 DSQmUGUwx7dKvRt8ADsPqHpBsjGEVf+SgGdoyQsXWtI0faYDXq/TNc2bmCOnORLgEclBVrKig9r
 0=
X-Received: by 2002:a05:600c:18a3:b0:3eb:2da4:efe7 with SMTP id
 x35-20020a05600c18a300b003eb2da4efe7mr7512824wmp.11.1677760261542; 
 Thu, 02 Mar 2023 04:31:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8tSSHVyulDNyPXbWqsypGsQbrlQFPAfYe9Db3OA+mgI/Q17WPU+jQ+jrpqHFWoKUqRVJacWA==
X-Received: by 2002:a05:600c:18a3:b0:3eb:2da4:efe7 with SMTP id
 x35-20020a05600c18a300b003eb2da4efe7mr7512810wmp.11.1677760261244; 
 Thu, 02 Mar 2023 04:31:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003dc4480df80sm3236400wmq.34.2023.03.02.04.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 09/62] i386/xen: handle guest hypercalls
Date: Thu,  2 Mar 2023 13:29:36 +0100
Message-Id: <20230302123029.153265-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

This means handling the new exit reason for Xen but still
crashing on purpose. As we implement each of the hypercalls
we will then return the right return code.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/kvm.c        |  5 ++++
 target/i386/kvm/trace-events |  3 +++
 target/i386/kvm/xen-emu.c    | 44 ++++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.h    |  1 +
 4 files changed, 53 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index edcf8a2a65d5..f43e5531bf85 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5493,6 +5493,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
         ret = kvm_handle_wrmsr(cpu, run);
         break;
+#ifdef CONFIG_XEN_EMU
+    case KVM_EXIT_XEN:
+        ret = kvm_xen_handle_exit(cpu, &run->xen);
+        break;
+#endif
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index 7c369db1e155..cd6f842b1fd1 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -5,3 +5,6 @@ kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %"
 kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
 kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
 kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
+
+# xen-emu.c
+kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 4883b95d9d47..476f464ee2f5 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -10,10 +10,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
 #include "xen-emu.h"
+#include "trace.h"
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 {
@@ -84,3 +86,45 @@ uint32_t kvm_xen_get_caps(void)
 {
     return kvm_state->xen_caps;
 }
+
+static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    uint16_t code = exit->u.hcall.input;
+
+    if (exit->u.hcall.cpl > 0) {
+        exit->u.hcall.result = -EPERM;
+        return true;
+    }
+
+    switch (code) {
+    default:
+        return false;
+    }
+}
+
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    if (exit->type != KVM_EXIT_XEN_HCALL) {
+        return -1;
+    }
+
+    if (!do_kvm_xen_handle_exit(cpu, exit)) {
+        /*
+         * Some hypercalls will be deliberately "implemented" by returning
+         * -ENOSYS. This case is for hypercalls which are unexpected.
+         */
+        exit->u.hcall.result = -ENOSYS;
+        qemu_log_mask(LOG_UNIMP, "Unimplemented Xen hypercall %"
+                      PRId64 " (0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64 ")\n",
+                      (uint64_t)exit->u.hcall.input,
+                      (uint64_t)exit->u.hcall.params[0],
+                      (uint64_t)exit->u.hcall.params[1],
+                      (uint64_t)exit->u.hcall.params[2]);
+    }
+
+    trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
+                            exit->u.hcall.input, exit->u.hcall.params[0],
+                            exit->u.hcall.params[1], exit->u.hcall.params[2],
+                            exit->u.hcall.result);
+    return 0;
+}
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index d62f1d8ed8fe..21faf6bf38fd 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -25,5 +25,6 @@
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_init_vcpu(CPUState *cs);
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.1


