Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B976AAA5C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSdx-0003Se-MF; Sat, 04 Mar 2023 09:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSdv-0003S1-6g
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:13:47 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSdt-0004NM-90
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:13:46 -0500
Received: by mail-pg1-x52e.google.com with SMTP id p6so3100464pga.0
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677939223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zb11CQtK2fqqMSYnqxOo7WYpC13kjjp3NLuPFJs3JR0=;
 b=fkmFzfMqxn3RzIMsYhdsQEOFLR29eXlkiAPn9G+cwTmo9UJV2rvWHurV0GNmgIjcnB
 M4/TvbssSMFmwkIBORP7tb2NfcJKEOeElMkUIJXr2tdDrSHCkjmujjb7KxqP1pjtdrl5
 0aAhbf/WIDoUB6BWvOlET5DO2xQDTLGi40AUcGZ7LpKcmTCXsN2DUk93jkJh0epbnF9J
 +O5gxSTNjZgHZkSIKhq7kIwAnErrFuoWDEkFZGxBeAm1JNa0/2bRUIvRwyfnmw8z7Iec
 qLlotvYiQaHbrotOVkY0+UtHBq+Dtn0jr3fZBVExNtX0kYR1Y6zsg0PcxmtoaeyRJRGu
 zygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677939223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zb11CQtK2fqqMSYnqxOo7WYpC13kjjp3NLuPFJs3JR0=;
 b=PNGJcF1VjZdFu4rqeFvBAcvEG9ojRq4hdVilKZ0PM5UdOgKMZbqEitN+a7Lwy3oKMS
 vl/UGWyWuiFU8l0UQ0ECxa4r4KuQ5X0/7QlbYujvlDErc5EwaNgr+7QX3qDQvb5ctlAc
 n0fbJH/FrqTKa1coS3LY5UtrY0zZBPJKdY7FznEryz8NO+7swgQOZkRnPg2slj3pk86F
 vZNxyFxGipVES/EN2cXp3Rhkdrwd2dXzMYfLNmUTZkLkW//0Jx9wMTzQ735qGxlYdNcP
 L51ktBWl/CIkQ92N832wj5XeGSeA8sXIdHjSYppYGuKSmV12mZhsM8hs0gLBlxeEV4cd
 V+1g==
X-Gm-Message-State: AO0yUKWtpJlKktLcdacKyHrNm5x+oi6g2PvnsNRbk5jLNzaCx7YOM7rt
 DsJ05iyo7b7bcnYV77ILWa9NhvsmsxP9jNVTSJ5jHw==
X-Google-Smtp-Source: AK7set8NGqMTWHgvRkl/LlMgeOOrncjNfZPgQ1ltMjPAGYlrOzPUM6byJ+mafhiUaKE5mLW2KvuD3pDyOn90dj+uzWc=
X-Received: by 2002:a05:6a00:1d9f:b0:5a8:aaa1:6c05 with SMTP id
 z31-20020a056a001d9f00b005a8aaa16c05mr4032422pfw.2.1677939223496; Sat, 04 Mar
 2023 06:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20230304114043.121024-1-shentey@gmail.com>
 <9fe57041-7b4c-5cec-cb7e-f91b5403eb53@eik.bme.hu>
In-Reply-To: <9fe57041-7b4c-5cec-cb7e-f91b5403eb53@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 14:13:32 +0000
Message-ID: <CAFEAcA9RUoW89ATMxNOy7y9WqoJaTUX2Sk=WoXVS+4ODOds9mg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, 4 Mar 2023 at 13:30, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 4 Mar 2023, Bernhard Beschow wrote:
> > A recent series [1] attempted to remove some PIC -> CPU interrupt indirections.
> > This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because the
> > qemu_irqs aren't initialized at that time yet. This series provides a fix by
> > initializing the qemu_irq of the respective south bridges before they
> > are passed to i2859_init().
> >
> > Furthermore -- as an optional extension -- this series also fixes some usability
> > issues in the API for creating multifunction PCI devices.
> >
> > The series is structured as follows: The first three commits fix the
> > regressions, the last two fix the public API for creating multifunction PCI
> > devices.
> >
> > [1] https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/
> >
> > Bernhard Beschow (5):
> >  hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
> >  hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
> >  hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
> >  hw/pci/pci: Remove multifunction parameter from
> >    pci_create_simple_multifunction()
> >  hw/pci/pci: Remove multifunction parameter from
> >    pci_new_multifunction()
>
> I'd postopne the last two API change patches to the next release. Ideally
> the device itself should know if it's multifunction or not and the board
> instantiating it should not do anything different than instantiating a
> single function device so we's only need pci_new or pci_create_simple
> without multifunction parameter or variant. So my question is why do we
> need these at all and could this be simplified more? But there's not
> enough time to answer that now so I'd ask to leave these alone for now and
> come back to this in next devel cycle.
>
> The other 3 patches fix a breakaga in current master so can be considered
> but I'd need to know a decision if this will be taken or a revert as I
> need to rebase my pending patches accordingly. A maintainer please speak
> up here.

If we're happy that patches 1-3 fix the regressions and look OK
code-wise then applying them is probably the simplest thing.

thanks
-- PMM

