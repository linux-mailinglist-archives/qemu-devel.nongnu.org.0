Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2E6871D8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 00:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNMRf-000747-Us; Wed, 01 Feb 2023 18:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMRb-00073q-E5; Wed, 01 Feb 2023 18:23:11 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMRY-0004lk-OF; Wed, 01 Feb 2023 18:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cngZfv+ibB5G74DLNictas4u+1k403QfTPqMP5ddq+4=; b=XQdxEgj8yKz1QnDHcai19DZTzI
 r4dhpryegrM4XVSYKQUjWQg3GpgTxchKopz3c+a/wbepTYEsILNZC/KhbjFbW6y32X/wZoES5dalJ
 K2JLfVQIvE5YRrwDodYbdMZnaQGF/J2d60GW2XaUEsqO6n/3CZiak528uykzoYdNGtgS17T//VGTb
 KJD3k3GuSyu7YHIOMLbyXt14ENB1yT+W5hSyY4xja8F2gkT66PRnPPZedg3l7J861Thy57ml6W7UD
 lnRaQveaR8q3Hh4je0tdqd9vAdfqKcJMaEieHvAyWOk5D6ZXkYLXCLQ0OhicRm8951/1hl8QPweK5
 QMUFrsx7DCqggpZIDrpM5fxP9xJ7XuqeFb5lWo02+CeTJoYHCkMk16FDkB0xljrxblTAnXEvqvEtc
 3rTnm4yt0VOff3zxwEH3zgEeGe7ZPdacnyv7wfeUu6MFNNItRLB6CLJQ8Cr9+1RhU/0tndHVeTkI5
 ZkSUS/Ca/5m1s5QHZTQZSZPw2hvsIYfjpc0gpng8rsZy+3Aj7pHmApj6qdfGDAjYXWFa6R8hNPE2W
 9B3B/HlVZQzXwCB2mukKaKyCrTZ07e+WhbIJAivSR9tH9NXp+DE82SUWV/RTpBbTCKAloPiIyHSRm
 wihDFbejztenBpbuXXfGuwJtJb09buoPVux0NfqOk=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMR4-0005h8-7H; Wed, 01 Feb 2023 23:22:38 +0000
Message-ID: <03b87bea-d83b-b1ef-f742-15c29a177a1c@ilande.co.uk>
Date: Wed, 1 Feb 2023 23:23:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <e8d6aa41eeb0461d285fa4c12e0fff05d366e8fa.1672868854.git.balaton@eik.bme.hu>
 <8e775600-f394-0e9c-9ee9-15dd635275e9@ilande.co.uk>
 <a7d27169-97fd-2cb2-e6d1-a050dbf76e30@eik.bme.hu>
 <78fff8b3-d1c1-74ec-94bf-8d5ae220c4e2@ilande.co.uk>
 <8ef24b01-534a-fd8f-ad99-abebff6197c8@eik.bme.hu>
 <3da914a8-ca58-e578-ae8d-0a82b28a6cbf@ilande.co.uk>
 <f245ead8-2ff8-55eb-3884-01e8d791d672@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f245ead8-2ff8-55eb-3884-01e8d791d672@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 3/7] mac_{old,new}world: Pass MacOS VGA NDRV in card
 ROM instead of fw_cfg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/01/2023 00:13, BALATON Zoltan wrote:

