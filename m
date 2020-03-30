Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC201982DA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 19:58:03 +0200 (CEST)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIyfi-00051N-3S
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jIyer-0004ah-E4
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jIyep-0003yd-Vb
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:57:09 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jIyep-0003ut-MP
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:57:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id z18so20945877wmk.2
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wpqh5lwTcbe/IUswBe0U30uilA0Hq1GAEHmaGuoaAto=;
 b=XgniuUkv+jyz9kDxQqsekwXz7RHSQpbmjwYcQo9/sJ5O5gxfdG7nM5sasha95RVRt7
 li6ODi3lSaLNwI/qFbnBvBcA277IBSUAVqy26qaGMshwf6pK3QDb6/aFto8oOm93Izwn
 DQGCsV0XfTlqNRZdZ0cb0mpLAyuwWO6MWNtm6tD9k5YGN3hJO9sYaVnR4hzEIFw4Ojy3
 ZSPjb4vKTaqT6hkoN60rUWzP+e7+wOoqIpskBf5/0v6cyZmQ8oN0m5G5+ew6TEky8o5H
 BfRwPURlEQLlJ9xnW595W28YFAqQCBG9PNlQ6U1GXJRHoD329VLusSYUgxJFkmj/93q1
 FvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wpqh5lwTcbe/IUswBe0U30uilA0Hq1GAEHmaGuoaAto=;
 b=XUX5r4I+NluXMVFa31MMGKisEnWjn8hFNFSRAjiQRJhO2I58t505TLAVrIF891rMyN
 waRjzYq8hSfeIvgAw/QL/E8J6+jir7EF7yXcyRfhr4unqkvyxDgLWNYjO7aomb80xgIS
 MNqify/JGnfl/67mroTkmL1Mlm0kBceU72HA3clg2w5vABKSYflZd63sJX3/FszV3XKO
 JOHwWHbwzPpwxTUWz4q7/KTyYiR9XF2pjWKsgAc6wa4Ri8sLcB7/05e/0j2ybWHOtr+X
 LftRiYH3PDAfxrVmlgDPhf3h5SBFPal34p+kTMoTs8t/1vnlCmND87tgmuX23i/ebwoC
 m+uA==
X-Gm-Message-State: ANhLgQ3HiKjq+gFWmWpzMTsrQauUdG8tfstJIFYuNB+UWa3s87CeS+1l
 HhY7O1BRD5iE/aTooMgJ1HMZ5Rdg6XC2kG5UUEw=
X-Google-Smtp-Source: ADFU+vv3gDb1nkXLDYNXz67L6wUqirUH6wsub/zJKQjed0QAhzLWJkszEcdxemYRfJF9vnENleQoo8Pu6JjLQxjM0PA=
X-Received: by 2002:a7b:c404:: with SMTP id k4mr415739wmi.37.1585591026410;
 Mon, 30 Mar 2020 10:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200330164712.198282-1-dgilbert@redhat.com>
 <CAJ+F1CKd9x3BQKCGFPF8ouW4Fzvw0R5z3ZRT_0XPNSepP5hMZQ@mail.gmail.com>
 <20200330174116.GC2843@work-vm>
