Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EC6A4767
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:59:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgpS-0005F6-NX; Mon, 27 Feb 2023 11:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgpO-0005Ed-BR; Mon, 27 Feb 2023 11:58:18 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgpL-0001yd-4A; Mon, 27 Feb 2023 11:58:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2494C7457E7;
 Mon, 27 Feb 2023 17:58:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BE2EE745720; Mon, 27 Feb 2023 17:58:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BBE7B745706;
 Mon, 27 Feb 2023 17:58:09 +0100 (CET)
Date: Mon, 27 Feb 2023 17:58:09 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
Message-ID: <3d91b199-c94c-ec9c-f1e4-4d5b45b82ff9@eik.bme.hu>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1122037576-1677516897=:35244"
Content-ID: <4480841b-765c-379b-53d3-a5f8b06a606b@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1122037576-1677516897=:35244
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d4b48938-ce92-8216-3489-527132bab976@eik.bme.hu>

On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> On Mon, Feb 27, 2023 at 2:45 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>> On Mon, Feb 27, 2023 at 2:00 PM BALATON Zoltan <balaton@eik.bme.hu>
>> wrote:
>>>
>>>> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>>>> On behalve of Zoltan BALATON:
>>>>
>>>> You don't have to do that and in fact please don't. I'll handle this
>>>> series just reply to the one patch that needs update with only the
>> changes
>>>> that were asked by review.
>>>>
>>>> Regards,
>>>> BALATON Zoltan
>>>>
>>>
>>> Google seems to agree with me by not letting me send your patches :/
>>>
>>>  Sent [PATCH v4 0/7] Pegasos2 fixes and audio output support
>>>  Sent [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster
>> operations
>>>  Sent [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman routines
>>>  Sent [PATCH v4 3/7] hw/display/sm501: Add debug property to control
>>> pixman usage
>>>  4.3.0 Mail server temporarily rejected message.
>>> bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222 - gsmtp
>>>
>>> As said before I don't want to iterate on the changes of this series. I
>>> can't test them and from my POV they seem unnecessary to me since all the
>>> test cases I can perform still work without the IRQ changes.
>>
>> Then why do you make me track your series and asking me to check if you
>> broke anything in my patches during your rebase that I've asked you not
>> to do?
>
>
> Because I couldn't convince you about the PCI IRQ router changes ;) I've
> asked how to proceed and got the suggestion to post an alternative series.

That's fine and you did that and I got your changes incorporated in my 
series and had that tested again and then submitted as one series as asked 
by the maintainer to keep all this togetner. Then you come back willing to 
split this series again, reposting some untested changes that I have no 
idea what did you change. This isn't very friendly before a freeze so 
please stop doing that and keep this in one series otherwise we get lost 
between all the changes.

>> The series I've submitted (both my original and the one with your
>> changes) were tested and made sure it worked with AmigaOS that you say you
>> can't test.
>>
>
> Unfortunately my patches had changes merged in. This now makes it hard to
> show what really changed (spoiler: nothing that affects behavior).

The two changes I've made and noted in the commit message were:

1. removing *empty* lines from a switch that only made it half as long and 
easier to read without any change in content.

2. instead of changing the interrupts of the PCI bus this device is 
connected to with pci_bus_irqs(), I export these as gpio pins to model the 
real chip which is then connected in the board as in real hadware.

> As you probably noticed in the "resend" version of this iteration I split
> off a patch introducing the priq properties. It belongs to the sub series
> of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
> to show up in `git blame` as the author of any of these changes. I
> attributed it to you because this was really your change which I'm not even
> sure is legal.
>
> Let's avoid such complications by keeping our series separate.

Yout series is wrong because of the pci_bus_irqs (did you check PCI cards 
such as adding one with -device still work on fuloong2e with your patch?) 
I've corrected in my series so that it also fits in with my changes. If 
you don't like this change then we can drop your series and go back to 
mine instead or make the patch Suggested-by you and I take the From: or 
just keep out of this but please decide what you want and dont make it 
unnecessarily difficult to review and merge this series.

>>> Looking at the schematics I get the impression that the PCI IRQs actually
>>> work the other way around: Instead of the INTx lines of the 2nd PCI bus
>>> triggering both the north and the south bridge IRQ controllers, the two
>> PCI
>>> buses of the north bridge both trigger the VT82xx PCI IRQ router. I'm
>> not a
>>> hardware engineer so I could be totally off here. That's why I rather
>> leave
>>> my hands off of this stuff.
>>
>> You don't seem to leave your hands off and got involved voluntarily so now
>> don't run away :-)
>>
>
> I'm happy to comment on it but please don't make me change anything there
> for now. Feature freeze is approaching soon after all which in turn raises
> the temperature for development.

I can just say the same to you. This was my series that you changed so 
don't ask me to not change it. I've changed it as you proposed despite I'm 
not buting that's the right way and had it re-tested but it's still not 
good for you?

>> I'm no hardware engineer either but in any case pci_set_irq cannot be used
>> from a PCIDevice as I explained in the other message so your approach with
>> that is clearly wrong and we need gpios that something else connects to
>> the PCI bus. You could only do that if the VIA chip was a north bridge
>> that had a PCI bus but it doesn't. In pegasos2 the north bridge is the
>> MV64361 but the PCI interrupt lines are connected to its GPP (General
>> purpose or multi purpose pins in docs that are just gpio lines, which are
>> programmable inputs or outputs). These can generate an interrupt in the
>> MV64361 but the VT8231 also has an ability to route PCI IRQs to ISA
>> interrupts which some guests use. So I think the way I've modeled it is
>> correct by connecting the PCI bus interrupt pins to both of these chips
>> and since they are independent models the only place you can do it cleanly
>> is the board code. Other boards may connect the VIA PIRQ pins differently
>> but this model allows for that now. What is that you still don't like
>> about it?
>>
>
> On page 13 there is a note saying "Southbridge is INT controller". Another
> note says "AGP uses A as first Int for none shared operation". These notes
> describe hardware, so should apply to all guests.
>
> Furthermore, I couldn't find any remotely useful documentation for the
> MV64361 chip. This turns any discussion into guesswork.

Maybe check here: qmiga.osdn.io there are some hints how to find some 
docs. Can't link then due to copyright reasons.

Regards,
BALATON Zoltan
--3866299591-1122037576-1677516897=:35244--