> On Mon, 23 Jan 2023, Mark Cave-Ayland wrote:
>> On 22/01/2023 22:16, BALATON Zoltan wrote:
>>>> The problem you are ultimately trying to solve though is that OpenBIOS is loading 
>>>> the NDRV for all VGA PCI devices, so why not just fix drivers/vga.fs so that the 
>>>> NDRV is loaded only for the QEMU VGA device?
>>>>
>>>>> So this patch neither adds new dependency to QEMU nor repends on any change in 
>>>>> OpenBIOS. It just gets rid of passing files via fw_cfg.
>>>>
>>>> Unfortunately that still doesn't solve the problem of building a self-contained 
>>>> OpenBIOS ROM, so this patch isn't the right way forward.
>>>
>>> It does take a step to make it possible to eventually add a self contained ROM and 
>>> remove the vga.fs from OpenBIOS but it's not doing that fully. It just simplifies 
>>> QEMU and OpenBIOS vga.fs for now and making the ROM also contain the FCode will be 
>>> a further step but we can't get there if you don't allow to make smaller steps or 
>>> don't merge my patches for OpenBIOS which would allow it to run FCode ROMs. If 
>>> you're waiting for all this to be finished I'll give up and it will never be 
>>> finished. If you allow to progress in smaller steps then maybe we'll get there.
>>
>> You can already add a self-contained rom using the romfile= property, so that's not 
>> preventing you from doing anything though? Even once OpenBIOS can
> 
> Except that OpenBIOS will break the device tree by adding the qemu_vga.ndrv to the 
> video card node so the card rom I pass via romfile will see it's already there and 
> won't install its owm. Then MacOS will try to use the wrong driver and it does not 
> work and I spend a lot of time to find out I also need -prom env vga-ndrv?=false to 
> avoid this problem which I always forget and somebody trying this for the first time 
> won't even know.
> 
> What's more, all this complication is not needed. With this patch everything works as 
> before for std VGA as it will have the qemu_vga.ndrv as its romfile but ati-vga won't 
> so OpenBIOS only installs it for std VGA without adding anything to OpenBIOS to 
> handle this. Adding a romfile to ati-vga will work without further hassle and the 
> romfile option can also be used to replace or disable the qemu_vga.ndrv for std VGA 
> as -device VGA,romdile="" (or add your FCode in development here). Due to the way 
> standard VGA works adding -device VGA,romfile= to the command line won't add a second 
> VGA device just set the option for the default one (actually it omits the default and 
> adds the specified one but the point is this just works).
> 
> Then we not only not need to add anythig to OpenBIOS but we can drop the vga-ndrv? 
> option (which does not exist on real machines anyway) and also all the code in vga.fs 
> to get the driver from fw_cfg so simplifying it leaving only the code which will 
> eventually need to be part of the FCode ROM. Once this patch is accepted it fixes the 
> above problem and allows to simplify OpenBIOS later and when we're there you just 
> have to replace qemu_vga.ndrv with the version that prepends the FCode from vga.fs 
> before it so I don't see what's your problem with this patch. Can you give a reason 
> why it can't be accepted?

It doesn't work this way though: once the FCode ROM is working it also generates the 
QEMU,VGA device tree node, which means that -device VGA,romfile="" will not only 
disable qemu_vga.ndrv, but also leave a device node missing the properties required 
for the guest to correctly identify the VGA adapter.

As I already mentioned, this is the wrong approach and what is needed is to fix 
vga.fs in OpenBIOS so that the NDRV is only loaded for the QEMU,VGA device.

>> read PCI option ROMs, the option ROM will still need to contain OpenBIOS's vga.fs 
>> as a payload, and it will still need to be able to inject qemu_vga.ndrv because 
>> OpenBIOS cannot have an external dependency upon QemuMacDrivers.
> 
> The way real card ROMs work is that they embed the driver binary and have some FCode 
> that adds that to the device tree. It should be the same for QEMU emulated cards so 
> if you say that you want only vga.fs as the card ROM which then downloads the 
> qemu_vga.ndrv from QEMU that makes no sense at all. Currently the qemu_vga.ndrv is 
> build from QemuMacDrivers and added as a binary to QEMU. You can add it as a binary 
> the same way to OpenBIOS then build the FCOde ROM from vga.fs and qemu_vga.ndrv bin 
> that results in the FCode ROM that will replace qemu_vga.ndrv binaty in QEMU. You 
> just say this is not possible because you're OK with adding the qemu_vga,ndrv binary 
> to QEMU but doing the same with OpenBIOS cannot be done?

What you're suggesting doesn't make any sense, as all you're doing is moving the 
binary from QEMU where there is already precedent for distributing binary ROMs to 
OpenBIOS where it becomes a build dependency that cannot be built outside of a very 
specific guest environment.

I should also add that it wasn't me who designed and implemented the existing scheme 
for keeping the qemu_vga.ndrv binary in QEMU, it was Ben - and his approach still 
seems to be the best solution in my opinion.


ATB,

Mark.

