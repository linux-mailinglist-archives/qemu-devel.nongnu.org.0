Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A118C525FB5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:37:00 +0200 (CEST)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSfL-00011D-7a
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npSdW-0008Ka-T5; Fri, 13 May 2022 06:35:07 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:38876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npSdU-0004FU-RA; Fri, 13 May 2022 06:35:06 -0400
Received: by mail-qt1-x82f.google.com with SMTP id fu47so6478370qtb.5;
 Fri, 13 May 2022 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XmIsXPj4lKBZCvhM05b5Jn53tvM9nRvUPo30Su2jDGc=;
 b=k6RQZgDnldx3zrCMr0/Aj43lcLcdJ9Bl2QwRfgoXHwhRKeJUCR5Kt2f1FdYQoBAuhA
 a9gYqeFb679rMEnstpDkQYtHEVSH49owRw7kLuFCGUAMcR7ZnbDhoLvlHS++mlOKhXWQ
 8OXVGfRB7kiW02xLw/veX63HR8i9yQ1oI89Oj9qXh+6CClJbVMIKc6lyD2BmNkkCaiuW
 Hp8t5t9KodenQmjasC3aqWZ8JPwDwVDxd5Xma2867354m6BK2wpLC0aQ76adAUH18gG5
 BQaxcpMqXb/H9wqvCBs3h6wqCvt/QoVwr3TQJFDNKkIjR+xzw/vHEneMpcdvf8y+TuS9
 5y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XmIsXPj4lKBZCvhM05b5Jn53tvM9nRvUPo30Su2jDGc=;
 b=WQI7Hd+wUQlifa0SaePvpjxQqL4dfxNsm8QGbCC6VY8IV6itw1ib21a/BHGRYMNMYs
 4uVXdHbeAXMOgK2MRh0gg6JfV1Af9agtAg0EAgNGrih1I3TD0PLVfiIk/pPzQCnor3Ec
 QBGTjEGmLdwQd+PTWxT3fI62JkSDrm5wYQ4qKlHB96KMGM1DzazFBc+Opsx773nexFOp
 fRwWAl2hSm7Mv2k9iIQ4oAMTr35MGjbSq71bpXpLkB/wYabuYxYpZ1pBLLWeoXXK+TFM
 6NcMg797JpqkncAQ0Nm5SZPqlHlGUyIN46Zy3FAARt53E21ficEAVGvXdqci3QFZvpq5
 jK8g==
X-Gm-Message-State: AOAM531T+ARvMWbeG45INuzhUL48uuZFPU0LaU+vTDr7+F8hGyHmcNkn
 CrIQ7GmSC+uMimQhaztyggQX+ARL59xzH2N5l7I=
X-Google-Smtp-Source: ABdhPJyX2lkR9CJQuuL9m7vtkNetgWMRUvNlUymSEsjNr6mwV+CHHDpTMRnIngb+eKUh13Hq+08Vff/E0KTiJaJNhw0=
X-Received: by 2002:a05:622a:5d4:b0:2f3:cdb0:816a with SMTP id
 d20-20020a05622a05d400b002f3cdb0816amr3810165qtb.310.1652438103157; Fri, 13
 May 2022 03:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-2-shentey@gmail.com>
 <8b20e95a-33b3-929e-a94a-1d505ded174e@ilande.co.uk>
In-Reply-To: <8b20e95a-33b3-929e-a94a-1d505ded174e@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Fri, 13 May 2022 12:34:52 +0200
Message-ID: <CAG4p6K4eRHb6vw-_eosmtqjvYY0UaNjmVCtCESaVTvogqEWQVA@mail.gmail.com>
Subject: Re: [PATCH 01/11] hw/rtc/mc146818rtc: Inline isa_connect_gpio_out()
 and remove it
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 11. Mai 2022 10:24:58 UTC schrieb Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk>:
>On 05/05/2022 17:17, Bernhard Beschow wrote:
>
>> Commit 250263033c5343012b2cd6f01210ffb5b908a159 'isa: introduce wrapper
>> isa_connect_gpio_out' introduced it in 2016. Since then, its only user
>> remained mc146818rtc. Remove this one-off solution.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/isa/isa-bus.c     | 6 ------
>>   hw/rtc/mc146818rtc.c | 3 ++-
>>   include/hw/isa/isa.h | 1 -
>>   3 files changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
>> index 0ad1c5fd65..59eb1af9e3 100644
>> --- a/hw/isa/isa-bus.c
>> +++ b/hw/isa/isa-bus.c
>> @@ -85,12 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
>>       return isabus->irqs[isairq];
>>   }
>>   -void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned is=
airq)
>> -{
>> -    qemu_irq irq =3D isa_get_irq(isadev, isairq);
>> -    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
>> -}
>> -
>>   void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
>>   {
>>       assert(bus && dma8 && dma16);
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index f235c2ddbe..79c43391cb 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -972,7 +972,8 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_y=
ear, qemu_irq intercept_irq)
>>       if (intercept_irq) {
>>           qdev_connect_gpio_out(dev, 0, intercept_irq);
>>       } else {
>> -        isa_connect_gpio_out(isadev, 0, s->isairq);
>> +        qemu_irq irq =3D isa_get_irq(isadev, s->isairq);
>> +        qdev_connect_gpio_out(dev, 0, irq);
>>       }
>>         object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT=
(isadev),
>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>> index 034d706ba1..1b758ae1ab 100644
>> --- a/include/hw/isa/isa.h
>> +++ b/include/hw/isa/isa.h
>> @@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *ad=
dress_space,
>>                       MemoryRegion *address_space_io, Error **errp);
>>   void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
>>   qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
>> -void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isai=
rq);
>>   void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
>>   IsaDma *isa_get_dma(ISABus *bus, int nchan);
>>   MemoryRegion *isa_address_space(ISADevice *dev);
>
>Hi Bernhard,

Hi Mark,

>I've been tinkering again with trying to improve QEMU's ISA implementation=
 to use gpios, and actually I believe as per the comment in isa-bus.c that =
isa_connect_gpio_out() will be the preferred way to wire up ISA devices. So=
 really we should be trying to use this function more rather than removing =
it.
>
>BTW if you are interested in helping to work on ISA bus improvements, I ca=
n certainly come up with a TODO list of useful tasks :)

Yes, that'd be great!

As expressed earlier [1] I'd like to remove the isabus global in
isa-bus.c. Meanwhile, I implemented a POC [2]. While the result seems
to work for the PC and Malta boards, some of the changes required
don't seem quite clean. So yeah, I'd be interested in the bigger
picture regarding ISA improvements and would like to help out as time
permits, too.

Best regards,
Bernhard

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05955.html
[2] https://github.com/shentok/qemu/commits/isa

>
>ATB,
>
>Mark.

