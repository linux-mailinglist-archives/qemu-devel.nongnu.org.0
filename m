Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF916437CE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2JiL-0006IR-R6; Mon, 05 Dec 2022 17:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JiJ-0006Hz-UI
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:13:27 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JiI-0002N3-86
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:13:27 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so20969656wrb.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KmAbRentipS0F8Itl52QpqbLq8qD6RgEQJADToUz7w4=;
 b=xaOru1fCcYLzYiuU2Aue1ICOeiihip9sorJsJIbZHnXujK50Yep/1bumpUY3tDx/n1
 6zqkuMHkgkSHBJk5KcA0T/gQQ9rfM1gmYA2bJGGaN3IMXDvQbYfL/eori3O9xLlLxOwd
 Y2jl1ubbqpEV+F37HQB1hwXpe6yaX1fjgn0n5FW2ynLkIOoJwnjAipKksJhF4o1ekygN
 LUFi4UmUGp/590LbQvEQ5UlVGI96gZbNJWdDXSmC5W0P0uMx9BSch/KgLzfuRQQOT/vi
 kLdCf2TJ8/jGVad8fIc/H6MiX54RBJWWC21jWzeRVZ2/wnQ5MlRtBcNBwGD7Vtd7L/2S
 gsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmAbRentipS0F8Itl52QpqbLq8qD6RgEQJADToUz7w4=;
 b=7VFqsFrUwta7sayydOcj7GfBx9MevkaUu1DmMQzLqmXZxBfLp75OCiLvq/r5wYA6w7
 66sMxuhV2XfghCZJ81Uui5GFpG+1M3yNENaNhnkjxwWh+22nF7O2+m2koB0iguob8TVX
 gEK2NIAk3Sqk9rG18+p8azuZ1JAj+3JR+DBXTy9zQXHxkohbwrLmC/CB/9uljSKwkEm9
 H7/bQzkJ7JIVeUaR1qPPz0yHoG+Afta3QIzXhIb1GlqSc1BqcBWPchIKZw+vlIUOxjox
 Bj1VeDjlH9JWfBjL4kMDyjyspLL2tcLpDbocRUQ8/t1w4j5UAD2371MoXbDN96HQy9Rv
 jv4Q==
X-Gm-Message-State: ANoB5pnspBRRS7CerkDaSpUhF343gIQPC11h0s/bA+cZcAXVRnMo4EZ5
 GYoLfRA73BpuqtKGDHfeGfQZ1w==
X-Google-Smtp-Source: AA0mqf5RBqrCGdf5roiX+waranMkuCGVeqckxD1UqZBgpS1/CXE5FeJ6rQtDXhO9a6XzvmWlm2C+rg==
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id
 u1-20020adfdb81000000b002365144f8cemr45461977wri.657.1670278404468; 
 Mon, 05 Dec 2022 14:13:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az23-20020adfe197000000b002425504ae7dsm7031051wrb.80.2022.12.05.14.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:13:24 -0800 (PST)
Message-ID: <4d6b112e-ab74-5ae3-7206-9b1aafb25034@linaro.org>
Date: Mon, 5 Dec 2022 23:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 13/21] i386/xen: implement HYPERVISOR_hvm_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-14-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is when guest queries for support for HVMOP_pagetable_dying.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index 5d2d8a7e00..38d4cae3d0 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -17,6 +17,7 @@
>   
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/memory.h"
> +#include "standard-headers/xen/hvm/hvm_op.h"
>   
>   #define PAGE_OFFSET    0xffffffff80000000UL
>   #define PAGE_SHIFT     12
> @@ -181,6 +182,20 @@ static int kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
>       return err ? HCALL_ERR : 0;
>   }
>   
> +static int kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
> +                                int cmd, uint64_t arg)
> +{
> +    switch (cmd) {
> +    case HVMOP_pagetable_dying: {
> +            exit->u.hcall.result = -ENOSYS;
> +            return 0;
> +        }
> +    }

Could it be helpful to have a trace event here, or log a GUEST_ERROR?

> +    exit->u.hcall.result = -ENOSYS;
> +    return HCALL_ERR;
> +}

