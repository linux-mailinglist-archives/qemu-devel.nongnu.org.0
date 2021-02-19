Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC431F7D2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:02:53 +0100 (CET)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3Yi-0001Tj-QF
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3Xi-0000xz-Br
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:01:50 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3Xg-0008Gb-Lt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:01:50 -0500
Received: by mail-ej1-x633.google.com with SMTP id n13so12003687ejx.12
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wEJNNhSXOzw4Wf3rcCERc/ih5yEpHkdZAiMI2ehwOfQ=;
 b=APZc6NE9pZJSwPBhACFFtqm5lV8pSWo3cJOEq8QmKFTutD6FqD2ruAThNy96B+gl0W
 BEo9VXZ4j8C9dznQb17wlKvWVi80Xlxv+nAgTND4Pzkku48xuOwPMm+FDKgFjkFJUFq2
 CVGJyPJVKUYjszuAqB01D5ROeqYpwyaixXF7Yd8X7OMU13E7ZgGtHaOdYjueN3zoHJFd
 vEJWutkZ2c7uz8gF/yrSQv99vZbfYGlf+jmegeUi7Izg0kHLsd9YaZXD1pBJ3LmbmcX2
 d9FIYwhmsRSo3dPxIIKC55uU5NvA0XxY5KTO//h5KUjSze7aqaSWtolDoNI+Ks78VYhp
 DslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wEJNNhSXOzw4Wf3rcCERc/ih5yEpHkdZAiMI2ehwOfQ=;
 b=LOAfCkXxogBVHMwsCl5pGfAP76LH7pL3jdLtP8N2tQPsUPnUm27FzC9F0MVjcZvF3R
 61fJMYkP3WWgzzE7ToWAtAG1hDgZNNmBzy1NVwq+qqGFPtkt0U7ycLx4eNIHRri23xYc
 vnQU/l7+8c5HiOtT3G9Zg57dWt3B7LyIPGPMy16zsGaOlnaOv9exqhwtHz14kYQHd4wW
 hsszq7qNnpwGHvnK+X3FnWkg3weG5HqQUkSFTOvKzyVYQnIB7Ps2DxyeWyqDWoQJnn5D
 eZpYEEX2jgz2cYCMtfC+cIK60qqz8Jxg+9Fu6e2SensVzFPiDWzhh/XVhYpmAjFhvxhC
 QTbg==
X-Gm-Message-State: AOAM532HmyBGY1trzoKuxlThxSckwX0/OYXiFlG5Tw5sHDyvPfoGvVFG
 zYfO+tteZO0HHitx+LewMJrJYhmdB2AsJA54PL0=
X-Google-Smtp-Source: ABdhPJy6psCBlz/G4KfhETXa36FPu9MyHK4wDc90pPXZGjfrS0iAmaPmehyon6r/emE0YaM77H3LEjseuQ6OZMZuvG4=
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr8321525ejb.520.1613732506289; 
 Fri, 19 Feb 2021 03:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20210212000540.28486-1-akihiko.odaki@gmail.com>
 <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
 <CAMVc7JXvAt6neB2H1Bmp-HKachc3di8FpDWy3=vP2x-PDE+xxA@mail.gmail.com>
 <0d2beba-2a74-3a36-16d3-f1bac83dedce@eik.bme.hu>
In-Reply-To: <0d2beba-2a74-3a36-16d3-f1bac83dedce@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 19 Feb 2021 20:01:35 +0900
Message-ID: <CAMVc7JUn7gh7DkrM6Vhv0U7Qv5r-G9475vWzy9d5ML3RufvQ3A@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Remove the uses of full screen APIs
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8819=E6=97=A5(=E9=87=91) 19:24 BALATON Zoltan <balaton=
@eik.bme.hu>:
>
> On Fri, 19 Feb 2021, Akihiko Odaki wrote:
> > 2021=E5=B9=B42=E6=9C=8817=E6=97=A5(=E6=B0=B4) 22:09 Gerd Hoffmann <krax=
el@redhat.com>:
> >>
> >> On Fri, Feb 12, 2021 at 09:05:40AM +0900, Akihiko Odaki wrote:
> >>> The detections of full screen APIs were wrong. A detection is coded a=
s:
> >>> [NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
> >>> but it should be:
> >>> [NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOp=
tions:)]
> >>>
> >>> The uses of full screen APIs were also incorrect, and if you fix the
> >>> detections, the full screen view stretches the video, changing the
> >>> aspect ratio, even if zooming is disabled.
> >>>
> >>> Remove the code as it does nothing good.
> >>
> >> So, it's broken right now (and probably for quite a while without anyo=
ne
> >> complaining).  And the attempt to fix it didn't work out very well.
> >> Correct?
> >
> > Because the detections of APIs are wrong, the code using those APIs
> > were never executed and nobody realized it was broken.
>
> Full screen on MacOS X worked when I've last tried but that was 2 years
> ago.
>
> > I did not seriously attempt to fix it because the APIs are no longer
> > the best ways to implement fullscreen. ([NSWindow -toggleFullScreen:]
> > is more favorable today.) There is not much to reuse even if
> > implementing fullscreen with [NSView -enterFullScreenModeWithOptions:]
> > since the code is so small.
>
> I think there are people using QEMU to run old MacOS versions on MacOS
> X/macOS and may not follow this mailing list but I'm sure they'll complai=
n
> once you break it.

It was not clear what "full screen APIs" refer to in my patch. Today
macOS have three different methods to enter fullscreen:
- [NSWindow -toggleFullscreen:] (the latest one)
- [NSView -enterFullScreenModeWithOptions:]
- Make a borderless window whose frame matches with the screen

ui/cocoa checks if [NSView -enterFullScreenModeWithOptions:] exists
and uses it in this case. Otherwise, it chooses the last method.
However, the detection of [NSView -enterFullScreenModeWithOptions:]
was broken and I fixed it to find the use of [NSView
-enterFullScreenModeWithOptions:] was wrong. This patch deletes
references to [NSView -enterFullScreenModeWithOptions:] but the code
implementing the last method is still intact and properly functions.

Akihiko Odaki

>
> Regards,
> BALATON Zoltan
>
> >> Just dropping the code makes sense to me then.
> >>
> >> Any objections or better suggestions from the macos camp?
> >> If not I'll go queue it for the next UI pull request in a day or two.
> >>
> >> thanks,
> >>   Gerd
> >>
> >
> > Thank you for responding to my patches.
> >
> > Akihiko Odaki
> >
> >

