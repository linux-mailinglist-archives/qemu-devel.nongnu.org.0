Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7537F415034
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:54:05 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Nc-0006dl-3E
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT6tZ-0008Mr-9W
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT6tX-0001Du-2h
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u18so9627013wrg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PR5CyJoHncj7xlsbEoL7F6aIdj1E6AnK0za2Kw2KYro=;
 b=Vz19gh9aEXyCbKXfxMg5Di6jaeT9A9/2ggWYzXevsMRWRUjuVUztH9kjDBzA6sd2Dd
 kzXvxu2JAPxFmANMOgo7ibrX/EuXTEwxigF9Cctfoaxtq1HMfo1wZQ9HpmckUBdZD7Lg
 UnhDLuxBPKH11IZAODMxZe56gj9LU8dUCngehFYFdViAb8Et5xIEzQ1qYaLmwXDcRful
 VckX8qrK8ADSFYkRuV6HlWVL8R/f+Yf97R1nEUJ4slHRu5iUR6rEdYcmPRD6fuw/lMwc
 YFFysq7IkI7wxYqQxlHYLRdMaEIKoGp/SqRvK/J/DkjwrSfwhtUYPy0rLuctWmGtxZuG
 DRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PR5CyJoHncj7xlsbEoL7F6aIdj1E6AnK0za2Kw2KYro=;
 b=BnfLPXlgVoL3wOqwnBPoDvAm/DSygwNqYd5nPkshi0IoJXGQvH7uwX1S60Wn7bjFRe
 KtG52wHN0sCph4ifhF94q9DGmOWVUR7iCEUElyuxeNoKUXpwSwDux6vJVKC4gac8UP+r
 2iVuyTOAPjEqEG4zYcUKuTL/4a3uJFbmxiCLOP7SutYXH+i6EkMiGdx14bakF4a/EuGB
 sA2zYJkN2HfeUy0pwWUkTQtBeP6WwaB0pRPVkIHriMfq4azellCTbBySMrdazFqx3mqX
 RFw5RM9MGwB3689vFEfay2z5Zu82iUI7up8gsoxwmDudBiiDQpbvNB5kLj8u1QR/nkzt
 AdcA==
X-Gm-Message-State: AOAM531b8WCsZQPUsf6NcoPrqLOIt86mujshRXCmk4GRzWQZQXSvMMQJ
 7cu5mYDSwCIinbHLLWKZXCBSyIUqByANehnzrNVMXQ==
X-Google-Smtp-Source: ABdhPJxexSUWTragAwwI8+Jeb4J6AsCMS6XT8dwAfhfpPBG6vrACXxnrne/pU0A+3gIYSksSqDqrzEdXtOpv8y9Y2R4=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr465632wmm.133.1632334977164; 
 Wed, 22 Sep 2021 11:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
In-Reply-To: <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 19:22:04 +0100
Message-ID: <CAFEAcA_rhpcE9jMXazbG2vdfcDuaczdM488bZChDFHORbr23JA@mail.gmail.com>
Subject: Re: [PULL 0/3] Update meson version
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 13:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 18 Sept 2021 at 10:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
> >
> >   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to ccc3f971c37bd2202a21abc9f0be093f10426364:
> >
> >   hexagon: use env keyword argument to pass PYTHONPATH (2021-09-15 09:12:55 +0200)
> >
> > ----------------------------------------------------------------
> > * Update Meson to 0.58.2
> >
> > ----------------------------------------------------------------
> > Paolo Bonzini (3):
> >       meson: bump submodule to 0.58.2
> >       meson: switch minimum meson version to 0.58.2
> >       hexagon: use env keyword argument to pass PYTHONPATH
>
> So, I tried merging this, ran into some "is this an issue with this
> pullreq or is it just an intermittent or infrastructure" issues,
> and decided to postpone the merge for a bit and retry it later.

I had another go at this. As far as I can tell it causes all
the vm-build-{openbsd,netbsd,freebsd} build-and-tests to hang.
At any rate the VMs are sat there eating host CPU.
Does 'make vm-build-freebsd' etc work for you ?

-- PMM

