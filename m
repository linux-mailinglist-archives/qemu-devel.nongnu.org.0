Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FC6A92FE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY10P-0003cj-5v; Fri, 03 Mar 2023 03:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY10M-0003T4-L4; Fri, 03 Mar 2023 03:43:06 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY10K-0008FI-QF; Fri, 03 Mar 2023 03:43:06 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17213c961dfso2278122fac.0; 
 Fri, 03 Mar 2023 00:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIo+pkip5lYuv2vUa2LuU2AO82uWVIJugAU8jKRQcKA=;
 b=jepWUpzdije5vO3HMtOP1TTJQ/PY4pjp4/9+JHGopUseEp+38EvbShSk44etlQjFRB
 1C01LE8U8YMTc4NWa69dokB0rLoV5FONn5ICTK74w1XQxq1B3mrbhIwmJjJB4CJkqpgi
 8fYhhYKpB5iPfb2PRi7aii4zb+GUpqFimdLyWGUhAChggM+GQ0i0e2i94MfeIZXq/xMg
 96j/6GNEEPmPp39qmKcGuTGowra4T+1Jn36Y31sc009YgaExXwwRDEfW7NfmeKBpKySi
 iK0c2HwmAJQxknMnKGZwcUe0npNQ3Pg3xsWFlwrjMNL+WXn5iAHYH7HVV82zNFwMjsSQ
 gKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIo+pkip5lYuv2vUa2LuU2AO82uWVIJugAU8jKRQcKA=;
 b=uisKncW0saSue9sBtkgNK522EMrF9xsceWiT08msnXXwX8ywiB4E2yKgxXAc6Z5uXo
 CrEeT6lsWOJrKcOy/b3w0genVMKO5FKPJH1VaR8xNeRmsMFxz1dEpZP4NQjeU+3N9xBP
 p0xrYAUdGWhdb6Qfj+qTcs3AwAOy3gX6TCBdsZ4GvPBa0c8BiydMocIX22n7u4C6aYg4
 00JBgQTtGGjZ+0ioEIuWXpQC8yOYxJY+TwU20WOcJ5/QcoHXOFK6ICvUQv+vsJBAUIrw
 8/OK38Kq+QNd6AMCV2bludHcRIFKXmRhLI8gF52gkBKJ9mnpOZl2L0Eewr5gwCYocFto
 K5Zg==
X-Gm-Message-State: AO0yUKU4JkTQQjZNjEn4zWiexkSrKFhx8xkcUX8Gg3cTGUjN14sUqm4c
 uUAb/uCWpuyE/g4ifYR6D/g=
X-Google-Smtp-Source: AK7set/SZozapYbdZuGBG2CnlFYjprKqk2NZYrRRFQR59gYPQeCKk1DmryjcJj3q9HZavM+782zAEw==
X-Received: by 2002:a05:6870:1491:b0:16a:c954:fa3e with SMTP id
 k17-20020a056870149100b0016ac954fa3emr576879oab.18.1677832978520; 
 Fri, 03 Mar 2023 00:42:58 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 eb37-20020a056870a8a500b0017630fe87e5sm766865oab.33.2023.03.03.00.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 00:42:58 -0800 (PST)
Message-ID: <214cdac9-fb8d-03f5-2a23-b8ecee8f3fbf@gmail.com>
Date: Fri, 3 Mar 2023 05:42:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] pnv_phb4_pec: Keep track of instantiated PHBs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-2-fbarrat@linux.ibm.com>
 <e6ea9eda-51be-df8e-5711-73b944b52944@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e6ea9eda-51be-df8e-5711-73b944b52944@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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



On 3/2/23 19:21, Philippe Mathieu-Daudé wrote:
> Hi Frederic,
> 
> On 2/3/23 17:37, Frederic Barrat wrote:
>> Add an array on the PEC object to keep track of the PHBs which are
>> instantiated. The array can be sparsely populated when using
>> user-created PHBs. It will be useful for the next patch to only export
>> instantiated PHBs in the device tree.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
>>   hw/ppc/pnv.c                   |  1 +
>>   include/hw/pci-host/pnv_phb4.h |  2 ++
>>   3 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 43267a428f..97c06bb0a0 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
> 
>> +static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>> +                                           int stack_no,
>> +                                           Error **errp)
>>   {
>>       PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>> @@ -128,8 +128,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>                               &error_fatal);
>>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>> -        return;
>> +        return NULL;
>>       }
>> +    return phb;
>>   }
> 
> 
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index 28d61b96c7..0b72ef1471 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -185,6 +185,8 @@ struct PnvPhb4PecState {
>>       /* PHBs */
>>       uint32_t num_phbs;
>> +#define MAX_PHBS_PER_PEC        3
>> +    PnvPHB *phbs[MAX_PHBS_PER_PEC];
>>       PnvChip *chip;
>>   };
> 
>  From QOM PoV, better would be to 'embed' the PnvPHB structure (not only
> a pointer to it), and initialize the PnvPHB instance calling
> object_initialize_child() instead of qdev_new().


We were doing something similar in this PHB controllers one year ago. The
reason we moved to host pointers instead of using embed structures was to
allow user-created phbs. There's no way of telling beforehand if the user
wants one, two or three PHBs in the PEC.


Thanks,

Daniel

> 
> See for example the recent conversion of OHCISysBusState in commit
> 01c400ae43 ("hw/display/sm501: Embed OHCI QOM child in chipset").
> 
> Regards,
> 
> Phil.

