Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3753445D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:38:21 +0200 (CEST)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwpo-0007jm-UW
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhQ-00060w-4U
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhL-0003sd-57
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyaAVt5qF1/CRxSwd34RasuaWblBBQKY8e8rZNkUw3c=;
 b=Z1MtpvREHe4ZPNHGloClv7q7bkzLhNF0GIsReI+u1gvTNlCblx3QvaOMPMoG1qbaQLaifs
 WUGDjeiFQmMET5JeSwacbjNFc/2F5VIslcZ2xNro8OstvxwoWXLyKrZQC4xxNostz40vyL
 IrVAN4C9Z3yfAoy3VCCjsEfy1lohC8k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197--HVcI9mtN7uqlS_9vHzHlA-1; Wed, 25 May 2022 15:29:32 -0400
X-MC-Unique: -HVcI9mtN7uqlS_9vHzHlA-1
Received: by mail-ej1-f72.google.com with SMTP id
 bt15-20020a170906b14f00b006fe9c3afbc2so8319201ejb.17
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyaAVt5qF1/CRxSwd34RasuaWblBBQKY8e8rZNkUw3c=;
 b=OI0Opw1lNBcq+XWDDVYOegLz6vSqdOT4uIgSrcTdFZwr1VCuCiHoWwvnq11FEw3gy9
 RnARAUw9awQI5zdheVSjxRR9v+80vAPt5GM3rCw+Cb9SsyqAqu7XV8MjclMO8AnaQaRC
 wkXfjeswQiVhl14JcVhaERdBQtq4UmrGWgt+NXXrOtGJTcRfUuJ05qD7iBxwq+fiuMir
 qIfoZJ8y58zpc7fVZUyhYq26nuy6n9BXHZY9u/a/VHwiGBAnR/FMbhHSeTg9MdfXwtdN
 glBl0+2SMroAKb5VpVf0p8cvCowEQfPdZs3gKVXVV2uG6qk7S/TgmOE+tIvS64eeNhof
 eohw==
X-Gm-Message-State: AOAM531wAiaCnJQal16oT3GnbSJnfcUa8In0gwfJxc6GUeCVWm+6u6GI
 tiGQbIjSCwY5yQ1hkHlOBRwtvThGE9L4tMX8F/ErUUiUG7TYeIC4yURsjvftORzGj8xx3zzTp0C
 MG74SiZ5Q0+pELVr9krOjObyANjwzy9Wv/HRd8HGiqv4ZqrUUMxYIxtnPrBEPIlETyA4=
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr30022194ejn.437.1653506971102; 
 Wed, 25 May 2022 12:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIOPBPnZlUqEYXWPjstgOay212ZAwwHV3CHiYBgzOcApzDGAAiq/8d4tq2xFWXXrHLOgIuWg==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr30022177ejn.437.1653506970820; 
 Wed, 25 May 2022 12:29:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 y20-20020a50eb94000000b0042617ba63c4sm10993201edr.78.2022.05.25.12.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 15/17] i386: Hyper-V Support extended GVA ranges for TLB flush
 hypercalls
Date: Wed, 25 May 2022 21:28:50 +0200
Message-Id: <20220525192852.301633-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Vitaly Kuznetsov <vkuznets@redhat.com>

KVM kind of supported "extended GVA ranges" (up to 4095 additional GFNs
per hypercall) since the implementation of Hyper-V PV TLB flush feature
(Linux-4.18) as regardless of the request, full TLB flush was always
performed. "Extended GVA ranges for TLB flush hypercalls" feature bit
wasn't exposed then. Now, as KVM gains support for fine-grained TLB
flush handling, exposing this feature starts making sense.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220525115949.1294004-5-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt                | 7 +++++++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 1 +
 target/i386/cpu.c              | 2 ++
 target/i386/kvm/kvm.c          | 8 ++++++++
 5 files changed, 19 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index af1b10c0b3..4b132b1c94 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -255,6 +255,13 @@ Hyper-V specification allows to pass parameters for certain hypercalls using XMM
 registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
 for faster hypercalls processing as KVM can avoid reading guest's memory.
 
+3.24. hv-tlbflush-ext
+=====================
+Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
+(HvFlushVirtualAddressList/HvFlushVirtualAddressListEx).
+
+Requires: hv-tlbflush
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 37e9553584..5ff48257e5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1108,6 +1108,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_SYNDBG              16
 #define HYPERV_FEAT_MSR_BITMAP          17
 #define HYPERV_FEAT_XMM_INPUT           18
+#define HYPERV_FEAT_TLBFLUSH_EXT        19
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index f5f16474fa..c7854ed6d3 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -59,6 +59,7 @@
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
 #define HV_FEATURE_DEBUG_MSRS_AVAILABLE         (1u << 11)
+#define HV_EXT_GVA_RANGES_FLUSH_AVAILABLE       (1u << 14)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
 
 /*
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 63cec0ea68..3429a4e455 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6972,6 +6972,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
                       HYPERV_FEAT_XMM_INPUT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_EXT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7e6f934eda..a11c8e88f6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -987,6 +987,14 @@ static struct {
              .bits = HV_HYPERCALL_XMM_INPUT_AVAILABLE}
         }
     },
+    [HYPERV_FEAT_TLBFLUSH_EXT] = {
+        .desc = "Extended gva ranges for TLB flush hypercalls (hv-tlbflush-ext)",
+        .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
+             .bits = HV_EXT_GVA_RANGES_FLUSH_AVAILABLE}
+        },
+        .dependencies = BIT(HYPERV_FEAT_TLBFLUSH)
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.36.1



