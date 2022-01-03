Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08BA483195
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 14:48:35 +0100 (CET)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4NhS-0006tZ-Fo
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 08:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4Nf9-0004z3-On
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 08:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4Nf5-0002De-AA
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 08:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641217566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m9tKNmguGwQHV4c8HM4LhwbPDmiYg4NQViyqROyOzb0=;
 b=L3hOtSionFEfTPNxBmuoZzscNCdTBN6rypF/tPSLb0uIP39Ik3nlLU2CbyFcvQDi/atIIt
 zVpLpMLRoFru/MIYImqyv0lgBkwexB7HRj+x0EgTY0VidxFwBVgATKIB0cKMuvI4yoQVaY
 pTLixuM0q2vFjTaCteVa0oWGresFVtE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Tex2i5hBM-CdbcwHWGY0sA-1; Mon, 03 Jan 2022 08:46:05 -0500
X-MC-Unique: Tex2i5hBM-CdbcwHWGY0sA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z3-20020a05640240c300b003f9154816ffso13730967edb.9
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 05:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m9tKNmguGwQHV4c8HM4LhwbPDmiYg4NQViyqROyOzb0=;
 b=jNaaSdvdmW7lHCl1uahW/ZQ2aSG6ROlDG4AW5vt6cebXNTmiM54klBPLhAh0+m+Zm6
 AZksvJXCnKFRaqgmF8DIvF0h1jU5BP953XOx08JGvuxLGo8qosG2zWC2A4RBnXsRJRwW
 dHjZ6qedV2hmBQ3JesEmAWoZGsnrVoA5+novg8LhkyY9wP1WVez6iphLwVOWGxrL9Yvr
 55YRSjsLWhLmFURSqHSzRUFYdQ+Mld/mKZa5pp3wyb57s6Myhjc2wYANiL5gQPbVTXLr
 /sDlDDxeyprBokLaUwblZWcUhQ4GgYihjJpGvyrjBu6WwfN6UljnTzyoTMQo3OfL5lXz
 IZFA==
X-Gm-Message-State: AOAM531Q2PyZatTNcYHMDVl5KBeD8sVmrkVPJvmV1+gdHBojE1w4Q0G9
 DIg6oRQKRRcO6boh3Fg4jZo/IrFC6GkkHDCta8AETVFO/kpwqC+7A+0KAy5AMZw8fJdYao9qgFd
 EtHN5adhpcXsMUA4=
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr36339807ejc.751.1641217563900; 
 Mon, 03 Jan 2022 05:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8eeWuKUx9ItDdI27ssC7uVHwYjv+J0uZkjR9f5ux5q9swt42Ct+yubxq2zLvBYc7Ymbpb4Q==
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr36339789ejc.751.1641217563636; 
 Mon, 03 Jan 2022 05:46:03 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id k12sm2610001ejk.188.2022.01.03.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 05:46:03 -0800 (PST)
Date: Mon, 3 Jan 2022 14:46:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] hw/arm/virt: KVM: Enable PAuth when supported by the host
Message-ID: <20220103134601.7cumwbza32wja3ei@gator>
References: <20211228182347.1025501-1-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211228182347.1025501-1-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On Tue, Dec 28, 2021 at 06:23:47PM +0000, Marc Zyngier wrote:
> Add basic support for Pointer Authentication when running a KVM
> guest and that the host supports it, loosely based on the SVE
> support.
> 
> Although the feature is enabled by default when the host advertises
> it, it is possible to disable it by setting the 'pauth=off' CPU
> property.
> 
> Tested on an Apple M1 running 5.16-rc6.
> 
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Andrew Jones <drjones@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  docs/system/arm/cpu-features.rst |  5 +++++
>  target/arm/cpu.c                 |  1 +
>  target/arm/cpu.h                 |  1 +
>  target/arm/cpu64.c               | 36 ++++++++++++++++++++++++++++++++
>  target/arm/kvm.c                 | 13 ++++++++++++
>  target/arm/kvm64.c               | 10 +++++++++
>  target/arm/kvm_arm.h             |  7 +++++++
>  7 files changed, 73 insertions(+)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 584eb17097..c9e39546a5 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -211,6 +211,11 @@ the list of KVM VCPU features and their descriptions.
>                             influence the guest scheduler behavior and/or be
>                             exposed to the guest userspace.
>  
> +  pauth                    Enable or disable ``FEAT_Pauth``, pointer
> +                           authentication.  By default, the feature is enabled
> +                           with ``-cpu host`` if supported by both the host
> +                           kernel and the hardware.
> +

Thanks for considering a documentation update. In this case, though, I
think we should delete the "TCG VCPU Features" pauth paragraph, rather
than add a new "KVM VCPU Features" pauth paragraph. We don't need to
document each CPU feature. We just document complex ones, like sve*,
KVM specific ones (kvm-*), and TCG specific ones (now only pauth-impdef).

