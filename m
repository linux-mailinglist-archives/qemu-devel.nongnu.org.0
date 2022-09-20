Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB15BEF25
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:29:36 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakoB-0005yV-Gz
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag3o-0005bf-Ql
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:25:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag3l-0000gF-Pr
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O1FjlLS5Ti3vIfe5HwtQMtbZ/1tHifiDbXefxhWfDww=; b=z/y4lbNSYlEQQbyJGrtccF00Xg
 t6gjQfWKJ6S1/EFrYQ0+YBcLTkM36vrl4FuWw9dWnLhqKMhj2XPxbIq6cX0hr24/qtbgxB6PIOACE
 BnGBpcjHfaDM4EsUhIGvx3OsnRty7d7kjQRyoScwFIf1cgGogTh8vzQToLkzuEgWwVNoOb8YyAyQp
 3FRTdZgRTTQYjUBZ0D2ZUTpmecpbwHbYdmlVnmXMjZIw+c5WtBC9o+wwdB+Ytn5HxYF9rX5GP/9hJ
 yIer6bm1xFlAZb++otx+R9NCQRB047JYTc6irxM68m7LZWWK8emXeySnKGnh7W3QEn0LTnxGA34Am
 xmHx4gpw2hA8gU2w2O0pGYs7xzd2PWcuU6c5UCjhAEWcoMRyRRR9J1nAgl4C9KZmwaypbXKa31eg7
 1IWJJ1iFDKNrvLT17+y/3sReYLMuRSVw43EIF8IE0EglL5kQACoDs5s2MavDL1g4C9rmIxxYvF2Pd
 8X1JIXmSYYME/vg3i9gO2BgPLuKo9FBUUWyX6ZvO6hVzMipDmWbqIZ/wHcp1RS4o81oIn+ZiFM9U1
 BMyAdNV5sdEuw1Qh/Mw15/hBlQibRyk/nLBp4dSii34VY1zDpI1Nobk24oRdrk/y3crp3Em/cSAOz
 qbkVs/I2xUjwiMRWXojReswKVfKUAgNtYxUnEyPyo=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oag1v-000Au5-KP; Tue, 20 Sep 2022 17:23:31 +0100
Message-ID: <100f6b42-cd03-f2a9-53d1-63ac8fe5dc01@ilande.co.uk>
Date: Tue, 20 Sep 2022 17:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com, 
 qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
 <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
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

On 17/09/2022 13:09, BALATON Zoltan wrote:

> On Sat, 17 Sep 2022, Mark Cave-Ayland wrote:
>> There are already 32 feature bits in use, so change the size of the m68k
>> CPU features to uint64_t (allong with the associated m68k_feature()
>> functions) to allow up to 64 feature bits to be used.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> target/m68k/cpu.c | 4 ++--
>> target/m68k/cpu.h | 6 +++---
>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
>> index f681be3a2a..7b4797e2f1 100644
>> --- a/target/m68k/cpu.c
>> +++ b/target/m68k/cpu.c
>> @@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
>>
>> static void m68k_set_feature(CPUM68KState *env, int feature)
>> {
>> -    env->features |= (1u << feature);
>> +    env->features |= (1ul << feature);
>> }
>>
>> static void m68k_unset_feature(CPUM68KState *env, int feature)
>> {
>> -    env->features &= (-1u - (1u << feature));
>> +    env->features &= (-1ul - (1ul << feature));
> 
> Should these be ull instead of ul?

Indeed, it looks like Windows needs ULL in order to work correctly with uint64_t - I 
can easily fix that in v2.

>> }
>>
>> static void m68k_cpu_reset(DeviceState *dev)
>> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
>> index 67b6c12c28..d3384e5d98 100644
>> --- a/target/m68k/cpu.h
>> +++ b/target/m68k/cpu.h
>> @@ -154,7 +154,7 @@ typedef struct CPUArchState {
>>     struct {} end_reset_fields;
>>
>>     /* Fields from here on are preserved across CPU reset. */
>> -    uint32_t features;
>> +    uint64_t features;
>> } CPUM68KState;
>>
>> /*
>> @@ -539,9 +539,9 @@ enum m68k_features {
>>     M68K_FEATURE_TRAPCC,
>> };
>>
>> -static inline int m68k_feature(CPUM68KState *env, int feature)
>> +static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
>> {
>> -    return (env->features & (1u << feature)) != 0;
>> +    return (env->features & (1ul << feature)) != 0;
>> }
>>
>> void m68k_cpu_list(void);


ATB,

Mark.

