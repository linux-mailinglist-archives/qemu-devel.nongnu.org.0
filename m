Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6354F9AB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:52:54 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DLB-0006fW-Ee
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHd-0003pN-9u
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHb-0008DV-Po
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfTEtGtV60xCo5tf6z0boZW/OxUUTeobdYFSqWKTCck=;
 b=UIth3IJGZLagmAutCR5EolLvBkIbkNSh7/RwxsyRZbZjD36i5psqIpEj9PzkecKKezKhZ4
 BZDZYKF8U7ZJneg0xbRKJ5q7rJzlQ+F6lZvgonOn0NvoiulHeRnOAH6yO0RBcaZ+3AMuiI
 XV9+Yzyytafh8DPoybzJOgmhJap0XM8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-WkQ2HuF4O3aocb2nth4ipw-1; Fri, 17 Jun 2022 10:49:09 -0400
X-MC-Unique: WkQ2HuF4O3aocb2nth4ipw-1
Received: by mail-il1-f197.google.com with SMTP id
 s15-20020a056e02216f00b002d3d5e41565so2783979ilv.10
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WfTEtGtV60xCo5tf6z0boZW/OxUUTeobdYFSqWKTCck=;
 b=cGnH9GstPsw308LlBW0JlT6xwMOUb2kyLoapm467VRo0k7JKpcnC7GXZwsf7OXkPHS
 xngebBd3qBlilxXJLs4jKOMJQXEkkltKczmnFt2fuCzGyVDqFcmDRIMrWIDUhrL+1B4x
 11Kt5MKnczc4Mw+fEf1dfDB9sJvaeO2hMdIYnTPg9yqcu6C/fg4Lps6QR4d/r8RTYXcr
 w6t27FB3TK9mSEXbg2nMqHcmOTDbY1Fw9bYMPNtFdQFYoFSVVGc7qXNih6wp/z+u/BeZ
 S4tjONEXCHcM16rWsZLtHfkwsTr4t5VMB3deoFZhEKdwLtOaROWajjrTJGHmLUVIio50
 GTEQ==
X-Gm-Message-State: AJIora//rzLmLok+l/X59kIa57w3Rma10rqPdQGh66J2jB4ql63tO85g
 3GiwYaIUEFkSQTUJxhiuZ0GM4Aobabs9MaikYoS5P9+9zRsga6Om8Ts/99UdqmMq+xQH3PxG+nE
 +Hrfucw1cgUvO7+zWQnaN0ebYBPKsAyoh9ZjBcPBL9REDDcVkHePgaSFWf6X/RtX/
X-Received: by 2002:a02:aa92:0:b0:331:c856:fe69 with SMTP id
 u18-20020a02aa92000000b00331c856fe69mr5335916jai.187.1655477348965; 
 Fri, 17 Jun 2022 07:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2mXVZTbiDztK44Y0DAQSHQpmjKvvYQtFF2kBx0IP1w5TOu4Jtkxlqjed5eEmdGdxsWFMfbg==
X-Received: by 2002:a02:aa92:0:b0:331:c856:fe69 with SMTP id
 u18-20020a02aa92000000b00331c856fe69mr5335897jai.187.1655477348705; 
 Fri, 17 Jun 2022 07:49:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.49.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:49:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 5/5] KVM: Hook kvm_arch_put_registers() errors to the caller
Date: Fri, 17 Jun 2022 10:48:57 -0400
Message-Id: <20220617144857.34189-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617144857.34189-1-peterx@redhat.com>
References: <20220617144857.34189-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Leverage the new mechanism to pass over errors to upper stack for
kvm_arch_put_registers() when called for the post_init() accel hook.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c  | 13 ++++++++++---
 accel/kvm/kvm-cpus.h |  2 +-
 softmmu/cpus.c       |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index df4f7c98f3..03e29ab1ed 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2771,15 +2771,22 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_kvm_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
+static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg,
+                                             Error **errp)
 {
-    kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+    int ret = kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+
+    if (ret) {
+        error_setg(errp, "kvm_arch_put_registers() failed with retval=%d", ret);
+        return;
+    }
+
     cpu->vcpu_dirty = false;
 }
 
 void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
-    run_on_cpu(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
+    run_on_cpu2(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL, errp);
 }
 
 static void do_kvm_cpu_synchronize_pre_loadvm(CPUState *cpu, run_on_cpu_data arg)
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index bf0bd1bee4..c9b8262704 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -16,7 +16,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp);
 int kvm_cpu_exec(CPUState *cpu);
 void kvm_destroy_vcpu(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
-void kvm_cpu_synchronize_post_init(CPUState *cpu);
+void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 
 #endif /* KVM_CPUS_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 59c70fd496..6c0b5b87f0 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -151,7 +151,10 @@ void cpu_synchronize_all_post_init(Error **errp)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        cpu_synchronize_post_init(cpu);
+        cpu_synchronize_post_init_full(cpu, errp);
+        if (errp && *errp) {
+            break;
+        }
     }
 }
 
-- 
2.32.0


