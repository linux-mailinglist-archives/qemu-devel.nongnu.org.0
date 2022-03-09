Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F874D3995
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:10:15 +0100 (CET)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1hN-0005oP-Eb
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:10:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nS1gN-0004yQ-U3; Wed, 09 Mar 2022 14:09:11 -0500
Received: from [2607:f8b0:4864:20::22f] (port=35410
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nS1gM-0004Ee-64; Wed, 09 Mar 2022 14:09:11 -0500
Received: by mail-oi1-x22f.google.com with SMTP id k2so3665770oia.2;
 Wed, 09 Mar 2022 11:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/foVzBIijIqXKLEO66b0wEoLxgOjaL4vV9OSd0r2I34=;
 b=OphAPANLkl0xgzP72LB8DEOUr7GNR6/115a2Sr+z8TAnORrpI7OLAqoKk6oVkGu8GC
 QaKOpCj4LTVsqCFcR0Vkl5BFlFqJHjl8Vn2m8Wjm+Th319AUDKt50FnFH3VNGqZPjOP+
 9ng/HrC8a72sk3LuTdUzjfhJ3L2f4IzBqS7uxwUPsg8bJs1cKmW817bGaqZfOTlx6xws
 KlelY1NdcI+evkTdDn8gNtta4NB3tnFvC+KlG4+9f520SlChy4vlMNVxmoI6lIAvjNyt
 iDOpdyoazVyqhveW2jO1RRLpxVTltLui/NYJOFA8VMhf32VxtSyPB1Axen6T1eNi1q9u
 ZZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/foVzBIijIqXKLEO66b0wEoLxgOjaL4vV9OSd0r2I34=;
 b=XFFbFLR0lqbwh76okTHGmrHc5EFSIOsIlCL+U4BRHl2Bvnh9zDmpICYFRaKKde6MBc
 JkZWGx2AtR80TkOc442R8uFOuhiZko5jGcEItdGnRJajNjbjWvz2XqGiauETWz0QxAj7
 H+F+dp+TdcicOQQ6QZGnCDKUbg2Z0kYCcAehqSkjyh/fgA1YtC07Cu7EHhZUAUcgO7P4
 gNjrAJ5BpRVAuI4TVpNjh2b/zZM6ZL/W2Beg9SEQJcOpryUOMH4buIWvVucWZq5aP5dL
 P47O0vKED/FPdXqxYP9mYEkXYy3tJ6bCQIpi+uU0TFI/zSrPczoZ/9X7ijqK9Sct7zOr
 nKNQ==
X-Gm-Message-State: AOAM5333IKWONcri31X9WlYr/7dQv6L0nm8dY9e5zz6luy6hOzs+XGf5
 1BRdl1goGb1EGueAwiPdPTM=
X-Google-Smtp-Source: ABdhPJydfi03My7XTfgIKjDjETM3CnGdz+8oDnIhMZhsFPqNkURELDSKJ5oEECh7wFOaEaSiNGS8tA==
X-Received: by 2002:a05:6808:15a9:b0:2da:5978:4a43 with SMTP id
 t41-20020a05680815a900b002da59784a43mr73046oiw.30.1646852948269; 
 Wed, 09 Mar 2022 11:09:08 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:5655:a5c1:86e:fdfb:3794?
 ([2804:431:c7c6:5655:a5c1:86e:fdfb:3794])
 by smtp.gmail.com with ESMTPSA id
 ej35-20020a056870f72300b000d75f1d9b8asm1321730oab.55.2022.03.09.11.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 11:09:07 -0800 (PST)
Message-ID: <d9cb6b05-9c06-8081-ee7f-a44f3a85848b@gmail.com>
Date: Wed, 9 Mar 2022 16:09:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220309012400.2527157-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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



On 3/8/22 22:23, Fabiano Rosas wrote:
> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
> property of the /chosen node. Byte number 26 specifies Radix Table
> Expansions, currently only GTSE (Guest Translation Shootdown
> Enable). This feature determines whether the tlbie instruction (and
> others) are HV privileged.
> 
> Up until now, we always reported GTSE=1 to guests. Even after the
> support for GTSE=0 was added. As part of that support, a kernel
> command line radix_hcall_invalidate=on was introduced that overrides
> the GTSE value received via CAS. So a guest can run with GTSE=0 and
> use the H_RPT_INVALIDATE hcall instead of tlbie.
> 
> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
> when running nested KVM guests because KVM does not allow a nested
> hypervisor to set GTSE support for its nested guests. So a nested
> guest always uses the same value for LPCR_GTSE as its HV. Since the
> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=1, we run
> into a crash when:
> 
> L1 LPCR_GTSE=0
> L2 LPCR_GTSE=0
> L2 CAS GTSE=1
> 
> The nested guest will run 'tlbie' and crash because the HW looks at
> LPCR_GTSE, which is clear.
> 
> Having GTSE disabled in the L1 and enabled in the L2 is not an option
> because the whole purpose of GTSE is to disallow access to tlbie and
> we cannot allow L1 to spawn L2s that can access features that L1
> itself cannot.
> 
> We also cannot have the guest check the LPCR bit, because LPCR is
> HV-privileged.
> 
> So this patch goes through the most intuitive route which is to have
> QEMU ask KVM about GTSE support and advertise the correct value to the
> guest. A new KVM_CAP_PPC_GTSE capability is being added.
> 
> TCG continues to always enable GTSE.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---


I'm not sure if I fully understood the situation, so let me recap. Once upon a time,
QEMU advertised GTSE=1 and the host would never advertise other value, and everyone
was happy.

The host started to support GTSE=0, but QEMU kept advertising GTSE=1 regardless, and no
KVM GTSE cap was added to reflect the host support. I'll then assume that:


- all guests would break if running in a GTSE=0 host prior to rpt_invalidate support (which
is necessary to allow the guest to run in GTSE=0)

- apparently no one ever tried to run a KVM guest in a GTSE=0 host, so no bugs were opened

After commit 82123b756a1a2f1 (target/ppc: Support for H_RPT_INVALIDATE hcall) we added
cap-rpt-invalidate. I didn't follow the discussions of this cap but it seems like, as with
almost every other cap we have, there would be a migration problem for a guest that was in
a rpt_invalidate aware host to migrate to another where this wouldn't be true, and the cap
solves that.

What I'm not following is why, even after having cap-rpt-invalidate, we are still "lying"
about the GTSE=1 regardless of what the host supports. We could've added the GTSE KVM cap
at the same time rpt_invalidate was introduced, and guests that want to ignore this setting
can use the cap to bypass it.


In the end this patch is a needed fix IMHO. My confusion is why we're doing this just now.


The patch itself LGTM.


Thanks,


Daniel


>   hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
>   target/ppc/kvm.c     |  8 ++++++++
>   target/ppc/kvm_ppc.h |  6 ++++++
>   3 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4cc204f90d..3e95a1831f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>           23, 0x00, /* XICS / XIVE mode */
>           24, 0x00, /* Hash/Radix, filled in below. */
>           25, 0x00, /* Hash options: Segment Tables == no, GTSE == no. */
> -        26, 0x40, /* Radix options: GTSE == yes. */
> +        26, 0x00, /* Radix options, filled in below. */
>       };
>   
>       if (spapr->irq->xics && spapr->irq->xive) {
> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>           } else {
>               val[3] = 0x00; /* Hash */
>           }
> +
> +        if (kvmppc_has_cap_gtse()) {
> +            val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
> +        }
>       } else {
>           /* V3 MMU supports both hash and radix in tcg (with dynamic switching) */
>           val[3] = 0xC0;
> +        val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
>       }
> +
>       _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
>                        val, sizeof(val)));
>   }
> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *machine)
>       /* Init numa_assoc_array */
>       spapr_numa_associativity_init(spapr, machine);
>   
> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>                                 spapr->max_compat_pvr)) {
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> -        /* KVM and TCG always allow GTSE with radix... */
> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +
> +        /* TCG always supports Radix w/ GTSE */
> +        if (!kvm_enabled()) {
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +        } else {
> +            if (kvmppc_has_cap_mmu_radix()) {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> +            }
> +
> +            /*
> +             * Only disable Guest Translation Shootdown if KVM
> +             * supports the H_RPT_INVALIDATE hypercall, otherwise we'd
> +             * leave the guest with no way to make TLB invalidations.
> +             */
> +            if (kvmppc_has_cap_rpt_invalidate()) {
> +                if (kvmppc_has_cap_gtse()) {
> +                    spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +                }
> +            } else {
> +                spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> +            }
> +        }
>       }
> -    /* ... but not with hash (currently). */
>   
>       if (kvm_enabled()) {
>           /* Enable H_LOGICAL_CI_* so SLOF can talk to in-kernel devices */
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..91582c4b15 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>   static int cap_large_decr;
>   static int cap_fwnmi;
>   static int cap_rpt_invalidate;
> +static int cap_gtse;
>   
>   static uint32_t debug_inst_opcode;
>   
> @@ -154,6 +155,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       }
>   
>       cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
> +    cap_gtse = kvm_vm_check_extension(s, KVM_CAP_PPC_GTSE);
> +
>       kvm_ppc_register_host_cpu_type();
>   
>       return 0;
> @@ -2397,6 +2400,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
>       return cap_mmu_hash_v3;
>   }
>   
> +bool kvmppc_has_cap_gtse(void)
> +{
> +    return cap_gtse;
> +}
> +
>   static bool kvmppc_power8_host(void)
>   {
>       bool ret = false;
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..7d6980edb7 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -63,6 +63,7 @@ bool kvmppc_has_cap_fixup_hcalls(void);
>   bool kvmppc_has_cap_htm(void);
>   bool kvmppc_has_cap_mmu_radix(void);
>   bool kvmppc_has_cap_mmu_hash_v3(void);
> +bool kvmppc_has_cap_gtse(void);
>   bool kvmppc_has_cap_xive(void);
>   int kvmppc_get_cap_safe_cache(void);
>   int kvmppc_get_cap_safe_bounds_check(void);
> @@ -343,6 +344,11 @@ static inline bool kvmppc_has_cap_mmu_hash_v3(void)
>       return false;
>   }
>   
> +static inline bool kvmppc_has_cap_gtse(void)
> +{
> +    return false;
> +}
> +
>   static inline bool kvmppc_has_cap_xive(void)
>   {
>       return false;

