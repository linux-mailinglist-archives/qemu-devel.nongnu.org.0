Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3448A65B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 04:32:44 +0100 (CET)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n77tr-0003uX-6d
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 22:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n77rG-0002cj-L4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 22:30:02 -0500
Received: from [2607:f8b0:4864:20::1033] (port=51032
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n77rE-00017l-C4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 22:30:02 -0500
Received: by mail-pj1-x1033.google.com with SMTP id pf13so7716934pjb.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 19:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=73z/oWBXv0Qrl9ghwfhUStiyTV7KzxDC1E8qUZdINHU=;
 b=meAuC8VyI8QvKaacXzHYFhs7joHNarL3wFGF20UkydClmNb//2vUEUgO7jiQUJ6V2A
 EWwvJdkSImryWpfdlgUqbTr9lcUwzud4E5FCtta9YlQAxVp4mvmh4Sx0PXfXztexLc4m
 hoJCvO/zxB/AA20VlOcLJi32io2C1/1tvGpJVSi5mmh1AozDx/4kOz8Lw0wQf33hWp0w
 WYxervnugkvZnWaJSNF0qrwgqfIAf70n+pG/1c7KQUbvRdWFz6tf385ugzl9uYGRH4+q
 Gecg+5wf/1ryHN4DrzPPcHjxGQ37h8GR8Fzr93F/faqQjsaop7z4iwsSeCsdrt6+yjkm
 RC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=73z/oWBXv0Qrl9ghwfhUStiyTV7KzxDC1E8qUZdINHU=;
 b=lfZFBTorb8wTOVUqovGDXrKaox8IFk1rWCz6lIZCl5P0bg9L8PSpxuPso5KUviXw3w
 YrCnkTFd2xYLGSeKXHuV4x9UqqKFGrVxhA8uYSj75slPl2irA/CZDJp3rV6vs0wMVRWe
 XhVCyFapVqM888yVuUG2+eaZsfItbpEm7PeV/O1i2QFTk1Qzn1qtNmu09gUQb92QpMwX
 jK80Jc/vSiAvjEexHrbLDo3IMGRXy9HN9ImNaGudgsUzOR+33FNyeTPRctXMUALHJwKE
 m4Ftgoq4wpPOfpto4IOy9jtwkLh8rGAizBAOuIc4naXcBbCJPxRnaz9pgYAbzoWSyoWO
 661w==
X-Gm-Message-State: AOAM532h0087m3O+KCiPScRS9o05U1rKEq6hi9IC1g2/huBNRKY+MyNO
 nxpw8mBGK7GKKPRWjCWLDf9HAZJd5bidrQ==
X-Google-Smtp-Source: ABdhPJw14KWFTvsTa4gHyPmO28mrGWZ+3SwfMoZQXSlYPJOo9x/1N1dQHrtnLCINIMX1lbc03eDOvA==
X-Received: by 2002:a17:902:e544:b0:14a:555c:add3 with SMTP id
 n4-20020a170902e54400b0014a555cadd3mr844718plf.102.1641871798365; 
 Mon, 10 Jan 2022 19:29:58 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 g14sm6773222pgp.76.2022.01.10.19.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 19:29:58 -0800 (PST)
Message-ID: <25b61c23-aa66-8857-f5d3-6f6b31664a5c@gmail.com>
Date: Tue, 11 Jan 2022 12:29:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 19/37] console: save current scanout details
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-20-marcandre.lureau@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20211009210838.2219430-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I found this brings an inconsistency and a flaw to scanout semantics and 
think the inconsistency should be fixed or this should be reverted 
before the next release comes up.

