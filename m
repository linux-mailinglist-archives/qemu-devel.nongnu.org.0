Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AB15975D0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 20:37:32 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oONv0-0007aJ-SM
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 14:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oONs8-0004Mh-NW; Wed, 17 Aug 2022 14:34:32 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oONs6-0005M6-MQ; Wed, 17 Aug 2022 14:34:32 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11be650aaccso8689049fac.6; 
 Wed, 17 Aug 2022 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4e3LY4tKjV1xTEFEk+Z1ekRz18RV9RzWxHVB5uoqVWg=;
 b=eErOP9oTIDz5uweB29DYEUzDy/n+R04FF/XwfkltKLOMa4dhjtpbjnxi2yDxA7AnI3
 HS8gWPsT91zJsNKZLuDvFUXpXz9yOhVcHTI4+SXSAZOxJTh9ss1zj0chs6kKngcHnCtc
 XWGPW7nwp4Vy7powX3hUrtkRZuXsAxxhOJo2MMua7mq7pLkhrx63fbEuB8XPn1gKli3U
 jsWrWVusVMYa5lfTv+ebB0K5ygx8mnw5ivdVkzAVolhX3n/H9t27Sg4RmUbC/P0VVDUb
 Kkr4SHDEEes/9+sNikjB/IgHbKykEcl6dNUxy9mRS8pS6VCZ7D2Mn3ckinU99F5bhuSW
 kFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4e3LY4tKjV1xTEFEk+Z1ekRz18RV9RzWxHVB5uoqVWg=;
 b=Ca9vMBTxKtYxz9ST/HXU4pcgyZjZ78344EJv3xiGboUM3LWjJvguN6r9q4T/+y6vtq
 eXStGfZ7oqiqr9bBvFemRUgbYdifJ4BSxS438p1A0BNIJNGdJBdoBm4NDTsBhj9vRhqO
 vc91eEQo4rrH0GTzBQth8rh36AirhUOL/bL6avvQCDVDCqK8IuY12YY6sZJCxY0GC6ua
 8mCBRs7AszQweeIdRU+GRlleyFUMxaQ9WllORmqwtIRl50ZVuhTsTpxRE5eYbwe6xZex
 5G/cPnLRaJ3ywCaMvODLrOMgNgoRRU942+3pUFSL3BONZGXgZ1I1Co4j6avWxhDOENDV
 UCOw==
X-Gm-Message-State: ACgBeo3k4RJzfaMPwit91S0oVQxEqAfcn2d+9hMZ1UVqHSigFvqAcPdx
 StrEWYyaydfbQFqUqRSvsnI=
X-Google-Smtp-Source: AA6agR5P9P8pNz37eSpo11Koo6SiCSRBrD3vGmfQHOthTneI/XyQufbjayPvKOX64KWpI5bSV0Yv6g==
X-Received: by 2002:a05:6870:2499:b0:101:7531:c7ec with SMTP id
 s25-20020a056870249900b001017531c7ecmr2500424oaq.42.1660761269081; 
 Wed, 17 Aug 2022 11:34:29 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a4aeac2000000b0044565e7ab41sm3146492ooh.32.2022.08.17.11.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 11:34:28 -0700 (PDT)
