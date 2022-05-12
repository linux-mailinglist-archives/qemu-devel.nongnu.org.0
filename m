Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC395253C3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:35:51 +0200 (CEST)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCj8-00080Q-PC
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ2-0004v8-TW
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYy-00055N-Sc
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTeBukGILkngSjy4fiED6N77qYCtugiV3E2m6i3d4fQ=;
 b=WONZH30szJg+Q3Vtg+4KEQnpopscKYTGvZVWZXrVl1d8Sq6fmA79aK0uI2YHBnNv068zVl
 mk5xBMmHht/Z9jRvzrGGLs175qy+3Sl/7TRIEsRud9dRVxu8w5tRVd3kWlkZbjhQEDUZ7M
 zrfhZJHp6sUMcqENlhZ13ESjzpuliBU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-9RliPOEaPhSye_w7EV0ElQ-1; Thu, 12 May 2022 13:25:17 -0400
X-MC-Unique: 9RliPOEaPhSye_w7EV0ElQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso3131010ejy.19
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTeBukGILkngSjy4fiED6N77qYCtugiV3E2m6i3d4fQ=;
 b=sQTziuTp8wHus0zrIGSKZJuhIRMe+uXEXyzLpptzm2Y/4Sgr+sMpYyigEPCfwWHiso
 BEOxgMthEJHSEC/nuev2I91lXdy/gDWGIJYZG3ETV05xgmXaiJZmJ/0LsVtQ5fe7JJQe
 30x3kHaEdx3h/gDqOJsKJJyNQstF0kH2xeJ9QBijqtempFAeBp4sWhuSkJje6YPrSXSb
 alr9t/kPUX5tbcEWd1yogVfiSEJFqkp8BJe7E9igwu58BSayEZKM+qitz9d6MUe3r4VD
 FDrWQST8L3wR8p7d71TEUVQLokV9AYQZs8vsh9dQN1nyl/MUlcXn0Ys6PeQvlWBLcltt
 ecNA==
X-Gm-Message-State: AOAM532RZUI0EgyivnS7WMbZdCtFsItI5MDzqyToMj+07pGoJ5s/sWv3
 REUe44sz/SN5pniFbkO5lNHRfVx2KWgZGiWoY1bligM+PNfw9xpDjGO+zRfLC87J6VJnPD5gaBv
 BPbHFHvXdQ7omrN7mS6HhYUY5QrtfWHFT6TcI3qLQJXZCJ0M5qz51YrFyoi1TNbeBsiY=
X-Received: by 2002:aa7:da12:0:b0:427:b434:a374 with SMTP id
 r18-20020aa7da12000000b00427b434a374mr35630104eds.408.1652376316087; 
 Thu, 12 May 2022 10:25:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/heQoKrWBZ0rpLS0U5yMYhE6tNn4J/ADJP4ijdG5bMJgqV0Afubn37/G53dvSoYjhh21AGw==
X-Received: by 2002:aa7:da12:0:b0:427:b434:a374 with SMTP id
 r18-20020aa7da12000000b00427b434a374mr35630071eds.408.1652376315742; 
 Thu, 12 May 2022 10:25:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006f3ef214e08sm2327336ejj.110.2022.05.12.10.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
	qemu-stable@nongnu.org
Subject: [PULL 03/27] target/i386: do not consult nonexistent host leaves
Date: Thu, 12 May 2022 19:24:41 +0200
Message-Id: <20220512172505.1065394-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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

When cache_info_passthrough is requested, QEMU passes the host values
of the cache information CPUID leaves down to the guest.  However,
it blindly assumes that the CPUID leaf exists on the host, and this
cannot be guaranteed: for example, KVM has recently started to
synthesize AMD leaves up to 0x80000021 in order to provide accurate
CPU bug information to guests.

Querying a nonexistent host leaf fills the output arguments of
host_cpuid with data that (albeit deterministic) is nonsensical
as cache information, namely the data in the highest Intel CPUID
leaf.  If said highest leaf is not ECX-dependent, this can even
cause an infinite loop when kvm_arch_init_vcpu prepares the input
to KVM_SET_CPUID2.  The infinite loop is only terminated by an
abort() when the array gets full.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 62c240fa91..c4a17c93f6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5022,6 +5022,37 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     return r;
 }
 
+static void x86_cpu_get_cache_cpuid(uint32_t func, uint32_t index,
+                                    uint32_t *eax, uint32_t *ebx,
+                                    uint32_t *ecx, uint32_t *edx)
+{
+    uint32_t level, unused;
+
+    /* Only return valid host leaves.  */
+    switch (func) {
+    case 2:
+    case 4:
+        host_cpuid(0, 0, &level, &unused, &unused, &unused);
+        break;
+    case 0x80000005:
+    case 0x80000006:
+    case 0x8000001d:
+        host_cpuid(0x80000000, 0, &level, &unused, &unused, &unused);
+        break;
+    default:
+        return;
+    }
+
+    if (func > level) {
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+    } else {
+        host_cpuid(func, index, eax, ebx, ecx, edx);
+    }
+}
+
 /*
  * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
@@ -5280,7 +5311,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 2:
         /* cache info: needed for Pentium Pro compatibility */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
@@ -5300,7 +5331,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 4:
         /* cache info: needed for Core compatibility */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, count, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
             /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
             *eax &= ~0xFC000000;
             if ((*eax & 31) && cs->nr_cores > 1) {
@@ -5702,7 +5733,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x80000005:
         /* cache info (L1 cache) */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         }
         *eax = (L1_DTLB_2M_ASSOC << 24) | (L1_DTLB_2M_ENTRIES << 16) |
@@ -5715,7 +5746,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x80000006:
         /* cache info (L2 cache) */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         }
         *eax = (AMD_ENC_ASSOC(L2_DTLB_2M_ASSOC) << 28) |
@@ -5775,7 +5806,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x8000001D:
         *eax = 0;
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, count, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
             break;
         }
         switch (count) {
-- 
2.36.0


