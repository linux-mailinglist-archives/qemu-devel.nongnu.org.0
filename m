Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3B602E11
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:13:50 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknLn-0000OQ-SX
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgZ-0002AJ-RZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgX-0004zZ-LN
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh2WQfMOThQmIiiSvAkUXXDHDmndCBlFXuAzD7GAhXI=;
 b=eyxW5QPSTTdQXGsVO4HOkvwTFm9jgaL2qT4/MVFKpx/qckvGqLJV16vRk052+zm+s0qs6t
 mJ7bY9ax4yTU9EboEhcfVP1dydscvwULr1CV47HcHRsfMEGOUb4MOVFfBUNxjKD/OsbsiV
 mdfdY76Z6h3rqo/Yf9dlTURIj40JHuM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-3T-nuJ_cMW-A7k-Zz61L2A-1; Tue, 18 Oct 2022 09:31:07 -0400
X-MC-Unique: 3T-nuJ_cMW-A7k-Zz61L2A-1
Received: by mail-ed1-f72.google.com with SMTP id
 b8-20020a056402278800b0045d410dec69so7565150ede.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xh2WQfMOThQmIiiSvAkUXXDHDmndCBlFXuAzD7GAhXI=;
 b=m0Dq/FCvcwLlCd3tG4xJEMbIbWIpz4OeUGib3PEADcEJga0GjDcQB2B/LHyHaobGNc
 b5R8YuZriGcj4KBZWvZmFb+FQj0J23SKKUERloIDWluFAPLzBCpw3vMSdjyvAJzV7G4A
 wLjOSZxFHa3M9JFaRFI5RutHiNg6tetunL5mpGaME2M5XWiPbFK0HGD+7aWo1a9KiHl1
 ekGH8HcbdpkLpgvaUDEUnps+n0FJHTOY9qGHBmBdiO2XwHlM2R/FG1rsmQjIHM1ScKih
 CeYg/t34EgNkwcXd/6ruMhQ3hsVNQKDc9yKNjnAglQo8MdzTHaaOr2lG0VT2sMXl9BrO
 8gXA==
X-Gm-Message-State: ACrzQf1LnvRyy7kOk+T08EjREV+r0Ci0RPfyjlb0iBXXI6W4Hk/YII7g
 tjBrxe2tkFKwf3UJGH+M9K76/hZpcGPc0IBpV1FNawHQwGYT+10ptgtZCWNIIr/qujkFBZtelvV
 MpcpLbwJhFCtLb/VsjmVqiXuuQJAi4ty8UZQ2U/5+FFN8FSvvtDtq5zRwewid5HBbdf8=
X-Received: by 2002:a05:6402:538f:b0:444:c17b:1665 with SMTP id
 ew15-20020a056402538f00b00444c17b1665mr2706592edb.98.1666099865872; 
 Tue, 18 Oct 2022 06:31:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n/9B3Z9fhEw4mTZS+dZWucs3A/Mj4ZFbUcPy32ttYhJSvsTyryMgwQA/remfesvl/Ynz+6w==
X-Received: by 2002:a05:6402:538f:b0:444:c17b:1665 with SMTP id
 ew15-20020a056402538f00b00444c17b1665mr2706566edb.98.1666099865514; 
 Tue, 18 Oct 2022 06:31:05 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 kv2-20020a17090778c200b0077e6be40e4asm7662549ejc.175.2022.10.18.06.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: [PULL 05/53] hyperv: fix SynIC SINT assertion failure on guest reset
