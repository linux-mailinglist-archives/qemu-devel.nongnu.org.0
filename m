Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69E48A951
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:26:21 +0100 (CET)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7CU0-0003b2-K4
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n7CRn-0002kN-Op
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:24:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n7CRk-0001qI-Bz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641889438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaO40z0Nu0WYOgS3ogXe+0s+5JUs9ogvR9f/usjxFEo=;
 b=SPS7n6XMqtQFNE6QruyceSBx/atzoo1BqZ6G9G58WJJkmAEn8lF4qV38S2IXFZxeyuCWxA
 y1YRzmSAu8dwaEftMtZYlpkxpAR+4s47pKj53GQBR4NrSjvmbXGQL2ZySBcXIGNMWMV7h5
 bPOYBm/HvHIaTYsb6VR3wpdfhvlddWw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Kh26JKgMMo6BdFwq-DozwA-1; Tue, 11 Jan 2022 03:23:57 -0500
X-MC-Unique: Kh26JKgMMo6BdFwq-DozwA-1
Received: by mail-yb1-f200.google.com with SMTP id
 b6-20020a256706000000b0060aa7315dd9so32499440ybc.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 00:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iaO40z0Nu0WYOgS3ogXe+0s+5JUs9ogvR9f/usjxFEo=;
 b=MTOZ0tQGvrAzCoBteKrz+q1AVOwgxVdhjgIj4x4tg0I5kjQxiYUNMB3UN1JDCtcMgO
 j6eJ0GbUMNGrYUntDaVeRgLrllcWqJkqOPVpYPIc7KvG97dXu05oCs1U5kHtn2S131RM
 HHrIN8p0ZZg52jZ2GszD/TEHIrEyea12qrwy+he6BkNZ8MyFUkZnaRIAtp07tFCJvie6
 +0VvXqQqoYnUPFKOXWK7tAVYOsnreLRUiLBeJllJwtSA5ANIa/M/DeiyJwjtz16u7EeU
 q+XuHRNAj6ARUW5JxFUBZfYvpf8oTdGCr101vCaMPxzX/rKdRXvwWz/+pd6xG+7urvPG
 C/0A==
X-Gm-Message-State: AOAM530TcyzyEanNPrX8Fmn9hz5Ie9VsoupGwfBR2csE8L+GzTaBVwXi
 TCymtjSY3FBkopVMAN8aCjEu213GEo46sUYUToI0DTcjE7dTKvjB9kuCOa6pWNSLbw3Izpw2F6p
 vgRkGy9d9PGwJMJZA2Pl7ZJfNT2PkVo0=
X-Received: by 2002:a05:6902:601:: with SMTP id
 d1mr4477058ybt.36.1641889436902; 
 Tue, 11 Jan 2022 00:23:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY0Gc9tZX/ltXaQRuwvDo5zObwFlXhbYckUH1pFueLP3NWe5scaJVEl+33IQ6BEYrStVcAVWAaOIo2uzxHJgE=
X-Received: by 2002:a05:6902:601:: with SMTP id
 d1mr4477034ybt.36.1641889436510; 
 Tue, 11 Jan 2022 00:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-20-marcandre.lureau@redhat.com>
 <25b61c23-aa66-8857-f5d3-6f6b31664a5c@gmail.com>
In-Reply-To: <25b61c23-aa66-8857-f5d3-6f6b31664a5c@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 11 Jan 2022 12:23:45 +0400
Message-ID: <CAMxuvawErYgckfVh_dVp5kFDjfKESodLZHtkiV_HNB7wmYwcoA@mail.gmail.com>
Subject: Re: [PATCH v2 19/37] console: save current scanout details
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Akihiko

