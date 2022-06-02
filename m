Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D953BD8B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:47:44 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwov9-0000XG-5o
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nwosZ-0007b1-Mg
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nwosX-0000lv-09
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654191900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+30dcsCMgSHbOFHyLp7zzwMbIjNonYI3DOw6Q3K4UGA=;
 b=OZYU1pMiOWOLmiGbiVtK3dgxvFJPqA7+sfLg9THwhLxW/NxHQ46lMy6yVSc9dtynq+MeYo
 SfzKcXHejCQ0QQ7dcmBpYRdKsw2RPc6NJxWSHaGm2DfldUu3eQycdMgKN9ozJAbGPuBwht
 VUgE1nNGJmTVh6mSGY/kJG8haHfHPG4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-Q_1G-6v8M9Wr99pbgOajPg-1; Thu, 02 Jun 2022 13:44:59 -0400
X-MC-Unique: Q_1G-6v8M9Wr99pbgOajPg-1
Received: by mail-vs1-f70.google.com with SMTP id
 w1-20020a67c901000000b003379b87dc81so446889vsk.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 10:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+30dcsCMgSHbOFHyLp7zzwMbIjNonYI3DOw6Q3K4UGA=;
 b=O4JLWXMKz3m9gakuDWdYmeMOL/buh8kEP+ZHbfc1RM7fjsVk0Am8SITdGuL6UOxKVz
 O4x0e+AnzR4aO/7UNfc9LX5mDeJNOYlYXLjQqOiw93QonhZjegNuIbf+/3NAdhxJwfCW
 SJAyZBwKFoB3o3pN3FBDm0bb5sEJb46B7RiwOtCFcdqQ/ptXGqOZtYhjCgn/NcU4HY4v
 xIjYnuEhX2a6ugj5DQikpv3C4l7Ogkxh4u+16qpKlwYtxV2s7DaYHY8Xa/7YNZ/I74tm
 1LSY4Ggc5jzeKlLACoBfgZq4YJOHrl9X3x7XWCVdyjR0v9SrY7Zg1zLtqXOO4HP4MER8
 3Smw==
X-Gm-Message-State: AOAM531fRSs5uzMU0j2/aMSW8mvEF0Kg5RT+tU0b1akzp1KPnb7uwZlU
 c6HhqrP+yErCkX0bfLusc642ZN0ODVPBRL4zkkMllKydPvuXRBLwkjlju3WY03sw0r3tbVoOKvE
 5OJ/yB4B+e//C3PezO6Fzh9a8zVjJdXI=
X-Received: by 2002:a1f:46:0:b0:35d:4de2:5ada with SMTP id
 67-20020a1f0046000000b0035d4de25adamr1418659vka.26.1654191898679; 
 Thu, 02 Jun 2022 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW4IZgEFPECPnnD6+H0pVy3gpHnHlN9zK25MoQeauZdUjWRsQOtOahpvqamPJtM34UEqoTZXkdnrd4Av5+EQ0=
X-Received: by 2002:a1f:46:0:b0:35d:4de2:5ada with SMTP id
 67-20020a1f0046000000b0035d4de25adamr1418650vka.26.1654191898499; 
 Thu, 02 Jun 2022 10:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-9-jsnow@redhat.com>
 <3a0913d7-c148-2619-bdee-7f70b091a6a9@redhat.com>
 <CAFn=p-bnd54uvF38Xqexi9T+P0CHo1seLYoBpwCi2V0e-unkSg@mail.gmail.com>
 <67280754-2b19-c9e4-1b7c-2a22348915ae@redhat.com>
In-Reply-To: <67280754-2b19-c9e4-1b7c-2a22348915ae@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 2 Jun 2022 13:44:47 -0400
Message-ID: <CAFn=p-bpZ5jKcVsZFnDG7tAtVo=TnUb0wkX=ZYss0E6vRcxqcA@mail.gmail.com>
Subject: Re: [PATCH 8/9] tests: add python3-venv to debian10.docker
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000802db905e07a900a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000802db905e07a900a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022, 3:29 AM Thomas Huth <thuth@redhat.com> wrote:

> On 31/05/2022 20.28, John Snow wrote:
> > On Mon, May 30, 2022 at 3:33 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 26/05/2022 02.09, John Snow wrote:
> >>> This is needed to be able to add a venv-building step to 'make check';
> >>> the clang-user job in particular needs this to be able to run
> >>> check-unit.
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>> ---
> >>>    tests/docker/dockerfiles/debian10.docker | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/tests/docker/dockerfiles/debian10.docker
> b/tests/docker/dockerfiles/debian10.docker
> >>> index b414af1b9f7..03be9230664 100644
> >>> --- a/tests/docker/dockerfiles/debian10.docker
> >>> +++ b/tests/docker/dockerfiles/debian10.docker
> >>> @@ -34,4 +34,5 @@ RUN apt update && \
> >>>            python3 \
> >>>            python3-sphinx \
> >>>            python3-sphinx-rtd-theme \
> >>> +        python3-venv \
> >>>            $(apt-get -s build-dep --arch-only qemu | egrep ^Inst |
> fgrep '[all]' | cut -d\  -f2)
> >>
> >> Note that we'll (hopefully) drop the debian 10 container soon, since
> Debian
> >> 10 is EOL by the time we publish the next QEMU release.
> >>
> >
> > Noted -- do you think it'd be OK to sneak this change in first and
> > have you move the requisite to the new container? :)
>
> I don't mind - whatever comes first ... I just wanted to make you aware
> that
> there might be conflicts ;-)
>
>   Thomas
>

Yep, got it! No problem at all. Thanks ~~

>

--000000000000802db905e07a900a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 1, 2022, 3:29 AM Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 31/05/2022 20.28, John Snow wrote:<br>
&gt; On Mon, May 30, 2022 at 3:33 AM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 26/05/2022 02.09, John Snow wrote:<br>
&gt;&gt;&gt; This is needed to be able to add a venv-building step to &#39;=
make check&#39;;<br>
&gt;&gt;&gt; the clang-user job in particular needs this to be able to run<=
br>
&gt;&gt;&gt; check-unit.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 tests/docker/dockerfiles/debian10.docker | 1 +<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/=
docker/dockerfiles/debian10.docker<br>
&gt;&gt;&gt; index b414af1b9f7..03be9230664 100644<br>
&gt;&gt;&gt; --- a/tests/docker/dockerfiles/debian10.docker<br>
&gt;&gt;&gt; +++ b/tests/docker/dockerfiles/debian10.docker<br>
&gt;&gt;&gt; @@ -34,4 +34,5 @@ RUN apt update &amp;&amp; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3 \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-sphinx \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-sphinx-rtd-th=
eme \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-venv \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(apt-get -s build-de=
p --arch-only qemu | egrep ^Inst | fgrep &#39;[all]&#39; | cut -d\=C2=A0 -f=
2)<br>
&gt;&gt;<br>
&gt;&gt; Note that we&#39;ll (hopefully) drop the debian 10 container soon,=
 since Debian<br>
&gt;&gt; 10 is EOL by the time we publish the next QEMU release.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Noted -- do you think it&#39;d be OK to sneak this change in first and=
<br>
&gt; have you move the requisite to the new container? :)<br>
<br>
I don&#39;t mind - whatever comes first ... I just wanted to make you aware=
 that <br>
there might be conflicts ;-)<br>
<br>
=C2=A0 Thomas<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Yep, got it! No problem at all. Thanks ~~</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000802db905e07a900a--


