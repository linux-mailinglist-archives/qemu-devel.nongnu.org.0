Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48B6A13B1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKuu-0005l6-IC; Thu, 23 Feb 2023 18:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKus-0005kY-Hp
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:22:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKuq-0001eU-M3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:22:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bw19so1616168wrb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TnfgXFouRjSyBUE1Cgw64cctFYm369u2rVGcZHiFkzE=;
 b=Elt7j5civmiaEAEm1MnJe7hZ3PWH5dlzbB6zru7ZzFz3eBAbkZa8zNqYOPs3Q7y8vS
 TVTiBGQM0Np/3sQic3BqwJQipHwDfJ0Dy+CGxgDkmVqjqMLE2HtvRdUZ5NabNJuXLU66
 mMIDQ0bxvDX4co1viGwcEeu2nKPlaKkZjhToDX0POWdKjygXjJCR3U8D9mL6Npcjz3kl
 GTnDtoAcJdvysYusDSJoCRw0NO8vVRU4w5J/uefjoefHKIUR3Lju9kuU3CXBOiXkDfA8
 5olEbfCQBoFpq3j/FCxINSjNcJkOJJYap+HOIlG/zsqmMDv5A9shqYkd7dx0nQt2/c8B
 OSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TnfgXFouRjSyBUE1Cgw64cctFYm369u2rVGcZHiFkzE=;
 b=QG4q8/tzCtrc/coXsiQo2inbFckCsybl0w5Swe57qT58omU8LlVh28Tg4biQTpB2tp
 2dnm5Wn8F3Owfr99zhWFHRvWkrE/Bnf2GQM3Opg7kPqWvLxKZ8950aQehJ0g6ElzQN5f
 nMfhzcG7CWs4LthjIz/NKp64BBhhR/MErG7RBhZiGh5bFetLvqhof/OvESXVToNdogHm
 Ea1S/ZJ98nWdFNIeBhyNFL8Y7AgQHM7VUAolgE+DkM8zAcqU7xoaInPwpYe1Wa12fonM
 sckQWcN4GQlrbUcJnqGY5oEfR5LFqaAsH94Vet/5n8eUVoVS4Y9lFdZTep3e1cBNx7yn
 1j6A==
X-Gm-Message-State: AO0yUKVz+ACps2odSWwiX/LztULiaci6Wdp2oIP2NGSI8Tz5KHF2hMxC
 UVSZmh9AIRwH9ELBoSej6UXjWg==
X-Google-Smtp-Source: AK7set+GMjFYZPnUBEkiuUABMwVp9fX1gayCwprrDFUll86ghhBShlth37yDH4I7aWCUUIw0aFVakw==
X-Received: by 2002:adf:cd12:0:b0:2c6:5972:cd0d with SMTP id
 w18-20020adfcd12000000b002c65972cd0dmr11846823wrm.3.1677194523519; 
 Thu, 23 Feb 2023 15:22:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003dc5b59ed7asm754563wmc.11.2023.02.23.15.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:22:03 -0800 (PST)
Message-ID: <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Date: Fri, 24 Feb 2023 00:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/2/23 00:01, Richard Henderson wrote:
> On 2/22/23 01:01, Alex Bennée wrote:
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list. While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst |  1 +
>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>   target/arm/cpu_tcg.c          |  2 +-
>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/system/arm/emulation.rst 
>> b/docs/system/arm/emulation.rst
>> index 2062d71261..2c4fde5eef 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>   - FEAT_BTI (Branch Target Identification)
>> +- FEAT_CRC32 (CRC32 instruction)
>>   - FEAT_CSV2 (Cache speculation variant 2)
>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4066950da1..12e1a532ab 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>   static void aarch64_a76_initfn(Object *obj)
>>   {
>>       ARMCPU *cpu = ARM_CPU(obj);
>> +    uint64_t t;
>> +    uint32_t u;
>>       cpu->dtb_compatible = "arm,cortex-a76";
>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>       cpu->ctr = 0x8444C004;
>>       cpu->dcz_blocksize = 4;
>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>> +
>> +    /* per r4p1 of the Cryptographic Extension TRM */
>> +    t = cpu->isar.id_aa64isar0;
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */

Maybe:

         assert(t == 0x0000100010211120ull);

>> +    cpu->isar.id_aa64isar0 = t;
> 
> Ok, so, this might be helpful for grepping, but it's not helpful for 
> reading the documentation, which on page B2-137 uses hex.
> 
> 
> r~
> 


