Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217824C593F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 05:23:45 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOB5x-0006Wt-RO
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 23:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOB4p-0005qO-JU
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 23:22:31 -0500
Received: from [2607:f8b0:4864:20::32a] (port=36806
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOB4n-00074o-9E
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 23:22:31 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso6884037oti.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 20:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RlhU0O9eWlR0J+i0lSPsvWAdtjx3o0KqBAdOrXZozOk=;
 b=iOEcuAyU1Y+zKrq4gQUgXYD88+nnDhkqodiXaQJQUVyZs+WrLsAUHTR+3Q29T/s7hU
 erEPH5xq4znH1Tzy5fXxvyvB1P4GnBqK2sj+01qejxzDi8jmm1rkk3A7NUmeqM2tvYMI
 WJO6fLZWYZ11ZccUmV0tsFEY20IZKCYJx5Swsnub7ZxJxcaivnCySWuvZCoIY6wKg2py
 KQMCmsK+7vasuVGUmTNY333eeZLnzNuDnbMEEoE0MpJ84IDeFqxU62vfmrabWJKROiQo
 Fr5RVnh7yhLr3+9qUDGJEkq8iIZauAa3UUAByVKNgTB0iA5kYBi5lT4o2uq5Agyjma0a
 BB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RlhU0O9eWlR0J+i0lSPsvWAdtjx3o0KqBAdOrXZozOk=;
 b=e0XVMDsJe5L16zJR+QRWDlS/2Vd4JiqSXo/L4lQ2HBMamDGukSeP8nrzWjzKPYN6la
 JzgdNZ4WT7xqhev5kBBYxKxPIoLMno7DuP9bYylmyg24SXutm0+SRlBWzXFFloQWhQZm
 /bifs9fy6FN68N2x07DUNFZza8YD/clMOJjDT/DqNfuLFVlf3/4Xn85j/M2WV3a6paLN
 5JXXHWVSULFOuGIe5kIYmVflSYYgrkEMUbKWF54AyxuQnjPFjVurkiWaRkInEHo4eqYl
 NPMOi1Q8dSlEKR6BuBSk4X4ESIUifwUWxyONLCVuYtjqkfk8cXT11CV0V106bCBJAZhI
 jvsQ==
X-Gm-Message-State: AOAM5323/059k1zhhSwMidPu92prdAcUwUT/z/P/+Vfei9Yc2UaCzPUB
 7fJFvFMKkyQ5Om97T+ePBe8S6RokB/tUP0mUy2c=
X-Google-Smtp-Source: ABdhPJydC4LeVo47HPD00aMjg05hCp8mzTkwbHGk9KUH8cqCH50EIQniO6Q60WJz48PMvxRcluNxz068bb++/Jv5q4M=
X-Received: by 2002:a05:6830:3155:b0:5af:ec46:73e0 with SMTP id
 c21-20020a056830315500b005afec4673e0mr2108123ots.235.1645935744719; Sat, 26
 Feb 2022 20:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20220226125630.92909-1-akihiko.odaki@gmail.com>
 <15732fa4-8db3-bcc5-10a2-82c6d2e035e3@eik.bme.hu>
In-Reply-To: <15732fa4-8db3-bcc5-10a2-82c6d2e035e3@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sun, 27 Feb 2022 13:22:14 +0900
Message-ID: <CAMVc7JUG_Rs_2JbY2VBqPskt0GmMp_CviQAWy=1BAmhdpiZAUg@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use the standard about panel
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_FMBLA_NEWDOM=1.498, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 27, 2022 at 2:18 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 26 Feb 2022, Akihiko Odaki wrote:
> > This provides standard look and feel for the about panel and reduces
> > code.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> > ui/cocoa.m | 112 +++++++++++------------------------------------------
> > 1 file changed, 23 insertions(+), 89 deletions(-)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index a8f1cdaf926..9c27b9f5aa7 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
> >
> > static void cocoa_refresh(DisplayChangeListener *dcl);
> >
> > -static NSWindow *normalWindow, *about_window;
> > +static NSWindow *normalWindow;
> > static const DisplayChangeListenerOps dcl_ops = {
> >     .dpy_name          = "cocoa",
> >     .dpy_gfx_update = cocoa_update,
> > @@ -1120,7 +1120,6 @@ - (void)changeDeviceMedia:(id)sender;
> > - (BOOL)verifyQuit;
> > - (void)openDocumentation:(NSString *)filename;
> > - (IBAction) do_about_menu_item: (id) sender;
> > -- (void)make_about_window;
> > - (void)adjustSpeed:(id)sender;
> > @end
> >
> > @@ -1166,8 +1165,6 @@ - (id) init
> >         [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
> >         [pauseLabel setTextColor: [NSColor blackColor]];
> >         [pauseLabel sizeToFit];
> > -
> > -        [self make_about_window];
> >     }
> >     return self;
> > }
> > @@ -1451,92 +1448,29 @@ - (BOOL)verifyQuit
> > /* The action method for the About menu item */
> > - (IBAction) do_about_menu_item: (id) sender
> > {
> > -    [about_window makeKeyAndOrderFront: nil];
> > -}
> > -
> > -/* Create and display the about dialog */
> > -- (void)make_about_window
> > -{
> > -    /* Make the window */
> > -    int x = 0, y = 0, about_width = 400, about_height = 200;
> > -    NSRect window_rect = NSMakeRect(x, y, about_width, about_height);
> > -    about_window = [[NSWindow alloc] initWithContentRect:window_rect
> > -                    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
> > -                    NSWindowStyleMaskMiniaturizable
> > -                    backing:NSBackingStoreBuffered
> > -                    defer:NO];
> > -    [about_window setTitle: @"About"];
> > -    [about_window setReleasedWhenClosed: NO];
> > -    [about_window center];
> > -    NSView *superView = [about_window contentView];
> > -
> > -    /* Create the dimensions of the picture */
> > -    int picture_width = 80, picture_height = 80;
> > -    x = (about_width - picture_width)/2;
> > -    y = about_height - picture_height - 10;
> > -    NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
> > -
> > -    /* Make the picture of QEMU */
> > -    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
> > -                                                     picture_rect];
> > -    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> > -    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
> > -    g_free(qemu_image_path_c);
> > -    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
> > -    [picture_view setImage: qemu_image];
> > -    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
> > -    [superView addSubview: picture_view];
> > -
> > -    /* Make the name label */
> > -    NSBundle *bundle = [NSBundle mainBundle];
> > -    if (bundle) {
> > -        x = 0;
> > -        y = y - 25;
> > -        int name_width = about_width, name_height = 20;
> > -        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
> > -        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
> > -        [name_label setEditable: NO];
> > -        [name_label setBezeled: NO];
> > -        [name_label setDrawsBackground: NO];
> > -        [name_label setAlignment: NSTextAlignmentCenter];
> > -        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
> > -        [name_label setStringValue: qemu_name];
> > -        [superView addSubview: name_label];
> > +    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
>
> Extra space between * and pool?

I'll remove it with the next version.

>
> > +    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> > +    NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
> > +    g_free(icon_path_c);
> > +    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
> > +    NSString *version = @"QEMU emulator version " QEMU_FULL_VERSION;
> > +    NSString *copyright = @QEMU_COPYRIGHT;
> > +    NSDictionary *options;
> > +    if (icon) {
> > +        options = @{
> > +            NSAboutPanelOptionApplicationIcon : icon,
> > +            NSAboutPanelOptionApplicationVersion : version,
> > +            @"Copyright" : copyright,
> > +        };
> > +        [icon release];
> > +    } else {
> > +        options = @{
> > +            NSAboutPanelOptionApplicationVersion : version,
> > +            @"Copyright" : copyright,
> > +        };
>
> It may be less redundant to init the oprions dict only with version and
> copyright first then have an if adding the icon key if exists but for that
> an NSMutableDictionary may be needed so not sure about that. It might
> still have less duplication that way.

As you suspected, it would need NSMutableDictionary and conversion to
NSDictionary from it, and does not reduce the complexity in total.

Regards,
Akihiko Odaki

>
> Regards,
> BALATON Zoltan
>
> >     }
> > -
> > -    /* Set the version label's attributes */
> > -    x = 0;
> > -    y = 50;
> > -    int version_width = about_width, version_height = 20;
> > -    NSRect version_rect = NSMakeRect(x, y, version_width, version_height);
> > -    NSTextField *version_label = [[NSTextField alloc] initWithFrame:
> > -                                                      version_rect];
> > -    [version_label setEditable: NO];
> > -    [version_label setBezeled: NO];
> > -    [version_label setAlignment: NSTextAlignmentCenter];
> > -    [version_label setDrawsBackground: NO];
> > -
> > -    /* Create the version string*/
> > -    NSString *version_string;
> > -    version_string = [[NSString alloc] initWithFormat:
> > -    @"QEMU emulator version %s", QEMU_FULL_VERSION];
> > -    [version_label setStringValue: version_string];
> > -    [superView addSubview: version_label];
> > -
> > -    /* Make copyright label */
> > -    x = 0;
> > -    y = 35;
> > -    int copyright_width = about_width, copyright_height = 20;
> > -    NSRect copyright_rect = NSMakeRect(x, y, copyright_width, copyright_height);
> > -    NSTextField *copyright_label = [[NSTextField alloc] initWithFrame:
> > -                                                        copyright_rect];
> > -    [copyright_label setEditable: NO];
> > -    [copyright_label setBezeled: NO];
> > -    [copyright_label setDrawsBackground: NO];
> > -    [copyright_label setAlignment: NSTextAlignmentCenter];
> > -    [copyright_label setStringValue: [NSString stringWithFormat: @"%s",
> > -                                     QEMU_COPYRIGHT]];
> > -    [superView addSubview: copyright_label];
> > +    [NSApp orderFrontStandardAboutPanelWithOptions:options];
> > +    [pool release];
> > }
> >
> > /* Used by the Speed menu items */
> >

