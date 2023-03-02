Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486326A82EB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8d-0003op-S3; Thu, 02 Mar 2023 07:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi66-0000mp-Tl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi65-00039C-9S
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3PERiA99v5BqZPxeFuaYyRH8F2vcKSdk+7kSyjxX/o=;
 b=N33UfMdNJNrZs0M39VJ69Nfb8zn0f0El+N2oQbkNw3OAVt9xdc/diGms12kMxgixE7onVs
 okDUUm9Nuo4lx9/blwT26HEaXWwy/9pTmjF98wHyjkudnn3hBm2F/ENSE1/6zYDiKuxV72
 ZqocJ5MPgJxNghLf6TX6qRyRnC3dBCw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-SGcefpDjOiedl9oOWKGHXg-1; Thu, 02 Mar 2023 07:31:43 -0500
X-MC-Unique: SGcefpDjOiedl9oOWKGHXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5692777wmb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3PERiA99v5BqZPxeFuaYyRH8F2vcKSdk+7kSyjxX/o=;
 b=i/LPsfiCNG7qYSuL57BAfDT/fDl4l13Qd09hEK5CU0qrISvACd+AUYqBCkWYy3OuFG
 X9FKKnjjGGJY4qvvWVo9GxIVx/Sd1SheypWmAnP+JagY3ojawgtHa6yZcQgmebr+6O/r
 3y2VAO2C2YeaxzvKiNYXeb20+491Fm4U5B8rYU1VdbS8QxigYA0b/6nqpy7ZYxBVqtMf
 O4DbSr6lAQn3g82JDxiP/OFplA8h1Z3wfFg29SsfEOpDkKncji+q2j1RjhgO3iUcrKcS
 n51/1ED0nLtxFSMzf49ZiG1Ag8qHnvrCbvERBjC/mwBMxbaoMGI/2Xhv1Se3G78dNjKM
 a4KA==
X-Gm-Message-State: AO0yUKUzVD5xf7DByDJgqM2uqNdGIMoMQiLxHTmqatxbO/6yCIJNtLvf
 NxeVDhL0TMGiwaDhPdWlhwM36DizYhrUoB9DCENPqO+1eUjd3ad+TNGEXZt0QjnsCrkyUQgBOld
 OG809YQsdAJtRLqFP74qBQM036hE1MQk7wmeEpI2Q1iFlwIJYRblYdUCPdFTDF6wVJ/Jb13E96/
 M=
X-Received: by 2002:a05:600c:3ac9:b0:3e7:6a59:d9d3 with SMTP id
 d9-20020a05600c3ac900b003e76a59d9d3mr7042376wms.37.1677760301712; 
 Thu, 02 Mar 2023 04:31:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8nuiWDT6NxYeE5+cp1oP1h/ftCL1f2oeH2g11Au0EGpdOBx8JqaWzxS7dBkJDvhVp7JQCGaA==
X-Received: by 2002:a05:600c:3ac9:b0:3e7:6a59:d9d3 with SMTP id
 d9-20020a05600c3ac900b003e76a59d9d3mr7042364wms.37.1677760301412; 
 Thu, 02 Mar 2023 04:31:41 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b002c56179d39esm15019744wro.44.2023.03.02.04.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 23/62] i386/xen: handle VCPUOP_register_runstate_memory_area
Date: Thu,  2 Mar 2023 13:29:50 +0100
Message-Id: <20230302123029.153265-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Allow guest to setup the vcpu runstates which is used as
steal clock.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h         |  1 +
 target/i386/kvm/xen-emu.c | 57 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c     |  1 +
 3 files changed, 59 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7c39d917e8eb..5613df6d75a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1802,6 +1802,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
+    uint64_t xen_vcpu_runstate_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 04832522f5ca..c0a8e4c34e70 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -160,6 +160,7 @@ int kvm_xen_init_vcpu(CPUState *cs)
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
+    env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
     return 0;
 }
@@ -254,6 +255,17 @@ static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_time_info_gpa);
 }
 
+static void do_set_vcpu_runstate_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_runstate_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                          env->xen_vcpu_runstate_gpa);
+}
+
 static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -262,10 +274,14 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
+    env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                          INVALID_GPA);
+
 }
 
 static int xen_set_shared_info(uint64_t gfn)
@@ -517,6 +533,35 @@ static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
+                                         uint64_t arg)
+{
+    struct vcpu_register_runstate_memory_area rma;
+    uint64_t gpa;
+    size_t len;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(rma) == 8);
+    /* The runstate area actually does change size, but Linux copes. */
+
+    if (!target) {
+        return -ENOENT;
+    }
+
+    if (kvm_copy_from_gva(cs, arg, &rma, sizeof(rma))) {
+        return -EFAULT;
+    }
+
+    /* As with vcpu_time_info, Xen actually uses the GVA but KVM doesn't. */
+    if (!kvm_gva_to_gpa(cs, rma.addr.p, &gpa, &len, false)) {
+        return -EFAULT;
+    }
+
+    async_run_on_cpu(target, do_set_vcpu_runstate_gpa,
+                     RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
@@ -525,6 +570,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_runstate_memory_area:
+        err = vcpuop_register_runstate_info(cs, dest, arg);
+        break;
     case VCPUOP_register_vcpu_time_memory_area:
         err = vcpuop_register_vcpu_time_info(cs, dest, arg);
         break;
@@ -730,6 +778,15 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    gpa = env->xen_vcpu_runstate_gpa;
+    if (gpa != INVALID_GPA) {
+        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                                    gpa);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index eb657907ca68..3f3d436aaaa0 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1273,6 +1273,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.1


