Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB5C3A15
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 18:12:09 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFKkx-0001f1-VL
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 12:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iFKXj-0005Pm-Su
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iFKXh-0001PM-6v
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:58:27 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iFKXh-0001Oq-1G
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:58:25 -0400
Received: by mail-oi1-x243.google.com with SMTP id k20so14904979oih.3
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vsem6ZafI/+qNYNgO6EXIbfTstNrRw713QTRbPGlH0I=;
 b=JjYT9LIYO56Az3eJCNJUZZ38ta0PWtTn8IsWNL3UpC8AY+YUoBW5W+4Y261YonhIym
 Y98TX/cviHgMoPIFPpvcTYIGTUIe5WMbFQIAqtXR2pFijA2jCdetjW2QYzX/kK2+4RzE
 emfd4FOENCrp6FqGTu6gJeB8PE1GkjQwd9ACLZ6AHVB3bDOwpMtIb3CeTXHNQs7j1rVI
 q7AtclxJL03zvW0iLUe+iiHiOEshfCuXvKv+N0w5jpQ0h/0R3opTV3inkMJWq+azOQiv
 KZDQWbPsKgoWwrKJ/Fvip5IV5ejp4hG4hMWRSaoU69+6gVvWMSkSo757y3yOp75ik7xm
 liEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vsem6ZafI/+qNYNgO6EXIbfTstNrRw713QTRbPGlH0I=;
 b=ElmYFZoCFozO/3c15mzgZSyLD+ihchOuEAeMC5YZqVsthF7z6ufVRDvs5kXFRD8ZBC
 gVh7OVh//t6thmQe0aDGJYU4aHGRuSVX6Qd4jNs4JxAzxdI28CaOUHp0BeIjQZLY/dOO
 Dr/Yi3BsWea0yijgFC3NtHKvFbAH5qSb3vDGoYa2rmVuQGwgvL3OIEmNcjOY+GDkB7mA
 aW4ncuCAZ6UOZB7EcB6gvBVja93W4h0UoURtZMEpil9hdCrxGhT6oe5CCOXRYIz76MdS
 StjXDrxhWW6xCvR3Vm8WNZYwE3kxKKqFKfYeOrF8xMHDHtawJLNlcw6hUacuOU7gKkR0
 0Wiw==
X-Gm-Message-State: APjAAAU8IIIeQQjhDi6W9uQuD+i7VUIiaPQ64UvVET7U/2IooSC0uAhs
 Vw7deY47Gv0X+upe1p8OhQ4Nry3bc8cHLEiClOkXtw==
X-Google-Smtp-Source: APXvYqx+8YjqrpaLan8c2KZMmSDkjVVDpi/bdClS9zbLT+tnRRQUJ0abNn9Kjrh0u9FRxMUV4GzLHlFQrxQdsQoBTxE=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr4133622oib.48.1569945504015; 
 Tue, 01 Oct 2019 08:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
 <1569936988-635-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1569936988-635-2-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2019 16:58:13 +0100
Message-ID: <CAFEAcA-o6DS4JUHGnm4M=nD78U4esN5Jj7F5cuJaA8U1YBrTbQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] ide: fix leak from qemu_allocate_irqs
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Oct 2019 at 14:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The array returned by qemu_allocate_irqs is malloced, free it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/ide/cmd646.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index f3ccd11..19984d2 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -300,6 +300,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>          d->bmdma[i].bus = &d->bus[i];
>          ide_register_restart_cb(&d->bus[i]);
>      }
> +    g_free(irq);
>
>      vmstate_register(DEVICE(dev), 0, &vmstate_ide_pci, d);
>      qemu_register_reset(cmd646_reset, d);
> --
> 1.8.3.1

It's a bit weird to be calling qemu_allocate_irqs() here in the
first place -- usually you'd just have a qemu_irq irqs[2] array
in the device state struct, qemu_allocate_irq(irq[i], ...) and
pass irq[i] to the ide_init2() function to tell it what
qemu_irq to use. Or else you'd keep the pointer to the
allocated irqs array in the device state struct, so as
to be able to free it on any theoretical hot-unplug your
device might support. Calling qemu_allocate_irqs() and then
immediately freeing the array means that there are now
two actual qemu_irqs floating around which are supposed
to be owned by this device but which it has no way to
get hold of any more. This is only not a leak because
the cmd646 doesn't support hot-unplug.

(Hot take version : we should be getting rid of qemu_allocate_irqs()
entirely: it is essentially a "pre-QOM" API and there are better
ways to phrase code that's currently calling it.)

thanks
-- PMM

