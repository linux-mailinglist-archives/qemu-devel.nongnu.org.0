Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D87528976
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:05:05 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdDU-0003GN-1X
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd52-0001sO-VA
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd51-0003Mu-3g
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1Mm2tW2WvCffZrKZWsjQDyjp4fFpeYpXS5+HH77de8=;
 b=chKamWIkDZjhswbhbsyWUSxjKBEmcDUS1/5TzmZfzaCOIv+jQ4tUt5qEcCfos1ZxcKJ6Q4
 zSGcDhPwIFUoj23ZVdHvFk+fTwmhPztRBlpVG6CN59PW0bBBj+Us9eJJ2wMia7zVW2E4Gv
 gc61OjeB6afh8qR2SfXruy0pPMqRoSY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-mSTkTPRuMoKBBG-uG_DAKA-1; Mon, 16 May 2022 11:56:16 -0400
X-MC-Unique: mSTkTPRuMoKBBG-uG_DAKA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so10046988edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1Mm2tW2WvCffZrKZWsjQDyjp4fFpeYpXS5+HH77de8=;
 b=aJ3LqsjwZFuF5erj015LIgA6VOcI49cv1GB5YD5ffFFnoOn79QlEOKLTZQpnKAOYT2
 BlwX4dhS1UZP+t+Ygyn9AHC/hDmDqZxFIAxG9NMrYjHaJEPtdRaDBYCmpWRUXSN+Xp0q
 qgBWsYygBHFgZAe4P21CEsGIy7tTE6wzcD8FLZRQQ6NWJue20zoHnHsms0pqFO7j6Sfb
 D5RbV6fDjRrhstGojl0OvNn3/cpGgq4SJPjDmWooyk7s/4eJng3PGDGpdugt/fQP2Cs7
 ijaZm7R/Ga6pVRSIhuI4PpyZw6EaPV1gJhTx8Bp4+uxgfCg3ZkaI5Libs+utkJkqIYOe
 nDgg==
X-Gm-Message-State: AOAM530so3iSVwmWImy6PdhyiQ9M9EytwS/Pd9+QTS210E2yfI2SfI9p
 v/GkBIX2Rex1w00XFafgblFjP86x0e6LsOWdOpE+7MYHKPjeN396kbqVxQjgshk46baCU4LR27n
 Rn4oFUGGcpK5/3VtooEJ6QB02HsjdPvXGaw4hU4l0luOtGDEHO7X6oAP9qRaapiKeq78=
X-Received: by 2002:a05:6402:3298:b0:42a:a91d:905b with SMTP id
 f24-20020a056402329800b0042aa91d905bmr9173480eda.373.1652716575281; 
 Mon, 16 May 2022 08:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw604kUcU5kcTc/p9xxOlEZmGvRQVr0pmQ8a6LYHICCsz0RffApJbEGY2hO9udlMq2gpz1SyA==
X-Received: by 2002:a05:6402:3298:b0:42a:a91d:905b with SMTP id
 f24-20020a056402329800b0042aa91d905bmr9173459eda.373.1652716575015; 
 Mon, 16 May 2022 08:56:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709063f4500b006f3ef214e46sm27231ejj.172.2022.05.16.08.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>, Like Xu <like.xu@linux.intel.com>
Subject: [PULL 06/23] target/i386: Add lbr-fmt vPMU option to support guest LBR
Date: Mon, 16 May 2022 17:55:46 +0200
Message-Id: <20220516155603.1234712-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
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

From: Yang Weijiang <weijiang.yang@intel.com>

The Last Branch Recording (LBR) is a performance monitor unit (PMU)
feature on Intel processors which records a running trace of the most
recent branches taken by the processor in the LBR stack. This option
indicates the LBR format to enable for guest perf.

The LBR feature is enabled if below conditions are met:
1) KVM is enabled and the PMU is enabled.
2) msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM.
3) Supported returned value for lbr_fmt from above msr is non-zero.
4) Guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM.
5) User-provided lbr-fmt value doesn't violate its bitmask (0x3f).
6) Target guest LBR format matches that of host.

Co-developed-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-3-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 10 ++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6083e556f5..856a8659e8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6275,6 +6275,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
+    unsigned requested_lbr_fmt;
 
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
@@ -6292,6 +6293,42 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
+    /*
+     * Override env->features[FEAT_PERF_CAPABILITIES].LBR_FMT
+     * with user-provided setting.
+     */
+    if (cpu->lbr_fmt != ~PERF_CAP_LBR_FMT) {
+        if ((cpu->lbr_fmt & PERF_CAP_LBR_FMT) != cpu->lbr_fmt) {
+            error_setg(errp, "invalid lbr-fmt");
+            return;
+        }
+        env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
+        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
+    }
+
+    /*
+     * vPMU LBR is supported when 1) KVM is enabled 2) Option pmu=on and
+     * 3)vPMU LBR format matches that of host setting.
+     */
+    requested_lbr_fmt =
+        env->features[FEAT_PERF_CAPABILITIES] & PERF_CAP_LBR_FMT;
+    if (requested_lbr_fmt && kvm_enabled()) {
+        uint64_t host_perf_cap =
+            x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
+        unsigned host_lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;
+
+        if (!cpu->enable_pmu) {
+            error_setg(errp, "vPMU: LBR is unsupported without pmu=on");
+            return;
+        }
+        if (requested_lbr_fmt != host_lbr_fmt) {
+            error_setg(errp, "vPMU: the lbr-fmt value (0x%x) does not match "
+                        "the host value (0x%x).",
+                        requested_lbr_fmt, host_lbr_fmt);
+            return;
+        }
+    }
+
     x86_cpu_filter_features(cpu, cpu->check_cpuid || cpu->enforce_cpuid);
 
     if (cpu->enforce_cpuid && x86_cpu_have_filtered_features(cpu)) {
@@ -6644,6 +6681,8 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
     object_property_add_alias(obj, "hv-apicv", obj, "hv-avic");
+    cpu->lbr_fmt = ~PERF_CAP_LBR_FMT;
+    object_property_add_alias(obj, "lbr_fmt", obj, "lbr-fmt");
 
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
@@ -6798,6 +6837,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_UINT64_CHECKMASK("lbr-fmt", X86CPU, lbr_fmt, PERF_CAP_LBR_FMT),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9661f9fbd1..6730df5dbf 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -386,6 +386,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT                0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1810,6 +1811,15 @@ struct ArchCPU {
      */
     bool enable_pmu;
 
+    /*
+     * Enable LBR_FMT bits of IA32_PERF_CAPABILITIES MSR.
+     * This can't be initialized with a default because it doesn't have
+     * stable ABI support yet. It is only allowed to pass all LBR_FMT bits
+     * returned by kvm_arch_get_supported_msr_feature()(which depends on both
+     * host CPU and kernel capabilities) to the guest.
+     */
+    uint64_t lbr_fmt;
+
     /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
      * disabled by default to avoid breaking migration between QEMU with
      * different LMCE configurations.
-- 
2.36.0


