Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2564FB8A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bow-0004Lm-5h; Sat, 17 Dec 2022 13:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bou-0004LH-7X
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:22:00 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bos-0003BP-IQ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:21:59 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n20so13229601ejh.0
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hCDbeK1ydBYPvIImx9zIe08Zc6llPRZLRtqbvVac4iM=;
 b=oNV0DE5xbbWO9NIKzFZHG2B0b1Exxq6qEwBfWIjpUbLFg03WJ4Px7m+HcXzMWq6jwV
 zteVKcZEBmSrw12pxa7WjcwtDHznTWUAyT0nueXUnU7hUACRqKmrMwIZc57yFH8JCMIM
 VWMovNO7iX8cE143FCIY6czvmdjBEmJCDH+xUVRo+3LLPzYgSim0HLGhI+sxXSNPfYnX
 KS0iOCbKRAh3azxFyGmhhu2ynGEdGGrmkmrppcFzbtUy88rF7rnXn1SGfHIIyDdJQ7w8
 TRT9zWbJPwCXZPvC+BTG291LEiudJV2GZl/C4oxzHIs6O9+DhXzuavRPNA2tXLTL+tjx
 O1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hCDbeK1ydBYPvIImx9zIe08Zc6llPRZLRtqbvVac4iM=;
 b=VdOOyhPVtK4fI+6f5sgtNICp9pev6tqd0KaUKaEYXO/gMLlcoa3Q8V2+Ao7QZCknBI
 Vnv+nakhXEfEDMTKuTOUZ32a4KvvzULMqqz49xJ1CBYVlpj+4IXEI0zCb7nE5wezBFse
 x3VHZ9X/sMuP4yq9AzBpacwK1syZ3Y19GqvizcPzPYthxRbWDAxAs7PeqClHFCRgfIdQ
 wZjNXnrGX4XcdbBHFMxc275G/jSrQxFSHSqXOxrJx9BCpwbjyS40BUVk7WggrPZibcY7
 LOLYVG0C90dlso3x7Fl2Yd6eDnQTR+22D+dBa1SVlNmdQttTnR+mu+ROTdxtLvmfUUPA
 UmBA==
X-Gm-Message-State: ANoB5plYqV1/SWwS0EjrsIEFaH92fysPfiEkFU2ExUP1oGI7QHPzMfPA
 cj5+7YIPnhuGPlIXbjkwH9LE7A==
X-Google-Smtp-Source: AA0mqf7sjfmofz7LtR6/Kln3IBwo2V5bIF15UFuZkXFmTE3F86kuKN/bBYg7NhHhw5yGaMrV8Oqnag==
X-Received: by 2002:a17:906:298c:b0:7c1:9eb:845b with SMTP id
 x12-20020a170906298c00b007c109eb845bmr30495391eje.16.1671301316822; 
 Sat, 17 Dec 2022 10:21:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a17090653d200b007c1651aeeacsm2219985ejo.181.2022.12.17.10.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:21:56 -0800 (PST)
Message-ID: <44ff8209-236d-cd2f-25cd-d608303ad96f@linaro.org>
Date: Sat, 17 Dec 2022 19:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v12 08/61] target/riscv: add fault-only-first unit stride
 load
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, Laurent Vivier <laurent@vivier.eu>
References: <20200701152549.1218-1-zhiwei_liu@c-sky.com>
 <20200701152549.1218-9-zhiwei_liu@c-sky.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20200701152549.1218-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(unburying an old patch)

On 1/7/20 17:24, LIU Zhiwei wrote:
> The unit-stride fault-only-fault load instructions are used to
> vectorize loops with data-dependent exit conditions(while loops).
> These instructions execute as a regular load except that they
> will only take a trap on element 0.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/helper.h                   |  22 +++++
>   target/riscv/insn32.decode              |   7 ++
>   target/riscv/insn_trans/trans_rvv.inc.c |  73 ++++++++++++++++
>   target/riscv/vector_helper.c            | 110 ++++++++++++++++++++++++
>   4 files changed, 212 insertions(+)

> +/*
> + *** unit-stride fault-only-fisrt load instructions
> + */
> +static inline void
> +vext_ldff(void *vd, void *v0, target_ulong base,
> +          CPURISCVState *env, uint32_t desc,
> +          vext_ldst_elem_fn *ldst_elem,
> +          clear_fn *clear_elem,
> +          uint32_t esz, uint32_t msz, uintptr_t ra)
> +{
> +    void *host;
> +    uint32_t i, k, vl = 0;
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    target_ulong addr, offset, remain;
> +
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        addr = base + nf * i * msz;
> +        if (i == 0) {
> +            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);

Shouldn't we check page_check_range() in user-mode here?

> +        } else {
> +            /* if it triggers an exception, no need to check watchpoint */
> +            remain = nf * msz;
> +            while (remain > 0) {
> +                offset = -(addr | TARGET_PAGE_MASK);
> +                host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
> +                                         cpu_mmu_index(env, false));
> +                if (host) {
> +#ifdef CONFIG_USER_ONLY
> +                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
> +                        vl = i;
> +                        goto ProbeSuccess;
> +                    }
> +#else
> +                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +#endif
> +                } else {
> +                    vl = i;
> +                    goto ProbeSuccess;
> +                }
> +                if (remain <=  offset) {
> +                    break;
> +                }
> +                remain -= offset;
> +                addr += offset;
> +            }
> +        }
> +    }
> +ProbeSuccess:
> +    /* load bytes from guest memory */
> +    if (vl != 0) {
> +        env->vl = vl;
> +    }
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            target_ulong addr = base + (i * nf + k) * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +    /* clear tail elements */
> +    if (vl != 0) {
> +        return;
> +    }
> +    for (k = 0; k < nf; k++) {
> +        clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * esz);
> +    }
> +}

