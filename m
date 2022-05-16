Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B6528B85
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:04:14 +0200 (CEST)
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe8j-0003im-Rc
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5F-0002V8-5F
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5D-0003OM-FB
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiEXTHu98zsiknms8EAHWtH89vXCymVaEhU4FQDTpe0=;
 b=Mhqjx/ri02CibeQ5QyvXv8p1dJIAMdUJyVdxfi2dKl9fvmBSssl6S5ni3Fi/22p3odoAmH
 u2qh4q2/HJJ/QtBB3Mkwef42wjrKm8YpK4Yzu3gEHcNwUwE7gbr8/AU+Vh7jmEyVTfokJa
 vHKj+BUBwjawuRHsJsDXBhsMU8HkCBs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-mpskp_87P7yHRxZqrULeXQ-1; Mon, 16 May 2022 11:56:27 -0400
X-MC-Unique: mpskp_87P7yHRxZqrULeXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so3682697edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eiEXTHu98zsiknms8EAHWtH89vXCymVaEhU4FQDTpe0=;
 b=FYBQr6+UyYOleEW8/9B3OhO7MjMrNHgC6bRz6th1WDGNfICUIjysphKw+q3LTk0x5+
 IFyznfWjbmtsHBZGmKVZOCky8NUrWH19m2wdZvktQMqARENw7qTBLhIwXul/sc0tbH75
 h6EP3ZcniGG5Btt+WU2arKbG4IbmYthFz8hQSweFjMyrvzueH5rqFHfxD8LrshzxAgT1
 uMTKmEFm+XnKJU+gyefqVsWp3H0HaAxPWMKqdh8eZuoJS0jHFHOaTiRhdV/NZIp9lQQe
 Fo1ebX418ZgQcWO1luhZr61rgbxTgjcRPBezR1tVDsHQ/ML5KnIc/rGNXggNIXzWlY42
 QQrw==
X-Gm-Message-State: AOAM533J1sgzDkc53cRvdFx2hQ7/cgcqbRpnT9TqBt/LI+qBhGaIuzS4
 iVJj+6DM/n1bOKfbdB4/kT3OxwgEV5UkTXUhPTsPZlc/OGDvoyy4lEG4+9OXNhvmrlu5EOO79vo
 1uP+4JZRIWLE5fqG1ee06dQ1XYxb22luYmT3aNMXNk7ioG3a9bk0H2Y2svQtJ3v4wUjg=
X-Received: by 2002:a05:6402:278d:b0:42a:2dc0:744f with SMTP id
 b13-20020a056402278d00b0042a2dc0744fmr14272211ede.226.1652716585603; 
 Mon, 16 May 2022 08:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHPaz67e/U23lgP+LzniX8nYGQaDc9B0USqA1rSVEvkMxAwSoGuhvnaqZ7M7/Vq5WBbq3U2g==
X-Received: by 2002:a05:6402:278d:b0:42a:2dc0:744f with SMTP id
 b13-20020a056402278d00b0042a2dc0744fmr14272185ede.226.1652716585310; 
 Mon, 16 May 2022 08:56:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a1709067a5d00b006f3ef214da8sm63269ejo.14.2022.05.16.08.56.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] target/i386: introduce helper to access supported CPUID
Date: Mon, 16 May 2022 17:55:52 +0200
Message-Id: <20220516155603.1234712-13-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1816c37852..dcc770ecea 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4944,6 +4944,28 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     return r;
 }
 
+static void x86_cpu_get_supported_cpuid(uint32_t func, uint32_t index,
+                                        uint32_t *eax, uint32_t *ebx,
+                                        uint32_t *ecx, uint32_t *edx)
+{
+    if (kvm_enabled()) {
+        *eax = kvm_arch_get_supported_cpuid(kvm_state, func, index, R_EAX);
+        *ebx = kvm_arch_get_supported_cpuid(kvm_state, func, index, R_EBX);
+        *ecx = kvm_arch_get_supported_cpuid(kvm_state, func, index, R_ECX);
+        *edx = kvm_arch_get_supported_cpuid(kvm_state, func, index, R_EDX);
+    } else if (hvf_enabled()) {
+        *eax = hvf_get_supported_cpuid(func, index, R_EAX);
+        *ebx = hvf_get_supported_cpuid(func, index, R_EBX);
+        *ecx = hvf_get_supported_cpuid(func, index, R_ECX);
+        *edx = hvf_get_supported_cpuid(func, index, R_EDX);
+    } else {
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+    }
+}
+
 static void x86_cpu_get_cache_cpuid(uint32_t func, uint32_t index,
                                     uint32_t *eax, uint32_t *ebx,
                                     uint32_t *ecx, uint32_t *edx)
@@ -5359,18 +5381,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0xA:
         /* Architectural Performance Monitoring Leaf */
-        if (kvm_enabled() && cpu->enable_pmu) {
-            KVMState *s = cs->kvm_state;
-
-            *eax = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EAX);
-            *ebx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EBX);
-            *ecx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_ECX);
-            *edx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EDX);
-        } else if (hvf_enabled() && cpu->enable_pmu) {
-            *eax = hvf_get_supported_cpuid(0xA, count, R_EAX);
-            *ebx = hvf_get_supported_cpuid(0xA, count, R_EBX);
-            *ecx = hvf_get_supported_cpuid(0xA, count, R_ECX);
-            *edx = hvf_get_supported_cpuid(0xA, count, R_EDX);
+        if (accel_uses_host_cpuid() && cpu->enable_pmu) {
+            x86_cpu_get_supported_cpuid(0xA, count, eax, ebx, ecx, edx);
         } else {
             *eax = 0;
             *ebx = 0;
@@ -5521,10 +5533,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
          * supports.  Features can be further restricted by userspace, but not
          * made more permissive.
          */
-        *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EAX);
-        *ebx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EBX);
-        *ecx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_ECX);
-        *edx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x12, count, R_EDX);
+        x86_cpu_get_supported_cpuid(0x12, index, eax, ebx, ecx, edx);
 
         if (count == 0) {
             *eax &= env->features[FEAT_SGX_12_0_EAX];
-- 
2.36.0


