Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9B5AA3A5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 01:21:09 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTtUi-0007dq-Mj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 19:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTtSH-0006Bd-AK
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 19:18:37 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTtSF-00051m-Es
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 19:18:36 -0400
Received: by mail-pl1-x631.google.com with SMTP id f12so197654plb.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=4zGaroD0Z/JmjsVNOWmP0kwIr+ZKSmGK/BM0e9CUpEE=;
 b=k5WkchFK5p6HJ2t6dMyxTPL0N2j1wgLZpqkYmCtAupMO1LyMojpTuWYyGfOV3Z+Yyl
 awVWSwpIkAw51tfdKAUWj7e72+ua6dF57ZA2pPff4tiF9FeJulzPqpa4PEFN4QacMv+c
 DeO1LTQfto23QZxVyDidv/nRV+HvS1fR3x+TZ084hAo9palT6JfUC+m9xjyvzwZjX1SX
 qH+lIMYvzxMUwu7McAkDGRm7zaGJW6AFvU3/IrPZ8/HFfzoB6O8GIfoAnkNKFQ24WINE
 mk0LRG4W1mhDAxxdFYVYVJwHi0JfrfZOVfwaHju7kr2ixJOgtSGzkxTGPucr5fo8cBX0
 +esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=4zGaroD0Z/JmjsVNOWmP0kwIr+ZKSmGK/BM0e9CUpEE=;
 b=w+xtVtF8dzTZ4R8q5kYjXG1smVcsXu1tuIvMO1k3sswWwbQGG9LoA2sGU/t3w2gKlN
 rTQcF2Of3HkDtaWh1oA5HMfpFBMjw06y5LgYzrK3mzSv4Ve2HU1Q4bFdg8ULb28KXO2g
 otXG3tQbNOzJJlCB7enxuth47jsJeqayGA9AEtCRdRd5TkVMjUMVmc+xi9DEZt8HA6u0
 sX7SX+xwKB7w7x6M8EKwvnxmrEKwSpr52uITyKi9JkGpTUaryue0u5qACzH6Q1n0ZFtp
 mu0P4Lb+Bti/372v2YSyOq209pYgkv2l2P1SU3zJ6Q9jEol2gjgVUUVUb5IxkpPfp7sa
 2Lhw==
X-Gm-Message-State: ACgBeo1jdCd9683zZoif3x8eqJF3BoUpQnGuZxRJabGjvDNu3h5e3Vmh
 oAGVQ/ZegxCW6UlC+10Kts0=
X-Google-Smtp-Source: AA6agR7xRVYnApBdBcMqYTbAyOGMfgvCv/0q1voWjKcNnCp3qdpPCTTava4M11hGa/OjsE1QmHtr3g==
X-Received: by 2002:a17:90b:4f4e:b0:1f5:8a65:9192 with SMTP id
 pj14-20020a17090b4f4e00b001f58a659192mr1565638pjb.224.1662074313924; 
 Thu, 01 Sep 2022 16:18:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a17090ae20500b001fb277223bdsm185233pjz.2.2022.09.01.16.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 16:18:33 -0700 (PDT)
Message-ID: <d6f71302-864c-b80f-84ea-d1dda4817f80@amsat.org>
Date: Fri, 2 Sep 2022 01:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>, alistair@alistair23.me
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
 <d2e49911-4aed-5031-f430-71d4e15b130e@linaro.org>
In-Reply-To: <d2e49911-4aed-5031-f430-71d4e15b130e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 1/9/22 07:32, Richard Henderson wrote:
> On 9/1/22 02:02, Wilfred Mallawa wrote:
>> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>
>> Adds a helper macro that implements the `rw1c`
>> behaviour.
>>
>> Ex:
>>    uint32_t data = FIELD32_1CLEAR(val, REG, FIELD);
>>
>> if the specified `FIELD` is set (single/multi bit all fields)
>> then the respective field is cleared and returned to `data`.
>>
>> If ALL bits of the bitfield are not set, then no change and
>> val is returned.
>>
>> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Why do these operations need to go into hw/registerfields.h?
> It's not a common operation, since we've never needed it so far.

I suggested it to improve readability of this patch:
https://lore.kernel.org/qemu-devel/c33257a3-645f-9386-52e5-21a15ef0ebe5@amsat.org/

>> ---
>>   include/hw/registerfields.h | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
>> index 1330ca77de..5a804f72e3 100644
>> --- a/include/hw/registerfields.h
>> +++ b/include/hw/registerfields.h
>> @@ -115,6 +115,34 @@
>>                     R_ ## reg ## _ ## field ## _LENGTH, 
>> _v.v);              \
>>       _d; })
>> +/* Get the max value (uint) discribed by `num_bits` bits */
>> +#define MAX_N_BITS(num_bits) ((1 << (num_bits)) - 1)
>> +
>> +/*
>> + * Clear the specified field in reg_val if
>> + * all field bits are set, else no changes made. Implements
>> + * single/multi-bit `rw1c`
>> + */
>> +#define FIELD8_1CLEAR(reg_val, reg, 
>> field)                                \
>> +    ((FIELD_EX8(reg_val, reg, field) 
>> ==                                   \
>> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) 
>> ?                   \
>> +      FIELD_DP8(reg_val, reg, field, 0x00) : reg_val)
>> +
>> +#define FIELD16_1CLEAR(reg_val, reg, 
>> field)                               \
>> +    ((FIELD_EX16(reg_val, reg, field) 
>> ==                                  \
>> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) 
>> ?                   \
>> +      FIELD_DP16(reg_val, reg, field, 0x00) : reg_val)
>> +
>> +#define FIELD32_1CLEAR(reg_val, reg, 
>> field)                               \
>> +    ((FIELD_EX32(reg_val, reg, field) 
>> ==                                  \
>> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) 
>> ?                   \
>> +      FIELD_DP32(reg_val, reg, field, 0x00) : reg_val)
>> +
>> +#define FIELD64_1CLEAR(reg_val, reg, 
>> field)                               \
>> +    ((FIELD_EX64(reg_val, reg, field) 
>> ==                                  \
>> +      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) 
>> ?                   \
>> +      FIELD_DP64(reg_val, reg, field, 0x00) : reg_val)
>> +
>>   #define FIELD_SDP8(storage, reg, field, val) 
>> ({                           \
>>       struct 
>> {                                                              \
>>           signed int v:R_ ## reg ## _ ## field ## 
>> _LENGTH;                  \
> 
> 


