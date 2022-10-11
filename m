Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E195FB095
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:41:27 +0200 (CEST)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiChR-0003Qa-V6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTs-0001mM-9Q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTk-0004Ix-40
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14oJjmYHgvUa/MpVPKwUTUCEeQ4n4MsXaBY+cVDVYVA=;
 b=ULHZkJgw/1GbsF5ThPOA1WmhV9iMLFgFT7rBA9xgMo7EAoSZrua1M0hm02LrOcI7oLiJgT
 m6uyz+oxiY280y5QQbJi3vVlixJ9IPcWx9q+bq1hqp2YoA7aDlA27DyCk6IkfIMk+L60U5
 7jYSxG1CgGAiNHE599lihDxgmpbHt4w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-IDr60FpnOyCkDV2KCkb62A-1; Tue, 11 Oct 2022 06:27:13 -0400
X-MC-Unique: IDr60FpnOyCkDV2KCkb62A-1
Received: by mail-ed1-f70.google.com with SMTP id
 q17-20020a056402519100b00459a2e5adbcso10912205edd.16
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14oJjmYHgvUa/MpVPKwUTUCEeQ4n4MsXaBY+cVDVYVA=;
 b=tI1ikgUdVx4SKWCAboDxziSVkKGnRWL+cha7UQE30pg9VfE8oSjulSfyCAQCI2K5rw
 fjw9SNlyH2rNm6O8eOCySWTmtz9i5/Hq4Nz7cTSr3oworf0rPHFykXOCRY5ymeU7zRMX
 R1cMX7SwoAkJ4e/94dkQwjxktDoHQrlX4COsb5xaQQQtYGd2aXgYgrYiQ6OuTNomJXcK
 mWYup5GSXSxRUN/A7jXAJCfuTKZQit9NFpUmLMwHavEqmkh8DTOBz/WpT7W/V0z1Pb0O
 qSnFO8+whD7+5+Ofq6iLrdae5Axt0lc4w4PfzltlvPQb8qEm/pAscaySgGT6rxz1LYIb
 iL2g==
X-Gm-Message-State: ACrzQf2vgXX6XUBafzLs92drWfHMIs31eMCLNmPgkl+M2NUEZmzhySvK
 pW85fO94zIwQE5JI1pzaBf8h8jPFpvWTwu3Jm2XL662cjGm1fXA1tL20lQk+oQjBav1CQbE9OJD
 7oVfbqBsXl6eLbyN3C5OC9ejOubBlvuT08mmTEE48QcZSHnO6b8OQcxv0qeBwbLKzkY4=
X-Received: by 2002:a05:6402:27d4:b0:459:b28f:1b62 with SMTP id
 c20-20020a05640227d400b00459b28f1b62mr22116884ede.217.1665484032489; 
 Tue, 11 Oct 2022 03:27:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5yuD4C2uscSW/EOI2Al6b+or5+2XE8b7OSayzs2gUAipnW9Vw/WoKjZk9p/D0BCepu+8CfxQ==
X-Received: by 2002:a05:6402:27d4:b0:459:b28f:1b62 with SMTP id
 c20-20020a05640227d400b00459b28f1b62mr22116863ede.217.1665484032126; 
 Tue, 11 Oct 2022 03:27:12 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709061e5000b0078d46aa3b82sm6702782ejj.21.2022.10.11.03.27.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/37] kvm: allow target-specific accelerator properties
Date: Tue, 11 Oct 2022 12:26:26 +0200
Message-Id: <20221011102700.319178-4-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Several hypervisor capabilities in KVM are target-specific.  When exposed
to QEMU users as accelerator properties (i.e. -accel kvm,prop=value), they
should not be available for all targets.

Add a hook for targets to add their own properties to -accel kvm, for
now no such property is defined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220929072014.20705-3-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c    | 2 ++
 include/sysemu/kvm.h   | 2 ++
 target/arm/kvm.c       | 4 ++++
 target/i386/kvm/kvm.c  | 4 ++++
 target/mips/kvm.c      | 4 ++++
 target/ppc/kvm.c       | 4 ++++
 target/riscv/kvm.c     | 4 ++++
 target/s390x/kvm/kvm.c | 4 ++++
 8 files changed, 28 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 423fb1936f..03a69cf053 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3731,6 +3731,8 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "dirty-ring-size",
         "Size of KVM dirty page ring buffer (default: 0, i.e. use bitmap)");
+
+    kvm_arch_accel_class_init(oc);
 }
 
 static const TypeInfo kvm_accel_type = {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 790d35ef78..e9a97eda8c 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -349,6 +349,8 @@ bool kvm_device_supported(int vmfd, uint64_t type);
 
 extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
 
+void kvm_arch_accel_class_init(ObjectClass *oc);
+
 void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..d21603cf28 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1056,3 +1056,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3ebe8b7f1f..f18d21413c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5468,3 +5468,7 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
         mask &= ~BIT_ULL(bit);
     }
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index caf70decd2..bcb8e06b2c 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1294,3 +1294,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 466d0d2f4c..7c25348b7b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2966,3 +2966,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 70b4cff06f..30f21453d6 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -532,3 +532,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6a8dbadf7e..508c24cfec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2581,3 +2581,7 @@ int kvm_s390_get_zpci_op(void)
 {
     return cap_zpci_op;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
-- 
2.37.3


