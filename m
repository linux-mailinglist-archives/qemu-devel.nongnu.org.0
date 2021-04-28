Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8636D4B1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:23:42 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgQ1-0006in-4Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbgNu-0005rW-PM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:21:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbgNr-0004mP-CZ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:21:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so49502366wrx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KdQOcGDJVvVHYHVBWYLugJ7EpO80Rvm55xJsmNdILTI=;
 b=xPnFvb2lx3/055r//kMBokA8MYaGAXql23Vr7cz8jHf8Qrxf2nvAsrQanlBvcRmnL+
 xUXOUFa+JHex6MmU5cLeSXITUW4mExMq8aoWfGfD5fcoUtBmBgAjsIWXtB+oIQWKiOfW
 YetwslQTfLbxBbcruMO5X1zhCI6RdtxUURmf0VI+67q3ubmWDU4N8UzGKY3w763XtHJg
 hF2LkpTzCbmkS9duSAkL3wqsgF6VLqDchsEYZLfbHpvkb7rKotJdaI+a2AMRa/YA5vBS
 GvtGEBk3TKwnkQf2VuUWinhzOAIyHKdDWI+wA9YlGDivwrNnJRoSJkHmIiECDyh2KZr4
 VnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KdQOcGDJVvVHYHVBWYLugJ7EpO80Rvm55xJsmNdILTI=;
 b=S+y9WQTGj+E6CfPQmtbRxYxomrczA8yv9QPOrV06t5s/5PoHqcsyyMm31ssn8RLXnp
 18WkQGX8XTdtGiMQUXutq0A2ApWRlJ+dZjqq/28CrYoq/FhxQBe1NunakI7Tye/NPWh8
 sSxEFyWApEQZVbDHANIcCmYyCUJZ9yo/RUAU2kkt4dq8GPyxbnWfPSe0IdhPh91sU/UN
 ZA1krRSMXciGTNylvH8urU+/ZZ22yOUCm20hWCoEC5M7ruviteWZP6PH17jb8oAHf6x9
 54rkl7FrUbq4iAcXfLIAOBzG6/BWM8KM95gvYEgRa1kcbaiRLuBCZzvUB9ZqkriRj96N
 Uhlg==
X-Gm-Message-State: AOAM531LIq4Yq2S2PHuFkj/Ej5tm65QwnLLlnXQajlzIUQSoK+voJ+0f
 u4gdt7YSDYDUK6zbKMzAdozCJw==
X-Google-Smtp-Source: ABdhPJyW7Hx0gx/geKgpA4VMMVGULx0haCTsSbQQ4ZvZGU1pAGFbNBLGwfKtRaOW9ZnFQh2EeNmNJg==
X-Received: by 2002:a5d:424e:: with SMTP id s14mr11401537wrr.354.1619601685945; 
 Wed, 28 Apr 2021 02:21:25 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id e38sm4130630wmp.21.2021.04.28.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 02:21:25 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] hw/sparc: Allow building without the leon3 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
 <20210427192658.266933-3-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <00462de9-abf5-c9bf-6892-1cd0e825b977@adacore.com>
Date: Wed, 28 Apr 2021 11:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427192658.266933-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

