Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27905BEF33
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:34:54 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaktI-0002z8-RO
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag8s-00008V-Mn
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:31:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag8q-0001nr-8W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCNOEu7maPP75XE5he0/ZiFKAiiU6dq8ZzTWKkBzUUI=; b=rWSw3xy07PE1kHtRmrSvxi9BQR
 zIRVdNSKazdBarvb8NGFZd2zq60D/VdbKld/RK38fnCIqOAzWQqIjrJlATBEHuhpbAELiIMa7ZaYo
 dMwz1uzQxwjLKlecsccyEBrdGMELSLQLMdZ2sA5CguPmaXOmvZeThlR23e06qC0q/eZQ2X0PMhxmS
 snuXIYbfB7hcalSS6hbdy45zsX4jFgqVAuepfkpB9TJYaia1bdBTG7UyppkIoz1uiLOoFowJYY07k
 LPyFXelRU/h4lF8pCjbNN63DukcQ03xWwbuSloGoiCvHNl/izVGKOvRcmU+viSgNAVqhKG911sPGI
 s90XgKDUu7OtYu60CLo+jCkcYk/LMwRGtlA42hFPBS6s7YrIFvD3aU+FX6EDkVkdqk/1sT2vK9j/w
 qxCCPKG27kXQA+bcQ38xDH2wMrpeABC7GbcHJeEWHRzH0+pCQ3rbmtvFxYYe4K1GwK1ggTJxv+4m6
 KJgnIn1UY8Mvlk6h0VdLXniIM6+nxyWfOHqcRWMH0vESNNqGmLGO9vpjmxto+ehy67FkKNBd5B1k/
 HV9yl1b3ijVbs7uOsR+iRqgiHdEcSxNXiBNXlDvGrBXU2hfRHRfooeB1J9PMFXPwPy8ZSqIPWswlx
 1mtlmQoBIwwhz3Gfj7iNcOmQVKeyPbrifhVjVPMTs=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag75-000AvW-8O; Tue, 20 Sep 2022 17:28:51 +0100
Message-ID: <1095351c-953f-0d02-a6d6-055c0730e44d@ilande.co.uk>
Date: Tue, 20 Sep 2022 17:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com, 
 qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
 <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
 <d8e33415-d44b-6e30-057c-c5de5b2f9bb9@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d8e33415-d44b-6e30-057c-c5de5b2f9bb9@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/2022 23:27, Philippe Mathieu-Daudé via wrote:

> On 17/9/22 14:09, BALATON Zoltan wrote:
>> On Sat, 17 Sep 2022, Mark Cave-Ayland wrote:
>>> There are already 32 feature bits in use, so change the size of the m68k
>>> CPU features to uint64_t (allong with the associated m68k_feature()
>>> functions) to allow up to 64 feature bits to be used.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> target/m68k/cpu.c | 4 ++--
>>> target/m68k/cpu.h | 6 +++---
>>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
>>> index f681be3a2a..7b4797e2f1 100644
>>> --- a/target/m68k/cpu.c
>>> +++ b/target/m68k/cpu.c
>>> @@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
>>>
>>> static void m68k_set_feature(CPUM68KState *env, int feature)
>>> {
>>> -    env->features |= (1u << feature);
>>> +    env->features |= (1ul << feature);
> 
>          env->features = deposit64(env->features, feature, 1, 1);
> 
>>> }
>>>
>>> static void m68k_unset_feature(CPUM68KState *env, int feature)
>>> {
>>> -    env->features &= (-1u - (1u << feature));
>>> +    env->features &= (-1ul - (1ul << feature));
> 
>          env->features = deposit64(env->features, feature, 1, 0);
> 
>> Should these be ull instead of ul?
> 
> Yes. Not needed if using the <qemu/bitops.h> extract/deposit API.

I must admit I find the deposit64() variants not particularly easy to read: if we're 
considering alterations rather than changing the constant suffix then I'd much rather 
go for:

     env->features |= (1ULL << feature);

and:

     env->features &= ~(1ULL << feature);

Laurent, what would be your preference?

>>> }
>>>
>>> static void m68k_cpu_reset(DeviceState *dev)
>>> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
>>> index 67b6c12c28..d3384e5d98 100644
>>> --- a/target/m68k/cpu.h
>>> +++ b/target/m68k/cpu.h
>>> @@ -154,7 +154,7 @@ typedef struct CPUArchState {
>>>     struct {} end_reset_fields;
>>>
>>>     /* Fields from here on are preserved across CPU reset. */
>>> -    uint32_t features;
>>> +    uint64_t features;
>>> } CPUM68KState;
>>>
>>> /*
>>> @@ -539,9 +539,9 @@ enum m68k_features {
>>>     M68K_FEATURE_TRAPCC,
>>> };
>>>
>>> -static inline int m68k_feature(CPUM68KState *env, int feature)
>>> +static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
> 
> Why uint64_t? Can we simplify using a boolean?

I don't really feel strongly either way here. Again I'm happy to go with whatever 
Laurent would prefer as maintainer.

>>> {
>>> -    return (env->features & (1u << feature)) != 0;
>>> +    return (env->features & (1ul << feature)) != 0;
> 
>          return extract64(env->features, feature, 1) == 1;
> 
>>> }
>>>
>>> void m68k_cpu_list(void);


ATB,

Mark.

