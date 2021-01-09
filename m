Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B52F0203
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 18:07:12 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyHhm-0001Mb-Kf
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 12:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1kyHeD-0007TG-9c
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 12:03:29 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:24968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1kyHe0-0001xb-0g
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 12:03:29 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits)) (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D901D99400
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 17:03:12 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4DCmWN59HXz3jWN
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 17:03:12 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 917C9D8EA
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 17:03:12 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id c7so11340916qke.1
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 09:03:12 -0800 (PST)
X-Gm-Message-State: AOAM531L7uzXSBe/kOUrFocwdos7MkjsCYk6U/dxjuy3UMYfVmA4rUzN
 FhWLL+mJMaCfaVCvHoiM/2pEdj5vrR90gEHoq2Q=
X-Google-Smtp-Source: ABdhPJyJncMMpufxDqU8ES9eaaCy2+q4oYi/jYfG1ROuXvlqlry8blcmK1WCYTW/uXTbhXXivKP5+d2MvXWVKe1FJhY=
X-Received: by 2002:a05:620a:14a:: with SMTP id
 e10mr9047626qkn.103.1610211791987; 
 Sat, 09 Jan 2021 09:03:11 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
 <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
 <CANCZdfoeQba=mO7OisVN6jvvxj4Eggd5S4_V5_vHN_B92F7ipw@mail.gmail.com>
In-Reply-To: <CANCZdfoeQba=mO7OisVN6jvvxj4Eggd5S4_V5_vHN_B92F7ipw@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 9 Jan 2021 11:02:55 -0600
X-Gmail-Original-Message-ID: <CACNAnaFAOdZMiJxVvn_7E=Gh_s0iadkyp4g=rppe4uBtmWbhwQ@mail.gmail.com>
Message-ID: <CACNAnaFAOdZMiJxVvn_7E=Gh_s0iadkyp4g=rppe4uBtmWbhwQ@mail.gmail.com>
Subject: Re: qemu bsd-user plans
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Bruno <sbruno@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

As one of the developers on the FreeBSD side, I agree with this. In
addition to the reasons cited, reintroducing it would really take a
lot more time and effort and I'm not convinced it would ever be
completed because, IMO, going that route should really entail
redesigning it from the ground-up based on an abstraction of
linux-user. I find that right now I'm playing a lot of catch-up
because we seem to be largely copied from linux-user without later
improvement; there is a really healthy amount of platform-independent
stuff that really should end up ultimately shared in a qemu-user or
something to that effect to mitigate duplication of effort.

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

Thanks for taking this on!


Kyle Evans

