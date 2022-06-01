Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6353A3BD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 13:21:55 +0200 (CEST)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwMQE-0004IW-DZ
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 07:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwLi8-0000qV-8O
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:36:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwLi5-0002AI-R4
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BcWeZd6I5nLvaZ5UT7hyD+Spi14TofDSOnXQgjWHAxs=; b=cpx1ayTQ2RUNwphvz41D1X6mrT
 4AWxU2mlxGZ5MqPfjEeOblzZCq650fq8Umx04Vtal4ZrKpKiG+I+syGG81bvkLrX4ecR4dtBKSnUB
 GtwEFtc2p69H3iDD7FJBIfJqS+kge+4IJR0/l3Jpd2vlweuyulBljVHX3sSjKoqyIrJ1Et/UbQCx8
 1XKSxeDLy+wMfeYQytf51r4juWzWsX1SOlYUicD32CCCse37FhEYINu+tzaNSP6byovQXEOCkVh9T
 YBDwf+y3X0/EMHFJ5zz10TV30bPnl2TEP3ZU35iYfv6IzJToHvwh7cBiNlDZ+JYfRk5hyw+hOvmvU
 mtA//myd0A7FEmMQNQbC5pVb/YAi+HZljFAONQdjZh6ea0ZM7bIMLHbEYyp4FnYFlhYKew24VIioh
 fnU5/QCDwv3y8DQYfX7Ggz988HLN5HbxBDjz78WPqrNgHeprWzSu15d6CYpgVNZ+rjj6Ro6K8c9Cd
 oqpuo47Vgw/1FC/yqNqtRoynJaNn4EXdnL8lGz5VIpuy1TonbbHRZq5LBKlvCjprUB984pGplYuOi
 CnQzrLq7KwA4w1oDKhwn0rYhFvDd3+3SwDCCPbXxhOMsZ3rzT4HFch/1m2iGBOu+081S5GPRm1JCB
 cLOQL5IR1pXfrqxhiwBXgdH4BQpo1j17IsadB+dSs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwLgu-0008cB-7S; Wed, 01 Jun 2022 11:35:08 +0100
Message-ID: <2bffc944-9747-05ac-a22f-98eadcdb1803@ilande.co.uk>
Date: Wed, 1 Jun 2022 11:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>,
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
 <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
 <CAFEAcA_BinJMmqdTBoCs3V-dqSRQ_jjL7FpdMxCr1etZgn0i_A@mail.gmail.com>
 <5a7b14fa-15ef-42c2-1072-d0aec0795718@greensocs.com>
 <e1547885-1d46-f083-520a-087518e2eb6c@ilande.co.uk>
 <bd5caf26-6e34-725e-60a4-018b1a3f905a@greensocs.com>
 <7700fd59-c005-a575-3c2c-ae078b0be534@ilande.co.uk>
 <35806422-e4e4-9a73-ab9f-412858517508@greensocs.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <35806422-e4e4-9a73-ab9f-412858517508@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 01/06/2022 09:39, Damien Hedde wrote:

