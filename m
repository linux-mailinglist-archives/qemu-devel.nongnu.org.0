Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6E40C7C2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:57:07 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWLS-0003g9-8V
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQWFq-0004Rc-5d
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQWFZ-0001NG-0d
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1VaxMp60fs54oW0tlE8/U57xFZSTNdpQ+WTiFQb2flk=;
 b=KlYmQUtevTLfgn2B59Ld+3DPFGdA3scLza+vAp+i1Exa77lRcoUL+zeURmPZyc3hFsQ4q5
 ITL6JHtCNi+MrkQhXMcp4p40IGyOaETdWXIcmL0zXRknPNCUICV0b7VxjEs8gKZEA14VDA
 ebyb3xo88b0DnmRTB2I/pchqaDt7MaQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-C95wr9DZOMCbanqzlGn9tw-1; Wed, 15 Sep 2021 10:50:58 -0400
X-MC-Unique: C95wr9DZOMCbanqzlGn9tw-1
Received: by mail-oo1-f72.google.com with SMTP id
 m4-20020a4ae3c4000000b00291a653baceso2229047oov.21
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1VaxMp60fs54oW0tlE8/U57xFZSTNdpQ+WTiFQb2flk=;
 b=cQ53bcbnAQ5mvppokn/I1PWy03i083x6Jpcdgr4wAudrtbyVsWmn4XllUe/zJVf1q5
 E4GzCOSUC0odXO72e3AbvBXvSV9sP8wWu5kHK8oUOqs/idJhYIWNDJpkljReNtk1Ryjl
 CxtSQmEanBfZcfUoBaszXL4GJF6meUKzXmCc7jmmmSWcmYebd8siKjCiZTqFbaACz5S3
 icbA8bt4TAu9zrzvZMaskIW05EGjFfWqwu+S09fRhUoCol0vSeF/Hqza1hZwK1CnorGC
 iiYnEoMfEiVwfUNtzhkpxO8YOdIx9Jbe3kPxppszekhb1A9UqIb8ZX5Rm+njIJ9gmUnw
 sumg==
X-Gm-Message-State: AOAM531H2cyCveXaA2r/6hA8aAAN02RF4c5KzdyGAUl0rtL/aEXxggYv
 rQioR6JgUipb8pRaY5Pdd9RBJ3+nhQCrz/fr3+m6YSh39SG7wTX2Gj2NctfBuBAZs8sOCuYHMOJ
 xxIYxL6mdsQGozbhJBmUrafVtMyGTDRg=
X-Received: by 2002:a9d:a12:: with SMTP id 18mr286695otg.252.1631717458082;
 Wed, 15 Sep 2021 07:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPQN+okiTULW9dZYrWgtVh+JriBHzxvFpzGnMS3sCHAWVLzcXDmcYoknvDc8NWKTjzQgzIXsW9TNZTb88SKcg=
X-Received: by 2002:a9d:a12:: with SMTP id 18mr286670otg.252.1631717457841;
 Wed, 15 Sep 2021 07:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210831123809.1107782-1-armbru@redhat.com>
 <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
 <87mtoxwuw8.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtoxwuw8.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Sep 2021 10:50:47 -0400
Message-ID: <CAFn=p-YCi+UYcwU1nKaNTjq8SLLzD+jDrPPZy61b7U23G07PcA@mail.gmail.com>
Subject: Re: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000072e02d05cc09d3e1"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000072e02d05cc09d3e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 10:28 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Markus Armbruster (12):
> >>   qapi: Simplify QAPISchemaIfCond's interface for generating C
> >>   qapi: Simplify how QAPISchemaIfCond represents "no condition"
> >>   tests/qapi-schema: Correct two 'if' conditionals
> >>   tests/qapi-schema: Demonstrate broken C code for 'if'
> >>   qapi: Fix C code generation for 'if'
> >>   qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
> >>   qapi: Avoid redundant parens in code generated for conditionals
> >>   qapi: Use "not COND" instead of "!COND" for generated documentation
> >>   qapi: Use re.fullmatch() where appropriate
> >>   tests/qapi-schema: Hide OrderedDict in test output
> >>   qapi: Tweak error messages for missing / conflicting meta-type
> >>   qapi: Tweak error messages for unknown / conflicting 'if' keys
> >>
> >>  scripts/qapi/common.py                  | 51 ++++++++++++++----------=
-
> >>  scripts/qapi/expr.py                    | 32 +++++++---------
> >>  scripts/qapi/gen.py                     |  6 +--
> >>  scripts/qapi/introspect.py              |  6 +--
> >>  scripts/qapi/schema.py                  | 12 +++++-
> >>  scripts/qapi/types.py                   | 22 +++++------
> >>  scripts/qapi/visit.py                   | 14 +++----
> >>  tests/qapi-schema/bad-if-key.err        |  2 +-
> >>  tests/qapi-schema/bad-if-keys.err       |  2 +-
> >>  tests/qapi-schema/doc-good.json         |  2 +-
> >>  tests/qapi-schema/doc-good.out          |  6 +--
> >>  tests/qapi-schema/doc-good.txt          |  8 ++--
> >>  tests/qapi-schema/double-type.err       |  4 +-
> >>  tests/qapi-schema/enum-if-invalid.err   |  2 +-
> >>  tests/qapi-schema/missing-type.err      |  2 +-
> >>  tests/qapi-schema/qapi-schema-test.json |  9 +++--
> >>  tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
> >>  tests/qapi-schema/test-qapi.py          | 11 +++++-
> >>  18 files changed, 118 insertions(+), 104 deletions(-)
> >>
> >>
> > The first patch, you should apply isort
>
> Will fix.
>
> > The first patch, you should apply isort (we should have a check for tha=
t
> > and linters I suppose).
>
> John will get us there.
>
>
The goal is to move scripts/qapi to python/qemu/qapi where it will be
covered by the tests that exist there.
Try going to the python/ directory and run 'make' to see help output on
what tests are available and how to invoke them, and what they actually
test.

