Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2A534470
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:44:29 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwvk-00081i-3i
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhP-0005yv-9m
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhN-0003sn-GT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DzK00baUHTmbKRJ3TcJG4y3BR529hjHpDHgIcJFN/U=;
 b=f3dVsDWuyO31gl/sfrncxrYM2xxs4Aa3UrwYkgiq7vhuqtfvO+392NYUfCXK5sKcANXWVy
 cJXLMMVWh+6k8/lKihykknWYwznRZZgo/x0LifHZxc4oGxsSwy+WiA0c9XWXHXBwhwyXDf
 Rt+xyiizWIVf0zyLHzOHQxzsMDNjKPU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-tkm98hRzNtSAKuFY1a2d3g-1; Wed, 25 May 2022 15:29:29 -0400
X-MC-Unique: tkm98hRzNtSAKuFY1a2d3g-1
Received: by mail-ed1-f71.google.com with SMTP id
 l18-20020aa7d952000000b0042ab7be9adaso15477755eds.21
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DzK00baUHTmbKRJ3TcJG4y3BR529hjHpDHgIcJFN/U=;
 b=2PZZpyDyORmo92m44OpG4aIaOXYRJdktck6xdIlO39ojWZayRgoG3IIM3JrXDxm7V+
 ulAKcDYt6M3tuOWai86OwIu9whiSZR+Z9i1Vxi/DeBfxA63nXFB8dYwh2+SCZeTZlWNQ
 8kQ/H/mO/z2aT2Zj4HZLNNyneUnY8K4I8d/NeXlZy31GT5B0rns5CTj3C8k4ZcGCcCxu
 8lsZ1Lm3udZ7aVVGho273vY0TN4d8fK+6XETdwSzhEtzmXBFC6GMZTbfMjtGHjiqkXRf
 +FOq4rugl6+vmTKk0Ey2AhPVz4zBEsqmTaR4uZiKuYk2D+2dPRo17IUfu0uBThipM/1N
 20LA==
X-Gm-Message-State: AOAM532R7VCA+VaV0Wohc8mA5lnf9YiwaBwzTD1todUnCOhrQKH0jjiW
 Y7Ld+dhqQINhCj+qIRG+BVz9jK5nkElv+CbizSQR4SOSY70fhFb2lN6FtlJMfSiBoxv2cACMPcV
 IPQ2HMWgBsWPROtrKU7/pl6SJ22NRa9kwPJjzKQW/3PCLLrNWTH25Fme2bJ/GR5+u01w=
X-Received: by 2002:a17:906:a0d5:b0:6f4:643f:a46f with SMTP id
 bh21-20020a170906a0d500b006f4643fa46fmr31271269ejb.62.1653506967489; 
 Wed, 25 May 2022 12:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPHXeVkibxMNbjSoSQ4Cexwf77UPcVhT2+V8+CWxIBeFpGf6Q9i1bS9Gnk0DW5xzpkTAt4gg==
X-Received: by 2002:a17:906:a0d5:b0:6f4:643f:a46f with SMTP id
 bh21-20020a170906a0d500b006f4643fa46fmr31271242ejb.62.1653506967185; 
 Wed, 25 May 2022 12:29:27 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 ev7-20020a17090729c700b006fe9191f47asm4357463ejc.70.2022.05.25.12.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 13/17] i386: Hyper-V Enlightened MSR bitmap feature
Date: Wed, 25 May 2022 21:28:48 +0200
Message-Id: <20220525192852.301633-14-pbonzini@redhat.com>
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

The newly introduced enlightenment allow L0 (KVM) and L1 (Hyper-V)
hypervisors to collaborate to avoid unnecessary updates to L2
MSR-Bitmap upon vmexits.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220525115949.1294004-3-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt                | 9 +++++++++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 5 +++++
 target/i386/cpu.c              | 2 ++
 target/i386/kvm/kvm.c          | 7 +++++++
 5 files changed, 24 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 33588a0396..5d85569b99 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -239,6 +239,15 @@ This enlightenment requires a VMBus device (-device vmbus-bridge,irq=15)
 and the follow enlightenments to work:
 hv-relaxed,hv_time,hv-vapic,hv-vpindex,hv-synic,hv-runtime,hv-stimer
 
+3.22. hv-emsr-bitmap
+=====================
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it allows L0 (KVM) and L1 (Hyper-V) hypervisors to collaborate to
+avoid unnecessary updates to L2 MSR-Bitmap upon vmexits. While the protocol is
+supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+Enlightened VMCS ('hv-evmcs') feature to also be enabled.
+
+Recommended: hv-evmcs (Intel)
 
 4. Supplementary features
 =========================
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2e918daf6b..c788285736 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1106,6 +1106,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_STIMER_DIRECT       14
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_SYNDBG              16
+#define HYPERV_FEAT_MSR_BITMAP          17
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index e40e59411c..cea18dbc0e 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -86,6 +86,11 @@
  */
 #define HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING    (1u << 1)
 
+/*
+ * HV_CPUID_NESTED_FEATURES.EAX bits
+ */
+#define HV_NESTED_MSR_BITMAP                (1u << 19)
+
 /*
  * Basic virtualized MSRs
  */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 385691458f..474e9b582e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6968,6 +6968,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_STIMER_DIRECT, 0),
     DEFINE_PROP_BIT64("hv-avic", X86CPU, hyperv_features,
                       HYPERV_FEAT_AVIC, 0),
+    DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
+                      HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 38af0e4f04..f389bbedf2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -973,6 +973,13 @@ static struct {
         .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_RELAXED)
     },
 #endif
+    [HYPERV_FEAT_MSR_BITMAP] = {
+        .desc = "enlightened MSR-Bitmap (hv-emsr-bitmap)",
+        .flags = {
+            {.func = HV_CPUID_NESTED_FEATURES, .reg = R_EAX,
+             .bits = HV_NESTED_MSR_BITMAP}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.36.1



