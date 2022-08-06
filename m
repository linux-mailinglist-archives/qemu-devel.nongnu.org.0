Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFCB58B511
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 12:42:29 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKHGF-0002xP-PD
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 06:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oKHDp-0001S8-To; Sat, 06 Aug 2022 06:39:57 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:36800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oKHDo-0008Rp-Es; Sat, 06 Aug 2022 06:39:57 -0400
Received: by mail-vs1-xe33.google.com with SMTP id o123so4694005vsc.3;
 Sat, 06 Aug 2022 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ER67utIjfHnc4cpyIKRDqEhJgyH5t2HVs39Z+CNS4Qg=;
 b=db+DKdvImVyG+CZR0DIlzj9LDSKRjC96aTrgny0lmfXNAUWrSI/dmqbbY7uuFvjO1O
 rjTpe5RrFhj4x/6jQMOHNgLahwSMS2Xy1XaAQJj6c11J7ybGTVurwEylQOhZMw32GWgi
 vq7OGmgHd8lgZ8e+bng3J28VnDDh+k93XHmK1AdDc6uDZNOrP9ekBYR2YUgYMoXnSmWG
 PhsS56+uiR+ek3IvvKU7dA/nonwbUjdIkcjvEc35lLekbTvqy5FnWyjjICcqOXGWsB6t
 0hCnEv7DdpQ9Sd9zUMeTt5C0zQUuhMXQoLRj6Exx2nJzL9pt6FCUG6LChH1iCBlwxrSK
 2Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ER67utIjfHnc4cpyIKRDqEhJgyH5t2HVs39Z+CNS4Qg=;
 b=o3/mfZmgMsnCKJQXetBd/q5yvheBuEWLee4lCiLa5Ou67LoXLFgBMb7/iK9X7RwnYX
 ATWJx0jBEiLkhnRwwWhZBy5GvBAVAkR4Uni/nWAQ5XwiSuRPolJmNNSofZKVsaSn45Pc
 AZzosDlLhVGxOUOLJpuBWXBg9iCr2LvHaaxN4YPakvebPw80bahGRuQ5r0AL2OYQMGuA
 ZHgpSy+dN9liLSHflXoD6c+Fn4iJ3rHRcAsSGZwTv5dPa/aug3ogKVSDkPR3xO450B7n
 4wvT52qJEovXwRZKemUpkzgKDrY3k/43TK4N6Oi1jqduNE11MfdLXcKnmG68Gbvvz0zr
 TsJw==
X-Gm-Message-State: ACgBeo2c+u74sWbX0b36IwDS2meNCjg2Gjraa9mAr4iMY3wLLlGc0GNa
 enTe7TFFyyIss36zVE028GA1hjE6ePU=
X-Google-Smtp-Source: AA6agR6fbuIRNVJE/yBO6sB7OY1cc/R3wGv0A59+Jf+e+dN2Hgz4SV6N9bLljD7YwCgKz+rko39zww==
X-Received: by 2002:a67:b149:0:b0:388:4aff:57d0 with SMTP id
 z9-20020a67b149000000b003884aff57d0mr4397611vsl.48.1659782394276; 
 Sat, 06 Aug 2022 03:39:54 -0700 (PDT)
Received: from [192.168.10.102] ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 186-20020a1f17c3000000b003748499ee4esm5140840vkx.44.2022.08.06.03.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Aug 2022 03:39:53 -0700 (PDT)
Message-ID: <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
Date: Sat, 6 Aug 2022 07:39:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/5/22 21:30, BALATON Zoltan wrote:
> On Fri, 5 Aug 2022, Daniel Henrique Barboza wrote:
>> Coverity reports a OVERFLOW_BEFORE_WIDEN issue in dcr_write_dma(). When
>> handling the DMA0_CR switch we're doing a multiplication between two
>> integers (count and width), and the product is assigned to an uint64_t
>> (xferlen). The int32 product can be overflow before widened.
> 
> It can't in practice though as count is max 0xffff and width is max 8 so this sounds like a Coverity false positive. 

This time I believe it's worth fixing it. This code can be used as a base
to do something similar somewhere else, where the variables don't have
hard caps like we have here, and then we'll have a real overflow to
deal with.

> Maybe you could avoid it by changing the type of count or width to uint64_t instead of casting?

That was my first idea but it would require more changes. I'll send a
v2.


> 
>> Fix it by casting the first operand to uint64_t to force the product to
>> be 64 bit.
>>
>> Fixes: Coverity CID 1490852
>> Fixes: 3c409c1927ef ("ppc440_uc: Basic emulation of PPC440 DMA controller")
> 
> This line does not appear in 3c409c1927ef so this second Fixes line is bogus. This was added to fix other Coverity issues in eda3f17bcd7b96 but still did not make Coverity happy :-)


My bad. I'll drop that "Fixes" line.


Daniel

> 
> Regards,
> BALATON Zoltan
> 
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>> hw/ppc/ppc440_uc.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index 11fdb88c22..31eeffa946 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -908,7 +908,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
>>
>>                     sidx = didx = 0;
>>                     width = 1 << ((val & DMA0_CR_PW) >> 25);
>> -                    xferlen = count * width;
>> +                    xferlen = (uint64_t)count * width;
>>                     wlen = rlen = xferlen;
>>                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
>>                                                    false);
>>

