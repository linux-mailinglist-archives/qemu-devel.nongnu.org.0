Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FFE1A6F09
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 00:23:30 +0200 (CEST)
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO7U5-0000cv-Vi
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 18:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Sm-0007bZ-Qt
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Sl-0005wg-Qt
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:21:56 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:37486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Sl-0005vo-N4; Mon, 13 Apr 2020 18:21:55 -0400
Received: by mail-vs1-xe43.google.com with SMTP id o3so6492710vsd.4;
 Mon, 13 Apr 2020 15:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v0jThFdD3YVZ/w6qPk+uCkOCoUfxMusuJ3Be9Jn1344=;
 b=Cm5P/KbzbJd7oqOLaztSdQIm99FCsdFv8TiABQDJ0oUFnDYLg4Kyiy42JquV/P86Fr
 64eTJYO9Y7ms0PuHrq0LJfcMZ2DGScEVH5wEgxp7VkFuFPF8uFUiIA0Ap51Qto1Ahvr6
 KSy8/TzOPfxFeGr6Fb18+1mgMnsLfHSFNDnmQeBf6ID4c4ZFqE+CJAqiRygGYJ+rB5MC
 N1OLF82tGDOF+FaR9jUwLUNvo8CPIq0hkR4FZTfufQajBcK7bS6EDfDfJCVEcegXMEfe
 cTl+otnt4zjQYxoHdGPhFb9yW36SQmwrn5wtMhHYg2efSv1xp6UlfI+3T4HfAoclKJ9q
 sFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v0jThFdD3YVZ/w6qPk+uCkOCoUfxMusuJ3Be9Jn1344=;
 b=q6JihgV4viyZqDGFhicefQFkAfEaZZ1AfEPmlkmgtJYG9KKbX0abHZ43yTqYNOmhG7
 Lmlg4ExX61Jzbz28+Q7hMyvG4wz2Dq8nTR84OFWt/6rJcR6BaVhOQfBAYqqAV/1zNdzN
 CoiY7gYGyv74xrWOPYaTJRD3y6oO6EYD7SPEdP9PXijstLIgjOCMPh4QBRflmGnUN9gK
 BN1Tb9FybzGs+TSn9feuOJcPbncb4VulKCXDLLbhgsY6/zjgFUqJrldnBZPVrOQcMjej
 VqpOe8tNgwZEyGL7wau/xLfJr+w+03ePqtFydqbthQU3d4pYEOLCe6DzVYJbW+Nv3BRl
 Lv7Q==
X-Gm-Message-State: AGi0PuZNVlbnU+3g45nOvjMPM85/3BKRyucIipYVZcPDxEMBrhVT5DPL
 dZbA/mAmkEXXjcB9nI1kKsQwLbcvE40PF1mK8z8=
X-Google-Smtp-Source: APiQypJEDRlNQT/C43oFGRNuua/kx8l092CfOoAQa9HHRf7qUUlUMYp1enTXj7oKdDgmdsEHCTQTZIuxEsqXx4b+y7E=
X-Received: by 2002:a67:e2d5:: with SMTP id i21mr4717956vsm.151.1586816513982; 
 Mon, 13 Apr 2020 15:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200412224144.12205-1-f4bug@amsat.org>
 <20200412224144.12205-11-f4bug@amsat.org>
In-Reply-To: <20200412224144.12205-11-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:13:37 -0700
Message-ID: <CAKmqyKMzVTexQcri0t62fdZnU-cxYPNH-vN1xDT5T4CN+3Y64Q@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 10/23] hw/microblaze/xlnx-zynqmp-pmu: Add
 missing error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 12, 2020 at 3:58 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
> index 2aa602cf85..4ecbea7fdc 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -123,7 +123,11 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState =
*dev, Error **errp)
>      /* Connect the IPI device */
>      for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
>          object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized",
> -                                 &error_abort);
> +                                 &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0,
>                             qdev_get_gpio_in(DEVICE(&s->intc), ipi_irq[i]=
));
> --
> 2.21.1
>
>

