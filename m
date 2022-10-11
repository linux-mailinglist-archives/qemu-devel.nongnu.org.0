Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CBB5FB0B7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:48:00 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCnn-0001Tq-60
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTt-0001mT-CK
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTr-0004Kt-4Y
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHwt4wzgqW3P8bT1wnaCEw3RQuutu+NUFATpSfeagOI=;
 b=MUr0gHrtvSA6LYMuLZW50qNkhbFS+FIrEuf5tVWy83eKcJtda/Xyp5fA/vLouSTSJABKAZ
 YYWEI+wb/xQcBjJYKTlp+zJxQCnf5h12opuC3ZYQgKOpYa+W5Z1asxc2J8EtoqjK8maC8C
 ufyMSd6UWNwP9QkhfMXtH86EJPMfIF8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-op7F_mc0PF6a4lOok8nufg-1; Tue, 11 Oct 2022 06:27:21 -0400
X-MC-Unique: op7F_mc0PF6a4lOok8nufg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gn33-20020a1709070d2100b00787e6fbcb72so5673428ejc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHwt4wzgqW3P8bT1wnaCEw3RQuutu+NUFATpSfeagOI=;
 b=YX5EVYfemHL39hfBH5BVWN74nEmGlhxf7ENY+yjytXG6U9FgVGmDnb7tR3j4npQRuz
 s9Ghwr0hFlQPkgVAK9kdk+YUfuj5FbDJJQ68MsmMlmwUdP007GxrxPNOSe1jTAWLsqGq
 KXfK4NgtIOUYjAvc1Gc6FqBXeAZLXTd8yEgDZX60yMCQDnQa6/60vJh9qu+vR9j0GcZK
 JPnI2/Df+QG2B1LrmBw6TLftUBCkyIznCRNICXonJdNY30qBuzSxR62Wa7qGOp8onUWA
 fnOOYDXH1OhQOyT3W9as4bfMUS/BDzsg4WzDEHrJDKfKfSXh4+vBAnxCG7T5sfeI0esx
 3PQg==
X-Gm-Message-State: ACrzQf0kh58LpOn2d99EQPKZfJtwk8pnB0os1AJyvutNpbiZ4Alp0JG9
 s+OSw8zQd1kECSJkr0UGkurQAq5GT4mM4iYW5of9ribADkA9F79ZCtIspG2xq8lX+tuDqU4w7ck
 RZ9LRGOFUssetNKwJW0dDs1EYSCASbGw3ha5FaQ4vs597ocwDhJ//SNlgxKR+TSq7X0c=
X-Received: by 2002:a17:906:2a93:b0:78d:b87e:6aab with SMTP id
 l19-20020a1709062a9300b0078db87e6aabmr7005188eje.157.1665484038964; 
 Tue, 11 Oct 2022 03:27:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OeKPnNgIJ/b5oVA9TnkFGneaeTfhCmYnCfWhMQ8YnFh9LhQPpDN5OytRmQDWmRO6BRzy+OA==
X-Received: by 2002:a17:906:2a93:b0:78d:b87e:6aab with SMTP id
 l19-20020a1709062a9300b0078db87e6aabmr7005169eje.157.1665484038588; 
 Tue, 11 Oct 2022 03:27:18 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170906594300b007815c3e95f6sm6837422ejr.146.2022.10.11.03.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 05/37] i386: add notify VM exit support
Date: Tue, 11 Oct 2022 12:26:28 +0200
Message-Id: <20221011102700.319178-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

There are cases that malicious virtual machine can cause CPU stuck (due
to event windows don't open up), e.g., infinite loop in microcode when
nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
IRQ) can be delivered. It leads the CPU to be unavailable to host or
other VMs. Notify VM exit is introduced to mitigate such kind of
attacks, which will generate a VM exit if no event window occurs in VM
non-root mode for a specified amount of time (notify window).

A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
so that the user can query the capability and set the expected notify
window when creating VMs. The format of the argument when enabling this
capability is as follows:
  Bit 63:32 - notify window specified in qemu command
  Bit 31:0  - some flags (e.g. KVM_X86_NOTIFY_VMEXIT_ENABLED is set to
              enable the feature.)

Users can configure the feature by a new (x86 only) accel property:
    qemu -accel kvm,notify-vmexit=run|internal-error|disable,notify-window=n

The default option of notify-vmexit is run, which will enable the
capability and do nothing if the exit happens. The internal-error option
raises a KVM internal error if it happens. The disable option does not
enable the capability. The default value of notify-window is 0. It is valid
only when notify-vmexit is not disabled. The valid range of notify-window
is non-negative. It is even safe to set it to zero since there's an
internal hardware threshold to be added to ensure no false positive.

