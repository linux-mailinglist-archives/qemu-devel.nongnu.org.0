Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D254D56C6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 01:33:03 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSTDJ-0004ef-S8
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 19:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSTAy-0003bz-O9; Thu, 10 Mar 2022 19:30:38 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=39522
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSTAw-0007vD-MW; Thu, 10 Mar 2022 19:30:36 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso8826489ooe.6; 
 Thu, 10 Mar 2022 16:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NQtIlu5bwRCc2oxKcMGxeh4ESJ2UgZxynvOHF4M+lb0=;
 b=cRXv08Scpbzgu0/TSWTGyJVwFnGgLCdKU35OeHXOuRzVCIG++2Icd2O4cs7ZaHgglI
 tGFY6C6XyXz4d2v+Y75t1wJ3CrhlV6KjsbfZ0tQjXkjkGz+zBoWAHFeof252I2f6X8j+
 xEIL87p8mvkBTh5h1yWr6ywhUC/WkwUQp78VSarrgM4TVtV1pXxeOMrxN5mwkP8k7cDs
 HaxmSM/jEJhwETm16E9DS7JdX1i8YzArhYYYsZ72NLCCqIERvjk2kpBwHaT1Uxdw2PzS
 QxCHSAz0hy7FYPyfuesStaynPvj3MAmmvptXFGotNaPWM+qapMHRggmhPCoZOOjkJ/Hm
 gedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NQtIlu5bwRCc2oxKcMGxeh4ESJ2UgZxynvOHF4M+lb0=;
 b=ZsLQCQQopn+zc2ed/WVb5+cLnFWtFYm7JghOxDou6cv1ASewxWX3cQOLXi0MBh0M3L
 mjr3iCAt3q82ZOGWczpsgEn5BsFsvNaXcuOk9+29Oeb5CCbmkae1MiOLq1KXz9H/Qytf
 Uw1mqjFnB6EQMEeVIERlh4ujD4rgzruOve4IdGSPYDQF7LSkEpLMbKwMNNk4ucstcYpC
 zHnLmcDHrdpE8lKxW+IuQijPpTVFslT800XZEgeqcnk1H5+me56sIJby6LclA4NlwfZS
 RZuFBMWvGb42GAPHvO+xPWWtUgTl/XimjDyXIU9vgaShryS8RMrfeMbH2U/QjPOD370q
 5B9Q==
X-Gm-Message-State: AOAM5315rRit717iYdxjYbYXoFoGiTk/r+2XCVZyGGaM9REQLZjSXQI5
 0Tb7Fv3DWd/EAaSoydLLrC0=
X-Google-Smtp-Source: ABdhPJw6CmQH5GNkSj2G+wp/jeMZFeDsAQgQQf7uA31emc7eiDibES4JccTFXiSZAtl2ws6i9oRiUQ==
X-Received: by 2002:a05:6870:e0ce:b0:da:b3f:3219 with SMTP id
 a14-20020a056870e0ce00b000da0b3f3219mr4256605oab.201.1646958631689; 
 Thu, 10 Mar 2022 16:30:31 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:5655:fd2a:accf:db6c:e4fd?
 ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056830270900b005b22854f3besm2971838otu.39.2022.03.10.16.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 16:30:31 -0800 (PST)
Message-ID: <44006828-b313-6ba3-efce-5eaff87809dc@gmail.com>
Date: Thu, 10 Mar 2022 21:30:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <87wnh1a8mu.fsf@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87wnh1a8mu.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, clg@kaod.org,
 npiggin@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/10/22 16:51, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@linux.ibm.com> writes:
