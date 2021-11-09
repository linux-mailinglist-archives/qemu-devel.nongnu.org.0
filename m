Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8444AF07
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 14:50:03 +0100 (CET)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRVi-00085V-Gx
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 08:50:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkRPz-0003aN-6e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 08:44:07 -0500
Received: from [2a00:1450:4864:20::333] (port=56260
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkRPv-0004sR-1V
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 08:44:06 -0500
Received: by mail-wm1-x333.google.com with SMTP id v127so15842869wme.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 05:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMPwNn0OGGRDPgI/eeHJw7lVn7x9CkhqUobjvoDQuhc=;
 b=sskDnS7ahjntlhNX48uoFC5e0MT+VPa8xgTcwo5tjOx/7VwJn0Lwqdtwn8SOSAJ7nc
 e5OCPrR3a14HPfSjQKjyj9EMhS0D53P4/dL/zmUA83auo6YDLpjm58hYq9+HeQe3IES1
 7a/xYNWP63JmF5sFahdUs5Fmg52PfCY4OqgjgHL2tEcAvkhrIBS9RASE+hHLe5y8wPtk
 pvcPqKgCuOcSCeDeVXc1m2fwok9+MesDJIXfC4pVBRJQ9RGv1Ar4REg84blLleDNiEbh
 rjxJYhXJnrSMJwjMhwCcIJzja0Z45BvglHQye7i0uSMkjU5oLSi/0NGZ+r8xmftSOTy/
 lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMPwNn0OGGRDPgI/eeHJw7lVn7x9CkhqUobjvoDQuhc=;
 b=Ec6qMRacA6m57IfBiqm53uEn6aZJTdDqLE+niglkR7ITOOa0V8z/TMt2vpCyIc5q8t
 3zDDyM4Wnb45UqAS2+xilFCarsb+IytrtaACPmJdmAtdq3JD3GWY0FDbxYdy69nbJ8aV
 timmRM3m3I9uIDqY+IdUOXJK3Yk0CiMHMS/qSUlvzw3vi1AElLMKQdTBPefWRxlsIO+o
 0aGm9rSGas/RU9b8gMbWYU3+uNEl1OtYibTukEE2p9GFV6rBD9qsZj1OQj4OloFnXOn4
 Mac+OUaW8OfQAbcdBDPpcSfr8oDGj9olwl14/v1vYtkTvnaIhNQiFhctzWi4XdgZ5u+x
 VDlA==
X-Gm-Message-State: AOAM531uAv8E9WnU4gnCSuqlmo/kZAh3UssuUj0GQGb3HhaPdDZ2r1BL
 j2dzLiCO8EHMSQg/sWzOhZMM41rL+L35PcFXzsI1bQ==
X-Google-Smtp-Source: ABdhPJxGfmz2NCCmcjMM3EezbQ7INVlcZLLoEcgxdx8SnH5fQezlWtDhEz93NiT+hmvF8u1Kc4abYI8SU5tpYkAxk6M=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr7357975wmq.21.1636465441361; 
 Tue, 09 Nov 2021 05:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
In-Reply-To: <20211015122351.vc55mwzjbevl6wjy@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 13:43:50 +0000
Message-ID: <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> (Apologies for delay. Alex also tells me you are currently away, but
> there is no strong urgency here.)

(Thanks for the ping via Alex -- I missed this email when I was
scanning through my qemu-devel mail backlog after my holiday...)

> On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > Leif, what's your plan/preferences here ?
>
> I discussed this with Alex/Shashi.
>
> One further complicating aspect is that the EDK2 GIC driver currently
> relies on GIC addresses being known at compile-time.
>
> > Presumably somebody also needs to do the system-software side
> > of things to handle the ITS being present and the redistributor
> > frames moving...
>
> Since it *would* be useful to get this support in, I think the most
> pragmatic plan would be:
> - Add ITS in the location originally proposed by Shashi.
> - Add information to DT:
>   - Platform version (1).
>   - GICD, GICR, and ITS base addresses.
> - edk2: Convert GIC driver to support dynamic block addresses.
> - TF-A: Parse the DT and add SIP SVC calls:
>   - to retrieve it (or return not supported if not found).
>   - to retrieve base addresses for GICD, GICR, and ITS.
> - edk2-platforms: Query TF-A for platform version.
>   If platform version >= 1, request base addresses for GICD, GICR, and
>   ITS.
>   - Generate IORT if ITS present.
> - Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)
>
> Unrelated to the ITS question, and not requiring any intervention on
> the QEMU side, we can then also transition the CPU and DRAM discovery
> to SIP SVC calls, and stop sharing the DT with edk2 completely.
>
> And some way further down the line we could do the SCP thing, which
> would let us support different GIC-layouts/configurations based on
> platform command line options. (Platform version 3.)
> (TF-A makes SCP calls if version >= 3)
> This would then require no changes to edk2-platforms.

This sounds good to me.

> (Numeric values described as incrementing integer rather than trying
> to guess at specific qemu release numbers.)

This is kind of mixing up two separate things. The above describes
three "versions" of this machine type, which you might consider
as like revision A/B/C of hardware (and where firmware might for
instance read a 'board revision' register or something to tell
them apart). QEMU release numbers and versioned board types like virt-6.0
are a very specific thing that is taking on a guarantee about
maintaining version compatibility of the same board type between
different QEMU versions. We can make sbsa-ref a versioned machine
type in that sense if you really want to do it, but it makes future
changes to the machine rather more painful (everything new
immediately needs flags and properties and so on so that it can be
added only for newer versions of the machine type and not for the
old one -- at a rough count at least  10% of hw/arm/virt.c is purely
boilerplate and machinery for versioned machine types).
So it's not something we should do for sbsa-ref unless we have a good
reason I think.

-- PMM

