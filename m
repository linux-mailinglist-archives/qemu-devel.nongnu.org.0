Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A164A6D2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 19:20:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4nPG-0005CV-TW; Mon, 12 Dec 2022 13:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nOz-00059M-Az
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:19:45 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nOx-0003R9-C2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:19:44 -0500
Received: by mail-ej1-x62c.google.com with SMTP id kw15so30231453ejc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 10:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v0Wo5EBw16RluQBM65ToWfg2piA5WsEkfndughiUEIk=;
 b=mJGJ1v1tFNv4lQ/Hhtg4PF6fWH2yDcxCLCKlejlTH3ZKvzqpgP6IPz0rMODE9FJRt/
 jq20FT9r3dMe0R/v1lA1ZEhcaEvvoUxDMtbb0Z6oJVmyqXQBTgHSo5+Dg/S9uzbaj/+6
 PYdHN0b/gfxsaMJqaBq7BER//AxntSqndGeP32ZTVq8gYNkPPi4OAodiX8JWALGE2yAk
 FYHKkr+Wd9kGTNDdlqILtQ0UZ1fr9OJAcqvRmf6TCqyzaEMhiYMJogYLCOllTgM1l/QL
 /VZNvZqiEXjGKTQZM4qn++ApvcetUQkqj7lGg4qCl2fbk1kTNetmIyWvRHW6HBg1s1eW
 z8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v0Wo5EBw16RluQBM65ToWfg2piA5WsEkfndughiUEIk=;
 b=kyeRBS1sGkTv51i/cRS8Q9ymIWJ7/OykxTh0Icd99GEJoelu/Kh18g55Cm3IStKA2B
 K2X0Vc7VST5+jOdHg+CboJPnRAOZpUQbiARXqXU9Lnl09voA6JkD8YkiWe7kQ9Ei8l58
 DsaqkXbxZW1TclNrslUWQ2TR378iRIFLNMwfTrD1IwjkfS5WUfQPBYA1v6v5jFh8f9av
 Lq1D7gUe1ZXJ6svKA1gU7+KdsFgZX90gy5ufDRaEWhl3Usxx8tZ9V2xj5M6lzMntZAhX
 l7SWj92Grl8A+V7/Eqgz9AuxgtcBwkUEXJvZ7hjo6OVAylPBC89hMuwSMmT8C6DXAF26
 Io4Q==
X-Gm-Message-State: ANoB5pksL73GC/72o8FCazm6uIPWQU4Fu/0lwpOF60hnJ4cueSgY5bF6
 eDPBnqrIrCh35nCCya51YSYYVCg8H9pEfDebzSw=
X-Google-Smtp-Source: AA0mqf4Ydy8P87ZMl8DSlPyvj4zofbR37OEOLp5pDoqu8PvZtEdnnY0xwRXDSWlJh/NHdTra/op7oA==
X-Received: by 2002:a17:906:2b46:b0:7c1:bb5:5704 with SMTP id
 b6-20020a1709062b4600b007c10bb55704mr14714030ejg.26.1670869181083; 
 Mon, 12 Dec 2022 10:19:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ky20-20020a170907779400b0073d7b876621sm3515530ejc.205.2022.12.12.10.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 10:19:40 -0800 (PST)
Message-ID: <48d7f9d7-fb60-525b-8632-470cc54285ae@linaro.org>
Date: Mon, 12 Dec 2022 19:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/8] accel/tcg: Move PageDesc tree into tb-maint.c for
 system
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-8-richard.henderson@linaro.org>
 <953275ef-a900-0a44-d2a4-1d990a1522a8@linaro.org>
 <6006a739-9474-4c27-c42e-b642a957e346@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6006a739-9474-4c27-c42e-b642a957e346@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

On 12/12/22 16:28, Richard Henderson wrote:
> On 12/9/22 01:22, Philippe Mathieu-Daudé wrote:
>> On 9/12/22 06:19, Richard Henderson wrote:
>>> Now that PageDesc is not used for user-only, and for system
>>> it is only used for tb maintenance, move the implementation
>>> into tb-main.c appropriately ifdefed.
>>>
>>> We have not yet eliminated all references to PageDesc for
>>> user-only, so retain a typedef to the structure without definition.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/internal.h      |  49 +++-----------
>>>   accel/tcg/tb-maint.c      | 130 ++++++++++++++++++++++++++++++++++++--
>>>   accel/tcg/translate-all.c |  95 ----------------------------
>>>   3 files changed, 134 insertions(+), 140 deletions(-)
>>
>>
>>> -/*
>>> - * In system mode we want L1_MAP to be based on ram offsets,
>>> - * while in user mode we want it to be based on virtual addresses.
>>> - *
>>> - * TODO: For user mode, see the caveat re host vs guest virtual
>>> - * address spaces near GUEST_ADDR_MAX.
>>> - */
>>> -#if !defined(CONFIG_USER_ONLY)
>>> -#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
>>> -# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
>>> -#else
>>> -# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
>>> -#endif
>>> -#else
>>> -# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
>>> -#endif
>>
>>
>>> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
>>> index 20e86c813d..9b996bbeb2 100644
>>> --- a/accel/tcg/tb-maint.c
>>> +++ b/accel/tcg/tb-maint.c
>>> @@ -127,6 +127,121 @@ static PageForEachNext 
>>> foreach_tb_next(PageForEachNext tb,
>>>   }
>>>   #else
>>> +/*
>>> + * In system mode we want L1_MAP to be based on ram offsets.
>>> + */
>>> +#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
>>> +# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
>>> +#else
>>> +# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
>>> +#endif
>> So you removed L1_MAP_ADDR_SPACE_BITS in this patch. If you ever respin,
>> I'd rather have it cleaned in the previous patch, along with the comment
>> updated and TODO removed.
> 
> I don't agree.  I move all of the PageDesc symbols together in this 
> patch.  I think that it would get in the way of the main point of the 
> previous patch.

OK then :)


