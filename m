Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC35377D4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:57:00 +0200 (CEST)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvc8x-0001rm-73
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvc2d-000803-9B
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:50:28 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvc2a-0006ZP-JD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:50:26 -0400
Received: from [192.168.15.104] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4AC4820777;
 Mon, 30 May 2022 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653904221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAOdbzhvJA5qwAp786zc8bGC49Ct+bbL4VjlLne0S+U=;
 b=0DciLa6S7AsoiAyX4k0J3G22CwWbeUdkjlF2Ee5/2U6muN6Oz1w1o+kSyFHr3sJfNGlwtE
 eHNqqngV1q0qPPHF287l21AMN1hsMEJD+yNXccrKAy679EfgukbBEst58T46hg+dN8YFv9
 ArvHB0fxsTKdEjPz+zQN7N0s3xDLluU=
Message-ID: <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
Date: Mon, 30 May 2022 11:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Content-Language: en-US-large
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
 <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
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


On 5/25/22 21:20, Mark Cave-Ayland wrote:
> On 25/05/2022 12:45, Peter Maydell wrote:
> 
>> On Wed, 25 May 2022 at 10:51, Damien Hedde 
>> <damien.hedde@greensocs.com> wrote:
>>> On 5/24/22 19:44, Mark Cave-Ayland wrote:
>>>> Sorry for coming late into this series, however one of the things I've
>>>> been thinking about a lot recently is that with the advent of QOM and
>>>> qdev, is there really any distinction between TYPE_DEVICE and
>>>> TYPE_SYS_BUS_DEVICE anymore, and whether it makes sense to keep
>>>> TYPE_SYS_BUS_DEVICE long term.
>>>
>>> On QAPI/CLI level there is a huge difference since TYPE_SYS_BUS_DEVICE
>>> is the only subtype of TYPE_DEVICE which is subject to special
>>> treatment. It prevents to plug a sysbus device which has not be allowed
>>> by code and that's what I want to get rid of (or workaround by allowing
>>> all of them).
>>
>> Yes, but the fact that TYPE_SYS_BUS_DEVICE is a special subclass
>> is an accident of history. At some point we really ought to tidy
>> this up so that any TYPE_DEVICE can have MMIO regions and IRQs,
>> and get rid of the subclass entirely. This isn't trivial, for
>> reasons including problems with reset handling, but I would
>> prefer it if we didn't bake "sysbus is special" into places like
>> the QMP commands.
> 
> Right, and in fact we can already do this today using QOM regardless of 
> whether something is a SysBusDevice or not. As an example here is the 
> output of qemu-system-sparc's "info qom-tree" for the slavio_misc device:
> 
>      /device[20] (slavio_misc)
>        /configuration[0] (memory-region)
>        /diagnostic[0] (memory-region)
>        /leds[0] (memory-region)
>        /misc-system-functions[0] (memory-region)
>        /modem[0] (memory-region)
>        /software-powerdown-control[0] (memory-region)
>        /system-control[0] (memory-region)
>        /unnamed-gpio-in[0] (irq)
> 
> Now imagine that I instantiate a device with qdev_new():
> 
>      DeviceState *dev = qdev_new("slavio_misc");
> 
> I can obtain a reference to the "configuration" memory-region using 
> something like:
> 
>      MemoryRegion *config_mr = MEMORY_REGION(object_resolve_path_component(
>                                OBJECT(dev), "configuration[0]"));
> 
> and for the IRQ I can do either:
> 
>      qemu_irq *irq = IRQ(object_resolve_path_component(
>                          OBJECT(dev), "unnamed-gpio-in[0]"));
> 
> or simply:
> 
>      qemu_irq *irq = qdev_get_gpio_in(dev, 0);
> 
> Maybe for simplicity we could even add a qdev wrapper function to obtain 
> a reference for memory regions similar to qdev gpios i.e. 
> qdev_get_mmio(dev, "configuration", 0) based upon the above example?
> 
> Now from the monitor we can already enumerate this information using 
> qom-list if we have the QOM path:
> 
>      (qemu) qom-list /machine/unattached/device[20]
>      type (string)
>      parent_bus (link<bus>)
>      hotplugged (bool)
>      hotpluggable (bool)
>      realized (bool)
>      diagnostic[0] (child<memory-region>)
>      unnamed-gpio-in[0] (child<irq>)
>      modem[0] (child<memory-region>)
>      leds[0] (child<memory-region>)
>      misc-system-functions[0] (child<memory-region>)
>      sysbus-irq[1] (link<irq>)
>      sysbus-irq[0] (link<irq>)
>      system-control[0] (child<memory-region>)
>      configuration[0] (child<memory-region>)
>      software-powerdown-control[0] (child<memory-region>)
> 
>  From this I think we're missing just 2 things: i) a method to look up 
> properties from a device id which can be used to facilitate 
> introspection, and ii) a function to map a memory region from a device 
> (similar to Damien's patch). Those could be something like:
> 
>     device_list <id>
>       - looks up the QOM path for device "id" and calls qom-list on the 
> result

You can already do qom_list <id>.
It works with non-absolute qom path too (if there is only 1 match for 
the relative path in the qom tree). In your example `qom-list 
device[20]` probably works too.

> 
>     device_map <id> <mr> <offset> [<parent_mr>]
>       - map device "id" region named mr at given offset. If parent_mr is
>         unspecified, assume it is the root address space 
> (get_system_memory()).
> 
> It may also be worth adding a device_connect wrapper to simplify your 
> qom-set example:
> 
>     device_connect <out-id> <out-irq> <in-id> <in-irq>
> 
> The only thing I see here that SYS_BUS_DEVICE offers that we don't have 
> is the ability to restrict which memory regions/irqs are available for 
> mapping - but does this matter if we have introspection and don't mind 
> addressing everything by name?

TYPE_SYS_BUS_DEVICE also comes with reset support.
If a device is on not on any bus it is not reached by the root sysbus 
reset which propagates to every device (and other sub-buses).
Even if we move all the mmio/sysbus-irq logic into TYPE_DEVICE, we will 
still miss that. The bus is needed to handle the reset.
For devices created in machine init code, we have the option to do it in 
the machine reset handler. But for user created device, this is an issue.

If we end up putting in TYPE_DEVICE support for mmios, interrupts and 
some way to do the bus reset. What would be the difference between the 
current TYPE_SYS_BUS_DEVICE ?

> 
>> More generally, I don't think that the correct answer to "is this
>> device OK to cold-plug via commandline and QMP is "is it a sysbus
>> device?". I don't know what the right way to identify cold-pluggable
>> devices is but I suspect it needs to be more complicated.
> 
> I think that connecting devices like this can only work if there is no 
> additional bus logic, in which case could we say a device is 
> cold-pluggable if it has no bus specified, or the bus is the root sysbus?
> 
>>> I'm note sure what you mean by identification and enumeration. I do not
>>> do any introspection and rely on knowing which mmio or irq index
>>> corresponds to what. The "id" in `device_add` allows to reference the
>>> device in following commands.
>>
>> This is then baking in a device's choices of MMIO region
>> ordering and arrangement and its IRQ numbering into a
>> user-facing ABI. I can't say I'm very keen on that -- it
>> would block us from being able to do a variety of
>> refactorings and cleanups.
> 
> Absolutely agree. The main reason we need something like 
> qom-find-device-path is because QOM paths are not stable: there are a 
> large number of legacy devices still out there, and QOMifying them often 
> changes the QOM paths and child object ordering.
> 
> 
> ATB,
> 
> Mark.
--
Damien

