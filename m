Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55787541F77
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:25:34 +0200 (CEST)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiZp-00014J-34
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHq-0007gX-AE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHo-0005Fo-Id
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhsaJl6DZcSKy+hQsn73Ph11xFbQ58wRWae9eT8xHuk=;
 b=LHSrciRD3GUtjRSIMoiGSeCM0h39+VfcJOJMwAgR59dAuuUY2/YrJ6STFCD/adi6gDObdC
 i8LeANOp58HxLSICNnghGeAexWEnCQGWyjxYDo5US2qnEiBzv1B49Bpvx/f5NznjBJ/7I8
 y0EimgxsLznxbaTcnbSEhNof1FPg1/E=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-U4CTROG8NeWIcgu6euCjJQ-1; Tue, 07 Jun 2022 19:06:54 -0400
X-MC-Unique: U4CTROG8NeWIcgu6euCjJQ-1
Received: by mail-io1-f70.google.com with SMTP id
 q5-20020a6b2a05000000b006696f97731aso2689892ioq.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhsaJl6DZcSKy+hQsn73Ph11xFbQ58wRWae9eT8xHuk=;
 b=SFdA+IpJwf6e4PmMwduQMq46l8yCZf2UxNrn7aL1qfs5RWsS1J4clMU9jjUHCa4lPK
 XCN4wgrpSDdjnzGL6RPSsMZ0baqB4ClVF3/g5mwtRGhq4Ao+tkPNW0/J7TxDo5SFbeub
 hP5eHODWc2jjI14LkS0i/k5kkK9iC136A5yiuf3pXnvNp3hCUn0+iQRK83sXkEFCk6jB
 wab5acN/bKjUlB8Y+h5fs+k9aXUgAlgsaa7crefgF6ehl+UF0GYH2CqLgSVeR2lY2lSe
 zc+cfiXZjSFxD/GvLBSmOS1qFCba7fmNFBeVlDFRoLVHubmvjwxwf/bfMwTRia54p0SI
 ut9w==
X-Gm-Message-State: AOAM5318SebCrOYwAZuCeY9pMf4dRY4Y8Sbj2690Dg/O/zQR+fQ6vpY/
 /H9Ad0frDL7RYAbvUXDXJ+oaUzoElx47K8ivufpqaNtFntOiD6c+rKc3wHk9Yg5rXw/wvwMA2QN
 VlDCkumzCMdEorVlN3Khs+e06S0LS14EVekRrn42x4+LaapXjgjh+wIUL0qJrnIpT
X-Received: by 2002:a92:ca91:0:b0:2d3:b54f:d83b with SMTP id
 t17-20020a92ca91000000b002d3b54fd83bmr17647178ilo.89.1654643213684; 
 Tue, 07 Jun 2022 16:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDPPznbuFxlq2cq2OIUiAsc0Pj83Pti5cBy/kG4Q1DPxMDfOJ03BD3q3NBN9AozI+m2iAMAw==
X-Received: by 2002:a92:ca91:0:b0:2d3:b54f:d83b with SMTP id
 t17-20020a92ca91000000b002d3b54fd83bmr17647164ilo.89.1654643213399; 
 Tue, 07 Jun 2022 16:06:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:52 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 3/5] accel: Allow synchronize_post_init() to take an
 Error**
Date: Tue,  7 Jun 2022 19:06:43 -0400
Message-Id: <20220607230645.53950-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607230645.53950-1-peterx@redhat.com>
References: <20220607230645.53950-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

It allows accel->synchronize_post_init() hook to return an error upwards.
Add a new cpu_synchronize_post_init_full() for it, then let the existing
cpu_synchronize_post_init() to call it with errp==NULL.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/hvf/hvf-accel-ops.c     |  2 +-
 accel/kvm/kvm-all.c           |  2 +-
 include/sysemu/accel-ops.h    |  2 +-
 include/sysemu/hw_accel.h     |  1 +
 softmmu/cpus.c                | 10 ++++++++--
 stubs/cpu-synchronize-state.c |  3 +++
 target/i386/hax/hax-all.c     |  2 +-
 target/i386/nvmm/nvmm-all.c   |  2 +-
 target/i386/whpx/whpx-all.c   |  2 +-
 9 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index a70e2eb375..b439e0c104 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -228,7 +228,7 @@ static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
-static void hvf_cpu_synchronize_post_init(CPUState *cpu)
+static void hvf_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 32e177bd26..1caed1a295 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2767,7 +2767,7 @@ static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
     cpu->vcpu_dirty = false;
 }
 
-void kvm_cpu_synchronize_post_init(CPUState *cpu)
+void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index a0572ea87a..7e526d3c65 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -35,7 +35,7 @@ struct AccelOpsClass {
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
     void (*synchronize_post_reset)(CPUState *cpu);
-    void (*synchronize_post_init)(CPUState *cpu);
+    void (*synchronize_post_init)(CPUState *cpu, Error **errp);
     void (*synchronize_state)(CPUState *cpu);
     void (*synchronize_pre_loadvm)(CPUState *cpu);
     void (*synchronize_pre_resume)(bool step_pending);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 22903a55f7..3ee3508411 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -21,6 +21,7 @@
 void cpu_synchronize_state(CPUState *cpu);
 void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 898363a1d0..464c06201c 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -178,13 +178,19 @@ void cpu_synchronize_post_reset(CPUState *cpu)
     }
 }
 
-void cpu_synchronize_post_init(CPUState *cpu)
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp)
 {
     if (cpus_accel->synchronize_post_init) {
-        cpus_accel->synchronize_post_init(cpu);
+        cpus_accel->synchronize_post_init(cpu, errp);
     }
 }
 
+void cpu_synchronize_post_init(CPUState *cpu)
+{
+    /* errp=NULL means we won't capture any error */
+    cpu_synchronize_post_init_full(cpu, NULL);
+}
+
 void cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
     if (cpus_accel->synchronize_pre_loadvm) {
diff --git a/stubs/cpu-synchronize-state.c b/stubs/cpu-synchronize-state.c
index d9211da66c..6d2c9f509a 100644
--- a/stubs/cpu-synchronize-state.c
+++ b/stubs/cpu-synchronize-state.c
@@ -7,3 +7,6 @@ void cpu_synchronize_state(CPUState *cpu)
 void cpu_synchronize_post_init(CPUState *cpu)
 {
 }
+void cpu_synchronize_post_init_full(CPUState *cpu, Error **errp)
+{
+}
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index b185ee8de4..782d83b531 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -651,7 +651,7 @@ static void do_hax_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
     cpu->vcpu_dirty = false;
 }
 
-void hax_cpu_synchronize_post_init(CPUState *cpu)
+void hax_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_hax_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b75738ee9c..f429e940af 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -869,7 +869,7 @@ void nvmm_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_nvmm_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-void nvmm_cpu_synchronize_post_init(CPUState *cpu)
+void nvmm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_nvmm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..09bf5681ce 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2123,7 +2123,7 @@ void whpx_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_whpx_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-void whpx_cpu_synchronize_post_init(CPUState *cpu)
+void whpx_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
     run_on_cpu(cpu, do_whpx_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
-- 
2.32.0


