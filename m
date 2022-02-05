Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB954AA5B3
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:24:37 +0100 (CET)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAkd-0006kJ-M3
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:24:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nGAZm-0006Vs-Vm
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 21:13:24 -0500
Received: from [2607:f8b0:4864:20::c36] (port=46870
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nGAZk-00077n-P4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 21:13:22 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so6731142ooo.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 18:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zy9vqbNVdQ4qjq4p6ZQPmLBiMrXiiWUEkVPQuLOx+iM=;
 b=SD78DVTQM+qjteiexhkyLXkrku49+gAN0tOyPL2tYJ2/gAyQAcY3pCkWBkh+AW5ADO
 PgLSPBcGtyo6uQ9ZPf9M7EHnO964xFfiTgf5SFODzBqAH8N0zgcOJDUEY8n+CqPYYEEl
 bIpmlgCf/OTm8F6o2slpFb8dLql+QL1WAwtgAtXfgHp9qFA/KIu2AanP8fUEPQ4Qy5pD
 lDkoGzOOzYWVs50jGLzn+DJq+zy6BUaDqtFaFBnfRVBJZMNKr2LHxa6Wk1135mRmMZ76
 ei1y6EAQ3T2LOn/Rhf1iSscOt3JvxtP5LddZoEA3dE+BxIpyqLbgJOEuTKHvOug4iiDK
 pAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zy9vqbNVdQ4qjq4p6ZQPmLBiMrXiiWUEkVPQuLOx+iM=;
 b=Kcgf8uxb/aceI4XAIkS24U3LoPTCPwkNMrJj/Cf5lvgT/eKE8pY9sCJaUa0474kJPh
 Rjvamidg/9tAMNagizPrZBK4O0heCYCrcM3+a6MwTMzP7jnGkMCdt9WmKgcqN4hVSr2T
 8nophPVeNA6UOrraqFVQxearztzEExV1tVJsC4qXt0ivUiHw9++Tnowtbg/vVaxlwl0B
 PHDDq40JC2FpHQaaQ9EvdPim6c9ga74ACt+HVoR8rpjbaVG6K6rHa+7fhvpjUSiX8z+y
 8vFU2KCHlfFdtWgDTuaXeq3vPk7FAPfXkiGSH64Nb4mr3HRSD8qUYmtMrpqp3XVXSXDC
 qQ6A==
X-Gm-Message-State: AOAM533oVBf+bXjy7IrA8bSoHzZOldY+Wm/D7Ai+2D1vsa58AbhiN21W
 KMUd+iU+Xb4wvTUepiCUqVF8J9OhQyuJlEy+ODrr3HqgDmlxtw==
X-Google-Smtp-Source: ABdhPJzs8i2UcfnLfS9FBFe11/ljZYxHNPPrUkZHzTEpOB/SFv7NF31Tc1baI7MbQOPP7dOJRZ2kS0J4x9PZRjyGWNg=
X-Received: by 2002:a05:6870:a703:: with SMTP id
 g3mr444938oam.193.1644026783549; 
 Fri, 04 Feb 2022 18:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
 <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
In-Reply-To: <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 5 Feb 2022 11:06:12 +0900
Message-ID: <CAMVc7JXBn1uMkx=hj-DQo-TE777xrCZ98R8YxK+F5niUD6=nQA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Set UI information
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 5, 2022 at 1:19 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Jun 2021 at 15:19, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> >  ui/cocoa.m | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
>
> Hi; I was looking at the cocoa.m code to see about maybe deleting the
> unnecessary autorelease pools, and I ran into some code I was a bit
> unsure about that was added in this patch.
>
> In particular I'm wondering about the interactions across threads here.
>
> > +- (void) updateUIInfo
> > +{
> > +    NSSize frameSize;
> > +    QemuUIInfo info;
> > +
> > +    if (!qemu_console_is_graphic(dcl.con)) {
> > +        return;
> > +    }
> > +
> > +    if ([self window]) {
> > +        NSDictionary *description = [[[self window] screen] deviceDescription];
> > +        CGDirectDisplayID display = [[description objectForKey:@"NSScreenNumber"] unsignedIntValue];
> > +        NSSize screenSize = [[[self window] screen] frame].size;
> > +        CGSize screenPhysicalSize = CGDisplayScreenSize(display);
> > +
> > +        frameSize = isFullscreen ? screenSize : [self frame].size;
> > +        info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
> > +        info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
> > +    } else {
> > +        frameSize = [self frame].size;
> > +        info.width_mm = 0;
> > +        info.height_mm = 0;
> > +    }
> > +
> > +    info.xoff = 0;
> > +    info.yoff = 0;
> > +    info.width = frameSize.width;
> > +    info.height = frameSize.height;
> > +
> > +    dpy_set_ui_info(dcl.con, &info);
>
> This function makes some cocoa calls, and it also calls a QEMU
> UI layer function, dpy_set_ui_info().
>
> > +- (void)windowDidChangeScreen:(NSNotification *)notification
> > +{
> > +    [cocoaView updateUIInfo];
>
> We call it from the cocoa UI thread in callbacks like this.
>
> >  /* Called when the user clicks on a window's close button */
> >  - (BOOL)windowShouldClose:(id)sender
> >  {
> > @@ -1936,6 +1983,8 @@ static void cocoa_switch(DisplayChangeListener *dcl,
> >
> >      COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
> >
> > +    [cocoaView updateUIInfo];
>
> We also call it from the QEMU thread, when the QEMU thread calls
> this cocoa_switch callback function.
>
> (1) A question for Akihiko:
> Are all the cocoa calls we make in updateUIInfo safe to
> make from a non-UI thread? Would it be preferable for this
> call in cocoa_switch() to be moved inside the dispatch_async block?
> (Moving it would mean that I wouldn't have to think about whether
> any of the code in it needs to have an autorelease pool :-))

It is not safe. Apparently I totally forgot about threads when I wrote this.

It should be moved in the dispatch_async block as you suggest. Should
I write a patch, or will you write one before you delete autorelease
pools?

Regards,
Akihiko Odaki

>
> (2) A question for Gerd:
> Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?
> It doesn't appear to do any locking that would protect against
> multiple threads calling it simultaneously.
>
> thanks
> -- PMM

