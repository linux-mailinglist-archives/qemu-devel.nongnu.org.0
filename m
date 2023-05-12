Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABED700329
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:59:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOcF-0007It-6q; Fri, 12 May 2023 04:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxOcC-0007IM-Sg
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:59:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxOcA-0007KD-Rm
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0gx6Qr5utyrmNrIozGT96835aGaSa7ABf/Ngv+GBmw=; b=EoxY/bAhKi/LgzDowlPwhyLTmw
 ZOXsMudq06VJhS0ldSzyPmWaw/lZ/nreh4lbuPqgU0pJq2q0LTQcl2M83aAoCZYlgX0dEt1dtKIGh
 k0dhLIjyAOnIFwz9NLDXj6MNqalLg8YDICRNwNpJLd2X3KYLUVwGJvX++6e3co3fbQK9x+eW0u7K8
 89+ZDn4j/xi4Q3HMQFUSQIa/wABnZBni1Gi00xLgCo5Nw7zDzzUMO5T/xNF04VfZdBebwLj08hSLw
 J6vyfcPUxO4XOFpn2Ah0eEb/eUi/NUJTIXPtAfYjzvJHeNUrUgUsUm2yZ1LlNHamkHJI96p6EKjSZ
 zM8ix23aZYsJOp8g6RD5Z5BawYsEexHw6m1sEE1pe4MnLBALf0e7lqRxO5MWmxeAo6eAB1Pc9F++O
 acs6su6G1Emcw1qC13SO+e+CYcyXv3TAwIpRb0AvV2EnyKLcows/EakLAL2hRYawFB4TAxpN397ZN
 QtRCWWAJe+upF1Ogp33CCWuCorMXmS6b16Px3R/Fdo5O1mmz/3eHN6MjDWllgTh1NUytYScPl2g1G
 VxjBJzhNukTOY9cIGCbI1QAx2iCxsxDJ3EIH4TkkVlc9bfnRrnmYjht43Tr7NrPe4lsF/KDKzSxZn
 XC7S7B17AsVB2YWstmnCmldJxJHdcQ6gB/MYqg86A=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxOb7-00081D-6Z; Fri, 12 May 2023 09:58:01 +0100
Message-ID: <0e00bd03-b053-f3a2-b449-22fe30c27328@ilande.co.uk>
Date: Fri, 12 May 2023 09:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
 <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
 <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
 <20230512005242-mutt-send-email-mst@kernel.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230512005242-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 03/18] hw/pci: use PCIDevice gpio for device IRQ
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/05/2023 06:51, Michael S. Tsirkin wrote:

> On Thu, May 11, 2023 at 09:44:51PM +0000, Bernhard Beschow wrote:
>>
>>
>> Am 11. Mai 2023 08:57:16 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>> Change pci_set_irq() to call qemu_set_irq() on the PCI device IRQ rather than
>>> calling PCI bus IRQ handler function directly. In order to preserve the
>>> existing behaviour update pci_qdev_realize() so that it automatically connects
>>> the PCI device IRQ to the PCI bus IRQ handler.
>>>
>>> Finally add a "QEMU interface" description documenting the new PCI device IRQ
>>> gpio next to the declaration of TYPE_PCI_DEVICE.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> hw/pci/pci.c | 12 ++++++++++--
>>> 1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>> index 9471f996a7..3da1481eb5 100644
>>> --- a/hw/pci/pci.c
>>> +++ b/hw/pci/pci.c
>>> @@ -1680,8 +1680,7 @@ qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
>>>
>>> void pci_set_irq(PCIDevice *pci_dev, int level)
>>> {
>>> -    int intx = pci_intx(pci_dev);
>>> -    pci_irq_handler(pci_dev, intx, level);
>>> +    qemu_set_irq(pci_dev->irq, level);
>>> }
>>>
>>> /* Special hooks used by device assignment */
>>> @@ -2193,6 +2192,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>>>      pci_set_power(pci_dev, true);
>>>
>>>      pci_dev->msi_trigger = pci_msi_trigger;
>>> +
>>> +    /* Connect device IRQ to bus */
>>> +    qdev_connect_gpio_out(DEVICE(pci_dev), 0,
>>> +                          pci_get_bus(pci_dev)->irq_in[pci_dev->devfn]);
>>
>> I think this is confusing a few things. In my understanding -- unlike
>> ISA -- PCI considers interrupt lanes only for PCI slots but not for
>> buses.
>> So for example each PCI slot could have its own direct
>> connections (up to four, intA..intD) to the interrupt controller. IOW
>> interrupt lanes and PCI buses are unrelated, thus PCIBus shouldn't
>> really have IRQs.
> 
> True, interrupt lines (not lanes I think - lanes is a PCI express
> unrelated to interrupts since interrupts are just messages under PCIe)
> bypass the PCI bus. They are in fact even used outside the
> normal GNT#/REQ# protocol.
> 
> 	The system vendor is free to combine the various INTx# signals from the PCI connector(s)
> 	in any way to connect them to the interrupt controller. They may be wire-ORed or
> 	electronically switched under program control, or any combination thereof. The system
> 	designer must insure that each INTx# signal from each connector is connected to an input
> 	on the interrupt controller. This means the device driver may not make any assumptions
> 	about interrupt sharing. All PCI device drivers must be able to share an interrupt (chaining)
> 	with any other logical device including devices in the same multi-function package.

I hope I covered this in my reply to Bernhard, but I think this supports the idea 
that using a gpio is the right approach here: in the case of PCI IRQ the gpio 
represents the physical signal and can be wired using standard qdev APIs, whereas for 
PCIe the GPIOs can be wired to an internal message handler in exactly the same way.

>> Moreover, in case the interrupt lines are shared between multiple PCI slots, a usual pattern is to swizzle these lines such that the intAs from the slots don't all occupy just one IRQ line. That means that depending on the slot the device is plugged into a different lane is triggered. Above code, however, would always trigger the same line and wouldn't even allow for modeling the swizzeling.
> 
> the swizzeling always applies in case of PCI bridges:
> 
> However, since bridges will be used on add-in cards, the BIOS will assume an association
> between device location and which INTx# line it uses when requesting an interrupt.
> ...
> The BIOS code will assume the following binding behind the bridge and will
> write the IRQ number in each device as described in Table 9-1. The interrupt binding
> defined in this table is mandatory for add-in cards utilizing a bridge.

Also just to clarify in line with my previous reply: this series only changes the PCI 
device IRQ endpoint to use a gpio as a starting point to facilitate using standard 
qdev APIs to enable physical PCI device routing in future, as opposed to using a 
bespoke pci_set_irq() function just for PCI.

If this makes sense, I'd be interested to hear whether you think the current approach 
of using a named gpio "pci-input-irq" (which appears in "info qom-tree") is suitable, 
or whether it makes sense to embed the PCI IRQ directly in the device which is the 
normal qdev approach but will take more work as it involves updating all the relevant 
PCIDevices.


ATB,

Mark.


