Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2A956606C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 03:03:33 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8WyS-0005Ow-8x
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 21:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WwZ-0004Ts-3e
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:01:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WwW-00080k-RP
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:01:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so4898106pjn.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R7RBnlbUt5BFwqxWwuuiKxs9cnYoeQUZlz9hjSTyulA=;
 b=FuLCZyHXNzbG9IAJZ4z58zmETr8tQMCAELFckSMxaMxOlVvdYw/zIb7c8DnY2B5chn
 wgSB5Sm67RzWVZKA9NJ/LmQJv2vOu14E+v5/Bp3BwhPHIJDvEbCxdEdzH3laQbndFdpk
 otKZN5fn1ES5VfW3bXQ1cd+Mp35dBUw7t72G4e6qSpffu+1kSKg4JuqKoPyNAO/vmspt
 0bljE1k6vm3jMkv0qwYfomyNRxcPv8+CRjRDof8MrXE+gjMb2kYoCn6Z30g2Dds+F7Zf
 t3s/PX4Gc0pIGa1/XMHZtaAYWKEIKKmS9ESstcSXOMPZaODb5zpAY0wJ0SvZrNT6PTD9
 HlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R7RBnlbUt5BFwqxWwuuiKxs9cnYoeQUZlz9hjSTyulA=;
 b=eu/OswDV+X5brwiod1lUNaNbVdJzuZgo+6klGN6V/zmcM66JF1tSahjvSfPeenO/Fm
 dOV2u81Ol/I+i/iAVTw6HYni/KVUotblYqmt1diTK607LUilRwpeejYmq1AD1f68Q6eu
 o0di3X8RWX6cOtJ4AL/KXUoQwJpE7grCwykNfzMN6tAITgWlQHPO0Q2LzlrTMzP4JyXT
 sbzXHljql+JFImXmeSQ4BSbO/tBEdQKqzpKHF+ihib5+JKRbhdSJUFr+uEICAJ+9ZcZk
 dnWu9M6Kk7PUDAktTlp+npYkMI2gtzOHOPByw2JF1vYGZCX8jivK6HXLPgh0wyKgxCMH
 LZXA==
X-Gm-Message-State: AJIora856NCFUN3BTPvTCAEse1nnrpoRK5Scfhwga+boZOatCf5HojEY
 r/WQcFne69r+tryakeXNYllcoQ==
X-Google-Smtp-Source: AGRyM1u60/GjAk0X6cG9jgs0wvWkUADu8IrJKhUcS9pzoYATnF9Aov8AfzJelFrltAPlHzm1i+U5hg==
X-Received: by 2002:a17:903:245:b0:16b:9c49:6b1c with SMTP id
 j5-20020a170903024500b0016b9c496b1cmr32837674plh.153.1656982890955; 
 Mon, 04 Jul 2022 18:01:30 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s91-20020a17090a69e400b001ef831a2015sm4003626pjj.22.2022.07.04.18.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 18:01:30 -0700 (PDT)
Message-ID: <6006e1bd-722f-a0dc-0207-5bb36b29cda6@linaro.org>
Date: Tue, 5 Jul 2022 06:31:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/62] target/arm: Enable PageEntryExtra
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-3-richard.henderson@linaro.org>
 <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/4/22 20:52, Peter Maydell wrote:
> On Sun, 3 Jul 2022 at 09:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Copy attrs, sharability, and the NS bit into the TLB.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-param.h  |  8 ++++++++
>>   target/arm/internals.h  |  5 +++++
>>   target/arm/tlb_helper.c | 14 ++++++++++++--
>>   3 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
>> index 68ffb12427..a14f167d11 100644
>> --- a/target/arm/cpu-param.h
>> +++ b/target/arm/cpu-param.h
>> @@ -30,6 +30,14 @@
>>    */
>>   # define TARGET_PAGE_BITS_VARY
>>   # define TARGET_PAGE_BITS_MIN  10
>> +/*
>> + * Extra information stored in softmmu page tables.
>> + */
>> +# define TARGET_PAGE_ENTRY_EXTRA
>> +struct PageEntryExtra {
>> +    /* See PAGEENTRYEXTRA fields in cpu.h */
>> +    uint64_t x;
>> +};
>>   #endif
>>
>>   #define NB_MMU_MODES 15
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index c66f74a0db..2b38a83574 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
>>   FIELD(V7M_EXCRET, S, 6, 1)
>>   FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
>>
>> +/* Bit definitions for PageEntryExtra */
>> +FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
>> +FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
>> +FIELD(PAGEENTRYEXTRA, PA, 12, 52)
> 
> So why do we want these things in particular? It would be
> helpful to describe the intended uses in the commit message
> to save the reader having to read the next 60 patches to
> find out :-)

Heh, yes.  Basically, it's what S1_ptw_translate requires (pa, attrs), so that we can 
report a stage1 ptw failure, and what do_ats_write requires (pa, sh, attrs) for filling in 
PAR_EL1.  Although within these 62 patches I didn't came back to finish converting 
do_ats_write to use probe_access_flags_extra instead of using get_phys_addr directly, it 
was a goal.

> Is wanting to cache the physaddr an Arm-specific thing, or is it
> something we should consider having in the core softmmu code?

I'm not sure what other targets require for their 2-stage page table walks.  I guess I 
should have a look (riscv, i386, ?).

It *is* possible to recover the phys addr from the iommutlb, because I was doing that in 
mte_helper.c (see code removed in patch 5), but it's certainly not simple.

>>       if (likely(!ret)) {
>> +        PageEntryExtra extra = {};
>> +
>>           /*
>>            * Map a single [sub]page. Regions smaller than our declared
>>            * target page size are handled specially, so for those we
>> -         * pass in the exact addresses.
>> +         * pass in the exact addresses.  This only happens for M-profile,
>> +         * which does not use or require PageEntryExtra.
>>            */
> 
> Do we have to exclude M-profile here because the PageEntryExtra
> data is strictly-per-page, or because the way we've formatted
> our extra uint64_t requires the physaddr to be page-aligned, or both?

Because our extra uint64_t requires page alignment, and reuses those bits.


r~

