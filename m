Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337315FB1EB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:02:02 +0200 (CEST)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDxP-0004cF-V6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVI-0003CA-T7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV5-0004kH-A4
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToFPMhLJnVe4uVf1Dq7DLra+WggrapIIKxhyIyn0yQA=;
 b=DXxqskLNqf2KEAokgdQ75UWzzO6gJpdTaOO5+9GT7MVG8lDKyOETRH99hXXg0w8iL+3i7c
 n4xNO6T9M4eOI4XAIdD88lCXs5FKuMsDClsGBs9gHgyDbAhcKOATsRXAkOa9Z0jZcY1hMF
 gaVlslh1eCu7XT/ZjmhiXjsn4ojkaXM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-fn9OJxgJMsm3-VQmZDQcRw-1; Tue, 11 Oct 2022 06:28:37 -0400
X-MC-Unique: fn9OJxgJMsm3-VQmZDQcRw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r16-20020a05640251d000b004599cfb8b95so10726203edd.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ToFPMhLJnVe4uVf1Dq7DLra+WggrapIIKxhyIyn0yQA=;
 b=zEfCghsdAo0s32LRa94vEJSW8eDAgi7FS5tfuGWWba4GhhF8LhYHe4xIEYiM2UqL2x
 /YrQtjTe0o0X/zq+Yjwqcb+d4KrSAGomI53cGjfW9iaEhRVUMdg2KTYDQjeD5lhZokBt
 zECusVVfvNpnpZIu7ZiH/SoEgfxZshB2Ai7EBfjAAF8py0xbC9OD5DSLw3HsjobVGEiH
 kroXF5kTFB7dnjGZiccum8B6xF0z7BJCz95iMO6UYOFvKjMOw8A7Wul4ai0C8Wqyb9ak
 v1IWXuVw3IfJgr4in6O0vZTujHNZgthOLcH/Cvkc9B2sAjFVeM3wlB7LrnNlgBR7q3U2
 FYNA==
X-Gm-Message-State: ACrzQf3JcXKFk61HYaW5Jl1eeHll7vuD48gFlsNzTxNXxZiaGp8FV1mq
 RJ432YL80jJRpH6lppWIPO4pWS8uZ5gEddNAqC2RWY3huiha5RWL0ycWpL4quPXNyp8u3LT9z2z
 O2YpLUbaIy/4JsnBtia2n5w4Hzpob3ABNh/GFtwYkPo5GKkFMMT/TqWt2zj5sj6yZAFg=
X-Received: by 2002:a05:6402:40ce:b0:45a:b277:d94 with SMTP id
 z14-20020a05640240ce00b0045ab2770d94mr17170557edb.327.1665484116079; 
 Tue, 11 Oct 2022 03:28:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7RsFO6jnr2CvADD5+4nj++ks03gnXMiPJwoeoUM0iEf55OSgKCLw01tGM1x9WH/43OOJeqIg==
X-Received: by 2002:a05:6402:40ce:b0:45a:b277:d94 with SMTP id
 z14-20020a05640240ce00b0045ab2770d94mr17170538edb.327.1665484115781; 
 Tue, 11 Oct 2022 03:28:35 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a170906785400b00782e3cf7277sm6563938ejm.120.2022.10.11.03.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>
Subject: [PULL 33/37] i386: kvm: Add support for MSR filtering
Date: Tue, 11 Oct 2022 12:26:56 +0200
Message-Id: <20221011102700.319178-34-pbonzini@redhat.com>
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

From: Alexander Graf <agraf@csgraf.de>

KVM has grown support to deflect arbitrary MSRs to user space since
Linux 5.10. For now we don't expect to make a lot of use of this
feature, so let's expose it the easiest way possible: With up to 16
individually maskable MSRs.

This patch adds a kvm_filter_msr() function that other code can call
to install a hook on KVM MSR reads or writes.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20221004225643.65036-3-agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c      | 123 +++++++++++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h |  11 ++++
 2 files changed, 134 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ec63b5eb10..1d9a50b02b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -141,6 +141,8 @@ static struct kvm_cpuid2 *cpuid_cache;
 static struct kvm_cpuid2 *hv_cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
+static KVMMSRHandlers msr_handlers[KVM_MSR_FILTER_MAX_RANGES];
+
 #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
 static RateLimit bus_lock_ratelimit_ctrl;
 static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
@@ -2610,6 +2612,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
                 return ret;
             }
     }
+    if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,
+                                KVM_MSR_EXIT_REASON_FILTER);
+        if (ret) {
+            error_report("Could not enable user space MSRs: %s",
+                         strerror(-ret));
+            exit(1);
+        }
+    }
 
     return 0;
 }
