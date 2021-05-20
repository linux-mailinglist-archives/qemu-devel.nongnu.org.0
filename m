Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C538B80C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:04:31 +0200 (CEST)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljouE-0001Ul-W8
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ljosd-0008Ub-SC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:02:52 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ljosb-0006sr-RH
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:02:51 -0400
Received: by mail-qk1-x72b.google.com with SMTP id x8so17536103qkl.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGe8kOFYsUP1wiAKaYR3uYHj9P+Pm2OyeoJ+y3JvPoE=;
 b=VZiZs9DMyQA3zqIUEkEzlaw6XSknjGa2DimZU54r/tVO38/m1QW0Ch8g6F0gYYsgvS
 leqRQZESRcCwNviBG7CSMpNt9onXqRs9sUj3hFJj5GYXVD0qp1D5ALHxhXupSPgKp+nT
 uJBYxqdqcAPvqQkaFgvsfFi0Dai4a9bizB+1nSvkncgnhnWxhXUozU7BLKTZyyzQG3zd
 SsnnIk2VZPTbXPHSk3t8TDrrJwTtfcwD7fjffsQbbBc9WhcKuvh10P8i/mCrDwLG8PuR
 QIpR9OD454yUGC28IThhRCoUYT2yp4k3j56N42i8i39g9cQb7dxWsEBhPIrzkC1GNmxa
 pb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGe8kOFYsUP1wiAKaYR3uYHj9P+Pm2OyeoJ+y3JvPoE=;
 b=pkb+QzNiEDHdbrMH36fizG1+0hN5Q2GhkDiwjtymlYfMFjOPD4x01KRzN1kCtvvd/8
 tz2ZdryKpDAFf58JnCBXF+xjiUWe2KYxS5DY8sd/LmJ9qK3zYHly9myA6PgbwbN0sUVf
 ny0Nkmgt2XvSab64kt09yTJ6NFlTW6Q+Xtnb4nxtyiL9fFPyjxHZknQlSzyn4OClURMS
 D+W6vsKjeTr3GJt289JxoalhQfG+DMywZn6AEyhdddACTKAq+pTM8WE5bUmmV8rYjEB8
 Q1nAILQAzr6zFdcGNbmxQAv7Igh37kNKuoukv70ZVznX9GXL9MPhFMg23llwNfNQn/rr
 yV9Q==
X-Gm-Message-State: AOAM530a/SozIqEol/QLTYkSbjsAn+LeaHsPibJxKlFY8IlmJ6VmG2op
 kuLR8epNQScOXa6yQma9xkscVRj/kZinOH5EjrEfWw==
X-Google-Smtp-Source: ABdhPJwh0sgtB5VPvEDRMP/4RADbviTNbt2W1lf5LQmnwNhZo//yKZXUql/gAbD3g1E3ofcDQhfuQMuUtNePHWmWvnI=
X-Received: by 2002:a37:4396:: with SMTP id q144mr7376983qka.44.1621540967844; 
 Thu, 20 May 2021 13:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-3-f4bug@amsat.org>
 <228ce204-508b-3b77-abdd-2132bf9df431@redhat.com>
In-Reply-To: <228ce204-508b-3b77-abdd-2132bf9df431@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 20 May 2021 14:02:37 -0600
Message-ID: <CANCZdfqmsPWxXcKva7DDcwxm9Rx7UnmOLNJ=0PeE87t9qQ+aHw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] gitlab-ci: Adapt JOBS variable for FreeBSD runners
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000609df905c2c86db3"
Received-SPF: none client-ip=2607:f8b0:4864:20::72b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000609df905c2c86db3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 12:18 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

> Hi,
>
> On 5/19/21 3:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > 'nproc' is not available on FreeBSD:
> >
> >    $ JOBS=3D$(expr $(nproc) + 1)
> >    bash: line 119: nproc: command not found
> >    expr: syntax error
> >
> > Instead, use 'sysctl -n hw.ncpu'.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   .gitlab-ci.d/buildtest-template.yml | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/.gitlab-ci.d/buildtest-template.yml
> b/.gitlab-ci.d/buildtest-template.yml
> > index 58b01744751..fe4f18595ac 100644
> > --- a/.gitlab-ci.d/buildtest-template.yml
> > +++ b/.gitlab-ci.d/buildtest-template.yml
> > @@ -1,6 +1,16 @@
> >   .environment_variables_template:
> >     before_script:
> > -    - JOBS=3D$(expr $(nproc) + 1)
> > +    - if
> > +        test $(uname) =3D "FreeBSD"
> > +        ;
> > +      then
> > +        JOBS=3D$(sysctl -n hw.ncpu)
> > +        ;
> > +      else
> > +        JOBS=3D$(expr $(nproc) + 1)
> > +        ;
> > +      fi
> > +    - echo "=3D=3D=3D Using $JOBS simultaneous jobs =3D=3D=3D"
>
> It has grown to beyond variables definitions. I suggest to rename it to
> something like `.before_script_template` (pure creativity, see?).
>

Also, would it help if FreeBSD were to add nproc in the future?

Warner

--000000000000609df905c2c86db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 20, 2021 at 12:18 PM Wain=
er dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On 5/19/21 3:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &#39;nproc&#39; is not available on FreeBSD:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 $ JOBS=3D$(expr $(nproc) + 1)<br>
&gt;=C2=A0 =C2=A0 bash: line 119: nproc: command not found<br>
&gt;=C2=A0 =C2=A0 expr: syntax error<br>
&gt;<br>
&gt; Instead, use &#39;sysctl -n hw.ncpu&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.gitlab-ci.d/buildtest-template.yml | 12 +++++++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildt=
est-template.yml<br>
&gt; index 58b01744751..fe4f18595ac 100644<br>
&gt; --- a/.gitlab-ci.d/buildtest-template.yml<br>
&gt; +++ b/.gitlab-ci.d/buildtest-template.yml<br>
&gt; @@ -1,6 +1,16 @@<br>
&gt;=C2=A0 =C2=A0.environment_variables_template:<br>
&gt;=C2=A0 =C2=A0 =C2=A0before_script:<br>
&gt; -=C2=A0 =C2=A0 - JOBS=3D$(expr $(nproc) + 1)<br>
&gt; +=C2=A0 =C2=A0 - if<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 test $(uname) =3D &quot;FreeBSD&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 JOBS=3D$(sysctl -n hw.ncpu)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 JOBS=3D$(expr $(nproc) + 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 - echo &quot;=3D=3D=3D Using $JOBS simultaneous jobs =
=3D=3D=3D&quot;<br>
<br>
It has grown to beyond variables definitions. I suggest to rename it to <br=
>
something like `.before_script_template` (pure creativity, see?).<br></bloc=
kquote><div><br></div><div>Also, would it help if FreeBSD were to add nproc=
 in the future?</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000609df905c2c86db3--

