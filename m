Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA913C1CC0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 02:32:58 +0200 (CEST)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1eRt-0005ak-2b
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 20:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1eQK-0004ty-Ck
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 20:31:20 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:34331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1eQI-00010O-2I
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 20:31:20 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 w8-20020a0568304108b02904b3da3d49e5so3697085ott.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 17:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXaUUc0vGke9kC7hgw1iWtbeVkcwRXrZQH+U30ndgAA=;
 b=Ntf73iYBNQF9krzJDPs+OSVuL/hZ4I1OK2KSe57HgrOVisjp0FncyzuuUc5GdF6XNz
 DYZQOqckXDI0DYvdnLwmi8Of5IxoB/8Xs3bN8bnupZb6buq4/ZJolJM/dyorRfQ8D11t
 smSpIegdZVTdHonrdnSNL4TOJdQcF8m+jkcS59SQ2VctRCh9sC/ceJLRdnpXVpcsbqF/
 jQ/WpgmbX1XO+kioc7OFam/djkG5ExBBaXua7+Qj8ZRscVdas5pjO4m9jo8oz3jvQ7o7
 yNSboXNlffLBsYtFWE1RU4an/MP/vWh8dFC8qDNx7vA4NCS72edPLQdH+qiFFWocikzC
 N7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXaUUc0vGke9kC7hgw1iWtbeVkcwRXrZQH+U30ndgAA=;
 b=TtNqis7CGR4tPPFDhReE388qumfaL01CouBdzqCimRqyRsinJHtJxC4+CVVOrnYAxr
 MPd56UKakStksUfoW54erjQUnDKpog5b4h/x/Ei3sFxznj9sS1+5VoAJcFXFSOt7pU51
 9tf3m4+6bV+NDiQqp3RypajGb6x9KoYBxF2ppjESofvlLS6kbyG7xzYvNpGtROuR993N
 iVpDYjzhanG4/nYNRXXHNe++GChF5X39OwyGyGBvoPqh8hzg9S7CJKF5LkMMNpaPO4J6
 Qd9NSpI0ZEtYE8BzTY3ofKwIiIoTH6OWtzBxe6gSebMaIu4YvPAi7dyWLJW9clbBwGjk
 Hktw==
X-Gm-Message-State: AOAM531CvkEmlE9UIu6zJ8zK51h6a52Q+fRSB+jwDrAahJMXXzjkk3SV
 GnwJhMbdlHWYxk86InPd9soHaE+Y24hHKm18UF0=
X-Google-Smtp-Source: ABdhPJw4gJOxSzK+674Tf+GTG5iN2np+s4Dg3Dm350RwknWV7uEVb8gZ5idsVAMJl0G2sNmLaQCTEeKpn7ugcC+75Bc=
X-Received: by 2002:a9d:2c44:: with SMTP id f62mr25654284otb.147.1625790676385; 
 Thu, 08 Jul 2021 17:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
 <20210708172541.29530-3-akihiko.odaki@gmail.com>
 <1C6877DA-5534-4593-B2A4-E41CA510D0FF@gmail.com>
In-Reply-To: <1C6877DA-5534-4593-B2A4-E41CA510D0FF@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 9 Jul 2021 09:31:05 +0900
Message-ID: <CAMVc7JUSc6qe59TKqyLYRR=s3T3Hf+JVr=UsDNdfsT0DBL8drQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ui/icons: Use bundle mechanism
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Reverting commit e31746ecf8dd2f25f687c94ac14016a3ba5debfc solves the
problem only for cocoa and introduces another problem. (For others:
see https://lore.kernel.org/qemu-devel/797ADA26-0366-447F-85F0-5E27DC534479@gmail.com/
for the context.) The fix for cocoa basically comes for free if you
fix the problem for other displays, and that's what this patch does.

Honestly I don't really like the nature of the code in the "configure"
script. It is a duplicate of ui/icons/meson.build and people may
overlook it when updating ui/icons/meson.build. I blindly followed
what the script does for pc-bios, but I can improve it for icons and
pc-bios by moving the responsibility to meson if it makes sense.

Regards,
Akihiko Odaki

