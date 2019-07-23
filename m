Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7997184C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 14:32:18 +0200 (CEST)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hptxp-0005TS-8f
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 08:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hptxZ-00051z-AC
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hptxY-0003lG-CB
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:32:01 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42264)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hptxY-0003kt-6e
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:32:00 -0400
Received: by mail-ot1-x333.google.com with SMTP id l15so43816372otn.9
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+hVIsywVHcXRy/zryTkqRU+DcXCSqGNH4wADdlwhEP4=;
 b=rIPjaJvvxFiqJ/QNZlgQCQPRzzsCHer2rtH6AJNoVywRNBXUxpaFkhzJugVgmVrFX4
 dTwByhJLaGimPqFRcDWwbQZfJZZmoyZtH2zMwXLv4W76VXx/XnKQPamVqDnCBjY2UMSt
 pm5C0RCJuNXHXtUYd00z0AXojOTsxkR1/DS34BFe7ayhZEpkHh+/QGo17cQM5trGzoIg
 bQnDQGWX4DtzamzHlAwF3KvrHcHC84+3Sw0/AKk8Jdv6GST0flbRgv1XP8TqoRnQpNWu
 WutXJmA+LiB8mjjv28VzuCKjMb4ufQ8jtHMFUT/jysZdz6awxawbmbwSTB27FMzU4iHk
 49mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+hVIsywVHcXRy/zryTkqRU+DcXCSqGNH4wADdlwhEP4=;
 b=uj/gCBDo3u7YaoJJDmRK3OqGIFDrboe3D5E10T2znFF7R7c/kawzPx0RJh12uu2LDx
 QWvNDmf79NGqujlx7CwiHQHfOH7ZJzjcUlli0ztandOOF6n1GC/99Uuu2ABN9qkmcM0R
 hiUDvOKz0pvhyXKohOlIDzmAPamDYkrRAZRppSaherXcsIzLpRGBX0SCHgnGq2RqU00H
 smSXrlPI7ZfCXsFSnHCrfBtKcJDecZMnsva6obcKlEKJnLecGGOSlbICJp8MKtOKMhAU
 cMnuLLzUl2/31haoCiOaekD7wB+MXbL+bh0vXJXdYkPWyEgZoTrwn0XbJ9Spwc3/JFtX
 y0Hg==
X-Gm-Message-State: APjAAAVZ3rVJH3zW+wN5Y1l/k7koOnJiXUgMbMpIpl7OuhVC5R258p71
 mXvbroFAa1fx/yZHVbGDuamzZpueIUJ/FafQ6WRuCg==
X-Google-Smtp-Source: APXvYqx+Sq9D5ZIyzAmtTszcOmXKnJ+LFDh30vXAIyJpemQIQaL52li4Z+OBhp8qOPYr3PiQk/+KinmLJHYatIUacnc=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr52795805otj.97.1563885119460; 
 Tue, 23 Jul 2019 05:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190723103612.5600-1-alex.bennee@linaro.org>
 <CAFEAcA_P_Bk0bNGCW+TwhQGCeqM-XZd3OudKZ4tu0fNThFH5ww@mail.gmail.com>
 <87imrt0y9a.fsf@linaro.org> <451b91c6-3a4d-afb4-30f1-595fcc7e5f65@redhat.com>
In-Reply-To: <451b91c6-3a4d-afb4-30f1-595fcc7e5f65@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jul 2019 13:31:48 +0100
Message-ID: <CAFEAcA_O4kegKUsSfzQhBp_AnV_uD1S=F4pm0V0nG6XQ2Dyseg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-devel] [PULL for 4.1-rc2 00/23] testing updates (green
 CI!)
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jul 2019 at 13:16, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/23/19 1:46 PM, Alex Benn=C3=A9e wrote:
> >> I see Thomas Huth has a patch on-list for that, but this
> >> didn't manifest as a problem before this pullreq.
> >
> > OK, I'll add it and rebuild the PR.
>
> But Thomas got another error later...

If we're not sure what all the needed fixes are we
should probably just drop the change that starts
running the iotests under 'make check'. Otherwise this
pullreq is going to miss rc2, and it's too big to go into rc3.

thanks
-- PMM

