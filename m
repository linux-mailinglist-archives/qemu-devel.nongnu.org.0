Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D43C1973
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:55:57 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZBk-0006kX-Sj
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Z8m-0001Z1-Dr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:52:52 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Z8k-00087x-81
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:52:52 -0400
Received: by mail-qt1-x82d.google.com with SMTP id g8so5620184qth.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2AiOlE578bR7jUT/hF5CLn2cCaH+0qWpresCAvnSmuc=;
 b=sUknyyyre8LZxNu9R2cVGou9T0vnhmp097anRkS0E/v3ypOqwdNdXYqTFI13lhWR/0
 IiL7/ytActwGVYMfrONvIZRCiyKHCJqw37x5NFTKbZFY6/842BYR2i5rqBbGl856Qy/f
 S+qpXu2bRe9UEl5R3GmDvsRHWBHohn6a63mE02vK32S1Ejl0O00n1C9hnC08SiWiRP9z
 FEIHlpwQ4pUrjDTvJfr4QnhUmHtvJgU0+5pUDOUwTcLNyOyefLQZ+bAMzpaCk4grQnIS
 ZtDzVzsxfbfO+dsP23yW1agyZtRVTiTP7aBB9XR4PYHqmLiN2Xyt1glGoGywsCPgkTC2
 iIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2AiOlE578bR7jUT/hF5CLn2cCaH+0qWpresCAvnSmuc=;
 b=lmOCvKXvmccFZM5bmK/Zuj5U2FPK4i2A3lVUTSAJ/0agnBcUEuY8sdTSyCl29h0kUb
 NUh3E8F2B3fGQyPVCazWKgyA/vjeCzIoFHBhbPjF/+wdJNlzDclk+QC47FbmgTmErnuz
 XQVLph4bP4z5ik4TumOuc2TPJvtrNWrYIyjdjiA7gAOpd0YQsJQaQQrMboy73TxrbVZi
 Oj7JnLY1Rh+PEJuqEjszgSVUBG3cpzhanCAePrqY7+tITjmfYD+lQSmmQyLRED75/sUU
 4JPgFX8CAG6E+aiCsAC0MczPiPZGeejcFnoGwFxnUniklU9KPsqlkpUu5cV17dqNQgkx
 eATw==
X-Gm-Message-State: AOAM530/GkRJZJnBA4Djy5TyppHy7GG1+BG03mNWlypMLBs2yo15CPVL
 w9HQJxW/ESntQJAN/LJ5oks=
X-Google-Smtp-Source: ABdhPJyOkh3gg/ZVl2/MIrVpoZBdhauMPYeFXeFxWQLjo5S3DJVODNrQIU4LUw9TcyNE5uigB2hF3A==
X-Received: by 2002:a05:622a:1745:: with SMTP id
 l5mr21041677qtk.153.1625770369407; 
 Thu, 08 Jul 2021 11:52:49 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id f2sm658274qte.67.2021.07.08.11.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 11:52:49 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 3/4] ui/icons: Use bundle mechanism
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210708172541.29530-3-akihiko.odaki@gmail.com>
Date: Thu, 8 Jul 2021 14:52:48 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C6877DA-5534-4593-B2A4-E41CA510D0FF@gmail.com>
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
 <20210708172541.29530-3-akihiko.odaki@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82d.google.com
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


