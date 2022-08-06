Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680D58B531
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 13:18:00 +0200 (CEST)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKHoc-0003Ue-Ta
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 07:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oKHmp-0001xg-5B; Sat, 06 Aug 2022 07:16:07 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oKHmn-0005my-CC; Sat, 06 Aug 2022 07:16:06 -0400
Received: by mail-vk1-xa30.google.com with SMTP id q191so2344983vkb.6;
 Sat, 06 Aug 2022 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8Klk9PPwUzkWsOtGPnCEhTMQWttjrR5f8zklXyO9f8k=;
 b=a6lD54fllqcD3Dt7vIB2yeX23h2TCJcvrfmDb8SOvxKU2wPBlsn3eecBtekSaXQ+nq
 JGd1p5m36JCBUCTWGmdTUZvDVtUXmQHyVsg/S5jBKQLfWAv/OCB1nSG2fVdtOyw3zBzt
 2UA0me4betvBskpFlVhqQM7+4oLSTANeOnxTDnuMBEMglq0xYXm5kkZR3bcjlAJnYPqY
 ioj7GxC3qS33nQ/aHq5L2qBUXdnlU9o0LNpwJXzrl1c+LMd5UCGuJE6qJiL5rUp4OfsZ
 5/Xza9MBAS5w4wKePon816kznQ4uGM8d7QAubt9u+cCyvfXKeVY+HZkqL1sWobjh7Roi
 f0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8Klk9PPwUzkWsOtGPnCEhTMQWttjrR5f8zklXyO9f8k=;
 b=6vqyY5gAdVO8b+sJ+EEegLVe0hCRs5svWecJRXLjnEYnfbOOeuQAe15vHlDfb5mrCn
 VYJSmWpOp2++2jupy3DGjptyseXiPzW96n0IdsKoBUU1yXaBJk0l2xlBYXG43IianLDC
 j5RKLL7FtxZQgfV3V4ONa+eWIr+4aWRy+3XsstZyPaFP3iq1GmbUwY5L3RC943uY/+z7
 nAgNVWJa1W8TAAG7Axe3n04onD6rVGBbiNXAtk2I3uAiO/3AiVBHWv2xArSs5MvnPGwv
 4/Yo1vRK3ARy0pZAis8r6XUzgedKLydap0WGlyVP4PR06wE9IDuH2ZiHQybRmBX4hWnP
 07Mg==
X-Gm-Message-State: ACgBeo2L7c4yxYRSJQYNl+F2ER3GAaRQGHu93BmAblSb5TTF8Kmd8094
 LMq6lW1J6ZC1Z8sHx+0AGcI=
X-Google-Smtp-Source: AA6agR63MVvQTYZWuie9XOqO4vRTbaD4U1CXFEnSpvAW+dpODT+973taGEpmq/C+eqChQvepAyqoBA==
X-Received: by 2002:a1f:3206:0:b0:377:d5aa:620f with SMTP id
 y6-20020a1f3206000000b00377d5aa620fmr4763019vky.38.1659784563998; 
 Sat, 06 Aug 2022 04:16:03 -0700 (PDT)
Received: from [192.168.10.102] ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 s92-20020a9f29e5000000b003879752cc67sm5151199uas.6.2022.08.06.04.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Aug 2022 04:16:03 -0700 (PDT)
Message-ID: <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
Date: Sat, 6 Aug 2022 08:16:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
 <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
In-Reply-To: <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
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

Balaton,

I had a change of heart. The code is too clear that it won't overflow.
It felt overkill changing var types just for that.

Peter already marked it as Ignored - False Positive in Coverity as well.
So this would be a code change to "look better". It didn't look particularly
better after the changes I was about to send, so let's forget about it.


Daniel

On 8/6/22 07:39, Daniel Henrique Barboza wrote:
> 
> 
> On 8/5/22 21:30, BALATON Zoltan wrote:
>> On Fri, 5 Aug 2022, Daniel Henrique Barboza wrote:
>>> Coverity reports a OVERFLOW_BEFORE_WIDEN issue in dcr_write_dma(). When
>>> handling the DMA0_CR switch we're doing a multiplication between two
>>> integers (count and width), and the product is assigned to an uint64_t
>>> (xferlen). The int32 product can be overflow before widened.
>>
>> It can't in practice though as count is max 0xffff and width is max 8 so this sounds like a Coverity false positive. 
> 
> This time I believe it's worth fixing it. This code can be used as a base
> to do something similar somewhere else, where the variables don't have
> hard caps like we have here, and then we'll have a real overflow to
> deal with.
> 
>> Maybe you could avoid it by changing the type of count or width to uint64_t instead of casting?
> 
> That was my first idea but it would require more changes. I'll send a
> v2.
> 
> 
>>
>>> Fix it by casting the first operand to uint64_t to force the product to
>>> be 64 bit.
>>>
>>> Fixes: Coverity CID 1490852
>>> Fixes: 3c409c1927ef ("ppc440_uc: Basic emulation of PPC440 DMA controller")
>>
>> This line does not appear in 3c409c1927ef so this second Fixes line is bogus. This was added to fix other Coverity issues in eda3f17bcd7b96 but still did not make Coverity happy :-)
> 
> 
> My bad. I'll drop that "Fixes" line.
> 
> 
> Daniel
> 
>>
>> Regards,
>> BALATON Zoltan
>>
>>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>> hw/ppc/ppc440_uc.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>>> index 11fdb88c22..31eeffa946 100644
>>> --- a/hw/ppc/ppc440_uc.c
>>> +++ b/hw/ppc/ppc440_uc.c
>>> @@ -908,7 +908,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
>>>
>>>                     sidx = didx = 0;
>>>                     width = 1 << ((val & DMA0_CR_PW) >> 25);
>>> -                    xferlen = count * width;
>>> +                    xferlen = (uint64_t)count * width;
>>>                     wlen = rlen = xferlen;
>>>                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
>>>                                                    false);
>>>

