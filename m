Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E8123E53
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 05:16:31 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihQlC-00044B-En
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 23:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1ihQjD-0002er-U3
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 23:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1ihQjC-0006Xe-OQ
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 23:14:27 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1ihQjC-0006WO-CZ; Tue, 17 Dec 2019 23:14:26 -0500
Received: by mail-lf1-x141.google.com with SMTP id n25so642654lfl.0;
 Tue, 17 Dec 2019 20:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqJcASg9fWaiY51VT0yBYeRUW0LCqDwhoxU/57LYi1o=;
 b=pnvPTOs4gOnztIMN0fnJF90cWRS0Th7ouPshuUe/KKtG/pNJUIW97L7nJW8sq6UJW5
 kFxSaRDrmTRhPYpgYYpezy8SoYosnvY0udgAHAuqp/pOwL2upagPqAhR7RCKfuP/1CDp
 hG+KLus61eWTSZu4MZVYqNf5qHs3OJNUh9p6JkxPnncSmF6NbZWX3vy31iiU4+R7nix6
 Lf0pS67oBxxG37Tf6m65TtbAKfdRJG3LYKYaCwODJzIIY/nRWnoG5///SveSdpvYFaXL
 jLVW9uxhqhC7OAw5M6yU581kDP6OCDnXerW8BejpNPdY7SMqvtT3n2O47gmi5dEUhHmS
 3N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqJcASg9fWaiY51VT0yBYeRUW0LCqDwhoxU/57LYi1o=;
 b=S3mFHaH5NQtjk0q6YeRF+tBiTT6ZDOa5NNuU0613q8hWR1mwH7qFIkI9+sor52SJ6B
 0bLmBlj9niTW3fWIbk/A78Yk37ddWk/EB+LHhoNB8FC3e3rz0adwbg/qZGxY4ViX9Pwq
 6aBRL8rcuKRX7MJ/D5zhJL4CVrxW7GEF0rpB7IsqnY2bFT3FvMlkzGJzErSo6uVysKjn
 yIq/RUq5lU/hCEXUhAjiJO6XE7HmTBOUSsDFM3gDanXIW3malcFy6KRxI7Aic0eymYtu
 +pdEa//aXpTI95yu36iIkcPV5ZX8MEzh49kj+mSyRSz50CHwiE/eAPsorRrNf80ZuzTd
 mDdg==
X-Gm-Message-State: APjAAAUgzgCF3cwrkyCM4XMTsnKqBdVTyE+D5UCpyg49QVDrjL5TJ4KN
 IeyYONs/w3e47FJ026pcKMI4fxibEyni7j0szjI=
X-Google-Smtp-Source: APXvYqy39MP/1DtLP0ie8Kmtm+bKwmGNIjOIuqz9KXHXCcaMVOTo/ggQQvrgJVvFOAsM3Kysro/o8Hp/zVyRQikCEo4=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr284247lfi.93.1576642464995;
 Tue, 17 Dec 2019 20:14:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576227325.git.alistair@alistair23.me>
 <40f97ae32a6f21d8184c1cc46fad2defb302238d.1576227325.git.alistair@alistair23.me>
 <CAFEAcA8rZtJQsUXJ1E1gOAXzrHihzYvMoodgHhpro1Jd7jkVUg@mail.gmail.com>
In-Reply-To: <CAFEAcA8rZtJQsUXJ1E1gOAXzrHihzYvMoodgHhpro1Jd7jkVUg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Dec 2019 20:13:55 -0800
Message-ID: <CAKmqyKOb05HRUGw=h76dM_X9Ke1WT24kJn6Mh0XuRJFYkQ1aQA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] hw/arm: Add the Netduino Plus 2
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 17, 2019 at 8:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 14 Dec 2019 at 02:44, Alistair Francis <alistair@alistair23.me> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  MAINTAINERS            |  6 +++++
> >  hw/arm/Kconfig         |  3 +++
> >  hw/arm/Makefile.objs   |  1 +
> >  hw/arm/netduinoplus2.c | 52 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 62 insertions(+)
> >  create mode 100644 hw/arm/netduinoplus2.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 7bfdc3a7ac..881e7f56e7 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -105,6 +105,9 @@ config NETDUINOPLUS2
> >      bool
> >      select STM32F405_SOC
> >
> > +config NETDUINOPLUS2
> > +    bool
> > +
> >  config NSERIES
> >      bool
> >      select OMAP
>
> Something odd has happened here -- your patch 1/4 already
> had a stanza:
>
> +config NETDUINOPLUS2
> +    bool
> +    select STM32F405_SOC
>
> so either that should be in this patch or this fragment here
> should just be deleted.

Good catch.

It kind of makes sense to have that fragment in this patch, but then I
don't see a nice way to build the flies as they are added, so I
removed the fragment from this patch.

>
> Assuming you sort that out,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks Peter

Alistair

>
> thanks
> -- PMM

