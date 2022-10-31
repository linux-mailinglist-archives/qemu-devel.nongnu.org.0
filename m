Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2229613F69
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 22:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbvO-0004NU-Pp; Mon, 31 Oct 2022 17:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opbvM-0004El-W8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:02:25 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opbvL-0001w8-A1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:02:24 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b29so11702502pfp.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JAEA3DMY1WNend79jgr0S8JEJHrrrpB+mV4oiWm8bas=;
 b=jo3OPRk90wV/h0ur4KZxfI5fvkX9IAp//r76saY2oXm9tfYSypLNqT3rxOXQa8GKSU
 TMN9fdJJS8UN0M+BfxFNcTAwb0kJf/++jYrdhE4tsFReOB0oIbLdfqd1ZsIH8zTSG/69
 UlA2vb7w0sRr33Bc6a+5PTQpn8m7/UjJ1SZ5ZEvRPVkAqpEQBK7R3E30Bt1zY4ewcRlS
 /j3MVz99vyW1h1wURGtSV35zb/T0ddpK7MmB7ZQtTKvhQL1v1wYFQR702r/Zu3jqCcZP
 UtjrnsPfE+ZvqbhbhoNIbA8cXKNy5rpiWz8jts+o79rRkbDRnRLvqsiJMxzosWxRWfNY
 K4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JAEA3DMY1WNend79jgr0S8JEJHrrrpB+mV4oiWm8bas=;
 b=C9mDu+zzQWEVe2BsAjkfAxW/J9qymfWFS3V9OKwQcpq5gimKCWawKx4HC6fcR+07rm
 FZhf976n1cKapQMDJnEHplhe0ZsdfKCetkuaDfR3LC/AZYYkZKfv9rt0tRC+EfP74rPO
 IIll2pqQu87dVJE1cd42vcws3yhZwRPTxTdHu+s8oNz1hxuWVeYVFkkJlSmK/DJoIjPR
 GhvtQgiVdYgekWRP7oSZqughAYAGWILM8iPGDhYSNvHswZ7NHVrszPInSUb02840eXyo
 HCeoYC64qu6LnP5YverWy574Fx9Q5C2QAtJ7sgOwimug9b9hhN2aRAxqgvXtq96uDP+T
 /3QQ==
X-Gm-Message-State: ACrzQf3fknIJOa2D54tvw1WZKoeQLKQxUz1kTHI2mSVUhAq+p5ib+pdq
 QJARq+R+8nf75C2Zq9dHsfqQaHrq0dBmlA==
X-Google-Smtp-Source: AMsMyM6wQg/ECnbtaEi5l212SpdGZh9tWDvfOpWu03xYosu6LJye9j6W7xVpzf4H2wab3t38epaaTA==
X-Received: by 2002:a63:87c7:0:b0:46b:3cf1:e163 with SMTP id
 i190-20020a6387c7000000b0046b3cf1e163mr14620114pge.112.1667250141848; 
 Mon, 31 Oct 2022 14:02:21 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.27.250])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a63cc51000000b00461b85e5ad6sm4523326pgi.19.2022.10.31.14.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 14:02:21 -0700 (PDT)
Message-ID: <ea1da935-9e31-f1fd-2871-476fd26e63ae@linaro.org>
Date: Tue, 1 Nov 2022 08:00:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
References: <20221031054105.3552-1-richard.henderson@linaro.org>
 <20221031110736.pcao7aqhdoyxpqww@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221031110736.pcao7aqhdoyxpqww@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 10/31/22 22:07, Ilya Leoshkevich wrote:
>> @@ -1580,15 +1580,13 @@ void tcg_flush_jmp_cache(CPUState *cpu)
>>   {
>>       CPUJumpCache *jc = cpu->tb_jmp_cache;
>>   
>> -    if (likely(jc)) {
>> -        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
>> -            qatomic_set(&jc->array[i].tb, NULL);
>> -        }
>> -    } else {
>> -        /* This should happen once during realize, and thus never race. */
>> -        jc = g_new0(CPUJumpCache, 1);
>> -        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
>> -        assert(jc == NULL);
>> +    /* During early initialization, the cache may not yet be allocated. */
>> +    if (unlikely(jc == NULL)) {
>> +        return;
>> +    }
> 
> We can hit this condition in qemu-system with the following call
> chain:
> 
>      tcg_flush_jmp_cache
>      tlb_flush_by_mmuidx_async_work
>      listener_add_address_space
>      memory_listener_register
>      cpu_address_space_init
>      tcg_cpu_realizefn
>      cpu_exec_realizefn
>      x86_cpu_realizefn
> 
> I'm wondering if we can avoid having to think of early initialization
> when dealing with tb_jmp_cache by initializing it as early as possible?
> I don't think swapping accel_cpu_realizefn() and tcg_exec_realizefn()
> is going to work (though I haven't tried it), but what about splitting
> tcg_exec_realizefn() in two and calling the half that initializes
> tb_jmp_cache before accel_cpu_realizefn()?

I thought about that, but couldn't bring myself to split out a third tcg piece of init.


r~


