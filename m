Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAC5FB19C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:37:51 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDa1-0005tF-VT
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVD-0003BZ-8D
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCV8-0004kj-01
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lE+3hIF+2PbZ4iuQRADvCSs4OnkRFVpQtiwM4PqIKgY=;
 b=LIiknybvfczb/1ifm5jExKMT7sczy3J4MU3+UjOxcAmK7hBQvMJVgWWMdirE/lr7Ku5K/q
 mcBksfyzk8VZI2lePuUN4/UsuPG3lvw3b33hd0w1GJBf9gVH5h6AJTGKd93qPDW9TGvz+D
 TcibtDv3H3E/R6BAdtn9PGVpXAk53xY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-_CP4BGgKPUqW6jb6dA_4Qg-1; Tue, 11 Oct 2022 06:28:40 -0400
X-MC-Unique: _CP4BGgKPUqW6jb6dA_4Qg-1
Received: by mail-ej1-f72.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso5666245ejb.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE+3hIF+2PbZ4iuQRADvCSs4OnkRFVpQtiwM4PqIKgY=;
 b=vG5cAQDIzkNEVm1R+aGwg9k99dNcOhnv9eFHCopG2oIaYYa+yhl89vBl0Ytwr6dGar
 S5ivdN9MnDhSbDvhHODnDEdEGlkJLqfrD6nh8XqdQ8iSjaDMflTLkTMHYyiiNjOE5IgI
 p3A8YL6xY1QsL7BRuiso0G9qppptxEod94rCbOQl/JOGymum3ic8NV3jHGb14bfT5cAA
 e/6vdfkURq3wvukTn+8G3JlMo83YqMpx12i2N7FfBiLNpSwHWt0N7YV3QZg8DrSmDWYa
 cf9UO+TitTMg5P0simzqMJ88ImCJ7k7T54JBxb20HKHDFkdE8SGLqcKtRddsZ4HpeR1B
 dbNA==
X-Gm-Message-State: ACrzQf1o6CrKPoHubdvR7Baz2GLt2/PumaCQRDxCvf9d2Y+xaJvrJJIX
 XhKCx7xJAB+/k5p5XKY3BishA1oy2PmsCVDzLR1bqxjjXQZWQPr6mLFhuSiGfQ8QJ+8Il2qaScR
 SNv3drbm5ZyjIiHD+qh0/IctwO28wE0WSEP+FO88nC3sj8xl/xRlKh5icVvSZ6cMDD60=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr18968205ejb.294.1665484118794; 
 Tue, 11 Oct 2022 03:28:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YcTz8m1Hx6sGXsMeg43+DDr+EuVVm93XuzMLR7P63eDTAp/flbW0jlh65eO/qlq9ZDCBJAA==
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr18968194ejb.294.1665484118569; 
 Tue, 11 Oct 2022 03:28:38 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a170906292200b0077086d2db8esm6825395ejd.140.2022.10.11.03.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>
Subject: [PULL 34/37] KVM: x86: Implement MSR_CORE_THREAD_COUNT MSR
Date: Tue, 11 Oct 2022 12:26:57 +0200
Message-Id: <20221011102700.319178-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alexander Graf <agraf@csgraf.de>

The MSR_CORE_THREAD_COUNT MSR describes CPU package topology, such as number
of threads and cores for a given package. This is information that QEMU has
readily available and can provide through the new user space MSR deflection
interface.

This patch propagates the existing hvf logic from patch 027ac0cb516
("target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT") to KVM.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20221004225643.65036-4-agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1d9a50b02b..bed6c00f2c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2401,6 +2401,17 @@ static int kvm_get_supported_msrs(KVMState *s)
     return ret;
 }
 
+static bool kvm_rdmsr_core_thread_count(X86CPU *cpu, uint32_t msr,
+                                        uint64_t *val)
+{
+    CPUState *cs = CPU(cpu);
+
+    *val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
+    *val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+
+    return true;
+}
+
 static Notifier smram_machine_done;
 static KVMMemoryListener smram_listener;
 static AddressSpace smram_address_space;
@@ -2613,6 +2624,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             }
     }
     if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+        bool r;
+
         ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,
                                 KVM_MSR_EXIT_REASON_FILTER);
         if (ret) {
@@ -2620,6 +2633,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
                          strerror(-ret));
             exit(1);
         }
+
+        r = kvm_filter_msr(s, MSR_CORE_THREAD_COUNT,
+                           kvm_rdmsr_core_thread_count, NULL);
+        if (!r) {
+            error_report("Could not install MSR_CORE_THREAD_COUNT handler: %s",
+                         strerror(-ret));
+            exit(1);
+        }
     }
 
     return 0;
-- 
2.37.3


