Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E38B4CE549
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:34:05 +0100 (CET)
Received: from localhost ([::1]:53150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVTw-0001Pn-Dx
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQVSN-0000WA-EH
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:32:28 -0500
Received: from [2607:f8b0:4864:20::432] (port=36705
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQVSL-0005ki-Sz
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:32:27 -0500
Received: by mail-pf1-x432.google.com with SMTP id z16so10027940pfh.3
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xj20ug0JWc6gpx3h9za5X/lBMCyPwP33KnZUMJL2aL8=;
 b=DzQbM+WluDiSTfVo75OC+Vlp6KxA6SLCbZaZHLletacqduX+HF3NTIBI5ACG56KG7Z
 uz3zbyesdLkxjMlwxElkMYUGNbduqZk7wJdtB7niwXZGobQFla7gGfbSwvRcKWz1VYDN
 wcfHI1VzoZUP3iOa/7gq5gTNhy6ZAp++bsh7+nWmtQOftJNIzuOMIp2s0k3JKeytdVrf
 GnsWM7jtZ/bt+WE9Taw3OgwaIvvWvR2wIkfxFBLJMnzwHOT/FqCxTB6t9gt2v5Y3if0U
 dUatKu3MWrhDY7TLlHW7TfPq3ZvDubL+wKkJgxQgpBfZAyGBxvLsqkag94q3dc7kgY23
 e0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xj20ug0JWc6gpx3h9za5X/lBMCyPwP33KnZUMJL2aL8=;
 b=qzj5HJ1Y46COlKd8j5+q8M4Ik4SFaLWp/4SaL5QfoOE6CH8vm2xQKgsjY2yWvIT6+j
 kssJNQTZAtR/gve1Af7z3KIOFtPBEs+VfqwD3q2Tgds+zIdo0B1wM2RQeqkQRoggTJL+
 VfdbwY4zOaamwJJdAvIuI1vTRbbSRkQntvWkjfsSLeXlUlXoVrrFirxZz+k2w9HLMo3Y
 8/O3mlmCIEnlh7akpTBkDWr5ZVAnN3SArVWk/Oiuw8EPSP6eRe/5NhHPQgnYGPswLrN6
 T5gbUymg1Alt5S++LZVhWurawHXA2fipF9mfvJwi9BAY/MM6DwAxx0BP9hJ9H5D98gtC
 umNA==
X-Gm-Message-State: AOAM530N2Iwb+l5icsUG/egEqWFo/As2RLKNeAG5QTuUoQQkvDRRfSVj
 c7pVdCLzCZ4ezRdHgdug+jU=
X-Google-Smtp-Source: ABdhPJyQau642IoZky6cMBGC4iP6foOJjzXuC+/yzNlXYNNrDi9+hrSsNUSDM2DtTNDW0ZyC8lTTBQ==
X-Received: by 2002:a05:6a00:bdb:b0:4f1:10fd:ab1b with SMTP id
 x27-20020a056a000bdb00b004f110fdab1bmr4241455pfu.6.1646490744012; 
 Sat, 05 Mar 2022 06:32:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o125-20020a625a83000000b004f6d32cd541sm2885921pfb.152.2022.03.05.06.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:32:23 -0800 (PST)
Message-ID: <10a0c5d5-7677-7dcd-8be5-3fd0d129a958@gmail.com>
Date: Sat, 5 Mar 2022 15:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 07/12] mos6522: add register names to register
 read/write trace events
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
 <739406f5-56a7-c94f-c800-0c050c8c936f@gmail.com>
 <f61039bd-59e1-1850-62f0-58627e5bba0c@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <f61039bd-59e1-1850-62f0-58627e5bba0c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/3/22 15:17, Mark Cave-Ayland wrote:
> On 24/02/2022 14:04, Philippe Mathieu-Daudé wrote:
> 
>> On 24/2/22 12:59, Mark Cave-Ayland wrote:
>>> This helps to follow how the guest is programming the mos6522 when 
>>> debugging.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   hw/misc/mos6522.c    | 10 ++++++++--
>>>   hw/misc/trace-events |  4 ++--
>>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>>> index 093cc83dcf..aaae195d63 100644
>>> --- a/hw/misc/mos6522.c
>>> +++ b/hw/misc/mos6522.c
>>> @@ -36,6 +36,12 @@
>>>   #include "qemu/module.h"
>>>   #include "trace.h"
>>
>> I'd feel safer adding:
>>
>>    #define MOS6522_IOSIZE 0x10
>>
>>> +static const char *mos6522_reg_names[16] = {
>>
>> Then here:
>>
>>     ... mos6522_reg_names[MOS6522_IOSIZE] ...
>>
>>> +    "ORB", "ORA", "DDRB", "DDRA", "T1CL", "T1CH", "T1LL", "T1LH",
>>> +    "T2CL", "T2CH", "SR", "ACR", "PCR", "IFR", "IER", "ANH"
>>> +};
>>> +
>>>   /* XXX: implement all timer modes */
>>>   static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>>> @@ -310,7 +316,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, 
>>> unsigned size)
>>>       }
>>>       if (addr != VIA_REG_IFR || val != 0) {
>>> -        trace_mos6522_read(addr, val);
>>> +        trace_mos6522_read(addr, mos6522_reg_names[addr], val);
>>>       }
>>
>> And finally:
>>
>> -- >8 --
>> @@ -478,7 +478,8 @@ static void mos6522_init(Object *obj)
>>       MOS6522State *s = MOS6522(obj);
>>       int i;
>>
>> -    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522", 
>> 0x10);
>> +    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522",
>> +                          MOS6522_IOSIZE);
>>       sysbus_init_mmio(sbd, &s->mem);
>>       sysbus_init_irq(sbd, &s->irq);
>>
>> ---
>>
>> Regardless:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I've done this in v3 but using MOS6522_NUM_REGS rather than 
> MOS6522_IOSIZE since IO size != number of registers at a higher level 
> (e.g. where the 6522 registers are mapped in CUDA/mac_via with a stride).

OK, thanks. R-b stands for v3.

