Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12C46E8ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR98-0007be-FT; Thu, 20 Apr 2023 06:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR94-0007VW-7I
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:04:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR92-0003Po-Dw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:04:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3368518wmo.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985043; x=1684577043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OW9u69NgfoghJtPekxWhv6ZSbpygwiz3BCEEMJsPeyo=;
 b=lIhSpeijK9agANF+y803HeBcbIiAxijHKtU1tvW8GrtEUL1OdMTVXh5ANEZncqkLWg
 kQVFlb/gs3KiIfYM75DUbkPLnLez/UXpgPTu2xttY60q+Hmb5o+Nb5vtaRgjH1LV6MvY
 7UVk/SemqP/vPRbJYhGuuuQlCnyaqjokP16Ax6jTlJsP19Q3jSvlrksZNdE+brrO84dj
 zW6qXc7/QTsltAOPYGnHm+Hsrf0HIb07lebpfVPCgZcyAB+NcaYrcbC8D2u+y79PL+oN
 jL+Xa1FXK8cR4qKB/ehaV7zaJ2tZR9qRpfnznz1KEHTVDI02sWxGJNIovBOmFDDOb4I7
 BrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985043; x=1684577043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OW9u69NgfoghJtPekxWhv6ZSbpygwiz3BCEEMJsPeyo=;
 b=XN+nAWlcdnTNFsmols7CNq6trKTbqNDjQoeFFoq9TzqTtzOmIqLsBO27hFoL7ET+at
 m2xfXjo3aVOYDZwg719IB6gQU8IX6amxrrk6oeoCHQniZ41BPC8Z5CxOzwVlroeg9XCx
 4WkWopw2iW1Ef/lVQFw0kraI7nldrCn/A1Yg3jEqHw0JczlNDukssbeslWgU659WkPXT
 Gfe1+sHoAiXHKAMfqKT9lAXtBmGITTYMnyQa1NnVbz/q16J/oXAEJueAuN+GhhOYG3jE
 2aOHGHnR3aWq+kFDC7Isn0wrozeDSE4swCzPDSy0RHaB75Hta9Vy4gKBGi5GRlxCdJaD
 NChw==
X-Gm-Message-State: AAQBX9fjKyZ1TCc0ASPPBTGW8P87SDc8b0QF+5foM+6tSglpSNwu+LS4
 /FvKBqGj9luwBVhxjc3YDeTNBQ==
X-Google-Smtp-Source: AKy350Y0vzAbTTYdV3+M/1g7YAup2xR9RQTrz/3kqlaOCplr/2KZOndLM5NRiENhu8RQVOmgMUfMTA==
X-Received: by 2002:a05:600c:21a:b0:3ee:1acd:b039 with SMTP id
 26-20020a05600c021a00b003ee1acdb039mr843685wmi.34.1681985042895; 
 Thu, 20 Apr 2023 03:04:02 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 jb12-20020a05600c54ec00b003f17003e26esm4904795wmb.15.2023.04.20.03.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 03:04:02 -0700 (PDT)
Message-ID: <a315b56d-a331-5e85-ff55-4dca96088bb9@linaro.org>
Date: Thu, 20 Apr 2023 12:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v1 09/10] target/loongarch: Add kvm-stub.c
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, maobibo@loongson.cn
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-10-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420093606.3366969-10-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 11:36, Tianrui Zhao wrote:
> Add kvm-stub.c for loongarch, there are two stub functions:
> kvm_loongarch_reset_vcpu and kvm_loongarch_set_interrupt.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   target/loongarch/kvm-stub.c      | 17 +++++++++++++++++
>   target/loongarch/kvm_loongarch.h |  1 +
>   2 files changed, 18 insertions(+)
>   create mode 100644 target/loongarch/kvm-stub.c
> 
> diff --git a/target/loongarch/kvm-stub.c b/target/loongarch/kvm-stub.c
> new file mode 100644
> index 0000000000..e28827ee07
> --- /dev/null
> +++ b/target/loongarch/kvm-stub.c
> @@ -0,0 +1,17 @@
> +/*
> + * QEMU KVM LoongArch specific function stubs
> + *
> + * Copyright (c) 2023 Loongson Technology Corporation Limited
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +
> +void kvm_loongarch_reset_vcpu(LoongArchCPU *cpu)

Where is kvm_loongarch_reset_vcpu() called?

> +{
> +    abort();
> +}
> +
> +void kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level)
> +{
> +    abort();

Please use g_assert_not_reached() which display more useful informations.

> +}

Add this stub in the previous patch "Implement set vcpu intr for kvm".

> diff --git a/target/loongarch/kvm_loongarch.h b/target/loongarch/kvm_loongarch.h
> index cdef980eec..c03f4bef0f 100644
> --- a/target/loongarch/kvm_loongarch.h
> +++ b/target/loongarch/kvm_loongarch.h
> @@ -8,6 +8,7 @@
>   #ifndef QEMU_KVM_LOONGARCH_H
>   #define QEMU_KVM_LOONGARCH_H
>   
> +void kvm_loongarch_reset_vcpu(LoongArchCPU *cpu);
>   int  kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level);
>   
>   #endif


