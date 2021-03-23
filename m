Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8664E345850
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:10:01 +0100 (CET)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lObAu-0005i7-1S
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOb9P-0004dZ-LD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:08:27 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOb9N-00032m-3S
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:08:27 -0400
Received: by mail-il1-x12d.google.com with SMTP id c17so17232805ilj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDhT2OuiKfQIIn5mVZHP4pLWi95b3I0MeA6nV8/RXIY=;
 b=cA0LXaN4cI4yWr9Rq/0Clq+41A8cMSQDL8+Jc8Y3EOiZzbfCNFcziX7oblV4Etdj2R
 2cC4ETNaaF75iIQcv8m8vO0Q1FGynqxMifQWJYzvyLVRpKvaVUtRWuRONdBH5IbFjID5
 sggYKE2TFAZub3xYroR579hOKarzfo4Z3N28WWYN0RzJ4jYgZOiepfTsASLQAF3niPJK
 7FY4JTVnhdIyMuYVnrp/45ePPFHfkLLevRBf8GaSqzgGSyTIuk8DKXRebiqIM+/3ywBX
 K3LnuCQlbHi/Zj6kQ2zIqJbYs8yTGHNq0Qb9XRDEIsNjH9wr9gUmoJMZeXRplAyNV4ZM
 AysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDhT2OuiKfQIIn5mVZHP4pLWi95b3I0MeA6nV8/RXIY=;
 b=hjJTKNhrW5nBQORTBwu+DK0dGZ1G+SPH83P15K7LXMCMsJFNhEx+v0Ryyv3IFgbcIv
 oHbS7STPHrGUUmJPtDq4dVakpjwKYaoWqZvcnc6AIHFrMgzz2aLkkBpi4t5TX1anC9D6
 68d0PyMorqEZB0iFSvWkLB+zIANtIQYdYC42IlCg0m9HdyRP+9J2OwjuGTs1uH3cT7Hr
 HSmeKbcBdbIGr9stFRZ495J92a3y5cYLRsLxaUukwJ1c/8OP7tOIb9OA/d0fyVBfC4d2
 M2svKMTGuj2/cY8sht3DM9rNYrTNwuq1Tt275wOhHmrFSLSabL+QhAHCB8nqaQE81tyF
 XwFw==
X-Gm-Message-State: AOAM533aSSBCpMGGZ6LtzXJBZ1DZjvkG2n+Z8qyehkL24n61Vy8DLE5o
 hKO4hY/hDSKOXN3mqflwxDq04mb+L3dHq5plBuaf
X-Google-Smtp-Source: ABdhPJwF1d1XMYKhQbgkVHM1izwO0PtnmXa15h+fMTz5dGByvq98B5OevEH9FMaDmEJUIvz0WaXunMGSzsixLmeWsTw=
X-Received: by 2002:a92:6510:: with SMTP id z16mr3418410ilb.71.1616483303716; 
 Tue, 23 Mar 2021 00:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616052889.git.haibo.xu@linaro.org>
 <b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org>
 <20210322104859.snm764n7sfmrpmrd@kamzik.brq.redhat.com>
In-Reply-To: <20210322104859.snm764n7sfmrpmrd@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 23 Mar 2021 15:08:11 +0800
Message-ID: <CAJc+Z1FDfayi43rxDsrqs5CxdxXWxSjVimuuQNPrKDEcjJahCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] Enable nested virtualization support in arm64 KVM mode
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 18:49, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Mar 22, 2021 at 10:07:26AM +0000, Haibo Xu wrote:
> > Add support for arm64 el2 in qemu KVM mode(nested virtualization).
> > This feature is disabled by default, just as that in TCG mode, and
> > can be enabled by "-M virt,accel=kvm,virtualization=on" when starting
> > a VM.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  hw/arm/virt.c        | 11 ++++++++---
> >  target/arm/cpu.h     |  8 ++++++++
> >  target/arm/kvm64.c   | 14 ++++++++++++++
> >  target/arm/kvm_arm.h | 28 ++++++++++++++++++++++++++++
> >  4 files changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index aa2bbd14e0..72e60348d5 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -663,6 +663,11 @@ static void create_gic(VirtMachineState *vms)
> >              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
> >                  MIN(smp_cpus - redist0_count, redist1_capacity));
> >          }
> > +
> > +        if (kvm_irqchip_in_kernel()) {
> > +            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> > +                              vms->virt);
> > +        }
> >      } else {
> >          if (!kvm_irqchip_in_kernel()) {
> >              qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> > @@ -1905,9 +1910,9 @@ static void machvirt_init(MachineState *machine)
> >          exit(1);
> >      }
> >
> > -    if (vms->virt && kvm_enabled()) {
> > -        error_report("mach-virt: KVM does not support providing "
> > -                     "Virtualization extensions to the guest CPU");
> > +    if (vms->virt && kvm_enabled() && !kvm_arm_nested_virt_supported()) {
> > +        error_report("mach-virt: nested virtualization requested, "
> > +                     "but not supported by the host.");
> >          exit(1);
> >      }
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 193a49ec7f..377187152b 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -4182,6 +4182,14 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
> >      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
> >  }
> >
> > +/*
> > + * Currently we don't differentiate between the ARMv8.3-NV and ARMv8.4-NV.
> > + */
> > +static inline bool isar_feature_aa64_nv(const ARMISARegisters *id)
> > +{
> > +    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, NV) != 0;
> > +}
>
> What calls this function?
>

