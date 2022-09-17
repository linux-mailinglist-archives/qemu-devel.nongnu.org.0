Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED25BBADD
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:28:18 +0200 (CEST)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZgIL-0001Vk-4m
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgHJ-00008T-U4
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:27:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgHI-00067x-2m
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:27:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso2110274wma.1
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=wt+EfD0OUe664csHZ7TAJjsFfwxznmJIYlph0+gF0p4=;
 b=hqhSN8teiOvm7qXYFMsk0bYHNkZDEUfDdsKoZCt/puUPH0XrjLYQvUvJTaXkH+7Z+z
 6rXgaRpyq/ePGOxBozIA8UQDm9Sd2UmFadubVLxl+8dLTOiL+KngmpfeqIBloa6FLwlz
 yXW3z2ZwavVgIDUEAAI4/GE9Ho5fQvihCCcZRIbMemwJNM7N8K/ViUhKTdvY+7BX20zs
 71DRbganFA9/MMaA2FYJ6NhVUKPdst6bkyTdWKbxenbt2K+4/TGyJAiAcCXp58HFHpCp
 eM8SKiUGXWl+S3yNia+yeSjgv8Z9h9fw35l5qA71Mdc3hffW0DlcDdWKsKLICeJIGUZL
 sYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=wt+EfD0OUe664csHZ7TAJjsFfwxznmJIYlph0+gF0p4=;
 b=SoAhP0bOumeaU9KvglVBAP9MLVXWw91uS1taNhC4BAtCNn/1sEpIQC0xfl/EDyb3/h
 qQP1/Bm+mILFZAqz8BeH7Xj0b+wptS/BMz0OHLHaTt11OmdttlbBtIFDDvLaBpN7OgH4
 /26cLU3Nmm1V7tLCmt4ZHi4Eg5/sVbmX99yA8xY8+rw9304VdHIoBCGEXDBe2DnZ9tlL
 +lPtCAvoh/cPLs/XIEK1iSU5evGcpSarz/U2BOfqCfxFBn+qkolH1fwCB1bGTbrj6mlS
 wIelyliEAUk2ehkFa4mIanI7JnLdhUoNGR+z/tuDaQyQMFkt9Ub6vUR0w5jt7d/OUZYZ
 jD+g==
X-Gm-Message-State: ACrzQf0Twcj4RxE7CSDSkcvo/z7p/G9V2LwGl2/JU/2NYnp74I6N0PM7
 k0IuLU1cZLWFlm4tRzoQ0hU=
X-Google-Smtp-Source: AMsMyM4GDrMpWePvg0XX5ftSIF9KJYtf064DW2NR20GulPZJAPLI6n3hZbUkz4gEwygvRezVc3E7uA==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr6734358wmq.0.1663453630208; 
 Sat, 17 Sep 2022 15:27:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a7bce02000000b003b483000583sm6925710wmc.48.2022.09.17.15.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:27:09 -0700 (PDT)
Message-ID: <d8e33415-d44b-6e30-057c-c5de5b2f9bb9@amsat.org>
Date: Sun, 18 Sep 2022 00:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com, 
 qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
 <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
In-Reply-To: <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 17/9/22 14:09, BALATON Zoltan wrote:
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

         env->features = deposit64(env->features, feature, 1, 1);

>> }
>>
>> static void m68k_unset_feature(CPUM68KState *env, int feature)
>> {
>> -    env->features &= (-1u - (1u << feature));
>> +    env->features &= (-1ul - (1ul << feature));

         env->features = deposit64(env->features, feature, 1, 0);

> Should these be ull instead of ul?

Yes. Not needed if using the <qemu/bitops.h> extract/deposit API.

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

Why uint64_t? Can we simplify using a boolean?

>> {
>> -    return (env->features & (1u << feature)) != 0;
>> +    return (env->features & (1ul << feature)) != 0;

         return extract64(env->features, feature, 1) == 1;

>> }
>>
>> void m68k_cpu_list(void);
>>
> 