"make check-dev" is the target that requires the least amount of
dependencies and environment setup to run, and should be nearly push-button
in most environments.
'make check-tox' and 'make check-pipenv' are executed by GitlabCI as
check-python-tox and check-python-pipenv, respectively.

In the meantime, I've been running tests against qapi manually -- with the
scripts I included in my 'python-qapi-cleanup-pt0' branch.

--js

--00000000000072e02d05cc09d3e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 10:28 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" targ=
et=3D"_blank">marcandre.lureau@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Markus Armbruster (12):<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Simplify QAPISchemaIfCond&#39;s interface for ge=
nerating C<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Simplify how QAPISchemaIfCond represents &quot;n=
o condition&quot;<br>
&gt;&gt;=C2=A0 =C2=A0tests/qapi-schema: Correct two &#39;if&#39; conditiona=
ls<br>
&gt;&gt;=C2=A0 =C2=A0tests/qapi-schema: Demonstrate broken C code for &#39;=
if&#39;<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Fix C code generation for &#39;if&#39;<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Factor common recursion out of cgen_ifcond(), do=
cgen_ifcond()<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Avoid redundant parens in code generated for con=
ditionals<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Use &quot;not COND&quot; instead of &quot;!COND&=
quot; for generated documentation<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Use re.fullmatch() where appropriate<br>
&gt;&gt;=C2=A0 =C2=A0tests/qapi-schema: Hide OrderedDict in test output<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Tweak error messages for missing / conflicting m=
eta-type<br>
&gt;&gt;=C2=A0 =C2=A0qapi: Tweak error messages for unknown / conflicting &=
#39;if&#39; keys<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 51 ++++++++++++++-----------<br>
&gt;&gt;=C2=A0 scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 +++++++---------<br>
&gt;&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt;&gt;=C2=A0 scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 6 +--<br>
&gt;&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++-<br>
&gt;&gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++------<br>
&gt;&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++----<br>
&gt;&gt;=C2=A0 tests/qapi-schema/bad-if-key.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/bad-if-keys.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +--<br>
&gt;&gt;=C2=A0 tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++--<br>
&gt;&gt;=C2=A0 tests/qapi-schema/double-type.err=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/enum-if-invalid.err=C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/missing-type.err=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json |=C2=A0 9 +++--<br>
&gt;&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.out=C2=A0 | 31 ++++++++--=
-----<br>
&gt;&gt;=C2=A0 tests/qapi-schema/test-qapi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 +++++-<br>
&gt;&gt;=C2=A0 18 files changed, 118 insertions(+), 104 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; The first patch, you should apply isort<br>
<br>
Will fix.<br>
<br>
&gt; The first patch, you should apply isort (we should have a check for th=
at<br>
&gt; and linters I suppose).<br>
<br>
John will get us there.<br>
<br></blockquote><div><br></div><div><div>The goal is to move scripts/qapi =
to python/qemu/qapi where it will be covered by the tests that exist there.=
</div><div>Try going to the python/ directory and run &#39;make&#39; to see=
 help output on what tests are available and how to invoke them, and what t=
hey actually test.<br></div><div><br></div><div>&quot;make check-dev&quot; =
is the target that requires the least amount of dependencies and environmen=
t setup to run, and should be nearly push-button in most environments.</div=
><div>&#39;make check-tox&#39; and &#39;make check-pipenv&#39; are executed=
 by GitlabCI as check-python-tox and check-python-pipenv, respectively.</di=
v><div><br></div><div>In the meantime, I&#39;ve been running tests against =
qapi manually -- with the scripts I included in my &#39;python-qapi-cleanup=
-pt0&#39; branch.<br></div></div><div><div><br></div><div>--js</div></div><=
/div></div>

--00000000000072e02d05cc09d3e1--


