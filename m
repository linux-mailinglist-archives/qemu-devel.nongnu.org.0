Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE688547637
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 17:47:41 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o03Ku-0000v3-AN
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 11:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o03II-0007Zb-DT; Sat, 11 Jun 2022 11:44:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o03IG-0004bW-Qz; Sat, 11 Jun 2022 11:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PzGOjgSatpZMu780VJSgs0LlhuHE+UFLy63x3Xp1V2s=; b=naidIl6IRYEZPVKy6lAN9Ad5hq
 hjpPIkmNHP279rOEuVh0KJsibdcbuRr5hq3/mlxzwyBHY5p1cRCvVOCWoxMDTW+4l5wk2DafxCBHT
 mEA3YDPki+ciH7ln6yJpxNWq6tBAa6jJZR1qNlVYjWA0SvFV+qJyPoR6fql8gHh+GXy/wIsX3l7UB
 8lZJcOsro66e0MlpHWblmxf0kA3kP+UgQbKE1g6F87YNETXJAT7FAjtnzCd2+fPLwzds0aS8Hmm+J
 Y7YYVgVIah3pHUpaYxEpUIGp/jk1nxV5ZPhcnHRZUjMeOZs/nPukfeZs3Vn3m/AunwptpxDMZmoFq
 /cVPtSkGHBtKWXRhaS6TcVDR7t47iO+66TW4yd38vF0943LAg9MOZhBT7GIwUFnIl9G9mttfkikoG
 P14nE+WlyOJc5enaTohowVNnzyUO0KT2zS8g2McfrHxBWCrzjO/4TNBcExqA+NJKqzvel6KxUswOs
 mX+ccIKNMkbKtEGX/0W+oIxW/G6zfQtDdN9Z0eSZWl9QaaOUi6GLWhmZvfIRV760uJgPbhECnpH/J
 mJxmhn4a4B4f7UPhfedIL6fhZRJJ2maQqyleQiYt+P4+bLVtXeYpqY1GL+CLKK1bnqIlUqtn8slT1
 E8w1zmIUPvsbwDtwfQRmmJROwhrkusmnEItT2aKvI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o03Gu-000Ano-KM; Sat, 11 Jun 2022 16:43:36 +0100
Message-ID: <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
Date: Sat, 11 Jun 2022 16:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
In-Reply-To: <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/06/2022 08:17, Mark Cave-Ayland wrote:

> On 09/06/2022 12:18, Peter Maydell wrote:
> 
>> On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>
>>> This enables the IRQ to be wired up using qdev_connect_gpio_out() in
>>> lasips2_initfn().
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/input/lasips2.c         | 8 ++++----
>>>   include/hw/input/lasips2.h | 2 ++
>>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
>>> index 6849b71e5c..644cf70955 100644
>>> --- a/hw/input/lasips2.c
>>> +++ b/hw/input/lasips2.c
>>> @@ -247,16 +247,14 @@ static void lasips2_port_set_irq(void *opaque, int level)
>>>
>>>   LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>>>   {
>>> -    LASIPS2State *s;
>>>       DeviceState *dev;
>>>
>>>       dev = qdev_new(TYPE_LASIPS2);
>>>       qdev_prop_set_uint64(dev, "base", base);
>>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> -    s = LASIPS2(dev);
>>> +    qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>>>
>>> -    s->irq = irq;
>>> -    return s;
>>> +    return LASIPS2(dev);
>>>   }
>>>
>>>   static void lasips2_realize(DeviceState *dev, Error **errp)
>>> @@ -285,6 +283,8 @@ static void lasips2_init(Object *obj)
>>>
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
>>> +
>>> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>>>   }
>>>
>>>   static Property lasips2_properties[] = {
>>> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
>>> index 7e4437b925..d3e9719d65 100644
>>> --- a/include/hw/input/lasips2.h
>>> +++ b/include/hw/input/lasips2.h
>>> @@ -22,6 +22,8 @@ typedef struct LASIPS2Port {
>>>       bool irq;
>>>   } LASIPS2Port;
>>>
>>> +#define LASIPS2_IRQ    0
>>
>> If you find yourself #defining names for IRQ lines then this is
>> probably a sign you should be using named GPIO lines :-)
> 
> Yeah that's something I've done a few times here, mainly to have just one "set IRQ" 
> function rather a separate one for both keyboard and mouse. It takes a bit more work, 
> but I can certainly separate them out.

Looking at this again, the gpio being defined here actually is the (only) lasips2 
output IRQ, and so should be left unnamed.

The reason for adding LASIPS2_IRQ was so that the gpio connection process looked like:

     qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);

instead of:

     qdev_connect_gpio_out(dev, 0, irq);

Would you still prefer for me to simply hardcode 0 here and drop the LASIPS2_IRQ 
define in this case since there is only one output IRQ?

>> Alternatively, maybe use sysbus_init_irq()? By convention the
>> only sysbus IRQ on a device is generally "its IRQ line".
> 
> Thinking longer term about sysbus, I can see that sysbus_init_irq() would be one of 
> the top entries on my list of things to go. For that reason I'd like to stick to 
> using gpios here :)


ATB,

Mark.

