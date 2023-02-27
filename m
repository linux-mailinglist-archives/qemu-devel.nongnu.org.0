Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3886A4331
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:47:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdpP-0000ZG-V8; Mon, 27 Feb 2023 08:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWdpG-0000Pb-5h; Mon, 27 Feb 2023 08:45:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWdpD-0003eF-00; Mon, 27 Feb 2023 08:45:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 28AB974632B;
 Mon, 27 Feb 2023 14:45:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E49C474635C; Mon, 27 Feb 2023 14:45:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E385274633D;
 Mon, 27 Feb 2023 14:45:51 +0100 (CET)
Date: Mon, 27 Feb 2023 14:45:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
Message-ID: <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-72415349-1677505551=:85574"
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

--3866299591-72415349-1677505551=:85574
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> On Mon, Feb 27, 2023 at 2:00 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>> On behalve of Zoltan BALATON:
>>
>> You don't have to do that and in fact please don't. I'll handle this
>> series just reply to the one patch that needs update with only the changes
>> that were asked by review.
>>
>> Regards,
>> BALATON Zoltan
>>
>
> Google seems to agree with me by not letting me send your patches :/
>
>  Sent [PATCH v4 0/7] Pegasos2 fixes and audio output support
>  Sent [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster operations
>  Sent [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman routines
>  Sent [PATCH v4 3/7] hw/display/sm501: Add debug property to control
> pixman usage
>  4.3.0 Mail server temporarily rejected message.
> bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222 - gsmtp
>
> As said before I don't want to iterate on the changes of this series. I
> can't test them and from my POV they seem unnecessary to me since all the
> test cases I can perform still work without the IRQ changes.

Then why do you make me track your series and asking me to check if you 
broke anything in my patches during your rebase that I've asked you not 
to do? The series I've submitted (both my original and the one with your 
changes) were tested and made sure it worked with AmigaOS that you say you 
can't test.

> Looking at the schematics I get the impression that the PCI IRQs actually
> work the other way around: Instead of the INTx lines of the 2nd PCI bus
> triggering both the north and the south bridge IRQ controllers, the two PCI
> buses of the north bridge both trigger the VT82xx PCI IRQ router. I'm not a
> hardware engineer so I could be totally off here. That's why I rather leave
> my hands off of this stuff.

You don't seem to leave your hands off and got involved voluntarily so now 
don't run away :-)

I'm no hardware engineer either but in any case pci_set_irq cannot be used 
from a PCIDevice as I explained in the other message so your approach with 
that is clearly wrong and we need gpios that something else connects to 
the PCI bus. You could only do that if the VIA chip was a north bridge 
that had a PCI bus but it doesn't. In pegasos2 the north bridge is the 
MV64361 but the PCI interrupt lines are connected to its GPP (General 
purpose or multi purpose pins in docs that are just gpio lines, which are 
programmable inputs or outputs). These can generate an interrupt in the 
MV64361 but the VT8231 also has an ability to route PCI IRQs to ISA 
interrupts which some guests use. So I think the way I've modeled it is 
correct by connecting the PCI bus interrupt pins to both of these chips 
and since they are independent models the only place you can do it cleanly 
is the board code. Other boards may connect the VIA PIRQ pins differently 
but this model allows for that now. What is that you still don't like 
about it?

Regards,
BALATON Zoltan
--3866299591-72415349-1677505551=:85574--

