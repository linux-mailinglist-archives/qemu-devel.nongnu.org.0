Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EE17BB9E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:26:22 +0100 (CET)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAB7V-0007P5-P0
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jAAwq-0004ce-SI
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jAAwo-0004uW-RF
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:15:20 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jAAwm-0004s6-Vg; Fri, 06 Mar 2020 06:15:18 -0500
Received: by mail-wr1-x443.google.com with SMTP id z15so1900895wrl.1;
 Fri, 06 Mar 2020 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oCZBJIEBCvrQGpahK+7VEXYVj3F5dRm7ZwQ1Yq1AzY0=;
 b=OhX4W5/AlTFIKNZ37yDRGA6A48yphq+SKvRlOfttruPg8Uq3UMALwp56LNiU6pk68y
 zvB4GkNnE1sUNSpWibwC1bK+r6gcd7ouwLMRmfNM7LEb2oq6ChL+EGp61YGyd1sETfEq
 ouO9jYeZiAbwQsLltODvQozg8arG8PH1ml309hrl8MPaHmm67HE9vWcpyz4RNqmta2Ra
 1IDZlm7BirN13WWdzdp7MhTA4vj+4coMd09lky4f3gecIjNOW83On2dPgo5larY96/mU
 xYZQscMAumOVe7DcoSWHJpEvtEQJp0SnUhbVada+TYj1suCs+8avVz2nBQAdk3nzU92i
 A4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oCZBJIEBCvrQGpahK+7VEXYVj3F5dRm7ZwQ1Yq1AzY0=;
 b=LPukTCjpq1Lzcam3LiBB/BaPaDXN+PqM6zYWkB2SD67JwdjebhWhTWKrD/rmCmCpKh
 e7CMPCfGK29UANhh0OB240MXPbhV+EnfgS1HtwxQWAkLdn7xLt+p75X4kO3FANy+zzcK
 6VG/SHwRyJNMRgzBzTUEFbMOoDAuLrzGKLNzN3sni/Q/p7dP/vbSkj0a4/jp700xFdfB
 FU4I1tudaIFvqMnjkXRcGUJVm+PUT1jWg3eeZl3Xm4Ea93HyYWcmKrbeAT+UG9h9r2/+
 k70n/mBhYaz2LBxKM1N5VcuI4tyDyxOHCcWtSPvXMMtvqqIWF/xh0enHyJTRpxgRSV8V
 STZA==
X-Gm-Message-State: ANhLgQ0XbAcczLDWCkd9ddKdBJoWOLxFznyeS4XMXWIAnLKpiTA2qDcd
 RfdyDnhqCCB2S0sEoP3TJuePj7e7LBW9gOT7PKE=
X-Google-Smtp-Source: ADFU+vtV/v6zWYMJUyTge1ZpwAuJnmYE+3U+r2vIyHyi+/LCxI9tzZFQcNUcLJCGf/eiliE8uUALh8VwT7HLJyWntAY=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr3525999wrj.196.1583493314778; 
 Fri, 06 Mar 2020 03:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20200224031319.84392-1-gshan@redhat.com>
In-Reply-To: <20200224031319.84392-1-gshan@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 6 Mar 2020 12:15:01 +0100
Message-ID: <CAJ+F1C+NiqauJzufJ5qeR78UPBgAZ3tEBSnJu0Y-hv0-nYHuhA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char/pl011: Enable TxFIFO and async transmission
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "open list:ARM" <qemu-arm@nongnu.org>, shan.gavin@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Feb 24, 2020 at 4:13 AM Gavin Shan <gshan@redhat.com> wrote:
>
> The depth of TxFIFO can be 1 or 16 depending on LCR[4]. The TxFIFO is
> disabled when its depth is 1. It's nice to have TxFIFO enabled if
> possible because more characters can be piled and transmitted at once,
> which would have less overhead. Besides, we can be blocked because of
> qemu_chr_fe_write_all(), which isn't nice.
>
> This enables TxFIFO if possible. On ther other hand, the asynchronous
> transmission is enabled if needed, as we did in hw/char/cadence_uart.c
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v2: Put write_{count,fifo} into migration subsection
>     Don't start async IO handle if it has been started, to avoid race
>     Update with PL011_FLAG_{TXFF,TXFE} on changing write_count
> ---
>  hw/char/pl011.c         | 105 +++++++++++++++++++++++++++++++++++++---
>  include/hw/char/pl011.h |   3 ++
>  2 files changed, 102 insertions(+), 6 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 13e784f9d9..de5c4254fe 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -169,6 +169,73 @@ static void pl011_set_read_trigger(PL011State *s)
>          s->read_trigger =3D 1;
>  }
>
> +static gboolean pl011_xmit(GIOChannel *chan, GIOCondition cond, void *op=
aque)
> +{
> +    PL011State *s =3D (PL011State *)opaque;

Useless casts, perhaps use PL011() instead?

> +    int ret;
> +
> +    /* Drain FIFO if there is no backend */
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        s->write_count =3D 0;
> +        s->flags &=3D ~PL011_FLAG_TXFF;
> +        s->flags |=3D PL011_FLAG_TXFE;
> +        return FALSE;

Perhaps use G_SOURCE_REMOVE ?

> +    }
> +
> +    /* Nothing to do */
> +    if (!s->write_count) {
> +        return FALSE;
> +    }
> +
> +    ret =3D qemu_chr_fe_write(&s->chr, s->write_fifo, s->write_count);
> +    if (ret > 0) {
> +        s->write_count -=3D ret;
> +        memmove(s->write_fifo, s->write_fifo + ret, s->write_count);
> +        s->flags &=3D ~PL011_FLAG_TXFF;
> +        if (!s->write_count) {
> +            s->flags |=3D PL011_FLAG_TXFE;
> +        }
> +    }
> +
> +    if (s->write_count) {
> +        s->watch_tag =3D qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_=
HUP,
> +                                             pl011_xmit, s);
> +        if (!s->watch_tag) {
> +            s->write_count =3D 0;
> +            s->flags &=3D ~PL011_FLAG_TXFF;
> +            s->flags |=3D PL011_FLAG_TXFE;
> +            return FALSE;
> +        }
> +    }
> +
> +    s->int_level |=3D PL011_INT_TX;
> +    pl011_update(s);
> +    return FALSE;
> +}
> +
> +static void pl011_write_fifo(void *opaque, const unsigned char *buf, int=
 size)
