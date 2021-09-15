Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5340C86B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:40:39 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQX1Z-0001uI-7f
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQX0E-0001DX-Qw
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQX09-0002IO-Rk
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631720348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m9k+jwa4suiD2VrkgSppJ3RqxHZJM/jT4dySR6zMZE=;
 b=PAUIaTnKhBUNEv/M+QSE/quUFIGEh+dGzZjjxuQTkIhXeRhpLCwOnBYGHEdTI6vBy2Iews
 naUYvxuX5aJu6hujA489nsSaUaAFDF2FYyEKdSybHNDOvYc+CSUCUniUnSXRzf8Pa2G7T1
 lzKdLWMwQoYRocKSG296aQgrSEyHXCA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-_8e7ryvZOBitIllIZhZk4w-1; Wed, 15 Sep 2021 11:39:07 -0400
X-MC-Unique: _8e7ryvZOBitIllIZhZk4w-1
Received: by mail-ot1-f70.google.com with SMTP id
 i7-20020a9d6507000000b0051c10643794so2808078otl.22
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 08:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m9k+jwa4suiD2VrkgSppJ3RqxHZJM/jT4dySR6zMZE=;
 b=zXwyEG0MeyXPvFl+AXDERtQcz0H2gaPlgy0OFea6ajg1B/KA0VJ4LPEZkGc8JdUH4P
 92Z4h1shxz9fekmzN7VGViD7kyYC7uevnZwgiEBoQRbqHhP+mQ49cl3hiFaE82oI7Gn0
 a0HAmKaF880WttX6Beu4NEwDF+wwsFg+aRi+/WpgorLwPjCNhmIUkD/aLzz2/WwXjuDu
 6io6oC2Rr38OGmKWyBy4+Euvf+CzbnouFL2libEonU+KPVB17aSCfx/JczlroSXQqsUy
 P2Z/87Xqwd9pYKc8tMAt2LX4Iax5rJqe7R9C9Or1/AQ6wYYOAgCWtBAGn2aZRMC3wGlT
 c7TQ==
X-Gm-Message-State: AOAM5318CBZEJG+vkxfcgkIzHtkFmMF/x7O9hqpnzdLL3q8EW4KHG6Za
 nmmhNbg8GRVUrbR8yJBOphlnO615q87ukUGFAhkF7VtWg7TaylMY6u4lP4iHB848gloh03Beh48
 hs7AYg1JmPR3ncM4qZOnZ8nuhNdGaeYk=
X-Received: by 2002:a05:6808:a01:: with SMTP id n1mr216937oij.52.1631720346526; 
 Wed, 15 Sep 2021 08:39:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ7TdQiI5WvUOo0iQTvwJvQ+0GxfDB/f5JbIA9O1M3gQzuCGJpysfrwhc6H0gtKD4ofLk9AtPu4IPTj9vrMo0=
X-Received: by 2002:a05:6808:a01:: with SMTP id n1mr215014oij.52.1631720316373; 
 Wed, 15 Sep 2021 08:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210831123809.1107782-1-armbru@redhat.com>
 <CAMxuvaxLTknvV3k_J4OtTWB2MjL6tj_2AH-0=NV7QbZLwFwOWA@mail.gmail.com>
 <87mtoxwuw8.fsf@dusky.pond.sub.org>
 <CAFn=p-YCi+UYcwU1nKaNTjq8SLLzD+jDrPPZy61b7U23G07PcA@mail.gmail.com>
 <CAMxuvay00M-n-iAj_Q_houF=-Wg4ci=L5PS40Y5xeC5QS1yydw@mail.gmail.com>
In-Reply-To: <CAMxuvay00M-n-iAj_Q_houF=-Wg4ci=L5PS40Y5xeC5QS1yydw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Sep 2021 11:38:25 -0400
Message-ID: <CAFn=p-a3EYj-YJ2whigVt3=DkYPen5hVDZCdffXa0px_sn7FNQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] qapi: Fixes and cleanups for recent work (mostly)
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d49c0405cc0a7d55"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

