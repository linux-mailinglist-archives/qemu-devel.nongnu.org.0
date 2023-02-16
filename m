Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4476998E3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:30:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgCs-0002VS-Oc; Thu, 16 Feb 2023 10:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSgCm-0002LY-Od
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:29:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSgCk-0006H4-RW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:29:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id n36so1121865wmr.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=caNy3PIRN2UxAxQwfdFwjPjfUl1iX8PNLzE1m2WCEiM=;
 b=zd6eE7FbNECSsrzRxbF8Ll4crQM8T+7OABWOIGMIJBvheSCoHoAYrlRJmEuOWbO6vy
 z5xKeW5lz3NBLmlBjztjMsGkZfNLBqyUJVbOswquh3U3OJ1HQLAv/KTqSZ/gG19288Zw
 wvvDtrmUyV+FZMieg0WAhOg3fb2s4rjUyQ9u8nIMryAI7/OPcDZY4Kp+gX8oW5jO/JJG
 kti3xIumDNlrFtOT+vs0/0Y6uMU6jZU6hWEBmsjskY3Gp5eDDtmUuJzkFzsYrmbL7Ryd
 zmU3vWz/R+/fXjsd0iv14oJF/4bSdBZkX5s64ub8uFKFvMdd1WhFhq7kT++qSHMPSoAT
 Xj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=caNy3PIRN2UxAxQwfdFwjPjfUl1iX8PNLzE1m2WCEiM=;
 b=R1U5mtijbLKbGN4LBA0MunoZ4LOR68DKqQWFtPs0ZEwqQIV/lHZJjeZKjyVSSicgjD
 ZIV3yrpZJveK3DJQ94fJRay4VVHcwO83HIm8L/POxA1AKRrfcNGwAGOtsiWsRpUmNErU
 XpzWrSXWiS9SAObfNbYAWqpB4HTZIIIIo5zFopu9S0gK1jV7Aol4XPozyqNvLJg0GkPv
 6CdmywbY9zknmVHz3PUZyyiKxYFtOEDKvefDFYiz4cEjXSaW8+MxLQxR2c/uf9L6lOOW
 lPWmPUXfx4tbkS7KtTG8nOHvPH6y52Tnj0qvABKzKPFM418WVogvkuYwS4Jg2IdJ9Ex3
 lCVg==
X-Gm-Message-State: AO0yUKX9ovnvo+mGpmtJQLVod+Lhp9JAnjMVeQt2O1iRVKnewzrdb2Do
 mB5ALFVoigR7p4T3g3/TL89Fng==
X-Google-Smtp-Source: AK7set+AIR0nRqRNimKVzZ+wyyspB5KTSnkfKjA52CIq6z6vegMGDJnaSomI18pq2kiUyGouTvnlrA==
X-Received: by 2002:a05:600c:3481:b0:3df:eda1:439c with SMTP id
 a1-20020a05600c348100b003dfeda1439cmr2249222wmq.11.1676561388865; 
 Thu, 16 Feb 2023 07:29:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b003b47b80cec3sm5651006wmb.42.2023.02.16.07.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:29:48 -0800 (PST)
Message-ID: <18dff0d7-6417-b2c4-eb76-c8d5a89433aa@linaro.org>
Date: Thu, 16 Feb 2023 16:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [Qemu-devel] [PATCH 19/38] char: make some qemu_chr_fe skip if no
 driver
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, pbonzini@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair@alistair23.me>
References: <20161022095318.17775-1-marcandre.lureau@redhat.com>
 <20161022095318.17775-20-marcandre.lureau@redhat.com>
 <7f4f3a95-d1c5-a531-0ce5-8a974e5bc002@linaro.org>
 <CAJ+F1C+4VJOytUS4kukBcnNEo7XN1dCLKcSzbiFmLkM4F+gSJA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1C+4VJOytUS4kukBcnNEo7XN1dCLKcSzbiFmLkM4F+gSJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 16/2/23 15:23, Marc-André Lureau wrote:
