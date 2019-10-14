Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E703D6505
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 16:22:21 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK1Eq-0003sY-4m
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 10:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hikarupsp@gmail.com>) id 1iK1D4-0003Dz-Jj
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hikarupsp@gmail.com>) id 1iK1D3-0007gV-Hm
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:20:30 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:36791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hikarupsp@gmail.com>) id 1iK1D3-0007g3-AS
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:20:29 -0400
Received: by mail-lj1-x241.google.com with SMTP id v24so16837528ljj.3
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/oSs9bzWNDcojG3c62bX2yqN7zDbrCBfvSMeBczDsDc=;
 b=pOstV9VdBizz1jaeWPchALeLEKI8T2o7DXv4qgYVTjzb9PtaOvELMlReoSOsMrLoTl
 WKJSpYhe+k6M+vsSFhM4mYEDiuzhYgpluLhXO+KYdus21iQ1HVAcfp8PJHDsR3Zvf6yD
 Nf9D4+j+e3zaP4NnZDSvc6esrkjrLodA6t90hv/GWD/rSllO23iWs+rRbw5bSlW53jBW
 PwwL3Vd5t9W7Y0P0XIMZxJCY2Nli/f70OBvrOeH/HnRXI3ZiM9C6wVOdB3MXNOk/slOn
 24oE+hsItSeomOnRTUVvY39FX96MnoLrluZJwJP9C9+vVz4YhWgYaS/Fm6Z+Hqvo8/YA
 lowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/oSs9bzWNDcojG3c62bX2yqN7zDbrCBfvSMeBczDsDc=;
 b=Wn9Z/cZLkwR9VV8poJ25BHsf1RFbV18X4xT5yZSR9V5TyR1d9Hd94w3xEPzXJrwTdU
 sktsgTmGgXldOmlZvLQW0pQjfC2pyo/0S51ILvGethhfpsplPIF68+oNlvTFVJR1I93H
 p2l5IPrBcsBROY6uxHaW/oPxx7akOxtY+MjP6LkAwi/Hi9I/+BjNQt2fs7PW8E70yeP3
 ligiEoA+icWDixrlgOYmzdB3IhI2X+oVrXueflQIttNZtLQVCZaJGHUwqXcYQkHhwxsc
 JNJUG3c7hF5+mDr6T0INY3lhN50UNUOT+P/ctxFDp7SdHS5EifVGkgJbVMsR6HR9UVTW
 +Idg==
X-Gm-Message-State: APjAAAU1kDYhoISxoPUunn+HLZbGEID6BXxstcG7nll5SH69i39zGHpq
 YUVKEf6975m5PqKuaw/A75GciiAWgxpg2bY7VsRf7IHX
X-Google-Smtp-Source: APXvYqyPsyhA+Yikm5Yet3Oe9UZ48iR9BqwmV/xQKW4aTGtH42QhQSn7IUNCu6RP5f+xbH2nYPg2L7AhLz+/iIR4jo4=
X-Received: by 2002:a2e:286:: with SMTP id y6mr18326745lje.233.1571062827118; 
 Mon, 14 Oct 2019 07:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191014125254.74913-1-hikarupsp@gmail.com>
 <CAFEAcA-iaUraj+AZuGcXw6pNy2aBQ2J0Cm9900COsY+quJc2tA@mail.gmail.com>
 <CAD-w0GAzUvF_ckFviFa+Am2Wph2xGH2ywUAN15hunofaM2OBDw@mail.gmail.com>
 <CAFEAcA8LFC=swx8EXDRT0+PC=HJ3Qx1hVUszDyEYdKzA2aexmg@mail.gmail.com>
In-Reply-To: <CAFEAcA8LFC=swx8EXDRT0+PC=HJ3Qx1hVUszDyEYdKzA2aexmg@mail.gmail.com>
From: Hikaru Nishida <hikarupsp@gmail.com>
Date: Mon, 14 Oct 2019 23:20:15 +0900
Message-ID: <CAD-w0GC3TOgFTotH-mW-BVnq0qDoestRzT_=i-WYfdyf0M3BsQ@mail.gmail.com>
Subject: Re: [PATCH] This patch fixes hanging up Cocoa display on macOS 10.15
 (Catalina)
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I resent the patch. Thank you for your assistance!

Hikaru Nishida

2019=E5=B9=B410=E6=9C=8814=E6=97=A5(=E6=9C=88) 22:50 Peter Maydell <peter.m=
aydell@linaro.org>:
>
> On Mon, 14 Oct 2019 at 14:41, Hikaru Nishida <hikarupsp@gmail.com> wrote:
> >
> > Thank you for your reply.
> >
> > The event gets fired before applicationDidFinishLaunching is: (output
> > of  NSLog(@"event: %@", event);)
> > event: NSEvent: type=3DKitdefined loc=3D(0,1440) time=3D164310.0 flags=
=3D0x40
> > win=3D0x0 winNum=3D0 ctxt=3D0x0 subtype=3D1 data1=3D834 data2=3D0
> >
> > I moved allow_events =3D true just before
> > qemu_sem_post(&app_started_sem) and it also works.
>
> OK, great. I think we should go with that, then.
> I think a brief comment explaining the purpose of the flag
> would also be useful in the handleEvent function; something
> like this:
>
> /*
>  * Just let OSX have all events that arrive before
> applicationDidFinishLaunching.
>  * This avoids a deadlock on the iothread lock, which cocoa_display_init(=
)
>  * will not drop until after the app_started_sem is posted. (In theory
>  * there should not be any such events, but OSX Catalina now emits some.)
>  */
>
> Could you send a v2 of the patch with 'allow_events =3D true' in the
> applicationDidFinishLaunching function, and that comment
> in handleEvent please, and we'll get that into the tree?
>
> thanks
> -- PMM