In-Reply-To: <20200330174116.GC2843@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 30 Mar 2020 19:56:54 +0200
Message-ID: <CAJ+F1CJzdso1xNj+XyiriByHzYekz74+JRCCQ4a6ygWLrCGMvA@mail.gmail.com>
Subject: Re: [PATCH] serial: Fix double migration data
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Mar 30, 2020 at 7:41 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Marc-Andr=C3=A9 Lureau (marcandre.lureau@gmail.com) wrote:
> > Hi
> >
> > On Mon, Mar 30, 2020 at 6:47 PM Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > After c9808d60281 we have both an object representing the serial-isa
> > > device and a separate object representing the underlying common seria=
l
> > > uart.  Both of these have vmsd's associated with them and thus the
> > > migration stream ends up with two copies of the migration data - the
> > > serial-isa includes the vmstate of the core serial.   Besides
> > > being wrong, it breaks backwards migration compatibility.
> > >
> > > Fix this by removing the dc->vmsd from the core device, so it only
> > > gets migrated by any parent devices including it.
> > > Add a vmstate_serial_mm so that any device that uses serial_mm_init
> > > rather than creating a device still gets migrated.
> > > (That doesn't fix backwards migration for serial_mm_init users,
> > > but does seem to work forwards for ppce500).
> > >
> > > Fixes: c9808d60281 ('serial: realize the serial device')
> > > Buglink: https://bugs.launchpad.net/qemu/+bug/1869426
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  hw/char/serial.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > > index 2ab8b69e03..c822a9ae6c 100644
> > > --- a/hw/char/serial.c
> > > +++ b/hw/char/serial.c
> > > @@ -1043,7 +1043,6 @@ static void serial_class_init(ObjectClass *klas=
s, void* data)
> > >      dc->user_creatable =3D false;
> > >      dc->realize =3D serial_realize;
> > >      dc->unrealize =3D serial_unrealize;
> > > -    dc->vmsd =3D &vmstate_serial;
> > >      device_class_set_props(dc, serial_properties);
> > >  }
> > >
> > > @@ -1113,6 +1112,16 @@ static void serial_mm_realize(DeviceState *dev=
, Error **errp)
> > >      sysbus_init_irq(SYS_BUS_DEVICE(smm), &smm->serial.irq);
> > >  }
> > >
> > > +static const VMStateDescription vmstate_serial_mm =3D {
> > > +    .name =3D "serial",
> > > +    .version_id =3D 3,
> > > +    .minimum_version_id =3D 2,
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_STRUCT(serial, SerialMM, 0, vmstate_serial, SerialSt=
ate),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
> > > +
> >
> > Why do you make it a sub-state?
>
> Because it's consistent with serial-isa and it's simple.

ok, lgtm then

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > # qemu-system-ppc -M ppce500 -monitor stdio -serial pty
> > in 4.2 and 5.0:
> >     "serial (8)": {
> >         "divider": "0x00d9",
> >         "rbr": "0x00",
> >         "ier": "0x00",
> >         "iir": "0xc1",
> >         "lcr": "0x03",
> >         "mcr": "0x03",
> >         "lsr": "0x60",
> >         "msr": "0xb0",
> >         "scr": "0x00",
> >         "fcr_vmstate": "0x01"
> >     },
> >
> > With this patch:
> >     "serial (8)": {
> >         "serial": {
> >             "divider": "0x00d9",
> >             "rbr": "0x00",
> >             "ier": "0x00",
> >             "iir": "0xc1",
> >             "lcr": "0x03",
> >             "mcr": "0x03",
> >             "lsr": "0x60",
> >             "msr": "0xb0",
> >             "scr": "0x00",
> >             "fcr_vmstate": "0x01"
> >         }
> >     },
> >
> > >  SerialMM *serial_mm_init(MemoryRegion *address_space,
> > >                           hwaddr base, int regshift,
> > >                           qemu_irq irq, int baudbase,
> > > @@ -1162,6 +1171,7 @@ static void serial_mm_class_init(ObjectClass *o=
c, void *data)
> > >
> > >      device_class_set_props(dc, serial_mm_properties);
> > >      dc->realize =3D serial_mm_realize;
> > > +    dc->vmsd =3D &vmstate_serial_mm;
> > >  }
> > >
> > >  static const TypeInfo serial_mm_info =3D {
> > > --
> > > 2.25.1
> > >
> > >
> >
> > I understand removing the serial state from SerialClass solves the
> > double state issue for ISA. But at the same time, I think we should
> > aim to migrate ISASerial state to SerialClass state. I can take a look
> > if you want.
>
> I don't think there's anything wrong with having a separate layer here;
> the physical reality of what we have is a UART (Serial) that is on the
> ISA bus where the ISA bus interfacing doesn't require any extra state
> to be migrated.
>
> Dave
>
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

thanks!

--=20
Marc-Andr=C3=A9 Lureau