> On 5/31/22 22:43, Mark Cave-Ayland wrote:
>> On 31/05/2022 10:22, Damien Hedde wrote:
>>
>>> On 5/31/22 10:00, Mark Cave-Ayland wrote:
>>>> On 30/05/2022 15:05, Damien Hedde wrote:
>>>>
>>>>> On 5/30/22 12:25, Peter Maydell wrote:
>>>>>> On Mon, 30 May 2022 at 10:50, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>>>>> TYPE_SYS_BUS_DEVICE also comes with reset support.
>>>>>>> If a device is on not on any bus it is not reached by the root sysbus
>>>>>>> reset which propagates to every device (and other sub-buses).
>>>>>>> Even if we move all the mmio/sysbus-irq logic into TYPE_DEVICE, we will
>>>>>>> still miss that. The bus is needed to handle the reset.
>>>>>>> For devices created in machine init code, we have the option to do it in
>>>>>>> the machine reset handler. But for user created device, this is an issue.
>>>>>>
>>>>>> Yes, the missing reset support in TYPE_DEVICE is a design
>>>>>> flaw that we really should try to address.
>>>>
>>>> I think the easiest way to handle this would be just after calling dc->realize; 
>>>> if the device has bus == NULL and dc->reset != NULL then manually call 
>>>> qemu_register_reset() for dc->reset. In a qdev world dc->reset is intended to be 
>>>> a bus-level reset, but I can't see an issue with manual registration for 
>>>> individual devices in this way, particularly as there are no reset ordering 
>>>> guarantees for sysbus.
>>>
>>> I'm a bit afraid calling qemu_register_reset() outside dc->realize might modify 
>>> the behavior for existing devices. Does any device end up having a non-NULL bus 
>>> right now when using "-device" CLI ?
>>
>> If you take a look at "info qtree" then that will show you all devices that are 
>> attached to a bus i.e. ones where bus is not NULL.
>>
>>>>>>> If we end up putting in TYPE_DEVICE support for mmios, interrupts and
>>>>>>> some way to do the bus reset. What would be the difference between the
>>>>>>> current TYPE_SYS_BUS_DEVICE ?
>>>>>>
>>>>>> There would be none, and the idea would be to get rid of
>>>>>> TYPE_SYS_BUS_DEVICE entirely...
>>>>>>
>>>>> Do you expect the bus object to disappear in the process (bus-less system) or 
>>>>> transforming the sysbus into a ~TYPE_BUS thing ?
>>>>
>>>> I'd probably lean towards removing sysbus completely since in real life devices 
>>>> can exist outside of a bus. If a device needs a bus then it should already be 
>>>> modelled in QEMU, and anything that requires a hierarchy can already be 
>>>> represented via QOM children
>>>
>>> For me, a "memory bus" is a bus. But I understand in QEMU, this is modeled by a 
>>> memory region and we do not want to represent it anymore by a qdev/qbus hierarchy.
>>>
>>>>
>>>>> Assuming we manage to sort out this does cold plugging using the following 
>>>>> scenario looks ok ? (regarding having to issue one command to create the device 
>>>>> AND some commands to handle memory-region and interrupt lines)
>>>>>
>>>>>  > device_add driver=ibex-uart id=uart chardev=serial0
>>>>>  > sysbus-mmio-map device=uart addr=1073741824
>>>>>  > qom-set path=uart property=sysbus-irq[0] value=plic/unnamed-gpio-in[1]
>>>>>
>>>>> TYPE_DEVICE or TYPE_SYS_BUS_DEVICE, my goal is still to be able to cold-plug a 
>>>>> "ibex-uart" define its memory map and choose which irq I wire where.
>>>>
>>>> Anyhow getting back on topic: my main objection here is that you're adding a 
>>>> command "sysbus-mmio-map" when we don't want the concept of SysBusDevice to be 
>>>> exposed outside of QEMU at all. Referring back to my last email I think we should 
>>>> extend the device concept in the monitor to handle the additional functionality 
>>>> perhaps along the lines of:
>>>>
>>>> - A monitor command such as "device_map" which is effectively a wrapper around
>>>>    memory_region_add_subregion(). Do we also want a "device_unmap"? We should
>>>>    consider allow mapping to other memory regions other than the system root.
>>>>
>>>> - A monitor command such as "device_connect" which can be used to simplify your IRQ
>>>>    wiring, perhaps also with a "device_disconnect"?
>>>>
>>>> - An outline of the monitor commands showing the complete workflow from 
>>>> introspection
>>>>    of a device to mapping its memory region(s) and connecting its gpios
>>>>
>>>> Does that give you enough information to come up with a more detailed proposal?
>>>>
>>>
>>> Yes. Sorry for being not clear enough. I did not wanted to insist on specific 
>>> command names. I've no issues regarding the modifications you request about having 
>>> a device_connect or a device_map.
>>>
>>> My question was more about the workflow which does not rely on issuing a single 
>>> 'device_add' command handling mapping/connection using parameters. Note that since 
>>> we are talking supporting of map/connect for the base type TYPE_DEVICE, I don't 
>>> really see how we could have parameters for these without impacting subtypes.
>>
>> I'm not sure I understand what you are saying here? Can you give an example?
> 
> There are 2 possible workflows:
> 1. several commands
>  > device_add ...
>  > device_map ...
>  > device_connect ...
> 
> 2. single command
>  > device_add ... map={...} connect={...}
> 
> The 2nd one is more like how we connect devices with '-device': all is done at once. 
> But if this is supposed to apply to TYPE_DEVICE (versus TYPE_SYS_BUS_DEVICE), it 
> becomes IMHO hard to prevent using them on devices where it does not makes sense (for 
> example: a virtio or pci device for which everything is already handled).

My initial feeling is that 1) is the better approach, since you can report errors at 
each stage. Once you have the id for a specific device you can them attempt to 
device_map it, reporting an error if there is a region overlap. Similarly for 
device_connect can you report an error if the input gpio is already connected.


ATB,

Mark.

