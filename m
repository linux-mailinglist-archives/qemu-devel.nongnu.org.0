Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FEF4DEE5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 03:58:59 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he8pO-0008HA-N1
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 21:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8Zu-0006Sc-3D
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8Zk-0006Ky-LC
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8Zf-0006HR-8t
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id x15so4782028wmj.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HAAne3y/gROX4bU2C72LMlD4mSuvEZFb/lzmz3j4hms=;
 b=t6X8e9aoGjaNuXUz5vrgFdUH5MRD6Irg9bcuoVeVdgRKHSqNFF44eySRc905PutG78
 +i8l1jVG4ysLKawB1jxbGl0BvdIC0igdywVXO6ASLHEmhXRyOgUpYddNxvGoltsAPmBS
 UUMpraHWIOtza9lP3ugdLKaWYTIfk1KtwfIqyQ1fiqL/3WP6XSa5O5/EsqXKtwNN1Hw/
 EtiaiuUov6bgvV4jONjS73dXTdjzB6IePmsOQ4qfj9QUNgdRS2U+axB+FNCRfQNWN10V
 oZ64mwKD/LpOJ6X6zJVCPMjeMbnFZOq84fshGUATS5+XMzYvV80+wHtqn9Nkl/kKvrh+
 e1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=HAAne3y/gROX4bU2C72LMlD4mSuvEZFb/lzmz3j4hms=;
 b=gYDCkPQTNz5DnJOeN14lpM5RyvHxPtYm/rgKAYXAIXx90ylbV6ULcjWLnhuRN3NIdp
 Loc/dIdVqGea6hMnrmi/2xM2sI80Z/5CdPmjlT5hcBtVOpHyAt5+tjDlc3PZ/3k4NK4c
 I1+f1D7xQq32yWgk0gHHUeQr4TZ5v2+/cswLzyQwGHRv1PlZ3u13hDaaiYjDaQd7Ojcl
 G8dkgfvOkrXq368iZViRdx75eOFjOC9236ypjByr0JE/jbx3K+4d5m1bnAocqmgulkhK
 1TCLp6S30thnKS1/cy9O7pJ2MS+R1E418KoCzfWzaUktpTo6oEmzG83OHrGZcTPzDok3
 qOSA==
X-Gm-Message-State: APjAAAXa7wODG22AEeHDlo/Xgz7Et4V9fNf+InHUN3I96seNDk0YFrMb
 EmfX2EcWlBvNS8q9h7HI1ZAORbAL
X-Google-Smtp-Source: APXvYqxXLDrW4q+HXHwZPELe/VsJ9fU09EdN4uWvvGrCuFA06/tSimrzmLZKQlgP1mvQu8SjFVsr2g==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr1482527wmb.66.1561081361622; 
 Thu, 20 Jun 2019 18:42:41 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:13 +0200
Message-Id: <1561081350-3723-9-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: [Qemu-devel] [PULL 08/25] i386/kvm: hv-stimer requires hv-time and
 hv-synic
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Synthetic timers operate in hv-time time and Windows won't use these
without SynIC.

Add .dependencies field to kvm_hyperv_properties[] and a generic mechanism
to check dependencies between features.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-7-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 93ac6ba..58afa31 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -689,6 +689,7 @@ static struct {
         uint32_t fw;
         uint32_t bits;
     } flags[2];
+    uint64_t dependencies;
 } kvm_hyperv_properties[] = {
     [HYPERV_FEAT_RELAXED] = {
         .desc = "relaxed timing (hv-relaxed)",
@@ -756,7 +757,8 @@ static struct {
         .flags = {
             {.fw = FEAT_HYPERV_EAX,
              .bits = HV_SYNTIMERS_AVAILABLE}
-        }
+        },
+        .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_TIME)
     },
     [HYPERV_FEAT_FREQUENCIES] = {
         .desc = "frequency MSRs (hv-frequencies)",
@@ -986,12 +988,25 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     uint32_t r, fw, bits;
-    int i;
+    uint64_t deps;
+    int i, dep_feat = 0;
 
     if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
         return 0;
     }
 
+    deps = kvm_hyperv_properties[feature].dependencies;
+    while ((dep_feat = find_next_bit(&deps, 64, dep_feat)) < 64) {
+        if (!(hyperv_feat_enabled(cpu, dep_feat))) {
+                fprintf(stderr,
+                        "Hyper-V %s requires Hyper-V %s\n",
+                        kvm_hyperv_properties[feature].desc,
+                        kvm_hyperv_properties[dep_feat].desc);
+                return 1;
+        }
+        dep_feat++;
+    }
+
     for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
         fw = kvm_hyperv_properties[feature].flags[i].fw;
         bits = kvm_hyperv_properties[feature].flags[i].bits;
@@ -1107,11 +1122,11 @@ static int hyperv_handle_properties(CPUState *cs,
     r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_EVMCS);
     r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_IPI);
 
-    /* Dependencies */
+    /* Additional dependencies not covered by kvm_hyperv_properties[] */
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
         !cpu->hyperv_synic_kvm_only &&
         !hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
-        fprintf(stderr, "Hyper-V %s requires %s\n",
+        fprintf(stderr, "Hyper-V %s requires Hyper-V %s\n",
                 kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
                 kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
         r |= 1;
-- 
1.8.3.1



