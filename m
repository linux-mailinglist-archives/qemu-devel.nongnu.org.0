Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829A100748
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 15:23:41 +0100 (CET)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWhwJ-0002ga-RA
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 09:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhuj-0001g2-VK
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhui-00035A-Rn
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:22:01 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhui-00034a-My
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:22:00 -0500
Received: by mail-ot1-x342.google.com with SMTP id u13so14640691ote.0
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l93epJzFpah5Lo/MulLniiewH8jSfpIFwFL/5sKh+Kc=;
 b=EP6ovBvCAAIrd3+bgy0sclgtvgfeFLigivyh+FkhqifJO6vm6XSBd3Vx89pL/KqR90
 u3GUboNWo80GsCYA8G5p1hUsXGiYjBKSIVk+n4r6M/DIE3Zv+Vcd+9IN35GHNnoPMhJN
 F2bo/f4M3D1r72/aShlpHDQ5/+Q7dYk2GxCsF+0PdRTETJ9YzM3EfpxdnTwrm/qY53J1
 cDUxv1js+UCrGb2vuPPEzoHoz9u8j0xSYsqkJMuMQ8PclohBX1VERtthUHkhS8T3abRT
 +9McBNPjpMJiy0TZp2rlfkqcMw2iEVHWcHdOLa5sjPAo+uNr8FWDdDKT17JZyJ6rHXMh
 xZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l93epJzFpah5Lo/MulLniiewH8jSfpIFwFL/5sKh+Kc=;
 b=EM4TVyHsnPJsherjARHHty9oyK1j36PBHkXfER6luNf5S4ZVC99S2+xewVE8YHuCXX
 4xwbJ3wpmsK1IfabBxx7ZdghKQALKVbr6mFGOWEM8MDQnYCxzRiVnEg5anhLQmhFnbba
 gdsR76GfU1VQ3rSfJvx897s+vn7QwSpN9ihnC8jMLgTRrWS64BdFLigXVCMtQkXmLwrg
 eyTS5hLcd0II0N/ZP4nX/WjiELWAPWj9o4SAQrIgYLREYZNPTZpcTbzrlFUoKeCI956H
 St/n7Mehf8t3BbA1lSniANgGvusCWWAzo8CsUVH0F/sFCUMcLiiEpKyB4xJLWyUtI3a0
 AImg==
X-Gm-Message-State: APjAAAU6IS9XVWGdk4KyyDvC6T7g1KheY1pvzcSLCUquv0Gj+iRvBI0X
 dzWlk8cLOpBw1JJmJk91uFJAG06oPDqOeZeAYs9MFQ==
X-Google-Smtp-Source: APXvYqzSJUlWw8j92+iLmDis7pb4boyFSTn9iNxZrm/dZ+/4/nT6wPiFjyzFIxTrTAPUdYmtfFaNc+fXW3AJgROtsBg=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr8746oto.97.1574086919611;
 Mon, 18 Nov 2019 06:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-8-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:21:48 +0000
Message-ID: <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> QOM-ify further.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index c839035fdd..4af8b0ce4c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
>      s->baudbase =3D baudbase;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      serial_realize_core(s, &error_fatal);
> -
> -    vmstate_register(NULL, base, &vmstate_serial, s);
> +    qdev_set_legacy_instance_id(dev, base, 2);
>      qdev_init_nofail(dev);

Did you test whether migration still works from a QEMU
version without this patch to one with it? (The migration
vmstate code is too complicated for me to be able to figure
out whether passing the 'dev' pointer makes a difference
to whot it names the state sections and whether the
'qdev_set_legacy_instance_id' suffices to avoid problems.)

thanks
-- PMM

