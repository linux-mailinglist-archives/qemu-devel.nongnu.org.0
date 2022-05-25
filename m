Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2B53448B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:49:44 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntx0q-0007IU-27
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhH-0005YV-1p
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhF-0003sA-9t
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gG9nneWWyjnupUUg6wVGpKu/gWNRRTAvNAqk45p9EZU=;
 b=datWObJ9ynHuEV7Yg0bi/cpkkPgZvt8rV5Yi1joj3IMzHBsrLVBT6MuWXJvw6TzZI3a+xG
 e4hIYtJZetcVFfNzjGN2ZQiv4cKXZSO5w0WTFbTv/9lZzWT0j57Ha19JKORTyZqTFDeu8t
 yxBLxjU1M1839fmMevRkZBJ4f6p8ztg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Hqt4PTxbNA69lrG8KqwAmA-1; Wed, 25 May 2022 15:29:27 -0400
X-MC-Unique: Hqt4PTxbNA69lrG8KqwAmA-1
Received: by mail-ej1-f72.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so9212772eje.23
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gG9nneWWyjnupUUg6wVGpKu/gWNRRTAvNAqk45p9EZU=;
 b=WfFvOM7QGIzw7t/TmSM/pEyo/7xk/0d9+5J41YSeGWncAyuomdxautwku7gr0fjJI/
 TbmVbKDsGjjCKWblCe8GSH7jUpRib8AvoSrA7ZVH1BbrCDc5wFNXBLFJhsB8z37DmMzN
 XlHLUKyCMXAlKuBh+mf663wC6PDa6ggAFXrwdAfN3JBhV3sObIaPd5Ccrh8018/KnXEF
 p1uSxJEq+8ma2HiMNB1g9wTV1zwFqgwViIYhZtlO/L0ZWkFdyw/jV0qp8l9HMUfFJTkm
 qJnm+QntQvuvV3bQzyTHFwVG6daZok7ImoRdyrCbg7PB2+QHky3R9dqEp8sLCdFgdvqP
 lyRw==
X-Gm-Message-State: AOAM531E3iJzsdbCyDy3UDonCJNJKC05cF4MkktyopjN5NWOQY6SPoOY
 iBzxKMEdylt1yNtHUbJZYjsX9EMeClkSpB9YRdXJWlrSx0qrskxv6RXbbjUO80ZElVNa2wOMpal
 TZK3D/ygH7pY2JQxebdjd2btWccLQTuv8ossRgNpL1wr6g/0NLvYv8oypJEoRz9FdX5o=
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id
 cw11-20020a170906478b00b006f858504da9mr30080741ejc.619.1653506965690; 
 Wed, 25 May 2022 12:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyhLSCDttMfLvkvrQaYCw6iwBU9fRaZX/Whp06iIRxQhr/KBB/qWOTt6MT+29oqDec8sgGOg==
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id
 cw11-20020a170906478b00b006f858504da9mr30080714ejc.619.1653506965345; 
 Wed, 25 May 2022 12:29:25 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ej23-20020a056402369700b0042a2d9af0f8sm11268052edb.79.2022.05.25.12.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 12/17] i386: Use hv_build_cpuid_leaf() for
 HV_CPUID_NESTED_FEATURES
Date: Wed, 25 May 2022 21:28:47 +0200
Message-Id: <20220525192852.301633-13-pbonzini@redhat.com>
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

Previously, HV_CPUID_NESTED_FEATURES.EAX CPUID leaf was handled differently
as it was only used to encode the supported eVMCS version range. In fact,
there are also feature (e.g. Enlightened MSR-Bitmap) bits there. In
preparation to adding these features, move HV_CPUID_NESTED_FEATURES leaf
handling to hv_build_cpuid_leaf() and drop now-unneeded 'hyperv_nested'.

No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220525115949.1294004-2-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h     |  1 -
 target/i386/kvm/kvm.c | 25 +++++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0d528ac58f..2e918daf6b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1804,7 +1804,6 @@ struct ArchCPU {
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_limits[3];
-    uint32_t hyperv_nested[4];
     bool hyperv_enforce_cpuid;
     uint32_t hyperv_ver_id_build;
     uint16_t hyperv_ver_id_major;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e2d675115b..38af0e4f04 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -831,6 +831,8 @@ static bool tsc_is_stable_and_known(CPUX86State *env)
         || env->user_tsc_khz;
 }
 
+#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
+
 static struct {
     const char *desc;
     struct {
@@ -1254,6 +1256,13 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
         }
     }
 
+    /* HV_CPUID_NESTED_FEATURES.EAX also encodes the supported eVMCS range */
+    if (func == HV_CPUID_NESTED_FEATURES && reg == R_EAX) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+            r |= DEFAULT_EVMCS_VERSION;
+        }
+    }
+
     return r;
 }
 
@@ -1384,11 +1393,11 @@ static int hyperv_fill_cpuids(CPUState *cs,
     struct kvm_cpuid_entry2 *c;
     uint32_t signature[3];
     uint32_t cpuid_i = 0, max_cpuid_leaf = 0;
+    uint32_t nested_eax =
+        hv_build_cpuid_leaf(cs, HV_CPUID_NESTED_FEATURES, R_EAX);
 
-    max_cpuid_leaf = HV_CPUID_IMPLEMENT_LIMITS;
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        max_cpuid_leaf = MAX(max_cpuid_leaf, HV_CPUID_NESTED_FEATURES);
-    }
+    max_cpuid_leaf = nested_eax ? HV_CPUID_NESTED_FEATURES :
+        HV_CPUID_IMPLEMENT_LIMITS;
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
         max_cpuid_leaf =
@@ -1461,7 +1470,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->ecx = cpu->hyperv_limits[1];
     c->edx = cpu->hyperv_limits[2];
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+    if (nested_eax) {
         uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
@@ -1473,7 +1482,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
 
         c = &cpuid_ent[cpuid_i++];
         c->function = HV_CPUID_NESTED_FEATURES;
-        c->eax = cpu->hyperv_nested[0];
+        c->eax = nested_eax;
     }
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
@@ -1522,8 +1531,6 @@ static bool evmcs_version_supported(uint16_t evmcs_version,
         (max_version <= max_supported_version);
 }
 
-#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
-
 static int hyperv_init_vcpu(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1620,8 +1627,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                          supported_evmcs_version >> 8);
             return -ENOTSUP;
         }
-
-        cpu->hyperv_nested[0] = evmcs_version;
     }
 
     if (cpu->hyperv_enforce_cpuid) {
-- 
2.36.1



