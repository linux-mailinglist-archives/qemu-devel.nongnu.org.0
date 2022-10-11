Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57105FB0C0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:49:29 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCpE-0002et-QQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTi-0001jY-Op
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTg-0004Hn-RN
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyPQGYZ1c7/e+tS0H3PukCSxg5MkFBP2Gn19GXnF6jI=;
 b=fSWIk1OTlNxtJBDqiTEeujuZUv/v27Re9Y4R9DarTPUI9YmZt+2QwkU8u+wYwym1gf/Qc3
 oSOsWKNpWiUaJg5+ryTRNLmO7HiyzlCx0xgf5uvMpj5Qroru1t6DsMh6Hcm6i7v31gwaxC
 p+f94DEQ40bAhPdLlEmyp3B+nXO9ZUI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-3hHRaapJOWax5f4zVws1wQ-1; Tue, 11 Oct 2022 06:27:11 -0400
X-MC-Unique: 3hHRaapJOWax5f4zVws1wQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v4-20020a056402348400b0045bd50cb9adso5610410edc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyPQGYZ1c7/e+tS0H3PukCSxg5MkFBP2Gn19GXnF6jI=;
 b=LioVIwRQs7QdG3pITPuezpyk2aLtQtfADW44KAMqZw3vZQ+KgL/GPJwSvGVQ7W8KgL
 aOluWnMKHQOQJa/EFW2Fb8JzIfAhwXtb1aAnnSz3z6DqKNX7zPE9naWPkJNqdT23m3Y3
 gBI1diDAovUUdl+u89jOUXuAYyrp2N+MFirOvMD+0Sr3grvi80hfdZ/ycjlMq3knc7Ym
 DJVwsp85JxbY5Qx70P2mKDn5XgNVwtH4n4RTmfIctM5CD56j+qaVAqxdIVRaCX1do+R+
 v8zIGR8h9IhOe7nMpdJoHI/sbdxooe4Ah53uFQ8NkHEU1uSRzUjd0O6PgLa/TGB7pvwh
 PRnw==
X-Gm-Message-State: ACrzQf31eYrL48xhCYilX2lmElohZF0MZynukKBRqc+pep62O1UqGvg/
 LgycbpTxnR+Z5nZxAfLTa96pJocESIhuByejSO3oyjV9WSNuDn0pwHgiCbTiOW78Gdo70UgffP5
 nv/aRVZGVMTdTL3WZVZVhpLV9pY4tnIJj285hupVmFUK1/v7aHvp4zkS6C7CZVth/WUQ=
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id
 wz5-20020a170906fe4500b0078815a57495mr18496914ejb.633.1665484029502; 
 Tue, 11 Oct 2022 03:27:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FE5p3WsJQ7Sc8Bqwwz3nf1uclag1lEbmCRiSfV6zpJE8u3bj0dVmKXgWr4xVko2YfD8n9Ig==
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id
 wz5-20020a170906fe4500b0078815a57495mr18496896ejb.633.1665484029216; 
 Tue, 11 Oct 2022 03:27:09 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906394c00b0078d61c5db0asm6400190eje.49.2022.10.11.03.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 02/37] i386: kvm: extend kvm_{get,
 put}_vcpu_events to support pending triple fault
Date: Tue, 11 Oct 2022 12:26:25 +0200
Message-Id: <20221011102700.319178-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace could migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
the event.triple_fault_pending field contains a valid state if the
KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20220929072014.20705-2-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
 target/i386/machine.c | 20 ++++++++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad623d91e4..06884177fa 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6017,6 +6017,7 @@ static void x86_cpu_reset(DeviceState *dev)
     env->exception_has_payload = false;
     env->exception_payload = 0;
     env->nmi_injected = false;
+    env->triple_fault_pending = false;
 #if !defined(CONFIG_USER_ONLY)
     /* We hard-wire the BSP to the first CPU. */
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..d4124973ce 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1739,6 +1739,7 @@ typedef struct CPUArchState {
     uint8_t has_error_code;
     uint8_t exception_has_payload;
     uint64_t exception_payload;
+    uint8_t triple_fault_pending;
     uint32_t ins_len;
     uint32_t sipi_vector;
     bool tsc_valid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f2a96492ce..3ebe8b7f1f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -132,6 +132,7 @@ static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
 static int has_exception_payload;
+static int has_triple_fault_event;
 
 static bool has_msr_mcg_ext_ctl;
 
@@ -2479,6 +2480,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    has_triple_fault_event = kvm_check_extension(s, KVM_CAP_X86_TRIPLE_FAULT_EVENT);
+    if (has_triple_fault_event) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_TRIPLE_FAULT_EVENT, 0, true);
+        if (ret < 0) {
+            error_report("kvm: Failed to enable triple fault event cap: %s",
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -4295,6 +4306,11 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
         }
     }
 
+    if (has_triple_fault_event) {
+        events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+        events.triple_fault.pending = env->triple_fault_pending;
+    }
+
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
 }
 
@@ -4364,6 +4380,10 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
         }
     }
 
+    if (events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT) {
+        env->triple_fault_pending = events.triple_fault.pending;
+    }
+
     env->sipi_vector = events.sipi_vector;
 
     return 0;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index cecd476e98..310b125235 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1562,6 +1562,25 @@ static const VMStateDescription vmstate_arch_lbr = {
     }
 };
 
+static bool triple_fault_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->triple_fault_pending;
+}
+
+static const VMStateDescription vmstate_triple_fault = {
+    .name = "cpu/triple_fault",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = triple_fault_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(env.triple_fault_pending, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1706,6 +1725,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_amx_xtile,
 #endif
         &vmstate_arch_lbr,
+        &vmstate_triple_fault,
         NULL
     }
 };
-- 
2.37.3