The inconsistency is in the handling of the console size. A guest 
hardware (especially I'm looking at virtio-gpu-virgl) tells the size 
change with qemu_console_resize. It causes the replacement of the 
surface, and the host display sees the change of the size via the 
surface. The replacement of the surface does *not* mean the surface 
should be scanned out; if an OpenGL texture is already provided, the 
host display should scan out it, not the replaced surface. 
dpy_gl_scanout_disable will be called when the surface becomes the 
source of the scanouts.

However, this change brings some contradicting behaviors.
- qemu_console_get_width and qemu_console_get_height now relies on the 
texture size as the source of the console size while the resize is 
delivered via the surface.
- dpy_gfx_replace_surface makes the surface as the source of the 
scanouts while its guest hardware semantics does not mean that.
- dpy_gl_scanout_disable sets the scanout kind to SCANOUT_NONE while it 
actually means the surface is now the source of the scanout.

Besides that, displaychangelistener_display_console has a flaw that it 
does not tell the switch to a console with SCANOUT_NONE. The intention 
of SCANOUT_NONE is not entirely clear.

I think there are two options to fix the problem except reverting:
- Rework this change to make it consistent with the existing semantics.
- Remove the use of qemu_console_resize and dpy_gl_scanout_disable from
   hardwares providing OpenGL textures or DMA-BUF to make it consistent
   with the new semantics.

Regards,
Akihiko Odaki

On 2021/10/10 6:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add a new DisplayScanout structure to save the current scanout details.
> This allows to attach later UI backends and set the scanout.
> 
> Introduce displaychangelistener_display_console() helper function to
> handle the dpy_gfx_switch/gl_scanout() & dpy_gfx_update() calls.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/console.h |  27 +++++++
>   ui/console.c         | 165 +++++++++++++++++++++++++++++--------------
>   2 files changed, 138 insertions(+), 54 deletions(-)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index b23ae283be..ab55d71894 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -108,6 +108,17 @@ struct QemuConsoleClass {
>   #define QEMU_ALLOCATED_FLAG     0x01
>   #define QEMU_PLACEHOLDER_FLAG   0x02
>   
> +typedef struct ScanoutTexture {
> +    uint32_t backing_id;
> +    bool backing_y_0_top;
> +    uint32_t backing_width;
> +    uint32_t backing_height;
> +    uint32_t x;
> +    uint32_t y;
> +    uint32_t width;
> +    uint32_t height;
> +} ScanoutTexture;
> +
>   typedef struct DisplaySurface {
>       pixman_format_code_t format;
>       pixman_image_t *image;
> @@ -173,6 +184,22 @@ typedef struct QemuDmaBuf {
>       bool      allow_fences;
>   } QemuDmaBuf;
>   
> +enum display_scanout {
> +    SCANOUT_NONE,
> +    SCANOUT_SURFACE,
> +    SCANOUT_TEXTURE,
> +    SCANOUT_DMABUF,
> +};
> +
> +typedef struct DisplayScanout {
> +    enum display_scanout kind;
> +    union {
> +        /* DisplaySurface *surface; is kept in QemuConsole */
> +        ScanoutTexture texture;
> +        QemuDmaBuf *dmabuf;
> +    };
> +} DisplayScanout;
> +
>   typedef struct DisplayState DisplayState;
>   typedef struct DisplayGLCtx DisplayGLCtx;
>   
> diff --git a/ui/console.c b/ui/console.c
> index e5a2c84dd9..a1c6a78523 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -126,6 +126,7 @@ struct QemuConsole {
>       console_type_t console_type;
>       DisplayState *ds;
>       DisplaySurface *surface;
> +    DisplayScanout scanout;
>       int dcls;
>       DisplayGLCtx *gl;
>       int gl_block;
> @@ -197,6 +198,7 @@ static void dpy_refresh(DisplayState *s);
>   static DisplayState *get_alloc_displaystate(void);
>   static void text_console_update_cursor_timer(void);
>   static void text_console_update_cursor(void *opaque);
> +static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl);
>   
>   static void gui_update(void *opaque)
>   {
> @@ -532,6 +534,8 @@ static void text_console_resize(QemuConsole *s)
>       TextCell *cells, *c, *c1;
>       int w1, x, y, last_width;
>   
> +    assert(s->scanout.kind == SCANOUT_SURFACE);
> +
>       last_width = s->width;
>       s->width = surface_width(s->surface) / FONT_WIDTH;
>       s->height = surface_height(s->surface) / FONT_HEIGHT;
> @@ -1103,6 +1107,48 @@ static void console_putchar(QemuConsole *s, int ch)
>       }
>   }
>   
> +static void displaychangelistener_display_console(DisplayChangeListener *dcl,
> +                                                  QemuConsole *con)
> +{
> +    static const char nodev[] =
> +        "This VM has no graphic display device.";
> +    static DisplaySurface *dummy;
> +
> +    if (!con) {
> +        if (!dcl->ops->dpy_gfx_switch) {
> +            return;
> +        }
> +        if (!dummy) {
> +            dummy = qemu_create_placeholder_surface(640, 480, nodev);
> +        }
> +        dcl->ops->dpy_gfx_switch(dcl, dummy);
> +        return;
> +    }
> +
> +    if (con->scanout.kind == SCANOUT_DMABUF &&
> +        displaychangelistener_has_dmabuf(dcl)) {
> +        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
> +    } else if (con->scanout.kind == SCANOUT_TEXTURE &&
> +               dcl->ops->dpy_gl_scanout_texture) {
> +        dcl->ops->dpy_gl_scanout_texture(dcl,
> +                                         con->scanout.texture.backing_id,
> +                                         con->scanout.texture.backing_y_0_top,
> +                                         con->scanout.texture.backing_width,
> +                                         con->scanout.texture.backing_height,
> +                                         con->scanout.texture.x,
> +                                         con->scanout.texture.y,
> +                                         con->scanout.texture.width,
> +                                         con->scanout.texture.height);
> +    } else if (con->scanout.kind == SCANOUT_SURFACE &&
> +               dcl->ops->dpy_gfx_switch) {
> +        dcl->ops->dpy_gfx_switch(dcl, con->surface);
> +    }
> +
> +    dcl->ops->dpy_gfx_update(dcl, 0, 0,
> +                             qemu_console_get_width(con, 0),
> +                             qemu_console_get_height(con, 0));
> +}
> +
>   void console_select(unsigned int index)
>   {
>       DisplayChangeListener *dcl;
> @@ -1119,13 +1165,7 @@ void console_select(unsigned int index)
>                   if (dcl->con != NULL) {
>                       continue;
>                   }
> -                if (dcl->ops->dpy_gfx_switch) {
> -                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
> -                }
> -            }
> -            if (s->surface) {
> -                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
> -                               surface_height(s->surface));
> +                displaychangelistener_display_console(dcl, s);
>               }
>           }
>           if (ds->have_text) {
> @@ -1538,9 +1578,6 @@ static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
>   
>   void register_displaychangelistener(DisplayChangeListener *dcl)
>   {
> -    static const char nodev[] =
> -        "This VM has no graphic display device.";
> -    static DisplaySurface *dummy;
>       QemuConsole *con;
>   
>       assert(!dcl->ds);
> @@ -1565,16 +1602,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
>       } else {
>           con = active_console;
>       }
> -    if (dcl->ops->dpy_gfx_switch) {
> -        if (con) {
> -            dcl->ops->dpy_gfx_switch(dcl, con->surface);
> -        } else {
> -            if (!dummy) {
> -                dummy = qemu_create_placeholder_surface(640, 480, nodev);
> -            }
> -            dcl->ops->dpy_gfx_switch(dcl, dummy);
> -        }
> -    }
> +    displaychangelistener_display_console(dcl, con);
>       text_console_update_cursor(NULL);
>   }
>   
> @@ -1655,13 +1683,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
>   {
>       DisplayState *s = con->ds;
>       DisplayChangeListener *dcl;
> -    int width = w;
> -    int height = h;
> +    int width = qemu_console_get_width(con, x + w);
> +    int height = qemu_console_get_height(con, y + h);
>   
> -    if (con->surface) {
> -        width = surface_width(con->surface);
> -        height = surface_height(con->surface);
> -    }
>       x = MAX(x, 0);
>       y = MAX(y, 0);
>       x = MIN(x, width);
> @@ -1684,12 +1708,10 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
>   
>   void dpy_gfx_update_full(QemuConsole *con)
>   {
> -    if (!con->surface) {
> -        return;
> -    }
> -    dpy_gfx_update(con, 0, 0,
> -                   surface_width(con->surface),
> -                   surface_height(con->surface));
> +    int w = qemu_console_get_width(con, 0);
> +    int h = qemu_console_get_height(con, 0);
> +
> +    dpy_gfx_update(con, 0, 0, w, h);
>   }
>   
>   void dpy_gfx_replace_surface(QemuConsole *con,
> @@ -1716,6 +1738,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
>   
>       assert(old_surface != surface);
>   
> +    con->scanout.kind = SCANOUT_SURFACE;
>       con->surface = surface;
>       QLIST_FOREACH(dcl, &s->listeners, next) {
>           if (con != (dcl->con ? dcl->con : active_console)) {
> @@ -1891,6 +1914,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
>       DisplayState *s = con->ds;
>       DisplayChangeListener *dcl;
>   
> +    if (con->scanout.kind != SCANOUT_SURFACE) {
> +        con->scanout.kind = SCANOUT_NONE;
> +    }
>       QLIST_FOREACH(dcl, &s->listeners, next) {
>           dcl->ops->dpy_gl_scanout_disable(dcl);
>       }
> @@ -1907,6 +1933,11 @@ void dpy_gl_scanout_texture(QemuConsole *con,
>       DisplayState *s = con->ds;
>       DisplayChangeListener *dcl;
>   
> +    con->scanout.kind = SCANOUT_TEXTURE;
> +    con->scanout.texture = (ScanoutTexture) {
> +        backing_id, backing_y_0_top, backing_width, backing_height,
> +        x, y, width, height
> +    };
>       QLIST_FOREACH(dcl, &s->listeners, next) {
>           dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
>                                            backing_y_0_top,
> @@ -1921,6 +1952,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
>       DisplayState *s = con->ds;
>       DisplayChangeListener *dcl;
>   
> +    con->scanout.kind = SCANOUT_DMABUF;
> +    con->scanout.dmabuf = dmabuf;
>       QLIST_FOREACH(dcl, &s->listeners, next) {
>           dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
>       }
> @@ -2047,10 +2080,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
>       s = qemu_console_lookup_unused();
>       if (s) {
>           trace_console_gfx_reuse(s->index);
> -        if (s->surface) {
> -            width = surface_width(s->surface);
> -            height = surface_height(s->surface);
> -        }
> +        width = qemu_console_get_width(s, 0);
> +        height = qemu_console_get_height(s, 0);
>       } else {
>           trace_console_gfx_new();
>           s = new_console(ds, GRAPHIC_CONSOLE, head);
> @@ -2079,13 +2110,8 @@ void graphic_console_close(QemuConsole *con)
>       static const char unplugged[] =
>           "Guest display has been unplugged";
>       DisplaySurface *surface;
> -    int width = 640;
> -    int height = 480;
> -
> -    if (con->surface) {
> -        width = surface_width(con->surface);
> -        height = surface_height(con->surface);
> -    }
> +    int width = qemu_console_get_width(con, 640);
> +    int height = qemu_console_get_height(con, 480);
>   
>       trace_console_gfx_close(con->index);
>       object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
> @@ -2237,7 +2263,19 @@ int qemu_console_get_width(QemuConsole *con, int fallback)
>       if (con == NULL) {
>           con = active_console;
>       }
> -    return con ? surface_width(con->surface) : fallback;
> +    if (con == NULL) {
> +        return fallback;
> +    }
> +    switch (con->scanout.kind) {
> +    case SCANOUT_DMABUF:
> +        return con->scanout.dmabuf->width;
> +    case SCANOUT_TEXTURE:
> +        return con->scanout.texture.width;
> +    case SCANOUT_SURFACE:
> +        return surface_width(con->surface);
> +    default:
> +        return fallback;
> +    }
>   }
>   
>   int qemu_console_get_height(QemuConsole *con, int fallback)
> @@ -2245,7 +2283,19 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
>       if (con == NULL) {
>           con = active_console;
>       }
> -    return con ? surface_height(con->surface) : fallback;
> +    if (con == NULL) {
> +        return fallback;
> +    }
> +    switch (con->scanout.kind) {
> +    case SCANOUT_DMABUF:
> +        return con->scanout.dmabuf->height;
> +    case SCANOUT_TEXTURE:
> +        return con->scanout.texture.height;
> +    case SCANOUT_SURFACE:
> +        return surface_height(con->surface);
> +    default:
> +        return fallback;
> +    }
>   }
>   
>   static void vc_chr_set_echo(Chardev *chr, bool echo)
> @@ -2305,12 +2355,13 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
>       s->total_height = DEFAULT_BACKSCROLL;
>       s->x = 0;
>       s->y = 0;
> -    if (!s->surface) {
> -        if (active_console && active_console->surface) {
> -            g_width = surface_width(active_console->surface);
> -            g_height = surface_height(active_console->surface);
> +    if (s->scanout.kind != SCANOUT_SURFACE) {
> +        if (active_console && active_console->scanout.kind == SCANOUT_SURFACE) {
> +            g_width = qemu_console_get_width(active_console, g_width);
> +            g_height = qemu_console_get_height(active_console, g_height);
>           }
>           s->surface = qemu_create_displaysurface(g_width, g_height);
> +        s->scanout.kind = SCANOUT_SURFACE;
>       }
>   
>       s->hw_ops = &text_console_ops;
> @@ -2369,6 +2420,7 @@ static void vc_chr_open(Chardev *chr,
>           s = new_console(NULL, TEXT_CONSOLE, 0);
>       } else {
>           s = new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
> +        s->scanout.kind = SCANOUT_SURFACE;
>           s->surface = qemu_create_displaysurface(width, height);
>       }
>   
> @@ -2392,13 +2444,13 @@ static void vc_chr_open(Chardev *chr,
>   
>   void qemu_console_resize(QemuConsole *s, int width, int height)
>   {
> -    DisplaySurface *surface;
> +    DisplaySurface *surface = qemu_console_surface(s);
>   
>       assert(s->console_type == GRAPHIC_CONSOLE);
>   
> -    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
> -        pixman_image_get_width(s->surface->image) == width &&
> -        pixman_image_get_height(s->surface->image) == height) {
> +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
> +        pixman_image_get_width(surface->image) == width &&
> +        pixman_image_get_height(surface->image) == height) {
>           return;
>       }
>   
> @@ -2408,7 +2460,12 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
>   
>   DisplaySurface *qemu_console_surface(QemuConsole *console)
>   {
> -    return console->surface;
> +    switch (console->scanout.kind) {
> +    case SCANOUT_SURFACE:
> +        return console->surface;
> +    default:
> +        return NULL;
> +    }
>   }
>   
>   PixelFormat qemu_default_pixelformat(int bpp)

