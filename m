Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACF30F62E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:26:01 +0100 (CET)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gW8-0001v5-CS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7gPU-00035W-UJ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:19:09 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7gPO-0000xm-V9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:19:07 -0500
Received: by mail-ej1-x62e.google.com with SMTP id f14so5910513ejc.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ni5vcHSqDjGFHTlD9cqCUySNHZMk2+nyO7IBLpQNlRQ=;
 b=nujOO3ITtrUl2qz04cD7e+e7ITg4FC8sGpYuYGAlHw94BfXk0Cqw8B0j4QJ/dDdc77
 D/q8iW0bD3agUlwVMFhjCD7jPSwa/mgna7fzr01yw2kswthoNKcKhwlTQIQKx6Izj6ea
 8JfbgDUy1STEOksW0gNzFHuXKpyTB7nvHFsQ3r4rDbpctDs5iNFL4SazheuPhojwt8vB
 3e18MkyKoLWHfIkggWckMqHVDiyZHNSYIQKfuwW4q+T0EvDhv+KxsWM9L5AHQkOz+2TF
 YhwAbIhRXMrsQ4R/RA856TlJ9wxsRNgT+BRtKsGng8NfT3SmIlKyhEAIybtjhYLsGpbi
 icQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ni5vcHSqDjGFHTlD9cqCUySNHZMk2+nyO7IBLpQNlRQ=;
 b=afqmsEUWlYqPGcojCadW7MtY6Xrpv7P9+kTNBRHcEGYUqq1llPSWD5LIDVGsD3cXsf
 aXQN11rDugKE5uHEUm1OIHISrRph7BsGHvbfhpx+ZodVJPezXRryCXkKnQnDgYEiUhx1
 wzR+IubXZ875vvoap9VFdrqgCPDCVAbJOxQZ8tGIlHpXctnMDWSWreNs2bV4IrKW5WZR
 /UZ2VMfB3yuSQfcDdK+qiEVN7liOdqJiRPJVp4VgkPyNx6g2Eg3b5jjgs/gKqN5bK1Fz
 EMzQ2OgIOpW6M5WfRaAVYbUoQW820SMrFUMG0t0MoP/8yShfVGvqxwywlyTQmS6c3dY4
 TJTg==
X-Gm-Message-State: AOAM530FhA+iYY5bM2wlWfAP+tnjV/yBrP22eL2oRGeMoLK+ZInHF+Dk
 FOFx72Rk2Za14Y+zEeyIGOgxOJ6hXKD6JxBnIo3L6w==
X-Google-Smtp-Source: ABdhPJynuZ2oZFy2Jur/ytdLYvG75mp29zkljw9qM+KXm2vcFwbwVYsbLWwHGcy3fuHMrIIdnPQSitHgl9mGZJhqe50=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr8390950eji.407.1612451940099; 
 Thu, 04 Feb 2021 07:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
 <20210202162319.GG5184@merkur.fritz.box>
 <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
 <CAFEAcA-7AT1vXKTyc7hZG52gwUpRgAGqcmNTiQNjF2PtKf=4RA@mail.gmail.com>
 <CAFEAcA9RQTShjk1u3dKCsXkDzRC5EyKyhRVyqcAAZY2npbiYdA@mail.gmail.com>
In-Reply-To: <CAFEAcA9RQTShjk1u3dKCsXkDzRC5EyKyhRVyqcAAZY2npbiYdA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 15:18:48 +0000
Message-ID: <CAFEAcA_B4r=FHqw2V5y4kPC5n-B3i7qkT5LGjtwUOGmXUNQOsw@mail.gmail.com>
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 10:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 2 Feb 2021 at 22:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 2 Feb 2021 at 17:09, Vladimir Sementsov-Ogievskiy
> > <vsementsov@virtuozzo.com> wrote:
> > > Note that 30 is known to crash sometimes. Look at
> > >
> > > "[PATCH RFC 0/5] Fix accidental crash in iotest 30"
> > >
> > > https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
> >
> > It certainly seems to be the least reliable iotest in my experience.
> > For example it just fell over on ppc64 on MST's latest pullreq merge:
> >
> > https://lore.kernel.org/qemu-devel/CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com/
>
> Just saw this same error again, on FreeBSD rather than OpenBSD
> this time. Can we please just disable 030 if we can't fix it ?

And another 030 failure, this time in gitlib CI:
https://gitlab.com/qemu-project/qemu/-/jobs/1008038881

thanks
-- PMM