Message-ID: <a0cbd4e2-a575-2c06-ed85-6d30e43b8cb0@gmail.com>
Date: Wed, 17 Aug 2022 15:34:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] target/ppc: Fix host PVR matching for KVM
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20220731013358.170187-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220731013358.170187-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 7/30/22 22:33, Nicholas Piggin wrote:
> ppc_cpu_compare_class_pvr_mask() should match the best CPU class in the
> family, because it is used by the KVM subsystem to find the host CPU
> class. Since commit 03ae4133ab8 ("target-ppc: Add pvr_match()
> callback"), it matches any class in the family (the first one in the
> comparison list).
> 
> Since commit f30c843ced5 ("ppc/pnv: Introduce PowerNV machines with
> fixed CPU models"), pnv has relied on pnv_match having these new
> semantics to check machine compatibility with a CPU family.
> 
> Resolve this by adding a parameter to the pvr_match function to select
> the best or any match, and restore the old behaviour for the KVM case.
> 
> Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
> power9_v1.0 class (because that happens to be the first POWER9 family
> CPU compared). After the patch, it matches the power9_v2.0 class.
> 
> This approach requires pnv_match contain knowledge of the CPU classes
> implemented in the same family, which feels ugly. But pushing the 'best'
> match down to the class would still require they know about one another
> which is not obviously much better. For now this gets things working.
> 
> Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

And queued in gitlab.com/danielhb/qemu/tree/ppc-7.2.


Daniel

> 
> This is extracted from patch 1 in the series here:
> 
> https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00226.html
> 
> I finally went back and worked out what the issue was, which is the
> new usage of pvr_match that pnv has. That should now be fixed.
> 
> Thanks,
> Nick
> 
>   hw/ppc/pnv.c          |  2 +-
>   target/ppc/cpu-qom.h  |  6 ++-
>   target/ppc/cpu_init.c | 91 +++++++++++++++++++++++++++++++++----------
>   target/ppc/machine.c  |  2 +-
>   4 files changed, 77 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d3f77c8367..a4cb4cf10b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -714,7 +714,7 @@ static bool pnv_match_cpu(const char *default_type, const char *cpu_type)
>       PowerPCCPUClass *ppc =
>           POWERPC_CPU_CLASS(object_class_by_name(cpu_type));
>   
> -    return ppc_default->pvr_match(ppc_default, ppc->pvr);
> +    return ppc_default->pvr_match(ppc_default, ppc->pvr, false);
>   }
>   
>   static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index ad7e3c3db9..89ff88f28c 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -158,7 +158,11 @@ struct PowerPCCPUClass {
>       void (*parent_parse_features)(const char *type, char *str, Error **errp);
>   
>       uint32_t pvr;
> -    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr);
> +    /*
> +     * If @best is false, match if pcc is in the family of pvr
> +     * Else match only if pcc is the best match for pvr in this family.
> +     */
> +    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr, bool best);
>       uint64_t pcr_mask;          /* Available bits in PCR register */
>       uint64_t pcr_supported;     /* Bits for supported PowerISA versions */
>       uint32_t svr;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d1493a660c..899c4a586e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5912,15 +5912,25 @@ static void init_proc_POWER7(CPUPPCState *env)
>       ppcPOWER7_irq_init(env_archcpu(env));
>   }
>   
> -static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
> +static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7P_BASE) {
> -        return true;
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (!best) {
> +        if (base == CPU_POWERPC_POWER7_BASE) {
> +            return true;
> +        }
> +        if (base == CPU_POWERPC_POWER7P_BASE) {
> +            return true;
> +        }
>       }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7_BASE) {
> -        return true;
> +
> +    if (base != pcc_base) {
> +        return false;
>       }
> -    return false;
> +
> +    return true;
>   }
>   
>   static bool cpu_has_work_POWER7(CPUState *cs)
> @@ -6073,18 +6083,27 @@ static void init_proc_POWER8(CPUPPCState *env)
>       ppcPOWER7_irq_init(env_archcpu(env));
>   }
>   
> -static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
> +static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8NVL_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8E_BASE) {
> -        return true;
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (!best) {
> +        if (base == CPU_POWERPC_POWER8_BASE) {
> +            return true;
> +        }
> +        if (base == CPU_POWERPC_POWER8E_BASE) {
> +            return true;
> +        }
> +        if (base == CPU_POWERPC_POWER8NVL_BASE) {
> +            return true;
> +        }
>       }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8_BASE) {
> -        return true;
> +    if (base != pcc_base) {
> +        return false;
>       }
> -    return false;
> +
> +    return true;
>   }
>   
>   static bool cpu_has_work_POWER8(CPUState *cs)
> @@ -6282,11 +6301,26 @@ static void init_proc_POWER9(CPUPPCState *env)
>       ppcPOWER9_irq_init(env_archcpu(env));
>   }
>   
> -static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
> +static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER9_BASE) {
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (!best) {
> +        if (base == CPU_POWERPC_POWER9_BASE) {
> +            return true;
> +        }
> +    }
> +
> +    if (base != pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
>           return true;
>       }
> +
>       return false;
>   }
>   
> @@ -6499,11 +6533,26 @@ static void init_proc_POWER10(CPUPPCState *env)
>       ppcPOWER9_irq_init(env_archcpu(env));
>   }
>   
> -static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
> +static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER10_BASE) {
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (!best) {
> +        if (base == CPU_POWERPC_POWER10_BASE) {
> +            return true;
> +        }
> +    }
> +
> +    if (base != pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power10_v1.0 and power10_v2.0 */
>           return true;
>       }
> +
>       return false;
>   }
>   
> @@ -6910,7 +6959,7 @@ static gint ppc_cpu_compare_class_pvr_mask(gconstpointer a, gconstpointer b)
>           return -1;
>       }
>   
> -    if (pcc->pvr_match(pcc, pvr)) {
> +    if (pcc->pvr_match(pcc, pvr, true)) {
>           return 0;
>       }
>   
> @@ -7308,7 +7357,7 @@ static void ppc_cpu_instance_finalize(Object *obj)
>       ppc_hash64_finalize(cpu);
>   }
>   
> -static bool ppc_pvr_match_default(PowerPCCPUClass *pcc, uint32_t pvr)
> +static bool ppc_pvr_match_default(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>   {
>       return pcc->pvr == pvr;
>   }
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index a7d9036c09..be6eb3d968 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -234,7 +234,7 @@ static bool pvr_match(PowerPCCPU *cpu, uint32_t pvr)
>       if (pvr == pcc->pvr) {
>           return true;
>       }
> -    return pcc->pvr_match(pcc, pvr);
> +    return pcc->pvr_match(pcc, pvr, true);
>   }
>   
>   static int cpu_post_load(void *opaque, int version_id)

