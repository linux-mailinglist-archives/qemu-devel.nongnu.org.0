Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E944B49B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 22:25:12 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkYcA-00087z-TA
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 16:25:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkYZ7-0004zm-4y
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:22:01 -0500
Received: from [2a00:1450:4864:20::32a] (port=36511
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkYZ5-0002AF-8u
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:22:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso2982098wml.1
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vln+6uXc9Tglm914nsNGgZ9aFjIT+o0h+0Gn1gMpGr8=;
 b=qNqFgl0r4Anhpp4m9YKuyLoAO+ku7Cz6b6DRr3jyh8zA0lrAlVzwPa1XYxgrlBCb9M
 G6INwYDGxxq1xaj1fM3ZhOnDPDvWPdP1ZCBCRTsE3oHYs96j1zOc/rjlZxppGgRjQJ3e
 NRzYOr6Qb2gHkRDxnEBL8/dP6DDB5ohH/oZ8dC5uyhE9ncOi/sugweQQ5emwT5QYUt2j
 xVgE0wcsmVipbcnJJacD4cABz+8fSEjsKANeUT5CRqTnXMMnHcIj+v1IPwc6ebbdv3b8
 MyOwNFmp5ST+cCTf6BXOzrD0dRNPDL442gc3DxoiPCo7MpnfnJUJhRNFcYreIu1tuVh4
 xEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vln+6uXc9Tglm914nsNGgZ9aFjIT+o0h+0Gn1gMpGr8=;
 b=AqYxoarMrLLcQdk+VE6ShKdPwfo6Rp8aNH4xximSd04polVnya31Yw+cNQHSK39zfB
 58ADeM1FXqbXK1x1gqaaJs6YwslD98oklvHlEo9hOCk2VOo0gUnhtqPlJfNOvDal8ou1
 h/SgUcvSmXJT/sAVyHGcPkdU5pTIY389RLQrRVqHslAdnrGJ87Zcyl/O9UA3RUz5ASt4
 AbO7H3PpL8XeQ6V4zIsQTzYrvCDhO0kkUpBb6AdKTE/klXlRPG6zsHHS4LxSHTprA0vY
 IbjwBj6pU+IDOV/CAEdVvrMebcclwyzS/0AlaIz72SZnBWlzjDzNlyLYMAsyvOIDxCxa
 CqtQ==
X-Gm-Message-State: AOAM531rOFA8Z7xw6yI+ztOLBcFD44x4hAUNACccravwfc9dzifa0QUh
 cGohOioRgi4C9wITDunVPeqPvToLf70C9+e0Zgy5Bw==
X-Google-Smtp-Source: ABdhPJyujnnkrHEBSYbG+1Bg9NeddcTrNYara4KTKMWjjNZWegjmL5l56cqXb8pSCYzzCm5mVdqzdulLKps/kai0wqs=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr10812093wmq.21.1636492917801; 
 Tue, 09 Nov 2021 13:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
In-Reply-To: <20211109204249.usvfatm3frar3u7a@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 21:21:46 +0000
Message-ID: <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

On Tue, 9 Nov 2021 at 20:42, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Tue, Nov 09, 2021 at 13:43:50 +0000, Peter Maydell wrote:
> > On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > > (Apologies for delay. Alex also tells me you are currently away, but
> > > there is no strong urgency here.)
> >
> > (Thanks for the ping via Alex -- I missed this email when I was
> > scanning through my qemu-devel mail backlog after my holiday...)
> >
> > > On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > > (Numeric values described as incrementing integer rather than trying
> > > to guess at specific qemu release numbers.)
> >
> > This is kind of mixing up two separate things. The above describes
> > three "versions" of this machine type, which you might consider
> > as like revision A/B/C of hardware (and where firmware might for
> > instance read a 'board revision' register or something to tell
> > them apart). QEMU release numbers and versioned board types like virt-6.0
> > are a very specific thing that is taking on a guarantee about
> > maintaining version compatibility of the same board type between
> > different QEMU versions. We can make sbsa-ref a versioned machine
> > type in that sense if you really want to do it, but it makes future
> > changes to the machine rather more painful (everything new
> > immediately needs flags and properties and so on so that it can be
> > added only for newer versions of the machine type and not for the
> > old one -- at a rough count at least  10% of hw/arm/virt.c is purely
> > boilerplate and machinery for versioned machine types).
> > So it's not something we should do for sbsa-ref unless we have a good
> > reason I think.
>
> Hmm, right. So you're thinking containing the versioning fully in the
> interfaces presented by the model:
> - Is the version node present?
>   - If so, is it greater than X?
>     - If so, is it great enough to support the SCP interface?
> And let the firmware deal with that?

How the model tells the firmware about the presence/absence of
certain things and whether it's one version or another is
a different question again :-) I guess since we're using DTB
already for passing some info to the firmware that that would be
the way to continue. Whether it's better to have a simple
"version" node or property, or to have perhaps distinct things
in the DTB to indicate presence/absence of important features I
don't know and leave up to you.

> I was kind of thinking it was expected for incompatible machine
> versions to be qemu versioned. But I'm good with skipping that bit if
> it's not.

The other thing we should nail down is how the user is going to
select which flavour of machine they want to provide. Three
options:
 (1) no control, QEMU just emulates whatever the newest flavour is.
User needs to go find a firmware image new enough to cope.
 (2) different flavours exposed as different machine types
(analogous to how we have musca-a and musca-b1, or raspi3ap and
raspi3b, for instance). Old user command lines keep working
because -M sbsa-ref doesn't change; the new stuff would be
available via -M sbsa-ref-2 or whatever.
 (3) different flavours exposed via a property
(so you would have -M sbsa-ref,machine-revision=2 or something).
If the revision defaults to 1 then old user setups still work
but everybody starts to have to cart around an extra command
line argument. If it defaults to "newest we know about" you
get the opposite set of tradeoffs.

-- PMM

