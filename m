Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EED57299B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 01:03:36 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOul-000105-7d
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 19:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOOu-0003wc-Kw
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:30:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOOs-0003yE-Qk
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:30:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v16so13048473wrd.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D1nrpbVQc4na+LF8DaVMc4xDJEDtsUl9ox4IxP3GdXc=;
 b=kw8T3i7D5+VG17+BnpCXG6o02FK4XvU3aHP7zzx07S5pZcWNa/n02SQSf/4Gx90EVS
 +HgvLQfA/5WFmotGIpKIl19PkNx4cvdvvv7x9atGZlDvvi7oZimDUO08K4iD+2ARH9ri
 YiPdJUIrstj41Ntt+K1ncogF0Bqm7ZfZiOpfePm6N9BrKMGDhK0wFr4ss22bLfyBGMWP
 KiyeSKRaGX9Z1NApQ423rtDdVcxrgTownKavx3Jzxx+YcHdzCKp1Vi2ckiP6jPdK5b8N
 9hVdxHq1CWarU05fNGxnWegtViN/DCIghmT7yMluJejqNm6K4W5hGHBLxchf8gNEF2md
 CoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D1nrpbVQc4na+LF8DaVMc4xDJEDtsUl9ox4IxP3GdXc=;
 b=1VZHXfiDQTt5kLNW9EIvRpOxFILv78J8UCNA5YvWnz/ZqyY46JvClCw+Zds2Lrfbl2
 xFbg9KjZBrT3YjBQIW9hIL5glplt+qWyOTrvGW7V+f6Y1fNaNrqhFETeIKJ3NWqtITbF
 GEzHBn7CACsGC/in3l1L/tSddplfYZsQsGSVtZvhHlBvn1pwc3VG8rbItZnsTEzqWgz8
 atrCJtVk1tfPzgbf8lePLDpl2Of5OtXygu2p6L2ckIyh08g6pbcMoX0lsQdjqiBio+X8
 TO2xLWFu0QiP80/YGAKEnfoRP6huZaphglBnmmihUJnRomnUJrtiuFj379J87BfzncBE
 I6kQ==
X-Gm-Message-State: AJIora/vEeGw4K6Uz39+2S9wkXLYteXGJui0RSEvcVROGEZzX5IC3/h9
 UWVj7FUKvrPZaHW5YQbXdqs=
X-Google-Smtp-Source: AGRyM1sXBLVvIx0yvSK3x2i0WAm+YBX2EDKMlI+LFz4fLjBymsTgA9zy3Z+aAdmDNEiZwILDP9ZNrA==
X-Received: by 2002:a5d:59a9:0:b0:21d:7ee2:8f90 with SMTP id
 p9-20020a5d59a9000000b0021d7ee28f90mr197946wrr.598.1657665037028; 
 Tue, 12 Jul 2022 15:30:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfe70f000000b0021d65e9d449sm9490209wrm.73.2022.07.12.15.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 15:30:36 -0700 (PDT)
Message-ID: <e6b2e720-7322-c925-cf15-643794badd4a@amsat.org>
Date: Wed, 13 Jul 2022 00:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Makarov <ph.makarov@gmail.com>
Cc: qemu-devel@nongnu.org, Andrey Makarov <andrey.makarov@auriga.com>,
 Jeremy Linton <lintonrjeremy@gmail.com>, Pete Batard <pete@akeo.ie>
References: <20220624195206.671993-1-andrey.makarov@auriga.com>
 <CAFEAcA_xQd45CGsmU-_C4LcTP6M+5PfkgKOJuk2SSBVDbm7pyg@mail.gmail.com>
In-Reply-To: <CAFEAcA_xQd45CGsmU-_C4LcTP6M+5PfkgKOJuk2SSBVDbm7pyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

+Pete/Jeremy

On 26/6/22 12:16, Peter Maydell wrote:
> On Fri, 24 Jun 2022 at 21:54, Andrey Makarov <ph.makarov@gmail.com> wrote:
>>
>> All Raspberry Pi models 1-3 (based on bcm2835) have
>> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
>>
>>      /* dma channel 11-14 share one irq */
>>
>> which mismatched the Qemu model.
>> In this patch channels 0--10 and 11--14 are handled separately.
> 
> Is there any hardware documentation that says whether QEMU or
> the DTB is correct? The device tree is at best a secondary source...

There are 10 DMA channels, one is labelled "reserved".

EDK2 lists it too:
https://github.com/tianocore/edk2-platforms/blob/master/Platform/RaspberryPi/AcpiTables/AcpiTables.h#L57

I couldn't find any precise information regarding channels 11-14.

>> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
>> ---
>>   hw/arm/bcm2835_peripherals.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
>> index 48538c9360..3d808b0e31 100644
>> --- a/hw/arm/bcm2835_peripherals.c
>> +++ b/hw/arm/bcm2835_peripherals.c
>> @@ -322,13 +322,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>       memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
>>                   sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
>>
>> -    for (n = 0; n <= 12; n++) {
>> +    for (n = 0; n <= 10; n++) {
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>>                              qdev_get_gpio_in_named(DEVICE(&s->ic),
>>                                                     BCM2835_IC_GPU_IRQ,
>>                                                     INTERRUPT_DMA0 + n));
>>       }
>>
>> +    /* According to DTS, dma channels 11-14 share one irq */
>> +    for (n = 11; n <= 14; n++) {
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>> +                           qdev_get_gpio_in_named(DEVICE(&s->ic),
>> +                                                  BCM2835_IC_GPU_IRQ,
>> +                                                  INTERRUPT_DMA0 + 11));
> 
> You can't connect multiple qemu_irq lines to one like this.
> If the hardware behaves this way then you need to create
> an OR gate, wire all the lines from the devices to the
> OR gate inputs, and wire the OR gate output to the destination.
> 
> thanks
> -- PMM
> 


