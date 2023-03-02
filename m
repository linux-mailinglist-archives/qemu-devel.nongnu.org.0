Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F36A82B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8e-0003p0-76; Thu, 02 Mar 2023 07:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi63-0000gW-PA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi62-00038c-0i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XhSrxs/zdUi9tnVi5PM2bz6j87O1lkWsZycP8yMoMA=;
 b=YMt/LeLzoL5KhJfYGMBPeCJqP5fg3GkA1Ngf+fNvkJ/u746qtPyBW0v8CD0yXiUhzQJMFO
 oD58VAsA2aCb0NIQlINV2cGKJCMK/kNBJMgdWPWSXQ/HcS3upgvxRhLPzkSC+ID5q87ZKh
 mV/2stINF6qSEXFFjj7K9b/2HE8vXpg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-ZcwKPMtkO-mf4E2lxl-69g-1; Thu, 02 Mar 2023 07:31:40 -0500
X-MC-Unique: ZcwKPMtkO-mf4E2lxl-69g-1
Received: by mail-wm1-f71.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so1189241wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XhSrxs/zdUi9tnVi5PM2bz6j87O1lkWsZycP8yMoMA=;
 b=nkDN6pkHOCXiOQZjSK5brBuUD+TENFmjv5WWKi+L3Iyul77/lvgQ4+aY6SNWR1mZLy
 ELdtHZJvDbGEy9wk2HoTy/ReYNFs9CP1Xtdrn0PYZFfTqJA2vq//NZ4nVmz6Xh3b53DA
 HxzSf94bF65Hw/7kbGvV734Q4z8WiqSiumw693jhTWOjQ6X4BxVsxKNCFjKf9kotg6zI
 Rhkq3fgKgL0LgpJAHuKd7hew7i1mOKf+/d5yY653bPV3Jfdb/VgkfBSCFdjx2oOPwgHf
 fIFjG+DPNK8sriidgFEQg+lol2LPLftj11l/4nniT+u31/YXB1y3Ucl5gzHT0rmi5QIC
 qqkA==
X-Gm-Message-State: AO0yUKXu+/WUmjVhjvxJXHPsApfIIEl7rqgR+lF9SkXhkhkZ88jEndU7
 HFI+VTkexwYmKLDdyKM5Afyne0VCaiLrfPTXwoAfCuVv/YRDXCcAEUtN7I8Kmrp8DUUaeuRe1aa
 o1oianFNeKt76e8csQMHtQ2BWtAYah438qrdFY0tPROtmw+vJZgTrqnKBCOaOFMJPni1ZYk+m+/
 0=
X-Received: by 2002:a05:600c:c88:b0:3eb:3974:aad7 with SMTP id
 fj8-20020a05600c0c8800b003eb3974aad7mr7633341wmb.24.1677760298972; 
 Thu, 02 Mar 2023 04:31:38 -0800 (PST)
X-Google-Smtp-Source: AK7set89OisegUi+0chwWWgOTj33IyMKxmCo5ivRelfR1joP/exjSSpVUGU0/JhrbgJT96oPWqTVxg==
X-Received: by 2002:a05:600c:c88:b0:3eb:3974:aad7 with SMTP id
 fj8-20020a05600c0c8800b003eb3974aad7mr7633325wmb.24.1677760298655; 
 Thu, 02 Mar 2023 04:31:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003dfee43863fsm3071052wmo.26.2023.03.02.04.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 22/62] i386/xen: handle VCPUOP_register_vcpu_time_info
Date: Thu,  2 Mar 2023 13:29:49 +0100
Message-Id: <20230302123029.153265-23-pbonzini@redhat.com>
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

