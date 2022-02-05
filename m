Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5424AACF6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:03:01 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGU55-0003r8-U5
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGU2C-0002yi-6G
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:00:00 -0500
Received: from [2a00:1450:4864:20::430] (port=43626
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGU2A-0007RH-4Q
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 17:59:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id c19so3284382wrb.10
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 14:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z+owL9mTy8zPFTM5wHRFfsX0Oe6aLrEeBuSxWfWsnSI=;
 b=fYI8DJlzCNqlUlOR06VWF5Vh/UVSJ65QAIT16+VL1lRZPRJHJ4jEI9dtWVq4gkwRPy
 SqIvkAxCeTS7rzgJzMfnaw7l8INXhgeymFbgcU92fu03J9KRJRDv8B9U/eYeSwsdyAoK
 TvXPeh9Mvox8gGCDH+0ukApRwDGotk5wVTc5WEkA8f4eLHDnfU1LwvgwRcrijXYebkmZ
 hFfApibETkc2K0NShVwhYsiPTNGfQ3Hz5/kcWNXEBGogA/5G3zm4QhijdWfIM1Rnn56s
 77hrpcD0HnZYUbxj/FvR8hu4Eo8BQVCaUzFIt81pINBRQ7yUBG8FMENRwOWZS4Gdny5g
 vAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z+owL9mTy8zPFTM5wHRFfsX0Oe6aLrEeBuSxWfWsnSI=;
 b=x2P9KWQruYv61IAh//kFYsxvXvXtwnCVXq+9J3WB88+Ngn0022drgu+uOPUTOjKq9i
 ffv7sAkW5KxxIBhfdCz2hDIBYm4N4kMG3nmXyRmuz9Q//Mmr4rNuuPrpjK5EiCIDwb9W
 2NTabY/AW8KWQKwxxo7jwTrphOPs8FwcpXOAW4cJjU5SbNiZOqClFbecAfHCzbmjUHph
 dEWI+xwU4ni/MKFVUbvNpCIMItsmaqHIppEDzioIdB2akMH5yVnjeqylcEc6tKXxWi8o
 gVRxnGoI+7cFx0Wx/CfZmOIA3SLKFJTfvrDNFVLLDUMf9viN3wPkwU2F5EVvnDZm15ji
 b8zA==
X-Gm-Message-State: AOAM530UQSoe2j9qGM49UGXte+hDl2j0fgaVYp6VSV+8Cw6AcyfBYAm3
 IleOB2jvSKugx2GQD3HVyEE=
X-Google-Smtp-Source: ABdhPJxHEmptcrcWo6MAUJh5q8xVOb6WxapxXTuE/y7KV13cgUiDLfiL5d5ls/sUKBcp1/zWzVHunw==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr4501816wri.208.1644101996713; 
 Sat, 05 Feb 2022 14:59:56 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t4sm5523934wro.71.2022.02.05.14.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:59:56 -0800 (PST)
Message-ID: <77529e38-5ae5-5df1-4608-35ae02f9d627@amsat.org>
Date: Sat, 5 Feb 2022 23:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] isa/piix4: Resolve RTCState attribute
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Thomas Huth <thuth@redhat.com>
References: <20220205175913.31738-1-shentey@gmail.com>
 <20220205175913.31738-2-shentey@gmail.com>
 <CAFEAcA_y69=iXMH75dHeNkxMa038Z7Xk63GW9fdcAFHJSWS=sA@mail.gmail.com>
In-Reply-To: <CAFEAcA_y69=iXMH75dHeNkxMa038Z7Xk63GW9fdcAFHJSWS=sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/2/22 19:53, Peter Maydell wrote:
> On Sat, 5 Feb 2022 at 18:05, Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Assuming that mc146818_rtc_init() is "syntactic sugar" for code that could
>> be converted into configuration in the future, this patch is a step towards
>> this future by freeing piix4 to care about the inner details of mc146818.
>>
>> Furthermore, by reusing mc146818_rtc_init(), piix4's code becomes more
>> homogenious to other code using the mc146818. So piix4 can be refactored in
>> the same way as code already using mc146818_rtc_init().
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/isa/piix4.c | 15 +--------------
>>   1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index 0fe7b69bc4..08b4262467 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -46,7 +46,6 @@ struct PIIX4State {
>>       qemu_irq cpu_intr;
>>       qemu_irq *isa;
>>
>> -    RTCState rtc;
>>       /* Reset Control Register */
>>       MemoryRegion rcr_mem;
>>       uint8_t rcr;
>> @@ -193,22 +192,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>>       i8257_dma_init(isa_bus, 0);
>>
>>       /* RTC */
>> -    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>> -    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>> -        return;
>> -    }
>> -    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
>> +    mc146818_rtc_init(isa_bus, 2000, NULL);
>>
>>       piix4_dev = dev;
>>   }
>>
>> -static void piix4_init(Object *obj)
>> -{
>> -    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
>> -
>> -    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
>> -}
>> -
>>   static void piix4_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -233,7 +221,6 @@ static const TypeInfo piix4_info = {
>>       .name          = TYPE_PIIX4_PCI_DEVICE,
>>       .parent        = TYPE_PCI_DEVICE,
>>       .instance_size = sizeof(PIIX4State),
>> -    .instance_init = piix4_init,
>>       .class_init    = piix4_class_init,
>>       .interfaces = (InterfaceInfo[]) {
>>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> 
> This looks like it's going backwards from the way we'd usually
> write code for devices that contain other devices these days.
> The "we have an init function that does stuff" is the older
> style. The newer style has the inner-device as an embedded
> struct in the container-device struct, which is initialized,
> configured and realized using standard functions like object_initialize
> and qdev_realize. (I do wonder whether that ought to be
> object_initialize_child() here, incidentally, but haven't checked the
> details to be certain.)
> 
> The existing uses of mc146818_rtc_init() are mostly in older
> code, and also in board-initialization code, which traditionally
> didn't have a convenient struct to embed the device-struct into.
> hw/isa/vt82c686.c is the only use in another device model
> (which could in theory be refactored to the embed-the-device-struct
> style, though the benefit of making the change isn't large, which
> is one reason we still have the mix of both in the tree).

I agree with Peter. The "future" is to remove the ${device}_init()
helpers. Some contributors are helping toward that goal, but 1/ it
involve work and 2/ there is no coordination; this is a "best effort"
project maintenance.
Maybe we should at least list these 'to be removed' functions as a
bit-sized task in GitLab issues.

