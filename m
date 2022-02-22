Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A54BFFFC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:18:32 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYo2-0006GR-Jw
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nMYj3-0003qu-P8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:13:21 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=40795
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nMYj1-0006SR-Qx
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:13:21 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so18488403ooi.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhoOGJfpclt4ZPR7H+QuLySb6PEilUk2k4pkuTN8BFE=;
 b=OHHwmyI0KXjfEEVlADY/7xJwUd0WYHTu04h3zj33bhYQ2BQh9RMkKDtmXuXXmdWedu
 w+pHGFjLaKQF5jg0OjX2QQaGRCNYKadc7S21bshJoWOVnxolBL4xffBdS9pzm42jciiZ
 jGmgocGn4JvlLwSroGvdp5pLnUK0lQX3Cj5rnOb6HAYV51jAPZwbH9BVI8SIeBo5B64M
 uYaETGEs+hd5pdkn07JG3BnIXOXlXC32wDLcnm2Jq/tuKzo4LNRFMQaZQut+Su84Z0vD
 WN+bOcJI4Ry890vSiwudCkMX8F7Jl+mo5VxDN1SbSIxMI7ahWXLVgjT1cvJ6KkjuTPXV
 uCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhoOGJfpclt4ZPR7H+QuLySb6PEilUk2k4pkuTN8BFE=;
 b=mQB27lOZChdtNAQ+nfX63uuA0NhaSGMI7uC1/12DMwSnpWow8x8sadFWbh2bG49TYa
 CHJ6ZCPnyZIs7YdCpk7K8E4mZVlQPVF885P+z/x1Ov+efIl+JPsAA4YGU7G41irxoc6y
 AVOUROMLaCz7cz59znHn0k+jG8FREAWs5Y1PGn+UQpL421GSopVC5BOvfrA81C+g2641
 qUOLa8TpECIJJN6cQNBw+w9fe4huzFaPbHFwf03csyaExDUqdhhdhEpukfleKfdjppeI
 gIXtbpvHLd/qXWvK7r7TnoO9iZI+PFCYsvBcO6S43mjVf2k6PMr7MHyJVSO7oO5NpErR
 YFXA==
X-Gm-Message-State: AOAM5324jjCGd+arE9n7sRKyYhq2c9rJYvtHTTbIb25vsHucLLiAdNPU
 dWSxFAxXaf/c1Kof8RAX44n34rx7ANnxVjX6ySA=
X-Google-Smtp-Source: ABdhPJxCyDWIHWHueJlJJa67iXWwY9Tst1irSjlW0wcAH7jD7ExIP6kITPFiLJ+P22wkK+dfdzg9t4gspHnsk/t5jtE=
X-Received: by 2002:a05:6870:f78d:b0:d2:73ff:93a8 with SMTP id
 fs13-20020a056870f78d00b000d273ff93a8mr2074086oab.193.1645549997060; Tue, 22
 Feb 2022 09:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20220222170645.860661-1-peter.maydell@linaro.org>
 <20220222170645.860661-2-peter.maydell@linaro.org>
In-Reply-To: <20220222170645.860661-2-peter.maydell@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 23 Feb 2022 02:13:06 +0900
Message-ID: <CAMVc7JXkQo4XYhuYHN91h7Sr+60HQkp4gKQSH=QH=yg3JSjz3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ui/cocoa.m: Fix updateUIInfo threading issues
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 2:06 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The updateUIInfo method makes Cocoa API calls.  It also calls back
> into QEMU functions like dpy_set_ui_info().  To do this safely, we
> need to follow two rules:
>  * Cocoa API calls are made on the Cocoa UI thread
>  * When calling back into QEMU we must hold the iothread lock
>
> Fix the places where we got this wrong, by taking the iothread lock
> while executing updateUIInfo, and moving the call in cocoa_switch()
> inside the dispatch_async block.
>
> Some of the Cocoa UI methods which call updateUIInfo are invoked as
> part of the initial application startup, while we're still doing the
> little cross-thread dance described in the comment just above
> call_qemu_main().  This meant they were calling back into the QEMU UI
> layer before we'd actually finished initializing our display and
> registered the DisplayChangeListener, which isn't really valid.  Once
> updateUIInfo takes the iothread lock, we no longer get away with
> this, because during this startup phase the iothread lock is held by
> the QEMU main-loop thread which is waiting for us to finish our
> display initialization.  So we must suppress updateUIInfo until
> applicationDidFinishLaunching allows the QEMU main-loop thread to
> continue, and instead defer telling the UI layer about our initial
> window size until later.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks for fixing this bug.

> ---
>  ui/cocoa.m | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index a8f1cdaf926..f8d3d8ad7a6 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -522,8 +522,9 @@ QemuCocoaView *cocoaView;
>      }
>  }
>
> -- (void) updateUIInfo
> +- (void) doUpdateUIInfo

You may add the suffix "Locked" to align with handleEventLocked and
make the intention more explicit.

>  {
> +    /* Must be called with the iothread lock, i.e. via updateUIInfo */
>      NSSize frameSize;
>      QemuUIInfo info;
>
> @@ -554,6 +555,22 @@ QemuCocoaView *cocoaView;
>      dpy_set_ui_info(dcl.con, &info, TRUE);
>  }
>
> +- (void) updateUIInfo
> +{
> +    if (!allow_events) {
> +        /*
> +         * Don't try to tell QEMU about UI information in the application
> +         * startup phase -- we haven't yet registered dcl with the QEMU UI
> +         * layer, and also trying to take the iothread lock would deadlock.
> +         */
> +        return;
> +    }
> +
> +    with_iothread_lock(^{
> +        [self doUpdateUIInfo];
> +    });
> +}
> +
>  - (void)viewDidMoveToWindow
>  {
>      [self updateUIInfo];
> @@ -1985,8 +2002,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>
>      COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
>
> -    [cocoaView updateUIInfo];
> -
>      // The DisplaySurface will be freed as soon as this callback returns.
>      // We take a reference to the underlying pixman image here so it does
>      // not disappear from under our feet; the switchSurface method will
> @@ -1994,6 +2009,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>      pixman_image_ref(image);
>
>      dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView updateUIInfo];
>          [cocoaView switchSurface:image];
>      });
>      [pool release];
> @@ -2057,6 +2073,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>      qemu_event_init(&cbevent, false);
>      cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
>      qemu_clipboard_peer_register(&cbpeer);
> +
> +    /* Now we're set up, tell the UI layer our initial window size */
> +    dispatch_async(dispatch_get_main_queue(), ^{
> +        [cocoaView updateUIInfo];
> +    });
>  }

This is not necessary since register_displaychangelistener calls dpy_gfx_switch.

>
>  static QemuDisplay qemu_display_cocoa = {
> --
> 2.25.1
>

