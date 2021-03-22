Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD85344CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:08:31 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOO2X-0008Ch-Qf
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONyX-0005pr-GE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:04:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONyV-0002IW-4J
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:04:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id kt15so13004756ejb.12
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9IavfMLeGn37Yh+3AXwuPPH/VJBYPqFOHmaDbpDBFJI=;
 b=zQdPgmNe7RJjgoKi9rNW3O/8YE7FeLD1nBeQ2KbH/LN+Ao0pdDOXEYO6buVargBmAr
 x7pv7JObeFMF19/c0Nykf9af8a4gh52EB9M7C6OeDZbGrWPJUhPNMwB10On7dFNI3pcP
 WVQkNgKpU1zVm2y1qA7AqQ+0IeeUuEDyB3tQuQPNyEeO910WDHhgVFuvlsdErqfzIi2R
 9AWkYHwE5pPXydzW7FVJP0L1AOjnLRJkya9b6uJ97pWH/S94l+a4IjGDYDj0VUZ/XnVk
 QFbx2fvdx2hgVDpb1R4bdwuI+mvVw5rdOpSVTNlwbdhyRtwuBMG+ppZwQPq0Y25cRg0S
 O3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IavfMLeGn37Yh+3AXwuPPH/VJBYPqFOHmaDbpDBFJI=;
 b=dJjNDfZ4SmQPelg8ryPobkL/2A3YV1qvuzWYsXs2XplV0aNun569FVc32yxD+MOlUl
 5G6S5l/kB1z3+Mmrd5aMok75+vVLL0ztnbwIoFLL64Cs3RmPoSf+eW4+cnGkFHLfwnQZ
 PPUopjCP8C78eUov78HiEtcmMrz8zptToKlQ3FeorgEtzwGeHzcufioEFK5AnIo9xzWT
 5i14+shiPpgn5ZscWZNuKER3LAUvPrLWXdUNNYYYh/D2g/uDGWWYyK58u7gQuUYs1UAp
 W29OEvnMmRByNjOQU/NHzI96Fj9TTq3dFuf0Ol9Jgz9ijaRAr5PjB5ziX3P24EVAna4g
 9m9g==
X-Gm-Message-State: AOAM5317qP6rOnCu9ghPo5/XMkHgRhLXfQFzVIvFpq7WwTBelsfsZYNP
 30xA4+UG//Dq8Zshc7C9KsukmrzsfSC4mRbB4qFUDQ==
X-Google-Smtp-Source: ABdhPJyAUaUte3IZBUPfPV78uG2o2iHRJTruqi79KzmeUq+BPwFLJpN90dPjy3pPCJwfS4Gn0/7skvsS/0wy1U9GM2Y=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr744324ejc.407.1616432657664; 
 Mon, 22 Mar 2021 10:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
 <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
 <X/pG4MVxih424H+a@SPB-NB-133.local>
In-Reply-To: <X/pG4MVxih424H+a@SPB-NB-133.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 17:03:49 +0000
Message-ID: <CAFEAcA9eH3xgHCYqpibxOK3EWmwkzLCfksN=m5x9bkwjRPkYgw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Jan 2021 at 00:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> Now if we apply the workaround mentioned in the article [1] that
> switches focus to Dock and then back to the app we can resolve the issue
> in QEMU:
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index f32adc3074..0986891ca0 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1114,6 +1114,15 @@ QemuCocoaView *cocoaView;
>      allow_events = true;
>      /* Tell cocoa_display_init to proceed */
>      qemu_sem_post(&app_started_sem);
> +
> +    /* Workaround unresponsive menu bar in macOS prior to Big Sur */
> +    NSArray *docks = [NSRunningApplication runningApplicationsWithBundleIdentifier: @"com.apple.dock"];
> +    if ([docks.firstObject activateWithOptions: NSApplicationActivateAllWindows]) {
> +        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200 * NSEC_PER_MSEC),
> +                       dispatch_get_main_queue(), ^{
> +            [NSApp activateIgnoringOtherApps:YES];
> +        });
> +    }
>  }
>
>  - (void)applicationWillTerminate:(NSNotification *)aNotification
>
> Peter, does it help you? And what version of macOS do you use?

I got round to having another look at this this afternoon.
(I'm using Catalina.) The workaround above does work for me,
though it seems like a pretty nasty one.

I tried the various reshufflings of the code suggested in various bugs,
stack-overflow questions, etc, about where we should call setActivationPolicy,
create menus, call activateIgnoringOtherApps, etc, but they didn't help.

thanks
-- PMM

