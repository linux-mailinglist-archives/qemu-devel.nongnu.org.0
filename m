Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D44A4FA4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:44:13 +0100 (CET)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcay-0005sT-As
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nEc51-00037E-Vw; Mon, 31 Jan 2022 14:11:13 -0500
Received: from [2607:f8b0:4864:20::232] (port=36454
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nEc4x-00025k-FJ; Mon, 31 Jan 2022 14:11:11 -0500
Received: by mail-oi1-x232.google.com with SMTP id s185so28617682oie.3;
 Mon, 31 Jan 2022 11:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WfOWHJh6A38sNQGQ8hTh20C+ODFcRKG0W7Ux0iuwu48=;
 b=R7jhmbFVMUamwJQt8vnaToEpl/PX7o31I03UyubSMK7J2jJeNP27puHfSh5BM2Z7gz
 JX9wn9thgJf6hhVkxX3CuqPOX2OO3NGigDObZC1EeueQC3XCmt6pZEpepbBLQd6wxtdT
 hIF5ibJXkj6UQ5ZRb2/6lAW5kQ1+yCKefE/BBuPCEKTzqNgb64vF1VuXdUscxMJ1PnN4
 CyFKVUhqoVzYynN+42hkMkOywQOwy9WUBHan2yiQTKO01OYJuySEk9aSwlv4dcgwPtFE
 iGKDlfAoblRzKouWqsucWMv3X3wvsZA06tbmYoHKC3QhJFGI9bwLB9pPzScexdqbxUfb
 7Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WfOWHJh6A38sNQGQ8hTh20C+ODFcRKG0W7Ux0iuwu48=;
 b=1hfI8z9Av7gYHJjHEa43ib7OmB0Q3abDLGCI1UZ48JvOajfVMeDPgzlTvdfeG+yyR6
 dw/5zyBmnEyDfJZ+/HCIYp47EJ+uHIgcejj3YYG+HaAUO5qIozBKLTdYWW+b/QZ8QED4
 HKYU9kMTeiN7J5lygCLl2F4KKc2A945hEVt92LPTkhpZNY3UZXN9vvphxyQj5395RAsj
 QPfBGg+9WYaelLdTs9OkYBDpGF3zOUUvHrP9M8YTKM4tooQBfTclpzpOWJ/P9bbTAm9c
 LQTE4RKs4z/yd0MHOVywuBhq6cG85x8woPKOoAYwk3f+ilr+u3wnWTe/ZJzeKMNrzI+U
 kUJg==
X-Gm-Message-State: AOAM533MJI+ZO8bQw73y3YXtFFVZjDnYVHLcdOE9Ajdko0fBbV7cJiPz
 dLPEb6DNyGauylYE/zzU86M=
X-Google-Smtp-Source: ABdhPJyXK/hntNbXW0YUAbi5OoZpmmAjHCSGNI/MbfeOpFLMY96SgsAVeaiSUAzLDg4wwduol/AKWQ==
X-Received: by 2002:a05:6808:2188:: with SMTP id
 be8mr11688085oib.63.1643656238325; 
 Mon, 31 Jan 2022 11:10:38 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id q8sm2876340oiw.12.2022.01.31.11.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 11:10:37 -0800 (PST)
Message-ID: <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com>
Date: Mon, 31 Jan 2022 16:10:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20220129065007.103681-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220129065007.103681-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/29/22 03:50, Nicholas Piggin wrote:
> The behaviour of the Address Translation Mode on Interrupt resource is
> not consistently supported by all CPU versions or all KVM versions.  In
> particular KVM HV only supports mode 0 on POWER7 processors, and does
> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
> can support all modes (0,2,3).
> 
> This leads to inconsistencies in guest behaviour and could cause
> problems migrating guests.
> 
> This was not too noticable for Linux guests for a long time because the
> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
> advisory (KVM would not always honor it either) and it kept both sets of
> interrupt vectors around.
> 
> Recent Linux guests depend on the AIL mode working as defined by the ISA
> to support the SCV facility interrupt. If AIL mode 3 can not be provided,
> then Linux must be given an error so it can disable the SCV facility.

Is this the scenario where migration failures can occur? I don't understand
what are the migration problems you cited that were possible to happen.

> 
> Add the ail-modes capability which is a bitmap of the supported values
> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
> a new KVM CAP that exports the same thing, and provide defaults for PR
> and HV KVM that predate the cap.

Why add a new machine cap in this case? Isn't something that the KVM capability
should be able to handle by itself, where we always assume that we should have
the best AIL value possible?

Besides, the way it is coded here, we're adding an user-visible capability that
mimics the exact behavior we want from h_set_mode_resource_addr_trans_mode(),
meaning that only bits 0,1,2 and 3 of cap-ail-modes can be set, but:

- bit 0 must always be set
- bit 1 must always be cleared
- if kvm_enabled():
    * bit 2 must always be cleared
    * bit 3 can be cleared or not depending on kvmppc_has_cap_ail_3(), which translates
to not allowed if running with KVM_PR and allowing it if it we're running with Power8
and newer

i.e. bit 0 is always set, bit 1 is always cleared, bit 2 can be set or not for TCG but
always cleared for KVM, and bit 3 can be set depending on the circunstances.

Note that this would allow an user to set this guest in a Power9/10 machine:

-machine pseries,accel=kvm,cap-ail-modes=1

And the guest will end up having degraded performance because AIL=3 is being disabled.

If we want to avoid this and force AIL=3 to be used in this case, then this capability
would be used just to set or clear AIL=2 when running with TCG.


I believe the chunks in which we check for kvm_pr and allow only AIL=0 are improvements
of h_set_mode_resource_addr_trans_mode(), but other than that I'm afraid that exposing
this cap to users is a bit overkill.


Thanks,


Daniel


> ---
> 
> I just wanted to get some feedback on the approach before submitting a
> patch for the KVM cap.
> 
> The reason I don't make that a boolean cap for AIL=3 is that future
> processors might implement new modes a guest would like to use even
> though it's not the nicest interface.
> 
> Thanks,
> Nick
> 
>   hw/ppc/spapr.c            |  1 +
>   hw/ppc/spapr_caps.c       | 81 +++++++++++++++++++++++++++++++++++++++
>   hw/ppc/spapr_hcall.c      | 16 ++------
>   include/hw/ppc/spapr.h    | 10 ++++-
>   linux-headers/linux/kvm.h |  1 +
>   target/ppc/kvm.c          | 25 ++++++++++++
>   target/ppc/kvm_ppc.h      |  6 +++
>   7 files changed, 126 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 163c90388a..2a7a510aa7 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4604,6 +4604,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
>       smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
>       smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> +    smc->default_caps.caps[SPAPR_CAP_AIL_MODES] = SPAPR_CAP_AIL_MODES_DEFAULT;
>       spapr_caps_add_properties(smc);
>       smc->irq = &spapr_irq_dual;
>       smc->dr_phb_enabled = true;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index ed7c077a0d..21cc93af86 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -94,6 +94,30 @@ static void spapr_cap_set_bool(Object *obj, Visitor *v, const char *name,
>       spapr->eff.caps[cap->index] = value ? SPAPR_CAP_ON : SPAPR_CAP_OFF;
>   }
>   
> +static void spapr_cap_get_uint8(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    SpaprCapabilityInfo *cap = opaque;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +    uint8_t value = spapr_get_cap(spapr, cap->index) == SPAPR_CAP_ON;
> +
> +    visit_type_uint8(v, name, &value, errp);
> +}
> +
> +static void spapr_cap_set_uint8(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    SpaprCapabilityInfo *cap = opaque;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +    uint8_t value;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    spapr->cmd_line_caps[cap->index] = true;
> +    spapr->eff.caps[cap->index] = value;
> +}
>   
>   static void  spapr_cap_get_string(Object *obj, Visitor *v, const char *name,
>                                     void *opaque, Error **errp)
> @@ -613,6 +637,54 @@ static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
>       }
>   }
>   
> +static void cap_ail_apply(SpaprMachineState *spapr,
> +                                     uint8_t val, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (!(val & (0x01 << 0))) {
> +        error_setg(errp, "cap-ail-modes mode must include AIL=0");
> +        error_append_hint(errp,
> +                          "Ensure bit 0 (value 1) is set in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (val & ~((0x01 << 0) | (0x01 << 1) | (0x01 << 2) | (0x01 << 3))) {
> +        error_setg(errp, "Unknown cap-ail-modes value");
> +        error_append_hint(errp,
> +                          "Ensure only bits between 0 and 3 are set in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (val & (0x01 << 1)) {
> +        error_setg(errp, "Unsupported cap-ail-modes mode AIL=1");
> +        error_append_hint(errp,
> +                          "Ensure bit 1 (value 2) is clear in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (kvm_enabled()) {
> +        if (val & (0x01 << 2)) {
> +            error_setg(errp, "KVM does not support cap-ail-modes mode AIL=2");
> +            error_append_hint(errp,
> +                              "Ensure bit 2 (value 4) is clear in cap-ail-modes\n");
> +            if (kvmppc_has_cap_ail_3()) {
> +                error_append_hint(errp, "Try appending -machine cap-ail-modes=9\n");
> +            } else {
> +                error_append_hint(errp, "Try appending -machine cap-ail-modes=1\n");
> +            }
> +            return;
> +        }
> +        if ((val & (0x01 << 3)) && !kvmppc_has_cap_ail_3()) {
> +            error_setg(errp, "KVM implementation does not support cap-ail-modes AIL=3");
> +            error_append_hint(errp,
> +                              "Ensure bit 3 (value 8) is clear in cap-ail-modes\n");
> +            error_append_hint(errp, "Try appending -machine cap-ail-modes=1\n");
> +            return;
> +        }
> +    }
> +}
> +
>   SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>       [SPAPR_CAP_HTM] = {
>           .name = "htm",
> @@ -730,6 +802,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>           .type = "bool",
>           .apply = cap_rpt_invalidate_apply,
>       },
> +    [SPAPR_CAP_AIL_MODES] = {
> +        .name = "ail-modes",
> +        .description = "Bitmap of AIL (alternate interrupt location) mode support",
> +        .index = SPAPR_CAP_AIL_MODES,
> +        .get = spapr_cap_get_uint8,
> +        .set = spapr_cap_set_uint8,
> +        .type = "uint8",
> +        .apply = cap_ail_apply,
> +    },
>   };
>   
>   static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 222c1b6bbd..3de4553b35 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -811,15 +811,11 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
>   }
>   
>   static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
> +                                                        SpaprMachineState *spapr,
>                                                           target_ulong mflags,
>                                                           target_ulong value1,
>                                                           target_ulong value2)
>   {
> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> -
> -    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> -        return H_P2;
> -    }
>       if (value1) {
>           return H_P3;
>       }
> @@ -827,13 +823,7 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
>           return H_P4;
>       }
>   
> -    if (mflags == 1) {
> -        /* AIL=1 is reserved in POWER8/POWER9/POWER10 */
> -        return H_UNSUPPORTED_FLAG;
> -    }
> -
> -    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> -        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
> +    if (!(spapr_get_cap(spapr, SPAPR_CAP_AIL_MODES) & (0x01 << mflags))) {
>           return H_UNSUPPORTED_FLAG;
>       }
>   
> @@ -853,7 +843,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
>           ret = h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[3]);
>           break;
>       case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
> -        ret = h_set_mode_resource_addr_trans_mode(cpu, args[0],
> +        ret = h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0],
>                                                     args[2], args[3]);
>           break;
>       }
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ee7504b976..307b89adb7 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -49,6 +49,12 @@ typedef enum {
>       SPAPR_RESIZE_HPT_REQUIRED,
>   } SpaprResizeHpt;
>   
> +/**
> + * This cap is a bitmask of supported modes. Default to always supporting
> + * 0 and 3 (PR KVM and POWER7 and earlier only support 0).
> + */
> +#define SPAPR_CAP_AIL_MODES_DEFAULT     ((0x01 << 0) | (0x01 << 3))
> +
>   /**
>    * Capabilities
>    */
> @@ -77,8 +83,10 @@ typedef enum {
>   #define SPAPR_CAP_FWNMI                 0x0A
>   /* Support H_RPT_INVALIDATE */
>   #define SPAPR_CAP_RPT_INVALIDATE        0x0B
> +/* Support for AIL modes */
> +#define SPAPR_CAP_AIL_MODES             0x0C
>   /* Num Caps */
> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODES + 1)
>   
>   /*
>    * Capability Values
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index bcaf66cc4d..5e94ecaa8e 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1112,6 +1112,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_BINARY_STATS_FD 203
>   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>   #define KVM_CAP_ARM_MTE 205
> +#define KVM_CAP_PPC_AIL_MODES 206
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..c6a5a8e6e5 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>   static int cap_large_decr;
>   static int cap_fwnmi;
>   static int cap_rpt_invalidate;
> +static int cap_ail_modes;
>   
>   static uint32_t debug_inst_opcode;
>   
> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       }
>   
>       cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
> +    cap_ail_modes = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODES);
>       kvm_ppc_register_host_cpu_type();
>   
>       return 0;
> @@ -2563,6 +2565,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
>       return cap_rpt_invalidate;
>   }
>   
> +int kvmppc_has_cap_ail_3(void)
> +{
> +    if (!cap_ail_modes) {
> +        PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
> +
> +        /*
> +         * KVM HV hosts which do not support CAP_AIL_MODES capability still
> +         * support AIL=3 on POWER8 and above. Special-case this so as not to
> +         * lose performance on those hosts.
> +         */
> +        if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> +            return 0;
> +        }
> +
> +        if (kvmppc_is_pr(kvm_state)) {
> +            return 0;
> +        } else {
> +            return 1;
> +        }
> +    }
> +    return !!(cap_ail_modes & (1 << 3));
> +}
> +
>   PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>   {
>       uint32_t host_pvr = mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..efafa67b83 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
>   int kvmppc_get_cap_large_decr(void);
>   int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
>   int kvmppc_has_cap_rpt_invalidate(void);
> +int kvmppc_has_cap_ail_3(void);
>   int kvmppc_enable_hwrng(void);
>   int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>   PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
>       return false;
>   }
>   
> +static inline int kvmppc_has_cap_ail_3(void)
> +{
> +    return false;
> +}
> +
>   static inline int kvmppc_enable_hwrng(void)
>   {
>       return -1;

