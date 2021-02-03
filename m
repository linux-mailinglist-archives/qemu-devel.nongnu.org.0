Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5C30D7E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:48:07 +0100 (CET)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Fhe-0001aF-GY
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FfR-0000UK-DY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:45:50 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FfN-0007wN-Ep
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:45:49 -0500
Received: by mail-ed1-x529.google.com with SMTP id t5so5153779eds.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nvyQW9CMfh4xmtrfpkX7+JzfyRDnWkp+xOIcI9vaCWM=;
 b=bc1RM/aVU5IXbBHZknGoCQh7yJCr3veYh0N4XXaTn1UpNSm39Tl4F72K/yP3b7iJSN
 Z7dyFiEB7s+QG7G1Q8nRFsF95amJ23R6MDX6lIPTDLOzslw4AYOWSNfqcJQabkFvBLe7
 ax11OZaTcO+mtuWUrnp4paYNyMlSL4pdr4CDUwwyuENQgdrv5u06OdPs0v4uWQzNbcHW
 30MiBCpLDk5y6WxZ7jVUoNM/rqQ1JjTjOs7BeHH0TFH0VxgFvLd6LzJW69GJJ/QzPOft
 KjfOdSJERVy2Zbt/9/qx8Pf9s2yT8YvmuSrrtdzOBlpwkpjoytM20nPPoGV77pfAlBoq
 0Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nvyQW9CMfh4xmtrfpkX7+JzfyRDnWkp+xOIcI9vaCWM=;
 b=QjKzUVPPHZL807Wzhn4q+HzUJwEgHely48FWQXbBO9IZmuRfrvaR717dLrfGimPYAt
 SAo5kfG9AtlZOrDjH4i1gk0wmqfWvDUTUASRAYGt5SOkwQshjcdaW31qmBW5eoHkPiAR
 TlPntDSAchuUFgGg0/AxslaY37O3UmDulD0KGyx/e6vL156ddTENqfaoqQNJa03MMtFC
 1inY5pLZDLbUUOiEiQ3EY45/vDjX4DiWTqPbWZ0Yyv+kbaKdL2XZraLY/l2zsHAcmOgB
 Rsvlw5jiMnbkAV2DwF8y+lnbsjWSW1VNFEO2gIWWndaWagZ1A3sZfPJ36mNdo4+jLsiA
 wSCg==
X-Gm-Message-State: AOAM533EYb2YN8eH8HYLEra5OroxGuCjevOKFCOAS9WCO3ZO4l3KzLke
 JZ03qAAWzd1cAP21cgnSGKo89d2+JfO+9AhH8g5OTQ==
X-Google-Smtp-Source: ABdhPJxTI10T+sJ0Ud7aVPgD7w+qlfoHckT8vNt8TojEmideBr7ULypLDKp9aYZFoN3HBA3PirwEM3ApYKFRlnmh6PI=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr2272586edb.44.1612349143302; 
 Wed, 03 Feb 2021 02:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
 <20210202162319.GG5184@merkur.fritz.box>
 <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
 <CAFEAcA-7AT1vXKTyc7hZG52gwUpRgAGqcmNTiQNjF2PtKf=4RA@mail.gmail.com>
In-Reply-To: <CAFEAcA-7AT1vXKTyc7hZG52gwUpRgAGqcmNTiQNjF2PtKf=4RA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:45:31 +0000
Message-ID: <CAFEAcA9RQTShjk1u3dKCsXkDzRC5EyKyhRVyqcAAZY2npbiYdA@mail.gmail.com>
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 22:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 2 Feb 2021 at 17:09, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> > Note that 30 is known to crash sometimes. Look at
> >
> > "[PATCH RFC 0/5] Fix accidental crash in iotest 30"
> >
> > https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
>
> It certainly seems to be the least reliable iotest in my experience.
> For example it just fell over on ppc64 on MST's latest pullreq merge:
>
> https://lore.kernel.org/qemu-devel/CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com/

Just saw this same error again, on FreeBSD rather than OpenBSD
this time. Can we please just disable 030 if we can't fix it ?

thanks
-- PMM

