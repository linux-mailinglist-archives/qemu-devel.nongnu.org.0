Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71FDE900
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:06:30 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMUa5-00011P-8u
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMUYy-00006K-Eb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMUYt-0002A7-GG
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMUYt-00029g-AM
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:15 -0400
Received: by mail-ot1-x341.google.com with SMTP id 60so10483410otu.0
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dT7v0dc2XmlbOSGjc2YcIFbasuyFnV2qK9cc5zJHHOg=;
 b=oddKX0qTpgHt+ktzDfZO29chm44hHpCAN9OxkMdr01CLwHge1yzw2wBpCuPIjZBq2i
 eciyfy21ImtLIFeKgtK90Jk1k90LVVpWGFMCaCKjxTGOokZ1iWyBgb8VAGsXyd1q6WiO
 h14MOyhEcyuywwV7b8LG0iTfTdT77vMYU98vJlSrUfFbM0ZSxQ3FAmJxhgSz/KihJpQ6
 AgkMajOQPkKsr2WDVxuaIfZ/CP763Jf1v3Ug3RRJOF5d13yR/fWzPq8pNFPt47svIiYA
 esbAP2mbs/4Lm/Da8Vtm8BhgjPNJXRHZlyFoK8+6JyxJjrltHbH5sLa2oC0Kk1Y0XdRz
 Rz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dT7v0dc2XmlbOSGjc2YcIFbasuyFnV2qK9cc5zJHHOg=;
 b=JxDA1zN17NT0Cvntc2nknom3SqzXt3fu7wjjKm2dCrmaEE1017pWe+eTKpL0Usr395
 0C3EULXJBmaujiL7+HssctDOS+kGfpljk8vSKEcGxMKr/j5BmZ/6F84GiPO71vPvGKCU
 oexT8W08eMy/BMJDnrvn9pJsHXGH3Bzsxm4GXYMJ3Ln/Kaf9kURuLAfXNln8Iyvl1LOX
 IrwvoQ1PDQjLYOekaG4otaFU+GqMpIziTsbiFGVF7pjuO+CKw5OEUowyNmeaShgferqa
 5WgJwo//c0Wa+uPfKogBpImRi/J8ufjTKYLwX/pAkN6p5M1O7n9WUmyIjzO7TbOyiYeY
 SGIQ==
X-Gm-Message-State: APjAAAX1e1VvXqwOQ8LONEwg9Yd6yGq9cUyDrJX10jJr9vvgpwAul23b
 tzBBVnPACYEe1SYqSOT58z5AQGBGjoFq9+EzqIFMKQ==
X-Google-Smtp-Source: APXvYqxTfM2CeQFg85GiwAb/IALNo1UZDC/NnkmezwLOsPulKPPj0QMOd60WvWFUaU+FEtHso5QMx1C3FKlWyWmG7sI=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17111943otb.97.1571652314434; 
 Mon, 21 Oct 2019 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-4-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-4-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 11:05:03 +0100
Message-ID: <CAFEAcA8a-B7O31MQosSX5kjVZi=1NCr0+=62j6n1DU+ewuN-kA@mail.gmail.com>
Subject: Re: [PATCH 03/14] lance: replace PROP_PTR with PROP_LINK
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 at 16:42, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/dma/sparc32_dma.c | 2 +-
>  hw/net/lance.c       | 5 ++---
>  hw/net/pcnet-pci.c   | 2 +-
>  hw/net/pcnet.h       | 2 +-
>  4 files changed, 5 insertions(+), 6 deletions(-)

I feel like there's probably a way to be more type-safe here
(eg for the lance.c property we know the linked device must
be TYPE_SPARC32_LEDMA_DEVICE, not just TYPE_DEVICE), but I guess
this will do.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

