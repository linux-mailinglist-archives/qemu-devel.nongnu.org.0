Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D78545D40
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:25:00 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZ0t-0005lT-8m
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYtl-0002f6-Hm; Fri, 10 Jun 2022 03:17:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYth-0000Ku-WD; Fri, 10 Jun 2022 03:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57JoLv9FhV6c3SFCut7k3G6h5Xbsx4WamsD1wNcIA9c=; b=DWqrUMfg4ybZNqmoyNiGXJ7otB
 42jvVdUj6gFXxsismm3Ofu39DeJmaOthYmZk8vwBjRHvJZYx01gW7FPa66QXzcqvMzJ80AsTFpRMK
 tO9EzhWZOiAsKnWVO1QigsFpAQg5mJdMzYiwiQpM6XEdxOrE98X9sGFsa5jnT7GOtn48oLNq/ycXE
 UocQ2qWJBCftZw12ZraxIGmz/5QbrwWBF94aO8k83TnriY9be/iDr2NVPTvywVM08se8wkUjRSANG
 VD9KtGPuxbLymtCZASDAaVEMpnnKavNVPycyMsKMnTSMjIWX1NPguj8FqMjP55pM/Q408QRswp58F
 G7XEmhgg3qAiJRKwnZZpwyuRAOlYVtoAlonH0AOjAf98cS/1h7CHlM3tPqMDPZ5V+yXWt+sO8d/8X
 yKRcCWqqTm8TPLkdbKJNliDYZesvx6BGM2mY86xmByj4L62/itJWvnGay8wTnOQDWOPNlZZ3QnD/8
 rpNxmOxARNbpgkxpr/8kZ4bQvOzDHxXh6KP5Y5JEHwRE1xjALN+yqPkPSduCiQeCcT0EyPvqdi+kM
 5mA0stmLFJpGAMaBMK813Zbn/uhXj11KpHOYxKG5MH90wAOJbo3vZ6riDyAhfqE73zD+qiW8qQHca
 ExWomPhQytYLt08emY8EJ2pLOW0//XjJAITfCYa7o=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYsP-0001Vn-TM; Fri, 10 Jun 2022 08:16:18 +0100
Message-ID: <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
Date: Fri, 10 Jun 2022 08:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 09/06/2022 12:18, Peter Maydell wrote:

> On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This enables the IRQ to be wired up using qdev_connect_gpio_out() in
>> lasips2_initfn().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/lasips2.c         | 8 ++++----
>>   include/hw/input/lasips2.h | 2 ++
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
>> index 6849b71e5c..644cf70955 100644
>> --- a/hw/input/lasips2.c
>> +++ b/hw/input/lasips2.c
>> @@ -247,16 +247,14 @@ static void lasips2_port_set_irq(void *opaque, int level)
>>
>>   LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>>   {
>> -    LASIPS2State *s;
>>       DeviceState *dev;
>>
>>       dev = qdev_new(TYPE_LASIPS2);
>>       qdev_prop_set_uint64(dev, "base", base);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> -    s = LASIPS2(dev);
>> +    qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>>
>> -    s->irq = irq;
>> -    return s;
>> +    return LASIPS2(dev);
>>   }
>>
>>   static void lasips2_realize(DeviceState *dev, Error **errp)
>> @@ -285,6 +283,8 @@ static void lasips2_init(Object *obj)
>>
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
>> +
>> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>>   }
>>
>>   static Property lasips2_properties[] = {
>> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
>> index 7e4437b925..d3e9719d65 100644
>> --- a/include/hw/input/lasips2.h
>> +++ b/include/hw/input/lasips2.h
>> @@ -22,6 +22,8 @@ typedef struct LASIPS2Port {
>>       bool irq;
>>   } LASIPS2Port;
>>
>> +#define LASIPS2_IRQ    0
> 
> If you find yourself #defining names for IRQ lines then this is
> probably a sign you should be using named GPIO lines :-)

Yeah that's something I've done a few times here, mainly to have just one "set IRQ" 
function rather a separate one for both keyboard and mouse. It takes a bit more work, 
but I can certainly separate them out.

> Alternatively, maybe use sysbus_init_irq()? By convention the
> only sysbus IRQ on a device is generally "its IRQ line".

Thinking longer term about sysbus, I can see that sysbus_init_irq() would be one of 
the top entries on my list of things to go. For that reason I'd like to stick to 
using gpios here :)


ATB,

Mark.

