Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727826AA956
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:54:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQRt-00004v-O9; Sat, 04 Mar 2023 06:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQRr-0008WN-IR; Sat, 04 Mar 2023 06:53:11 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQRp-0003ba-Tp; Sat, 04 Mar 2023 06:53:11 -0500
Received: by mail-vs1-xe35.google.com with SMTP id x14so4786724vso.9;
 Sat, 04 Mar 2023 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f614g8cQg7ojygKrnx0Ed4xthODJz3prPcgMxPgb0Yw=;
 b=QAhMLY9dblUoJJ9AzNhioASMhYFx5YO8u5xA3djUosF2N4Sq9+BtLD2BKV/wO1he0e
 VdOYt6zMCY9KtdXYKkYKkhj6PDIR/bHBCER2IFaO5pjOloVfm9AxNVa88AXWgfq0IzX3
 94vXvcqNMSawKmk6BfSGv1zOXX2+cn17KSIP3NOsOBsboI6nnDR6oFHb/9WybOkmkDmI
 jDA4vo2KLnaIEMlMQyiBTdL01xQUEQKY30yii783eDe5WH5V7FQ8rOuLJYxjcKCRR7S+
 bWl24yYqzR2dCGwkIjKRIDichRi0uGGXIwtSdFmLJEBBaDcBOamh/G/M3Gt6bZwgFmaS
 G09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f614g8cQg7ojygKrnx0Ed4xthODJz3prPcgMxPgb0Yw=;
 b=CI69QWx5u3FHglFZDmLpsXa1uHY41wERgav1LmIelokDE4nsGiw9T4cdUxHCCkqKzn
 n58N+7i0S07CpD94X1nVOFMOGM97zrdP9/j0kiidLRWMLqFVQRf528xh5Fz8kvyQYvun
 A2aAhHL6MTERpUMbjl5JqnAcAV8RUJhyfwI50xHJT0fqwykC9v8kjutKRLLC3e2XsIFv
 2gI/LjceijESLpATwO74yjfuy9ppBmVvimhKomt5C8nWCJ00p/O6PiRYxVLn4xamUDiO
 +OO4dVNA+/S3ONc5XtYy+x6Eydw0sseJJGd4npBvUKNroifa69Mn8VXSm/OsDpUhMGxH
 +f8Q==
X-Gm-Message-State: AO0yUKWhNObbimUs9GyG8kg8Zyb3en3dD4W3YOTSjPnRCsYcZYw4uO6I
 DlJnWcYure8rhqvmUkxGSLxE3aO/9QF2lxG7+b8=
X-Google-Smtp-Source: AK7set//9y151nCXNEZLZZdR0lwx2YLyo2s9ZIu6JctAlxI/ww63BEV3XCd9sJG30BY/W1dRf9Pc5BscGBJ9rou0q4g=
X-Received: by 2002:a67:e94c:0:b0:421:c4a7:872b with SMTP id
 p12-20020a67e94c000000b00421c4a7872bmr1236712vso.6.1677930788484; Sat, 04 Mar
 2023 03:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
 <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
In-Reply-To: <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 4 Mar 2023 12:52:57 +0100
Message-ID: <CAG4p6K4aj5n0a68-PKU7=7E7fBwG2jnvD+rPeTvwjUE-kRZ7GA@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Woodhouse <dwmw2@infradead.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Am 3. M=C3=A4rz 2023 07:46:31 UTC schrieb Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk>:
>On 03/03/2023 06:58, David Woodhouse wrote:
>
>> On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daud=C3=A9" <philmd@lina=
ro.org> wrote:
>>> Since v2: rebased
>>>
>>> I'm posting this series as it to not block Bernhard's PIIX
>>> cleanup work. I don't have code change planned, but eventually
>>> reword / improve commit descriptions.
>>>
>>> Tested commit after commit to be sure it is bisectable. Sadly
>>> this was before Zoltan & Thomas report a problem with commit
>>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
>>
>> However much I stare at the partial revert which fixes it, I just cannot=
 believe that the change could make any difference at all. There's got to b=
e something weird going on there.
>>
>> I was going to ask if the level mode for the PIT made any difference, bu=
t this is the output IRQ from the PIT to the CPU itself so I don't see how =
it would.
>>
>> Would like to see a report with tracing from pic_update_irq, the CPU int=
errupt "handler" and the intermediate IRQ handler. With the intermediate pr=
esent and without it. To compare the two.
>
>I suspect it's related to the removal of the allocation of the qemu_irq: q=
dev gpios work by adding a child IRQ object to the device, so it could be p=
ossible that something in the gpio internals isn't being updated correctly =
when the value is overwritten directly.

I've just sent a series fixing the issue.

The problem was that cpu_intr gets populated by
qdev_connect_gpio_out() in board code which happens after via's
realize method has been executed. So in via's realize method cpu_intr
is still NULL which causes a NULL qemu_irq to be passed to the i8259.

One way to fix this is to move qdev_connect_gpio_out() in board code
between pci_new_multifunction() and pci_realize_and_unref().

By having an intermediate IRQ handler the problem didn't appear since
the (non-NULL) qemu_irq holding the intermediate handler is passed to
the i8259. The intermediate handler delays reading cpu_intr to
runtime, so initializing it after realize() is no problem. The price,
however, is that an indirection occurs at runtime every time cpu_intr
is triggered.

BTW, the PIC proxy in my PIIX consolidation series attempted to solve
the same problem: The ISABus IRQs need to be already populated in
piix-ide's realize method, otherwise NULL qemu_irqs are used. As long
as piix-ide is realized in board code, separately from the piix south
bridge, the ISABus IRQs can be populated in between. However, once
piix-ide is realized in the south bridge, the ISA IRQs must be
populated before the south bridge's realize(). The PIC proxy solved
this by introducing intermediate ISA IRQs while the latest incarnation
of the PIIX consolidation series uses the same approach as described
above.

Best regards,
Bernhard
>
>Is the problem picked up when running a binary built with --enable-sanitiz=
ers? That's normally quite good at detecting this kind of issue.
>
>
>ATB,
>
>Mark.

