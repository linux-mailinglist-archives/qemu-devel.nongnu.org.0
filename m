Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691B2E8101
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 16:36:16 +0100 (CET)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuzzr-0000qZ-0r
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 10:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzyh-0000Kk-0B
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:35:03 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzyf-0003Sc-6i
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:35:02 -0500
Received: by mail-ed1-x535.google.com with SMTP id i24so18447288edj.8
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LAtqigyxIB6iW0jmwf26+YtqPJRrnmOekDv4rBie1aM=;
 b=Cb+NkrT9KjQzOcfL3FOxEHrbV5i7q7LyEk6RU+AaH1OW9D4On6jVlWzx1RIaI2X3X4
 o2GLyVruAbSMh+mOyF3+kZQiAB7AAvGZJeZzu39B0+c9wx2vxqbSx3Muz15WdWV25aly
 C0o9yy+qnj72J47mFwmBgjxeX3GukXTXE2YdF2YVZQtCLjaFl6gGUioAtsMQa34Y5mM4
 ScR2ZokAn61bYtVSo8RvduhCVAh6JGEyqJ942NtxkFCIF9qp99ccvS5JREOsH4m+62xf
 5LRBlBz8Tj5AffYBVZz10YEg8Ys+/WtNyfkIJSJxSu5iu7tVKK4krr9yiXOiZYparyUH
 KWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LAtqigyxIB6iW0jmwf26+YtqPJRrnmOekDv4rBie1aM=;
 b=R1vb9E8l0rh/4iEMQLKwjUX/T+ADOQeWILpsM9SiQpUoU4N6BfZ+XrYjgfDkukcTTa
 N0sfKH2S4BrW2lLzzWVwp8FFaWb6uphLiR0tJcjy/tN1azt+zT+CJEVDosM9T08dt1sM
 s3tI1bE4Oc3d67fWbR2XbugjXAWSgL3AATCF0Cw9aE5PZ0TRRQmZiomJ5krEtLNme/al
 yZIdkFCOUFzN0y662J8wl7My44t6QUJEUR2yQqw0ps3Z1fD4CIE1BZXk9Gus/mnH0Dvm
 VYfnu7Vu8vxQcaUXsxxfdW+KUYTWE3DBY4/TYjRiovJKAGrOSr0ETkVYgaXZftzBHuqQ
 AQXA==
X-Gm-Message-State: AOAM530apcVq5EnK/taNlpOWiNz5APCM2StrNjJZI1Glmq0Gv+8dZRp0
 G3F/0qYFu/e8GoaIeX5WFHUpvg3xwaghT4DVUOIzQg==
X-Google-Smtp-Source: ABdhPJy/NR77pq4c+B62CoaPwGWAznB7frehgQvU7gjvpXeUviQkSedR853DY1mL1+slejSf0KNPVP+nBBTbGnLo83c=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr54951366edw.44.1609428899388; 
 Thu, 31 Dec 2020 07:34:59 -0800 (PST)
MIME-Version: 1.0
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
 <e8536b99-114c-e0fb-3e9d-a83c9975a20@eik.bme.hu>
In-Reply-To: <e8536b99-114c-e0fb-3e9d-a83c9975a20@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 15:34:48 +0000
Message-ID: <CAFEAcA87pR-G_r4ikjuze6TmUpUZGCG+d-syVU70r5U2Dp3uXQ@mail.gmail.com>
Subject: Re: Problems with irq mapping in qemu v5.2
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Dec 2020 at 23:45, BALATON Zoltan via <qemu-devel@nongnu.org> wrote:
> For the Bamboo board we have 4 interrupts connected to the PCI bus in the
> board but also have a comment in ppc4xx_pci.c near the above function
> saying:
>
> /* On Bamboo, all pins from each slot are tied to a single board IRQ. This
>   * may need further refactoring for other boards. */
> static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
> {
>      int slot = pci_dev->devfn >> 3;
>
>      trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>
>      return slot - 1;
> }
>
> Now I'm not sure what that comment means:

It definitely doesn't match the code, anyway...

> 1. All PCI INTA from all slots go to one irq, PCI INTB to another and so on
>
> or
>
> 2. All PCI interrupts (INTA-D) from first slot are connected to one irq on
> the board, then those from next slot are to another irq and so on

I looked at the datasheet for the PPC440EP SoC itself, and it
has only a single PCIINT pin, so all boards using this CPU
must end up only asserting one interrupt line into the interrupt
controller (presumably via an on-board OR gate?)

> The slot - 1 mapping seems to correspond more to 2. but that also means we
> can only have 4 slots.

You can have more than 4 slots -- one common approach is to
stripe the 4 interrupts across slots, so that if you have
4 interrupts 0, 1, 2, 3 then in slot 0 they are wired
INTA=0, INTB=1, INTC=2, INTD=3, and in slot 1 they are
INTA=1, INTB=2, INTC=3, INTD=0, and in slot 2 they are
INTA=2, INTB=3, INTC=4, INTD=1, and so on.
This just helps to spread the interrupt usage out and
minimise sharing of interrupts between devices, because most
PCI cards only ever use INTA (though they are permitted to use
all 4 if they have a need for it, I think.) This kind of striping
is just implemented by how you connect the pins on the PCI slots.
(This striping is what function pci_swizzle_map_irq_fn() implements.)

In QEMU's PCI implementation, it's OK for the mapping function
to reuse IRQ numbers -- PCI IRQ line changes go via pci_change_irq_level(),
which first calls the controller-specific map_irq function, and then
in pci_bus_change_irq_level() keeps a count of how many different
devices have asserted the (mapped) IRQ, so it calls the
controller's set_irq method with effectively the logical-OR of
all the input levels. (I was wrong about this in another email I
just wrote -- I'll go back and correct that in a moment.)

> I did not find a picture of the real board so don't
> know how many slots that has or how they are connected. I think we need
> more info on the real hardware to tell what's the correct mapping here.

Yeah, I couldn't find any documentation for the board itself either :-(

Incidentally, if guest software like Linux has been written and
tested on QEMU and not on the real hardware, then bugs in the
mapping of IRQs can be painful to try to fix, because if the
kernel was written with the equal-but-opposite bug it will then
not run on a bugfixed QEMU. We had a bit of a mess with the
QEMU versatilepb PCI controller that way.

thanks
-- PMM

