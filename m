Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00EF545D5E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:28:48 +0200 (CEST)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZ4Z-0000RL-RB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYvm-0003Yl-Co; Fri, 10 Jun 2022 03:19:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYvj-0000T1-Vn; Fri, 10 Jun 2022 03:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmdXrMYTMf6GrBWr57NlxTf4t/PEUxzEzlLElENnzoc=; b=ilwnyx1qgGn/AJqoK3EY/2/CEE
 +bdtx7LAoGog8vKlbBHs/LHGpHIt7N2D/rBMKayrf+ZgZN6DzgctoOSWyMwmDGBjPYzpz0FsmWSXX
 91pSDyAmuWKO9uljqifqYt+XE5kKtC76lX+OBDUljby64IPEmbqDdmmxpWYbICXA0WOxoTorN8KHd
 Kpz8XAIfSeArEMJQ+F5OQDSnRBj8J+uKP0ZciV5ojB9F5rMTgeU6/clZd0tm+YCoZztzSFL75/eiY
 Qg0ZwfspworRKYD30zflC9b3gQdiWaC85gch1TcGu6PzSDFeNLhsa7hkgEFDAFSS75o656XcVBXRb
 Q/YFPPaTywRj9VMqr09s+OPBx78HZm9Xocukh+Wwy4VAeRllWKnWrrNrspN4WiF54JyZXEow+IXF7
 q/dn/WXBcGyPi4vctYi8ZhTFYnt19qKNfwrawj6GeJl0E55xRrJArACFUXDwor1wPfa1nxvM6sHbJ
 dV22f5+2t7XyCQa75+3KOU1eF8s/8yAiGKwbiVUisG94KS8eDrUve1gJ1GeR48Q7LtLq+vYAOtDcP
 E0jU1o9JlUrzimBlnYYERnfYCosqjERhdx/tVoGOOXrTopB+OxrHTxecHqnVSRZyiwPWBc/UHHNc0
 xU6q7NENijcgp0WdpWv19NDpda9sh0iACJI1NdTH8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYuS-0001Xz-TF; Fri, 10 Jun 2022 08:18:25 +0100
Message-ID: <d8edaa52-58ac-5604-e968-56aea214af95@ilande.co.uk>
Date: Fri, 10 Jun 2022 08:19:25 +0100
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
 <20220522181836.864-47-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA83dJAtnRskscBAk7qCXtA-xOS7LQR_uimaWgSbHuHivQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA83dJAtnRskscBAk7qCXtA-xOS7LQR_uimaWgSbHuHivQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 46/50] lasips2: switch over from update_irq() function to
 PS2 device gpio
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

On 09/06/2022 12:21, Peter Maydell wrote:

> On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> Add a qdev gpio input in lasips2_init() by taking the existing lasips2_port_set_irq()
>> function, updating it accordingly and then renaming to lasips2_set_irq(). Use these
>> new qdev gpio inputs to wire up the PS2 keyboard and mouse devices.
>>
>> At the same time set update_irq() and update_arg to NULL in ps2_kbd_init() and
>> ps2_mouse_init() to ensure that any accidental attempt to use the legacy update_irq()
>> function will cause a NULL pointer dereference.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/lasips2.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
>> index 644cf70955..12ff95a05f 100644
>> --- a/hw/input/lasips2.c
>> +++ b/hw/input/lasips2.c
>> @@ -117,6 +117,9 @@ static const char *lasips2_write_reg_name(uint64_t addr)
>>       }
>>   }
>>
>> +#define LASIPS2_KBD_INPUT_IRQ      0
>> +#define LASIPS2_MOUSE_INPUT_IRQ    1
>> +
>>   static void lasips2_update_irq(LASIPS2State *s)
>>   {
>>       trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
>> @@ -237,9 +240,10 @@ static const MemoryRegionOps lasips2_reg_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>
>> -static void lasips2_port_set_irq(void *opaque, int level)
>> +static void lasips2_set_irq(void *opaque, int n, int level)
>>   {
>> -    LASIPS2Port *port = opaque;
>> +    LASIPS2State *s = LASIPS2(opaque);
>> +    LASIPS2Port *port = (n ? &s->mouse : &s->kbd);
>>
>>       port->irq = level;
>>       lasips2_update_irq(port->parent);
>> @@ -263,8 +267,12 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
>>
>>       vmstate_register(NULL, s->base, &vmstate_lasips2, s);
>>
>> -    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
>> -    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
>> +    s->kbd.dev = ps2_kbd_init(NULL, NULL);
>> +    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
>> +                          qdev_get_gpio_in(dev, LASIPS2_KBD_INPUT_IRQ));
>> +    s->mouse.dev = ps2_mouse_init(NULL, NULL);
>> +    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
>> +                          qdev_get_gpio_in(dev, LASIPS2_MOUSE_INPUT_IRQ));
>>   }
>>
>>   static void lasips2_init(Object *obj)
>> @@ -285,6 +293,7 @@ static void lasips2_init(Object *obj)
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
>>
>>       qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>> +    qdev_init_gpio_in(DEVICE(obj), lasips2_set_irq, 2);
>>   }
> 
> These definitely should be named GPIO inputs, as with the pl050.
> 
> Aside, if you felt like adding "QEMU interface" comments to these
> devices that summarize what the various sysbus IRQs, MMIOs,
> qdev GPIOs, etc do, that would be nice, and then gives you a
> place to document that these GPIO lines are part of the internal
> implementation rather than externally-facing. include/hw/intc/ppc-uic.h
> is one example but you can find lots by grepping for "QEMU interface"
> in include/hw/.

Oh interesting, I wasn't aware of this. I'll see if I can add a summary of the 
modelling in v2.


ATB,

Mark.

