Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A8A3E12D8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:42:01 +0200 (CEST)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBap6-0001UX-3Q
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBamw-0008Be-M7
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:39:46 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBams-0006ol-SL
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:39:46 -0400
Received: by mail-ej1-x62b.google.com with SMTP id h9so8790251ejs.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qJsNFTwBlanoLrQ4sVk9tVfLg4ZMLjioxVVgUuYoXs=;
 b=HKVsz5QmQJKvYggY9DLCeWSMCuBeYTV034aAEyp+/Ta+mgMyYqEU7Dqr2EAta4vMpe
 El0JlA/8X9xJjl24xG5LW4td3Ka1nf0i7wYoSj9XpBj9OUC09q/gEkS6BWwdZnu9mCnn
 P4UtFhysIZTmWJwi1cxLCRulM0DtvauiJWYIdLDz0di13uA4Zh8hXDsaVGmMwncJ2cOH
 IgPYiyh+P1TE1hl6kOI+shAWnVyMMVrk+Z2lJ9bIhwy0DSJmARu5hHuqHT2EV34c4CWO
 BVtUlOVK84Hr30vPrXPs9MSRKWVgkAt49ruqdTgCDD9mMjIHPrfE1yDgZYefaH+cfd+T
 d6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qJsNFTwBlanoLrQ4sVk9tVfLg4ZMLjioxVVgUuYoXs=;
 b=f76eBJp/U1CJ5zxmmYRtQw83t3aKWHyVaAsLZvZg3pFPpiTTxCutNhHUduyV5dGeRG
 XYJda8nXEE/zmsdwVMAVNXexv1L0kvg1HsSWBdh+KIfZbpWfmwYn2gKcemxy4/RDPgjf
 /wc1E6BDDsT/kSXCejKiToB7hDxZqOdthaKrNCvm3Cw/cgqLaD0J7oTsGb25fk54pNqh
 zi/eETWOBV6mo6PVkZsuJFa61DS+/YZXizzkorwlPkEHX/Wfb7OBrrOn1IRd3HjCF0w5
 o2IXqnnN49pdvhBbYiqCiB5umLzr08bVgUyJeyjMP8EROtGsL2nNZt45RetvdtyNmeYw
 O61w==
X-Gm-Message-State: AOAM533/Ip2jI+rEvU3yv8wTInGOeuoJkJVixbNoSiyfvwhttXaW8ltG
 Hg7jyD3kKQVgvdK/I90R9Irw7FJaur2cslWIndY=
X-Google-Smtp-Source: ABdhPJzkMUAfcAFCTOxElJ34PDdKu3uU3IaTd25991AN8LtdGasw59krlavDx0YRw0J/Sp9F3Vu+fsYU6NfEDYsqrog=
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr4195073ejy.532.1628159980980; 
 Thu, 05 Aug 2021 03:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
 <20210804154848.557328-6-marcandre.lureau@redhat.com>
 <YQu/PYUAhHzOP1UX@redhat.com>
