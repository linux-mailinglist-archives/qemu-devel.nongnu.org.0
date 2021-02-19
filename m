Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0031F6A7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:40:39 +0100 (CET)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2H8-0007ji-MC
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2FV-0006VM-HK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:38:59 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2FT-0004dv-Fq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:38:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hs11so11601900ejc.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aEPbEvft6xXr4m6JTrl/ei9DivA9iX50k2wzTuRzQok=;
 b=XWZvJ8cgHDWYUxtYOAABxkUyXkL9rJwczkLLMU+vZtCmUnOM7dYbKR6NfD83YtUxGX
 4lcQpI8zP3CribFmLBalYpydMl9ixmAPG1nkI15r9i28+cpks4MAnfS4coNo8PXkj+Zc
 1mCvZvGSsSqN529cPRdSdHiS7f8y9d13oEB7fMMZULKTrABbRfQIx6KPIsxNDuA5kdF/
 RW+q6igINE6ePrn4lw7zq+J1+jkDoBEdvk4jwhOjNebaanN++/YdNQa8aoIBOOz3DX1P
 Sd0fy544qMQgI8nCjfwZBb6uLzomiABLb6TowkdCa0fEAkEIGje/ehku+mnydYQwVSK4
 65rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aEPbEvft6xXr4m6JTrl/ei9DivA9iX50k2wzTuRzQok=;
 b=Uu/iViSgaSUWwF248rOJGq7AQCAb7A9xClKrw0p29b9okgAuNRmLlrW2ut4rzwTPX4
 qnLIDiVOEnmoHx4Lo47GnRt5EpRec3h3tr7nMUPy39MJGzfeRDpoGwr2I3CHhRWnxQNA
 DmQ3m7dfTYADOF+2TecS1XneO5WcjDJQb6Tcck4QzhXHf0AlhRsDPncG1r/AqXQWER2c
 /UFiISWBnFUSFhT/AC67TgEVDWkToTwN8kbFZi/JcZJdlPRP/+Ufu70zdTFWunHJfn4d
 5HhEmjzbPuQx0MDGrWt753uFqgngfB+KZuVCT7yXNCzUcIswLO1LZnUhZBXpWxs7WRyJ
 IC5g==
X-Gm-Message-State: AOAM530OINUAiOI8yMVhKoSei14P6xShMkLlm/m6luCwckZ92btL9YIp
 hJrwWnFI7f2bOcPHfGPJYaKv3DQftQea4kVZgGs=
X-Google-Smtp-Source: ABdhPJw7JDFv24Uwu71OHVDVWLKcQEX8EwLD9wjOAuU8YxohdS29b3JI+GzEm+On880hUMD1c7GPa2Kwomo0SLDymN0=
X-Received: by 2002:a17:906:31c1:: with SMTP id
 f1mr7866031ejf.263.1613727533026; 
 Fri, 19 Feb 2021 01:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20210212000540.28486-1-akihiko.odaki@gmail.com>
 <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
In-Reply-To: <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 19 Feb 2021 18:38:42 +0900
Message-ID: <CAMVc7JXvAt6neB2H1Bmp-HKachc3di8FpDWy3=vP2x-PDE+xxA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Remove the uses of full screen APIs
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8817=E6=97=A5(=E6=B0=B4) 22:09 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Fri, Feb 12, 2021 at 09:05:40AM +0900, Akihiko Odaki wrote:
> > The detections of full screen APIs were wrong. A detection is coded as:
> > [NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
> > but it should be:
> > [NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOpti=
ons:)]
> >
> > The uses of full screen APIs were also incorrect, and if you fix the
> > detections, the full screen view stretches the video, changing the
> > aspect ratio, even if zooming is disabled.
> >
> > Remove the code as it does nothing good.
>
> So, it's broken right now (and probably for quite a while without anyone
> complaining).  And the attempt to fix it didn't work out very well.
> Correct?

Because the detections of APIs are wrong, the code using those APIs
were never executed and nobody realized it was broken.

I did not seriously attempt to fix it because the APIs are no longer
the best ways to implement fullscreen. ([NSWindow -toggleFullScreen:]
is more favorable today.) There is not much to reuse even if
implementing fullscreen with [NSView -enterFullScreenModeWithOptions:]
since the code is so small.

>
> Just dropping the code makes sense to me then.
>
> Any objections or better suggestions from the macos camp?
> If not I'll go queue it for the next UI pull request in a day or two.
>
> thanks,
>   Gerd
>

Thank you for responding to my patches.

Akihiko Odaki

