Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26C4E4DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:58:25 +0100 (CET)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvsu-0003c7-8M
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWvpi-0000Nk-FV; Wed, 23 Mar 2022 03:55:08 -0400
Received: from [2a00:1450:4864:20::52f] (port=33284
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWvpg-0002Ao-G2; Wed, 23 Mar 2022 03:55:06 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r23so859860edb.0;
 Wed, 23 Mar 2022 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=bgBm1DAi3lNv03ULzbNcPze9lIfWJzn9Kx+8umnj81U=;
 b=DnzwNRuyjhcJv1cCdZ5qHXqzu38g7rx+eN4IiqQBJhVl86sGDksIkue0jhyhxtGlYr
 kSKG4O5QZRHPpWzU+7YecbTAd7d9fwBbOO6gpvoD1wgKLC/hpI3ryfXwaHTBZh11hq4l
 UCDeb7gaR/CDQvN8Tm/ZU8EFBXUnztMsd4GMwnGPiynnlTwZEDsZij6zxBSZfhMckLYF
 sNNkUkZxDJvDWAKs+bstZKC0Zv59glW7W5mw48HqAikJbW2D0o58Q9ZYkuHZc6VleCl0
 jxtI1pB7zcq0xwT0VEBUzRoxB9BB4pIGsdnjIAqGfjchWqXxpPLm1XRhK0B2M6a5EbFq
 x0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=bgBm1DAi3lNv03ULzbNcPze9lIfWJzn9Kx+8umnj81U=;
 b=RUUc4mauS72j3cX0NoGA2KS5eOawfQRYMDkzDbv/QEGHsB7Z4d+8iHP1rnfj1fEEz8
 lCVxnZH7Mxt/mjyE+ELN6Vk1XWQDF65OqM8uOEr8lCtHTG75mwKimX/Ez7wAvtTvGHjO
 xqSJDlbZX53AYtDf3HosYyHinOk+oERfwYNmePt8OTqOK57Z/nC+w5+8Do78TrwPdZyR
 ya5v1dg/hRwZe05aeR/uTk/vla41z2vDMHfPYpOofq6CMAh6HbTQ34imXJSYVT4okN3u
 qJwUhScudyk16WlS1TxDC3oHmvzunwnOOcONAOiKuT+ZTX6tfpKW0lUOHtUreDyhq/js
 FHdg==
X-Gm-Message-State: AOAM532Xsbqpr5Rq0qe5jnpS4E32jwmmBr4ez70SLL/27RyF/ckCQTzp
 EfqYJOIm1io+VSXQhXvs9F6bA0tRWKmgL06lJRnkEj4PBQhMXg==
X-Google-Smtp-Source: ABdhPJzov+Z5jvcKCPmCszUoRSui6znHdJKNL08IFJHd2d8FrxBWJi4Z7fl8V7yLO8rXZz8qHhHUJiXwWHhJzJr9R7Y=
X-Received: by 2002:a05:6402:510f:b0:419:5105:f7e6 with SMTP id
 m15-20020a056402510f00b004195105f7e6mr11031985edd.339.1648022102330; Wed, 23
 Mar 2022 00:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220322191409.1330-1-luoyonggang@gmail.com>
 <20220322191409.1330-2-luoyonggang@gmail.com>
 <0ab85e95-2cb2-51ae-fa48-089f02ac0c0e@redhat.com>
In-Reply-To: <0ab85e95-2cb2-51ae-fa48-089f02ac0c0e@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 23 Mar 2022 15:54:49 +0800
Message-ID: <CAE2XoE8DkLOzc=L=o3uVa_c64YpN0fjgWjNqFYZ_pbSUgYxLKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ci: Add github workflow for getting cirrus working
 properly
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fdd18d05dade0b49"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, QEMU Devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5u0LjQtmU=?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fdd18d05dade0b49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 3:44 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/03/2022 20.14, Yonggang Luo wrote:
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>
> Missing patch description ... why is this needed? I can't see anything
> related to Cirrus-CI in here?

Here is the place report failure
https://github.com/qemu/qemu/runs/5652470682

Here is the place showing the valid ci result:
https://github.com/lygstate/qemu


>
> > ---
> >   .github/workflows/main.yml | 29 +++++++++++++++++++++++++++++
> >   MAINTAINERS                |  4 +++-
> >   2 files changed, 32 insertions(+), 1 deletion(-)
> >   create mode 100644 .github/workflows/main.yml
> >
> > diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> > new file mode 100644
> > index 0000000000..85a392b962
> > --- /dev/null
> > +++ b/.github/workflows/main.yml
> > @@ -0,0 +1,29 @@
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
> > +        run: sudo apt install perl
> > +      - name: Checkpatch
> > +        run: |
> > +          git fetch https://git.qemu.org/git/qemu.git master
> > +          git tag base_tag_to_rebase FETCH_HEAD --force
> > +          ./scripts/checkpatch.pl --mailback base_tag_to_rebase..
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cc364afef7..6d1dcc36b0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3612,10 +3612,12 @@ Build and test automation, general continuous
integration
> >   M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >   M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >   M: Thomas Huth <thuth@redhat.com>
> > +M: Yonggang Luo <luoyonggang@gmail>
> >   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >   R: Beraldo Leal <bleal@redhat.com>
> >   S: Maintained
> > -F: .github/lockdown.yml
> > +F: .github/workflows/lockdown.yml
> > +F: .github/workflows/main.yml
> >   F: .gitlab-ci.yml
> >   F: .gitlab-ci.d/
> >   F: .travis.yml
>
> You also don't mention that change anywhere. And IIRC you've also only
been
> involved in the Windows-related CI tasks so far? So it might make more
sense
> to update the "Windows Hosted Continuous Integration" section instead?
>
>   Thomas
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000fdd18d05dade0b49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br>On Wed, Mar 23, 2022 at 3:44 PM Thomas Huth &lt;<=
a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt;<=
br>&gt; On 22/03/2022 20.14, Yonggang Luo wrote:<br>&gt; &gt; Signed-off-by=
: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gma=
il.com</a>&gt;<br>&gt;<br>&gt; Missing patch description ... why is this ne=
eded? I can&#39;t see anything<br>&gt; related to Cirrus-CI in here?</div><=
div><br></div><div>Here is the place report failure<div><a href=3D"https://=
github.com/qemu/qemu/runs/5652470682">https://github.com/qemu/qemu/runs/565=
2470682</a><br></div></div><div><br></div><div>Here is the place showing th=
e valid ci result:</div><div><a href=3D"https://github.com/lygstate/qemu">h=
ttps://github.com/lygstate/qemu</a><br></div><div><br></div><div><br>&gt;<b=
r>&gt; &gt; ---<br>&gt; &gt; =C2=A0 .github/workflows/main.yml | 29 +++++++=
++++++++++++++++++++++<br>&gt; &gt; =C2=A0 MAINTAINERS =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +++-<br>&gt; &gt; =C2=A0 2 fil=
es changed, 32 insertions(+), 1 deletion(-)<br>&gt; &gt; =C2=A0 create mode=
 100644 .github/workflows/main.yml<br>&gt; &gt;<br>&gt; &gt; diff --git a/.=
github/workflows/main.yml b/.github/workflows/main.yml<br>&gt; &gt; new fil=
e mode 100644<br>&gt; &gt; index 0000000000..85a392b962<br>&gt; &gt; --- /d=
ev/null<br>&gt; &gt; +++ b/.github/workflows/main.yml<br>&gt; &gt; @@ -0,0 =
+1,29 @@<br>&gt; &gt; +# This is a basic workflow to help you get started w=
ith Actions<br>&gt; &gt; +<br>&gt; &gt; +name: CI<br>&gt; &gt; +<br>&gt; &g=
t; +# Controls when the action will run. Triggers the workflow on push or p=
ull request<br>&gt; &gt; +# events but only for the master branch<br>&gt; &=
gt; +on:<br>&gt; &gt; + =C2=A0push:<br>&gt; &gt; + =C2=A0 =C2=A0branches: [=
 master ]<br>&gt; &gt; + =C2=A0pull_request:<br>&gt; &gt; + =C2=A0 =C2=A0br=
anches: [ master ]<br>&gt; &gt; +<br>&gt; &gt; +# A workflow run is made up=
 of one or more jobs that can run sequentially or in parallel<br>&gt; &gt; =
+jobs:<br>&gt; &gt; + =C2=A0check-patch:<br>&gt; &gt; + =C2=A0 =C2=A0name: =
Check Patch<br>&gt; &gt; + =C2=A0 =C2=A0runs-on: ubuntu-latest<br>&gt; &gt;=
 + =C2=A0 =C2=A0steps:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0# Checks-out your=
 repository under $GITHUB_WORKSPACE, so your job can access it<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0- uses: actions/checkout@v2<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0with:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
fetch-depth: 0<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- name: Install dependent=
 packages<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0run: sudo apt install p=
erl<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- name: Checkpatch<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0run: |<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git fetch <a href=3D"https://git.qemu.org/git/qemu.git">https://g=
it.qemu.org/git/qemu.git</a> master<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git tag base_tag_to_rebase FETCH_HEAD --force<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./scripts/<a href=3D"http://checkpatch.pl">c=
heckpatch.pl</a> --mailback base_tag_to_rebase..<br>&gt; &gt; diff --git a/=
MAINTAINERS b/MAINTAINERS<br>&gt; &gt; index cc364afef7..6d1dcc36b0 100644<=
br>&gt; &gt; --- a/MAINTAINERS<br>&gt; &gt; +++ b/MAINTAINERS<br>&gt; &gt; =
@@ -3612,10 +3612,12 @@ Build and test automation, general continuous integ=
ration<br>&gt; &gt; =C2=A0 M: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.b=
ennee@linaro.org">alex.bennee@linaro.org</a>&gt;<br>&gt; &gt; =C2=A0 M: Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat=
.org</a>&gt;<br>&gt; &gt; =C2=A0 M: Thomas Huth &lt;<a href=3D"mailto:thuth=
@redhat.com">thuth@redhat.com</a>&gt;<br>&gt; &gt; +M: Yonggang Luo &lt;luo=
yonggang@gmail&gt;<br>&gt; &gt; =C2=A0 R: Wainer dos Santos Moschetta &lt;<=
a href=3D"mailto:wainersm@redhat.com">wainersm@redhat.com</a>&gt;<br>&gt; &=
gt; =C2=A0 R: Beraldo Leal &lt;<a href=3D"mailto:bleal@redhat.com">bleal@re=
dhat.com</a>&gt;<br>&gt; &gt; =C2=A0 S: Maintained<br>&gt; &gt; -F: .github=
/lockdown.yml<br>&gt; &gt; +F: .github/workflows/lockdown.yml<br>&gt; &gt; =
+F: .github/workflows/main.yml<br>&gt; &gt; =C2=A0 F: .gitlab-ci.yml<br>&gt=
; &gt; =C2=A0 F: .gitlab-ci.d/<br>&gt; &gt; =C2=A0 F: .travis.yml<br>&gt;<b=
r>&gt; You also don&#39;t mention that change anywhere. And IIRC you&#39;ve=
 also only been<br>&gt; involved in the Windows-related CI tasks so far? So=
 it might make more sense<br>&gt; to update the &quot;Windows Hosted Contin=
uous Integration&quot; section instead?<br>&gt;<br>&gt; =C2=A0 Thomas<br>&g=
t;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br=
>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincere=
ly,<br>Yonggang Luo</div></div>

--000000000000fdd18d05dade0b49--

