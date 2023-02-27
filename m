Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351236A4882
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWham-0000OP-K4; Mon, 27 Feb 2023 12:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWhak-0000Nw-Dq; Mon, 27 Feb 2023 12:47:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWhai-0002rM-0L; Mon, 27 Feb 2023 12:47:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6269E746335;
 Mon, 27 Feb 2023 18:47:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3D64A74632B; Mon, 27 Feb 2023 18:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3BBBA7457E7;
 Mon, 27 Feb 2023 18:47:09 +0100 (CET)
Date: Mon, 27 Feb 2023 18:47:09 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
Message-ID: <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> Unfortunately my patches had changes merged in. This now makes it hard to
> show what really changed (spoiler: nothing that affects behavior).
>
> As you probably noticed in the "resend" version of this iteration I split
> off a patch introducing the priq properties. It belongs to the sub series
> of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
> to show up in `git blame` as the author of any of these changes. I
> attributed it to you because this was really your change which I'm not even
> sure is legal.
>
> Let's avoid such complications by keeping our series separate.

Let's cool down a bit. Philippe took some of the sm501 patches in his 
giant pull request (and a lot of your patches too) now so I'll wait until 
that lands and hope to get some review for the remaining patches too. Once 
that pull req is merged I'll rebase the remaining patches and resubmit the 
series also adding changes for reasonable review comments I get by then.

I plan to include your patches as before and competely ignore your 
alternative series as that's just complicating things now. I also would 
like to add another patch to implement the same workaround for MorphOS 
that I had in my original series if I can figure thet out. This could be a 
separate patch though so it's easy to revert when the i8259 model is fixed 
in the future (if ever). If you don't want to be author of your patch with 
only changing pci_bus_irqs for gpio_named then I can add Suggested-by 
instead which would still show it was your idea but would not get 
attributed in git blame for it.

You can't convince me that using pci_bus_irqs is the right way for the 
reasons I've explained before. It's also only used by pci-hosts and boards 
everywhere else except in piix which you've added (and those may also be 
wrong then). It may still work if I fix that up in pegasos2 but still not 
the right way. I mean now:

mv64361 connects PCI interrupts to its gpp 12-15 pins within its model, 
this lacks the connections to vt8231 so ISA IRQs aren't raised for PCI 
devices such as -device rtl8139

after my changes:

pegasos2 board connects PCI interrupts to both gpp 12-15 of mv64371 and 
PINTA-D pins of VT8231 after it instantiates both which matches what the 
schematics say and also how QDev prefers to model chip pins.

with your series:

mv64361 connects it as above then VT8132 replaces it with its own. Then 
you want me to add another patch to fix that all up to arrive at the same 
result as above? That's just clearly wrong and unnecessary. I don't see 
why you don't accept the above solution?

Regards,
BALATON Zoltan