Because a notify VM exit may happen with VM_CONTEXT_INVALID set in exit
qualification (no cases are anticipated that would set this bit), which
means VM context is corrupted. It would be reflected in the flags of
KVM_EXIT_NOTIFY exit. If KVM_NOTIFY_CONTEXT_INVALID bit is set, raise a KVM
internal error unconditionally.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20220929072014.20705-5-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c   |  2 +
 qapi/run-state.json   | 17 ++++++++
 qemu-options.hx       | 11 +++++
 target/i386/kvm/kvm.c | 98 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fbfe948398..f99b0becd8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3618,6 +3618,8 @@ static void kvm_accel_instance_init(Object *obj)
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
+    s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
+    s->notify_window = 0;
 }
 
 /**
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 9273ea6516..49989d30e6 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -643,3 +643,20 @@
 { 'struct': 'MemoryFailureFlags',
   'data': { 'action-required': 'bool',
             'recursive': 'bool'} }
+
+##
+# @NotifyVmexitOption:
+#
+# An enumeration of the options specified when enabling notify VM exit
+#
+# @run: enable the feature, do nothing and continue if the notify VM exit happens.
+#
+# @internal-error: enable the feature, raise a internal error if the notify
+#                  VM exit happens.
+#
+# @disable: disable the feature.
+#
+# Since: 7.2
+##
+{ 'enum': 'NotifyVmexitOption',
+  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b998a13b..606d379186 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -191,6 +191,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
+    "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
 ``-accel name[,prop=value[,...]]``
@@ -242,6 +243,16 @@ SRST
         is disabled (dirty-ring-size=0).  When enabled, KVM will instead
         record dirty pages in a bitmap.
 
+    ``notify-vmexit=run|internal-error|disable,notify-window=n``
+        Enables or disables notify VM exit support on x86 host and specify
+        the corresponding notify window to trigger the VM exit if enabled.
+        ``run`` option enables the feature. It does nothing and continue
+        if the exit happens. ``internal-error`` option enables the feature.
+        It raises a internal error. ``disable`` option doesn't enable the feature.
+        This feature can mitigate the CPU stuck issue due to event windows don't
+        open up for a specified of time (i.e. notify-window).
+        Default: notify-vmexit=run,notify-window=0.
+
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f18d21413c..ec63b5eb10 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include <sys/ioctl.h>
 #include <sys/utsname.h>
 #include <sys/syscall.h>
@@ -2595,6 +2596,21 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (s->notify_vmexit != NOTIFY_VMEXIT_OPTION_DISABLE &&
+        kvm_check_extension(s, KVM_CAP_X86_NOTIFY_VMEXIT)) {
+            uint64_t notify_window_flags =
+                ((uint64_t)s->notify_window << 32) |
+                KVM_X86_NOTIFY_VMEXIT_ENABLED |
+                KVM_X86_NOTIFY_VMEXIT_USER;
+            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_NOTIFY_VMEXIT, 0,
+                                    notify_window_flags);
+            if (ret < 0) {
+                error_report("kvm: Failed to enable notify vmexit cap: %s",
+                             strerror(-ret));
+                return ret;
+            }
+    }
+
     return 0;
 }
 
@@ -5137,6 +5153,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     X86CPU *cpu = X86_CPU(cs);
     uint64_t code;
     int ret;
+    bool ctx_invalid;
+    char str[256];
+    KVMState *state;
 
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
@@ -5192,6 +5211,21 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         /* already handled in kvm_arch_post_run */
         ret = 0;
         break;
+    case KVM_EXIT_NOTIFY:
+        ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
+        state = KVM_STATE(current_accel());
+        sprintf(str, "Encounter a notify exit with %svalid context in"
+                     " guest. There can be possible misbehaves in guest."
+                     " Please have a look.", ctx_invalid ? "in" : "");
+        if (ctx_invalid ||
+            state->notify_vmexit == NOTIFY_VMEXIT_OPTION_INTERNAL_ERROR) {
+            warn_report("KVM internal error: %s", str);
+            ret = -1;
+        } else {
+            warn_report_once("KVM: %s", str);
+            ret = 0;
+        }
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
@@ -5469,6 +5503,70 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
     }
 }
 
+static int kvm_arch_get_notify_vmexit(Object *obj, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    return s->notify_vmexit;
+}
+
+static void kvm_arch_set_notify_vmexit(Object *obj, int value, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    s->notify_vmexit = value;
+}
+
+static void kvm_arch_get_notify_window(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->notify_window;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_arch_set_notify_window(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->notify_window = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
+    object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
+                                   &NotifyVmexitOption_lookup,
+                                   kvm_arch_get_notify_vmexit,
+                                   kvm_arch_set_notify_vmexit);
+    object_class_property_set_description(oc, "notify-vmexit",
+                                          "Enable notify VM exit");
+
+    object_class_property_add(oc, "notify-window", "uint32",
+                              kvm_arch_get_notify_window,
+                              kvm_arch_set_notify_window,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "notify-window",
+                                          "Clock cycles without an event window "
+                                          "after which a notification VM exit occurs");
 }
-- 
2.37.3


