Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B804EA21B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:58:17 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwRN-00034l-1R
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:58:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwQG-0002QJ-2q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:57:08 -0400
Received: from [2607:f8b0:4864:20::229] (port=36362
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYwQE-0000sr-KH
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:57:07 -0400
Received: by mail-oi1-x229.google.com with SMTP id z8so16987912oix.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oGNcy0p2SUc1teSC7eKfozuAcjdr5gur25THUgTDuSc=;
 b=hJFFWJbIezFD+80i6HTCsiJUZ3X/2DM/y3PywrQBK/sURpkjLF7Scvrs+WKw/wq3B6
 HgmNcqzGYpPVQaxYFt0rJ0YjDQ6rPd5YPIZ1V14SnxLU8fIKJkB/r4jE9yVAgJfcNASy
 6/FMjQeB7XDdfZIfnLJB177QGYGnpp7sQKITzzBpFvpKXtx3ejyWNFzFMB/32T5CdlpU
 KrzuY//iALRxAAEbXIIzxcSM12EkY8nDjCsYzaeKdLg2A7oGb1a+bs81e+SZ1N8/xg/V
 L1CoejI2ecpaYb2jcl3viXQcofkgQN3T95kvKgCK89cO3qHsmYOeerZNA1/ufKDeT9u7
 455A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oGNcy0p2SUc1teSC7eKfozuAcjdr5gur25THUgTDuSc=;
 b=f0gqCSFGVaBrvVU8NzAKpHOy2lbSnCD6Vs5gr+0UwiP1m6FJXWneP4R4jQY0OhYIw0
 PCTOZUMsoPwvXpK0SAjSiDbIM1oz3g7HT5G19ec13+rpQy0bIgT60LDBKJnVaMzop3Am
 4N3sB/byadZ1uvUyqvBNVI1Pwfyx7Um+fkb6V58pf6QE5OOWE+xTbQQSeZo/mGjcSKfQ
 /afn/++3dLnwarWwheP7PgUdm/msbFpFuusW8H99+k3E1TfNvPqBdfSR7I4YVXdW5bvE
 eSu0on3WqfEAQ1VHwd9DzF+uX8s3DVQ7S6lWGQZHCmrIdDeDRR9QbVGKSy6FvFKHOgpL
 O7sA==
X-Gm-Message-State: AOAM530tu7aqih4Hd0az4AbqgRc2XpvcEpm+odolTEHxg2SaJxvmtuaS
 or9DHKVu+AkkwyddnHBlKntcXw==
X-Google-Smtp-Source: ABdhPJwtgpXuKvv0pCdVbe30ZeGItJ3ZEMtM0i9siAKjooYWi5cZW7Sy9knbEkznI67XKgq53ysltw==
X-Received: by 2002:a54:4589:0:b0:2ec:d236:90d with SMTP id
 z9-20020a544589000000b002ecd236090dmr544934oib.55.1648501025369; 
 Mon, 28 Mar 2022 13:57:05 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s42-20020a4a96ad000000b00324c54e9cf5sm6527617ooi.4.2022.03.28.13.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:57:04 -0700 (PDT)
Message-ID: <28a67123-d98c-eec5-c82b-971e1dc8eda8@linaro.org>
Date: Mon, 28 Mar 2022 14:57:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 15/29] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-16-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-16-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
> +{
> +    LoongArchCPU *cpu = opaque;
> +    CPULoongArchState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    if (irq < 0 || irq > N_IRQS) {
> +        return;
> +    }
> +
> +    if (level) {
> +        env->CSR_ESTAT |= 1 << irq;
> +    } else {
> +        env->CSR_ESTAT &= ~(1 << irq);
> +    }
> +
> +    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +}
> +
>   static void loongarch_cpu_reset(void *opaque)
>   {
>       LoongArchCPU *cpu = opaque;
> @@ -69,6 +92,8 @@ static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
>       CPULoongArchState *env;
>       env = &la_cpu->env;
>   
> +    qdev_init_gpio_in(DEVICE(la_cpu), loongarch_cpu_set_irq, N_IRQS);

This all belongs over in target/loongarch/.


r~

