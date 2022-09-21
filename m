Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA65BFFAC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:12:44 +0200 (CEST)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0Sx-0001E5-AK
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazYa-0006yF-89
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:14:29 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazYY-0002Ob-LI
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:14:28 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MD9jV-1oRx892tQ9-009A8v; Wed, 21 Sep 2022 15:14:20 +0200
Message-ID: <c91d0b1f-fb49-34ad-2347-38881762beae@vivier.eu>
Date: Wed, 21 Sep 2022 15:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
 <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
 <d8e33415-d44b-6e30-057c-c5de5b2f9bb9@amsat.org>
 <1095351c-953f-0d02-a6d6-055c0730e44d@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1095351c-953f-0d02-a6d6-055c0730e44d@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fOIoDsdxS4bjDu04GjH+3v7GydaBfDpDZnhGcsCX4q+vmPeYnUc
 Pyxw5FsqtAMFjGqetmIoaEVL9WoSPUvfuhEna/x0Oo04GGm6F9Zgf2rhHk22v+xxbB+tIk8
 JyUXR7fJr+tu3gLTnY63LR1xnYDL+w41C7mbCqB8vi9O9oYWyyuPER4l2JGqq24gbqVXMRD
 nu7ZCGmUYx3kIlMPOOugA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n3RvAoBLpbE=:E5zMINRyBZ+kFXAmG0r0T9
 pd844oyevMHTUtagN5MsN91d2QMA/GvL+w4zO7PC4PdQHkIVJEfZtaYaGG2PyGDXnAGq/vx7m
 dbjdoGdNVCKj39PxHLjAvUQU/C3oC96lfWL+BhslN3982WVoDMxWSMYmyk+cCfi88QgiyR63w
 MQSH/fVkLZvFekeN9z81jFBYX4EVumwbhv0rfEeKaambyXHIlyWEV9R1paa6DbcnGaLDFR7Jb
 RlCO0gj4/J4jxpFf9RQoqGero4Jhkqrh2lqtvE66xO80GurN+PjfO+otrMBtfMAZWMv4b99iU
 pZrvdFzCOL4WyASTDxxguotI59lGWc4I5N9CZBT9BUUN2WvKfltNqmplwvNdHn/j3O79jSW3o
 b5SNiF9cVqLaOI5A6wJ9mQCnYoSLln6rL8xfiVlbCuN8Ft4WGiMOjypwOduSQV1XGlwBqKpmt
 tf2HZV2+cen9oxBa8OriaQN+NKrlw9ERiuoNBpUkKVlreeEjKM0pzXphkRBGo5m6pz816UgPa
 DMjjv1/Zm340xjjxmy3mB/qzB+0jg7ynMrnUzaP3h/pTQeFVbTZlvamWNKjepFImZRr2wtCb8
 B8PMsgiy90S4XTg84zBmw/iyxTxJMeaIPk6iRUMEj7AuWbD+3/IadoUCYHVgS0o1ik/pbCOMI
 PGxMkt3F+yi+FQQbPx1oBjZa3SNx6keVxNH6Tb0o0rH/sct3M7aEmje7OlG8e1ecTJOHqdeOn
 97GCNnTpMqo8Etzf93JqjEujjROArjp7hjzgR/VCdOl8mRrfDfZJbZDhNKdNfuJQ601MT5hTb
 AXxrXy6
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/09/2022 à 18:30, Mark Cave-Ayland a écrit :
> On 17/09/2022 23:27, Philippe Mathieu-Daudé via wrote:
> 
>> On 17/9/22 14:09, BALATON Zoltan wrote:
>>> On Sat, 17 Sep 2022, Mark Cave-Ayland wrote:
>>>> There are already 32 feature bits in use, so change the size of the m68k
>>>> CPU features to uint64_t (allong with the associated m68k_feature()
>>>> functions) to allow up to 64 feature bits to be used.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>> target/m68k/cpu.c | 4 ++--
>>>> target/m68k/cpu.h | 6 +++---
>>>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
>>>> index f681be3a2a..7b4797e2f1 100644
>>>> --- a/target/m68k/cpu.c
>>>> +++ b/target/m68k/cpu.c
>>>> @@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
>>>>
>>>> static void m68k_set_feature(CPUM68KState *env, int feature)
>>>> {
>>>> -    env->features |= (1u << feature);
>>>> +    env->features |= (1ul << feature);
>>
>>          env->features = deposit64(env->features, feature, 1, 1);
>>
>>>> }
>>>>
>>>> static void m68k_unset_feature(CPUM68KState *env, int feature)
>>>> {
>>>> -    env->features &= (-1u - (1u << feature));
>>>> +    env->features &= (-1ul - (1ul << feature));
>>
>>          env->features = deposit64(env->features, feature, 1, 0);
>>
>>> Should these be ull instead of ul?
>>
>> Yes. Not needed if using the <qemu/bitops.h> extract/deposit API.
> 
> I must admit I find the deposit64() variants not particularly easy to read: if we're considering 
> alterations rather than changing the constant suffix then I'd much rather go for:
> 
>      env->features |= (1ULL << feature);
> 
> and:
> 
>      env->features &= ~(1ULL << feature);
> 
> Laurent, what would be your preference?

I have no preference, do as you prefer.

> 
>>>> }
>>>>
>>>> static void m68k_cpu_reset(DeviceState *dev)
>>>> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
>>>> index 67b6c12c28..d3384e5d98 100644
>>>> --- a/target/m68k/cpu.h
>>>> +++ b/target/m68k/cpu.h
>>>> @@ -154,7 +154,7 @@ typedef struct CPUArchState {
>>>>     struct {} end_reset_fields;
>>>>
>>>>     /* Fields from here on are preserved across CPU reset. */
>>>> -    uint32_t features;
>>>> +    uint64_t features;
>>>> } CPUM68KState;
>>>>
>>>> /*
>>>> @@ -539,9 +539,9 @@ enum m68k_features {
>>>>     M68K_FEATURE_TRAPCC,
>>>> };
>>>>
>>>> -static inline int m68k_feature(CPUM68KState *env, int feature)
>>>> +static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
>>
>> Why uint64_t? Can we simplify using a boolean?
> 
> I don't really feel strongly either way here. Again I'm happy to go with whatever Laurent would 
> prefer as maintainer.

A boolean seems more logic, I think.

Thanks,
Laurent