> On Jul 8, 2021, at 1:25 PM, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> configure   | 10 ++++++++++
> meson.build |  3 +--
> ui/cocoa.m  | 20 +++++++++++---------
> ui/gtk.c    |  8 +++++---
> ui/sdl2.c   | 18 +++++++++++-------
> 5 files changed, 38 insertions(+), 21 deletions(-)
>=20
> diff --git a/configure b/configure
> index cff5a8ac280..a9f746849ec 100755
> --- a/configure
> +++ b/configure
> @@ -5058,6 +5058,16 @@ for f in $UNLINK ; do
>     fi
> done
>=20
> +for icon_extension in bmp png ; do
> +  for icon_file in $source_path/ui/icons/qemu_*.$icon_extension ; do
> +    icon_basename=3D${icon_file%.$icon_extension}
> +    icon_name=3D${icon_basename#$source_path/ui/icons/qemu_}
> +    icon_dir=3Dqemu-bundle/share/icons/hicolor/$icon_name/apps
> +    symlink $icon_file $icon_dir/qemu.$icon_extension
> +  done
> +done
> +
> +symlink $source_path/ui/icons/qemu.svg =
qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
> symlink ../../pc-bios qemu-bundle/share/qemu
>=20
> (for i in $cross_cc_vars; do
> diff --git a/meson.build b/meson.build
> index 44adc660e23..6d90fe92bf1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1200,8 +1200,7 @@ =
config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') =
/ qemu_c
> config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', =
qemu_datadir)
> config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', =
get_option('prefix') / qemu_desktopdir)
> config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', =
get_option('qemu_firmwarepath'))
> -config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', =
get_option('prefix') / get_option('libexecdir'))
> -config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', =
get_option('prefix') / qemu_icondir)
> +config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', =
qemu_icondir)
> config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', =
get_option('prefix') / get_option('localedir'))
> config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', =
get_option('prefix') / get_option('localstatedir'))
> config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') =
/ qemu_moddir)
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 9f72844b079..d459dfaf595 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1477,15 +1477,17 @@ - (void)make_about_window
>     NSRect picture_rect =3D NSMakeRect(x, y, picture_width, =
picture_height);
>=20
>     /* Make the picture of QEMU */
> -    NSImageView *picture_view =3D [[NSImageView alloc] initWithFrame:
> -                                                     picture_rect];
> -    char *qemu_image_path_c =3D =
get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/512x512/apps/qemu.png");
> -    NSString *qemu_image_path =3D [NSString =
stringWithUTF8String:qemu_image_path_c];
> -    g_free(qemu_image_path_c);
> -    NSImage *qemu_image =3D [[NSImage alloc] =
initWithContentsOfFile:qemu_image_path];
> -    [picture_view setImage: qemu_image];
> -    [picture_view setImageScaling: =
NSImageScaleProportionallyUpOrDown];
> -    [superView addSubview: picture_view];
> +    char *qemu_image_path_c =3D =
find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/512x512/apps/qemu.png");
> +    if (qemu_image_path_c) {
> +        NSString *qemu_image_path =3D [NSString =
stringWithUTF8String:qemu_image_path_c];
> +        g_free(qemu_image_path_c);
> +        NSImageView *picture_view =3D [[NSImageView alloc] =
initWithFrame:
> +                                                         =
picture_rect];
> +        NSImage *qemu_image =3D [[NSImage alloc] =
initWithContentsOfFile:qemu_image_path];
> +        [picture_view setImage: qemu_image];
> +        [picture_view setImageScaling: =
NSImageScaleProportionallyUpOrDown];
> +        [superView addSubview: picture_view];
> +    }
>=20
>     /* Make the name label */
>     NSBundle *bundle =3D [NSBundle mainBundle];
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b9..e250f9e18a0 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2198,9 +2198,11 @@ static void gtk_display_init(DisplayState *ds, =
DisplayOptions *opts)
>     s->opts =3D opts;
>=20
>     theme =3D gtk_icon_theme_get_default();
> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR);
> -    gtk_icon_theme_prepend_search_path(theme, dir);
> -    g_free(dir);
> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
> +    if (dir) {
> +        gtk_icon_theme_prepend_search_path(theme, dir);
> +        g_free(dir);
> +    }
>     g_set_prgname("qemu");
>=20
>     s->window =3D gtk_window_new(GTK_WINDOW_TOPLEVEL);
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index a203cb0239e..7b7ed9f9065 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -877,15 +877,19 @@ static void sdl2_display_init(DisplayState *ds, =
DisplayOptions *o)
>     }
>=20
> #ifdef CONFIG_SDL_IMAGE
> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/128x128/apps/qemu.png");
> -    icon =3D IMG_Load(dir);
> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/128x128/apps/qemu.png");
> +    if (dir) {
> +        icon =3D IMG_Load(dir);
> +    }
> #else
>     /* Load a 32x32x4 image. White pixels are transparent. */
> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/32x32/apps/qemu.bmp");
> -    icon =3D SDL_LoadBMP(dir);
> -    if (icon) {
> -        uint32_t colorkey =3D SDL_MapRGB(icon->format, 255, 255, =
255);
> -        SDL_SetColorKey(icon, SDL_TRUE, colorkey);
> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/32x32/apps/qemu.bmp");
> +    if (dir) {
> +        icon =3D SDL_LoadBMP(dir);
> +        if (icon) {
> +            uint32_t colorkey =3D SDL_MapRGB(icon->format, 255, 255, =
255);
> +            SDL_SetColorKey(icon, SDL_TRUE, colorkey);
> +        }
>     }
> #endif
>     g_free(dir);
> --=20
> 2.30.1 (Apple Git-130)
>=20

This is a lot of code for just loading an icon. I think it would be best =
to simply revert commit e31746ecf8dd2f25f687c94ac14016a3ba5debfc =
instead.

Thank you.


