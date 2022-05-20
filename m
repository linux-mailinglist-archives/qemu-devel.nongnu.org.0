Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7983652F3A1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 21:04:46 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns7vZ-0005pO-3i
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 15:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns7uN-0004V6-98
 for qemu-devel@nongnu.org; Fri, 20 May 2022 15:03:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns7uL-0005CI-7f
 for qemu-devel@nongnu.org; Fri, 20 May 2022 15:03:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 10so4654046plj.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zbSA9DCixYY2tXodW61vXYygCHeHgj9WB6Pfj2UobLc=;
 b=d9ioBAoax+91YU3t1+duuAfxhclupdK/JPaJ/VmpLTsr7ykMuEjuVAhS5KQ/schJeG
 q2TZq1qtirmbN+t6HHh8dSe6v/7a3F3jzLaTAnjinRNVq28S8066j6xklL06A+k51ILM
 JAFfqAqnDQ/kuMq0RKhjOBmH8ogMo4WauW877GerA1r+vLY/UYCtfMCCjZ+dUaDWzkMg
 JNTECXwBA+ZfERdZSvniCu/jlAhO21sVQC7shqvzQ5nweAZ31Znzpds1LkVBRPh6U7rD
 sLSTAWjrBEFL/CNfTFNxZikOoyfCq/5Em9xgQB0+lvMwQTzl9lFT06D/FX7Ao2BbgReQ
 l9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zbSA9DCixYY2tXodW61vXYygCHeHgj9WB6Pfj2UobLc=;
 b=3Ms+zv3AQzgHa/PeljSr6EBsAAtXr97RVjmR2j29QhoQikwx0yzhRF6ZhKY22Vk64w
 KnTFPESAi5MN27ZCiVCTJX5HO2HM5pSr8YMs9GvG1biiE2JyHnd3OtYjYC93kP096ET7
 dfhL4etAtKB+M43dxH+LuugeVvEX01oDplCM1axgTO0qvYU4YXm7zSYoV54oG37Uiy5w
 3KJZFGihJ9/j3lt65P36/6mCtv8+2WYl7B6KIXLJsf8YxfH2xLmrpkFf7GgbNX5sFtVP
 KNxKD4TCNsYxd0tPai4te/rQ5KPvwvhGyFcsv6BnHMEkHkJhOd1n/ZyVX4mvkgc/qQvH
 02Wg==
X-Gm-Message-State: AOAM530ezrwlVeWrCizi0YeCkqZXTVTO4nP6c8nRi4w9o2x/JbMW0E8/
 wPnAXTPfv5VrwqB/t+R/dTsC9Q==
X-Google-Smtp-Source: ABdhPJyfxVh2e9u5UJfFqvQlt/zN+OquJ2SDeIzh9ozCO+sqI3xBXMmFZJSwHjIRffybTTiS2DBfeg==
X-Received: by 2002:a17:90b:1201:b0:1df:ab42:c885 with SMTP id
 gl1-20020a17090b120100b001dfab42c885mr12531705pjb.223.1653073407591; 
 Fri, 20 May 2022 12:03:27 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170902edc700b0016168e90f37sm92994plk.152.2022.05.20.12.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 12:03:27 -0700 (PDT)
Message-ID: <2c4bb164-aebc-b4ed-0d8a-b4026bd6a6e3@linaro.org>
Date: Fri, 20 May 2022 12:03:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 5/8] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220520135129.63664-1-lucas.araujo@eldorado.org.br>
 <20220520135129.63664-6-lucas.araujo@eldorado.org.br>
 <299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org>
 <d791d9b8-6a77-c2ec-67af-d9e208fa2e22@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d791d9b8-6a77-c2ec-67af-d9e208fa2e22@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 5/20/22 09:42, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 20/05/2022 12:47, Richard Henderson wrote:
>>
>> On 5/20/22 06:51, Lucas Mateus Castro(alqotel) wrote:
>>> +                if (acc) {
>>> +                    aux_acc = at[i].VsrSF(j);
>>> +                    if (!neg_mul && !neg_acc) {
>>> +                        r = float32_add(r, aux_acc, excp_ptr);
>>> +                    } else if (!neg_mul) {
>>> +                        r = float32_add(r, bfp32_neg(aux_acc), excp_ptr);
>>> +                    } else if (!neg_acc) {
>>> +                        r = float32_add(bfp32_neg(r), aux_acc, excp_ptr);
>>> +                    } else {
>>> +                        r = float32_add(bfp32_neg(r), bfp32_neg(aux_acc), excp_ptr);
>>> +                    }
>>
>> There's no point in the 3 if's when using bfp32_neg.
>> Just use
>>
>>   if (neg_mul) {
>>   }
>>   if (neg_acc) {
>>   }
>>   float32_add(...);
> 
> You mean negate separately? Like:
> 
>      if (neg_mul) {
>          r = bfp32_neg(r);
>      }
>      if (neg_acc) {
>          aux_acc = bfp32_neg(aux_acc);
>      }
>      r = float32_add(r, aux_acc, excp_ptr);
> 
> If so I'll send a new version with this change later today

Yes.


r~

