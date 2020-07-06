Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38585215D0F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:26:21 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUsm-0008WF-AG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUTH-0006xk-EZ; Mon, 06 Jul 2020 12:59:59 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:39326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUTF-0005vQ-F9; Mon, 06 Jul 2020 12:59:59 -0400
Received: by mail-il1-x141.google.com with SMTP id k6so33497267ili.6;
 Mon, 06 Jul 2020 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9/leO9q/0J5ZJH/Ka9OiHxF4rkOPGYi23nLotDw5+po=;
 b=t+L89NigImBrMi5A+L/vayp2Ek2Z1xRrRswlKbUWeD6I7FIa+voJRjlBIqb0sMzDec
 lqkQijLEMiyv2fVJODfnOo9v77QgO6cdGwJYO8vhoClltQxpALdDRs8ENXpnUTqPC8qf
 cTqrxHmxfkx4pm++FONued1iM/PgnDbs7eHuq38xcfAZlmcjn7mbBAeb9JBvYwXLMk1x
 fkmZUkSQLJ52R1fsCbmaL3rpzt43x9FH+XrveDmr0sQHoPrYO1DZaIY+DO5ZZzWlqj8M
 WZZMs8mMEJb1bdpZBZrqRgqogw2cqAXAXg5S3fLxb9M/1IpPh6xuhL4Lmki4tyc8gx5S
 /BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9/leO9q/0J5ZJH/Ka9OiHxF4rkOPGYi23nLotDw5+po=;
 b=jktVYO3B9SHAm4OEA3P1v5xV2UFlxyfd8ZjvSyPvv2pN9IxK8eqJYfm/PAUsVefeVD
 B82S0VIP0Xokqtm/v1w3cqh0yaFyuz9r1A+2bSChgxo/NQSF9p/17iUXm2Xkyq2gcO1w
 yuL3liAHRutEkQgoNGEcsDdHdEZMiBH964Wh4Dp1YcIXjz3Orh2cs81K70odzse6DutJ
 vEFC5E5uFD53jNPrHRNNCrblWP6/R2Pp5p8e07bLTr1/3nasXMxrxTCqPmuw5OCN7lN9
 r7ozSbOCSG+R2hp8qbegYi1j0DuyubAOys3FeoQnCXwZQszJXrYkBZHoUGKN1hb5UF8q
 S/DQ==
X-Gm-Message-State: AOAM533Rd8rSdsOWlwHpfgoJIqOQ/MuCzpO2ayQsKEQ1pewlhRgOdyiL
 KB8MO6Iq0fJRCYJo1zt9Wtj8afjzQFM+z9vX3Tg=
X-Google-Smtp-Source: ABdhPJw/HaHEsm0ulaS03PTv+Iez2OAy3BXjXkZdtFUms+Csyj/gKycDAQBhYI+0mtg7FDmV0+SOu7NjIzp7EDuPP3Q=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31588925ilo.40.1594054795800; 
 Mon, 06 Jul 2020 09:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-3-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:50:09 -0700
Message-ID: <CAKmqyKNB3fQCBNZ29cRuj5LW14duowkP6+k+6V0fhHhZU+GtsQ@mail.gmail.com>
Subject: Re: [PATCH 02/26] hw/ppc/sam460ex: Add missing 'hw/pci/pci.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file uses pci_create_simple() and PCI_DEVFN() which are both
> declared in "hw/pci/pci.h". This include is indirectly included
> by an USB header. As we want to reduce the USB header inclusions
> later, include the PCI header now, to avoid later:
>
>   hw/ppc/sam460ex.c:397:5: error: implicit declaration of function =E2=80=
=98pci_create_simple=E2=80=99; did you mean =E2=80=98sysbus_create_simple=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>         |     ^~~~~~~~~~~~~~~~~
>         |     sysbus_create_simple
>   hw/ppc/sam460ex.c:397:5: error: nested extern declaration of =E2=80=98p=
ci_create_simple=E2=80=99 [-Werror=3Dnested-externs]
>   hw/ppc/sam460ex.c:397:32: error: implicit declaration of function =E2=
=80=98PCI_DEVFN=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>     397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>         |                                ^~~~~~~~~
>   hw/ppc/sam460ex.c:397:32: error: nested extern declaration of =E2=80=98=
PCI_DEVFN=E2=80=99 [-Werror=3Dnested-externs]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ppc/sam460ex.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 1a106a68de..fae970b142 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -38,6 +38,7 @@
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/ppc/fdt.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/pci/pci.h"
>
>  #include <libfdt.h>
>
> --
> 2.21.3
>
>

