Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88625344B9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:15:52 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxQ6-00051d-55
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxNn-0003vY-3Z
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:13:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxNl-0001pW-Ej
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:13:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id f18so1600985plg.0
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xZIyjY+J0aJt38WIwn6it0AzpLE6Sb28jDJ4bg9H944=;
 b=cHI5SiYRLBORfbLiRutoM0UZsCbUcCIjWnE6DGVRxMY8cQrmDXBn1H36UdgJGCOoyC
 ShBUGDJOE16tXhSj2EK9u8C/0T/Cp/a8OOsI59MOin+CIqqSax9ung0NjoIqhAeNYKlE
 5tSqVTQmYa6MJwSU/GVSaGIW2uHkoWjEdELYcJJTYb9Ul/dyHPsl/z0ggQNs1/UsHLmV
 qD2Mks818wkrzUGZHCWl9381ZWnVCYUfudws86Z3PLJ0VLP7rINPrRJjYVYMbr1rN8x8
 dXrpW5UuYO1sjc/6FsQbAlAUMUoNsf+0YwFmSDwFQZZtld3AumqZkkvhChDFoIpuETsC
 CMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xZIyjY+J0aJt38WIwn6it0AzpLE6Sb28jDJ4bg9H944=;
 b=eMnpdhhv081voBxQlbp2+xceqbhXAc4ErNxZnwkFyXIy7MiY1iLNHPsDZPehWVEjSi
 NHPdlgsbEt0AEK1hcJZKr1W6t4gpn5U5MSzAMt6GK9ugrGpLNKtsPFwC6MfYdmliy8yv
 z+zxpm+ZWlKXG35CDdFEc/xtls6+2ySaO+qrF70BClOJVyWrOO7ooZ21igDSF9QSrm2h
 IbMME6KQC4BasLM9G2opCzqVxER9MvKxf8AbEsGkL8YzGHMg23iDNFcr0t7JrqPvid+w
 ozonpzFpxQB9jvjox7iwmIC36zB2IzOmp/2Bjt1RAb81z1M5g8pHM/thTqsxGK0JrHHM
 fzyQ==
X-Gm-Message-State: AOAM530xECerpJJW2i86GuVNqlmRcG2WnNaYNpsiv4HUTH2aj0aKjHcB
 kBLdHu9xokWaQv+9CYGe7cnMbw==
X-Google-Smtp-Source: ABdhPJyMFZBkhNZnROSglP4XmjXvq5kUs0OWvD9Bxd/b3RyqPNbdsJF0c0NX6w/ImDfFeCEukL1o3g==
X-Received: by 2002:a17:902:704a:b0:161:996e:bf4 with SMTP id
 h10-20020a170902704a00b00161996e0bf4mr34055030plt.118.1653509603925; 
 Wed, 25 May 2022 13:13:23 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a639345000000b003f66a518e48sm8846166pgm.86.2022.05.25.13.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 13:13:23 -0700 (PDT)
Message-ID: <8c3318e1-9e32-cfe1-1871-b54c95e16a47@linaro.org>
Date: Wed, 25 May 2022 13:13:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 17/17] target/m68k: Mark helper_raise_exception as
 noreturn
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-18-richard.henderson@linaro.org>
 <a6593cbe-b1ba-5836-ad90-7fe147f64f85@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a6593cbe-b1ba-5836-ad90-7fe147f64f85@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 12:45, Laurent Vivier wrote:
>> +DEF_HELPER_2(raise_exception, noreturn, env, i32)
...
>> -static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
>> +G_NORETURN static void
>> +raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
>>   {
>>       CPUState *cs = env_cpu(env);
>> @@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t 
>> raddr)
>>       cpu_loop_exit_restore(cs, raddr);
>>   }
>> -static void raise_exception(CPUM68KState *env, int tt)
>> +G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
>>   {
>>       raise_exception_ra(env, tt, 0);
>>   }
> 
> And why not
> 
>    G_NORETURN void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
> 
> ?

Because the declaration in the header file takes care of that.
No need to replicate it in the definition.


r~