> 
>> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
>> property of the /chosen node. Byte number 26 specifies Radix Table
>> Expansions, currently only GTSE (Guest Translation Shootdown
>> Enable). This feature determines whether the tlbie instruction (and
>> others) are HV privileged.
>>
>> Up until now, we always reported GTSE=1 to guests. Even after the
>> support for GTSE=0 was added. As part of that support, a kernel
>> command line radix_hcall_invalidate=on was introduced that overrides
>> the GTSE value received via CAS. So a guest can run with GTSE=0 and
>> use the H_RPT_INVALIDATE hcall instead of tlbie.
>>
>> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
>> when running nested KVM guests because KVM does not allow a nested
>> hypervisor to set GTSE support for its nested guests. So a nested
>> guest always uses the same value for LPCR_GTSE as its HV. Since the
>> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=1, we run
>> into a crash when:
>>
>> L1 LPCR_GTSE=0
>> L2 LPCR_GTSE=0
>> L2 CAS GTSE=1
>>
>> The nested guest will run 'tlbie' and crash because the HW looks at
>> LPCR_GTSE, which is clear.
>>
>> Having GTSE disabled in the L1 and enabled in the L2 is not an option
>> because the whole purpose of GTSE is to disallow access to tlbie and
>> we cannot allow L1 to spawn L2s that can access features that L1
>> itself cannot.
>>
>> We also cannot have the guest check the LPCR bit, because LPCR is
>> HV-privileged.
>>
>> So this patch goes through the most intuitive route which is to have
>> QEMU ask KVM about GTSE support and advertise the correct value to the
>> guest. A new KVM_CAP_PPC_GTSE capability is being added.
>>
>> TCG continues to always enable GTSE.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
>>   target/ppc/kvm.c     |  8 ++++++++
>>   target/ppc/kvm_ppc.h |  6 ++++++
>>   3 files changed, 45 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 4cc204f90d..3e95a1831f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>>           23, 0x00, /* XICS / XIVE mode */
>>           24, 0x00, /* Hash/Radix, filled in below. */
>>           25, 0x00, /* Hash options: Segment Tables == no, GTSE == no. */
>> -        26, 0x40, /* Radix options: GTSE == yes. */
>> +        26, 0x00, /* Radix options, filled in below. */
>>       };
>>   
>>       if (spapr->irq->xics && spapr->irq->xive) {
>> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>>           } else {
>>               val[3] = 0x00; /* Hash */
>>           }
>> +
>> +        if (kvmppc_has_cap_gtse()) {
>> +            val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
>> +        }
> 
> This needs the same treatment as below to support kernels that don't
> know about the cap. Also, look at that semicolon! =D


hahaha. There's another one down ...

> 
>>       } else {
>>           /* V3 MMU supports both hash and radix in tcg (with dynamic switching) */
>>           val[3] = 0xC0;
>> +        val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;

^ here



Daniel

>>       }
>> +
>>       _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
>>                        val, sizeof(val)));
>>   }
>> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *machine)
>>       /* Init numa_assoc_array */
>>       spapr_numa_associativity_init(spapr, machine);
>>   
>> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>>                                 spapr->max_compat_pvr)) {
>> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
>> -        /* KVM and TCG always allow GTSE with radix... */
>> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>> +
>> +        /* TCG always supports Radix w/ GTSE */
>> +        if (!kvm_enabled()) {
>> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
>> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>> +        } else {
>> +            if (kvmppc_has_cap_mmu_radix()) {
>> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
>> +            }
>> +
>> +            /*
>> +             * Only disable Guest Translation Shootdown if KVM
>> +             * supports the H_RPT_INVALIDATE hypercall, otherwise we'd
>> +             * leave the guest with no way to make TLB invalidations.
>> +             */
>> +            if (kvmppc_has_cap_rpt_invalidate()) {
>> +                if (kvmppc_has_cap_gtse()) {
>> +                    spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>> +                }
>> +            } else {
>> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>> +            }
>> +        }
>>       }
>> -    /* ... but not with hash (currently). */
>>   
>>       if (kvm_enabled()) {
>>           /* Enable H_LOGICAL_CI_* so SLOF can talk to in-kernel devices */
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index dc93b99189..91582c4b15 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>>   static int cap_large_decr;
>>   static int cap_fwnmi;
>>   static int cap_rpt_invalidate;
>> +static int cap_gtse;
>>   
>>   static uint32_t debug_inst_opcode;
>>   
>> @@ -154,6 +155,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>       }
>>   
>>       cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
>> +    cap_gtse = kvm_vm_check_extension(s, KVM_CAP_PPC_GTSE);
>> +
>>       kvm_ppc_register_host_cpu_type();
>>   
>>       return 0;
>> @@ -2397,6 +2400,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
>>       return cap_mmu_hash_v3;
>>   }
>>   
>> +bool kvmppc_has_cap_gtse(void)
>> +{
>> +    return cap_gtse;
>> +}
>> +
>>   static bool kvmppc_power8_host(void)
>>   {
>>       bool ret = false;
>> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
>> index ee9325bf9a..7d6980edb7 100644
>> --- a/target/ppc/kvm_ppc.h
>> +++ b/target/ppc/kvm_ppc.h
>> @@ -63,6 +63,7 @@ bool kvmppc_has_cap_fixup_hcalls(void);
>>   bool kvmppc_has_cap_htm(void);
>>   bool kvmppc_has_cap_mmu_radix(void);
>>   bool kvmppc_has_cap_mmu_hash_v3(void);
>> +bool kvmppc_has_cap_gtse(void);
>>   bool kvmppc_has_cap_xive(void);
>>   int kvmppc_get_cap_safe_cache(void);
>>   int kvmppc_get_cap_safe_bounds_check(void);
>> @@ -343,6 +344,11 @@ static inline bool kvmppc_has_cap_mmu_hash_v3(void)
>>       return false;
>>   }
>>   
>> +static inline bool kvmppc_has_cap_gtse(void)
>> +{
>> +    return false;
>> +}
>> +
>>   static inline bool kvmppc_has_cap_xive(void)
>>   {
>>       return false;

