Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B9534425
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:21:57 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwZw-0008Ph-Et
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntwYO-0007bb-IJ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:20:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntwYM-0002VX-Lu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dt/3wSpUUwY9MPFeYfDJiuWgReQ7gf/c8i2ljjfW+w0=; b=DZinKgNM7KEtLLJNb+ZtKsdwKS
 wT2GFO/WNNe34CBEFjcqiHB/qz4IT8JMTN5SNw/Te5tZ8QmhnV/NrYVHMbXM14ImxKCm9QDAhecPY
 FA0LSlRCX66aPXi8EaMpG3645ExsXcQkQqDQSqAVBwhl5aLB+dNhHwgxHidEkStDpd6jGtY5+SYED
 xQbddGqhrWyYa0IqZBz1pqi9vgFrlm1WeuLLZ2vTNl0UssRzIRerKGibQN6IVN2Lg+ZWPFP3Xo+of
 Mogp/q8pOvqaWYTb0csELG/UVgUx/7v0Y/tytUkE/50eq7xIHgkyVKFEwTEhXqrgMKcyBhy0JFPZ7
 sgStafuNfdD7ea10Dmba3DMWyMLdoL1XKOOeiMK/FOLo19gVAIMpfbtdYNcQo3N1LsMGSFF1Ti39z
 1c8M5Tc28s9Nm4PFKScJK7eCO/xrj8RgzOEAsVXoeFJTOMVY9S2E7YAKJE86GQgX7MUmkBcw829n+
 xAhSnrk0FHflC1hP0uBPMzFzb/jOlx5ilTjtTkL6gW5OEFGs+8ozO3I1bX9iTTFEpndOHophZAqZR
 OWCZoNzHZYQZl5Mjwia9awwiJwoPgUmV+Fmrx+uvgNwvzm9GAYbT9dxC1WxBlTKtm+Bal51pWprU2
 b1Xes34M7CJ1eRwWeYFObnQ3FuW4cM/CsmFZZvXAE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntwXE-0006se-3Y; Wed, 25 May 2022 20:19:12 +0100
Message-ID: <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
Date: Wed, 25 May 2022 20:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
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

On 25/05/2022 12:45, Peter Maydell wrote:

> On Wed, 25 May 2022 at 10:51, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> On 5/24/22 19:44, Mark Cave-Ayland wrote:
>>> Sorry for coming late into this series, however one of the things I've
>>> been thinking about a lot recently is that with the advent of QOM and
>>> qdev, is there really any distinction between TYPE_DEVICE and
>>> TYPE_SYS_BUS_DEVICE anymore, and whether it makes sense to keep
>>> TYPE_SYS_BUS_DEVICE long term.
>>
>> On QAPI/CLI level there is a huge difference since TYPE_SYS_BUS_DEVICE
>> is the only subtype of TYPE_DEVICE which is subject to special
>> treatment. It prevents to plug a sysbus device which has not be allowed
>> by code and that's what I want to get rid of (or workaround by allowing
>> all of them).
> 
> Yes, but the fact that TYPE_SYS_BUS_DEVICE is a special subclass
> is an accident of history. At some point we really ought to tidy
> this up so that any TYPE_DEVICE can have MMIO regions and IRQs,
> and get rid of the subclass entirely. This isn't trivial, for
> reasons including problems with reset handling, but I would
> prefer it if we didn't bake "sysbus is special" into places like
> the QMP commands.

Right, and in fact we can already do this today using QOM regardless of whether 
something is a SysBusDevice or not. As an example here is the output of 
qemu-system-sparc's "info qom-tree" for the slavio_misc device:

     /device[20] (slavio_misc)
       /configuration[0] (memory-region)
       /diagnostic[0] (memory-region)
       /leds[0] (memory-region)
       /misc-system-functions[0] (memory-region)
       /modem[0] (memory-region)
       /software-powerdown-control[0] (memory-region)
       /system-control[0] (memory-region)
       /unnamed-gpio-in[0] (irq)

Now imagine that I instantiate a device with qdev_new():

     DeviceState *dev = qdev_new("slavio_misc");

I can obtain a reference to the "configuration" memory-region using something like:

     MemoryRegion *config_mr = MEMORY_REGION(object_resolve_path_component(
                               OBJECT(dev), "configuration[0]"));

and for the IRQ I can do either:

     qemu_irq *irq = IRQ(object_resolve_path_component(
                         OBJECT(dev), "unnamed-gpio-in[0]"));

or simply:

     qemu_irq *irq = qdev_get_gpio_in(dev, 0);

Maybe for simplicity we could even add a qdev wrapper function to obtain a reference 
for memory regions similar to qdev gpios i.e. qdev_get_mmio(dev, "configuration", 0) 
based upon the above example?

Now from the monitor we can already enumerate this information using qom-list if we 
have the QOM path:

     (qemu) qom-list /machine/unattached/device[20]
     type (string)
     parent_bus (link<bus>)
     hotplugged (bool)
     hotpluggable (bool)
     realized (bool)
     diagnostic[0] (child<memory-region>)
     unnamed-gpio-in[0] (child<irq>)
     modem[0] (child<memory-region>)
     leds[0] (child<memory-region>)
     misc-system-functions[0] (child<memory-region>)
     sysbus-irq[1] (link<irq>)
     sysbus-irq[0] (link<irq>)
     system-control[0] (child<memory-region>)
     configuration[0] (child<memory-region>)
     software-powerdown-control[0] (child<memory-region>)

 From this I think we're missing just 2 things: i) a method to look up properties 
from a device id which can be used to facilitate introspection, and ii) a function to 
map a memory region from a device (similar to Damien's patch). Those could be 
something like:

    device_list <id>
      - looks up the QOM path for device "id" and calls qom-list on the result

    device_map <id> <mr> <offset> [<parent_mr>]
      - map device "id" region named mr at given offset. If parent_mr is
        unspecified, assume it is the root address space (get_system_memory()).

It may also be worth adding a device_connect wrapper to simplify your qom-set example:

    device_connect <out-id> <out-irq> <in-id> <in-irq>

The only thing I see here that SYS_BUS_DEVICE offers that we don't have is the 
ability to restrict which memory regions/irqs are available for mapping - but does 
this matter if we have introspection and don't mind addressing everything by name?

> More generally, I don't think that the correct answer to "is this
> device OK to cold-plug via commandline and QMP is "is it a sysbus
> device?". I don't know what the right way to identify cold-pluggable
> devices is but I suspect it needs to be more complicated.

I think that connecting devices like this can only work if there is no additional bus 
logic, in which case could we say a device is cold-pluggable if it has no bus 
specified, or the bus is the root sysbus?

>> I'm note sure what you mean by identification and enumeration. I do not
>> do any introspection and rely on knowing which mmio or irq index
>> corresponds to what. The "id" in `device_add` allows to reference the
>> device in following commands.
> 
> This is then baking in a device's choices of MMIO region
> ordering and arrangement and its IRQ numbering into a
> user-facing ABI. I can't say I'm very keen on that -- it
> would block us from being able to do a variety of
> refactorings and cleanups.

Absolutely agree. The main reason we need something like qom-find-device-path is 
because QOM paths are not stable: there are a large number of legacy devices still 
out there, and QOMifying them often changes the QOM paths and child object ordering.


ATB,

Mark.