On Tue, Jan 11, 2022 at 7:30 AM Akihiko Odaki <akihiko.odaki@gmail.com> wro=
te:
>
> Hi,
>
> I found this brings an inconsistency and a flaw to scanout semantics and
> think the inconsistency should be fixed or this should be reverted
> before the next release comes up.
>
> The inconsistency is in the handling of the console size. A guest
> hardware (especially I'm looking at virtio-gpu-virgl) tells the size
> change with qemu_console_resize. It causes the replacement of the
> surface, and the host display sees the change of the size via the
> surface. The replacement of the surface does *not* mean the surface
> should be scanned out; if an OpenGL texture is already provided, the
> host display should scan out it, not the replaced surface.

Isn't that an inconsistent state? Is the host display supposed to
scale the GL texture in this case, or what else?

> dpy_gl_scanout_disable will be called when the surface becomes the
> source of the scanouts.

I don't think the code was/is so consistent about it, but I can agree
with that rule eventually.

>
> However, this change brings some contradicting behaviors.
> - qemu_console_get_width and qemu_console_get_height now relies on the
> texture size as the source of the console size while the resize is
> delivered via the surface.

The texture update should follow, otherwise what do you do?

> - dpy_gfx_replace_surface makes the surface as the source of the
> scanouts while its guest hardware semantics does not mean that.

Here also, I am not convinced this is always consistent. But that
should be fairly easy to change.

Do you have a particular example / test case where it's problematic?

> - dpy_gl_scanout_disable sets the scanout kind to SCANOUT_NONE while it
> actually means the surface is now the source of the scanout.

You make it sound like it is/was obvious. All those unwritten "rules"
should probably be documented. If you have a good grasp of how the API
should behave, it would be worth it to write some documentation,
tests...

> Besides that, displaychangelistener_display_console has a flaw that it
> does not tell the switch to a console with SCANOUT_NONE. The intention
> of SCANOUT_NONE is not entirely clear.

I agree, it is not obvious to me what you were/are supposed to do when
the GL scanout is disabled.

> I think there are two options to fix the problem except reverting:

Well, reverting would be a pain, as it would break -display dbus.

> - Rework this change to make it consistent with the existing semantics.

Yes, that seems the way to go. I need your help to understand what is
actually broken: please give me broken test cases. Otherwise, it feels
needless.

> - Remove the use of qemu_console_resize and dpy_gl_scanout_disable from
>    hardwares providing OpenGL textures or DMA-BUF to make it consistent
>    with the new semantics.

It may make sense to make qemu_console_resize() work implicit when
calling dpy_gl_scanout_texture().

Removing dpy_gl_scanout_disable() is not possible, since hardware will
continue to provide 2d/fallback.

thanks


>
> Regards,
> Akihiko Odaki
>
> On 2021/10/10 6:08, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Add a new DisplayScanout structure to save the current scanout details.
> > This allows to attach later UI backends and set the scanout.
> >
> > Introduce displaychangelistener_display_console() helper function to
> > handle the dpy_gfx_switch/gl_scanout() & dpy_gfx_update() calls.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   include/ui/console.h |  27 +++++++
> >   ui/console.c         | 165 +++++++++++++++++++++++++++++-------------=
-
> >   2 files changed, 138 insertions(+), 54 deletions(-)
> >
> > diff --git a/include/ui/console.h b/include/ui/console.h
> > index b23ae283be..ab55d71894 100644
> > --- a/include/ui/console.h
> > +++ b/include/ui/console.h
> > @@ -108,6 +108,17 @@ struct QemuConsoleClass {
> >   #define QEMU_ALLOCATED_FLAG     0x01
> >   #define QEMU_PLACEHOLDER_FLAG   0x02
> >
> > +typedef struct ScanoutTexture {
> > +    uint32_t backing_id;
> > +    bool backing_y_0_top;
> > +    uint32_t backing_width;
> > +    uint32_t backing_height;
> > +    uint32_t x;
> > +    uint32_t y;
> > +    uint32_t width;
> > +    uint32_t height;
> > +} ScanoutTexture;
> > +
> >   typedef struct DisplaySurface {
> >       pixman_format_code_t format;
> >       pixman_image_t *image;
> > @@ -173,6 +184,22 @@ typedef struct QemuDmaBuf {
> >       bool      allow_fences;
> >   } QemuDmaBuf;
> >
> > +enum display_scanout {
> > +    SCANOUT_NONE,
> > +    SCANOUT_SURFACE,
> > +    SCANOUT_TEXTURE,
> > +    SCANOUT_DMABUF,
> > +};
> > +
> > +typedef struct DisplayScanout {
> > +    enum display_scanout kind;
> > +    union {
> > +        /* DisplaySurface *surface; is kept in QemuConsole */
> > +        ScanoutTexture texture;
> > +        QemuDmaBuf *dmabuf;
> > +    };
> > +} DisplayScanout;
> > +
> >   typedef struct DisplayState DisplayState;
> >   typedef struct DisplayGLCtx DisplayGLCtx;
> >
> > diff --git a/ui/console.c b/ui/console.c
> > index e5a2c84dd9..a1c6a78523 100644
> > --- a/ui/console.c
> > +++ b/ui/console.c
> > @@ -126,6 +126,7 @@ struct QemuConsole {
> >       console_type_t console_type;
> >       DisplayState *ds;
> >       DisplaySurface *surface;
> > +    DisplayScanout scanout;
> >       int dcls;
> >       DisplayGLCtx *gl;
> >       int gl_block;
> > @@ -197,6 +198,7 @@ static void dpy_refresh(DisplayState *s);
> >   static DisplayState *get_alloc_displaystate(void);
> >   static void text_console_update_cursor_timer(void);
> >   static void text_console_update_cursor(void *opaque);
> > +static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dc=
l);
> >
> >   static void gui_update(void *opaque)
> >   {
> > @@ -532,6 +534,8 @@ static void text_console_resize(QemuConsole *s)
> >       TextCell *cells, *c, *c1;
> >       int w1, x, y, last_width;
> >
> > +    assert(s->scanout.kind =3D=3D SCANOUT_SURFACE);
> > +
> >       last_width =3D s->width;
> >       s->width =3D surface_width(s->surface) / FONT_WIDTH;
> >       s->height =3D surface_height(s->surface) / FONT_HEIGHT;
> > @@ -1103,6 +1107,48 @@ static void console_putchar(QemuConsole *s, int =
ch)
> >       }
> >   }
> >
> > +static void displaychangelistener_display_console(DisplayChangeListene=
r *dcl,
> > +                                                  QemuConsole *con)
> > +{
> > +    static const char nodev[] =3D
> > +        "This VM has no graphic display device.";
> > +    static DisplaySurface *dummy;
> > +
> > +    if (!con) {
> > +        if (!dcl->ops->dpy_gfx_switch) {
> > +            return;
> > +        }
> > +        if (!dummy) {
> > +            dummy =3D qemu_create_placeholder_surface(640, 480, nodev)=
;
> > +        }
> > +        dcl->ops->dpy_gfx_switch(dcl, dummy);
> > +        return;
> > +    }
> > +
> > +    if (con->scanout.kind =3D=3D SCANOUT_DMABUF &&
> > +        displaychangelistener_has_dmabuf(dcl)) {
> > +        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
> > +    } else if (con->scanout.kind =3D=3D SCANOUT_TEXTURE &&
> > +               dcl->ops->dpy_gl_scanout_texture) {
> > +        dcl->ops->dpy_gl_scanout_texture(dcl,
> > +                                         con->scanout.texture.backing_=
id,
> > +                                         con->scanout.texture.backing_=
y_0_top,
> > +                                         con->scanout.texture.backing_=
width,
> > +                                         con->scanout.texture.backing_=
height,
> > +                                         con->scanout.texture.x,
> > +                                         con->scanout.texture.y,
> > +                                         con->scanout.texture.width,
> > +                                         con->scanout.texture.height);
> > +    } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE &&
> > +               dcl->ops->dpy_gfx_switch) {
> > +        dcl->ops->dpy_gfx_switch(dcl, con->surface);
> > +    }
> > +
> > +    dcl->ops->dpy_gfx_update(dcl, 0, 0,
> > +                             qemu_console_get_width(con, 0),
> > +                             qemu_console_get_height(con, 0));
> > +}
> > +
> >   void console_select(unsigned int index)
> >   {
> >       DisplayChangeListener *dcl;
> > @@ -1119,13 +1165,7 @@ void console_select(unsigned int index)
> >                   if (dcl->con !=3D NULL) {
> >                       continue;
> >                   }
> > -                if (dcl->ops->dpy_gfx_switch) {
> > -                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
> > -                }
> > -            }
> > -            if (s->surface) {
> > -                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
> > -                               surface_height(s->surface));
> > +                displaychangelistener_display_console(dcl, s);
> >               }
> >           }
> >           if (ds->have_text) {
> > @@ -1538,9 +1578,6 @@ static bool dpy_gl_compatible_with(QemuConsole *c=
on, DisplayChangeListener *dcl)
> >
> >   void register_displaychangelistener(DisplayChangeListener *dcl)
> >   {
> > -    static const char nodev[] =3D
> > -        "This VM has no graphic display device.";
> > -    static DisplaySurface *dummy;
> >       QemuConsole *con;
> >
> >       assert(!dcl->ds);
> > @@ -1565,16 +1602,7 @@ void register_displaychangelistener(DisplayChang=
eListener *dcl)
> >       } else {
> >           con =3D active_console;
> >       }
> > -    if (dcl->ops->dpy_gfx_switch) {
> > -        if (con) {
> > -            dcl->ops->dpy_gfx_switch(dcl, con->surface);
> > -        } else {
> > -            if (!dummy) {
> > -                dummy =3D qemu_create_placeholder_surface(640, 480, no=
dev);
> > -            }
> > -            dcl->ops->dpy_gfx_switch(dcl, dummy);
> > -        }
> > -    }
> > +    displaychangelistener_display_console(dcl, con);
> >       text_console_update_cursor(NULL);
> >   }
> >
> > @@ -1655,13 +1683,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int=
 y, int w, int h)
