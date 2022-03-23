Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192154E51E0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:09:28 +0100 (CET)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWznq-0000t3-Ns
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:09:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWzHs-000424-Sd; Wed, 23 Mar 2022 07:36:25 -0400
Received: from [2a00:1450:4864:20::62a] (port=41706
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWzHp-000881-G4; Wed, 23 Mar 2022 07:36:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id a8so2204519ejc.8;
 Wed, 23 Mar 2022 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=MtlW6xouBq7U9a9mWHnPCh013FJzep//D/yBhZkelHE=;
 b=OGAdb09SekqTflcR5hg+xYw41ZZB9H939DDTCcSrDiO37B/hjcy9BT/aQZsEsf8MvI
 Lo8TGuR2R/0Nv+aVGj95oQDXltRhO/JtYtve/iILaJ8GjwFYnDUxZlae0YhSyelTve+T
 uAcKp88ClMi2fE4Xsfwu4BaoZik6pDEarNgoat6tRDl0XHGzVnl48gzuB2+ZV4MaUdSZ
 boh3T46/bRFmg/QrT2ihahZmFarnMxIS+FfjVDGniCdV+c7iYsFZ9+6S0rFypsCfox11
 bI+gQ21H+ufEa2+w5XlpKhbeT5CJvwoIdIlcGkh4FKD9nL53gUY5b9Btpt9P7GkGnxrK
 qoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=MtlW6xouBq7U9a9mWHnPCh013FJzep//D/yBhZkelHE=;
 b=SgTniyPkA0IzPjpwThq/bQdQmKAIclYaxqTXBx5Qox0/egs7vYG8nWWHRnAnHMVytJ
 1IliA5zAczhZBwTdSslUXlltuelpEGsU6wTTRYUxjLqAxvv0ypH6BkuqUHFR3VU80FTH
 FZP1fVFiJgb8kVGQgi+OfrpEWZ+rXEPR/f4U7KX38eaG76CyIten0yzaKELJCFQpsTZ2
 FiRAyyVs2eiW+qyWLFnqRfdTHeH81Nr3CEiq0c1r/8P01aQriO0qNAfCVqwYgnDMXkTM
 HUfi7RzaNOX/vkJFB0ECv0xJnUCbLSf35xO/edICXiG5nU0o9tOAyoVYEqBGrBRj9ad7
 2TPg==
X-Gm-Message-State: AOAM530aaSyi9wrBFmnz+Hzm07SfqdeWlfRce+eatpB3PjEIERMCSfr0
 d1KJvjTKojMCf/2XsZAtPSvsYqMHi8B/oe4M+/BCsxG6gR4=
X-Google-Smtp-Source: ABdhPJxXP68wFQjBb7u5dC4c3POsUbhorBayqPoXAZANZt4WKBuCRTflPm0A+ehmn43xwFowJ12l1IuzOzHvvulftPQ=
X-Received: by 2002:a17:907:97c9:b0:6db:ab53:1fdf with SMTP id
 js9-20020a17090797c900b006dbab531fdfmr31559514ejc.406.1648035348482; Wed, 23
 Mar 2022 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220323080755.156-1-luoyonggang@gmail.com>
 <20220323080755.156-3-luoyonggang@gmail.com>
 <YjrpW2O8HqOT2PXN@redhat.com>
In-Reply-To: <YjrpW2O8HqOT2PXN@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 23 Mar 2022 19:35:35 +0800
Message-ID: <CAE2XoE9ez2WgdViMxCPbon8GNPbwvte6R9N6O=VbiU2=1G=7pw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ci: Add empty github workflow for reporting
 historical cirrus result at github
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000860f8905dae12110"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5u0LjQtmU=?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000860f8905dae12110
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 5:33 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:
>
> On Wed, Mar 23, 2022 at 04:07:54PM +0800, Yonggang Luo wrote:
> > Looks like https://github.com/lygstate/qemu/actions does
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  .github/workflows/main.yml | 24 ++++++++++++++++++++++++
> >  MAINTAINERS                |  1 +
> >  2 files changed, 25 insertions(+)
> >  create mode 100644 .github/workflows/main.yml
> >
> > diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> > new file mode 100644
> > index 0000000000..71f5fbd556
> > --- /dev/null
> > +++ b/.github/workflows/main.yml
> > @@ -0,0 +1,24 @@
> > +# This is a basic workflow to help you get started with Actions
> > +
> > +name: CI
> > +
> > +# Controls when the action will run. Triggers the workflow on push or
pull request
> > +# events but only for the master branch
> > +on:
> > +  push:
> > +    branches: [ master ]
> > +  pull_request:
> > +    branches: [ master ]
> > +
> > +# A workflow run is made up of one or more jobs that can run
sequentially or in parallel
> > +jobs:
> > +  check-patch:
> > +    name: Check Patch
> > +    runs-on: ubuntu-latest
> > +    steps:
> > +      # Checks-out your repository under $GITHUB_WORKSPACE, so your
job can access it
> > +      - uses: actions/checkout@v2
> > +        with:
> > +          fetch-depth: 0
> > +      - name: Install dependent packages
> > +        run: echo "Empty action"
>
> I really rather we just integrated the Cirrus CI windows job into our
GitLab
> pipeline using cirrus-run, as we did for the other Cirrus jobs.
>
> We've also already got some native msys jobs under GitLab that test some
> combinations, but not all since they're somewhat slow. So we still need
> to take advantage of Cirrus for some msys testing, but we can likely
> reduce the overlap.
>
> I definitely don't want to see us increasing our use of GitHub, as having
> multiple places to look at for CI results is a really bad thing. We want
> todo what is possible to make GitLab the single dashboard for all CI info=
.

Agreed a single dashboard is meaningfull, I'll try that. other than that, a
empty
github actions can give better experience with qemu, there is 3.9k for at
github,
and 5.9k star at github

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
https://www.instagram.com/dberrange :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000860f8905dae12110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Mar 23, 2022 at 5:33 PM Daniel P. Berrang=
=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&g=
t; wrote:<br>&gt;<br>&gt; On Wed, Mar 23, 2022 at 04:07:54PM +0800, Yonggan=
g Luo wrote:<br>&gt; &gt; Looks like <a href=3D"https://github.com/lygstate=
/qemu/actions">https://github.com/lygstate/qemu/actions</a> does<br>&gt; &g=
t;<br>&gt; &gt; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyongga=
ng@gmail.com">luoyonggang@gmail.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =
=C2=A0.github/workflows/main.yml | 24 ++++++++++++++++++++++++<br>&gt; &gt;=
 =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A01 +<br>&gt; &gt; =C2=A02 files changed, 25 insertions(+)<br>&gt; &gt=
; =C2=A0create mode 100644 .github/workflows/main.yml<br>&gt; &gt;<br>&gt; =
&gt; diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml<b=
r>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000000..71f5fbd556<=
br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/.github/workflows/main.yml<br=
>&gt; &gt; @@ -0,0 +1,24 @@<br>&gt; &gt; +# This is a basic workflow to hel=
p you get started with Actions<br>&gt; &gt; +<br>&gt; &gt; +name: CI<br>&gt=
; &gt; +<br>&gt; &gt; +# Controls when the action will run. Triggers the wo=
rkflow on push or pull request<br>&gt; &gt; +# events but only for the mast=
er branch<br>&gt; &gt; +on:<br>&gt; &gt; + =C2=A0push:<br>&gt; &gt; + =C2=
=A0 =C2=A0branches: [ master ]<br>&gt; &gt; + =C2=A0pull_request:<br>&gt; &=
gt; + =C2=A0 =C2=A0branches: [ master ]<br>&gt; &gt; +<br>&gt; &gt; +# A wo=
rkflow run is made up of one or more jobs that can run sequentially or in p=
arallel<br>&gt; &gt; +jobs:<br>&gt; &gt; + =C2=A0check-patch:<br>&gt; &gt; =
+ =C2=A0 =C2=A0name: Check Patch<br>&gt; &gt; + =C2=A0 =C2=A0runs-on: ubunt=
u-latest<br>&gt; &gt; + =C2=A0 =C2=A0steps:<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0# Checks-out your repository under $GITHUB_WORKSPACE, so your job can=
 access it<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- uses: actions/checkout@v2<b=
r>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0with:<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0fetch-depth: 0<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- na=
me: Install dependent packages<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ru=
n: echo &quot;Empty action&quot;<br>&gt;<br>&gt; I really rather we just in=
tegrated the Cirrus CI windows job into our GitLab<br>&gt; pipeline using c=
irrus-run, as we did for the other Cirrus jobs.<br>&gt;<br>&gt; We&#39;ve a=
lso already got some native msys jobs under GitLab that test some<br>&gt; c=
ombinations, but not all since they&#39;re somewhat slow. So we still need<=
br>&gt; to take advantage of Cirrus for some msys testing, but we can likel=
y<br>&gt; reduce the overlap.<br>&gt;<br>&gt; I definitely don&#39;t want t=
o see us increasing our use of GitHub, as having<br>&gt; multiple places to=
 look at for CI results is a really bad thing. We want<div>&gt; todo what i=
s possible to make GitLab the single dashboard for all CI info.</div><div><=
br></div><div>Agreed a single dashboard is meaningfull, I&#39;ll try that. =
other than that, a empty</div><div>github actions can give better experienc=
e with qemu, there is 3.9k for at github,</div><div>and 5.9k star at github=
=C2=A0</div><div><br>&gt;<br>&gt;<br>&gt; With regards,<br>&gt; Daniel<br>&=
gt; --<br>&gt; |: <a href=3D"https://berrange.com">https://berrange.com</a>=
 =C2=A0 =C2=A0 =C2=A0-o- =C2=A0 =C2=A0<a href=3D"https://www.flickr.com/pho=
tos/dberrange">https://www.flickr.com/photos/dberrange</a> :|<br>&gt; |: <a=
 href=3D"https://libvirt.org">https://libvirt.org</a> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -o- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://fsto=
p138.berrange.com">https://fstop138.berrange.com</a> :|<br>&gt; |: <a href=
=3D"https://entangle-photo.org">https://entangle-photo.org</a> =C2=A0 =C2=
=A0-o- =C2=A0 =C2=A0<a href=3D"https://www.instagram.com/dberrange">https:/=
/www.instagram.com/dberrange</a> :|<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000860f8905dae12110--