In order to support Linux vdso in Xen.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h         |   1 +
 target/i386/kvm/xen-emu.c | 102 +++++++++++++++++++++++++++++++++-----
 target/i386/machine.c     |   1 +
 3 files changed, 91 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9070efdc5184..7c39d917e8eb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1801,6 +1801,7 @@ typedef struct CPUArchState {
     struct kvm_nested_state *nested_state;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
+    uint64_t xen_vcpu_time_info_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 30b4789da394..04832522f5ca 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -37,28 +37,41 @@
 #define hypercall_compat32(longmode) (false)
 #endif
 
-static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
-                      bool is_write)
+static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
+                           size_t *len, bool is_write)
 {
-    uint8_t *buf = (uint8_t *)_buf;
-    int ret;
-
-    while (sz) {
         struct kvm_translation tr = {
             .linear_address = gva,
         };
 
-        size_t len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
+        if (len) {
+            *len = TARGET_PAGE_SIZE - (gva & ~TARGET_PAGE_MASK);
+        }
+
+        if (kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr) || !tr.valid ||
+            (is_write && !tr.writeable)) {
+            return false;
+        }
+        *gpa = tr.physical_address;
+        return true;
+}
+
+static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
+                      bool is_write)
+{
+    uint8_t *buf = (uint8_t *)_buf;
+    uint64_t gpa;
+    size_t len;
+
+    while (sz) {
+        if (!kvm_gva_to_gpa(cs, gva, &gpa, &len, is_write)) {
+            return -EFAULT;
+        }
         if (len > sz) {
             len = sz;
         }
 
-        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
-        if (ret || !tr.valid || (is_write && !tr.writeable)) {
-            return -EFAULT;
-        }
-
-        cpu_physical_memory_rw(tr.physical_address, buf, len, is_write);
+        cpu_physical_memory_rw(gpa, buf, len, is_write);
 
         buf += len;
         sz -= len;
@@ -146,6 +159,7 @@ int kvm_xen_init_vcpu(CPUState *cs)
 
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
+    env->xen_vcpu_time_info_gpa = INVALID_GPA;
 
     return 0;
 }
@@ -229,6 +243,17 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_info_gpa);
 }
 
+static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_time_info_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                          env->xen_vcpu_time_info_gpa);
+}
+
 static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -236,8 +261,11 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
+    env->xen_vcpu_time_info_gpa = INVALID_GPA;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                          INVALID_GPA);
 }
 
 static int xen_set_shared_info(uint64_t gfn)
@@ -453,6 +481,42 @@ static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
+                                          uint64_t arg)
+{
+    struct vcpu_register_time_memory_area tma;
+    uint64_t gpa;
+    size_t len;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(tma) == 8);
+    qemu_build_assert(sizeof(struct vcpu_time_info) == 32);
+
+    if (!target) {
+        return -ENOENT;
+    }
+
+    if (kvm_copy_from_gva(cs, arg, &tma, sizeof(tma))) {
+        return -EFAULT;
+    }
+
+    /*
+     * Xen actually uses the GVA and does the translation through the guest
+     * page tables each time. But Linux/KVM uses the GPA, on the assumption
+     * that guests only ever use *global* addresses (kernel virtual addresses)
+     * for it. If Linux is changed to redo the GVA→GPA translation each time,
+     * it will offer a new vCPU attribute for that, and we'll use it instead.
+     */
+    if (!kvm_gva_to_gpa(cs, tma.addr.p, &gpa, &len, false) ||
+        len < sizeof(struct vcpu_time_info)) {
+        return -EFAULT;
+    }
+
+    async_run_on_cpu(target, do_set_vcpu_time_info_gpa,
+                     RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
@@ -461,6 +525,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_vcpu_time_memory_area:
+        err = vcpuop_register_vcpu_time_info(cs, dest, arg);
+        break;
     case VCPUOP_register_vcpu_info:
         err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
@@ -654,6 +721,15 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    gpa = env->xen_vcpu_time_info_gpa;
+    if (gpa != INVALID_GPA) {
+        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                                    gpa);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 1215e616c8f4..eb657907ca68 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1272,6 +1272,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.1


