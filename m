Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCD17AE98
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 19:58:29 +0100 (CET)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9vhU-0003hi-7B
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 13:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9vgW-0002Uu-Bj
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 13:57:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9vgV-00062q-7R
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 13:57:28 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:33384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9vgV-00062g-3o; Thu, 05 Mar 2020 13:57:27 -0500
Received: by mail-vs1-xe44.google.com with SMTP id n27so4317659vsa.0;
 Thu, 05 Mar 2020 10:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+cwCOVnv5+gU2TUyJwi4lIiO3QoIvc60U3Qfp+LsFy4=;
 b=XCyr1wQUFBCI0ywucxOCnp9ixudm1tl7SyMcnP+jTPgHEQYsicn+HZazpR+VG7TAey
 CVIWmzEFVTCVaYDzTWI5TydemJ1/p4uoUldat2xvJazlkdWcgwMNs5oVr2NOBsH3dRPu
 thBJmiAQ0+2Qzw1By/QNZM2Km5/Sy6Y13uczpRakcbofko7iNYMmfSl+ZD71CjawiDRM
 JgZRq8yUBhzw7nkI6ffse3VCOIzN69GcCyF2NmDOGAYSGSyeTWF8aKnEzLVG0B504lQV
 4Z+jpACaU8dPLw6dHMdcPmeRqMG6RKXDauc4iaBOfEpzsd+aZ9W8gSFaSfvhXd6WVXjd
 Y89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+cwCOVnv5+gU2TUyJwi4lIiO3QoIvc60U3Qfp+LsFy4=;
 b=McQ3Zbyw16QHrwwViKN8fj6l6BRvt5SQH1RFfJrON9R+A35abz2VXpNy++7KRCKTTC
 8bvpEgXLxe7DwcpFHjbYeTesjQDYIT1/k1HxAdXeCjYPg9oahe3GpTfgXZpfxxPo9pBH
 aCQOQwWlY5osf646PJE65ZorQVFVgWTfEUCCSonAL8jAdZ7ACUVVUEQoCVxfHXBg9RKP
 U1tDsKXAGKja1MJNDTAeRrefwGJXz9Z5+/TM/PvU2KETkR34oAQp6ZdAQg+dCP3XpBQh
 jB/NVnRsR5uRo8UOaFeOK2EXU2LdYeunWop0E6BuM4wTwih6Y5Tz/iZpBPLHgtBTVoLV
 86fQ==
X-Gm-Message-State: ANhLgQ1aZq7OB81RUqD4JGbdR0ewYgtavi/QcRYgPKlAqTJeJ5XDvOMc
 dJi4VoEteNo9C8ddxpCzc92S4ydDVxh+Z39W7p8=
X-Google-Smtp-Source: ADFU+vtlh6yXliaFmE+5Mo8US5oJAaxW/QM0dBGXURKTD29pbjz4pCeXevaiNVGhyU7CX/YBtJa+UFK6jz5RuXGXXQ0=
X-Received: by 2002:a67:fa43:: with SMTP id j3mr201048vsq.70.1583434646438;
 Thu, 05 Mar 2020 10:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-4-philmd@redhat.com>
In-Reply-To: <20200305175651.4563-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Mar 2020 10:49:44 -0800
Message-ID: <CAKmqyKOkUTDes8E2Ywtg=z+rxO19CptaO+ERV26SoXo2C2vTcA@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/net/rtl8139: Simplify if/else statement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e44
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 5, 2020 at 9:59 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Rewrite:
>
>       if (E) {
>           return A;
>       } else {
>           return B;
>       }
>       /* EOF */
>   }
>
> as:
>
>       if (E) {
>           return A;
>       }
>       return B;
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/rtl8139.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ae4739bc09..ef3211537f 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -808,11 +808,11 @@ static int rtl8139_can_receive(NetClientState *nc)
>          /* ??? Flow control not implemented in c+ mode.
>             This is a hack to work around slirp deficiencies anyway.  */
>          return 1;
> -    } else {
> -        avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
> -                     s->RxBufferSize);
> -        return (avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & RxOv=
erflow));
>      }
> +
> +    avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
> +                 s->RxBufferSize);
> +    return avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & RxOverflo=
w);
>  }
>
>  static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf=
, size_t size_, int do_interrupt)
> --
> 2.21.1
>
>