Date: Tue, 18 Oct 2022 15:29:54 +0200
Message-Id: <20221018133042.856368-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU
assertion failure:
hw/hyperv/hyperv.c:131: synic_reset: Assertion `QLIST_EMPTY(&synic->sint_routes)' failed.

This happens both on normal guest reboot or when using "system_reset" HMP
command.

The failing assertion was introduced by commit 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc")
to catch dangling SINT routes on SynIC reset.

The root cause of this problem is that the SynIC itself is reset before
devices using SINT routes have chance to clean up these routes.

Since there seems to be no existing mechanism to force reset callbacks (or
methods) to be executed in specific order let's use a similar method that
is already used to reset another interrupt controller (APIC) after devices
have been reset - by invoking the SynIC reset from the machine reset
handler via a new x86_cpu_after_reset() function co-located with
the existing x86_cpu_reset() in target/i386/cpu.c.
Opportunistically move the APIC reset handler there, too.

Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") # exposed the bug
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Message-Id: <cb57cee2e29b20d06f81dce054cbcea8b5d497e8.1664552976.git.maciej.szmigiero@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c          |  4 +---
 hw/i386/pc.c               |  5 ++---
 target/i386/cpu.c          | 13 +++++++++++++
 target/i386/cpu.h          |  2 ++
 target/i386/kvm/hyperv.c   |  4 ++++
 target/i386/kvm/kvm.c      | 26 ++++++++++++++++++--------
 target/i386/kvm/kvm_i386.h |  1 +
 7 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7fe8cce03e..52f9aa9d8c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -485,9 +485,7 @@ static void microvm_machine_reset(MachineState *machine)
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
 
-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
+        x86_cpu_after_reset(cpu);
     }
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e6..768982ae9a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,6 +92,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
+#include "target/i386/cpu.h"
 #include "qapi/qmp/qerror.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
@@ -1859,9 +1860,7 @@ static void pc_machine_reset(MachineState *machine)
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
 
-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
+        x86_cpu_after_reset(cpu);
     }
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8a11470507..90aec2f462 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6035,6 +6035,19 @@ static void x86_cpu_reset(DeviceState *dev)
 #endif
 }
 
+void x86_cpu_after_reset(X86CPU *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_arch_after_reset_vcpu(cpu);
+    }
+
+    if (cpu->apic_state) {
+        device_legacy_reset(cpu->apic_state);
+    }
+#endif
+}
+
 static void mce_init(X86CPU *cpu)
 {
     CPUX86State *cenv = &cpu->env;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7edf5dfac3..4d21c5759d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2082,6 +2082,8 @@ typedef struct PropValue {
 } PropValue;
 void x86_cpu_apply_props(X86CPU *cpu, PropValue *props);
 
+void x86_cpu_after_reset(X86CPU *cpu);
+
 uint32_t cpu_x86_virtual_addr_width(CPUX86State *env);
 
 /* cpu.c other functions (cpuid) */
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
index 9026ef3a81..e3ac978648 100644
--- a/target/i386/kvm/hyperv.c
+++ b/target/i386/kvm/hyperv.c
@@ -23,6 +23,10 @@ int hyperv_x86_synic_add(X86CPU *cpu)
     return 0;
 }
 
+/*
+ * All devices possibly using SynIC have to be reset before calling this to let
+ * them remove their SINT routes first.
+ */
 void hyperv_x86_synic_reset(X86CPU *cpu)
 {
     hyperv_synic_reset(CPU(cpu));
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index bed6c00f2c..dac100c67c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2203,14 +2203,6 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
         env->mp_state = KVM_MP_STATE_RUNNABLE;
     }
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
-        int i;
-        for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
-            env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
-        }
-
-        hyperv_x86_synic_reset(cpu);
-    }
     /* enabled by default */
     env->poll_control_msr = 1;
 
@@ -2219,6 +2211,24 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
     sev_es_set_reset_vector(CPU(cpu));
 }
 
+void kvm_arch_after_reset_vcpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int i;
+
+    /*
+     * Reset SynIC after all other devices have been reset to let them remove
+     * their SINT routes first.
+     */
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
+        for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
+            env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
+        }
+
+        hyperv_x86_synic_reset(cpu);
+    }
+}
+
 void kvm_arch_do_init_vcpu(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 2ed586c11b..b7c38ba2c4 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -38,6 +38,7 @@ bool kvm_has_adjust_clock_stable(void);
 bool kvm_has_exception_payload(void);
 void kvm_synchronize_all_tsc(void);
 void kvm_arch_reset_vcpu(X86CPU *cs);
+void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
-- 
2.37.3


