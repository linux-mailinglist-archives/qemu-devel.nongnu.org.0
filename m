Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F1F58CF7A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:07:02 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL9xk-0007A1-7K
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL9sd-0005NR-1V
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:01:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL9sa-0005UF-3t
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:01:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E1C8E7475F9;
 Mon,  8 Aug 2022 23:01:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A1DF87462D3; Mon,  8 Aug 2022 23:01:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A04CE745702;
 Mon,  8 Aug 2022 23:01:36 +0200 (CEST)
Date: Mon, 8 Aug 2022 23:01:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Elliot Nunn <elliot@nunn.io>, qemu-devel@nongnu.org, kraxel@redhat.com, 
 hsp.cat7@gmail.com
Subject: Re: VGA hardware cursor query
In-Reply-To: <c7c9cf50-be0-4931-70f8-40fd653b2cf0@eik.bme.hu>
Message-ID: <f199ca36-3587-1468-5b41-39bcc8ea01d@eik.bme.hu>
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
 <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
 <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
 <42729919-1fc8-5c71-3717-49eb5c930da5@ilande.co.uk>
 <ff3af9f2-82f-1eb2-61d3-6dd68fefc222@eik.bme.hu>
 <c7c9cf50-be0-4931-70f8-40fd653b2cf0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 8 Aug 2022, BALATON Zoltan wrote:
> On Sun, 7 Aug 2022, BALATON Zoltan wrote:
>> On Sun, 7 Aug 2022, Mark Cave-Ayland wrote:
>>> On 07/08/2022 12:47, Elliot Nunn wrote:
>>> 
>>>>>> I want to give Mac OS 9 clients access to hardware cursor support, to 
>>>>>> improve
>>>>>> responsiveness in absolute-cursor mode.
>>>>>> Would it be acceptable to add a hardware cursor interface to the VGA 
>>>>>> device?
>>>>>> And if so, can anyone advise on an appropriate register layout?
>>>>>> This is an example of such a patch. Because it alters the Bochs VBE 
>>>>>> interface
>>>>>> it is ONLY an example, NOT fit for acceptance. I have omitted the 
>>>>>> changes to
>>>>>> the binary driver qemu_vga.ndrv.
>>>>>> Kind regards,
>>>>>> Elliot Nunn
>>>>> Nice work! Have you been in contact with the Bochs developers to see 
>>>>> what their thoughts are to your proposed changes? Generally QEMU prefers 
>>>>> to implement documented specifications, so this would be the best route 
>>>>> to go.
>>>> 
>>>> Thanks! I don't think it would be appropriate to update the Bochs 
>>>> standard with a feature that they don't use. And on reflection, perhaps 
>>>> the compatibility-oriented VGA device is big enough already.
>>> 
>>> Sure, no worries.
>>> 
>>>> My plan is to write a Mac OS 9/X "ndrv" targeting virtio-gpu. All going 
>>>> this well, this might become the default mac99 GPU until ati-vga is 
>>>> ready.
>>> 
>>> That sounds really interesting. Is there a forum/mailing list somewhere 
>>> where it is possible to follow the Mac side of your work? I can certainly 
>>> advise on the qemu-system-ppc side.
>>> 
>>>> But virtio-gpu is not compiled into qemu-system-ppc by default. What is 
>>>> the difference between CONFIG_VIRTIO_(GPU|PCI|VGA)? And is 
>>>> configs/devices/ppc-softmmu/default.mak the correct place to declare 
>>>> them?
>>> 
>>> You probably want to add a "select VIRTIO_GPU_PCI" and/or "select 
>>> VIRTIO_GPU_VGA" in the "config MAC_NEWWORLD" section of hw/ppc/Kconfig to 
>>> enable the virtio devices for the mac99 machine.
>> 
>> Not sure how this works but pc and pseries machines seem to have imply 
>> VIRTIO_VGA so probably that's what you need to add to config MAC_NEWWORLD 
>> or just try qemu-system-ppc64 -machine mac99,via=pmu -cpu G4 which should 
>> already have it due so pseries but may otherwise be equivalent to the one 
>> in qemu-system-ppc.
>
> I've tried this:
>
> qemu-system-ppc64 -M mac99,via=pmu -cpu G4 -m 512 \
> -vga none -device virtio-vga,romfile=qemu_vga.ndrv \
> -cdrom "Mac OS 9.2.2 Universal Install.iso" -boot d \
> -serial stdio
>
> to see if it recognised the card in vga mode but it does not work. (Without 
> the second line disabling stdvga and adding virtio-vgs this does boot for 
> me.) The problem seems to be that openbios does not recognise the rom, maybe 
> because it expects the rom to be at BAR 6 and only tries to map that but 
> virtio-vga seems to have rombar=1 by default (see info qtree in monitor). I 
> did not try if it's settable though so maybe adding virtio-vga,rombar=6 could 
> get it further?

I've tried with rombar=6 but it made no change. I don't fully get how this 
should work. Even by default when rombar=1 the virtio-vga device does not 
seem to have BAR 1 but has a BAR 6. Openbios seems to look for that but 
maybe only for vga devices it knows about. I thought it would also look 
for device class but maybe it needs to be added to openbios's pci database 
for it to recognise and try to detect an NDRV in ROM? Maybe Mark could 
look at it and advise. I think I gave up here, don't want to debug this 
further but getting MacOS 9 boot with virtio-vga in vga mode would give 
Elliot a good start to experiment with ndrv and not fight with QEMU and 
OpenBIOS instead just to get started.

Regards,
BALATON Zoltan

