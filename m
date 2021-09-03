Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00524003AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:51:33 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCPc-0001aL-I6
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMCOm-0000oB-1n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:50:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMCOj-0004Ux-H3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:50:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4208477wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SeJTMDTeJW0uClhHQj7BWgw+eUgrrbiXK00taAPCI0U=;
 b=ZVW8cj1DA3VhE+mOA6dJlkS1pQ/FduEoFcHzNpeGk+a2GyFJ+k3Ywq6LBvKpB0vLHx
 pcws1dzFSXLA/HaAvYaulKfrvJ9jgQ/fJ4oESGKcJmSzXN1mRKiMj1oFl7K5peKeTV2k
 7Onxfi3tkz2EpXSIJaBJwMhC/CKpzQ+HBzofIQD8dU+x90SISosz+LoXy49Pn/Zg/Tv8
 qoLT7GKYNMZZ736kOlrbQlchgiBUZO+j622/vNC0IuOAMHu7e9bhFn2motQ/AbrxYvJk
 mq8A7teD36cavnzlX3k9SMkUXTZ//OFz5BZ0ZzLZZP4n2fy1l1PN83ppueWdsIn0jGl/
 NKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SeJTMDTeJW0uClhHQj7BWgw+eUgrrbiXK00taAPCI0U=;
 b=rztiW5epVIT/qabw+yc8Taz2MS+4wTraD9GdbyfO5mr+1uS3QAr6DERGet9DT7Jjlh
 JStDYRxt7ERZzg3sWHZZCLRKs3sxB/uShCh9pyQgZAOrQSFv7t8Wijdh5NLIN9yiN6tv
 4WiXBHEVJ1HOw5axykufRlLJyJWwtccUVcvehZ14vMf6Qv56qIbnXFsq88J7eJf7ygqB
 8TjJ0Vl9noZzy7Q07ZP8cxMIND1qloYEL76SjTryrpa4tOrAJKS5/hJ9XALe2uYPTvzq
 a6GNm9CIzlglfm591+lNnvC5dSkqJ2WAa1tDlCZRP9MskJbBJFUE4v5TBrmUGTH7fUBq
 LASg==
X-Gm-Message-State: AOAM530vOucmjrw1f8h0ARQ2tMj9pE0FQcH4Zw3HBADO0UX8nIYU6gEH
 DL80linco+cqpPzUKyj+EzdieyC9m4s0j78HAlxIqg==
X-Google-Smtp-Source: ABdhPJyWYq3VGYWs+oJzt1p1WzfqFLpWOFPvV+MXHbzILYfNE2RyP0TMdQrbMgiZBvrQYlXbvh521bW8rumhc51OIec=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr1395642wmq.32.1630687835342; 
 Fri, 03 Sep 2021 09:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210902124911.822423-1-thuth@redhat.com>
 <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
 <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com> <87v93hpqdj.fsf@linaro.org>
In-Reply-To: <87v93hpqdj.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 17:49:46 +0100
Message-ID: <CAFEAcA9eWukPg87mBCA-UfGuy6i-HdOyjnOpYF1eRsbCHfUjvg@mail.gmail.com>
Subject: Re: [PULL 00/13] Testing, build system and misc patches
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 17:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Thomas Huth <thuth@redhat.com> writes:
> > On 03/09/2021 15.22, Peter Maydell wrote:
> >> This provokes a new warning from meson on a linux-static build:
> >> Run-time dependency appleframeworks found: NO (tried framework)
> >> Library rt found: YES
> >> Found pkg-config: /usr/bin/pkg-config (0.29.1)
> >> WARNING: Static library 'gbm' not found for dependency 'gbm', may not
> >> be statically linked
> >> Run-time dependency gbm found: YES 20.0.8
> >> Dependency libpng found: YES 1.6.34 (cached)
> >> Dependency libjpeg found: YES unknown (cached)
> >> If we're building statically and we can't find a static
> >> library then (a) we shouldn't print a WARNING and
> >> (b) we shouldn't then conclude that we've found gdm.
> >
> > Hmmm, no clue what's wrong here, since I basically did declare it like
> > all other libraries are declared, too (so this problem should have
> > shown up somewhere else already?)... Paolo, do you have any ideas
> > what's going on here?
>
> In attempting to replicate I found all the dynamic libs blow up:

>   WARNING: Static library 'xkbcommon' not found for dependency 'xkbcommon=
', may not be statically l
>   Run-time dependency xkbcommon found: YES 1.0.3

I do vaguely recall complaining about new meson warnings for
static library detection in the past as well:
https://lore.kernel.org/qemu-devel/CAFEAcA8chPqS0keyGv0vBgNgacnMo95gA3LZDU2=
QfmteQ=3D4UZg@mail.gmail.com/
https://lore.kernel.org/qemu-devel/CAFEAcA_-cNmt-sY3nqnGkpUqET86M6-82rf-Uv3=
QkwCR14kYsw@mail.gmail.com/
https://lore.kernel.org/qemu-devel/CAFEAcA8xHxCGhh2hibsdCxZrYRRU+xcwVsa85O7=
KL9BsmW7ohw@mail.gmail.com/

> So is this a general problem with static libs. BTW I didn't catch this
> because I only build user with --static as I thought system --static was
> flakey anyway.

I'm not doing a system build in this case... Looking at some of
those older threads, it looks like part of the answer is that
for dependencies that we don't need for linux-user mode we should
guard the test with some suitable if condition so we don't create
the dependency unless we're going to use it, eg the brlapi check
uses "if not get_option('brlapi').auto() or have_system", rbd
has a similar thing involving have_block, etc.

But I think there is an underlying meson bug here which that kind of
use of an if is merely working around: if we ask for a static library
it should not give us a dynamic library.

-- PMM

