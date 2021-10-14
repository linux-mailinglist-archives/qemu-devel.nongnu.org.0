Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F385842DEE2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:07:08 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3G8-0007L9-2c
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mb38O-0008PY-KD; Thu, 14 Oct 2021 11:59:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49524
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mb38M-000835-2c; Thu, 14 Oct 2021 11:59:08 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mb37v-0004ij-BC; Thu, 14 Oct 2021 16:58:43 +0100
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
 <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
 <25d90a22-63d9-6c15-5ee2-eadda449bcaf@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2b2e2d8e-caa5-8ea1-f7da-4b1bb20bd7bd@ilande.co.uk>
Date: Thu, 14 Oct 2021 16:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <25d90a22-63d9-6c15-5ee2-eadda449bcaf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 16:37, Thomas Huth wrote:

> On 14/10/2021 17.26, Philippe Mathieu-Daudé wrote:
>> On 10/14/21 13:29, Cédric Le Goater wrote:
>>> On 10/14/21 12:34, Christophe Leroy wrote:
>>
>>>> I have the following change in QEMU to be able to run the bamboo,
>>>> found it some time ago via google (can't remember where):
>>>>
>>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>>> index 8147ba6f94..600e89e791 100644
>>>> --- a/hw/ppc/ppc4xx_pci.c
>>>> +++ b/hw/ppc/ppc4xx_pci.c
>>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
>>>> int irq_num)
>>>>
>>>>        trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>>>
>>>> -    return slot - 1;
>>>> +    return slot ? slot - 1 : slot;
>>>>    }
>>>>
>>>>    static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>>
>>> could you try to use :
>>>
>>> static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
>>> {
>>>      return (devno + irq_num) % 4;
>>> }
>>
>> Is this pci_swizzle()?
> 
> It's pci_swizzle, but I don't think that we should take irq_num into account here. 
> The comment right in front of the function says:
> 
>   On Bamboo, all pins from each slot are tied to a single board IRQ
> 
> Similar comment in pc-bios/bamboo.dts:
> 
>   Bamboo has all 4 IRQ pins tied together per slot
> 
> So the return value should only depend on the slot number.
> 
> Not sure how to properly fix this yet, though.
> 
>   Thomas
> 
> 
> PS: Found a working pre-compiled kernel for bamboo:
> http://landley.net/aboriginal/downloads/binaries/system-image-powerpc-440fp.tar.gz

Hi Thomas,

Did you see my reply from earlier today? Last time I checked the backtrace from the 
assert() it was coming via pci_update_irq_disabled() although that's not to say that 
something else could have changed since the original thread.


ATB,

Mark.

