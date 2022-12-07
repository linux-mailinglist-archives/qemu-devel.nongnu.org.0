Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3964625E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p312e-0006vt-Sd; Wed, 07 Dec 2022 15:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p312a-0006v0-A0
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:29:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p312W-0005rk-JS
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:29:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id t18so8152738pfq.13
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MIqQBuUd7BXQlzF9TWBUSVsfb5QSIEwGdLwpvHucN3Y=;
 b=sOJlQc53PrxeJDB0EExraqtX+Yqqr/ARpEleJesK35loxj51W/mJaB4i7M3aLbgOcj
 ZVqGXmdEulluOcvnQDME3L8c+1g/Bj/MXI08wVlF3QmxTyrkvdGFrx34QWgXxVQEQuIT
 3fGEFwFSbRYQsxW+YGctbGEFYEMYMT5P2922XGYgp5Pt3sYKyEK2Sos1FGJ34J4BneB0
 Owq4H1EfAOuBOQPjUhYYYq4rcuGBgUtx6pt8zlyWZGwfz9NRHHovv/+hZNTpCCHCCUSS
 ZkL88FxN1cc8ztxP0awx0QnMs1z7cPIDfHUBKdh0Aj7v87Tu/WsTvujeRSxli1wb0/OG
 WHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIqQBuUd7BXQlzF9TWBUSVsfb5QSIEwGdLwpvHucN3Y=;
 b=UKgSUBOjngW6i4AzqzvHYmmBHQzkxNWezKIj2m01Nc6yZQc+W9G+weop3JKh7T12tT
 nhmEmmEqXWdxOB25uEuhQRNoARYFOYPZAepcL0B/p1GwM1P3g0bEYHRMXcy2ylexeGJg
 od7iq3CKe3h86zIgiYjNAQTOxeJwVmKjG1sSv18F7oBmpyle6WixNVG5d+EBPYl4zwtQ
 7aA7g3f0seM/ycj/4oqsGYca6SqPW2v1GDFmYquIvPbfdTJQyiapYaUpiLK0gzJMQj/w
 7ARZshTATvjydjV5coO6fI4bMyCUJzaIhU4rqsdtv+TYL91fjEb7mG+1JbTxTbEK9a4J
 VzQg==
X-Gm-Message-State: ANoB5pl1QZmkYer3odUxibcTW9Dxzn0yU3oOMHlmgkjaJFbQffZxq0t9
 YqwFCTQhLpdY5dkRYo96/SdivdVsunsjejFcRgqNAA==
X-Google-Smtp-Source: AA0mqf6iKdrswp7npb8STSspC3/6CouFGyzIRNNvw3wsDcGIlATX/lt8UQRX59Xz1oAPTO/W++7JwjMFJ4xTLUBpF1w=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr68155504pgr.192.1670444950815; Wed, 07
 Dec 2022 12:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
 <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
 <64a40f5d-855e-7f70-ba1f-df464abcfddf@linaro.org>
 <d3ba280e-0955-a599-29ec-3fd24df9fd23@redhat.com>
In-Reply-To: <d3ba280e-0955-a599-29ec-3fd24df9fd23@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Dec 2022 20:28:58 +0000
Message-ID: <CAFEAcA8SYqsdkHq==xggYH3dxpREq6rjhqDUyd_0ZrzrUzCCJw@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
To: eric.auger@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, 
 eric.auger.pro@gmail.com, pbonzini@redhat.com, paul@nowt.org, 
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 7 Dec 2022 at 18:44, Eric Auger <eric.auger@redhat.com> wrote:
> On 12/7/22 19:23, Richard Henderson wrote:
> > Adding -Wall is not standard, nor all the other -W that you are
> > adding.  I think you should not be surprised that you run into problems.
> OK that's a useful indication. I used to have this configure cmd line
> for a while and have not paid much attention to it until now, I
> acknowledge. This was useful to catch compilation errors at some point I
> guess.
> >
> > While you can make a case for auditing the code base and adding these
> > to the default set of warning flags, that's a job for the next
> > development cycle.
>
> Let me clarify, I am not insisting for that fix to land in 7.2 all the
> more so it is pretty late. I just wanted to report the compilation issue
> and since I use the std qemu pieces with a pretty standard tool chain I
> thought somebody else would be likely to hit the same problem.

As Richard says, we don't expect people to randomly add extra
warning flags, and anybody who does should expect to see extra
warnings (and that they need to --disable-werror if they don't want
those extra warnings to turn into errors).

We specifically disable some warnings, there are some not-on-by-default
warnings that we know we have work to do if we want to eliminate them
(eg -Wvla) and there's probably a few where we conceptually disagree
with a warning flag or don't find it useful for QEMU (like
-Wgnu-statement-expression -- we deliberately use GNU statement
expressions so warning about them isn't useful to us).

Sorting through which of the currently non-enabled warning flags
are worth trying to fix existing warnings and enable by default
is a pretty big task (not dissimilar to sorting through Coverity
issue reports -- maybe some of the things you fix are real bugs
but there's a lot of false-positives to wade through to get there).

maybe-uninitialized warnings are particularly awkward because whether
you get them depends a lot on the version of the compiler and how
smart its data analysis is.

thanks
-- PMM

