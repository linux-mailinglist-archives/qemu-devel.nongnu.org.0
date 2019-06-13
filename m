Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A940243555
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 13:01:48 +0200 (CEST)
Received: from localhost ([::1]:38458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbNUJ-0005if-9f
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 07:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40325)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbNRD-0004Yf-6R
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbNQZ-0003Qr-HB
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:57:57 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbNQZ-0003QK-Bn
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:57:55 -0400
Received: by mail-oi1-x244.google.com with SMTP id w196so14085648oie.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YF6AC/wEIymBzxv6Loh33hKF3sHDrsMBwZrzyrlodvE=;
 b=bWvufnVrbScs8aRljREI/htVZl++y1JSpt76WR0kschqUgWQvfjwoZhRdPPBxRz0aj
 sVWDNrnsnE49iQk2Tsk+KKlZjisdAnVFWy9x767qNRSScs1czkLW0LBLo0finllVw6to
 NXp88R8Bx3bhMlbki/7nmj8RB3XnE9XZxR3lBpGx4RWR2l7hlyjhlHQVNGFVVIgEdiaA
 JQMUuBp9llcfc1JraqxLyTuJrgdu69+itQccSWwpIUZJGNiQDGbRUdyS6Y0gfYMYdZPg
 iHzKRBgaDT6gVMqds2ubb1W8/3evfRHXh4nAlDpx6EmRSOhCw08mOdhJxSD/Zg85W6V9
 zXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YF6AC/wEIymBzxv6Loh33hKF3sHDrsMBwZrzyrlodvE=;
 b=R16rGZj1pPLcsW66ThBc+dmvruFc+uTsNCfh15+O8tjJzFXP59llAGmrlOYvxo4OnC
 RP82xsk+y3jafrnntUH98BWCuVqXxdC7tvI9tTEZ5nDxM6PDrcEUVhRSVFQXSU7vdbPw
 E/e4G+yHbN670Km34+dGzZHRkb6KRwvdZzqZeNI3ABP7XC6d5AkoLJXtJLGtwV/LTn9c
 PU2GDV48lRJzygqhysm4mOSJgL5lJW59FrcmqxyjzBhBmflVstRxhdvGL5IT5w6rDa7N
 4AHohYMAHgj6GbzXQrQnOYdivNcpMKYIPMTtlmGgqFspcneuv1DOgBcl3BrWBKDKIQPm
 GOyw==
X-Gm-Message-State: APjAAAUTyMK/jWnBd6dWTtvb6e7aeG+J9DWW7EI15sxYbLZ2pDPTFYJp
 5NkWE13K4P2z3F7mQULq0vBeny9lCAY7oDrq5mPetKKH9Ak=
X-Google-Smtp-Source: APXvYqwfY4vV3887Z81D38uHTWcqNKiJ31x/KOgF8Oa2nTP6ccIi1FOGPDhnRXf1RaNZ86MSOBRz+zh3wxng8yIAzxI=
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr2595336oij.98.1560423474399; 
 Thu, 13 Jun 2019 03:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <B3540B0C-9A71-4733-8109-11B0DC7A17D2@me.com>
 <CAFEAcA_=A3w490ey9_EyO7gJ1PRjs4L+aRtNPGzx-L7XyGVmZg@mail.gmail.com>
In-Reply-To: <CAFEAcA_=A3w490ey9_EyO7gJ1PRjs4L+aRtNPGzx-L7XyGVmZg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 11:57:43 +0100
Message-ID: <CAFEAcA9q-ra6-h7f4+aKVuxa_byAuQS2eJM5S6wtKoYWiHbTRw@mail.gmail.com>
To: Chen Zhang <tgfbeta@me.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 0/2] ui/cocoa: Fix input device issues on
 Mojave
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

On Wed, 12 Jun 2019 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 4 Jun 2019 at 10:34, Chen Zhang <tgfbeta@me.com> wrote:
> >
> > The following patches fixed issues of absolute and relative input devices
> > on macOS Mojave.
> >
> > Chen Zhang (2):
> >   ui/cocoa: Fix absolute input device grabbing issue on Mojave
> >   ui/cocoa: Fix mouse grabbing in fullscreen mode for relative input
> >     device
> >
> >  ui/cocoa.m | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 47 insertions(+), 3 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> I'll apply these to master some time this week.

Now applied, thanks.

-- PMM