@@ -5109,6 +5120,108 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
     }
 }
 
+static bool kvm_install_msr_filters(KVMState *s)
+{
+    uint64_t zero = 0;
+    struct kvm_msr_filter filter = {
+        .flags = KVM_MSR_FILTER_DEFAULT_ALLOW,
+    };
+    int r, i, j = 0;
+
+    for (i = 0; i < KVM_MSR_FILTER_MAX_RANGES; i++) {
+        KVMMSRHandlers *handler = &msr_handlers[i];
+        if (handler->msr) {
+            struct kvm_msr_filter_range *range = &filter.ranges[j++];
+
+            *range = (struct kvm_msr_filter_range) {
+                .flags = 0,
+                .nmsrs = 1,
+                .base = handler->msr,
+                .bitmap = (__u8 *)&zero,
+            };
+
+            if (handler->rdmsr) {
+                range->flags |= KVM_MSR_FILTER_READ;
+            }
+
+            if (handler->wrmsr) {
+                range->flags |= KVM_MSR_FILTER_WRITE;
+            }
+        }
+    }
+
+    r = kvm_vm_ioctl(s, KVM_X86_SET_MSR_FILTER, &filter);
+    if (r) {
+        return false;
+    }
+
+    return true;
+}
+
+bool kvm_filter_msr(KVMState *s, uint32_t msr, QEMURDMSRHandler *rdmsr,
+                    QEMUWRMSRHandler *wrmsr)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(msr_handlers); i++) {
+        if (!msr_handlers[i].msr) {
+            msr_handlers[i] = (KVMMSRHandlers) {
+                .msr = msr,
+                .rdmsr = rdmsr,
+                .wrmsr = wrmsr,
+            };
+
+            if (!kvm_install_msr_filters(s)) {
+                msr_handlers[i] = (KVMMSRHandlers) { };
+                return false;
+            }
+
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static int kvm_handle_rdmsr(X86CPU *cpu, struct kvm_run *run)
+{
+    int i;
+    bool r;
+
+    for (i = 0; i < ARRAY_SIZE(msr_handlers); i++) {
+        KVMMSRHandlers *handler = &msr_handlers[i];
+        if (run->msr.index == handler->msr) {
+            if (handler->rdmsr) {
+                r = handler->rdmsr(cpu, handler->msr,
+                                   (uint64_t *)&run->msr.data);
+                run->msr.error = r ? 0 : 1;
+                return 0;
+            }
+        }
+    }
+
+    assert(false);
+}
+
+static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
+{
+    int i;
+    bool r;
+
+    for (i = 0; i < ARRAY_SIZE(msr_handlers); i++) {
+        KVMMSRHandlers *handler = &msr_handlers[i];
+        if (run->msr.index == handler->msr) {
+            if (handler->wrmsr) {
+                r = handler->wrmsr(cpu, handler->msr, run->msr.data);
+                run->msr.error = r ? 0 : 1;
+                return 0;
+            }
+        }
+    }
+
+    assert(false);
+}
+
 static bool has_sgx_provisioning;
 
 static bool __kvm_enable_sgx_provisioning(KVMState *s)
@@ -5226,6 +5339,16 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = 0;
         }
         break;
+    case KVM_EXIT_X86_RDMSR:
+        /* We only enable MSR filtering, any other exit is bogus */
+        assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
+        ret = kvm_handle_rdmsr(cpu, run);
+        break;
+    case KVM_EXIT_X86_WRMSR:
+        /* We only enable MSR filtering, any other exit is bogus */
+        assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
+        ret = kvm_handle_wrmsr(cpu, run);
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 4124912c20..2ed586c11b 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -54,4 +54,15 @@ uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 bool kvm_enable_sgx_provisioning(KVMState *s);
 void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
 
+typedef bool QEMURDMSRHandler(X86CPU *cpu, uint32_t msr, uint64_t *val);
+typedef bool QEMUWRMSRHandler(X86CPU *cpu, uint32_t msr, uint64_t val);
+typedef struct kvm_msr_handlers {
+    uint32_t msr;
+    QEMURDMSRHandler *rdmsr;
+    QEMUWRMSRHandler *wrmsr;
+} KVMMSRHandlers;
+
+bool kvm_filter_msr(KVMState *s, uint32_t msr, QEMURDMSRHandler *rdmsr,
+                    QEMUWRMSRHandler *wrmsr);
+
 #endif
-- 
2.37.3


