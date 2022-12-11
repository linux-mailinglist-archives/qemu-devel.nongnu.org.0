Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED8D649641
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Sy2-0007Vm-57; Sun, 11 Dec 2022 15:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4Sy0-0007V8-9e
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:32 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4Sxy-0000jI-Ne
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:30:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz12so594143ejc.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g+Lm77zY56UQWZ5oP64+o/dG6IPMEIp5d9DQrrBG3JU=;
 b=hzoa6W229+Wd2LN1aPtnAY9X/k+edBcoyKcVFJldCXx+adHxlgC34nf0in4QHMQijh
 LEI5sI5WESTaHQX/blzRSGAQ+SiBD95sg2FHP/sDr+PY/TXTgWbtwO5ULx8ef/LN6Omz
 ptZ+OW+FXtRajRD8kZ6rAqmtTXFNbm88FHCEgQXaOhbdVJx1resS1EN1BPaQXuUiozDA
 dlZLUQUOq/AoSEzgsikvLyG8swFtP/GDbFQ//FSu+cr5xEFdo5cLmRD7Q3tecdMLz2i7
 C+H60wrGzVX8jtJiRfM0H9czLvXmKXR4BUbg/UbcU13QqZX8NjVUw9yskEd2MCkLKR4U
 d12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+Lm77zY56UQWZ5oP64+o/dG6IPMEIp5d9DQrrBG3JU=;
 b=SijUlyX1dhO6L1CQ01x78TY71Li1MTxnt9BsdTntXNfNc/mZcaf2wSONipt+6gxq+2
 38T6lCORlO/j994VG6hQ+lj6390HVotVVbeVzFJo4SSYeefszn1OO5DkxSFTxlFBIR4V
 SHAntczO+9FSxVdQGrf3Ogwmmxp/Q5Z9dxb0lGDyWmAl6okaFKRHT32DMnus+4UDaCW3
 0M6fvaNFEjZufNKfkkTcnFKfl/C3Yu0mpHEZOrmzdX2ax9G5y7QJ26xyDo/gT/4I+cNK
 qv1Ym0dXQ32bXCYZ+VYCKltnw1KOLGTf+hStRFMqziG2F8TUajrond528STn2c5AGCWq
 7/SQ==
X-Gm-Message-State: ANoB5pnF8yT6o5TQpAkzwWlneHYbuUbkNCGIa5x56WY4c4xdvyROBIze
 /GuLc2gH5JfqjNZFV3U894n/LA==
X-Google-Smtp-Source: AA0mqf7iYL/77t/HBesFC/KqGmce/ZG/VSTpIQN95o/SHkwsJbxC45GYtgAc+vLMESpxT9dAx5pnYA==
X-Received: by 2002:a17:906:2806:b0:7c1:29ef:790b with SMTP id
 r6-20020a170906280600b007c129ef790bmr10607613ejc.69.1670790629375; 
 Sun, 11 Dec 2022 12:30:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hw18-20020a170907a0d200b0073022b796a7sm2437388ejc.93.2022.12.11.12.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 12:30:29 -0800 (PST)
Message-ID: <6c041914-10b2-5b63-5634-a021e340eee3@linaro.org>
Date: Sun, 11 Dec 2022 21:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/bootloader: Implement nanoMIPS SW
 opcode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-6-philmd@linaro.org>
 <ffe60d4d-551a-bf4c-403e-7d64aed30a78@linaro.org>
 <334a4beb-9c14-508c-9855-a723779eb239@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <334a4beb-9c14-508c-9855-a723779eb239@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 17:24, Richard Henderson wrote:
> On 12/10/22 10:02, Philippe Mathieu-Daudé wrote:
>> On 10/12/22 16:55, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/mips/bootloader.c | 24 +++++++++++++++++++++++-
>>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>>> index 997e74ee52..cc3df385df 100644
>>> --- a/hw/mips/bootloader.c
>>> +++ b/hw/mips/bootloader.c
>>> @@ -150,9 +150,31 @@ static void bl_gen_lui(void **p, bl_reg rt, 
>>> uint32_t imm32)
>>>       }
>>>   }
>>> +static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t 
>>> imm)
>>> +{
>>> +    uint16_t *p = (uint16_t *)*ptr;
>>> +    uint32_t insn = 0;
>>
>> Similarly, we should check whether imm fits in 12-bit.
> 
> I think you should simply split at the "li" level instead of lui+ori.

Clever.

