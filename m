Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F24EA027
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 21:49:42 +0200 (CEST)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvMy-0007nq-M2
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 15:49:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvK6-0005pq-BS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 15:46:42 -0400
Received: from [2001:4860:4864:20::30] (port=41386
 helo=mail-oa1-x30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvK4-0007JG-Hh
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 15:46:41 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-df0940c4eeso2930003fac.8
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hViZrpzgdGlti/Qsmwian/6J8HUaqkZSmIUySACJqLk=;
 b=tFSlR6lMfggWexLH0+8b33vZQ8CzX/MD0jyvZ0WvCj9LNGsw8i6XlhzLqWmdbPAq9w
 MeE2r1c1UJyzJShrkSJk/aeX8XMQzs9WxoeAXBVlm3OB+VPpoRI8Lk8+fLrbzyEoxCTd
 sBFOZl9SOXBQFNjzS4XU89PkGeSLtpVknbKBrEJPcc6wypP9wtyrhNTJd00D301vZVW+
 xnDIOiETzYWNsmqzBnrUqKXrcF0sEze6BBxzsnirCrrxU+d1Xx1SJWx2ZVlpOmr2kFFs
 mlrZcMW/Xgi4nrcMpzuRRvrK2D4I9hT333vddBfFewn975Qndvw12oTmLqIjmf90DeYG
 8gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hViZrpzgdGlti/Qsmwian/6J8HUaqkZSmIUySACJqLk=;
 b=317OLpWJa5X58QGH0rKYRGsfCR0R3AOPx9qGjcjgQlqINdyDteAvE+XSv1ObcLy+jv
 EHfBzL1iI2393aRB7hDgXnyM76BH9gJVs8sWvGWLYwMegplQMs3nW9Y8bbMKh+Sej/Zi
 V9dWIbqvo4ovM/FrdckxdXi8P4JHo3PSDCL+CDLNTLb7HsD2dJy/89ix7slFdkwBcuna
 VLkNo2WW1IUSsEeImPUDerYV0XEYZA1Ocl6dHbsegEDVh1VhOUep77x6Qp6e9I8tF6JO
 gFG+e1WOn4lG3x4R6Io5L5NeJbQ9TZ24qkbZZNRmzWsQX8y8mnUuaky5lRxKetypPrwh
 PKLg==
X-Gm-Message-State: AOAM5310SJKbKVHR6t6nhgJx+n7hAZKdPl9yTH3cRMRf1Hu3ugOIl4W+
 Cr3jQ/F8eGGNS3GmAAdPcNfe0A==
X-Google-Smtp-Source: ABdhPJwzgUbi+fEgLuh18pd/vcsZzxOpyk6aWMCda2pr0S2qUpaMipi4arALFQoOvQUh0ZmfxyJFqQ==
X-Received: by 2002:a05:6870:785:b0:da:ac31:3e04 with SMTP id
 en5-20020a056870078500b000daac313e04mr388257oab.270.1648496798835; 
 Mon, 28 Mar 2022 12:46:38 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 he5-20020a056870798500b000ddf4f625easm6823071oab.18.2022.03.28.12.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:46:34 -0700 (PDT)
Message-ID: <8a68b039-f34f-4ab3-746e-005663621791@linaro.org>
Date: Mon, 28 Mar 2022 13:46:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 05/29] target/loongarch: Add constant timer support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::30
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
> +                                               uint64_t value)
> +{
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    env->CSR_TCFG = value;
> +    if (value & CONSTANT_TIMER_ENABLE) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (value & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    }

If CONSTANT_TIMER_ENABLE is not set, you need to use timer_del() to turn off any existing 
timer.


> +void loongarch_constant_timer_cb(void *opaque)
> +{
> +    LoongArchCPU *cpu  = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    uint64_t now, next;
> +
> +    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (env->CSR_TCFG & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(&cpu->timer, next);
> +    } else {
> +        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
> +    }
> +
> +    env->CSR_ESTAT |= 1 << IRQ_TIMER;
> +    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);

I think this is wrong and you should be using loongarch_cpu_set_irq (which is misplaced 
for you to be able to do so).

> @@ -297,4 +302,9 @@ enum {
>   #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>   
> +void loongarch_constant_timer_cb(void *opaque);
> +uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
> +uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
> +void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
> +                                               uint64_t value);

These can go in internals.h.


r~

