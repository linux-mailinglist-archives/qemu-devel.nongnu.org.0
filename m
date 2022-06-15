Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBD54CD53
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:45:39 +0200 (CEST)
Received: from localhost ([::1]:52074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VD8-0001FH-A5
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Ujx-0006Ql-Ru
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:15:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Ujv-00087Y-0V
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:15:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id g8so5473967plt.8
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NwKCxxDZHaRzzVB7y9ioblZeMvE6INBXtnG6G6DvlDo=;
 b=oHtPf+58J+yOhJt6zInPeYyDQIOC3w+50vJioSe4YpX7pNWAd5Wwd0HrDUrvIMikC0
 EA4j3mL6IU/RflQ2rush/0WjUXQQFU4d8k9xgp+GsM5PFFZUe5kLg1n0ssqfzLbJLTZB
 UDXNo0s/MCEZhcdNZ9F2ofmNdT/wxO7A57mK6wSfvXNGmMWuxlWFQKp4wEHDVhBObzLk
 qV5gZExnmuyb9v9mZ/WOkhMQwCoCYTUkz22IDPSYmTvdet1TCb2r4guY4NbAy1JhnUQo
 1FzuQtEZSuu+Okdyc7yTEtY+xiLGXPrPD+OWFOE3zBYzTi7jAV3fiIjnFYtTeW5Bcyj/
 pU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwKCxxDZHaRzzVB7y9ioblZeMvE6INBXtnG6G6DvlDo=;
 b=lWhn/Ayrk2ERJmbyI9kuPUR/xubr4sUhe5Vj5/YAYJA0nyBM9408S8TUM08t9XSy1e
 mTHMHdMZvyCetJHXV6RZlbSQb8zJU0/6RM+UJlXi2jP+84VIOiafODKgMbjAlnlUSm6e
 y0UKIg9LXxh78zu7HFnuFgqrecY6FpfIat+38yoMcoPiy40NkkmV6QOYAEGfQolAw/i4
 /8/heKh0pX7gk+Q3r1q27OKYz4qcuA85nwnFbHpIYf07WwDgQdC5ofQeDd8vfVVsixak
 zpe3abEE4amP/CNn43D8LoHkYpe2/jRrMqRPpUX7OlHxFJQFZ02k5g/7MRV0EYv/6VbD
 EffQ==
X-Gm-Message-State: AJIora/UguyAEJhd0TZYxE2Y7/qasjIcOpn8/B5XIUWZ3gUx17jdxFSc
 2oQTuOQnt4YDQjA/Z0FUXjre/w==
X-Google-Smtp-Source: AGRyM1veAhJ624Enp1iv0kS/RDjx/hu41sR5D3MX5OJ070DfVMJllYenF7nLSXx/hAiJt0nZq6bH+w==
X-Received: by 2002:a17:903:234e:b0:164:1668:3bc with SMTP id
 c14-20020a170903234e00b00164166803bcmr102029plh.106.1655306125293; 
 Wed, 15 Jun 2022 08:15:25 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a63a609000000b00401a7b4f137sm1527695pge.41.2022.06.15.08.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 08:15:24 -0700 (PDT)
Message-ID: <bb1686ea-077f-81b0-7f0c-19e39fe16c85@linaro.org>
Date: Wed, 15 Jun 2022 08:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: Update tval for hardware watchpoint
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
References: <20220615040806.137678-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220615040806.137678-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/14/22 21:08, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When watchpoint is hit, the breakpoint exception should update tval
> to point to the faulting virtual address.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   target/riscv/cpu.h        | 1 +
>   target/riscv/cpu_helper.c | 6 ++++++
>   target/riscv/debug.c      | 2 ++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..fdcba8978b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -289,6 +289,7 @@ struct CPUArchState {
>   
>       /* trigger module */
>       target_ulong trigger_cur;
> +    bool wp_hit;

It would be better to not add this, which duplicates cs->watchpoint_hit.
In riscv_cpu_debug_excp_handler, raise a synthetic exception number 
(RISCV_EXCP_WATCHPOINT?), then set tval in the same switch as the others.


r~

