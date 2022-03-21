Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A234E3928
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 07:49:26 +0100 (CET)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWYKZ-0006Xq-Sq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 02:49:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWY9n-0003rk-Gc
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 02:38:15 -0400
Received: from [2a00:1450:4864:20::629] (port=36474
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWY9l-0005gH-6b
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 02:38:14 -0400
Received: by mail-ej1-x629.google.com with SMTP id bi12so34178630ejb.3
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 23:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4KulkMBg+JcJCfb+CAVtelt7vlmrxteIhxWycETj1vI=;
 b=nHvveMhxJEwe7bNZYZwCPYZ3k725g/lfftwAQ2HWINKkivMiuqLkZrjQMGEna7lwVb
 83LIexXlzVdMFK1KwP0zXN8UhhBTVu3S2SuDRKtgcsOCZ1l/hnkj7mzzUJbobVBIvx8Z
 vrGM6lqEgI2ZlGAae4h6UAU9wFcZPs3IWPlSORHfO0sSNJdXVmu5QAxKGaTT0scClmEG
 J72cCEvLG9XpEyIO7fAlC3JAeDQ2EttIrb+zqJGjjmD2wf98n7T+NDsbH5Sf6b7YCw9S
 85HF0wM+nf+Lftcot3MICOj3UoFrK/lyWsfnaB9IcrDjJPL5nKzmQlrNp2VmLMkKi6MW
 ZX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4KulkMBg+JcJCfb+CAVtelt7vlmrxteIhxWycETj1vI=;
 b=TjqxGgQwm653Z03U6VBupcwHpC1XKBcmjAbRlpxB6Bm7iLqyFBUkSC566cR/T6ofIY
 kAW+qsNcPnQpoErZ42QjEjgFfMS1Xku53i83O5UMpafNU8PxwVJOqYCr8RH8S7xr9m0q
 eMkF2ck/1JYeMdnIEApCSRIx+/qWLZ3xvJtusbx9KNvRsSUdF+9RgM8IokhdlvIa0IWx
 ZHw90Y0FOoVE5sdIgRN0YxU8vC/2B57BStA/8gKkMQ48KrAnswRj9ZC5ytKJoH05LTUh
 xZ4/vkqTMqi6hgbITAXCnUuCUb2JWqq2eHwtIXJqpEUnIPGb1+mag7loww8l90icStiy
 GHGA==
X-Gm-Message-State: AOAM533vsoNu1UqHlnbdx51+NwTOwr+FcoTsPqXcKAY4iRhnQbLjP5G+
 lnPNlj1xPFvzPZf6RKjN4ns=
X-Google-Smtp-Source: ABdhPJwhH+KkajYObP3jcuBNMpW5T6L60xUI1+IXsFRyBBDYSmO/PMhiVTzyt8Md4bsKsSGpWAAaAQ==
X-Received: by 2002:a17:906:b757:b0:6d6:e990:b0de with SMTP id
 fx23-20020a170906b75700b006d6e990b0demr24078221ejb.603.1647931089539; 
 Mon, 21 Mar 2022 23:38:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm1575106ejc.110.2022.03.21.23.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 23:38:08 -0700 (PDT)
Message-ID: <e6e1fdb6-640c-645a-0f8f-3a81bfe60de0@redhat.com>
Date: Mon, 21 Mar 2022 15:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH-for-7.0] hw/i386/amd_iommu: Fix maybe-uninitialized
 error with GCC 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220318004153.4510-1-philippe.mathieu.daude@gmail.com>
 <2a8a7a37-57c1-9f6d-3a2d-359b8060abfb@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2a8a7a37-57c1-9f6d-3a2d-359b8060abfb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/22 15:03, Philippe Mathieu-Daudé wrote:
> +qemu-trivial@

Laurent,

please do not merge this patch as I've sent a replacement and I'll take 
care of merging it.

Paolo

> On 18/3/22 01:41, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Initialize 'oldlevel' early to avoid on Debian/sid:
>>
>>    FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
>>    In function 'pte_get_page_mask',
>>        inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
>>        inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
>>        inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
>>    hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used 
>> uninitialized [-Werror=maybe-uninitialized]
>>      877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
>>          |                      ~~~~~~~~~~~~~~~~^~~~
>>    hw/i386/amd_iommu.c: In function 'amdvi_translate':
>>    hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
>>      906 |     unsigned level, present, pte_perms, oldlevel;
>>          |                                         ^~~~~~~~
>>    cc1: all warnings being treated as errors
>>
>> Having:
>>
>>    $ gcc --version
>>    gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/i386/amd_iommu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
>> index 4d13d8e697..b6d299f964 100644
>> --- a/hw/i386/amd_iommu.c
>> +++ b/hw/i386/amd_iommu.c
>> @@ -904,6 +904,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, 
>> uint64_t *dte,
>>       /* make sure the DTE has TV = 1 */
>>       if (pte & AMDVI_DEV_TRANSLATION_VALID) {
>>           level = get_pte_translation_mode(pte);
>> +        oldlevel = level;
>>           if (level >= 7) {
>>               trace_amdvi_mode_invalid(level, addr);
>>               return;
> 
> 


