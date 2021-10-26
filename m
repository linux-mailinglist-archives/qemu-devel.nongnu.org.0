Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FE43B9DE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:44:43 +0200 (CEST)
Received: from localhost ([::1]:33324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRRC-0000qg-Po
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRDv-0003Gl-Od
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRDq-0000rk-59
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635273049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBK6uG5OKiFZIQ4tstpOWEBfJPlPKxEo/Y0GnK/E2Ag=;
 b=WCh+kiHJIGSyV18L5Y5SPmlVE5H2EJ9Ag550zeVGOGdf+HPCXxvof6Tr2FAFVY0HTKLaTm
 TYcbWPtzND3cyzp7yNjYD5TPdmgCsv0YYLUOFa+YIDegb/qchVwOlS+vjfvTSfcpJ2NhyA
 1SjVPPe8FORCpCYrHAyDXMoUe6brDVE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-dVvxRd_QP4mcNc87dqSQ0g-1; Tue, 26 Oct 2021 14:30:46 -0400
X-MC-Unique: dVvxRd_QP4mcNc87dqSQ0g-1
Received: by mail-vk1-f200.google.com with SMTP id
 u3-20020ac5ca83000000b002dc67dedc04so141286vkk.20
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBK6uG5OKiFZIQ4tstpOWEBfJPlPKxEo/Y0GnK/E2Ag=;
 b=NCIoR+E4sq8JxLZXDUfdwRseD3rjAkWOwFTHoNdVVPgABFSVIeKiepYeygBHE94nGZ
 ErTuvMqVhS8qL6CdoKKjlkOhSg4WDjlaXadcz1V79zoMxMhUh8rRv1IRhQoWqhQX0p2o
 2MOk3IP9PNAP/HRzaRw4FVtxIOPAjC9BCbiOUzPGabOfsVXa2ZW7Bo5QxlOltTa/GW6t
 aiyr4jUmT1lHF85reEnT9ZXu//l0spRn3Fjq5CVP+1esbT8uoWYrb3GIKBqNFW0aqicl
 lhC3twlXwopFjvZu67Bz897sO6NUlG5LDae6i7bExIfRKt5GOWZZ8NuLkOGJdBtVi+qy
 3yiQ==
X-Gm-Message-State: AOAM530Y8BSwy8Rk8N5HyJjOF6Da6IQjo0MKGfek74Flqhn56pHm8K1x
 M/a0NoZoWaA+YjXSZ6WnS/5ifK42X8Yg5VJHHBaE7PQwHiUGOlQo5ZDE2HkjWM0+AKo3reCgouN
 k+IdDFgWyFFAei+xUriljtj6vfsRgMys=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1243454vkd.10.1635273045498; 
 Tue, 26 Oct 2021 11:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRHzypq+iYF/U4YNUA3VXTGlbcfzStb0k+HjvUc+Wfq2w/pu6W8juXloCYwtMsDqlFs5UC99LfZskLjeX1p/E=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1243421vkd.10.1635273045226; 
 Tue, 26 Oct 2021 11:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-12-jsnow@redhat.com>
 <ebded478-63ee-a2d2-7b90-d6d6926d9291@redhat.com>
In-Reply-To: <ebded478-63ee-a2d2-7b90-d6d6926d9291@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 14:30:34 -0400
Message-ID: <CAFn=p-agMGtbryADMxgiG5OLFSXyZd+Zf9YrJyyyRVXgN2UGgA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] iotests: split linters.py out from 297
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f8d26f05cf45ac20"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8d26f05cf45ac20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 6:51 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 19.10.21 16:49, John Snow wrote:
> > Now, 297 is just the iotests-specific incantations and linters.py is as
> > minimal as I can think to make it. The only remaining element in here
> > that ought to be configuration and not code is the list of skip files,
> > but they're still numerous enough that repeating them for mypy and
> > pylint configurations both would be ... a hassle.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297        | 72 +++++----------------------------
> >   tests/qemu-iotests/linters.py | 76 ++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 87 insertions(+), 61 deletions(-)
> >   create mode 100644 tests/qemu-iotests/linters.py
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
Thanks!


> I wonder about `check_linter()`, though.  By not moving it to
> linters.py, we can=E2=80=99t use it in its entry point, and so the Python=
 test
> infrastructure will have a strong dependency on these linters. Though
> then again, it probably already does, and I suppose that=E2=80=99s one of=
 the
> points hindering us from running this from make check?
>
>
That one is left behind because it uses iotests API to skip a test.
Environment setup that guarantees we won't *need* to skip the test is
handled by the virtual environment setup magic in qemu/python/Makefile.


> Hanna
>

More info than you require:

There's maybe about four ways you could run the python tests that might
make sense depending on who you are and what you're trying to accomplish;
they're documented in "make help" and again in qemu/python/README.rst;

(1) make check-dev -- makes a venv with whatever python you happen to have,
installs the latest packages, runs the tests
(2) make check-pipenv -- requires python 3.6 specifically, installs the
*oldest* packages, runs the tests
(3) make check-tox -- requires python 3.6 through 3.10, installs the newest
packages, runs the tests per each python version
(4) make check -- perform no setup at all, just run the tests in the
current environment. (Used directly by all three prior invocations)

In general, I assume that human beings that aren't working on Python stuff
actively will be using (1) at their interactive console, if they decide to
run any of these at all. It imposes the least pre-requirements while still
endeavoring to be a target that will "just work".
Options (2) and (3) are what power the CI tests 'check-python-pipenv' and
'check-python-tox', respectively; with(2) being the one that actually gates
the CI.
Option (4) is only really a convenience for bypassing the venv-setup stuff
if you want to construct your own (or not use one at all). So the tests
just assume that the tools they have available will work. It's kind of a
'power user' target.