Le 4/27/21 à 9:26 PM, Philippe Mathieu-Daudé a écrit :
> When building without the leon3 machine, we get this link failure:
> 
>    /usr/bin/ld: target_sparc_int32_helper.c.o: in function `leon3_irq_manager':
>    target/sparc/int32_helper.c:172: undefined reference to `leon3_irq_ack'
> 
> This is because the leon3_irq_ack() is declared in hw/sparc/leon3.c,
> which is only build when CONFIG_LEON3 is selected.
> 
> Fix by moving the leon3_cache_control_int() / leon3_irq_manager()
> (which are specific to the leon3 machine) to hw/sparc/leon3.c.
> Move the trace events along (but don't rename them).
> 
> leon3_irq_ack() is now locally used, declare it static to reduce
> its scope.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>

Thanks for the fix!

> ---
> RFC: The problem is we have hardware specific code in the
> architectural translation code. I wish there was a better
> alternative rather than moving this code to hw/sparc/.
> ---
>   target/sparc/cpu.h          |  6 ------
>   hw/sparc/leon3.c            | 37 ++++++++++++++++++++++++++++++++++++-
>   target/sparc/int32_helper.c | 37 -------------------------------------
>   hw/sparc/trace-events       |  2 ++
>   target/sparc/trace-events   |  4 ----
>   5 files changed, 38 insertions(+), 48 deletions(-)
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 4b2290650be..ff8ae73002a 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -615,15 +615,9 @@ int cpu_cwp_inc(CPUSPARCState *env1, int cwp);
>   int cpu_cwp_dec(CPUSPARCState *env1, int cwp);
>   void cpu_set_cwp(CPUSPARCState *env1, int new_cwp);
>   
> -/* int_helper.c */
> -void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno);
> -
>   /* sun4m.c, sun4u.c */
>   void cpu_check_irqs(CPUSPARCState *env);
>   
> -/* leon3.c */
> -void leon3_irq_ack(void *irq_manager, int intno);
> -
>   #if defined (TARGET_SPARC64)
>   
>   static inline int compare_masked(uint64_t x, uint64_t y, uint64_t mask)
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index 7e16eea9e67..98e3789cf84 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -137,7 +137,36 @@ static void main_cpu_reset(void *opaque)
>       env->regbase[6] = s->sp;
>   }
>   
> -void leon3_irq_ack(void *irq_manager, int intno)
> +static void leon3_cache_control_int(CPUSPARCState *env)
> +{
> +    uint32_t state = 0;
> +
> +    if (env->cache_control & CACHE_CTRL_IF) {
> +        /* Instruction cache state */
> +        state = env->cache_control & CACHE_STATE_MASK;
> +        if (state == CACHE_ENABLED) {
> +            state = CACHE_FROZEN;
> +            trace_int_helper_icache_freeze();
> +        }
> +
> +        env->cache_control &= ~CACHE_STATE_MASK;
> +        env->cache_control |= state;
> +    }
> +
> +    if (env->cache_control & CACHE_CTRL_DF) {
> +        /* Data cache state */
> +        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
> +        if (state == CACHE_ENABLED) {
> +            state = CACHE_FROZEN;
> +            trace_int_helper_dcache_freeze();
> +        }
> +
> +        env->cache_control &= ~(CACHE_STATE_MASK << 2);
> +        env->cache_control |= (state << 2);
> +    }
> +}
> +
> +static void leon3_irq_ack(void *irq_manager, int intno)
>   {
>       grlib_irqmp_ack((DeviceState *)irq_manager, intno);
>   }
> @@ -181,6 +210,12 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
>       }
>   }
>   
> +static void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
> +{
> +    leon3_irq_ack(irq_manager, intno);
> +    leon3_cache_control_int(env);
> +}
> +
>   static void leon3_generic_hw_init(MachineState *machine)
>   {
>       ram_addr_t ram_size = machine->ram_size;
> diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
> index 817a463a179..d008dbdb65c 100644
> --- a/target/sparc/int32_helper.c
> +++ b/target/sparc/int32_helper.c
> @@ -136,40 +136,3 @@ void sparc_cpu_do_interrupt(CPUState *cs)
>       }
>   #endif
>   }
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void leon3_cache_control_int(CPUSPARCState *env)
> -{
> -    uint32_t state = 0;
> -
> -    if (env->cache_control & CACHE_CTRL_IF) {
> -        /* Instruction cache state */
> -        state = env->cache_control & CACHE_STATE_MASK;
> -        if (state == CACHE_ENABLED) {
> -            state = CACHE_FROZEN;
> -            trace_int_helper_icache_freeze();
> -        }
> -
> -        env->cache_control &= ~CACHE_STATE_MASK;
> -        env->cache_control |= state;
> -    }
> -
> -    if (env->cache_control & CACHE_CTRL_DF) {
> -        /* Data cache state */
> -        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
> -        if (state == CACHE_ENABLED) {
> -            state = CACHE_FROZEN;
> -            trace_int_helper_dcache_freeze();
> -        }
> -
> -        env->cache_control &= ~(CACHE_STATE_MASK << 2);
> -        env->cache_control |= (state << 2);
> -    }
> -}
> -
> -void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
> -{
> -    leon3_irq_ack(irq_manager, intno);
> -    leon3_cache_control_int(env);
> -}
> -#endif
> diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
> index 355b07ae057..dfb53dc1a24 100644
> --- a/hw/sparc/trace-events
> +++ b/hw/sparc/trace-events
> @@ -19,3 +19,5 @@ sun4m_iommu_bad_addr(uint64_t addr) "bad addr 0x%"PRIx64
>   # leon3.c
>   leon3_set_irq(int intno) "Set CPU IRQ %d"
>   leon3_reset_irq(int intno) "Reset CPU IRQ %d"
> +int_helper_icache_freeze(void) "Instruction cache: freeze"
> +int_helper_dcache_freeze(void) "Data cache: freeze"
> diff --git a/target/sparc/trace-events b/target/sparc/trace-events
> index 6a064e23275..e925ddd1cc0 100644
> --- a/target/sparc/trace-events
> +++ b/target/sparc/trace-events
> @@ -15,10 +15,6 @@ int_helper_set_softint(uint32_t softint) "new 0x%08x"
>   int_helper_clear_softint(uint32_t softint) "new 0x%08x"
>   int_helper_write_softint(uint32_t softint) "new 0x%08x"
>   
> -# int32_helper.c
> -int_helper_icache_freeze(void) "Instruction cache: freeze"
> -int_helper_dcache_freeze(void) "Data cache: freeze"
> -
>   # win_helper.c
>   win_helper_gregset_error(uint32_t pstate) "ERROR in get_gregset: active pstate bits=0x%x"
>   win_helper_switch_pstate(uint32_t pstate_regs, uint32_t new_pstate_regs) "change_pstate: switching regs old=0x%x new=0x%x"
> 

