Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F454A9D19
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:44:23 +0100 (CET)
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1h8-0004G1-2h
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1Ja-0001tY-Qf
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:20:02 -0500
Received: from [2a00:1450:4864:20::335] (port=43541
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1JY-0005SF-6t
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:20:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso4105412wms.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JI5j59PUEPQ8/uhST61soE34afYu8YX0+IIkO13kUBw=;
 b=h0sDrqGkH2L63yzDz+00Nj9Xz0fZ53B5mEvhyBCpkulQ95u8sBtLoMQYaJQQP+Lyzx
 i3wcnb64R4vK/HhIsfVyClBygN4IYvuNagjzzYK6NdbTG5nQbT4PJ5vPwCbuZ+ZlVd8o
 MtMvwJxT4R4NV7krvdjoRFz7UYxktgpmrEoNikxhCjiC52EGMhd995VFm6IecL2qfi24
 9WCeOd9+LTEHriERskMu9WhN0chlSTA1W4VDdpclf5vx03rVA6y/GaecK76RfgIDYNZu
 MaTzPQL912OqV1FXCNWNso6bSTmrKvl6x5k4X5cvq1qdF+yDY/Q40iijh8OEA6JmVGvk
 ik+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JI5j59PUEPQ8/uhST61soE34afYu8YX0+IIkO13kUBw=;
 b=03uvuIpcFwaIPM5OpVORfSfE2bI/CtmwDcbn0HpErRgigTUFtZECxJE4B/a9kLgnPD
 moDUEsvTO7kdMjAaXG8BrVfNIdVgxaG8bnHsVhi+UoDanK4zbRA+Bv/jPjNWNHb2XtdV
 Mhp85Nfh2mmbalXAajp51Jm9AXz8+XuQ4sxHZoB3wJcBS2+dd3433+GVbTLLDAwdO86+
 Ig9ecrgxP6ZHQzp6+OoKf8Og70W1q84cmJNqcsdXUS/87YNnUKqgX+Rs8S+q9FuMmCpd
 4+YJ3mRm/WFMvgTkZ4OUt32/ZjnMli0SELaTxv5C4nqQNKjk7X8879qb+TVY1LX/uMOd
 0Uug==
X-Gm-Message-State: AOAM532rIkBLj3FUCWsiIXooabQM49lwMLXCdJQIo38AcrB50vinlIEj
 8Ff5KTz3VgUlWaMBI8DtThsrhdKTHhrddqNPMr+zVQ==
X-Google-Smtp-Source: ABdhPJxP4R8j5GbS06KwHx1FGqc+CQxr3MKR0QAmj+tTJstln8Ax8gaF0zp8fkHi0GhR+RtOgpwtYtF5Co99UaSwTzo=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr2950056wmq.126.1643991598660; 
 Fri, 04 Feb 2022 08:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210616141910.54188-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 16:19:47 +0000
Message-ID: <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Set UI information
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 15:19, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

Hi; I was looking at the cocoa.m code to see about maybe deleting the
unnecessary autorelease pools, and I ran into some code I was a bit
unsure about that was added in this patch.

In particular I'm wondering about the interactions across threads here.

> +- (void) updateUIInfo
> +{
> +    NSSize frameSize;
> +    QemuUIInfo info;
> +
> +    if (!qemu_console_is_graphic(dcl.con)) {
> +        return;
> +    }
> +
> +    if ([self window]) {
> +        NSDictionary *description = [[[self window] screen] deviceDescription];
> +        CGDirectDisplayID display = [[description objectForKey:@"NSScreenNumber"] unsignedIntValue];
> +        NSSize screenSize = [[[self window] screen] frame].size;
> +        CGSize screenPhysicalSize = CGDisplayScreenSize(display);
> +
> +        frameSize = isFullscreen ? screenSize : [self frame].size;
> +        info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
> +        info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
> +    } else {
> +        frameSize = [self frame].size;
> +        info.width_mm = 0;
> +        info.height_mm = 0;
> +    }
> +
> +    info.xoff = 0;
> +    info.yoff = 0;
> +    info.width = frameSize.width;
> +    info.height = frameSize.height;
> +
> +    dpy_set_ui_info(dcl.con, &info);

This function makes some cocoa calls, and it also calls a QEMU
UI layer function, dpy_set_ui_info().

> +- (void)windowDidChangeScreen:(NSNotification *)notification
> +{
> +    [cocoaView updateUIInfo];

We call it from the cocoa UI thread in callbacks like this.

>  /* Called when the user clicks on a window's close button */
>  - (BOOL)windowShouldClose:(id)sender
>  {
> @@ -1936,6 +1983,8 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>
>      COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
>
> +    [cocoaView updateUIInfo];

We also call it from the QEMU thread, when the QEMU thread calls
this cocoa_switch callback function.

(1) A question for Akihiko:
Are all the cocoa calls we make in updateUIInfo safe to
make from a non-UI thread? Would it be preferable for this
call in cocoa_switch() to be moved inside the dispatch_async block?
(Moving it would mean that I wouldn't have to think about whether
any of the code in it needs to have an autorelease pool :-))

(2) A question for Gerd:
Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?
It doesn't appear to do any locking that would protect against
multiple threads calling it simultaneously.

thanks
-- PMM

