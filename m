Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAC528B46
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:56:11 +0200 (CEST)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe0w-0000Kg-Eu
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd54-0001wH-1G
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd52-0003My-Bc
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6Iq5klB4OYdeLKmv3MKps+y2xcYAT0ThmiCm0ZXWxE=;
 b=ISJ1ItH7nGe0GfUG1ToIxgKcdE2jyvZK4Pq5EN9RtJfabLrim+eXFzwdh9IqCbI0Cd0aza
 /AjebU6YMWu+FxTqEh0aZeKFZ70kRstwag1e7ViCcxje7Yzf/p5Q0qCyw1U+QfFf/J01cm
 mFtp8fX7s/YpRDw7JJyVI3OYFHed7eE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-2ElxoDDjMMuSzHNNjoLRsg-1; Mon, 16 May 2022 11:56:18 -0400
X-MC-Unique: 2ElxoDDjMMuSzHNNjoLRsg-1
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso10068842edv.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6Iq5klB4OYdeLKmv3MKps+y2xcYAT0ThmiCm0ZXWxE=;
 b=CxFw3n1bUg7wkPT7V9T+Sd6D8RyNAjYBKVOHfletIv2chKmazuKICWWHEl+sjCcMC+
 QurmlmqTUZ9euj6Eb+M/qsvj0yJC3S0f8u4esw+uXq5iaK2TJJEOLUGGRqtiRSm4M/4t
 j3FVxsMN29smVF3SoH5G/Suxt5itca6kAxq+D1/ahgS2m9JtW2Rcgp4+Fa3vgW2p9PZr
 oDkgkZ9dEizw4QxnJ23Cg9oIM0uVk7mjp5OQ8jLUfxMZ08e30ZNXMpnOa+R2htXtJ9cA
 fi7PUjUHY0wSxAkB6xaEuOJAJl1Uvtb6/19JoM/G+ql0XDLjic4QkJOl6e0UCYTrGbHa
 KUPQ==
X-Gm-Message-State: AOAM532r2JZywq+ZGp4PNw8OwXQaM3ee8fNWjHWtRnqafT+chby/Hloo
 HIwa80uVRHTHfIOOZFFIItMExrcGE6cv1drTk3myyaVrtg4J7TYXx8PYA4jY6zy6NfpqOGV4jzc
 fMd9b1no8WDwEbo9/WsxD2tIaztcJ0Erh/nN8aXNXRN32qPHy/UVPwjV0UWnVGwmXRDs=
X-Received: by 2002:a05:6402:34c6:b0:427:c65d:c254 with SMTP id
 w6-20020a05640234c600b00427c65dc254mr14008192edc.88.1652716576861; 
 Mon, 16 May 2022 08:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQWt2d49vGbZlh1AL5ymR2LH2z2BR6zjyeBtcQmx3+DJqIBHsntipzuEZmNkzjIXWC2M0BZg==
X-Received: by 2002:a05:6402:34c6:b0:427:c65d:c254 with SMTP id
 w6-20020a05640234c600b00427c65dc254mr14008169edc.88.1652716576610; 
 Mon, 16 May 2022 08:56:16 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 gv29-20020a1709072bdd00b006f3ef214e06sm44898ejc.108.2022.05.16.08.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 07/23] target/i386: Add kvm_get_one_msr helper
Date: Mon, 16 May 2022 17:55:47 +0200
Message-Id: <20220516155603.1234712-8-pbonzini@redhat.com>
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

When try to get one msr from KVM, I found there's no such kind of
existing interface while kvm_put_one_msr() is there. So here comes
the patch. It'll remove redundant preparation code before finally
call KVM_GET_MSRS IOCTL.

No functional change intended.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-4-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 46 ++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c885763a5b..536cbe5fad 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -141,6 +141,7 @@ static struct kvm_msr_list *kvm_feature_msrs;
 
 #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
 static RateLimit bus_lock_ratelimit_ctrl;
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
 
 int kvm_has_pit_state2(void)
 {
@@ -211,28 +212,21 @@ static int kvm_get_tsc(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    struct {
-        struct kvm_msrs info;
-        struct kvm_msr_entry entries[1];
-    } msr_data = {};
+    uint64_t value;
     int ret;
 
     if (env->tsc_valid) {
         return 0;
     }
 
-    memset(&msr_data, 0, sizeof(msr_data));
-    msr_data.info.nmsrs = 1;
-    msr_data.entries[0].index = MSR_IA32_TSC;
     env->tsc_valid = !runstate_is_running();
 
-    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
+    ret = kvm_get_one_msr(cpu, MSR_IA32_TSC, &value);
     if (ret < 0) {
         return ret;
     }
 
-    assert(ret == 1);
-    env->tsc = msr_data.entries[0].data;
+    env->tsc = value;
     return 0;
 }
 
@@ -1566,21 +1560,14 @@ static int hyperv_init_vcpu(X86CPU *cpu)
          * the kernel doesn't support setting vp_index; assert that its value
          * is in sync
          */
-        struct {
-            struct kvm_msrs info;
-            struct kvm_msr_entry entries[1];
-        } msr_data = {
-            .info.nmsrs = 1,
-            .entries[0].index = HV_X64_MSR_VP_INDEX,
-        };
+        uint64_t value;
 
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_MSRS, &msr_data);
+        ret = kvm_get_one_msr(cpu, HV_X64_MSR_VP_INDEX, &value);
         if (ret < 0) {
             return ret;
         }
-        assert(ret == 1);
 
-        if (msr_data.entries[0].data != hyperv_vp_index(CPU(cpu))) {
+        if (value != hyperv_vp_index(CPU(cpu))) {
             error_report("kernel's vp_index != QEMU's vp_index");
             return -ENXIO;
         }
@@ -2839,6 +2826,25 @@ static int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
 }
 
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
+{
+    int ret;
+    struct {
+        struct kvm_msrs info;
+        struct kvm_msr_entry entries[1];
+    } msr_data = {
+        .info.nmsrs = 1,
+        .entries[0].index = index,
+    };
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
+    if (ret < 0) {
+        return ret;
+    }
+    assert(ret == 1);
+    *value = msr_data.entries[0].data;
+    return ret;
+}
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
 {
     int ret;
-- 
2.36.0


