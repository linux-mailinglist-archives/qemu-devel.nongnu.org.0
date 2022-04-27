Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5665510F20
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:03:00 +0200 (CEST)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXxD-000250-Mt
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXvH-0000ZV-Qi
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:01:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXvF-000273-AK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:00:58 -0400
Received: by mail-pl1-x633.google.com with SMTP id d15so428839pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=TCb0iDdoqmaarr4U8Hd95v7ylQznVYu4ERAUiMzD+AU=;
 b=ho35QuLtjFFdGh26+hju0wC1FvYVZlK3MalnBHqCvej6yGCppSkWKKjp6Utpms9WnN
 tOu8wr68h9EbalnkQogMWXLlMNebQYW8eD3CbQVJ4tVUMe8mj/bv9xEhUbXn0eSsdgYE
 m6MbjmZJeJxoJgWKOnsJjoY0rIPyKQmdI8eQy3A2DAH3a5mhFwCFzX3EqEQXRMY2J64P
 kOq5xRNkmpPfBszq+GqRy2HwWmUl/OVinUpp9EmA96pyMDZtN1Ix5IYvNRHJuvLcag7n
 0Hx2PJAGDJLBb/XUmZmFs16jNKH0SmqJgaGoJba3fTRixKJFblmHxyJN+j8RXCUZW8PS
 kuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=TCb0iDdoqmaarr4U8Hd95v7ylQznVYu4ERAUiMzD+AU=;
 b=wqXJ2w3JUohCE8PCea5xjmXu2BB2C5GBEm0xCFcYMfIMK/UAyloJMdaiu/90aJ/4QZ
 6+7wDpVArOalkuw2kR6N2voboAJ3eQLERNDQHjet0xeIAnjk0FCmq2PYxD/8Sb2YkwHa
 AJ331jyg2xoYGHFcdc1ujcvLrZJ8s1DVbczBw3XtC8LkQ7GR7sxtakun8+6FAnzh/sne
 g4bfZU9KHiVNcf00Gtt/YLudDJTHVTv4qBS3zek4WeMOk6D2/BsshuNAy8QftyDB8y9B
 spvrk1JLNvQjQ7V0HGUfYYaJi4ygrZwXa4V6kTQTagTaHnHbtaJRS4uFKddie9hStDT/
 4KIg==
X-Gm-Message-State: AOAM5329HsJZyEKO1ofbfoOz0zO3BttrLBhcPXJoyIBx/PrOOcr4qUND
 S/WKdcXSiJzKuT9xq7nKgf7qD/eb1SjK7Q==
X-Google-Smtp-Source: ABdhPJzkw84BKQvcDs3Gm/M9YXbWk4ePfoMUw3vJc7yUChA8nSg8gVASecB+NmHntOA0moiCAlf6AQ==
X-Received: by 2002:a17:902:9a49:b0:15d:1da8:81fa with SMTP id
 x9-20020a1709029a4900b0015d1da881famr11833440plv.114.1651028454989; 
 Tue, 26 Apr 2022 20:00:54 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o41-20020a17090a0a2c00b001d75aabe050sm427209pjo.34.2022.04.26.20.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 20:00:54 -0700 (PDT)
Message-ID: <2589d9b6-e514-da96-f5cd-93ffb3d92e9e@linaro.org>
Date: Tue, 26 Apr 2022 20:00:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/i386: Suppress coverity warning on fsave/frstor
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401184635.327423-1-richard.henderson@linaro.org>
In-Reply-To: <20220401184635.327423-1-richard.henderson@linaro.org>
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
Cc: eduardo@habkost.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 11:46, Richard Henderson wrote:
> Coverity warns that 14 << data32 may overflow with respect
> to the target_ulong to which it is subsequently added.
> We know this wasn't true because data32 is in [1,2],
> but the suggested fix is perfectly fine.
> 
> Fixes: Coverity CID 1487135, 1487256
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/fpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index ebf5e73df9..30bc44fcf8 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -2466,7 +2466,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
>   
>       do_fstenv(env, ptr, data32, retaddr);
>   
> -    ptr += (14 << data32);
> +    ptr += (target_ulong)14 << data32;
>       for (i = 0; i < 8; i++) {
>           tmp = ST(i);
>           do_fstt(env, tmp, ptr, retaddr);
> @@ -2488,7 +2488,7 @@ static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
>       int i;
>   
>       do_fldenv(env, ptr, data32, retaddr);
> -    ptr += (14 << data32);
> +    ptr += (target_ulong)14 << data32;
>   
>       for (i = 0; i < 8; i++) {
>           tmp = do_fldt(env, ptr, retaddr);

Queuing to tcg-next.


r~

