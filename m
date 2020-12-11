Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0A2D7B69
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:53:26 +0100 (CET)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlfZ-0007d6-8B
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlZo-0004nS-JJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:47:28 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:44466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knlZn-0002BY-1B
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:47:28 -0500
Received: by mail-ej1-x643.google.com with SMTP id w1so8567843ejf.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtFahMWUkxRH3ltuNlCugR+DBs5lwmd7BUQy5DiOZ9c=;
 b=oEhS7gSVpRHn5YciAEauWSPvNlb6NMI3u3nz+nSmMFdkU48Q0XTJQ5f46/YSJXRvhG
 DEHe8GGWNQTANnSttuCDUmIHvbkr8wP/U00AzbObK7VCTjzBQOLiiycmDAxMOZ11SoCW
 Zq8qH3MPEs4IEda/6YMxjQ8ZxRSXBDdjobDEc9YVSwY5AlRN4cY/CAPE2Xh3GQCYmeNV
 VOGfwDmIz1D2muoT/0Vz4cfLJ3cw6skyJ80ktaEd5XpIB+3D8qqNqVYXv99eVpc40MTe
 8c7YOZIWWXQnclZjAOOIvFpWyvSF9qIHe+hrsPDCf/yv8AH6xjR3V/4NuK3lDCuw72Fm
 DXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtFahMWUkxRH3ltuNlCugR+DBs5lwmd7BUQy5DiOZ9c=;
 b=ghcPbG1+CegZv4OJXpufZDp7k1DcT3vUUY/bBEiCxQy6glaEUwOu0jDWIFy2KZuZuH
 lkxW8y72qBNAlbHHOwScsDnBJVGciNZAbQVjXYJnnkBSbXaXPQZtGmj+Y+kL8+7lp5/T
 7LyBe/JUmcoFX3FTkuT6PrpD9DjqNFMa0l18TZhQ/yDMh7jkseq1t9jcbJtVVr35R4ED
 J/sfbD09FHOzaC0RmsuirfqYL2kRkRCzm1idr8eQFmtgG2LYILwmunp3UOc8jXxnZkgR
 MNMDUOl1KpjOP9hm+U0OV7AJ7fWzJbm4dR3d7WEdfHDM8V53eiKGbGRxIxu7Ypib665a
 Q6DA==
X-Gm-Message-State: AOAM533WDFs4uDtdFNNso9i4ZuXb6mz+73IvrtXmHxpWrs5EgLTP5PKG
 ife9rG910HBD9jhFHkO0Dof/vi36L9wCd1EELod7Yg==
X-Google-Smtp-Source: ABdhPJz88uoPi41E2TBxcqWQRxIgqb7FwpTwaRb1iY72DSopew71QLLahlPGtFi31sThRRdG8jSKaW5Ckob4lyUR1lQ=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr11831626ejr.482.1607705245328; 
 Fri, 11 Dec 2020 08:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
 <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
 <20201211161236.GT1664@vanye>
In-Reply-To: <20201211161236.GT1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 16:47:13 +0000
Message-ID: <CAFEAcA-aqTt4zsd0Eq8dpyJJ7hArZHKx_ge8=Us8DVMpHeXBSA@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 16:12, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Fri, Dec 11, 2020 at 14:45:55 +0000, Peter Maydell wrote:
> > On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > >
> > > Signed-off-by: Leif Lindholm <leif@nuviainc.com>

> > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)
> >
> > The ASSOCIATIVITY field is bits [23:3], so it's
> > 21 bits long, not 20, right ?
>
> Err, indeed.
>
> > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)
> >
> > Similarly, NUMSETS is [55:32] so 24 bits long.
>
> Sorry, brain must have taken holiday.
>
> Would you like a v2 of this patch, fixing those?

Yes please.

> > > +
> > > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > > +FIELD(CTR_EL0,  ERG, 20, 4)
> > > +FIELD(CTR_EL0,  CWG, 24, 4)
> > > +FIELD(CTR_EL0,  IDC, 28, 1)
> > > +FIELD(CTR_EL0,  DIC, 29, 1)
> > > +
> > >  FIELD(MIDR_EL1, REVISION, 0, 4)
> > >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> > >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> >
> > Any reason not to define the other fields here?
> > FIELD(MIDR_EL1, VARIANT, 20, 4)
> > FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
>
> Those are just context, not added by this patch.
> (Glad to see I'm not the only one making that mistake...)

Doh!

thanks
-- PMM

