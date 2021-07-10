Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02463C31CF
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 04:49:35 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m233e-0002Ne-Py
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 22:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m232O-0000pa-Jj
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:48:16 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m232M-0005hQ-HG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:48:16 -0400
Received: by mail-qk1-x732.google.com with SMTP id q190so11613118qkd.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 19:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ad1E58ioKRe52DX0iWfpfEDGrYmN1HfcpcszIS2h4/w=;
 b=a1g9YervHSKwfOuup2a9aA/KlBHtvqpjJ+yobv/Zf8pJrys+0voHZrCNEx1MY5LfAs
 8YbsRGM4ahJRKOaJUQMdDzfwxCaM3+HtVFR4brL8Wk+b9iVKGXcfZxlt15omRLbNTDfT
 Hepr2RYxezkDjMAd9DEOdXp83pGTmALTI1ADcLIkY/gau9npY4wOiMHK5+nJNIY9x3G+
 R0hp7IsAXg3qMuGHW+4MxdLbaRznTfxeh92AWBIof9p2iYUpSv82goGZ3xshYDHEYJaK
 qRm8+pu9XQsm6NgPN7yY9GTgfl3cbheLtOLxifKHjNM0i6kv28+1wvdFrdFyRwdSmjlP
 2p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ad1E58ioKRe52DX0iWfpfEDGrYmN1HfcpcszIS2h4/w=;
 b=MS0gbfNfUVyY8lMiS4QI5swuVv0d0mYgT1N44knU0SxO6jA5Ldo19zNiGMxtuCfAoH
 e2YGgSUjdubPW8f1BD3WEoNkKQIj3Tgz1TuAAT4jGptI9gYreNSRgr5ccJCGu4R7P4Bi
 qYmCgc0XUY2se2rFm8ZZELTW8MjiCHKAhgI3MNRJ7eKZI781aHFpldX1N69qP07g/36Y
 6445gkY6QX78WGtFSiqgkCLUab5upC7IfW+HyxlOMnB+FJBKlq72gVv5pu/PuHw0DGm7
 4nyIbIykBOJ+9JkknbcX0VBU69XulowV2jVM7oNGu7U1ELKGteo8HC/TWYjO86nlHgKM
 alsQ==
X-Gm-Message-State: AOAM530Xwu0Ro/QJpSKjLGQPaPlg6TmVA/yNcxhszCmjOV4ro+gLc853
 Zi7wcdCKpbrwZkhL2qcyNQg=
X-Google-Smtp-Source: ABdhPJwF24X6GzL61HzVMVgMQKg4Z6b1/VbQNTYy7/FrTAMdcT9zsqvwScGa3LR7+4Eu9uZ56BpDXA==
X-Received: by 2002:a05:620a:709:: with SMTP id
 9mr40552688qkc.493.1625885293468; 
 Fri, 09 Jul 2021 19:48:13 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id o10sm2791327qtv.62.2021.07.09.19.48.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Jul 2021 19:48:13 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 3/4] ui/icons: Use bundle mechanism
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAMVc7JUSc6qe59TKqyLYRR=s3T3Hf+JVr=UsDNdfsT0DBL8drQ@mail.gmail.com>
Date: Fri, 9 Jul 2021 22:48:12 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <202D0876-4A6E-4159-8A42-572DE1FA87AF@gmail.com>
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
 <20210708172541.29530-3-akihiko.odaki@gmail.com>
 <1C6877DA-5534-4593-B2A4-E41CA510D0FF@gmail.com>
 <CAMVc7JUSc6qe59TKqyLYRR=s3T3Hf+JVr=UsDNdfsT0DBL8drQ@mail.gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x732.google.com
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



> On Jul 8, 2021, at 8:31 PM, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> Hi,
>=20
> Reverting commit e31746ecf8dd2f25f687c94ac14016a3ba5debfc solves the
> problem only for cocoa and introduces another problem. (For others:
> see =
https://lore.kernel.org/qemu-devel/797ADA26-0366-447F-85F0-5E27DC534479@gm=
ail.com/
> for the context.)

What is the other problem that reverting the commit causes?=20

> The fix for cocoa basically comes for free if you
> fix the problem for other displays, and that's what this patch does.

That may be true but it also introduces the problem of having to keep =
track of a picture file. With the original code there is no external =
picture file needed.