--000000000000d49c0405cc0a7d55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 11:08 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Wed, Sep 15, 2021 at 6:51 PM John Snow <jsnow@redhat.com> wrote:
>
>>
>>
>> On Tue, Aug 31, 2021 at 10:28 AM Markus Armbruster <armbru@redhat.com>
>> wrote:
>>
>>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>>>
>>> > On Tue, Aug 31, 2021 at 4:38 PM Markus Armbruster <armbru@redhat.com>
>>> wrote:
>>> >
>>> >> Markus Armbruster (12):
>>> >>   qapi: Simplify QAPISchemaIfCond's interface for generating C
>>> >>   qapi: Simplify how QAPISchemaIfCond represents "no condition"
>>> >>   tests/qapi-schema: Correct two 'if' conditionals
>>> >>   tests/qapi-schema: Demonstrate broken C code for 'if'
>>> >>   qapi: Fix C code generation for 'if'
>>> >>   qapi: Factor common recursion out of cgen_ifcond(), docgen_ifcond(=
)
>>> >>   qapi: Avoid redundant parens in code generated for conditionals
>>> >>   qapi: Use "not COND" instead of "!COND" for generated documentatio=
n
>>> >>   qapi: Use re.fullmatch() where appropriate
>>> >>   tests/qapi-schema: Hide OrderedDict in test output
>>> >>   qapi: Tweak error messages for missing / conflicting meta-type
>>> >>   qapi: Tweak error messages for unknown / conflicting 'if' keys
>>> >>
>>> >>  scripts/qapi/common.py                  | 51
>>> ++++++++++++++-----------
>>> >>  scripts/qapi/expr.py                    | 32 +++++++---------
>>> >>  scripts/qapi/gen.py                     |  6 +--
>>> >>  scripts/qapi/introspect.py              |  6 +--
>>> >>  scripts/qapi/schema.py                  | 12 +++++-
>>> >>  scripts/qapi/types.py                   | 22 +++++------
>>> >>  scripts/qapi/visit.py                   | 14 +++----
>>> >>  tests/qapi-schema/bad-if-key.err        |  2 +-
>>> >>  tests/qapi-schema/bad-if-keys.err       |  2 +-
>>> >>  tests/qapi-schema/doc-good.json         |  2 +-
>>> >>  tests/qapi-schema/doc-good.out          |  6 +--
>>> >>  tests/qapi-schema/doc-good.txt          |  8 ++--
>>> >>  tests/qapi-schema/double-type.err       |  4 +-
>>> >>  tests/qapi-schema/enum-if-invalid.err   |  2 +-
>>> >>  tests/qapi-schema/missing-type.err      |  2 +-
>>> >>  tests/qapi-schema/qapi-schema-test.json |  9 +++--
>>> >>  tests/qapi-schema/qapi-schema-test.out  | 31 ++++++++-------
>>> >>  tests/qapi-schema/test-qapi.py          | 11 +++++-
>>> >>  18 files changed, 118 insertions(+), 104 deletions(-)
>>> >>
>>> >>
>>> > The first patch, you should apply isort
>>>
>>> Will fix.
>>>
>>> > The first patch, you should apply isort (we should have a check for
>>> that
>>> > and linters I suppose).
>>>
>>> John will get us there.
>>>
>>>
>> The goal is to move scripts/qapi to python/qemu/qapi where it will be
>> covered by the tests that exist there.
>> Try going to the python/ directory and run 'make' to see help output on
>> what tests are available and how to invoke them, and what they actually
>> test.
>>
>> "make check-dev" is the target that requires the least amount of
>> dependencies and environment setup to run, and should be nearly push-but=
ton
>> in most environments.
>> 'make check-tox' and 'make check-pipenv' are executed by GitlabCI as
>> check-python-tox and check-python-pipenv, respectively.
>>
>>
> What about a pre-commit hook?
>

"patches welcome" ? There are other python tests likely to go here in the
future too, so it might be too costly to run as a commit hook. YMMV.

--js

--000000000000d49c0405cc0a7d55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 11:08 AM Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 1=
5, 2021 at 6:51 PM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, A=
ug 31, 2021 at 10:28 AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Marc-Andr=C3=A9 Lureau &lt;<a hr=
ef=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lurea=
u@redhat.com</a>&gt; writes:<br>
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
about a pre-commit hook?<br></div></div></div></blockquote><br></div><div c=
lass=3D"gmail_quote">&quot;patches welcome&quot; ? There are other python t=
ests likely to go here in the future too, so it might be too costly to run =
as a commit hook. YMMV.<br></div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">--js<div><br></div></div></div>

--000000000000d49c0405cc0a7d55--


