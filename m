Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5D4D04F4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:08:45 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGqi-0006a6-GD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGm6-0000hG-Lu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:03:58 -0500
Received: from [2607:f8b0:4864:20::32b] (port=44812
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGm3-0002DU-7e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:03:57 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so3346986otq.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKMsJi3MT02EqsZUuL2oDUrYY8wxQi4QJjYOIzYiQRk=;
 b=pwtGdUuGD/KfCgO1pqjgzcfnGDRhVd7eqs5WbZndFmZJ7a+SC917qmPZvMSVX1bsxs
 48BBmCsSDQD3xW2YmgRWGp7EmETahGU59IECJcrbXqQwYFblMJZp8O0o8jIlxYsaLdHh
 kML1K//Hvm6KHAxXcEPdnpQOV+1hNdJVgQO8BtjHufje5z3NCJnMtOQTiFKJGY2cM8DL
 F24g1x/xERIX61mG19W+5fb9px1uapsSkths6HhIjnVJJKFtRM8vp4GAbaXI80OIfHPQ
 mqiVjR640ji+aKkrK24j2eTid0ZiY0uG4FEOw9PUjKlN3xlIzv7GM83XJi7erNY7ffE7
 yP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKMsJi3MT02EqsZUuL2oDUrYY8wxQi4QJjYOIzYiQRk=;
 b=cdfVbuyOGKe9ik6aA8Tqnxs24UC0JHPquqwr6aCTeTIBGypLQeC+Dx4r5FwC5whtrv
 hviFYPNGrL0SJ8B1mgZr98FXXgjASmi+mtK+fL6KJELYP3CB1sXifooaK2DuEnSAzB6O
 DLK1pf/TFfK3tTBAFG76BzUogwBshzPVmzWm1u9s2MStGcnL7sClWSVQu6gTKJPZ2t9M
 7JuugltXv04UlbR72te19AbdYrci33fHoM/diHs/MlrfKVcKBb4xU6JOq5Jd79kaA5i0
 LIDW9MuS292oz5sMIYTWAZK6aa3auL/hVBupjWTyY1h22XEXU2FnBCOQvZdSedrgNu0K
 1/Rw==
X-Gm-Message-State: AOAM531z49TE4Rwd7wGvK1k3/aCiuvgFFB7CqvKZ4oOWYG1HM7fKP9lo
 XijnCNKuj5+R/btLkkVBKNgRFCMv5QSeB8oDWq8=
X-Google-Smtp-Source: ABdhPJyRpUctI/HFLz2fZCDoWp0OlmLHYCCI2YScDQGuLIgmMDYYPKfQ8gr6mwxbojVgTqhBwD5ra4rOGPAi6K1DUME=
X-Received: by 2002:a9d:6a44:0:b0:5af:1886:86ec with SMTP id
 h4-20020a9d6a44000000b005af188686ecmr6326940otn.333.1646672633365; Mon, 07
 Mar 2022 09:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <f306bf54-e1bf-8ad6-a041-b6793bcf085f@redhat.com>
In-Reply-To: <f306bf54-e1bf-8ad6-a041-b6793bcf085f@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 8 Mar 2022 02:03:42 +0900
Message-ID: <CAMVc7JUkHeMy1oSKq4NE_dHR5QuUwzN5aTCSTMxJthR2rGNYJA@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 1:39 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/7/22 16:34, Akihiko Odaki wrote:
> > Thanks for this interesting suggestion. However I don't think this
> > improves the situation much. The main contribution of this change is
> > that elimination of display_init_sem but it is still necessary for
> > command line usage of the executable.
> >
> > display_init_sem is kind of overloaded has two roles. One is to tell
> > that the QEMU is ready to initialize the display. The other is to tell
> > if it is going to initialize the display, which would not happen when it
> > is used entirely in the command line. The former role can be eliminated
> > by waiting for qemu_init, but the latter cannot be.
>
> This is easy to account for.  On top of this patch:
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 44d8ea7a39..3903fa4b9b 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -96,6 +96,7 @@ static DisplayChangeListener dcl = {
>   static int last_buttons;
>   static int cursor_hide = 1;
>   static bool full_screen;
> +static bool have_cocoa_ui;
>
>   static bool stretch_video;
>   static NSTextField *pauseLabel;
> @@ -1899,6 +1900,11 @@ int main (int argc, char **argv) {
>
>       /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
>       qemu_init(argc, argv);
> +    if (!have_cocoa_ui) {
> +         qemu_main_loop();
> +         qemu_cleanup();
> +         return 0;
> +    }
>
>       NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
>
> @@ -2021,6 +2027,7 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
>   static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>   {
>       COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
> +    have_cocoa_ui = 1;
>       if (opts->has_full_screen && opts->full_screen) {
>           full_screen = 1;
>       }
>
> Paolo

This would allow to have gtk and sdl2 in the same binary.

Regards,
Akihiko Odaki