The way the CI works at the moment is that it uses a "fedora:latest" base
image and installs python interpreters 3.6 through 3.10 inclusive, pipenv,
and tox. From there, it has enough juice to run the makefile targets which
take care of all of the actual linting dependencies and their different
versions to get a wider matrix on the version testing to ensure we're still
keeping compatibility with the 3.6 platform while also checking for new
problems that show up on the bleeding edge.

iotests 297 right now doesn't do any python environment setup at all, so we
can't guarantee that the linters are present, so we decide to allow the
test to be skipped. My big hesitation of adding this test directly into
'make check' is that I will need to do some environment probing to make
sure that the 'pylint' version isn't too old -- or otherwise set up a venv
in the build directory that can be used to run tests. I know we already set
one up for the acceptance tests, so maybe there's an opportunity to re-use
that venv, but I need to make sure that the dependencies between the two
sets of tests are aligned. I don't know if they agree, currently.

I think I probably want to minimize the number of different virtual python
environments we create during the build, so I will look into what problems
might exist in re-purposing the acceptance test venv. If that can get
squared away easily, there's likely no real big barrier to adding more
tests that rely on a python venv to get cooking during the normal
build/check process, including iotest 297.

--js

--000000000000f8d26f05cf45ac20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 6:51 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.10.2=
1 16:49, John Snow wrote:<br>
&gt; Now, 297 is just the iotests-specific incantations and linters.py is a=
s<br>
&gt; minimal as I can think to make it. The only remaining element in here<=
br>
&gt; that ought to be configuration and not code is the list of skip files,=
<br>
&gt; but they&#39;re still numerous enough that repeating them for mypy and=
<br>
&gt; pylint configurations both would be ... a hassle.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 72 +++=
++----------------------------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 76 +++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 87 insertions(+), 61 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iotests/linters.py<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks!<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
I wonder about `check_linter()`, though.=C2=A0 By not moving it to <br>
linters.py, we can=E2=80=99t use it in its entry point, and so the Python t=
est <br>
infrastructure will have a strong dependency on these linters. Though <br>
then again, it probably already does, and I suppose that=E2=80=99s one of t=
he <br>
points hindering us from running this from make check?<br>
<br></blockquote><div><br></div><div>That one is left behind because it use=
s iotests API to skip a test. Environment setup that guarantees we won&#39;=
t *need* to skip the test is handled by the virtual environment setup magic=
 in qemu/python/Makefile.<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Hanna<br></blockquote><div><br></div><div>More info than you require:</div>=
<div><br></div></div><div class=3D"gmail_quote">There&#39;s maybe about fou=
r ways you could run the python tests that might make sense depending on wh=
o you are and what you&#39;re trying to accomplish; they&#39;re documented =
in &quot;make help&quot; and again in qemu/python/README.rst;<br></div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">(1) make check-=
dev -- makes a venv with whatever python you happen to have, installs the l=
atest packages, runs the tests<br></div><div class=3D"gmail_quote">(2) make=
 check-pipenv -- requires python 3.6 specifically, installs the *oldest* pa=
ckages, runs the tests<br></div><div class=3D"gmail_quote">(3) make check-t=
ox -- requires python 3.6 through 3.10, installs the newest packages, runs =
the tests per each python version<br></div><div class=3D"gmail_quote">(4) m=
ake check -- perform no setup at all, just run the tests in the current env=
ironment. (Used directly by all three prior invocations)<br></div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">In general, I assume=
 that human beings that aren&#39;t working on Python stuff actively will be=
 using (1) at their interactive console, if they decide to run any of these=
 at all. It imposes the least pre-requirements while still endeavoring to b=
e a target that will &quot;just work&quot;.<br></div><div class=3D"gmail_qu=
ote">Options (2) and (3) are what power the CI tests &#39;check-python-pipe=
nv&#39;=20
and &#39;check-python-tox&#39;, respectively; with(2) being=20
the one that actually gates the CI.<br></div><div class=3D"gmail_quote">Opt=
ion (4) is only really a convenience for bypassing the venv-setup stuff if =
you want to construct your own (or not use one at all). So the tests just a=
ssume that the tools they have available will work. It&#39;s kind of a &#39=
;power user&#39; target.<br></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">The way the CI works at the moment is that it uses a=
 &quot;fedora:latest&quot; base image and installs python interpreters 3.6 =
through 3.10 inclusive, pipenv, and tox. From there, it has enough juice to=
 run the makefile targets which take care of all of the actual linting depe=
ndencies and their different versions to get a wider matrix on the version =
testing to ensure we&#39;re still keeping compatibility with the 3.6 platfo=
rm while also checking for new problems that show up on the bleeding edge.<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">iotest=
s 297 right now doesn&#39;t do any python environment setup at all, so we c=
an&#39;t guarantee that the linters are present, so we decide to allow the =
test to be skipped. My big hesitation of adding this test directly into &#3=
9;make check&#39; is that I will need to do some environment probing to mak=
e sure that the &#39;pylint&#39; version isn&#39;t too old -- or otherwise =
set up a venv in the build directory that can be used to run tests. I know =
we already set one up for the acceptance tests, so maybe there&#39;s an opp=
ortunity to re-use that venv, but I need to make sure that the dependencies=
 between the two sets of tests are aligned. I don&#39;t know if they agree,=
 currently.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_q=
uote">I think I probably want to minimize the number of different virtual p=
ython environments we create during the build, so I will look into what pro=
blems might exist in re-purposing the acceptance test venv. If that can get=
 squared away easily, there&#39;s likely no real big barrier to adding more=
 tests that rely on a python venv to get cooking during the normal build/ch=
eck process, including iotest 297.</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">--js<br></div></div>

--000000000000f8d26f05cf45ac20--


