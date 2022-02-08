Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B274AE0BC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:26:58 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVCb-0006OX-9H
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHUh7-0007Qy-Hx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:54:25 -0500
Received: from [2a00:1450:4864:20::436] (port=46671
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHUh5-0000ya-G8
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:54:25 -0500
Received: by mail-wr1-x436.google.com with SMTP id q7so4025869wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tliuVXrWh+XRtE7suEnC5MkvlLbL9ZRJvcomKS73/e8=;
 b=eN+vpekfBSVNCndhqDJ8OEInQgQlRbhS/qGFFkTBrxBjLXGFDNlghKhgDhrbFvCAuv
 Lx0Xm2MxwqItFeJHjGTfuXzVAyS6OAf20dJ2AlJdQ6z8OeMXQhZ2nHyZqXxofPBpgk3n
 iEAHg8G3Tde6aA858ac3fYbqDWmvYnSeG8tDj9xREDm8aTKSFsHXSpgR+XVRZin2N2uz
 y4XMB8rJPHvHdfJFhimsvoZHNjUBcNAUGpN5Uko5LTs0fFu/wIXa0Jz7pIZANk9E7u8A
 nJinBMYkp0J+GChmHdtzknDMGrrq67zSvoXVUZWZXO1pv+8AKbPm63onIuhwWEQrnXNb
 KQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tliuVXrWh+XRtE7suEnC5MkvlLbL9ZRJvcomKS73/e8=;
 b=3irBvvHjimGYUV0Hshv49x5ItSh3aOw3szAaFAjD20z/FuBi7TtBvL4cJWgeUMZeag
 xndAALJi9EQ1QcJcbD9HroORnUaL4UBBU5SXYTaTynLu3CMohZ5pIqsj9Impm3S52MY/
 FFK+jk8MbsLwcIG15FzhDVwJG1r37k4YC54+qcMoIT+MmzuN6x8fytmgStw2GDpRW8oM
 q5EH+g7wZgHflobIx3flFd2ED953u0JkfcGF0qTPGyzkC/MIyD+vmHcvKXsKC2ADrgmw
 XZff0YQgVAw5wXnQlleHfNgPpw8+zOqckvgYH9oZGnilnBovee3L+A4xLPCtfHCOUPcd
 7/Fg==
X-Gm-Message-State: AOAM530IlE9JgVkS0QcdC1dKl0TE4s4rFmgGSt8A3iXaugFNuh2n+Xis
 F0X6HaxMUgitoAAqmtLjh8y4Qlrh+Hx4SvSpYRuI1Q==
X-Google-Smtp-Source: ABdhPJy8Cd06OS6GIXbh0euEQpv17HQfGQr/wuO1vtK4Fm+zs/U5cLZe8fNIKV0wwy8nx1U+29CFK2oOsK+aXuSDMYw=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr4600666wrb.521.1644342861616; 
 Tue, 08 Feb 2022 09:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20210616141954.54291-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210616141954.54291-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 17:54:10 +0000
Message-ID: <CAFEAcA8eJFdkO41ZLBCMxm3wHY=u0av7kW5-anHuTRgQD-b6sQ@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Add clipboard support
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Wed, 16 Jun 2021 at 15:20, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Hi Akihiko -- I have a similar question here to the other
patch about doing things not on the Cocoa UI thread...

> +static void cocoa_clipboard_notify(Notifier *notifier, void *data)
> +{
> +    QemuClipboardInfo *info = data;
> +
> +    if (info->owner == &cbpeer || info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
> +        return;
> +    }
> +
> +    if (info != cbinfo) {
> +        NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
> +        qemu_clipboard_info_unref(cbinfo);
> +        cbinfo = qemu_clipboard_info_ref(info);
> +        cbchangecount = [[NSPasteboard generalPasteboard] declareTypes:@[NSPasteboardTypeString] owner:cbowner];
> +        [pool release];

Is this OK to do on a non-Cocoa thread with an autorelease pool,
or should it be done via dispatch_async ?

> +    }
> +
> +    qemu_event_set(&cbevent);
> +}

>  /*
>   * The startup process for the OSX/Cocoa UI is complicated, because
>   * OSX insists that the UI runs on the initial main thread, and so we
> @@ -1845,6 +1937,7 @@ static void addRemovableDevicesMenuItems(void)
>      COCOA_DEBUG("Second thread: calling qemu_main()\n");
>      status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
>      COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> +    [cbowner release];
>      exit(status);
>  }
>
> @@ -1965,6 +2058,18 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
>              [cocoaView setAbsoluteEnabled:YES];
>          });
>      }
> +
> +    if (cbchangecount != [[NSPasteboard generalPasteboard] changeCount]) {
> +        qemu_clipboard_info_unref(cbinfo);
> +        cbinfo = qemu_clipboard_info_new(&cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
> +        if ([[NSPasteboard generalPasteboard] availableTypeFromArray:@[NSPasteboardTypeString]]) {
> +            cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
> +        }
> +        qemu_clipboard_update(cbinfo);
> +        cbchangecount = [[NSPasteboard generalPasteboard] changeCount];
> +        qemu_event_set(&cbevent);
> +    }
> +

This work in the cocoa_refresh() function is done not on the Cocoa
UI thread. Is it OK for it to do that, or should we put it into a
dispatch_async block ?

>      [pool release];
>  }

thanks
-- PMM

