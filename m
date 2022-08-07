Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF758BB16
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 15:53:30 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKgie-0005nc-T1
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 09:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oKgh1-0003v7-E0
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 09:51:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oKggz-0003S2-EM
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 09:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6HfoeVYMNhirsn63QVVxSuP1ENVaaYDEJAfbiRO4wiU=; b=v83OLvdGKaCNcVL+EkbEJoUXXO
 NewTfFgvFzlP7BJhv7URiktxxLiAWCQfUIOQ9AwZh4UrzMcA9T4qn8GYSe75Ng1MLAIt0Vvb+VNEL
 vNk9jGT38BetIv8gTD9KA44RrQLCzGcxj8mSDCrpaLWGNEw6n0/8cJvOkuja4iTb/rgDU3tpU0JOQ
 oXH5e7wTHS7lioKMVyUBLu5qKXnvuROT2F0mdTpOEXL8HFxCNFoy+HG63SzhvpLvnjWuExOtF341Z
 UOYENFkXxeZCwe40oDyYUGTYA5WmnLXxRqVn327DHpI6Jvz510tOIMCK1G6WcRDP0he0kkbRYfLjC
 YQ9QDOWQ3K8L44D0v4VZlRHamuDzQ/CvWtrGX3fDnYgmOUI9BDvq5ssnoTzsm1FfkEwjPQDY21LKw
 ERc3WyfohhqHHek0HFlt6I/jeYGpTi3oeYZVtIpX4ZtZWnFMruPie+iqjwGwD/N1f0PkxYFtNa2SO
 henK3YGNJkaFuv2V/UhETomIwvlYBKDUl0XZsyXFnWqzTdAtiKiB7IA66k7h0VmNPkA1W3o+g+nj1
 UAuoevplAWl45PWB7GXQMCLP7TF6DEbg9OEXP7y4y5qrSz9lxIeO4/Td5QvKbex8EDfMj0zREZHHT
 qNf+OgqQSAoSQ16ylv3W2912hlggBn58mIv9tBVlk=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oKgfX-0001p4-Lm; Sun, 07 Aug 2022 14:50:16 +0100
Message-ID: <42729919-1fc8-5c71-3717-49eb5c930da5@ilande.co.uk>
Date: Sun, 7 Aug 2022 14:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Elliot Nunn <elliot@nunn.io>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>, hsp.cat7@gmail.com
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
 <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
 <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: VGA hardware cursor query
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

On 07/08/2022 12:47, Elliot Nunn wrote:

>>> I want to give Mac OS 9 clients access to hardware cursor support, to improve
>>> responsiveness in absolute-cursor mode.
>>> Would it be acceptable to add a hardware cursor interface to the VGA device?
>>> And if so, can anyone advise on an appropriate register layout?
>>> This is an example of such a patch. Because it alters the Bochs VBE interface
>>> it is ONLY an example, NOT fit for acceptance. I have omitted the changes to
>>> the binary driver qemu_vga.ndrv.
>>> Kind regards,
>>> Elliot Nunn
>> Nice work! Have you been in contact with the Bochs developers to see what their thoughts are to your proposed changes? Generally QEMU prefers to implement documented specifications, so this would be the best route to go.
> 
> Thanks! I don't think it would be appropriate to update the Bochs standard with a feature that they don't use. And on reflection, perhaps the compatibility-oriented VGA device is big enough already.

Sure, no worries.

> My plan is to write a Mac OS 9/X "ndrv" targeting virtio-gpu. All going this well, this might become the default mac99 GPU until ati-vga is ready.

That sounds really interesting. Is there a forum/mailing list somewhere where it is 
possible to follow the Mac side of your work? I can certainly advise on the 
qemu-system-ppc side.

> But virtio-gpu is not compiled into qemu-system-ppc by default. What is the difference between CONFIG_VIRTIO_(GPU|PCI|VGA)? And is configs/devices/ppc-softmmu/default.mak the correct place to declare them?

You probably want to add a "select VIRTIO_GPU_PCI" and/or "select VIRTIO_GPU_VGA" in 
the "config MAC_NEWWORLD" section of hw/ppc/Kconfig to enable the virtio devices for 
the mac99 machine.


ATB,

Mark.