>=20
> On Fri, Jul 9, 2021 at 3:52 AM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>>=20
>>> On Jul 8, 2021, at 1:25 PM, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>>>=20
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> ---
>>> configure   | 10 ++++++++++
>>> meson.build |  3 +--
>>> ui/cocoa.m  | 20 +++++++++++---------
>>> ui/gtk.c    |  8 +++++---
>>> ui/sdl2.c   | 18 +++++++++++-------
>>> 5 files changed, 38 insertions(+), 21 deletions(-)
>>>=20
>>> diff --git a/configure b/configure
>>> index cff5a8ac280..a9f746849ec 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -5058,6 +5058,16 @@ for f in $UNLINK ; do
>>>    fi
>>> done
>>>=20
>>> +for icon_extension in bmp png ; do
>>> +  for icon_file in $source_path/ui/icons/qemu_*.$icon_extension ; =
do
>>> +    icon_basename=3D${icon_file%.$icon_extension}
>>> +    icon_name=3D${icon_basename#$source_path/ui/icons/qemu_}
>>> +    icon_dir=3Dqemu-bundle/share/icons/hicolor/$icon_name/apps
>>> +    symlink $icon_file $icon_dir/qemu.$icon_extension
>>> +  done
>>> +done
>>> +
>>> +symlink $source_path/ui/icons/qemu.svg =
qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
>>> symlink ../../pc-bios qemu-bundle/share/qemu
>>>=20
>>> (for i in $cross_cc_vars; do
>>> diff --git a/meson.build b/meson.build
>>> index 44adc660e23..6d90fe92bf1 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1200,8 +1200,7 @@ =
config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') =
/ qemu_c
>>> config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', =
qemu_datadir)
>>> config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', =
get_option('prefix') / qemu_desktopdir)
>>> config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', =
get_option('qemu_firmwarepath'))
>>> -config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', =
get_option('prefix') / get_option('libexecdir'))
>>> -config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', =
get_option('prefix') / qemu_icondir)
>>> +config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', =
qemu_icondir)
>>> config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', =
get_option('prefix') / get_option('localedir'))
>>> config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', =
get_option('prefix') / get_option('localstatedir'))
>>> config_host_data.set_quoted('CONFIG_QEMU_MODDIR', =
get_option('prefix') / qemu_moddir)
>>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>>> index 9f72844b079..d459dfaf595 100644
>>> --- a/ui/cocoa.m
>>> +++ b/ui/cocoa.m
>>> @@ -1477,15 +1477,17 @@ - (void)make_about_window
>>>    NSRect picture_rect =3D NSMakeRect(x, y, picture_width, =
picture_height);
>>>=20
>>>    /* Make the picture of QEMU */
>>> -    NSImageView *picture_view =3D [[NSImageView alloc] =
initWithFrame:
>>> -                                                     picture_rect];
>>> -    char *qemu_image_path_c =3D =
get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/512x512/apps/qemu.png");
>>> -    NSString *qemu_image_path =3D [NSString =
stringWithUTF8String:qemu_image_path_c];
>>> -    g_free(qemu_image_path_c);
>>> -    NSImage *qemu_image =3D [[NSImage alloc] =
initWithContentsOfFile:qemu_image_path];
>>> -    [picture_view setImage: qemu_image];
>>> -    [picture_view setImageScaling: =
NSImageScaleProportionallyUpOrDown];
>>> -    [superView addSubview: picture_view];
>>> +    char *qemu_image_path_c =3D =
find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/512x512/apps/qemu.png");
>>> +    if (qemu_image_path_c) {
>>> +        NSString *qemu_image_path =3D [NSString =
stringWithUTF8String:qemu_image_path_c];
>>> +        g_free(qemu_image_path_c);
>>> +        NSImageView *picture_view =3D [[NSImageView alloc] =
initWithFrame:
>>> +                                                         =
picture_rect];
>>> +        NSImage *qemu_image =3D [[NSImage alloc] =
initWithContentsOfFile:qemu_image_path];
>>> +        [picture_view setImage: qemu_image];
>>> +        [picture_view setImageScaling: =
NSImageScaleProportionallyUpOrDown];
>>> +        [superView addSubview: picture_view];
>>> +    }
>>>=20
>>>    /* Make the name label */
>>>    NSBundle *bundle =3D [NSBundle mainBundle];
>>> diff --git a/ui/gtk.c b/ui/gtk.c
>>> index 98046f577b9..e250f9e18a0 100644
>>> --- a/ui/gtk.c
>>> +++ b/ui/gtk.c
>>> @@ -2198,9 +2198,11 @@ static void gtk_display_init(DisplayState =
*ds, DisplayOptions *opts)
>>>    s->opts =3D opts;
>>>=20
>>>    theme =3D gtk_icon_theme_get_default();
>>> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR);
>>> -    gtk_icon_theme_prepend_search_path(theme, dir);
>>> -    g_free(dir);
>>> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
>>> +    if (dir) {
>>> +        gtk_icon_theme_prepend_search_path(theme, dir);
>>> +        g_free(dir);
>>> +    }
>>>    g_set_prgname("qemu");
>>>=20
>>>    s->window =3D gtk_window_new(GTK_WINDOW_TOPLEVEL);
>>> diff --git a/ui/sdl2.c b/ui/sdl2.c
>>> index a203cb0239e..7b7ed9f9065 100644
>>> --- a/ui/sdl2.c
>>> +++ b/ui/sdl2.c
>>> @@ -877,15 +877,19 @@ static void sdl2_display_init(DisplayState =
*ds, DisplayOptions *o)
>>>    }
>>>=20
>>> #ifdef CONFIG_SDL_IMAGE
>>> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/128x128/apps/qemu.png");
>>> -    icon =3D IMG_Load(dir);
>>> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/128x128/apps/qemu.png");
>>> +    if (dir) {
>>> +        icon =3D IMG_Load(dir);
>>> +    }
>>> #else
>>>    /* Load a 32x32x4 image. White pixels are transparent. */
>>> -    dir =3D get_relocated_path(CONFIG_QEMU_ICONDIR =
"/hicolor/32x32/apps/qemu.bmp");
>>> -    icon =3D SDL_LoadBMP(dir);
>>> -    if (icon) {
>>> -        uint32_t colorkey =3D SDL_MapRGB(icon->format, 255, 255, =
255);
>>> -        SDL_SetColorKey(icon, SDL_TRUE, colorkey);
>>> +    dir =3D find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR =
"/hicolor/32x32/apps/qemu.bmp");
>>> +    if (dir) {
>>> +        icon =3D SDL_LoadBMP(dir);
>>> +        if (icon) {
>>> +            uint32_t colorkey =3D SDL_MapRGB(icon->format, 255, =
255, 255);
>>> +            SDL_SetColorKey(icon, SDL_TRUE, colorkey);
>>> +        }
>>>    }
>>> #endif
>>>    g_free(dir);
>>> --
>>> 2.30.1 (Apple Git-130)
>>>=20
>>=20
>> This is a lot of code for just loading an icon. I think it would be =
best to simply revert commit e31746ecf8dd2f25f687c94ac14016a3ba5debfc =
instead.
>>=20
>> Thank you.
>>=20


