Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A8BB426
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:48:31 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCNlW-0004JQ-HD
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNk5-0003hG-CP
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNk4-0006nL-3P
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:47:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35714)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCNk3-0006mx-Uj
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:47:00 -0400
Received: by mail-oi1-x243.google.com with SMTP id x3so7437262oig.2
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jV176iHH3a7T3Z7Nm5lkp7y1hfpdPt8AAf1Vbsv9mlo=;
 b=ukmwFMMKvEdg+p8uYqffGx9MIw3iVA0NQ0HICz+kzsAifpdL87G+WZS+QTbU5Oo2uL
 QtkiOdoPdwl+VWDDN+m8AkodmYd36usz/3fv8wc9+pWs3EWPJ+RgSx+mSzcgBjewxnmK
 ATcGf3/uMbzHsF8PdR2ghT73zXer69FJUQhapDOxvF4r6R2s7iXXDCpmWGxMCW/3aLac
 32vGMROG6ORpspMu7n5xtg4y1nApBt3p4CcCBp1WS5k4HQ2pRU1t6Hnb7GnzC3F8NQC1
 la72AkUR8Ev4dA72iOOn1ZYHsSVt63WJJsZpkWiU8zga0PQUedtEPwG3C8h8Mr+CKLD9
 gOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jV176iHH3a7T3Z7Nm5lkp7y1hfpdPt8AAf1Vbsv9mlo=;
 b=pkjEbdk01Lxb04aCrEbzDIxF9EhiuVHMvB/+YgNWO5GQRWQLgf4cO6YaTnbeU0PT86
 2cUdyY84c2Vul6p/S75w6oADfub0+AhO6qlDdVBIbabKSUuxQtrL/+g3tlSVgmlQUD38
 G9hdyWzp81p7/oMkEqiobQsGl2eW5oljvSfRvqoYVcmIcmRDezGHJG+RHZrU3kC8TlbN
 rhBY5yFHnCrxPCRKnOBBhHIbMgkpIVQXglpU5o7ZeogeQ6IlluDmZr5zDhSpjaTbRZjc
 ZuIDZDhY4lPmyYEbGMK5jCsgF/f4DmXSMsLnOdy+Ej2s6L3JmrlHWsbFDwjPJboDN8Zz
 OXZA==
X-Gm-Message-State: APjAAAUNA+MwEzRcQTkib4wjdxtzajyqMgyyJ0KrzUr51B7zhXGuXYAl
 lDsilRTh8xCUQRBb5eqcbBEZIKJTl81pJzPfXf8/OA==
X-Google-Smtp-Source: APXvYqzmBuWVB3XNOwg1Jm00EZvD9MBkuGvA6s7KtruGDKZv8PGmMjIoCLiagpuE10y13JBQFu9eiz7MQZp/Qn+xFaM=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr13547038oih.170.1569242818897; 
 Mon, 23 Sep 2019 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190923121712.22971-1-thuth@redhat.com>
 <CAFEAcA9jOD_mFOeVaAo5qsoj-Q0-U5qF8c85Am4ObgSn3b6irg@mail.gmail.com>
 <cff2b157-910a-a97d-3fe1-a862e781eac8@redhat.com>
In-Reply-To: <cff2b157-910a-a97d-3fe1-a862e781eac8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 13:46:47 +0100
Message-ID: <CAFEAcA-bUT4o0=Vs7zrnx_aS0XBaWuedsUv-rMu5cimV7S5a9A@mail.gmail.com>
Subject: Re: [PATCH] Disallow colons in the parameter of "-accel"
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Sep 2019 at 13:42, Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/09/2019 14.23, Peter Maydell wrote:
> > This seems pretty ugly.
>
> Yes. The whole "-accel" option is currently ugly. My patch is just a
> temporary work-around to prevent that we later have to deal with the
> fact that users started to use this colon here in the wild and we would
> then have to fight to get rid of it again.
>
> > If -accel is the way we're recommending
> > users configure the accelerator then it should support syntax
> > for specifying everything we could do with the old -machine...
> > option.
>
> No, we certainly don't want to have the colon in here. The idea is
> rather that you could specify multiply "-accel" options one day, e.g.:
>
>  -accel tcg,tb-size=2048 -accel kvm,kernel_irqchip=on
>
> ... and then the accelators are used with the right parameters in the
> order of availability.
>
> Per-accelerator parameters just don't work here if you allow the colon.
>
> (IMHO we should not have let the -accel code enter the repository in
> this shape, but rather insist on a proper implementation right from the
> start - but now that it's there, we have to deal with it and should make
> sure that it does not get worse)

Ah, I hadn't realised that -accel was a (relatively) long-standing
option; I'd just noticed some patches going past recently suggesting
we were starting to recommend it over -machine accel=.
Thanks for trying to clean it up a bit.

-- PMM

