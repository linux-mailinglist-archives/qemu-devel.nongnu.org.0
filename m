Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E32337B6FA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:37:05 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjQW-0003it-MG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgjOE-00017L-Ol
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:34:42 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgjOC-0003hn-Fb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:34:42 -0400
Received: by mail-lj1-x22e.google.com with SMTP id c15so13857956ljr.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27N/eNJKKi0yQ0/dMeEPw1rgKJa8f2JEJdAI7i+PeZQ=;
 b=oSJyCGWZd1zot0gm6Y8E43+maIeRQIdA2tNSVOtghRMFizHoERrtEHukt9k6OV4CAq
 9XlSOcaiZ3lKqGvvXLLPrFmFt8e7r8pko2gxs+IRxW+bMH1MTEcBciUbz8B4N4Ji1XaZ
 /uA1ECK1t7ufQw6KW0cwpopjZ4HHkf7cEcaclMJpSr8s4AnP48pAYBf9mMYzIYQ4t0bh
 5zPGwcpX9zTH1fWbWKl15oEHT8tHBU965QkDkHDk56r386gI3qbDJPzO3XidcV7ld6rB
 2k4t9tbI3qqroEXhc9mTGBlfmBqxKBJ/Myo8pYrezweCEYV3TTTh4Oz6tgl1WLXO0IK7
 czDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27N/eNJKKi0yQ0/dMeEPw1rgKJa8f2JEJdAI7i+PeZQ=;
 b=sRnH5N63taFFlsl7gWqTXW3Yi/s6p47nqXWQzBoNlt5esEDsG4+rFmLUwm6sA8sT8a
 5j4BWexMSqgIb7ke7PZos00N8623tqH4dramiE9gYtN5V25L9opejmKqrnUK3nc+lvXf
 oJB5zOtaEnODGA1EbkEHmvbdovJAEXhoMM0J2ZvbGwny2wJRIKcGcTQTX8cTpyx87QMN
 kdnIY/Wul2Rp4RumEg4lre1ZD8JYeh6jOX3do9oJwggc9Imovdh0uRres3UE9cTApAoX
 WF8gRV//8iDUiUu0W71aHlcmdhbYXlLpyTj1EDg1qDhG7+pJsBuI12UOO7yhLBGqKMVT
 AeUg==
X-Gm-Message-State: AOAM530TGWiH7h/Sf9OLKVeT02ryIfNh0+qx/2f5ZGYI8isojGZKZV0y
 UvcBXy0n1Vc8uILmjX+rTbY0F6htxO/puE6nGnmR6Q==
X-Google-Smtp-Source: ABdhPJwaIvkMQZsKEhH5PLMWnHLY5j8uD3GeuE6yWwkqFBcTYtevzy/Cmcw8hyGO9HbBAU6ikLd0ntrUhsnTmFlS3Vc=
X-Received: by 2002:a2e:910a:: with SMTP id m10mr4910284ljg.456.1620804878354; 
 Wed, 12 May 2021 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org> <871radgwgg.fsf@linaro.org>
 <SN6PR02MB42050836329B89FA1A4C21B1B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB420515C1DC328699018F20B2B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB420515C1DC328699018F20B2B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Wed, 12 May 2021 08:34:24 +0100
Message-ID: <CAHDbmO1tGvFjxhffD=5NA3717h_bG_i8cVn-Kqbjw4hg4puQuQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/25] gitlab: add build-user-hexagon test
To: Brian Cain <bcain@quicinc.com>
Content-Type: multipart/alternative; boundary="000000000000065f7c05c21d0bf7"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000065f7c05c21d0bf7
Content-Type: text/plain; charset="UTF-8"

Sorted now. I had applied the patch but was running into trouble because
although I'd pushed to the project registry when running on my gitlab
project it was using the personal registry. Will post v3 later today.

On Tue, 11 May 2021, 16:08 Brian Cain, <bcain@quicinc.com> wrote:

> > -----Original Message-----
> > From: Brian Cain
> ...
> > > I suspect the easiest thing to do is to drop the patches again so I
> > > don't hold up the rest of testing/next. I can include the initial
> > > docker image patch but I won't enable it in configure.sh/gitlab.
> >
> > Sorry -- I sent along a patch to update the LLVM_SRC_URL so that we would
> > have the support we need for this test case.
> >
> > > Would one of the hexagon guys be able to send a new image and verify
> > > it works with the current tests in master?
> >
> > Sure, can do.  Do I need to update the container registry in gitlab
> somehow?
> > Or just share the patch to update the Dockerfile?
>
> Reference:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg796850.html
>
> If you want, I can build and push the container.  Not sure I have the
> right credentials but I think we can sort that out.
>
> -Brian
>

--000000000000065f7c05c21d0bf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sorted now. I had applied the patch but was running into =
trouble because although I&#39;d pushed to the project registry when runnin=
g on my gitlab project it was using the personal registry. Will post v3 lat=
er today.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, 11 May 2021, 16:08 Brian Cain, &lt;<a href=3D"mailto:bcain=
@quicinc.com">bcain@quicinc.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">&gt; -----Original Message-----<br>
&gt; From: Brian Cain<br>
...<br>
&gt; &gt; I suspect the easiest thing to do is to drop the patches again so=
 I<br>
&gt; &gt; don&#39;t hold up the rest of testing/next. I can include the ini=
tial<br>
&gt; &gt; docker image patch but I won&#39;t enable it in <a href=3D"http:/=
/configure.sh/gitlab" rel=3D"noreferrer noreferrer" target=3D"_blank">confi=
gure.sh/gitlab</a>.<br>
&gt; <br>
&gt; Sorry -- I sent along a patch to update the LLVM_SRC_URL so that we wo=
uld<br>
&gt; have the support we need for this test case.<br>
&gt; <br>
&gt; &gt; Would one of the hexagon guys be able to send a new image and ver=
ify<br>
&gt; &gt; it works with the current tests in master?<br>
&gt; <br>
&gt; Sure, can do.=C2=A0 Do I need to update the container registry in gitl=
ab somehow?<br>
&gt; Or just share the patch to update the Dockerfile?<br>
<br>
Reference:<br>
<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg796850.htm=
l" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.mail-archive=
.com/qemu-devel@nongnu.org/msg796850.html</a><br>
<br>
If you want, I can build and push the container.=C2=A0 Not sure I have the =
right credentials but I think we can sort that out.<br>
<br>
-Brian<br>
</blockquote></div>

--000000000000065f7c05c21d0bf7--