On Fri, Jul 9, 2021 at 3:52 AM Programmingkid <programmingkidx@gmail.com> wrote:
>
>
> > On Jul 8, 2021, at 1:25 PM, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> > configure   | 10 ++++++++++
> > meson.build |  3 +--
> > ui/cocoa.m  | 20 +++++++++++---------
> > ui/gtk.c    |  8 +++++---
> > ui/sdl2.c   | 18 +++++++++++-------
> > 5 files changed, 38 insertions(+), 21 deletions(-)
> >
> > diff --git a/configure b/configure
> > index cff5a8ac280..a9f746849ec 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5058,6 +5058,16 @@ for f in $UNLINK ; do
> >     fi
> > done
> >
> > +for icon_extension in bmp png ; do
> > +  for icon_file in $source_path/ui/icons/qemu_*.$icon_extension ; do
> > +    icon_basename=${icon_file%.$icon_extension}
> > +    icon_name=${icon_basename#$source_path/ui/icons/qemu_}
> > +    icon_dir=qemu-bundle/share/icons/hicolor/$icon_name/apps
> > +    symlink $icon_file $icon_dir/qemu.$icon_extension
> > +  done
> > +done
> > +
> > +symlink $source_path/ui/icons/qemu.svg qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
> > symlink ../../pc-bios qemu-bundle/share/qemu
> >
> > (for i in $cross_cc_vars; do
> > diff --git a/meson.build b/meson.build
> > index 44adc660e23..6d90fe92bf1 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1200,8 +1200,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
> > config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
> > config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
> > config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
> > -config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
> > -config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
> > +config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
> > config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
> > config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
> > config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 9f72844b079..d459dfaf595 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -1477,15 +1477,17 @@ - (void)make_about_window
> >     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
> >
> >     /* Make the picture of QEMU */
> > -    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
> > -                                                     picture_rect];
> > -    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> > -    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
> > -    g_free(qemu_image_path_c);
> > -    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
> > -    [picture_view setImage: qemu_image];
> > -    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
> > -    [superView addSubview: picture_view];
> > +    char *qemu_image_path_c = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/512x512/apps/qemu.png");
> > +    if (qemu_image_path_c) {
> > +        NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
> > +        g_free(qemu_image_path_c);
> > +        NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
> > +                                                         picture_rect];
> > +        NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
> > +        [picture_view setImage: qemu_image];
> > +        [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
> > +        [superView addSubview: picture_view];
> > +    }
> >
> >     /* Make the name label */
> >     NSBundle *bundle = [NSBundle mainBundle];
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index 98046f577b9..e250f9e18a0 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -2198,9 +2198,11 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >     s->opts = opts;
> >
> >     theme = gtk_icon_theme_get_default();
> > -    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
> > -    gtk_icon_theme_prepend_search_path(theme, dir);
> > -    g_free(dir);
> > +    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
> > +    if (dir) {
> > +        gtk_icon_theme_prepend_search_path(theme, dir);
> > +        g_free(dir);
> > +    }
> >     g_set_prgname("qemu");
> >
> >     s->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
> > diff --git a/ui/sdl2.c b/ui/sdl2.c
> > index a203cb0239e..7b7ed9f9065 100644
> > --- a/ui/sdl2.c
> > +++ b/ui/sdl2.c
> > @@ -877,15 +877,19 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
> >     }
> >
> > #ifdef CONFIG_SDL_IMAGE
> > -    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
> > -    icon = IMG_Load(dir);
> > +    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/128x128/apps/qemu.png");
> > +    if (dir) {
> > +        icon = IMG_Load(dir);
> > +    }
> > #else
> >     /* Load a 32x32x4 image. White pixels are transparent. */
> > -    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
> > -    icon = SDL_LoadBMP(dir);
> > -    if (icon) {
> > -        uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
> > -        SDL_SetColorKey(icon, SDL_TRUE, colorkey);
> > +    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
> > +    if (dir) {
> > +        icon = SDL_LoadBMP(dir);
> > +        if (icon) {
> > +            uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
> > +            SDL_SetColorKey(icon, SDL_TRUE, colorkey);
> > +        }
> >     }
> > #endif
> >     g_free(dir);
> > --
> > 2.30.1 (Apple Git-130)
> >
>
> This is a lot of code for just loading an icon. I think it would be best to simply revert commit e31746ecf8dd2f25f687c94ac14016a3ba5debfc instead.
>
> Thank you.
>

