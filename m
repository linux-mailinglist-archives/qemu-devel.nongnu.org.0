Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1669849B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNcW-0001j7-2H; Wed, 15 Feb 2023 14:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSNcQ-0001b0-Nk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:39:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSNcO-0000aW-Ax
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:39:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id co8so16528543wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLBkRNLBPCNp47segiRRscmKgoEoysASjIomFeRGmt4=;
 b=xyW7znk3/G1/YRvZmDQHAwtqaPAeEhU1Oi9wyxqIIEwl8WgqTHgBazoK0gfzH177VI
 6yFhLNGTPAQyh/JP1hK7v/s0XCqM5bh8cychfABiNQvzTreUSaLWfxuXD5kmiXzEruYi
 gZ0CO0i2k1/0yfNx3bjfgDBiw4nlf5OsTd5rGqCdM3CUOa+EQlTlsKN9W8DqZqAz0L+e
 9cLBzvu0UZ2BAlbn8hvqhmd+JrwU4md3m+ibO0pZ6LCPG8QsgE0CKxeUyyxEolyw4skg
 Blc1B24WJjQ/ZLjJR897FvZztFrhrNQ1S14MxsHw6X+/HzYz1Zl3wpf3+sRzvXj2W9O5
 RPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLBkRNLBPCNp47segiRRscmKgoEoysASjIomFeRGmt4=;
 b=tWpegf1zHKfbRjdNwXXAUNIecoG5wrBxv3ijxmZjt4+V0R8ozWQeHgM5ccjUoI9Gyx
 dQiTzqjP5lmANZ11uTsvT45fxMxUz/IFeg3FvKzZqDiOUM9hPzAdxdQVeUx6crJq0b9C
 rjpDaTrpHhOahgK5X8DsopD3MXNQGSRUl8XeUOqcMJ5Zc3q25+BNrpBb8VQAsCJEfZoM
 SAgdzXcKpf5t4pbSZKVDUZd4K12pAhG2/LhEGjVaZNdgHYizvcGDIZv50fbUi7Z8tUhk
 noa0G1Mh5nAC0yWl0Uw1hOo1UBfWs7eKyuldn+OrPj0TL3jAmT6H7NLEaGalnwvoz94R
 aCVw==
X-Gm-Message-State: AO0yUKX2wgy7HhFWvnqmC94QPM6jJGdJoq3yK6lBCv7pRQwwDbTl3Z7F
 EqaHcBUzk2F6x3rCJA+Xch6f7A==
X-Google-Smtp-Source: AK7set9GsD+fC81QFVoh3598Yrss7iDk7LE1fQuEVt7vlM3/GlJAEcve2TiAvzwa29bmuhuR79u82Q==
X-Received: by 2002:a05:6000:1814:b0:2c3:ddbe:d7b2 with SMTP id
 m20-20020a056000181400b002c3ddbed7b2mr2342686wrh.62.1676489942388; 
 Wed, 15 Feb 2023 11:39:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b002c54241b4fesm15227668wri.80.2023.02.15.11.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:39:01 -0800 (PST)
Message-ID: <7fa8c101-2bda-ef3f-c803-a08ebf65af7b@linaro.org>
Date: Wed, 15 Feb 2023 20:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] target/mips: implement CP0.Config7.WII bit support
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-4-marcin.nowakowski@fungible.com>
 <05b8264f-c22c-2187-5980-672361fa579b@linaro.org>
 <CAN8qkUbTYGJ4fx413HvtqYS6pn3RT62QPVaG6FTnK3E0eesA9A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAN8qkUbTYGJ4fx413HvtqYS6pn3RT62QPVaG6FTnK3E0eesA9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 20:19, Marcin Nowakowski wrote:
> On Wed, Feb 15, 2023 at 7:33 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Hi Marcin,
>>
>> On 15/2/23 09:47, Marcin Nowakowski wrote:
>>> Some older cores use CP0.Config7.WII bit to indicate that a disabled
>>> interrupt should wake up a sleeping CPU.
>>> Enable this bit by default for M14Kc, which supports that. There are
>>> potentially other cores that support this feature, but I do not have a
>>> complete list.
>>
>> Also the P5600 (MIPS-MD01025-2B-P5600-Software-TRM-01.60.pdf,
>> "MIPS32® P5600 Multiprocessing System Software UM, Revision 01.60).
>>
>>> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
>>> ---
>>>    target/mips/cpu-defs.c.inc | 1 +
>>>    target/mips/cpu.c          | 6 ++++--
>>>    target/mips/cpu.h          | 1 +
>>>    3 files changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
>>> index 480e60aeec..57856e2e72 100644
>>> --- a/target/mips/cpu-defs.c.inc
>>> +++ b/target/mips/cpu-defs.c.inc
>>> @@ -354,6 +354,7 @@ const mips_def_t mips_defs[] =
>>>                           (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
>>>            .CP0_Config2 = MIPS_CONFIG2,
>>>            .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),
>>
>> Per the P5600 doc on Config5.M:
>>
>>     Configuration continuation bit. Even though the Config6 and Config7
>>     registers are used in the P5600 Multiprocessing System, they are both
>>     defined as implementation-specific registers. As such, this bit is
>>     zero and is not used to indicate the presence of Config6.
>>
>> Still I suppose we need to set at least Config4.M:
>>
>>     +        .CP0_Config4 = MIPS_CONFIG4,
>>     +        .CP0_Config4_rw_bitmask = 0,
> 
> The definition of MIPS_CONFIG4 doesn't set M-bit, so I assume what you
> really meant here is
> .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M)

Yes :)

> Config3 also doesn't have M-bit set right now, I'll fix that in the
> next patch revision.
> 
>>
>> I'm not sure about:
>>
>>     +        .CP0_Config5 = MIPS_CONFIG5,
>>     +        .CP0_Config5_rw_bitmask = 0,
> 
> M14Kc specification (MD00674-2B-M14Kc-SUM-02.04.pdf) notes the following:
> "This bit is reserved. With the current architectural definition, this
> bit should always read as a 0."
> But I'll add
> .CP0_Config5 = MIPS_CONFIG5 | (1U << CP0C5_NFExists)
> for completeness of the definition.

Thanks.

>>> +        .CP0_Config7 = 0x1 << CP0C7_WII,
>>>            .CP0_LLAddr_rw_bitmask = 0,
>>>            .CP0_LLAddr_shift = 4,
>>>            .SYNCI_Step = 32,
>>
>> Could you also set CP0C7_WII to the P5600 definition?
> 
> OK, will add that.

Great, thank you :)



