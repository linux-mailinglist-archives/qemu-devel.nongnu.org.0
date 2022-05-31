Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DAC53932E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:29:59 +0200 (CEST)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw2sf-00024d-Ji
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2rA-0000r9-BC
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:28:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2r8-00040c-Iv
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:28:23 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g205so2226333pfb.11
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SzIB9KdH9QWg6UY3QHtjldAFFDHyVABAHE4hLmP5UYM=;
 b=QQyUi3DfdUa2rfgaF7l4p8VjJxg0GGK7r+E3ccOGkCXz21SdlA/wYberqVXhFpRz0z
 ll1SXH/aGN8q5dhYpgyrGML2dpiKO03R/GV527+SDeYUufWYp5oUDeG7irHEicWgKTtB
 SHZqyceKxgOGWj13ZKYt7qmV7gO9+r1J9h2fOfacRJEVXOEHTeevorSiQmPMgZzjh/D7
 h98jCtDht4PexFDSO5++CzAnEBPdV3qGf6o5iTjstQV/SdaRIxXj2Gt21PWZ9yLQIKYF
 KQKZl0YzprBlnRVLky/r+JdForLfcqGXztFTZi9TfN6AdwQ6KADp9zWFKdmXFSkyARx2
 si5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SzIB9KdH9QWg6UY3QHtjldAFFDHyVABAHE4hLmP5UYM=;
 b=dW6wXDDLWSsWCWnvjllZSYh2pYkb9QIndtKux89M4HMj902SY+G7lhl2Q/OgE+064c
 gOwMtuMPF8584QCxCzDu+gRZl+KvpqrlitdeQL0h86F0KF4GAwuD2R/3IcLUr29Yheqs
 xk2E4p0RyDYeQzJDf5Q0WRcBpwEqUsP841g4croJSQqM3usuM3IxHkAyqScHSRC9jJ0y
 kDrmSYJiSvqa4bptpAMHRPpEqhRg34OGMtt+Uom+hgNkJeJ+KRLvi/sVg14TR09HS9aW
 qpzEJzgR6u437tBdUWbVAEpteF57uSt4+xBBMqmlKsuXraMeuy+afDKZhUMySmRxdkna
 gn8w==
X-Gm-Message-State: AOAM533/aeIRLTi48Ru11Icwi+gFawEDmmO4kDKu5JLS4PmzS1XXHDEQ
 tDMiwc8VeE7PFf5tmtI/D6EPjQ==
X-Google-Smtp-Source: ABdhPJyhmNbmVNcE3FJxSkUjcoTUqoWog4oh0iE0/kxGyHpDfpWjF8C1y2qoAKRvrZsH/P0/ZYxFtg==
X-Received: by 2002:a63:f255:0:b0:3fc:17ff:bf7c with SMTP id
 d21-20020a63f255000000b003fc17ffbf7cmr9006641pgk.229.1654007300811; 
 Tue, 31 May 2022 07:28:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a170902868e00b00163ed11621dsm3589371plo.73.2022.05.31.07.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:28:20 -0700 (PDT)
Message-ID: <cebbfbb8-fabb-25ce-5fd8-5f6391d543fe@linaro.org>
Date: Tue, 31 May 2022 07:28:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 03/15] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-4-richard.henderson@linaro.org>
 <CAFEAcA8XTYwjshU1cUNtW0uzFQBa2rBJd+5JbraFP6iJ3g1Fwg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8XTYwjshU1cUNtW0uzFQBa2rBJd+5JbraFP6iJ3g1Fwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 5/31/22 05:15, Peter Maydell wrote:
> On Fri, 27 May 2022 at 19:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We don't need to constrain the value set in zcr_el[1],
>> because it will be done by sve_zcr_len_for_el.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index d2bd74c2ed..0621944167 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
>>                                            CPACR_EL1, ZEN, 3);
>>           /* with reasonable vector length */
>>           if (cpu_isar_feature(aa64_sve, cpu)) {
>> -            env->vfp.zcr_el[1] =
>> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
>> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
>>           }
> 
> I'm still not a fan of the zcr_el[] value not actually being
> a valid one. I'd rather we constrained it when we write the
> value into the field.

It is an architecturally valid value, exactly like the kernel might write while probing 
for supported vector lengths.  It will result in this, or the next smaller supported 
vector size, being selected.


r~

