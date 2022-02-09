Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFEE4AF009
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:39:17 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlJc-0006UV-2X
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:39:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHl8f-0007Uq-MV
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:27:57 -0500
Received: from [2607:f8b0:4864:20::32e] (port=36694
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHl8d-0005YR-UJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:27:57 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so1278866oth.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtrmM6VnREyfJQ7O7yCnQuj/vSxcVmQu8j14mYCHa6w=;
 b=LyhUVlyo9UDdylFaH10HE4t134Ak1XbDLwSkxo/nQDrHftpISerL6KoibFtnEHukCM
 5o7/UxUGkw+sX77uUYiCrRqHSovBOX1eC66fK4GTNwYn9foIyeNZPVWt/rQUqSg0CTGe
 ZxSh6R039SQ95Nr4uFE8A47LNxEaDrXFWjHRf+r5XAN6R8EhiC8xylvgs7QX8GxK0rgH
 2nLFf9z6Alxb0YqRraYoKKBOlP/eBG9L6+XojlfTzSgVQZjM7RrEMXzSiXcHyhyU+I6h
 qFA4dwntif48HofypoN0e0/JCUWAbVKvTDGIBm71iEa1RQqbsQYCHNblyb7/QYDVzuHg
 Wx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtrmM6VnREyfJQ7O7yCnQuj/vSxcVmQu8j14mYCHa6w=;
 b=UaRVLoKdWoljGBjkxXFgetflRNcD838qi9uxE34Hq+PR+RZdvf63w8ZuakOKGDG/os
 Ox5rPbGgIVukPeRHo0PT1gwRMolDSQhHmaBz5r2mRAJKA9ONyKpKJdHoTMi839ktVYOt
 qj7lpGd5VGUy8H6eWJmgI/jE7T+aSUjFArPI8DaaUrBbYAl1jSBw1Nd4Us6ll4dgEEeo
 q8v3kdtyZygCljhzETaTRM5l5prGyfVAmqE8LKQpCo7uUAK5hubVepVfzX8Dj82UFZP/
 kuWzIEX9G8hBvxE2icVc0EHwdy9R9Dt4UJ1G5l2DCtMKET9gH4DM97VvTBQFLQilI36y
 Uf4Q==
X-Gm-Message-State: AOAM533yZbSOUydYa0/Qk8y08oDQGiuiSFHiDsObOPjk/e7ATQEDbmds
 PnoqvHEp5W5HhvSBwIYw2qhKXXzy5Jf7DHtpI6w=
X-Google-Smtp-Source: ABdhPJx12F/nknKVytqpVp4iEafFXTBZkcttJ3iW+cb/xON6ZbXvUpMxifW3Q6w80ggCw2k+NFLOHs4zY+shS36tCgk=
X-Received: by 2002:a05:6830:22cd:: with SMTP id
 q13mr679458otc.186.1644406073367; 
 Wed, 09 Feb 2022 03:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20210616141954.54291-1-akihiko.odaki@gmail.com>
 <CAFEAcA8eJFdkO41ZLBCMxm3wHY=u0av7kW5-anHuTRgQD-b6sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8eJFdkO41ZLBCMxm3wHY=u0av7kW5-anHuTRgQD-b6sQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 9 Feb 2022 20:27:42 +0900
Message-ID: <CAMVc7JURSAWVL+iitywBzpHoESzYG_E_o1RjhfCKCC0eQrL5yw@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Add clipboard support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32e.google.com
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

On Wed, Feb 9, 2022 at 2:54 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Jun 2021 at 15:20, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Hi Akihiko -- I have a similar question here to the other
> patch about doing things not on the Cocoa UI thread...
>
> > +static void cocoa_clipboard_notify(Notifier *notifier, void *data)
> > +{
> > +    QemuClipboardInfo *info = data;
> > +
> > +    if (info->owner == &cbpeer || info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
> > +        return;
> > +    }
> > +
> > +    if (info != cbinfo) {
> > +        NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
> > +        qemu_clipboard_info_unref(cbinfo);
> > +        cbinfo = qemu_clipboard_info_ref(info);
> > +        cbchangecount = [[NSPasteboard generalPasteboard] declareTypes:@[NSPasteboardTypeString] owner:cbowner];
> > +        [pool release];
>
> Is this OK to do on a non-Cocoa thread with an autorelease pool,
> or should it be done via dispatch_async ?
>
> > +    }
> > +
> > +    qemu_event_set(&cbevent);
> > +}
>
> >  /*
> >   * The startup process for the OSX/Cocoa UI is complicated, because
> >   * OSX insists that the UI runs on the initial main thread, and so we
> > @@ -1845,6 +1937,7 @@ static void addRemovableDevicesMenuItems(void)
> >      COCOA_DEBUG("Second thread: calling qemu_main()\n");
> >      status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
> >      COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> > +    [cbowner release];
> >      exit(status);
> >  }
> >
> > @@ -1965,6 +2058,18 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
> >              [cocoaView setAbsoluteEnabled:YES];
> >          });
> >      }
> > +
> > +    if (cbchangecount != [[NSPasteboard generalPasteboard] changeCount]) {
> > +        qemu_clipboard_info_unref(cbinfo);
> > +        cbinfo = qemu_clipboard_info_new(&cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
> > +        if ([[NSPasteboard generalPasteboard] availableTypeFromArray:@[NSPasteboardTypeString]]) {
> > +            cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
> > +        }
> > +        qemu_clipboard_update(cbinfo);
> > +        cbchangecount = [[NSPasteboard generalPasteboard] changeCount];
> > +        qemu_event_set(&cbevent);
> > +    }
> > +
>
> This work in the cocoa_refresh() function is done not on the Cocoa
> UI thread. Is it OK for it to do that, or should we put it into a
> dispatch_async block ?
>
> >      [pool release];
> >  }
>
> thanks
> -- PMM

It should be fine since it doesn't touch NSView. The following
documentation is the latest one which I have found so far:
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html#//apple_ref/doc/uid/10000057i-CH12-SW1

It is unfortunate that Apple no longer updates it. They should at
least note about the main thread requirement in the documentation of
NSView.

Regards,
Akihiko Odaki