> >   {
> >       DisplayState *s =3D con->ds;
> >       DisplayChangeListener *dcl;
> > -    int width =3D w;
> > -    int height =3D h;
> > +    int width =3D qemu_console_get_width(con, x + w);
> > +    int height =3D qemu_console_get_height(con, y + h);
> >
> > -    if (con->surface) {
> > -        width =3D surface_width(con->surface);
> > -        height =3D surface_height(con->surface);
> > -    }
> >       x =3D MAX(x, 0);
> >       y =3D MAX(y, 0);
> >       x =3D MIN(x, width);
> > @@ -1684,12 +1708,10 @@ void dpy_gfx_update(QemuConsole *con, int x, in=
t y, int w, int h)
> >
> >   void dpy_gfx_update_full(QemuConsole *con)
> >   {
> > -    if (!con->surface) {
> > -        return;
> > -    }
> > -    dpy_gfx_update(con, 0, 0,
> > -                   surface_width(con->surface),
> > -                   surface_height(con->surface));
> > +    int w =3D qemu_console_get_width(con, 0);
> > +    int h =3D qemu_console_get_height(con, 0);
> > +
> > +    dpy_gfx_update(con, 0, 0, w, h);
> >   }
> >
> >   void dpy_gfx_replace_surface(QemuConsole *con,
> > @@ -1716,6 +1738,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
> >
> >       assert(old_surface !=3D surface);
> >
> > +    con->scanout.kind =3D SCANOUT_SURFACE;
> >       con->surface =3D surface;
> >       QLIST_FOREACH(dcl, &s->listeners, next) {
> >           if (con !=3D (dcl->con ? dcl->con : active_console)) {
> > @@ -1891,6 +1914,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
> >       DisplayState *s =3D con->ds;
> >       DisplayChangeListener *dcl;
> >
> > +    if (con->scanout.kind !=3D SCANOUT_SURFACE) {
> > +        con->scanout.kind =3D SCANOUT_NONE;
> > +    }
> >       QLIST_FOREACH(dcl, &s->listeners, next) {
> >           dcl->ops->dpy_gl_scanout_disable(dcl);
> >       }
> > @@ -1907,6 +1933,11 @@ void dpy_gl_scanout_texture(QemuConsole *con,
> >       DisplayState *s =3D con->ds;
> >       DisplayChangeListener *dcl;
> >
> > +    con->scanout.kind =3D SCANOUT_TEXTURE;
> > +    con->scanout.texture =3D (ScanoutTexture) {
> > +        backing_id, backing_y_0_top, backing_width, backing_height,
> > +        x, y, width, height
> > +    };
> >       QLIST_FOREACH(dcl, &s->listeners, next) {
> >           dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
> >                                            backing_y_0_top,
> > @@ -1921,6 +1952,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
> >       DisplayState *s =3D con->ds;
> >       DisplayChangeListener *dcl;
> >
> > +    con->scanout.kind =3D SCANOUT_DMABUF;
> > +    con->scanout.dmabuf =3D dmabuf;
> >       QLIST_FOREACH(dcl, &s->listeners, next) {
> >           dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
> >       }
> > @@ -2047,10 +2080,8 @@ QemuConsole *graphic_console_init(DeviceState *d=
ev, uint32_t head,
> >       s =3D qemu_console_lookup_unused();
> >       if (s) {
> >           trace_console_gfx_reuse(s->index);
> > -        if (s->surface) {
> > -            width =3D surface_width(s->surface);
> > -            height =3D surface_height(s->surface);
> > -        }
> > +        width =3D qemu_console_get_width(s, 0);
> > +        height =3D qemu_console_get_height(s, 0);
> >       } else {
> >           trace_console_gfx_new();
> >           s =3D new_console(ds, GRAPHIC_CONSOLE, head);
> > @@ -2079,13 +2110,8 @@ void graphic_console_close(QemuConsole *con)
> >       static const char unplugged[] =3D
> >           "Guest display has been unplugged";
> >       DisplaySurface *surface;
> > -    int width =3D 640;
> > -    int height =3D 480;
> > -
> > -    if (con->surface) {
> > -        width =3D surface_width(con->surface);
> > -        height =3D surface_height(con->surface);
> > -    }
> > +    int width =3D qemu_console_get_width(con, 640);
> > +    int height =3D qemu_console_get_height(con, 480);
> >
> >       trace_console_gfx_close(con->index);
> >       object_property_set_link(OBJECT(con), "device", NULL, &error_abor=
t);
> > @@ -2237,7 +2263,19 @@ int qemu_console_get_width(QemuConsole *con, int=
 fallback)
> >       if (con =3D=3D NULL) {
> >           con =3D active_console;
> >       }
> > -    return con ? surface_width(con->surface) : fallback;
> > +    if (con =3D=3D NULL) {
> > +        return fallback;
> > +    }
> > +    switch (con->scanout.kind) {
> > +    case SCANOUT_DMABUF:
> > +        return con->scanout.dmabuf->width;
> > +    case SCANOUT_TEXTURE:
> > +        return con->scanout.texture.width;
> > +    case SCANOUT_SURFACE:
> > +        return surface_width(con->surface);
> > +    default:
> > +        return fallback;
> > +    }
> >   }
> >
> >   int qemu_console_get_height(QemuConsole *con, int fallback)
> > @@ -2245,7 +2283,19 @@ int qemu_console_get_height(QemuConsole *con, in=
t fallback)
> >       if (con =3D=3D NULL) {
> >           con =3D active_console;
> >       }
> > -    return con ? surface_height(con->surface) : fallback;
> > +    if (con =3D=3D NULL) {
> > +        return fallback;
> > +    }
> > +    switch (con->scanout.kind) {
> > +    case SCANOUT_DMABUF:
> > +        return con->scanout.dmabuf->height;
> > +    case SCANOUT_TEXTURE:
> > +        return con->scanout.texture.height;
> > +    case SCANOUT_SURFACE:
> > +        return surface_height(con->surface);
> > +    default:
> > +        return fallback;
> > +    }
> >   }
> >
> >   static void vc_chr_set_echo(Chardev *chr, bool echo)
> > @@ -2305,12 +2355,13 @@ static void text_console_do_init(Chardev *chr, =
DisplayState *ds)
> >       s->total_height =3D DEFAULT_BACKSCROLL;
> >       s->x =3D 0;
> >       s->y =3D 0;
> > -    if (!s->surface) {
> > -        if (active_console && active_console->surface) {
> > -            g_width =3D surface_width(active_console->surface);
> > -            g_height =3D surface_height(active_console->surface);
> > +    if (s->scanout.kind !=3D SCANOUT_SURFACE) {
> > +        if (active_console && active_console->scanout.kind =3D=3D SCAN=
OUT_SURFACE) {
> > +            g_width =3D qemu_console_get_width(active_console, g_width=
);
> > +            g_height =3D qemu_console_get_height(active_console, g_hei=
ght);
> >           }
> >           s->surface =3D qemu_create_displaysurface(g_width, g_height);
> > +        s->scanout.kind =3D SCANOUT_SURFACE;
> >       }
> >
> >       s->hw_ops =3D &text_console_ops;
> > @@ -2369,6 +2420,7 @@ static void vc_chr_open(Chardev *chr,
> >           s =3D new_console(NULL, TEXT_CONSOLE, 0);
> >       } else {
> >           s =3D new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
> > +        s->scanout.kind =3D SCANOUT_SURFACE;
> >           s->surface =3D qemu_create_displaysurface(width, height);
> >       }
> >
> > @@ -2392,13 +2444,13 @@ static void vc_chr_open(Chardev *chr,
> >
> >   void qemu_console_resize(QemuConsole *s, int width, int height)
> >   {
> > -    DisplaySurface *surface;
> > +    DisplaySurface *surface =3D qemu_console_surface(s);
> >
> >       assert(s->console_type =3D=3D GRAPHIC_CONSOLE);
> >
> > -    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
> > -        pixman_image_get_width(s->surface->image) =3D=3D width &&
> > -        pixman_image_get_height(s->surface->image) =3D=3D height) {
> > +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
> > +        pixman_image_get_width(surface->image) =3D=3D width &&
> > +        pixman_image_get_height(surface->image) =3D=3D height) {
> >           return;
> >       }
> >
> > @@ -2408,7 +2460,12 @@ void qemu_console_resize(QemuConsole *s, int wid=
th, int height)
> >
> >   DisplaySurface *qemu_console_surface(QemuConsole *console)
> >   {
> > -    return console->surface;
> > +    switch (console->scanout.kind) {
> > +    case SCANOUT_SURFACE:
> > +        return console->surface;
> > +    default:
> > +        return NULL;
> > +    }
> >   }
> >
> >   PixelFormat qemu_default_pixelformat(int bpp)
>