> +{
> +    PL011State *s =3D (PL011State *)opaque;
> +    int depth =3D (s->lcr & 0x10) ? 16 : 1;
> +
> +    if (size >=3D (depth - s->write_count)) {

parenthesis could be dropped

> +        size =3D depth - s->write_count;
> +    }
> +

Why make a function that accepts size !=3D 1 (and may silently drop
data), when the only caller is pl011_write_fifo(opaque, &ch, 1); ?

> +    if (size > 0) {

I don't think other cases are supposed to happen.

> +        memcpy(s->write_fifo + s->write_count, buf, size);
> +        s->write_count +=3D size;
> +        if (s->write_count >=3D depth) {
> +            s->flags |=3D PL011_FLAG_TXFF;
> +        }
> +        s->flags &=3D ~PL011_FLAG_TXFE;
> +    }
> +
> +    if (!s->watch_tag) {
> +        pl011_xmit(NULL, G_IO_OUT, s);
> +    }
> +}
> +
>  static void pl011_write(void *opaque, hwaddr offset,
>                          uint64_t value, unsigned size)
>  {
> @@ -179,13 +246,8 @@ static void pl011_write(void *opaque, hwaddr offset,
>
>      switch (offset >> 2) {
>      case 0: /* UARTDR */
> -        /* ??? Check if transmitter is enabled.  */
>          ch =3D value;
> -        /* XXX this blocks entire thread. Rewrite to use
> -         * qemu_chr_fe_write and background I/O callbacks */
> -        qemu_chr_fe_write_all(&s->chr, &ch, 1);
> -        s->int_level |=3D PL011_INT_TX;
> -        pl011_update(s);
> +        pl011_write_fifo(opaque, &ch, 1);
>          break;
>      case 1: /* UARTRSR/UARTECR */
>          s->rsr =3D 0;
> @@ -207,7 +269,16 @@ static void pl011_write(void *opaque, hwaddr offset,
>          if ((s->lcr ^ value) & 0x10) {
>              s->read_count =3D 0;
>              s->read_pos =3D 0;
> +
> +            if (s->watch_tag) {
> +                g_source_remove(s->watch_tag);
> +                s->watch_tag =3D 0;
> +            }
> +            s->write_count =3D 0;
> +            s->flags &=3D ~PL011_FLAG_TXFF;
> +            s->flags |=3D PL011_FLAG_TXFE;
>          }
> +
>          s->lcr =3D value;
>          pl011_set_read_trigger(s);
>          break;
> @@ -292,6 +363,24 @@ static const MemoryRegionOps pl011_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>
> +static bool pl011_write_fifo_needed(void *opaque)
> +{
> +    PL011State *s =3D (PL011State *)opaque;
> +    return s->write_count > 0;
> +}
> +
> +static const VMStateDescription vmstate_pl011_write_fifo =3D {
> +    .name =3D "pl011/write_fifo",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D pl011_write_fifo_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_INT32(write_count, PL011State),
> +        VMSTATE_UINT8_ARRAY(write_fifo, PL011State, 16),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_pl011 =3D {
>      .name =3D "pl011",
>      .version_id =3D 2,
> @@ -314,6 +403,10 @@ static const VMStateDescription vmstate_pl011 =3D {
>          VMSTATE_INT32(read_count, PL011State),
>          VMSTATE_INT32(read_trigger, PL011State),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections =3D (const VMStateDescription * []) {
> +        &vmstate_pl011_write_fifo,
> +        NULL
>      }
>  };
>
> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
> index 14187165c6..9d1c24db48 100644
> --- a/include/hw/char/pl011.h
> +++ b/include/hw/char/pl011.h
> @@ -38,6 +38,7 @@ typedef struct PL011State {
>      uint32_t int_enabled;
>      uint32_t int_level;
>      uint32_t read_fifo[16];
> +    uint8_t  write_fifo[16];
>      uint32_t ilpr;
>      uint32_t ibrd;
>      uint32_t fbrd;
> @@ -45,6 +46,8 @@ typedef struct PL011State {
>      int read_pos;
>      int read_count;
>      int read_trigger;
> +    int write_count;
> +    guint watch_tag;
>      CharBackend chr;
>      qemu_irq irq[6];
>      const unsigned char *id;
> --
> 2.23.0
>
>

Looks ok otherwise

--=20
Marc-Andr=C3=A9 Lureau

