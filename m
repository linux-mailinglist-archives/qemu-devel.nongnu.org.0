Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A445CCB3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:08:14 +0100 (CET)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxcq-0003wF-Vw
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpxXI-0003fO-LQ; Wed, 24 Nov 2021 14:02:28 -0500
Received: from [2607:f8b0:4864:20::92a] (port=45570
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpxXD-00067g-CJ; Wed, 24 Nov 2021 14:02:24 -0500
Received: by mail-ua1-x92a.google.com with SMTP id ay21so7150222uab.12;
 Wed, 24 Nov 2021 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J606178CwOo8uxDpNQ009utwbqmRaZLeUycOjx41qEM=;
 b=gMSMZCoNv7fz48Oxt7YdIBidaawQDqb9b/a7+Z6xh0BoyQmtloftwBtTtxAX5YQGF1
 28y8I5ofknI6PKaDnd0nxC32XXP7MfRLhBpbwCXBUUQl/5c+az8Th2pQux5JP9OiFe98
 A8beuY82UxfkzWYWIqB2sIbqO1wwaFTh6mnKUkn9PPCCGmbVFJ8fcfrpUfJDC//AqUF3
 6rS4HrAPAMed1w2g4tR0zMQGJYeC56znxerL7BujOgVMV4bpcPBt1/69laHa2/f9ZNVQ
 v38ZFJYTOC66tCwIIuT0bJm76/ODwsCSMguGtM+bRSeZb/gOtpWyIwVI+6u0u2NZPT7Z
 0umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J606178CwOo8uxDpNQ009utwbqmRaZLeUycOjx41qEM=;
 b=DOuaoKDMyyQx92sfbuzd/j0MYrrsT7aauKFjxiJ+pAGQ9w311fe1JMIMl1+lo/pA7o
 3pscRnRTNz8aVclStF5sjXD4ecyVvGyv4eMo2VW5cdJDPwFU5g2qoFaVQc5ETMzZNh76
 GImSgqW7GBeoDYvNzOVUxdVQhCiRB/3lOIp0OX4aTGRbQ6bNL3QUVEBdp83TFEW9TzxQ
 NzCtQIfTQY03uJqV1LVkYXmHYc5gl5fXPFgQcXBD/UK0AYjJ8QS3wmrKY7GGqvVbaXKi
 Dofmz9wcj4WjYOV4gcKS0pv6VHjRD3r+3levir68Qjw4ynjT7CMjKaWVfzs2LImJ/AAV
 C86Q==
X-Gm-Message-State: AOAM532UJjrwG9DMB3927WLAg2isDaCXQ4Rte1gHwLBGIUUQA5JX/Pkf
 V0RNCrIzSFB6BKo2GQ9ZKCk=
X-Google-Smtp-Source: ABdhPJx4Oly5B+qq3bh2Veemsw8JcLscBN3QvkTQMa2eOyQ+yAVm/mfQR42yAih3m0qFpva7Dmae1w==
X-Received: by 2002:a67:c79a:: with SMTP id t26mr27590487vsk.37.1637780542007; 
 Wed, 24 Nov 2021 11:02:22 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id w11sm353175vkm.14.2021.11.24.11.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 11:02:21 -0800 (PST)
Message-ID: <2a1818d7-1dc9-f7f5-7a7e-aba2b61989a8@gmail.com>
Date: Wed, 24 Nov 2021 16:02:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
 <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
 <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/24/21 15:42, Cédric Le Goater wrote:
> On 11/24/21 14:40, Daniel Henrique Barboza wrote:
>>
>>
>> On 11/24/21 09:00, Leandro Lupori wrote:
>>> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>>> offset, causing the first byte of the adjacent PTE to be corrupted.
>>> This caused a panic when booting FreeBSD, using the Hash MMU.
> 
> I wonder how we never hit this issue before. Are you testing PowerNV
> and/or pSeries  ?
> 
> Could you share a FreeBDS image with us ?
> 
>> If you add a "Fixes:" tag with the commit that introduced the code you're
>> fixing, we can push it right away as a bug fix in 6.2 (assuming it doesn't
>> break anything else, of course).
>>
>> The commit to be fixed in the case seems to be a2dd4e83e76b ("ppc/hash64:
>> Rework R and C bit updates")
> 
> Indeed.
> 
>> One more comment below:
>>
>>>
>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>> ---
>>>   target/ppc/mmu-hash64.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>>> index 19832c4b46..f165ac691a 100644
>>> --- a/target/ppc/mmu-hash64.c
>>> +++ b/target/ppc/mmu-hash64.c
>>> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>>>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>>   {
>>> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
>>> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 14;
>>
>> Instead of adding a '14' you should add a new #define in mmu-hash64.h with this
>> value, something like "HPTE64_R_R_SHIFT". This will avoid hardcoding literals
>> around the code and forcing us to go to the ISA every time we wonder what's
>> an apparently random number represents. There's also a "HPTE64_R_R" defined
>> there but I'm not sure if it's usable here, so feel free to create a new
>> macro if needed.
>>
>> In that note, the original commit that added this code also added a lot of
>> hardcoded "15" values for the C bit update in spapr_hpte_set_c() and
>> ppc_hash64_set_c(), and a "14" value like you're changing here in spapr_hpte_set_r().
>> If you're feeling generous I believe that another patch replacing these hardcoded values
>> with bit shift macros is warranted as well.
> 
> May be for 7.0 though ?


Yeah, this extra cleanup I proposed can be postponed to 7.0 in case someone wants
to give it a go.


Daniel



> 
> Thanks,
> 
> C.
> 