>  TCG VCPU Features
>  =================
>  
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a211804fd3..68b09cbc6a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2091,6 +2091,7 @@ static void arm_host_initfn(Object *obj)
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
> +        aarch64_add_pauth_properties(obj);
>      }
>  #else
>      hvf_arm_set_cpu_features_from_host(cpu);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e33f37b70a..c6a4d50e82 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1076,6 +1076,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
>  void aarch64_add_sve_properties(Object *obj);
> +void aarch64_add_pauth_properties(Object *obj);
>  
>  /*
>   * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 15245a60a8..305c0e19fe 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -625,6 +625,42 @@ void aarch64_add_sve_properties(Object *obj)
>  #endif
>  }
>  
> +static bool cpu_arm_get_pauth(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    return cpu_isar_feature(aa64_pauth, cpu);
> +}
> +
> +static void cpu_arm_set_pauth(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t t;
> +
> +    if (value) {
> +        if (!kvm_arm_pauth_supported()) {
> +            error_setg(errp, "'pauth' feature not supported by KVM on this host");
> +        }
> +
> +        return;
> +    }
> +
> +    /*
> +     * If the host supports PAuth, we only end-up here if the user has
> +     * disabled the support, and value is false.
> +     */
> +    t = cpu->isar.id_aa64isar1;
> +    t = FIELD_DP64(t, ID_AA64ISAR1, APA, value);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, value);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, API, value);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, value);
> +    cpu->isar.id_aa64isar1 = t;
> +}
> +
> +void aarch64_add_pauth_properties(Object *obj)
> +{
> +    object_property_add_bool(obj, "pauth", cpu_arm_get_pauth, cpu_arm_set_pauth);
> +}

I think we should try to merge as much as possible between the TCG and KVM
pauth property handling. I think we just need to move the
qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property) call into
KVM/TCG common code and then modify arm_cpu_pauth_finalize() to
handle checking KVM for support when KVM is enabled and also to not
look at the impdef property.

> +
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>  {
>      int arch_val = 0, impdef_val = 0;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index bbf1ce7ba3..71e2f46ce8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -84,6 +84,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (vmfd < 0) {
>          goto err;
>      }
> +
>      cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>      if (cpufd < 0) {
>          goto err;
> @@ -94,6 +95,18 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto finish;
>      }
>  
> +    /*
> +     * Ask for Pointer Authentication if supported. We can't play the
> +     * SVE trick of synthetising the ID reg as KVM won't tell us
> +     * whether we have the architected or IMPDEF version of PAuth, so
> +     * we have to use the actual ID regs.
> +     */
> +    if (ioctl(vmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_PTRAUTH_ADDRESS) > 0 &&
> +        ioctl(vmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_PTRAUTH_GENERIC) > 0) {
> +        init->features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
> +                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
> +    }
> +

I think kvm_init() is called prior to kvm_arm_get_host_cpu_features(),
which means we can do this instead

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e790d6c9a573..d1512035ac5b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -521,6 +521,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     struct kvm_vcpu_init init = { .target = -1, };
 
+   /*
+    * Ask for Pointer Authentication if supported. We can't play the
+    * SVE trick of synthetising the ID reg as KVM won't tell us
+    * whether we have the architected or IMPDEF version of PAuth, so
+    * we have to use the actual ID regs.
+    */
+    if (kvm_arm_pauth_supported()) {
+        init->features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
+                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
+    }
+
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
     }

Assuming I'm right about the call order, then I think I'd like that more.


>      if (init->target == -1) {
>          struct kvm_vcpu_init preferred;
>  
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e790d6c9a5..95b6902ca0 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -725,6 +725,12 @@ bool kvm_arm_sve_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>  }
>  
> +bool kvm_arm_pauth_supported(void)
> +{
> +    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
> +            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
> +}
> +
>  bool kvm_arm_steal_time_supported(void)
>  {
>      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
> @@ -865,6 +871,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
> +    if (cpu_isar_feature(aa64_pauth, cpu)) {
> +	    cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
> +					  1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index b7f78b5215..c26acf7866 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -306,6 +306,13 @@ bool kvm_arm_pmu_supported(void);
>   */
>  bool kvm_arm_sve_supported(void);
>  
> +/**
> + * kvm_arm_pauth_supported:
> + *
> + * Returns true if KVM can enable Pointer Authentication and false otherwise.
> + */
> +bool kvm_arm_pauth_supported(void);
> +

If we merge more of the pauth property handling with the TCG code, then
we'll also need a stub in the !CONFIG_KVM section for compiling without
kvm support.

>  /**
>   * kvm_arm_get_max_vm_ipa_size:
>   * @ms: Machine state handle
> -- 
> 2.30.2
>

Thanks,
drew


