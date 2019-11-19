Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0710220C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 11:24:18 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX0gD-0002Oe-9j
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 05:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iX0f9-0001II-Lt
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:23:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iX0f8-0001xd-G3
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:23:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30073
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iX0f8-0001xO-DC
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574158990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXBWRZBtRNpFMOmDiNKH/+l5cfB3RN+RKsFJito5LPc=;
 b=QxfmzxeIzhbjT/Sl+HIFZ3V6IXMaY7EpCdBvq5x4pyvAFCZ0jLt6iaro+Bmg3AOcwJ9wRv
 Ip99pIZCpORZoy5IJSL034Qk/tcZyW7ciUfiO+zVKYQLMlP2Fu9vutioJGkF1xN74oBtXm
 2LWj9o5RIIuciWxF3PRECwEu4Ei2PYw=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-NwgExJauPCuFJJ22u_Ny9g-1; Tue, 19 Nov 2019 05:23:06 -0500
Received: by mail-ot1-f71.google.com with SMTP id 9so10529344otf.16
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 02:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xXBWRZBtRNpFMOmDiNKH/+l5cfB3RN+RKsFJito5LPc=;
 b=Wz0+nADm7bg+Iy+fkxWu7WAiYzEvuJbsOfgdSZLYooUtFjXNLVF70isK/FYJPlb4kh
 cYjxSnjBjUrQ67cQncOWcy/qocMDo9GLWA/rKR/HBmVsA6WmKyQw/GhFdOV57a6mnW2n
 OyM5Olzf6kt7uP2kqNNMjqmIa/P7TmhwHQKNdG+UE/iZ8J3h40MoWzA52ncnxPTtgYYN
 o3J53rKsY465Sd+CEtmpTH6x7Go1cR7ZR/bE3vaJaI33xiF1I3tgEaJtUfUiw66EByK6
 bbFhL5tv8jRzF0xjQSedR2lz7V+uThDyDT4q6p1ri28ZLhCnCDAK0aLwIszjGZPEAJEt
 SQGQ==
X-Gm-Message-State: APjAAAVHiBxPiSJIQo0dmtghkj/6iVLt1YRtaZyOlM3cI9ZFPuin9+cc
 bf2lUJcbm6NJ2mfbxFeLNGPsW6kfbHZVLnc8yd67bUQjJMFaV3l9UcFeSZUsonhRhfoK8AyDzFl
 cWUbH7kR5Mp/6ZNPmeygvK4R+p6u9fmw=
X-Received: by 2002:aca:484e:: with SMTP id v75mr3452451oia.6.1574158985247;
 Tue, 19 Nov 2019 02:23:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAW7u4+zVYTOVejuoZU12DxbH4wBq0IuuJJ3nI2VdhfiA7C9BZIt/eI1n+dqMwNMFkvQ5LtrEY4/JS05lD2+k=
X-Received: by 2002:aca:484e:: with SMTP id v75mr3452425oia.6.1574158984991;
 Tue, 19 Nov 2019 02:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
 <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 19 Nov 2019 14:22:53 +0400
Message-ID: <CAMxuvawcYnH4pp8PitMO6KcTz_GdwF7i=zJxepofsN1o9Yh65w@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: NwgExJauPCuFJJ22u_Ny9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Mon, Nov 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > QOM-ify further.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index c839035fdd..4af8b0ce4c 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
> >      s->baudbase =3D baudbase;
> >      qemu_chr_fe_init(&s->chr, chr, &error_abort);
> >      serial_realize_core(s, &error_fatal);
> > -
> > -    vmstate_register(NULL, base, &vmstate_serial, s);
> > +    qdev_set_legacy_instance_id(dev, base, 2);
> >      qdev_init_nofail(dev);
>
> Did you test whether migration still works from a QEMU
> version without this patch to one with it? (The migration

Yes, I thought I did test correctly, but I realized testing with x86
isn't correct.

So with arm/musicpal for ex, I can migrate from before->after, however
after->before won't work. Is that ok?

> vmstate code is too complicated for me to be able to figure
> out whether passing the 'dev' pointer makes a difference
> to whot it names the state sections and whether the
> 'qdev_set_legacy_instance_id' suffices to avoid problems.)

I don't see a way to fix after->before, because the instance id is
initially 0 with the new code, and the old code expect a different
value.


