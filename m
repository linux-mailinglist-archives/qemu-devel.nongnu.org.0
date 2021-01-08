Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6022EF870
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:57:48 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxtL-0006MI-SX
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxs1-0005T7-1U
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:56:25 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxrx-0006FA-Rj
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:56:24 -0500
Received: by mail-ej1-x62a.google.com with SMTP id q22so16157170eja.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aymvMmPvUaZhL2NOn8t2DZzp0MOQgKyhgCbwuTUxFeE=;
 b=bcFC//7RZPf14tmZKT+Pt/g2vSMG2VWzQKvMKr2D/XeIK84/KZI1XId8gxPcFBiBNl
 hhVJGY36qj2B9lW8MEqqv47fDQE6jlc+ofclvGKJcRxKkUnCiNSnb0eV1KuHvSusxyg/
 aldhbLxJgZ2MEJinN2/BBZ3fGyqaXxTnDulc8+JAyVh6CDZEr9YEHaEhGPEmfCnX2CjS
 24RLkSmzk8JRNvzQAdtJmj7VeiI+WP3pZVkYFKQzZSYTMz9HczYwkByMHKTTEYSccBA8
 L+CM03o+zYsYN32N+NQd31dbz3jHmQJYZi0aNtULGZVehWiiSs4aWjNgX3imCwi7fC49
 +z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aymvMmPvUaZhL2NOn8t2DZzp0MOQgKyhgCbwuTUxFeE=;
 b=U/6dPaplQwvyEOD8bsVq8Nsr0LjOi0wBu+qhxJLwUWfnJC9+sLk3+Ll2dyJICcT5mp
 r1RI6kmdhs0xATs0V4gZQAmPFpjiWIpzbWyVBQbLlUG2QWFYV8vEs806qyiciJYMOnL4
 QVUFM3biV1qpSWMdSsI9941100hkzmkGW3Fgs1jcegJT0jRZj18fT9TTpczZQRsxyNS+
 WbN8p8Q7wdRLLzFnM0Np7hPPui37Kn6WfisCNeeiSww+oyxu4fWsKw9WYTDDImbdgaHF
 +qXHWJXjkCFJS3xqHTobr1hZ719tWnC7KhWJaIu+a5equUiDvJj0e1ri1q8AEklW4rgr
 7Rjw==
X-Gm-Message-State: AOAM530P9pIAgsKXYj04UgmmzeZcSYW7SlQmEBV8WOh2rseGsYYVTcbK
 /nAlgPeqKf4H6s/XsndrBp3NoTyjH7auKAQqwzf4Sw==
X-Google-Smtp-Source: ABdhPJwGM9VChN5oonpNa7Mo3ttH4MmbLGAPS0kNw8RdGbbr/GdZRzNkc1mHfUO+z6blpPTdklvtvHj5aeo0xrcrAPE=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr3668962eje.4.1610135780296; 
 Fri, 08 Jan 2021 11:56:20 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
In-Reply-To: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 19:56:09 +0000
Message-ID: <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
Subject: Re: qemu bsd-user plans
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Sean Bruno <sbruno@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the people to the CC list who were on the previous discussion thread=
...

-- PMM


On Fri, 8 Jan 2021 at 19:43, Warner Losh <imp@bsdimp.com> wrote:
>
> The FreeBSD project has rewritten bsd-user. We've been working on this fo=
r quite some time (the earliest commits date from 2013). Maybe a dozen peop=
le have worked on this over time, and there's 3 or 4 active developers focu=
sed on FreeBSD changes at the moment.
>
> For a while, we'd merge in upstream changes from qemu. This worked great =
for us, but left us with a big backlog that was hard to upstream. Each of t=
he updates took some time, so we got a little behind.
>
> So, a few years ago, I spent several weeks converting the tangled merge m=
ess into a set of linear patches and started moving that forward. This was =
around the time 4.0 was released. I only managed to get the rebase forward =
to 3.1 release at the time before I hit problems related to poor testing en=
vironment making it hard to verify newer versions were still working. Plus,=
 we found a few bugs that took a while to resolve for a number of reasons. =
Now that they are resolved, we're able to use qemu-bsd-user to build ~30k p=
ackages for arm, and ~20k for different types of mips in FreeBSD "ports" sy=
stem. We now have great confidence that it's working well again.
>
> Now that those bugs are resolved, I started trying to forward-port the tw=
o-year-old base and immediately found myself hitting a number of problems. =
A big problem was that I was re-doing a lot of work that was due to innocul=
ous changes upstream that I wouldn't have to do if the bsd-user changes wer=
e upstream. These changes get in the way of dealing with the more substanti=
al structural changes in qemu that have happened.
>
> There had been talk of doing a remove and replace update of bsd-user. Thi=
s talk was before I managed to rebase things as far forward as 3.1 even. Th=
is appealed to me because we've accumulated about 150 patches to date, many=
 quite large, and curating them into a set of maybe 400 or 500 changes to m=
atch the size and scope of most patches I've seen posted to qemu-devel seem=
ed overwhelming.
>
> However, it's been another year since that plan was hatched, and it's bec=
ome clear to me that plan won't end in success. The closest I've been able =
to get is 3.1 when 4.1 was current (about 6 months behind). It's time for a=
 new plan.
>
> So, my new plan is to rebase what changes I can to the tip of master and =
submit those for review. I'll work with the developers on the FreeBSD side =
to ensure they are included in reviews in addition to the normal qemu-devel=
 list. This will allow us to pare down the deltas between our code and upst=
ream to allow us to make progress. The changes will be held to the standard=
 'makes things better'. Given how broken bsd-user is today in qemu upstream=
, at first that will a very easy standard to make.
>
> The first patch I'll submit will be changing MAINTAINERS to point to me, =
since I'm acting as the point person in this effort. I'll then re-submit so=
me other changes that I've submitted in the past, but CC the FreeBSD folks =
that are currently active (they were only CC'd to former developers who lac=
k the time to review).
>
> But before I get too far down this path, I thought I'd send out what's go=
ing on to qemu-devel so I can get feedback and adjust the plan into somethi=
ng that's mutually agreeable so time I put towards this is not wasted.
>
> So, what do people think of these plans?
>
> Warner

