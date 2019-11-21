Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1751059F8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 19:53:18 +0100 (CET)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXrZt-0006FD-5K
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 13:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXrYX-0004uf-Lu
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXrYW-0004LE-Hi
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51734)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iXrYW-0004KE-Bl
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id g206so4660646wme.1
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FKlBFL5P3CzpXiAtO7LVfb0bBoDPHY9RHS+KAzF/6Yw=;
 b=iSu+kv/rfeSb+BSZGVyZYJxmxZ23DCpqnVLpy6knFQ4co+FQVZF2fCG+VLjZn3qtWA
 Dhu/CHmyM5UMF57wSjEhw5EsxVkUitN4FC9W/3e51fE7BrISTiCNmsCd+tLoJLeZhSJO
 xP0vzKSPVxDXopmsk2iyY94v2tYmzpc6pydJ1rdfTA4KHUpo99WX0/BMWFG+VUPfIO2s
 TvjlIEqAJ+/ZTVSYbtOQ7WXakl2TVTdkF7sXNTlmy9YjLZsMXAaZvrxiSqVJZIxqnLDN
 SolCNhXpMOJuacqnMX4oKVynm4iunXkuyS6c4qWcLPb4ioCuzTxwCOSUoeuz4tBrcFPr
 w9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FKlBFL5P3CzpXiAtO7LVfb0bBoDPHY9RHS+KAzF/6Yw=;
 b=RLL6uyICsnz64rY0heoKx+dsjlbZUfYgQCc6/vX4s+ik1Iz77jdpT7EKNacnFVhMBa
 GS9Bq9kLwNJSuK5c861I7pErhvNOpgIQzqrcNsV1nxCImvkK+64q0OQtKXGOzF8yv3lJ
 isaaYn5lEhst4onk2aWk2jL5IM5/azkJXZPizUrCvuizsqNv8WwgXPd6T4T1kUnqdbhX
 0HL5VMf2EoMG7zsbfdd2rUqWGolx/Vs5rwtrpV1VX9azhDnOt3k/fXvxoUZOmjlGeaRe
 jxIzR6OmVfzamKTV0X5RmrKNTIOKj7Kwr4TV5Lee3o9OBQh8uyFjWbr+wjbQNGYDoU+8
 1JKQ==
X-Gm-Message-State: APjAAAX6hK1Xyu17RKn+c/9b6Dw9fi/5UXbmMeR7kc8OGafQ2qxxrYPX
 zkrucP11ycofGexkFNa4+usa+UQmst7NFxU1Xp0=
X-Google-Smtp-Source: APXvYqwTgD9l3T2uDYdxDcbOvewS5310M5dQQu1PJzjc5bOqW04lq+MicsudrC3NFTMhGxAkaokH5KxWP1Jb0nQXD8U=
X-Received: by 2002:a1c:453:: with SMTP id 80mr11890031wme.5.1574362310980;
 Thu, 21 Nov 2019 10:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-13-marcandre.lureau@redhat.com>
 <CAFEAcA8aj71ue1Y_o1PphD8+iAZeOgqo647hgXS0Z22T9Qa8yg@mail.gmail.com>
 <CAJ+F1CJhaQxrceCqPpPULN5RUUQ+jTVaRa912jX0Ct8MM0ucaw@mail.gmail.com>
 <CAFEAcA82swZ82__hee1818L0RtD-3dNEOAKT2hdwgMOcaiAjHw@mail.gmail.com>
In-Reply-To: <CAFEAcA82swZ82__hee1818L0RtD-3dNEOAKT2hdwgMOcaiAjHw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Nov 2019 22:51:37 +0400
Message-ID: <CAJ+F1CLDai4rWcLQaqXo1GcVRuRj=OwX+50jV4Ch5X_-8HR=CA@mail.gmail.com>
Subject: Re: [PATCH v4 12/37] serial: start making SerialMM a sysbus device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Nov 21, 2019 at 10:24 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>
> On Thu, 21 Nov 2019 at 18:15, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > On Thu, Nov 21, 2019 at 5:47 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >
> > > On Wed, 20 Nov 2019 at 15:27, Marc-Andr=C3=A9 Lureau
> > > <marcandre.lureau@redhat.com> wrote:
> > > >
> > > > Memory mapped serial device is in fact a sysbus device. The followi=
ng
> > > > patches will make use of sysbus facilities for resource and
> > > > registration. In particular, "serial-mm: use sysbus facilities" wil=
l
> > > > move internal serial realization to serial_mm_realize callback to
> > > > follow qdev best practices.
> > >
> > > What goes wrong if you just put the realize of smm->serial in
> > > the right place to start with ?
> >
> > You mean squash the following patches?
>
> No, I meant just having this patch have
>
> static void serial_mm_realize(DeviceState *dev, Error **errp)
> {
>     SerialMM *smm =3D SERIAL_MM(dev);
>     SerialState *s =3D &smm->serial;
>
>     object_property_set_bool(OBJECT(dev), true, "realized", &err);
>     if (err) {
>         error_propagate(errp, err);
>         return;
>     }
> }
>
> and
>
> + dc->realize =3D serial_mm_realize;
>
> rather than manually doing the qdev_init_nofail()
> in serial_mm_init(). This seems to me like an integral
> part of the change to doing the init of the subdevice in the
> init method, so it would be better unless there's a reason
> why it breaks something. The rest of patch 15 (which is
> what currently makes the equivalent change to realize) is all
> about passing through the properties and exposing the
> sysbus MMIO/irq regions and should stay a separate patch.
>
> (setting the 'realized' property is better in a realize method
> than using qdev_init_nofail() because it means we can propagate
> any error outward rather than killing qemu.)

Ok, but I implemented realize and moved serial init in "serial: make
SerialIO a sysbus device".

I propose to add another patch to follow your suggestion to use
set_boot("realize", true, errp) on top.

--=20
Marc-Andr=C3=A9 Lureau

