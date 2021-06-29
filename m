Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7E3B7771
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHuB-0003i7-5l
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyHlx-0005OJ-7V
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyHlu-0004ls-NX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624988620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfJMImTI52wDoa6dovtkZSP0Lvw0uwdoHzqjRUDUvuA=;
 b=Yt307WoGVbY3J1ZSJcHN5Y0VXtHhzIWuvAAVXOiDCoIH9jajwzAyz1qLj0nm7jq5Fwwo/y
 whFptQm7gTt8udwqaLIeV3rEBgF72uQddjQ+H8+lMBrSB5FNNtiNMAVgpGxexgq9ehBQBl
 RBH/HefWdLNgBHBnwlx6AOik18c5mvY=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-GqD6LNcpOli6KeX5klph9w-1; Tue, 29 Jun 2021 13:43:36 -0400
X-MC-Unique: GqD6LNcpOli6KeX5klph9w-1
Received: by mail-oo1-f71.google.com with SMTP id
 s11-20020a4ac10b0000b029024bc69d2a8aso14022784oop.16
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VfJMImTI52wDoa6dovtkZSP0Lvw0uwdoHzqjRUDUvuA=;
 b=mui0sZhaOJ4jrfTWDndQsUS/8db6THxIkZMhKtsbP0wb3AwjEOvmrJReAq/Mos5TOX
 J3BUWyJZ/L8jHxojwqJ/0QccS5StxBUcEzCFKWtAMyoyIa1+HiXpuX7qxfuUfB/8WCQD
 y80KZtZ7uBlG9U/jxLIZtI7C72BYWUW1zFGP/MdJHFP9K2ZuUdk/tJEng9I1tVng79Mz
 j76BxMM13Xc3Le2Ft3KUVhkDFmlpqKWBvF8CFvf/+i2+xBTre/rs7AduNApYcVNHgkg6
 qbTSsy+tEFe0+PLc1uxS5pqrAGrbuHKzjUa8nZQe11L9YWX7zZFM9jD+G/Mx7UhHdzIT
 whVw==
X-Gm-Message-State: AOAM532km4HXCT/IJo3WKMOl3ZF5udWIKOm4797/qaDEWFzT0TeZskJf
 tTBDgi0hflzvFyqvAH+5BKbvmUBNbDOJHNMdgjJhZ5J5KCZG9UjlJGCtkurc6bUrJpNRNImPp8K
 VIyrPOAPMuahVFJ4+SzE4pYGbHNMVLPY=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr25155oiv.112.1624988616222; 
 Tue, 29 Jun 2021 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCMqlEdMZp4zgamQnr6b3TpqAldv5AilLAaiZhiCHFZUb2sF0OzKOjkb57DmG0mfsbM083bYHIEzcunRkWvSY=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr25141oiv.112.1624988616082; 
 Tue, 29 Jun 2021 10:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-10-jsnow@redhat.com>
 <a63f357e-42c4-5385-fa40-82f291efac71@redhat.com>
In-Reply-To: <a63f357e-42c4-5385-fa40-82f291efac71@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Jun 2021 13:43:25 -0400
Message-ID: <CAFn=p-bOtBupzBnTNaav3iSTB1Roaidk4c5WsGAoEDLCStG6eA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] python: add 'make check-dev' invocation
To: Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000039ddb305c5eb257f"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000039ddb305c5eb257f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 1:34 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

