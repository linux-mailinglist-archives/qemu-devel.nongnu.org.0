Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065771F6F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:54:58 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUDx-00050K-3x
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAH-0001dA-Hd
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57397
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAD-0001Nt-IX
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkkl1XmEkm53grcqvOr+ZivD+Z2ANG5k7fTA9QM7cbY=;
 b=JhM6h7CLBWWd4VOnjK/0ykovEdl3MUd1892wZcUsLuZF+x0g8cHYtY6zzjVX877PVWiidb
 8Fz9nlF8ndL+qkejPjlI4LI7UbnJu0h3MoMQpbewPxE2hlN7FVUFTebR8LSXAsekBHIbzJ
 uAcfUOSQP+1UnPLs30HuYf6NgRenl3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-Hsk0Gu9DO_mNoKxNKClXyw-1; Thu, 11 Jun 2020 15:46:58 -0400
X-MC-Unique: Hsk0Gu9DO_mNoKxNKClXyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCF3E8B8C60;
 Thu, 11 Jun 2020 19:46:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6789C60CC0;
 Thu, 11 Jun 2020 19:46:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 088/115] i386: hvf: Drop useless declarations in sysemu
Date: Thu, 11 Jun 2020 15:44:22 -0400
Message-Id: <20200611194449.31468-89-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

They're either declared elsewhere or have no use.

While at it, rename _hvf_cpu_synchronize_post_init() to
do_hvf_cpu_synchronize_post_init().

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200528193758.51454-3-r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/hvf.h  | 22 ----------------------
 target/i386/hvf/hvf.c |  7 ++++---
 2 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index 644bdfc722..2af32e505e 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -30,35 +30,13 @@ extern bool hvf_allowed;
 #define hvf_get_supported_cpuid(func, idx, reg) 0
 #endif /* !CONFIG_HVF */
 
-/* Disable HVF if |disable| is 1, otherwise, enable it iff it is supported by
- * the host CPU. Use hvf_enabled() after this to get the result. */
-void hvf_disable(int disable);
-
-/* Returns non-0 if the host CPU supports the VMX "unrestricted guest" feature
- * which allows the virtual CPU to directly run in "real mode". If true, this
- * allows QEMU to run several vCPU threads in parallel (see cpus.c). Otherwise,
- * only a a single TCG thread can run, and it will call HVF to run the current
- * instructions, except in case of "real mode" (paging disabled, typically at
- * boot time), or MMIO operations. */
-
-int hvf_sync_vcpus(void);
-
 int hvf_init_vcpu(CPUState *);
 int hvf_vcpu_exec(CPUState *);
-int hvf_smp_cpu_exec(CPUState *);
 void hvf_cpu_synchronize_state(CPUState *);
 void hvf_cpu_synchronize_post_reset(CPUState *);
 void hvf_cpu_synchronize_post_init(CPUState *);
-void _hvf_cpu_synchronize_post_init(CPUState *, run_on_cpu_data);
-
 void hvf_vcpu_destroy(CPUState *);
-void hvf_raise_event(CPUState *);
-/* void hvf_reset_vcpu_state(void *opaque); */
 void hvf_reset_vcpu(CPUState *);
-void vmx_update_tpr(CPUState *);
-void update_apic_tpr(CPUState *);
-int hvf_put_registers(CPUState *);
-void vmx_clear_int_window_exiting(CPUState *cpu);
 
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index d72543dc31..9ccdb7e7c7 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -251,7 +251,7 @@ void vmx_update_tpr(CPUState *cpu)
     }
 }
 
-void update_apic_tpr(CPUState *cpu)
+static void update_apic_tpr(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     int tpr = rreg(cpu->hvf_fd, HV_X86_TPR) >> 4;
@@ -312,7 +312,8 @@ void hvf_cpu_synchronize_post_reset(CPUState *cpu_state)
     run_on_cpu(cpu_state, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-void _hvf_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
+static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
+                                             run_on_cpu_data arg)
 {
     CPUState *cpu_state = cpu;
     hvf_put_registers(cpu_state);
@@ -321,7 +322,7 @@ void _hvf_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
 
 void hvf_cpu_synchronize_post_init(CPUState *cpu_state)
 {
-    run_on_cpu(cpu_state, _hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
+    run_on_cpu(cpu_state, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
 
 static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
-- 
2.26.2



