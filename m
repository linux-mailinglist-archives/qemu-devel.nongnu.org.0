Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F033404A5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:32:27 +0100 (CET)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqt8-0002SZ-9f
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqpm-0000os-G4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:28:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqpj-0001IT-5Z
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:28:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id bx7so6147105edb.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+5bBq8jtGGPOhiOdvkEP288dTNTMO1iRkdg/uV97RM=;
 b=D1zRKRjGaxSFhepOfDwH++iNUc67Gfgo+bLNd8TDp5fb9OTKREcYmI7HmxoWj33f4+
 nmgtuh9bBE8LQFg0Ey4GCypDz7WqpCI6zsDCzEu6R+S+aAyWVHROQ87T8RXz7jcq2yHw
 yWpGDK3gMnfJX4pRr1dihatNxYscB8/2bTperzCvLx2S6CfpaYeA0XgUnnj4Gjs7sWdg
 30SyA2yJVMimg7FijwYsrhKnaH+Xzel3oAeYOaietI2/PVlMR83LNxL9PsLF02WOsZVC
 5qaGu36z3yH04cx4aZxU+cYia04xf21Hlx8o6nZulxIbv0kDoHbbZAIivwzDt+f235p2
 sqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+5bBq8jtGGPOhiOdvkEP288dTNTMO1iRkdg/uV97RM=;
 b=ryj4zquLG1x+gjXNxYfIsIsF7/OxTaAgmYWcBeIh4xnscl5wHJU/3agG2wILgpOrS7
 d59OT2YWK2H2mbSeur+mwoeeOf4EX+Sibk89BAguZSALVfZz0UQagr8tR79jWdywNWUG
 ba6W3riGz010+aU9Jc+tenQmdZ5etJpLNwmGJ0uMP5nWCEiutR5Al1Q3NqHXfmBs+RiH
 Ws7UNj+fTKUv3SUZdz2LGTX1fCfzHQoZ68bn/UtobYW3B/WvAl4NABEenfCSw/zo4m/+
 7r8BQKDqngdj6qPkSlJ+Am1fvpqUf/KVkB5D2dGDljncQg9doKRKF9iGZoUSf+rTaaMV
 EAvA==
X-Gm-Message-State: AOAM533uYMB3qWEcz/WYEdbzQjV2m/K3tpn5ZMEd3gjPtmS4nijAke4K
 7E43IZ73C4Zo5vpzcWItXaJeVGdTwKOH7hJ4Ey7yNQ==
X-Google-Smtp-Source: ABdhPJwR9gMFMYuUpfuSPIlv28s+2vvVkNBj5dgDaoNHd5Zqzz8MCvsJ8OIY59U5aI0Vf1xegl8FGHnGaShkWenXdoo=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr2970677edu.100.1616066933622; 
 Thu, 18 Mar 2021 04:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210316214753.399389-1-its@irrelevant.dk>
 <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
 <YFM5MjqxwMiddbaB@apples.localdomain>
In-Reply-To: <YFM5MjqxwMiddbaB@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:28:29 +0000
Message-ID: <CAFEAcA9YZPbUVCgwaxsMjmkCbYN1uTv=N4P9VjUiktBD_0JRPQ@mail.gmail.com>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 11:27, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Mar 18 11:26, Peter Maydell wrote:
> > On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wrote:
> > Hi. This tag includes a submodule update which is not mentioned
> > in the cover letter or listed in the cover letter diffstat:
> >
> >  roms/opensbi           |    2 +-
> >
> > so I suspect it was inadvertent. Please fix up and resend.
> >
>
> Oh crap. Sorry!

No worries -- git makes this a very easy mistake to make when
doing rebases. That's why I have a check for it in my 'apply
a pull request' scripts :-)

thanks
-- PMM

