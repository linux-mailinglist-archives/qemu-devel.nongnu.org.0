Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3269103539
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 08:37:03 +0100 (CET)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXKXu-0007mK-Vx
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 02:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXKVt-0006u6-FU
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXKVl-0005PB-Kb
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:34:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46820
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXKVl-0005Ko-7a
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 02:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574235284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=316cTHKnaJdtIgeHH1iN6wxI4x0BhIlr2FEz4LwEfs4=;
 b=UAwdL1QpivMRwlYIHFGOTls3TSotVamnS8SaWy1XajE+4J5T6hXPSLIBmmu3VwV+SkoZKI
 RXBdCXGmGTjUvPHHK4yqdZJbBMd6Gdvp4UR3fWZFasywMLqbNICZCPVtk5780XPHu3D216
 +4lw6okS8FjjRxEgZDmCurxxv8zm4kQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-ywieQrqLPzuci4BuImVYjg-1; Wed, 20 Nov 2019 02:34:43 -0500
Received: by mail-oi1-f197.google.com with SMTP id 10so12061682ois.18
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 23:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=316cTHKnaJdtIgeHH1iN6wxI4x0BhIlr2FEz4LwEfs4=;
 b=ck05X3UgOp+fkXtoL/9nX6OnbDivr2GGHeXck3hItaUDFMi80UxWDPxBTa7gcljHbJ
 k0i+IYCdi1LUBzWQvlcVeza7IJp3HbAZOU6+sg43lqFgzZr31gBeNtJxYAwxiEbHDOjh
 EYaKSwxdgq93ytS8M4VJQOyTiReSqBtPHUBdddiJbpZlUNp0gjOHX/EzXik3sDNgv/ia
 WW1d90ia2YXzMfwYNhLCl9KEMAuOEls9tEGLxjJeBcYfhEcIeQFXcWEhCSGGT0r6cUXd
 /WhHdwXy0B/cB+qll1yZi3qQGXtua92L6gG/mwxPkubPf2ua30qEekcfBMGVcNYDlNDi
 Ercw==
X-Gm-Message-State: APjAAAX/OIKZmmEL0qAdnnO6sV3xyfhUbal8FhlRemKwTvhdtMjfcY6U
 4oN6g1ZArg00YVO+waAnhLAg/yaFtFUxE+XtV13+mlCDEpQm5sJeYqU7FAU1N0yWQMBUCdL/iYj
 Ypih5qBq7VGIItzxnfsynmaTC0ayIx64=
X-Received: by 2002:aca:1702:: with SMTP id j2mr1485421oii.13.1574235282940;
 Tue, 19 Nov 2019 23:34:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzpFFPW+LW4s3xGwmEtVeSszD/7fF6plMhBpK/IDBvwVZKkvwxq0KH2Kb+mfsnBl0nDUkag7HN5qfoKFhXveA=
X-Received: by 2002:aca:1702:: with SMTP id j2mr1485398oii.13.1574235282688;
 Tue, 19 Nov 2019 23:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
 <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
In-Reply-To: <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 11:34:31 +0400
Message-ID: <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: ywieQrqLPzuci4BuImVYjg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Nov 18, 2019 at 6:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Memory mapped serial device is in fact a sysbus device. The following
> > patches will make use of sysbus facilities for resource and
> > registration.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/omap_uart.c      |  2 +-
> >  hw/char/serial.c         | 47 ++++++++++++++++++++++++++++------------
> >  hw/mips/boston.c         |  2 +-
> >  hw/mips/mips_malta.c     |  2 +-
> >  include/hw/char/serial.h | 20 ++++++++++++-----
> >  5 files changed, 51 insertions(+), 22 deletions(-)
>
>
> > -SerialState *serial_mm_init(MemoryRegion *address_space,
> > +SerialMM *serial_mm_init(MemoryRegion *address_space,
> >                              hwaddr base, int it_shift,
> >                              qemu_irq irq, int baudbase,
> >                              Chardev *chr, enum device_endian end)
> >  {
> > -    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
> > -    SerialState *s =3D SERIAL(dev);
> > +    SerialMM *self =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
> > +    SerialState *s =3D &self->serial;
> >
> > -    s->it_shift =3D it_shift;
> > +    self->it_shift =3D it_shift;
> >      s->irq =3D irq;
> > -    qdev_prop_set_uint32(dev, "baudbase", baudbase);
> > -    qdev_prop_set_chr(dev, "chardev", chr);
> > -    qdev_prop_set_int32(dev, "instance-id", base);
> > -    qdev_init_nofail(dev);
> > +    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> > +    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> > +    qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> > +
> > +    qdev_init_nofail(DEVICE(s));
> > +    qdev_init_nofail(DEVICE(self));
>
> Something odd is going on here. This is a convenience
> wrapper around creating the SERIAL_MM device, so it's
> correct that it has to init DEVICE(self). But it should
> not be doing anything with the internals of 'self'.
> It's the instance_init/realize of the SERIAL_MM object that should
> instance_init/realize the 'self->serial' object. You have the
> code below to do the 'instance_init' in the serial_mm_instance_init
> function, but are missing the equivalent realize code.

This should be addressed later with "serial-mm: use sysbus
facilities". I'll add a comment.

>
> > -    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
> > +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
> >                            "serial", 8 << it_shift);
> >      memory_region_add_subregion(address_space, base, &s->io);
> > -    return s;
> > +
> > +    return self;
> > +}
> > +
> > +static void serial_mm_instance_init(Object *o)
> > +{
> > +    SerialMM *self =3D SERIAL_MM(o);
>
> 'self' is not idiomatic for the name of the variable containing
> the pointer to the object in QOM code ("git grep '\Wself\W' hw"
> shows no uses of it at all, which is quite unusual for us --
> usually the codebase has at least a few uses of any non-standard
> way of writing something ;-))
>
> Usually we use something approximating to the abbreviation
> of the type name, so here 'smm' would do.

I would prefer something more straightforward than having to come up
with various name mangling.

Imho, we loose some readability, consistency & semantic by not naming
the object argument of the method "self"

>
> > +
> > +    object_initialize_child(o, "serial", &self->serial, sizeof(self->s=
erial),
> > +                            TYPE_SERIAL, &error_abort, NULL);
> >  }
>
> thanks
> -- PMM
>


