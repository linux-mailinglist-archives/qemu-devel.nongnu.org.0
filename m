Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FD415068
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:19:44 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7mR-0001f4-48
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT74a-0001Y9-Mv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:34:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT74X-0001tU-4i
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:34:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id q26so9671970wrc.7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g8L/MJ5IG6GXDN0M9kAYNGG1e4Ha/v0KcHTmxfM0XM4=;
 b=e/FDWHwZALA8xTuJihAaDHnbIV8nxXVrlIjaw7fmtHvkSoKqC5hSmZOG2fLQz+ZqbA
 1M6UfhwmnF2H4hkwnROO81MqObL8IZneo0om+VaL81iFA5tptJDoLrYYQK2UJfHi/vD0
 Ge1cv25TZ4SyBkqNbpIJxQiH6XHWnBVaSiHcH1hYlR5jEpKG/JesBn4akv+TPLy6+CP1
 aD8MPojC0LrDYpv5oh4VpFKXCjo4dngFIpqbYE41Rgq0uErrdT+7Msd76tO8urjbqwik
 vjlbJIEZfYg0xyg6r2hJv1pKe3mZ6KY+7HOqFW5E9lFR9SfnDniMfCAUct7Ly4B2bzVm
 ECNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g8L/MJ5IG6GXDN0M9kAYNGG1e4Ha/v0KcHTmxfM0XM4=;
 b=8LHdnT8hGTnxK0xkx1FYha5dNjCYWOUNE9ZNUxbqWTVx4o6wwX7YkdYPhiCJhyGbSB
 7u5HusJWjFdQNHXXDn2LUrqTWwdnRr4YUCey0VKllVZKbduT6+sRgDd9Gd2KUTCE1OmR
 Pp7SEAWQgc4Ibg8bF8/ZIQFF6CkZe6GFDLCoXs2b09iPXW7mSzf8S16iwSQjzyc7K8PO
 1xOsH1sO8Gdy5U20QBj9NPXuRAl09tXxVpS16ylNm6AV1FiICpZjY2JPc1aKOxOr+3Mx
 B7qdpOqwfQ2+zjtJaGobkwx1wijLMPnrokAj2D5J/mb9MK+D2P5/5Z6pNjPYC5GGmcKr
 QlBA==
X-Gm-Message-State: AOAM532V8xnV/H3PpuNp+S6YOFdHwitNU926X/R7CX/NViZSbyw+VzV9
 LiEh8z4I/9AdLB4XBF5arz0=
X-Google-Smtp-Source: ABdhPJyNWxHXjzONeAkJIDPVfRcMDHEevA2VH47gGrgNzw381mFzbI1/TpFEyDSLEDBsUYSeye0rmg==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr539525wrq.260.1632335659023;
 Wed, 22 Sep 2021 11:34:19 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k19sm2821277wmr.21.2021.09.22.11.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:34:18 -0700 (PDT)
Message-ID: <5023a346-3d9e-104f-d51f-bf9815f720af@amsat.org>
Date: Wed, 22 Sep 2021 20:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/30] tcg/loongarch64: Add the tcg-target.h file
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-4-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922180927.666273-4-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 20:09, WANG Xuerui wrote:
> Support for all optional TCG ops are initially marked disabled; the bits
> are to be set in individual commits later.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.h | 180 +++++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-target.h
> 
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> new file mode 100644
> index 0000000000..0fd9b61e6d
> --- /dev/null
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -0,0 +1,180 @@
> +/*
> + * Tiny Code Generator for QEMU
> + *
> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
> + *
> + * Based on tcg/riscv/tcg-target.h
> + *
> + * Copyright (c) 2018 SiFive, Inc

I thought you could drop this line.

> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef LOONGARCH_TCG_TARGET_H
> +#define LOONGARCH_TCG_TARGET_H
> +
> +/*
> + * Loongson removed the (incomplete) 32-bit support from kernel and toolchain
> + * for the initial upstreaming of this architecture, so don't bother and just
> + * support the LP64 ABI for now.
> + */
> +#if defined(__loongarch64)
> +# define TCG_TARGET_REG_BITS 64
> +#else
> +# error unsupported LoongArch register size
> +#endif
> +
> +#define TCG_TARGET_INSN_UNIT_SIZE 4
> +#define TCG_TARGET_NB_REGS 32
> +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)

Is this SIZE_MAX?

> +
> +typedef enum {
> +    TCG_REG_ZERO,
> +    TCG_REG_RA,
> +    TCG_REG_TP,
> +    TCG_REG_SP,
> +    TCG_REG_A0,
> +    TCG_REG_A1,
> +    TCG_REG_A2,
> +    TCG_REG_A3,
> +    TCG_REG_A4,
> +    TCG_REG_A5,
> +    TCG_REG_A6,
> +    TCG_REG_A7,
> +    TCG_REG_T0,
> +    TCG_REG_T1,
> +    TCG_REG_T2,
> +    TCG_REG_T3,
> +    TCG_REG_T4,
> +    TCG_REG_T5,
> +    TCG_REG_T6,
> +    TCG_REG_T7,
> +    TCG_REG_T8,
> +    TCG_REG_RESERVED,
> +    TCG_REG_S9,
> +    TCG_REG_S0,
> +    TCG_REG_S1,
> +    TCG_REG_S2,
> +    TCG_REG_S3,
> +    TCG_REG_S4,
> +    TCG_REG_S5,
> +    TCG_REG_S6,
> +    TCG_REG_S7,
> +    TCG_REG_S8,

Here could go:

        TCG_TARGET_NB_REGS,

> +
> +    /* aliases */
> +    TCG_AREG0    = TCG_REG_S0,
> +    TCG_REG_TMP0 = TCG_REG_T8,
> +    TCG_REG_TMP1 = TCG_REG_T7,
> +    TCG_REG_TMP2 = TCG_REG_T6,
> +} TCGReg;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

