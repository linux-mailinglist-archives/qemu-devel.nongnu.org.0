Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4C3A09C5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 04:02:09 +0200 (CEST)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqnXj-0001gx-VA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 22:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqnUN-0000ig-FF; Tue, 08 Jun 2021 21:58:40 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqnUK-0005NS-KX; Tue, 08 Jun 2021 21:58:39 -0400
Received: by mail-qk1-x735.google.com with SMTP id i67so22277812qkc.4;
 Tue, 08 Jun 2021 18:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WjKsEqAWoBbK40/er6bDP9A7VO7x1EA6trbX8rMCZc=;
 b=RJDV933KytZig/5oIoMFjL4pAtnqNRycceji7CB1IHGMJlfhUZDRJAyjdMvIJli3mB
 W4cseasbMqt1B1dPJY/HQWWvQLULeiyuU6kAZsWU/6BrHMtKkfu0jMz/Lfs//jMfdmhO
 /V+qtL8GkasJTjGIBlaoWsdKM6ZbrTVriYkw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WjKsEqAWoBbK40/er6bDP9A7VO7x1EA6trbX8rMCZc=;
 b=Gvh0iXJPA61P7u6XPLWlMH/eUdBG8zk0Xli4PgCS/QA1UETM6rBiHsg+cBJv6bI+NL
 hvsfgNGB4SOuFRwp7Z5Job40C2T7MrGSuSrKE8UpTCfG3utX2Rl51M6vhT8n1KiccPcW
 K3PThsfBXhDMOmbNSER4VphUnhgXAXd1uVp7jrIh3oWugHOYlMMVWAwLNfleHJ0164Fb
 yjmeavmIOxDJpzJAMktLKk7YMX2TAbcSfWFYLoL0BG9fDvu45XsDxly9+UHwP9cJ3LCN
 euBkf62DVwHsV9B9UIHu9nhohzxw76k16JN1oifoFVaUEhp64jmq7yumVrgK7aD3tNMh
 lLyw==
X-Gm-Message-State: AOAM532GDdXkIxKwKliwUm9hTcZKAgyZISstJW/eHpCvC1yAiYovJ7g3
 9f3kTeMcgtNoHb6fAtxMhcXFFsXOABq8tyen5yI=
X-Google-Smtp-Source: ABdhPJwrDKYDO/ZavM/Eya/MjSkRCIqqnVbqTlhXeFOMy4x/UvBH0QMwKtySE2rRP4klaXgsTPlJ/7iJCUI6hbmfkUw=
X-Received: by 2002:a37:9b03:: with SMTP id d3mr16912507qke.273.1623203914562; 
 Tue, 08 Jun 2021 18:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
 <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
 <CAO=notxHN_JVuyVTO7p+85zWOjeY_uxFfwdbjJXe94qdKhHD0A@mail.gmail.com>
In-Reply-To: <CAO=notxHN_JVuyVTO7p+85zWOjeY_uxFfwdbjJXe94qdKhHD0A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Jun 2021 01:58:21 +0000
Message-ID: <CACPK8XdXYXCnSW4Cs0+CbtDWe9csrtPGuZx3hvMedV6fR-un7Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 19:56, Patrick Venture <venture@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:18 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
> > > >
> > > > Enables the pca954x muxes in the bmc board configuration.
> > > >
> > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > >
> > > Not sure about this one, there's no device tree for it in Linux.
> >
> > Yeah, this was just a pick-up from grepping other BMC boards.  I added
> > these going off the comment alone.  I'd be okay with dropping this in
> > the series.
>
> In this case, the number of patches changed within a version change --
> should I start a fresh series or just bump the version and drop the
> last patch?

I wasn't saying we shouldn't include this change - it's good. I just
didn't have any information to say whether it was correct or not.

I see you chose to resend without this one, lets get Cedric to merge
those patches.

Cheers,

Joel

