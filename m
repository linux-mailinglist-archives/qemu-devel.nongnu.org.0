Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27035416E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:02:57 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTh6d-0007dL-Jp
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh5T-0006xj-HN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:01:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh5H-0007bF-5V
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:01:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id u15so25149322wru.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F6pPkgs92eEukiJIDp9CAWLe1K48tjPP7OXuztkDMyI=;
 b=pNAmHdqh8zpKGq40v9mTK6YG2UTLA6H1EZHgst5gbUv2lUIQfEBf4xfW4YYA0RKpEP
 CpvZMEBbdxTT54T/4wrOyR+JcsGYTZXRyHtAxpKHSEFsDRws4U1+DuICWV2iHm8rExXE
 Wb6zGnDHS55e5DrJvJ2lQOSxjYJbRK+MkeQIMGYV4gPg+REOS/WPzviJvXvOeyTdSe0I
 6xTknQv09iyzs4JPbDq5ownB8Ym/L7mdLP88K4RzQmhtjfZS6kk2Vch1yLqz3rt3s6PM
 tjZiee1cZGMhUIIiKNIC9CiwhvH3Yv/w7cE/bygBLGiQyEj1JYqzNoeJJRIfSHcU8LtN
 T9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F6pPkgs92eEukiJIDp9CAWLe1K48tjPP7OXuztkDMyI=;
 b=z2JqotznvDFQx9U1JGkSDDM7wdcuiAT3hW/5M8fGaLhjlhzIW61eri/EJzDQVC/nN3
 RrvZ+81hxQZ9tgIn9kHg5vyEji322nnZLrPZ7Iil0+0FRD1nfOOdmIxmTc+/ptwe3hwG
 xq0ItObUkCCtsZnmT3WxsPBUvjQL+Cf+zpS66Cf05UYCAb+NnI4HEq+IhXTAu2OfDP+E
 DBFEagmytkRrmqROagWM+JnlPExBan/lZEVV4rh4JDpLsww9EO4iUOBDHnqkAi1qv5dB
 ugMB19ynlORq8+OGwhrFvag+aJI9NhCBuNfH/A9MnDvVLZOzRvFA5BC/qcpjszfQ1hki
 cJlw==
X-Gm-Message-State: AOAM531IUCMJbFGs0z7XxUnZNzYCf2umzmTrFxkf5bDqKCpGWfuXURhC
 gI65VFzvFOVIUqbYxf3hcP8=
X-Google-Smtp-Source: ABdhPJz8CdhSpSn0CBOV4xkmL3HVb8hmgM9aqcFm3Fz43ZBPZAwFrQRf5+0vVnVeAVjTu4Xf1lmQrQ==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr10287935wrc.102.1632474089109; 
 Fri, 24 Sep 2021 02:01:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z13sm8657522wrs.90.2021.09.24.02.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 02:01:28 -0700 (PDT)
Message-ID: <8e879ded-3a4e-b12f-1479-62401af06927@amsat.org>
Date: Fri, 24 Sep 2021 11:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 18/20] nubus: add support for slot IRQs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-19-mark.cave-ayland@ilande.co.uk>
 <2e859345-2285-6b29-a3a0-7c888f73cc93@amsat.org>
 <43591fdf-045b-6c33-d54b-a3f18f0c5d58@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <43591fdf-045b-6c33-d54b-a3f18f0c5d58@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 9/24/21 09:06, Mark Cave-Ayland wrote:
> On 23/09/2021 10:49, Philippe Mathieu-Daudé wrote:
> 
>> On 9/23/21 11:13, Mark Cave-Ayland wrote:
>>> Each Nubus slot has an IRQ line that can be used to request service 
>>> from the
>>> CPU. Connect the IRQs to the Nubus bridge so that they can be wired 
>>> up using qdev
>>> gpios accordingly, and introduce a new nubus_set_irq() function that 
>>> can be used
>>> by Nubus devices to control the slot IRQ.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   hw/nubus/nubus-bridge.c  | 2 ++
>>>   hw/nubus/nubus-device.c  | 8 ++++++++
>>>   include/hw/nubus/nubus.h | 6 ++++++
>>>   3 files changed, 16 insertions(+)
>>
>>>   static Property nubus_bridge_properties[] = {
>>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>>> index 280f40e88a..0f1852f671 100644
>>> --- a/hw/nubus/nubus-device.c
>>> +++ b/hw/nubus/nubus-device.c
>>> @@ -10,12 +10,20 @@
>>>   #include "qemu/osdep.h"
>>>   #include "qemu/datadir.h"
>>> +#include "hw/irq.h"
>>>   #include "hw/loader.h"
>>>   #include "hw/nubus/nubus.h"
>>>   #include "qapi/error.h"
>>>   #include "qemu/error-report.h"
>>> +void nubus_set_irq(NubusDevice *nd, int level)
>>> +{
>>> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
>>> +
>>
>> A trace-event could be helpful here, otherwise:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>> +    qemu_set_irq(nubus->irqs[nd->slot], level);
>>> +}
> 
> I think adding a trace event here would just be too verbose 
> (particularly if you have more than one nubus device) and not 
> particularly helpful: normally the part you want to debug is the in the 
> device itself looking at which constituent flags combine to raise/lower 
> the interrupt line. And once you've done that then you've already got a 
> suitable trace-event in place...

But devices accessing the bus are not aware of which devices are plugged
onto it. Wait, what is suppose to call nubus_set_irq()? Devices on the
bus, to propagate the interrupt up to the CPU? OK so then the trace
event is irrelevant indeed. I understood this API as any external device
could trigger an IRQ to device on the bus. I wonder if renaming as
nubus_device_set_irq() could make it clearer. Or even simpler, add
a comment in "hw/nubus/nubus.h" explaining what nubus_set_irq() is for
to avoid any confusion, and we are good.

