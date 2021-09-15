Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C353F40C7E9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:12:00 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWZr-0000yc-Sw
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mQWWQ-00055j-U6
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mQWWO-0000hu-QP
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631718503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Ei2dwuxTq4L/RK9XHN3r43TONtHyME8hsCQMchyXz8=;
 b=ZEP2DBEnMB9Oj6NibS6LBhWFhndqsf+pFqH9ZnTH87rVJnqXcAv2+qQxtFjXTujveinur8
 ZGlbvvNwOb/PbeINccIp0nHJncmK9jl2i29qwsmCNI4X6FeIDxPK/HLRd34QPPgZZxhwMB
 rVn8gDjNxt5uSzjYV7IwXd4Kk7F/Q2o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-2vC6zw5DNiuRUSV14WQu0w-1; Wed, 15 Sep 2021 11:08:21 -0400
X-MC-Unique: 2vC6zw5DNiuRUSV14WQu0w-1
Received: by mail-pj1-f72.google.com with SMTP id
 n3-20020a17090a394300b0019765b9bd7bso1901645pjf.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 08:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Ei2dwuxTq4L/RK9XHN3r43TONtHyME8hsCQMchyXz8=;
 b=fGDJRMh6uJSfTgD30jXh/xSHcUOs1Y9g/CkkNHBAIUpNcc3/pSFDnqkESVTNUGYScC
 thNTRR3b+YYJCn6K8+AwLHftK5DcB979vh5kJPkwTqnyhp4nkzl4z/UeZ8uSXOZXzfzr
 5y88YbU8/fz/OgS3aMzD7di9WLORFPfIZNuDHycpHLhtDGw1Cyz+/+TFfLRHqttawttL
 v6jc7Tr5/dGmN/YwYQjgiyQKz9bklJPt1R4/cP/+aPPBDVdv1Xb9Kd0YR6m60E5zyeu7
 N9ZQA5Pq1C8Jr79/p495xHKrpdhwUSE5JtbCpP5knktHvGd+ccJZ7SC96QRmeP6qLeku
 Ya8w==
X-Gm-Message-State: AOAM532XkfEZ9v2FlZ6XSvu/5BD/JpWFKQnxsfUaOOhDD5tD/ECNGZZr
 hcfuoGNZesmvXYp7GTVCFdMmVrAJswaIMlFmYUtYGkQTn113bHCk7VL7ktwkp30h2pSabm0Hh/Q
 TplUfEspsCRbVARrkyC6WxuQ0VjM94hQ=
X-Received: by 2002:a63:e64a:: with SMTP id p10mr209872pgj.263.1631718500480; 
 Wed, 15 Sep 2021 08:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw6PFuLB6jGZjG2lc/zhHPbaqzBPNteF0+tayb0QTLTo6kRJzgfJILwt07ct/X4YiSbHELWzUXrrXMkvk64jQ=
X-Received: by 2002:a63:e64a:: with SMTP id p10mr209849pgj.263.1631718500144; 
 Wed, 15 Sep 2021 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210831123809.1107782-1-armbru@redhat.com>
 <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
 <87mtoxwuw8.fsf@dusky.pond.sub.org>
 <CAFn=p-YCi+UYcwU1nKaNTjq8SLLzD+jDrPPZy61b7U23G07PcA@mail.gmail.com>
In-Reply-To: <CAFn=p-YCi+UYcwU1nKaNTjq8SLLzD+jDrPPZy61b7U23G07PcA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 15 Sep 2021 19:08:09 +0400
Message-ID: <CAMxuvay00M-n-iAj_Q_houF=-Wg4ci=L5PS40Y5xeC5QS1yydw@mail.gmail.com>
Subject: Re: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000932b5205cc0a1159"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000932b5205cc0a1159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 15, 2021 at 6:51 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Tue, Aug 31, 2021 at 10:28 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>>
>> > On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster <armbru@redhat.com>
>> wrote:
>> >
>> >> Markus Armbruster (12):
>> >>   qapi: Simplify QAPISchemaIfCond's interface for generating C
>> >>   qapi: Simplify how QAPISchemaIfCond represents "no condition"
>> >>   tests/qapi-schema: Correct two 'if' conditionals
>> >>   tests/qapi-schema: Demonstrate broken C code for 'if'
>> >>   qapi: Fix C code generation for 'if'
>> >>   qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond()
>> >>   qapi: Avoid redundant parens in code generated for conditionals
>> >>   qapi: Use "not COND" instead of "!COND" for generated documentation
>> >>   qapi: Use re.fullmatch() where appropriate
>> >>   tests/qapi-schema: Hide OrderedDict in test output
>> >>   qapi: Tweak error messages for missing / conflicting meta-type
>> >>   qapi: Tweak error messages for unknown / conflicting 'if' keys
>> >>
>> >>  scripts/qapi/common.py                  | 51 ++++++++++++++---------=
--
>> >>  scripts/qapi/expr.py                    | 32 +++++++---------
>> >>  scripts/qapi/gen.py                     |  6 +--
>> >>  scripts/qapi/introspect.py              |  6 +--
>> >>  scripts/qapi/schema.py                  | 12 +++++-
>> >>  scripts/qapi/types.py                   | 22 +++++------
>> >>  scripts/qapi/visit.py                   | 14 +++----
>> >>  tests/qapi-schema/bad-if-key.err        |  2 +-
>> >>  tests/qapi-schema/bad-if-keys.err       |  2 +-
>> >>  tests/qapi-schema/doc-good.json         |  2 +-
>> >>  tests/qapi-schema/doc-good.out          |  6 +--
>> >>  tests/qapi-schema/doc-good.txt          |  8 ++--
>> >>  tests/qapi-schema/double-type.err       |  4 +-
>> >>  tests/qapi-schema/enum-if-invalid.err   |  2 +-
>> >>  tests/qapi-schema/missing-type.err      |  2 +-
>> >>  tests/qapi-schema/qapi-schema-test.json |  9 +++--
>> >>  tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
>> >>  tests/qapi-schema/test-qapi.py          | 11 +++++-
>> >>  18 files changed, 118 insertions(+), 104 deletions(-)
>> >>
>> >>
>> > The first patch, you should apply isort
>>
>> Will fix.
>>
>> > The first patch, you should apply isort (we should have a check for th=
at
>> > and linters I suppose).
>>
>> John will get us there.
>>
>>
> The goal is to move scripts/qapi to python/qemu/qapi where it will be
> covered by the tests that exist there.
> Try going to the python/ directory and run 'make' to see help output on
> what tests are available and how to invoke them, and what they actually
> test.
>
> "make check-dev" is the target that requires the least amount of
> dependencies and environment setup to run, and should be nearly push-butt=
on
> in most environments.
> 'make check-tox' and 'make check-pipenv' are executed by GitlabCI as
> check-python-tox and check-python-pipenv, respectively.
>
>
What about a pre-commit hook?


> In the meantime, I've been running tests against qapi manually -- with th=
e
> scripts I included in my 'python-qapi-cleanup-pt0' branch.
>
> --js
>

--000000000000932b5205cc0a1159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 6:51 PM Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 10:28 AM Markus Armbruste=
r &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; writes:<br>
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
v><div><br></div></div></div></div></blockquote><div>=C2=A0</div><div>What =
about a pre-commit hook?<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=
<div></div><div>In the meantime, I&#39;ve been running tests against qapi m=
anually -- with the scripts I included in my &#39;python-qapi-cleanup-pt0&#=
39; branch.<br></div></div><div><div><br></div><div>--js</div></div></div><=
/div>
</blockquote></div></div>

--000000000000932b5205cc0a1159--


