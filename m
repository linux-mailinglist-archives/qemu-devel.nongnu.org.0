Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3005755EF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 21:40:21 +0200 (CEST)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC4hB-0000A7-5q
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 15:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC4dx-00071X-9N; Thu, 14 Jul 2022 15:37:01 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC4dv-0008J5-JG; Thu, 14 Jul 2022 15:37:01 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10bd4812c29so3675679fac.11; 
 Thu, 14 Jul 2022 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fyX+UluwpEQzSCSyMj/J0VrL0yQQ43I7/CVYPpN8kUc=;
 b=TE4TgMsiJAPFbjCHJK7m/vPN75ky6ktobYdcEgKNHa/fYKD1B0uxtxn+tzSLH5R83Y
 N4/YZ4czbJw0zVxHq7JnIVBBawu2H7hxjHObeI6604ay8F2rNZGbZsFw/mGfz9y+c0c5
 g1ihCOJbVXY2CLgaoHszwH91wQUE+lbtWjiWgEEAKVP2tqwGSyzYVdvMk9po/jQP9QEs
 1W0zPXcYmfMBL83MNhNeSLBSeHTxCRtFM4Bny/re0MTHZqedLPoCR96ta34EBRFHFiC1
 PFA81vriqbf1AZvoIBzMU7/Lk73Tz6BQsO2+SkiJFBavlqihRJ5C+WLbqleVSFajNtIZ
 E66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fyX+UluwpEQzSCSyMj/J0VrL0yQQ43I7/CVYPpN8kUc=;
 b=HPIbezpcFq2lYEVlEMoz/EFV6RIqbrQV+ebxSga8iYl2PxwaDM09OpRy6Ubw9lBe/Z
 FUGJ1WC09/jlD48r38Lm25Ev6OTwVTb10aROiV9pi0EwoAg0l0xpP8qO+pMezmfntAMx
 NvzpYzV+iGirRODYw2oEEc0JKquHnrBtn79PQMEV3M3lZ0PYyr5JzoH3qpXKHBBmcyXB
 7pFKq365DfMGVk1UzGLfJhWOwUT/CVsmihY+O9/w9R+dlkF3sB6P/tEazrJ1kCf0Hj8a
 Sui3tGzmds3OkUkZMn5CWkZqarBi2ZDq/HW54UqXHkoWAg26U4cBZkSkkCbsrvfQPx6R
 Amdw==
X-Gm-Message-State: AJIora/3ITbtiJkl62hedVser2OyM/bcXNekh54M2dBFHWI5AskZWYGX
 CuaC5fteP0K+UoQg0uV1lGY=
X-Google-Smtp-Source: AGRyM1tZQwTB3VeFVxnyv1XopPg+uTlgYQq4dR9r1om9kJ8Evoro4OIifZnk8hS3iyaSVaiLSid1Aw==
X-Received: by 2002:a05:6870:2323:b0:10d:2b6:3519 with SMTP id
 w35-20020a056870232300b0010d02b63519mr1225118oao.215.1657827417914; 
 Thu, 14 Jul 2022 12:36:57 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 g7-20020a9d2d87000000b00618ca32d858sm1061386otb.25.2022.07.14.12.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 12:36:57 -0700 (PDT)
Message-ID: <19d5c6ca-c1d4-917f-6106-75bd4a169d52@gmail.com>
Date: Thu, 14 Jul 2022 16:36:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] target/ppc: Move tlbie[l] to decode tree
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, richard.henderson@linaro.org
References: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
 <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
 <5bef219f-cfdd-f2bb-d2e9-f2ea6b4df213@gmail.com>
 <bc0a64be-d187-d087-2a3d-cf66b1945c24@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <bc0a64be-d187-d087-2a3d-cf66b1945c24@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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



On 7/14/22 16:31, Leandro Lupori wrote:
> On 7/14/22 15:45, Daniel Henrique Barboza wrote:
>> On 7/12/22 16:37, Leandro Lupori wrote:
>>> Also decode RIC, PRS and R operands.
>>>
>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>> ---
>>>   target/ppc/cpu_init.c                        |  4 +-
>>>   target/ppc/insn32.decode                     |  8 ++
>>>   target/ppc/translate.c                       | 64 +-------------
>>>   target/ppc/translate/storage-ctrl-impl.c.inc | 87 ++++++++++++++++++++
>>>   4 files changed, 99 insertions(+), 64 deletions(-)
>>>   create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index c16cb8dbe7..8d7e77f778 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -6368,7 +6368,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>>>                          PPC_FLOAT_EXT |
>>>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>>>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>>> -                       PPC_MEM_TLBSYNC |
>>> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>>>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>>>                          PPC_SEGMENT_64B | PPC_SLBI |
>>>                          PPC_POPCNTB | PPC_POPCNTWD |
>>> @@ -6585,7 +6585,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>>>                          PPC_FLOAT_EXT |
>>>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>>>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>>> -                       PPC_MEM_TLBSYNC |
>>> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>>>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>>>                          PPC_SEGMENT_64B | PPC_SLBI |
>>>                          PPC_POPCNTB | PPC_POPCNTWD |
>>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>>> index 6ea48d5163..2b985249b8 100644
>>> --- a/target/ppc/insn32.decode
>>> +++ b/target/ppc/insn32.decode
>>> @@ -809,3 +809,11 @@ VMODSD          000100 ..... ..... ..... 11111001011    @VX
>>>   VMODUD          000100 ..... ..... ..... 11011001011    @VX
>>>   VMODSQ          000100 ..... ..... ..... 11100001011    @VX
>>>   VMODUQ          000100 ..... ..... ..... 11000001011    @VX
>>> +
>>> +## TLB Management Instructions
>>> +
>>> +&X_tlbie        rb rs ric prs:bool r:bool
>>> +@X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... . &X_tlbie
>>
>> You're marking bit 11 as ignored but you're not marking 31 as ignored. The way
>> the argument patterns are made in this file seems to be either not mark the
>> ignored bits (e.g. most of args from the start of the file) or mark all ignore
>> bits (e.g. @XL_S from RFEBB).
>>
>> I am being petty, yes. This makes no functional change in the instruction, but
>> I'd rather mark bit 31 as ignored in @X_tlbie as well.
>>
>> I did that in my tree and it seems to work fine. If you're ok with this change,
>>
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
> 
> Right, the @X_tlbie pattern ended up inconsistent with regard to ignored bits. I'm ok with changing bit 31 of it to ignored.
> 
> Talking with the guys here, they've explained me that it is usually better to use '.' with format definitions ('@'), to make it easier to reuse them for more instructions, some of which may ignore a given bit while others may not. But for @X_tlbie it's ok to use dots or dashes for bits 11 and 31, as it's used only by TLBIE and TLBIEL.


Makes sense. Thanks for the explanation. I'll keep that in mind.


Daniel


> 
> Thanks,
> Leandro
> 
>>
>>
>>> +
>>> +TLBIE           011111 ..... - .. . . ..... 0100110010 - @X_tlbie
>>> +TLBIEL          011111 ..... - .. . . ..... 0100010010 - @X_tlbie

