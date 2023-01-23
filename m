Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E1678219
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzwj-0001co-Qm; Mon, 23 Jan 2023 11:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzwi-0001cO-Bp
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:45:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzwg-0007B1-AY
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:45:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so9066177wmq.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 08:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F8HoZXDQqlObrpo1a7/s4kPKWOzPmMiLG+iYvJ3AJ04=;
 b=i3K3DlK706zoDIivftCioLt/IqL4rdefPdqe/nQFCLvKZypj+E9Dejlj3xUBuagwy0
 IYsUe/FuBmtqrGsVpXJM7eTnMNsysPn6N4rSsNawGkGrBC2rj1YMOzVCU9c20Ns3vOTz
 6cGu9p9fhjk8EsMpdMA9VI52hNUrtXLF/ofJHyqop8V8MERbLFg1rkVPAQk/x7bhFg16
 FZrV7h/MuFPRY7hUTxLqfcC/VYiF3Z8pEA2QM7DDBfmYRnqiVlnacqT5aIK5inU6tgve
 YqGjexLiIs9jpY3MFUrwnfZR2FnxKV1VLatnFxGkwoatyXmdbNxko1ZjsfhOJxnGxnM0
 8/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F8HoZXDQqlObrpo1a7/s4kPKWOzPmMiLG+iYvJ3AJ04=;
 b=AQYQQ4uVuR6FcbS1TOKLzHmgsmpWz5/5dSyKUWlvrhYAPkJd5UGXhpImlReUjcEcm+
 oP2E1uumLp8wFhEXrSEwUCDoT2c/XKqNYQbo1gYWARXhWRZg+ymnfnxYuL2Yk/wJvCTY
 LCGE313+86iWPB//RTDWBLKoQiQ0e+DGLFi+LaGCrY5H9RT35F0IYsg9f/B6FM8EODb/
 Wn9IkdCquM9CQJUGTg6dL4bNt4QlvT5M9VTo/n5gCWXULcSBq+xvr+bPnUFVM61IJpBs
 Dz+6q2uV2/RgSbtbWOZPBJszQ8AWOnvMvc0UvWF8l11ySkEBFrmB0V/xsbtyytffy0z8
 MfWQ==
X-Gm-Message-State: AFqh2kqSVe6R5l74lQQeprXzeJx457o04LW8I5YhVO8YZqjcgdovSu/D
 65vlN9krMbVkOnuyj5su/AUSb2+Q8TH2LPDx
X-Google-Smtp-Source: AMrXdXsK+SUXn5xsY2y/fVKD+Lhtlpuxb1p070X/2oGw0HLl3WEEsVW/OS3BpuOiBY8pT/9J9H70Vw==
X-Received: by 2002:a05:600c:2152:b0:3d9:ecae:853f with SMTP id
 v18-20020a05600c215200b003d9ecae853fmr24845082wml.3.1674492320520; 
 Mon, 23 Jan 2023 08:45:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003d9862ec435sm12086088wms.20.2023.01.23.08.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 08:45:20 -0800 (PST)
Message-ID: <1086b35f-f085-617d-6b98-17e57bd5889d@linaro.org>
Date: Mon, 23 Jan 2023 17:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
 <be7dae6f-30d6-a6c6-af3c-4d826b39de07@linux.microsoft.com>
 <767e54ca-53f4-7092-6171-2689e46709b8@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <767e54ca-53f4-7092-6171-2689e46709b8@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 23/1/23 17:09, Evgeny Iakovlev wrote:
> 
> On 1/23/2023 16:59, Evgeny Iakovlev wrote:
>>
>> On 1/23/2023 16:21, Philippe Mathieu-Daudé wrote:
>>> On 23/1/23 15:43, Evgeny Iakovlev wrote:
>>>>
>>>> On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
>>>>> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>>>>>> UART should be enabled in general and have RX enabled specifically 
>>>>>> to be
>>>>>> able to receive data from peripheral device. Same goes for 
>>>>>> transmitting
>>>>>> data to peripheral device and a TXE flag.
>>>>>>
>>>>>> Check if UART CR register has EN and RXE or TXE bits enabled before
>>>>>> trying to receive or transmit data.
>>>>>>
>>>>>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>>> ---
>>>>>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>>>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>>>
>>>>>> +static inline bool pl011_can_transmit(PL011State *s)
>>>>>> +{
>>>>>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>>>>> +}
>>>>>> +
>>>>>>   static void pl011_write(void *opaque, hwaddr offset,
>>>>>>                           uint64_t value, unsigned size)
>>>>>>   {
>>>>>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr 
>>>>>> offset,
>>>>>>         switch (offset >> 2) {
>>>>>>       case 0: /* UARTDR */
>>>>>> -        /* ??? Check if transmitter is enabled.  */
>>>>>> +        if (!pl011_can_transmit(s)) {
>>>>>> +            break;
>>>>>> +        }
>>>>>>           ch = value;
>>>>>>           /* XXX this blocks entire thread. Rewrite to use
>>>>>>            * qemu_chr_fe_write and background I/O callbacks */
>>>>>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>>>>>       PL011State *s = (PL011State *)opaque;
>>>>>>       int r;
>>>>>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>>>>>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>>>>>
>>>>> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>>>>>
>>>>> Otherwise:
>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>
>>>>
>>>> Thanks! There's already a pl011_can_receive though, its the 
>>>> pl011_can_transmit that's new :)
>>>
>>> pl011_can_receive() returns the number of bytes that pl011_receive() 
>>> can accept, pl011_can_transmit() returns a boolean.
>>
>>
>> Hm, no, pl011_can_receive never actually returned the number of bytes. 
>> It's a boolean value as an int. Which is a bug, because 
>> qemu_chr_fe_set_handlers expects it to return the byte count, not a 
>> 0/1 value.
>>
>> I'll fix it then.
> 
> 
> Actually, no, i spoke too soon. qemu_chr_fe_set_handlers indeed expects 
> a number of bytes from pl011_can_receive, but pl011_can_receive also 
> deliberately gives it 1 and not how many bytes are there in queue 
> really, because everything else on the receive code path is written with 
> an assumption to only accept 1 element at a time (see pl011_put_fifo).

That would be great if we had a model actually using the FIFO, but
since nobody complained about it ...

> If we want to optimize this part, we would need to change that 
> assumption. That should better be done as a separate change though, 
> which i can send later.
No problem, this patch is fine. Thanks!