In-Reply-To: <YQu/PYUAhHzOP1UX@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 Aug 2021 14:39:28 +0400
Message-ID: <CAJ+F1CJzZSjcfk5zag8ZdA-FdttQeTM_-HM_VnK5Qc8OJX=FAg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] chardev: mark explicitly first argument as
 poisoned
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004dcd0905c8cd89ad"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004dcd0905c8cd89ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 5, 2021 at 2:37 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Wed, Aug 04, 2021 at 07:48:42PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since commit 9894dc0cdcc397ee5b26370bc53da6d360a363c2 "char: convert
> > from GIOChannel to QIOChannel", the first argument to the watch callbac=
k
> > can actually be a QIOChannel, which is not a GIOChannel (but a QEMU
> > Object).
> >
> > Even though we never used that pointer, change the callback type to war=
n
> > the users. Possibly a better fix later, we may want to store the
> > callback and call it from intermediary functions.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/chardev/char-fe.h | 8 +++++++-
> >  chardev/char-fe.c         | 2 +-
> >  hw/char/cadence_uart.c    | 2 +-
> >  hw/char/cmsdk-apb-uart.c  | 2 +-
> >  hw/char/ibex_uart.c       | 2 +-
> >  hw/char/nrf51_uart.c      | 2 +-
> >  hw/char/serial.c          | 2 +-
> >  hw/char/virtio-console.c  | 2 +-
> >  hw/usb/redirect.c         | 2 +-
> >  hw/virtio/vhost-user.c    | 2 +-
> >  monitor/monitor.c         | 2 +-
> >  net/vhost-user.c          | 4 ++--
> >  12 files changed, 19 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> > index a553843364..867ef1b3b2 100644
> > --- a/include/chardev/char-fe.h
> > +++ b/include/chardev/char-fe.h
> > @@ -174,6 +174,9 @@ void qemu_chr_fe_set_open(CharBackend *be, int
> fe_open);
> >  void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
> >      GCC_FMT_ATTR(2, 3);
> >
> > +
> > +typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition
> condition, void *data);
> > +
> >  /**
> >   * qemu_chr_fe_add_watch:
> >   * @cond: the condition to poll for
> > @@ -188,10 +191,13 @@ void qemu_chr_fe_printf(CharBackend *be, const
> char *fmt, ...)
> >   * Note that you are responsible to update the front-end sources if
> >   * you are switching the main context with qemu_chr_fe_set_handlers().
> >   *
> > + * Warning: DO NOT use the first callback argument (it may be either
> > + * a GIOChannel or a QIOChannel, depending on the underlying chardev)
> > + *
> >   * Returns: the source tag
> >   */
> >  guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
> > -                            GIOFunc func, void *user_data);
> > +                            FEWatchFunc func, void *user_data);
> >
> >  /**
> >   * qemu_chr_fe_write:
> > diff --git a/chardev/char-fe.c b/chardev/char-fe.c
> > index 474715c5a9..7789f7be9c 100644
> > --- a/chardev/char-fe.c
> > +++ b/chardev/char-fe.c
> > @@ -354,7 +354,7 @@ void qemu_chr_fe_set_open(CharBackend *be, int
> fe_open)
> >  }
> >
> >  guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
> > -                            GIOFunc func, void *user_data)
> > +                            FEWatchFunc func, void *user_data)
> >  {
> >      Chardev *s =3D be->chr;
> >      GSource *src;
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index ceb677bc5a..8ee6f74b8c 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -288,7 +288,7 @@ static void uart_write_rx_fifo(void *opaque, const
> uint8_t *buf, int size)
> >      uart_update_status(s);
> >  }
> >
> > -static gboolean cadence_uart_xmit(GIOChannel *chan, GIOCondition cond,
> > +static gboolean cadence_uart_xmit(GIOChannel *do_not_use, GIOCondition
> cond,
> >                                    void *opaque)
>
> Why is this (and the next 3) left as GIOCondition, when you change others
> later on to be void ?
>

Good catch. It's a leftover. It is fixed in my branch
https://gitlab.com/marcandre.lureau/qemu/-/tree/chardev

thanks


> >  {
> >      CadenceUARTState *s =3D opaque;
> > diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> > index ba2cbbee3d..b07a9dee4f 100644
> > --- a/hw/char/cmsdk-apb-uart.c
> > +++ b/hw/char/cmsdk-apb-uart.c
> > @@ -191,7 +191,7 @@ static uint64_t uart_read(void *opaque, hwaddr
> offset, unsigned size)
> >  /* Try to send tx data, and arrange to be called back later if
> >   * we can't (ie the char backend is busy/blocking).
> >   */
> > -static gboolean uart_transmit(GIOChannel *chan, GIOCondition cond, voi=
d
> *opaque)
> > +static gboolean uart_transmit(GIOChannel *do_not_use, GIOCondition
> cond, void *opaque)
> >  {
> >      CMSDKAPBUART *s =3D CMSDK_APB_UART(opaque);
> >      int ret;
> > diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> > index 6b0c9330bf..e493ea08c0 100644
> > --- a/hw/char/ibex_uart.c
> > +++ b/hw/char/ibex_uart.c
> > @@ -135,7 +135,7 @@ static void ibex_uart_receive(void *opaque, const
> uint8_t *buf, int size)
> >      ibex_uart_update_irqs(s);
> >  }
> >
> > -static gboolean ibex_uart_xmit(GIOChannel *chan, GIOCondition cond,
> > +static gboolean ibex_uart_xmit(GIOChannel *do_not_use, GIOCondition
> cond,
> >                                 void *opaque)
> >  {
> >      IbexUartState *s =3D opaque;
> > diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
> > index 045ca5fa40..0b89b0eae4 100644
> > --- a/hw/char/nrf51_uart.c
> > +++ b/hw/char/nrf51_uart.c
> > @@ -75,7 +75,7 @@ static uint64_t uart_read(void *opaque, hwaddr addr,
> unsigned int size)
> >      return r;
> >  }
> >
> > -static gboolean uart_transmit(GIOChannel *chan, GIOCondition cond, voi=
d
> *opaque)
> > +static gboolean uart_transmit(GIOChannel *do_not_use, GIOCondition
> cond, void *opaque)
> >  {
> >      NRF51UARTState *s =3D NRF51_UART(opaque);
> >      int r;
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index bc2e322970..7061aacbce 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -220,7 +220,7 @@ static void serial_update_msl(SerialState *s)
> >      }
> >  }
> >
> > -static gboolean serial_watch_cb(GIOChannel *chan, GIOCondition cond,
> > +static gboolean serial_watch_cb(void *do_not_use, GIOCondition cond,
> >                                  void *opaque)
> >  {
> >      SerialState *s =3D opaque;
> > diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
> > index 6b132caa29..dd5a02e339 100644
> > --- a/hw/char/virtio-console.c
> > +++ b/hw/char/virtio-console.c
> > @@ -38,7 +38,7 @@ struct VirtConsole {
> >   * Callback function that's called from chardevs when backend becomes
> >   * writable.
> >   */
> > -static gboolean chr_write_unblocked(GIOChannel *chan, GIOCondition con=
d,
> > +static gboolean chr_write_unblocked(void *do_not_use, GIOCondition con=
d,
> >                                      void *opaque)
> >  {
> >      VirtConsole *vcon =3D opaque;
> > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > index 1ec909a63a..5f0ef9cb3b 100644
> > --- a/hw/usb/redirect.c
> > +++ b/hw/usb/redirect.c
> > @@ -270,7 +270,7 @@ static int usbredir_read(void *priv, uint8_t *data,
> int count)
> >      return count;
> >  }
> >
> > -static gboolean usbredir_write_unblocked(GIOChannel *chan, GIOConditio=
n
> cond,
> > +static gboolean usbredir_write_unblocked(void *do_not_use, GIOConditio=
n
> cond,
> >                                           void *opaque)
> >  {
> >      USBRedirDevice *dev =3D opaque;
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index 29ea2b4fce..aec6cc1990 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -303,7 +303,7 @@ struct vhost_user_read_cb_data {
> >      int ret;
> >  };
> >
> > -static gboolean vhost_user_read_cb(GIOChannel *source, GIOCondition
> condition,
> > +static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition
> condition,
> >                                     gpointer opaque)
> >  {
> >      struct vhost_user_read_cb_data *data =3D opaque;
> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > index b90c0f4051..46a171bca6 100644
> > --- a/monitor/monitor.c
> > +++ b/monitor/monitor.c
> > @@ -156,7 +156,7 @@ static inline bool
> monitor_is_hmp_non_interactive(const Monitor *mon)
> >
> >  static void monitor_flush_locked(Monitor *mon);
> >
> > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +static gboolean monitor_unblocked(void *do_not_use, GIOCondition cond,
> >                                    void *opaque)
> >  {
> >      Monitor *mon =3D opaque;
> > diff --git a/net/vhost-user.c b/net/vhost-user.c
> > index ffbd94d944..6adfcd623a 100644
> > --- a/net/vhost-user.c
> > +++ b/net/vhost-user.c
> > @@ -208,8 +208,8 @@ static NetClientInfo net_vhost_user_info =3D {
> >          .set_vnet_le =3D vhost_user_set_vnet_endianness,
> >  };
> >
> > -static gboolean net_vhost_user_watch(GIOChannel *chan, GIOCondition
> cond,
> > -                                           void *opaque)
> > +static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition
> cond,
> > +                                     void *opaque)
> >  {
> >      NetVhostUserState *s =3D opaque;
> >
> > --
> > 2.32.0.264.g75ae10bc75
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004dcd0905c8cd89ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 2:37 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, Aug 04, 2021 at 07:48:42PM +0400, <a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrot=
e:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Since commit 9894dc0cdcc397ee5b26370bc53da6d360a363c2 &quot;char: conv=
ert<br>
&gt; from GIOChannel to QIOChannel&quot;, the first argument to the watch c=
allback<br>
&gt; can actually be a QIOChannel, which is not a GIOChannel (but a QEMU<br=
>
&gt; Object).<br>
&gt; <br>
&gt; Even though we never used that pointer, change the callback type to wa=
rn<br>
&gt; the users. Possibly a better fix later, we may want to store the<br>
&gt; callback and call it from intermediary functions.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/chardev/char-fe.h | 8 +++++++-<br>
&gt;=C2=A0 chardev/char-fe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 hw/char/cadence_uart.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/char/cmsdk-apb-uart.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/char/ibex_uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 hw/char/nrf51_uart.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/char/serial.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/char/virtio-console.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 hw/usb/redirect.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 hw/virtio/vhost-user.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 net/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 12 files changed, 19 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h<br>
&gt; index a553843364..867ef1b3b2 100644<br>
&gt; --- a/include/chardev/char-fe.h<br>
&gt; +++ b/include/chardev/char-fe.h<br>
&gt; @@ -174,6 +174,9 @@ void qemu_chr_fe_set_open(CharBackend *be, int fe_=
open);<br>
&gt;=C2=A0 void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 GCC_FMT_ATTR(2, 3);<br>
&gt;=C2=A0 <br>
&gt; +<br>
&gt; +typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condit=
ion, void *data);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* qemu_chr_fe_add_watch:<br>
&gt;=C2=A0 =C2=A0* @cond: the condition to poll for<br>
&gt; @@ -188,10 +191,13 @@ void qemu_chr_fe_printf(CharBackend *be, const c=
har *fmt, ...)<br>
&gt;=C2=A0 =C2=A0* Note that you are responsible to update the front-end so=
urces if<br>
&gt;=C2=A0 =C2=A0* you are switching the main context with qemu_chr_fe_set_=
handlers().<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; + * Warning: DO NOT use the first callback argument (it may be either<=
br>
&gt; + * a GIOChannel or a QIOChannel, depending on the underlying chardev)=
<br>
&gt; + *<br>
&gt;=C2=A0 =C2=A0* Returns: the source tag<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GIOFunc func, void *user_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FEWatchFunc func, void *user_data);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* qemu_chr_fe_write:<br>
&gt; diff --git a/chardev/char-fe.c b/chardev/char-fe.c<br>
&gt; index 474715c5a9..7789f7be9c 100644<br>
&gt; --- a/chardev/char-fe.c<br>
&gt; +++ b/chardev/char-fe.c<br>
&gt; @@ -354,7 +354,7 @@ void qemu_chr_fe_set_open(CharBackend *be, int fe_=
open)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GIOFunc func, void *user_data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FEWatchFunc func, void *user_data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Chardev *s =3D be-&gt;chr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GSource *src;<br>
&gt; diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
&gt; index ceb677bc5a..8ee6f74b8c 100644<br>
&gt; --- a/hw/char/cadence_uart.c<br>
&gt; +++ b/hw/char/cadence_uart.c<br>
&gt; @@ -288,7 +288,7 @@ static void uart_write_rx_fifo(void *opaque, const=
 uint8_t *buf, int size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uart_update_status(s);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static gboolean cadence_uart_xmit(GIOChannel *chan, GIOCondition cond=
,<br>
&gt; +static gboolean cadence_uart_xmit(GIOChannel *do_not_use, GIOConditio=
n cond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
<br>
Why is this (and the next 3) left as GIOCondition, when you change others<b=
r>
later on to be void ?<br></blockquote><div><br></div><div>Good catch. It&#3=
9;s a leftover. It is fixed in my branch <a href=3D"https://gitlab.com/marc=
andre.lureau/qemu/-/tree/chardev">https://gitlab.com/marcandre.lureau/qemu/=
-/tree/chardev</a></div><div><br></div><div>thanks</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CadenceUARTState *s =3D opaque;<br>
&gt; diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c<br>
&gt; index ba2cbbee3d..b07a9dee4f 100644<br>
&gt; --- a/hw/char/cmsdk-apb-uart.c<br>
&gt; +++ b/hw/char/cmsdk-apb-uart.c<br>
&gt; @@ -191,7 +191,7 @@ static uint64_t uart_read(void *opaque, hwaddr off=
set, unsigned size)<br>
&gt;=C2=A0 /* Try to send tx data, and arrange to be called back later if<b=
r>
&gt;=C2=A0 =C2=A0* we can&#39;t (ie the char backend is busy/blocking).<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -static gboolean uart_transmit(GIOChannel *chan, GIOCondition cond, vo=
id *opaque)<br>
&gt; +static gboolean uart_transmit(GIOChannel *do_not_use, GIOCondition co=
nd, void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CMSDKAPBUART *s =3D CMSDK_APB_UART(opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c<br>
&gt; index 6b0c9330bf..e493ea08c0 100644<br>
&gt; --- a/hw/char/ibex_uart.c<br>
&gt; +++ b/hw/char/ibex_uart.c<br>
&gt; @@ -135,7 +135,7 @@ static void ibex_uart_receive(void *opaque, const =
uint8_t *buf, int size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ibex_uart_update_irqs(s);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static gboolean ibex_uart_xmit(GIOChannel *chan, GIOCondition cond,<b=
r>
&gt; +static gboolean ibex_uart_xmit(GIOChannel *do_not_use, GIOCondition c=
ond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IbexUartState *s =3D opaque;<br>
&gt; diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c<br>
&gt; index 045ca5fa40..0b89b0eae4 100644<br>
&gt; --- a/hw/char/nrf51_uart.c<br>
&gt; +++ b/hw/char/nrf51_uart.c<br>
&gt; @@ -75,7 +75,7 @@ static uint64_t uart_read(void *opaque, hwaddr addr,=
 unsigned int size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return r;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static gboolean uart_transmit(GIOChannel *chan, GIOCondition cond, vo=
id *opaque)<br>
&gt; +static gboolean uart_transmit(GIOChannel *do_not_use, GIOCondition co=
nd, void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NRF51UARTState *s =3D NRF51_UART(opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; diff --git a/hw/char/serial.c b/hw/char/serial.c<br>
&gt; index bc2e322970..7061aacbce 100644<br>
&gt; --- a/hw/char/serial.c<br>
&gt; +++ b/hw/char/serial.c<br>
&gt; @@ -220,7 +220,7 @@ static void serial_update_msl(SerialState *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static gboolean serial_watch_cb(GIOChannel *chan, GIOCondition cond,<=
br>
&gt; +static gboolean serial_watch_cb(void *do_not_use, GIOCondition cond,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SerialState *s =3D opaque;<br>
&gt; diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c<br>
&gt; index 6b132caa29..dd5a02e339 100644<br>
&gt; --- a/hw/char/virtio-console.c<br>
&gt; +++ b/hw/char/virtio-console.c<br>
&gt; @@ -38,7 +38,7 @@ struct VirtConsole {<br>
&gt;=C2=A0 =C2=A0* Callback function that&#39;s called from chardevs when b=
ackend becomes<br>
&gt;=C2=A0 =C2=A0* writable.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -static gboolean chr_write_unblocked(GIOChannel *chan, GIOCondition co=
nd,<br>
&gt; +static gboolean chr_write_unblocked(void *do_not_use, GIOCondition co=
nd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque=
)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtConsole *vcon =3D opaque;<br>
&gt; diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c<br>
&gt; index 1ec909a63a..5f0ef9cb3b 100644<br>
&gt; --- a/hw/usb/redirect.c<br>
&gt; +++ b/hw/usb/redirect.c<br>
&gt; @@ -270,7 +270,7 @@ static int usbredir_read(void *priv, uint8_t *data=
, int count)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return count;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static gboolean usbredir_write_unblocked(GIOChannel *chan, GIOConditi=
on cond,<br>
&gt; +static gboolean usbredir_write_unblocked(void *do_not_use, GIOConditi=
on cond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 USBRedirDevice *dev =3D opaque;<br>
&gt; diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c<br>
&gt; index 29ea2b4fce..aec6cc1990 100644<br>
&gt; --- a/hw/virtio/vhost-user.c<br>
&gt; +++ b/hw/virtio/vhost-user.c<br>
&gt; @@ -303,7 +303,7 @@ struct vhost_user_read_cb_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static gboolean vhost_user_read_cb(GIOChannel *source, GIOCondition c=
ondition,<br>
&gt; +static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition con=
dition,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer opaq=
ue)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct vhost_user_read_cb_data *data =3D opaque;<b=
r>
&gt; diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
&gt; index b90c0f4051..46a171bca6 100644<br>
&gt; --- a/monitor/monitor.c<br>
&gt; +++ b/monitor/monitor.c<br>
&gt; @@ -156,7 +156,7 @@ static inline bool monitor_is_hmp_non_interactive(=
const Monitor *mon)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void monitor_flush_locked(Monitor *mon);<br>
&gt;=C2=A0 <br>
&gt; -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond=
,<br>
&gt; +static gboolean monitor_unblocked(void *do_not_use, GIOCondition cond=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Monitor *mon =3D opaque;<br>
&gt; diff --git a/net/vhost-user.c b/net/vhost-user.c<br>
&gt; index ffbd94d944..6adfcd623a 100644<br>
&gt; --- a/net/vhost-user.c<br>
&gt; +++ b/net/vhost-user.c<br>
&gt; @@ -208,8 +208,8 @@ static NetClientInfo net_vhost_user_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .set_vnet_le =3D vhost_user_set_vnet=
_endianness,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static gboolean net_vhost_user_watch(GIOChannel *chan, GIOCondition c=
ond,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *opaque)<br>
&gt; +static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition c=
ond,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque=
)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NetVhostUserState *s =3D opaque;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.32.0.264.g75ae10bc75<br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004dcd0905c8cd89ad--