> Hi Philippe
> 
> On Thu, Feb 16, 2023 at 2:14 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Hi Marc-André,
>>
>> [very old patch...]
>>
>> On 22/10/16 11:52, Marc-André Lureau wrote:
>>> In most cases, front ends do not care about the side effect of
>>> CharBackend, so we can simply skip the checks and call the qemu_chr_fe
>>> functions even without associated CharDriver.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    hw/arm/pxa2xx.c           |  8 +++-----
>>>    hw/arm/strongarm.c        | 16 ++++++---------
>>>    hw/char/bcm2835_aux.c     | 18 ++++++-----------
>>>    hw/char/cadence_uart.c    | 24 +++++++---------------
>>
>>>    qemu-char.c               | 51 ++++++++++++++++++++++++++++++++++++++---------
>>>    include/sysemu/char.h     | 40 +++++++++++++++++++++++++------------
>>>    22 files changed, 156 insertions(+), 191 deletions(-)
>>
>>
>>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>>> index 4459b2d..291818e 100644
>>> --- a/hw/char/cadence_uart.c
>>> +++ b/hw/char/cadence_uart.c
>>> @@ -142,9 +142,7 @@ static void uart_rx_reset(CadenceUARTState *s)
>>>    {
>>>        s->rx_wpos = 0;
>>>        s->rx_count = 0;
>>> -    if (s->chr.chr) {
>>> -        qemu_chr_fe_accept_input(&s->chr);
>>> -    }
>>> +    qemu_chr_fe_accept_input(&s->chr);
>>
>> I'm trying to understand this change. This code comes from:
>>
>> commit 9121d02cb33c96b444a3973579f5edc119597e81
>>
>>       char/cadence_uart: Fix reset for unattached instances
>>
>>       commit 1db8b5efe0c2b5000e50691eea61264a615f43de introduced an issue
>>       where QEMU would segfault if you have an unattached Cadence UART.
>>
>>       Fix by guarding the flush-on-reset logic on there being a qemu_chr
>>       attachment.
>>
>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> index 131370a74b..4d457f8c65 100644
>> --- a/hw/char/cadence_uart.c
>> +++ b/hw/char/cadence_uart.c
>> @@ -157,7 +157,9 @@ static void uart_rx_reset(UartState *s)
>>    {
>>        s->rx_wpos = 0;
>>        s->rx_count = 0;
>> -    qemu_chr_accept_input(s->chr);
>> +    if (s->chr) {
>> +        qemu_chr_accept_input(s->chr);
>> +    }
>>
>> When resetting the xlnx-zcu102 machine, I hit:
>>
>> (lldb) bt
>> * thread #1, queue = 'com.apple.main-thread', stop reason =
>> EXC_BAD_ACCESS (code=1, address=0x50)
>>     * frame #0: 0x10020a740 gd_vc_send_chars(vc=0x000000000) at
>> gtk.c:1759:41 [opt]
>>       frame #1: 0x100636264 qemu_chr_fe_accept_input(be=<unavailable>) at
>> char-fe.c:159:9 [opt]
>>       frame #2: 0x1000608e0 cadence_uart_reset_hold [inlined]
>> uart_rx_reset(s=0x10810a960) at cadence_uart.c:158:5 [opt]
>>       frame #3: 0x1000608d4 cadence_uart_reset_hold(obj=0x10810a960) at
>> cadence_uart.c:530:5 [opt]
>>       frame #4: 0x100580ab4 resettable_phase_hold(obj=0x10810a960,
>> opaque=0x000000000, type=<unavailable>) at resettable.c:0 [opt]
>>       frame #5: 0x10057d1b0 bus_reset_child_foreach(obj=<unavailable>,
>> cb=(resettable_phase_hold at resettable.c:162), opaque=0x000000000,
>> type=RESET_TYPE_COLD) at bus.c:97:13 [opt]
>>       frame #6: 0x1005809f8 resettable_phase_hold [inlined]
>> resettable_child_foreach(rc=0x000060000332d2c0, obj=0x0000600002c1c180,
>> cb=<unavailable>, opaque=0x000000000, type=RESET_TYPE_COLD) at
>> resettable.c:96:9 [opt]
>>       frame #7: 0x1005809d8 resettable_phase_hold(obj=0x0000600002c1c180,
>> opaque=0x000000000, type=RESET_TYPE_COLD) at resettable.c:173:5 [opt]
>>       frame #8: 0x1005803a0
>> resettable_assert_reset(obj=0x0000600002c1c180, type=<unavailable>) at
>> resettable.c:60:5 [opt]
>>       frame #9: 0x10058027c resettable_reset(obj=0x0000600002c1c180,
>> type=RESET_TYPE_COLD) at resettable.c:45:5 [opt]
>>
>> Doing similar to commit 9121d02cb3...:
>>
>> -- >8 --
>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> index c069a30842..deadee1788 100644
>> --- a/hw/char/cadence_uart.c
>> +++ b/hw/char/cadence_uart.c
>> @@ -155,7 +155,9 @@ static void uart_rx_reset(CadenceUARTState *s)
>>    {
>>        s->rx_wpos = 0;
>>        s->rx_count = 0;
>> -    qemu_chr_fe_accept_input(&s->chr);
>> +    if (qemu_chr_fe_backend_open(&s->chr)) {
>> +        qemu_chr_fe_accept_input(&s->chr);
>> +    }
>>    }
>> ---
>>
>> ... fixes the issue but I'm not sure 1/ this is a correct use of the
>> chardev API and 2/ this is how the HW work at reset.
> 
> The trouble is that GTK/VTE console/chardev creation is done later.
> 
> I think we should rather fix ui/gtk.c, as this could happen with other
> char frontends:
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 4817623c8f..dfaf6d33c3 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1783,7 +1783,9 @@ static void gd_vc_chr_accept_input(Chardev *chr)
>       VCChardev *vcd = VC_CHARDEV(chr);
>       VirtualConsole *vc = vcd->console;
> 
> -    gd_vc_send_chars(vc);
> +    if (vc) {
> +        gd_vc_send_chars(vc);
> +    }

Easy :) If you send a proper patch, feel free to include:

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!