Sorry for the noise here! This function should be deleted in this patch!

Previously, I wanted to follow the SVE vCPU feature when adding the NV support,
and the above function is supposed to be used for the feature probe.

Thanks,
Haibo

> > +
> >  /*
> >   * Feature tests for "does this exist in either 32-bit or 64-bit?"
> >   */
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index dff85f6db9..2810104dea 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >       */
> >      int fdarray[3];
> >      bool sve_supported;
> > +    bool el2_supported;
> >      uint64_t features = 0;
> >      uint64_t t;
> >      int err;
> > @@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >      }
> >
> >      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> > +    el2_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2) > 0;
> >
> >      kvm_arm_destroy_scratch_host_vcpu(fdarray);
> >
> > @@ -671,6 +673,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >      features |= 1ULL << ARM_FEATURE_PMU;
> >      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
> >
> > +    if (el2_supported) {
> > +        features |= 1ULL << ARM_FEATURE_EL2;
> > +    }
> > +
> >      ahcf->features = features;
> >
> >      return true;
> > @@ -721,6 +727,11 @@ bool kvm_arm_steal_time_supported(void)
> >      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
> >  }
> >
> > +bool kvm_arm_nested_virt_supported(void)
> > +{
> > +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
> > +}
> > +
> >  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
> >
> >  void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> > @@ -856,6 +867,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          assert(kvm_arm_sve_supported());
> >          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> >      }
> > +    if (cpu->has_el2) {
> > +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> > +    }
> >
> >      /* Do KVM_ARM_VCPU_INIT ioctl */
> >      ret = kvm_arm_vcpu_init(cs);
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 34f8daa377..da3a3d5920 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -285,6 +285,24 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
> >   */
> >  bool kvm_arm_steal_time_supported(void);
> >
> > +/**
> > + * kvm_arm_nested_virt_finalize:
> > + * @cpu: ARMCPU for which to finalize nested-virt
> > + * @errp: Pointer to Error* for error propagation
> > + *
> > + * Validate the nested-virt property selection and set its default
> > + * based on KVM support and guest configuration.
> > + */
> > +void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp);
>
> Where is this function defined? From where is it called?
>

Same reason here!

> > +
> > +/**
> > + * kvm_arm_nested_virt_supported:
> > + *
> > + * Returns: true if KVM can enable nested virtualization
> > + * and false otherwise.
> > + */
> > +bool kvm_arm_nested_virt_supported(void);
> > +
> >  /**
> >   * kvm_arm_aarch32_supported:
> >   *
> > @@ -398,6 +416,11 @@ static inline bool kvm_arm_steal_time_supported(void)
> >      return false;
> >  }
> >
> > +static inline bool kvm_arm_nested_virt_supported(void)
> > +{
> > +    return false;
> > +}
> > +
> >  /*
> >   * These functions should never actually be called without KVM support.
> >   */
> > @@ -441,6 +464,11 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
> >      g_assert_not_reached();
> >  }
> >
> > +static inline void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> >  static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> >  {
> >      g_assert_not_reached();
> > --
> > 2.17.1
> >
>
> Thanks,
> drew
>

