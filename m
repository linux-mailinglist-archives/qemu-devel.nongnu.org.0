Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8E528AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:43:50 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdoz-00011n-Me
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5F-0002VB-5Z
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5D-0003OP-HL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnKHzGpcDplZvjKLym1ZGlqmzAFc+xFpDNTh1jBSJAM=;
 b=JKdX3PFmAl5HKEijGCITb0ZZgVWa/KYmaByKT7oEasNv2gno+hPoO+BlOrMUeTHr55kUhS
 l6LRYR5cBzV0kPD9Dmgmoo3mtNE19xpArdG/bOEtUASdpQk+glOseDUMkKEtrcRGXMVVIv
 KaU2CfI8Ovsz6hZA9eZVcN07/UrxJcY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-9qwh9JsfNUKnlZ37jsb74w-1; Mon, 16 May 2022 11:56:29 -0400
X-MC-Unique: 9qwh9JsfNUKnlZ37jsb74w-1
Received: by mail-ed1-f72.google.com with SMTP id
 w5-20020a056402128500b0042aa2647eb6so3594829edv.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QnKHzGpcDplZvjKLym1ZGlqmzAFc+xFpDNTh1jBSJAM=;
 b=APZgae4KPDP+1PsL7ZoNSbp+WMPeeENMda3DM88l8AeXtxGrN3qS9Rh4OwRF5Zim6T
 /lhRhIAYlPQ/HgssSYC19/BiV6ERVA+9abtei2xIeHe1n7rKtnFywjBmbSQVRo6wyZ+J
 HoZdXiun1ThG9lsk7L8xJ674DdfWpef0iPJVDzi0NMatbYXf06/Zzj/U94I8tnRTYzLr
 4kYtxqeEyUwBiBVlWCnkfqwlR6Ks9Qyww9bxq4PGb8hMmT4df2tf2x6+DrK6ADf9bJzY
 BcsDyFEbdAipzZQ/1JsOwM6h2yfWZ+TBzH6cQSCyLTdqvDkBmGFLiuXBVszxHJtGaLlF
 4CRQ==
X-Gm-Message-State: AOAM533wfwxKGIHP4zG5RB4XnH1t9RrFTeDWUQ7yXUiMPVdEcUPXghml
 8kB9QEMkDZ0YBuxEQn7e6YOTNmi1+3K6ApptwHImkbEf0mpnZzni3ZtS83574FbnU0h9+p0HRpp
 TYWAo5AHi0PyW6OoLtNpOD7pQ9hXeNG5Ox+L8reF2bN5sAF3HSPkCMfd49bKiMiSYjGc=
X-Received: by 2002:a17:907:7e84:b0:6fe:2a21:1467 with SMTP id
 qb4-20020a1709077e8400b006fe2a211467mr6615646ejc.673.1652716588194; 
 Mon, 16 May 2022 08:56:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNUKO6P8jNyKIF9MjtkUmhjKbnl6MZV51N3ykrI/4ty84FNWSqeu1IiugF6ydD+9PGnEwm+w==
X-Received: by 2002:a17:907:7e84:b0:6fe:2a21:1467 with SMTP id
 qb4-20020a1709077e8400b006fe2a211467mr6615632ejc.673.1652716587893; 
 Mon, 16 May 2022 08:56:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ig25-20020a1709072e1900b006f3a8b81ff7sm57086ejc.3.2022.05.16.08.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 13/23] target/i386: Support Arch LBR in CPUID enumeration
Date: Mon, 16 May 2022 17:55:53 +0200
Message-Id: <20220516155603.1234712-14-pbonzini@redhat.com>
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

If CPUID.(EAX=07H, ECX=0):EDX[19] is set to 1, the processor
supports Architectural LBRs. In this case, CPUID leaf 01CH
indicates details of the Architectural LBRs capabilities.
XSAVE support for Architectural LBRs is enumerated in
CPUID.(EAX=0DH, ECX=0FH).

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-9-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index dcc770ecea..35c3475e6c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -855,7 +855,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "fsrm", NULL, NULL, NULL,
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
-            "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
+            "tsx-ldtrk", NULL, NULL /* pconfig */, "arch-lbr",
             NULL, NULL, "amx-bf16", "avx512-fp16",
             "amx-tile", "amx-int8", "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
@@ -5420,6 +5420,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         assert(!(*eax & ~0x1f));
         *ebx &= 0xffff; /* The count doesn't need to be reliable. */
         break;
+    case 0x1C:
+        if (accel_uses_host_cpuid() && cpu->enable_pmu &&
+            (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+            x86_cpu_get_supported_cpuid(0x1C, 0, eax, ebx, ecx, edx);
+            *edx = 0;
+        }
+        break;
     case 0x1F:
         /* V2 Extended Topology Enumeration Leaf */
         if (env->nr_dies < 2) {
@@ -5482,6 +5489,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = xsave_area_size(xstate, true);
             *ecx = env->features[FEAT_XSAVE_XSS_LO];
             *edx = env->features[FEAT_XSAVE_XSS_HI];
+            if (kvm_enabled() && cpu->enable_pmu &&
+                (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR) &&
+                (*eax & CPUID_XSAVE_XSAVES)) {
+                *ecx |= XSTATE_ARCH_LBR_MASK;
+            } else {
+                *ecx &= ~XSTATE_ARCH_LBR_MASK;
+            }
+        } else if (count == 0xf &&
+                   accel_uses_host_cpuid() && cpu->enable_pmu &&
+                   (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+            x86_cpu_get_supported_cpuid(0xD, count, eax, ebx, ecx, edx);
         } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
             const ExtSaveArea *esa = &x86_ext_save_areas[count];
 
-- 
2.36.0


