Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDD53448D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:51:15 +0200 (CEST)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntx2I-0000dK-R0
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhL-0005mt-87
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhJ-0003sV-8u
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4COWhg2GjaPXUplNM84dH23IvoIBZrR6ECSXr0Lue8=;
 b=E9GZec7Bq3JPKkgnpbF+jJ3PDpkmmXZdJ7CQ0LhdzTPQDLRvlclgyDnAhoWBegCPfhftM0
 lrakvkPTUOfIRwtWZgbJ+DohjeLcwwSnnwZlrzfk+pwsxtweoBjarSi0w8elMH+/wRin90
 ofOaVPQRidG6Lrsyj7LPtLbWQx+yyuc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-dOOY2SjcM_6bRBN-YdM7qQ-1; Wed, 25 May 2022 15:29:31 -0400
X-MC-Unique: dOOY2SjcM_6bRBN-YdM7qQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l18-20020aa7d952000000b0042ab7be9adaso15477803eds.21
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4COWhg2GjaPXUplNM84dH23IvoIBZrR6ECSXr0Lue8=;
 b=NA5UQ9EQEPtA2Rt1W/8+DtQXq+Zg6ztT1AxQgeLFfSKJl61w/pfAN9+rqHEOdGl5ma
 mmvcLToATuje1JxkQwwOWTzxGV1E1LhVUEf1f7e+xWyAzwngliYvX1SC8veHyi9rB7c1
 qP0/cLK+upCUg7r/hhe6Oikcgqa9CUylIsu0nugRGyTDKTlyu5x3UGorZVMrueymzVqr
 gUWG6Lv7OjCuCI025/f4vvZvPwA6dQBFDYiCG8JsYPdyRcDRp9OicipZ0iepXVWcVuWi
 EhBixL31QUTlC1AFhtwC0ZcOEV5UAaTrhCdvjzhJ638VuGetvgtH4q6OWsfi4HRA5CU4
 JfIw==
X-Gm-Message-State: AOAM530vPr77YblxqIvoaCYB8rsZ7ZUt2Ao+1F/hgxZKctFxgs/v96QS
 2hqgp8jzgYJ/IGpNoJGJpgkfy4OlLOE0e085Ko3iAtcuGB1VH+aDm5rfMh2JiXkvjo0PDeVz6ba
 APjjfLun9cMj8e0A7Fl0LBNz3hDuts7O3FGzY79CQHoPDhFlR2Tap+7j2pSpu1R05vuA=
X-Received: by 2002:a17:907:11ce:b0:6fe:9dcc:b983 with SMTP id
 va14-20020a17090711ce00b006fe9dccb983mr28433156ejb.290.1653506969351; 
 Wed, 25 May 2022 12:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWQpB78tjOOs2KW7WwtzarYCGGkeqZvYODchgw8gbgPjlx82qTL5AnXs/E2ublO0nJoHwAAg==
X-Received: by 2002:a17:907:11ce:b0:6fe:9dcc:b983 with SMTP id
 va14-20020a17090711ce00b006fe9dccb983mr28433123ejb.290.1653506968949; 
 Wed, 25 May 2022 12:29:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 b60-20020a509f42000000b0042bb1e2e2f7sm1561525edf.8.2022.05.25.12.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 14/17] i386: Hyper-V XMM fast hypercall input feature
Date: Wed, 25 May 2022 21:28:49 +0200
Message-Id: <20220525192852.301633-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Hyper-V specification allows to pass parameters for certain hypercalls
using XMM registers ("XMM Fast Hypercall Input"). When the feature is
in use, it allows for faster hypercalls processing as KVM can avoid
reading guest's memory.

KVM supports the feature since v5.14.

Rename HV_HYPERCALL_{PARAMS_XMM_AVAILABLE -> XMM_INPUT_AVAILABLE} to
comply with KVM.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220525115949.1294004-4-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt                | 6 ++++++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 2 +-
 target/i386/cpu.c              | 2 ++
 target/i386/kvm/kvm.c          | 7 +++++++
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5d85569b99..af1b10c0b3 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -249,6 +249,12 @@ Enlightened VMCS ('hv-evmcs') feature to also be enabled.
 
 Recommended: hv-evmcs (Intel)
 
+3.23. hv-xmm-input
+===================
+Hyper-V specification allows to pass parameters for certain hypercalls using XMM
+registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
+for faster hypercalls processing as KVM can avoid reading guest's memory.
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c788285736..37e9553584 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1107,6 +1107,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_SYNDBG              16
 #define HYPERV_FEAT_MSR_BITMAP          17
+#define HYPERV_FEAT_XMM_INPUT           18
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index cea18dbc0e..f5f16474fa 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -54,7 +54,7 @@
 #define HV_GUEST_DEBUGGING_AVAILABLE            (1u << 1)
 #define HV_PERF_MONITOR_AVAILABLE               (1u << 2)
 #define HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE   (1u << 3)
-#define HV_HYPERCALL_PARAMS_XMM_AVAILABLE       (1u << 4)
+#define HV_HYPERCALL_XMM_INPUT_AVAILABLE        (1u << 4)
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 474e9b582e..63cec0ea68 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6970,6 +6970,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
                       HYPERV_FEAT_MSR_BITMAP, 0),
+    DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
+                      HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f389bbedf2..7e6f934eda 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -980,6 +980,13 @@ static struct {
              .bits = HV_NESTED_MSR_BITMAP}
         }
     },
+    [HYPERV_FEAT_XMM_INPUT] = {
+        .desc = "XMM fast hypercall input (hv-xmm-input)",
+        .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
+             .bits = HV_HYPERCALL_XMM_INPUT_AVAILABLE}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.36.1