>
> On 6/29/21 1:42 PM, John Snow wrote:
> > This is a *third* way to run the Python tests. Unlike the first two
> > (check-pipenv, check-tox), this version does not require any specific
> > interpreter version -- making it a lot easier to tell people to run it
> > as a quick smoketest prior to submission to GitLab CI.
> >
> > Summary:
> >
> >    Checked via GitLab CI:
> >      - check-pipenv: tests our oldest python & dependencies
> >      - check-tox: tests newest dependencies on all non-EOL python
> versions
> >    Executed only incidentally:
> >      - check-dev: tests newest dependencies on whichever python version
> >
> > ('make check' does not set up any environment at all, it just runs the
> > tests in your current environment. All four invocations perform the
> > exact same tests, just in different execution environments.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/Makefile | 35 +++++++++++++++++++++++++++++++++--
> >   1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index d34c4e35d9..8f8e1999c0 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -1,3 +1,5 @@
> > +QEMU_VENV_DIR=.dev-venv
> > +
>
> I gave `make check-dev` a try and `tests/flake8.sh` failed, because it
> is checking the python sources from the $QEMU_VENV_DIR itself.
>
> Either we keep $QEMU_VENV_DIR outside (as in the v1 series) or ...
>
>    diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
>    index 51e0788462..1cd7d40fad 100755
>    --- a/python/tests/flake8.sh
>    +++ b/python/tests/flake8.sh
>    @@ -1,2 +1,2 @@
>     #!/bin/sh -e
>    -python3 -m flake8
>    +python3 -m flake8 qemu/
>
> ... to ensure flake8 parses only the files from the 'qemu' directory
> (btw, this is how tests/pylint.sh is configured). I prefer the later.
>

Augh, oops. Good spot ...

OK, i'll just update the canonical flake8 invocation instead. I can remove
the .venv and .tox stuff in the flake8 section in setup.cfg, too.

--00000000000039ddb305c5eb257f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 1:34 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><br>
On 6/29/21 1:42 PM, John Snow wrote:<br>
&gt; This is a *third* way to run the Python tests. Unlike the first two<br=
>
&gt; (check-pipenv, check-tox), this version does not require any specific<=
br>
&gt; interpreter version -- making it a lot easier to tell people to run it=
<br>
&gt; as a quick smoketest prior to submission to GitLab CI.<br>
&gt;<br>
&gt; Summary:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Checked via GitLab CI:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-pipenv: tests our oldest python &amp; depe=
ndencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-tox: tests newest dependencies on all non-=
EOL python versions<br>
&gt;=C2=A0 =C2=A0 Executed only incidentally:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-dev: tests newest dependencies on whicheve=
r python version<br>
&gt;<br>
&gt; (&#39;make check&#39; does not set up any environment at all, it just =
runs the<br>
&gt; tests in your current environment. All four invocations perform the<br=
>
&gt; exact same tests, just in different execution environments.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/Makefile | 35 +++++++++++++++++++++++++++++++++--<b=
r>
&gt;=C2=A0 =C2=A01 file changed, 33 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/Makefile b/python/Makefile<br>
&gt; index d34c4e35d9..8f8e1999c0 100644<br>
&gt; --- a/python/Makefile<br>
&gt; +++ b/python/Makefile<br>
&gt; @@ -1,3 +1,5 @@<br>
&gt; +QEMU_VENV_DIR=3D.dev-venv<br>
&gt; +<br>
<br>
I gave `make check-dev` a try and `tests/flake8.sh` failed, because it <br>
is checking the python sources from the $QEMU_VENV_DIR itself.<br>
<br>
Either we keep $QEMU_VENV_DIR outside (as in the v1 series) or ...<br>
<br>
=C2=A0=C2=A0 diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh<b=
r>
=C2=A0=C2=A0 index 51e0788462..1cd7d40fad 100755<br>
=C2=A0=C2=A0 --- a/python/tests/flake8.sh<br>
=C2=A0=C2=A0 +++ b/python/tests/flake8.sh<br>
=C2=A0=C2=A0 @@ -1,2 +1,2 @@<br>
=C2=A0=C2=A0=C2=A0 #!/bin/sh -e<br>
=C2=A0=C2=A0 -python3 -m flake8<br>
=C2=A0=C2=A0 +python3 -m flake8 qemu/<br>
<br>
... to ensure flake8 parses only the files from the &#39;qemu&#39; director=
y <br>
(btw, this is how tests/pylint.sh is configured). I prefer the later.<br></=
div></blockquote><div><br></div><div>Augh, oops. Good spot ...<br></div><di=
v><br></div><div>OK, i&#39;ll just update the canonical flake8 invocation i=
nstead. I can remove the .venv and .tox stuff in the flake8 section in setu=
p.cfg, too.<br></div></div></div>

--00000000000039ddb305c5eb257f--


