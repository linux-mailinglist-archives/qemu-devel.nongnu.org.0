Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AA41E057
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:47:47 +0200 (CEST)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW09n-0004U9-JN
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW06F-0003DT-7o
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW06A-000559-EC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633023837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsTF5mnehphkSzG2f0hmTta+I5wXad0HJMztGJk+xJ0=;
 b=Sf3LL+0BzJxiNj3ZPZWBoCFx8XX8wfPx+qRlsEG4mEEXUFEmXNVcR3VhLlkz+mLm9sq/nN
 z0HhTCyrFv9vjIsaKl/q86W1H/gouFYYtHLuob9yRwT66Obcfv8+f+hNP0lAObn/68kAHC
 yUnsSs5gRnDprY0AP7laIDB3y0dUJw8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-70iStk7ENquRiNdM8A1WdQ-1; Thu, 30 Sep 2021 13:43:53 -0400
X-MC-Unique: 70iStk7ENquRiNdM8A1WdQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 m3-20020a9f3fc3000000b002c9af61bd59so3403015uaj.6
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 10:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LsTF5mnehphkSzG2f0hmTta+I5wXad0HJMztGJk+xJ0=;
 b=S65MvM0/gWLhdZ8W7cpSmMHuhBAd88oqT+fYWLKRVcqtobPG9vwyy/qATwgNjqHTZP
 TTIPSwPg8FqKOSebcuEdFKwiaPoZA54vjFwDhRU0Ro6wH7C90HFnYW9G7x4A6Z1Y1nfz
 hq3oE6S5JUgMG6YXsyQs+xn08l/c4YB3gYM1I5/dKRIoX5T+R99peehXEPaxHOQEJ16J
 hZbSkAJ3MvO7CSUPPo2fcdIocrB1O0TmkPeQY/MSw8s09WwM9N1CQmv8fIphD0tnVt4k
 9CZ8GaF1QCQIapTfHVDNGJ3Fyc7MGM5rzZRPsZszKKbKLVObhO3GBkfiLABXtNZfdYfZ
 evzw==
X-Gm-Message-State: AOAM532i3P2hozbzZSU5fsl4MOcm8XH87OJfC/eCc378ie913605BAuO
 9vCamAehbYQYit29Gj2bQ8cUuTdbsX73bo8gjhQ2WNzUeHmV9jcI/H/UFJHFHxqNn9gc5/NtrLv
 Zof87HpRRNLNd9kIf9qWutZFQnD9Xmjc=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr646984vsu.13.1633023832988; 
 Thu, 30 Sep 2021 10:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqk8MYQ7jHrlHnULkWqbEMHPesRfxopf7OMt8vtMZPwExm7l4EfjmrcOAWeRZ7lHug5hPsowhiCbIU3sHo2jc=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr646952vsu.13.1633023832640; 
 Thu, 30 Sep 2021 10:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-6-jsnow@redhat.com>
 <875yuisbdr.fsf@dusky.pond.sub.org>
In-Reply-To: <875yuisbdr.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Sep 2021 13:43:41 -0400
Message-ID: <CAFn=p-aNkUOMQ0mFoxzEKkYHAQR8u8WbaKP=B3iGPtrK+AM3fw@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] qapi/parser: improve detection of '@symbol:'
 preface
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000074757c05cd39fdc2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074757c05cd39fdc2
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 4:42 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Leading and trailing whitespace are now discarded, addressing the FIXME
> > comment. A new error is raised to detect this accidental case.
> >
> > Parsing for args sections is left alone here; the 'name' variable is
> > moved into the only block where it is used.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Tangentially related to delinting in that removing 'FIXME' comments is a
> > goal for pylint. My goal is to allow 'TODO' to be checked in, but
> > 'FIXME' should be fixed prior to inclusion.
> >
> > Arbitrary, but that's life for you.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py                              | 13 ++++++++-----
> >  tests/qapi-schema/doc-whitespace-leading-symbol.err |  1 +
> >  .../qapi-schema/doc-whitespace-leading-symbol.json  |  6 ++++++
> >  tests/qapi-schema/doc-whitespace-leading-symbol.out |  0
> >  .../qapi-schema/doc-whitespace-trailing-symbol.err  |  1 +
> >  .../qapi-schema/doc-whitespace-trailing-symbol.json |  6 ++++++
> >  .../qapi-schema/doc-whitespace-trailing-symbol.out  |  0
> >  tests/qapi-schema/meson.build                       |  2 ++
> >  8 files changed, 24 insertions(+), 5 deletions(-)
> >  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.err
> >  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.json
> >  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.out
> >  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.err
> >  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.json
> >  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.out
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index bfd2dbfd9a2..2f93a752f66 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -549,18 +549,21 @@ def _append_body_line(self, line):
> >
> >          Else, append the line to the current section.
> >          """
> > -        name = line.split(' ', 1)[0]
> > -        # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
> > -        # recognized, and get silently treated as ordinary text
> > -        if not self.symbol and not self.body.text and
> line.startswith('@'):
> > -            if not line.endswith(':'):
> > +        stripped = line.strip()
> > +
> > +        if not self.symbol and not self.body.text and
> stripped.startswith('@'):
> > +            if not stripped.endswith(':'):
> >                  raise QAPIParseError(self._parser, "line should end
> with ':'")
> > +            if not stripped == line:
> > +                raise QAPIParseError(
> > +                    self._parser, "extra whitespace around symbol
> declaration")
>
> This rejects both leading and trailing whitespace.  Rejecting leading
> whitespace is good.  Rejecting trailing whitespace feels a bit pedantic,
> and it might not extend to the related case I'll point out below.
>
>
err'd on the conservative side. Wasn't sure how permissive we really wanted
to be.


> Have you considered a regexp instead?  Say
>
>            match = re.match(r'(\s*)@([^:]*)(:?)(\s*)(.*)$', line)
>
> Then match.group(n) is
>
>      n=1  leading whitespace, if any
>      n=2  symbol
>      n=3  trailing colon, if any
>      n=4  trailing whitespace, if any
>      n=5  trailing text, if any
>
> Omit the subgroups you don't need.
>
>
Sensible, for a more comprehensive refactoring.


> >              self.symbol = line[1:-1]
> >              # FIXME invalid names other than the empty string aren't
> flagged
> >              if not self.symbol:
> >                  raise QAPIParseError(self._parser, "invalid name")
> >          elif self.symbol:
> >              # This is a definition documentation block
> > +            name = line.split(' ', 1)[0]
> >              if name.startswith('@') and name.endswith(':'):
> >                  self._append_line = self._append_args_line
> >                  self._append_args_line(line)
>
> Same issue here, and in _append_args_line().  To reproduce, I hacked up
> doc-good.json like so
>
>     diff --git a/tests/qapi-schema/doc-good.json
> b/tests/qapi-schema/doc-good.json
>     index 86dc25d2bd..977fcbad48 100644
>     --- a/tests/qapi-schema/doc-good.json
>     +++ b/tests/qapi-schema/doc-good.json
>     @@ -133,7 +133,7 @@
>      ##
>      # @cmd:
>      #
>     -# @arg1: the first argument
>     +#  @arg1: the first argument
>      #
>      # @arg2: the second
>      #        argument
>
> and got
>
>     $ PYTHONPATH=/work/armbru/qemu/scripts python3
> /work/armbru/qemu/tests/qapi-schema/test-qapi.py -d tests/qapi-schema
> doc-good.json
>     doc-good FAIL
>     --- tests/qapi-schema/doc-good.out
>     +++
>     @@ -149,12 +149,12 @@
>      == Another subsection
>      doc symbol=cmd
>          body=
>     -
>     -    arg=arg1
>     -the first argument
>     +@arg1: the first argument
>          arg=arg2
>      the second
>      argument
>     +    arg=arg1
>     +
>          arg=arg3
>
>          feature=cmd-feat1
>
> [...]
>
>
OK, more time in the oven with this one, and I will tackle it separately
and later. Possibly as part of my sphinx-docs work I want to get to soon.
We may drop it from this series to avoid holding it up.

(The FIXME again keeps me honest here ... !)

Thanks for the reviews!
--js

--00000000000074757c05cd39fdc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 4:42 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; Leading and trailing whitespace are now discarded, addressing the FIXM=
E<br>
&gt; comment. A new error is raised to detect this accidental case.<br>
&gt;<br>
&gt; Parsing for args sections is left alone here; the &#39;name&#39; varia=
ble is<br>
&gt; moved into the only block where it is used.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Tangentially related to delinting in that removing &#39;FIXME&#39; com=
ments is a<br>
&gt; goal for pylint. My goal is to allow &#39;TODO&#39; to be checked in, =
but<br>
&gt; &#39;FIXME&#39; should be fixed prior to inclusion.<br>
&gt;<br>
&gt; Arbitrary, but that&#39;s life for you.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++=
+-----<br>
&gt;=C2=A0 tests/qapi-schema/doc-whitespace-leading-symbol.err |=C2=A0 1 +<=
br>
&gt;=C2=A0 .../qapi-schema/doc-whitespace-leading-symbol.json=C2=A0 |=C2=A0=
 6 ++++++<br>
&gt;=C2=A0 tests/qapi-schema/doc-whitespace-leading-symbol.out |=C2=A0 0<br=
>
&gt;=C2=A0 .../qapi-schema/doc-whitespace-trailing-symbol.err=C2=A0 |=C2=A0=
 1 +<br>
&gt;=C2=A0 .../qapi-schema/doc-whitespace-trailing-symbol.json |=C2=A0 6 ++=
++++<br>
&gt;=C2=A0 .../qapi-schema/doc-whitespace-trailing-symbol.out=C2=A0 |=C2=A0=
 0<br>
&gt;=C2=A0 tests/qapi-schema/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 8 files changed, 24 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symb=
ol.err<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symb=
ol.json<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symb=
ol.out<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-sym=
bol.err<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-sym=
bol.json<br>
&gt;=C2=A0 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-sym=
bol.out<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index bfd2dbfd9a2..2f93a752f66 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -549,18 +549,21 @@ def _append_body_line(self, line):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Else, append the line to the current=
 section.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D line.split(&#39; &#39;, 1)[0]<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME not nice: things like &#39;#=C2=
=A0 @foo:&#39; and &#39;# @foo: &#39; aren&#39;t<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # recognized, and get silently treated as=
 ordinary text<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.symbol and not self.body.text=
 and line.startswith(&#39;@&#39;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line.endswith(&#39;:=
&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stripped =3D line.strip()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.symbol and not self.body.text=
 and stripped.startswith(&#39;@&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not stripped.endswith(&#=
39;:&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PIParseError(self._parser, &quot;line should end with &#39;:&#39;&quot;)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not stripped =3D=3D line=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIPar=
seError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 self._parser, &quot;extra whitespace around symbol declaration&quot;)<br>
<br>
This rejects both leading and trailing whitespace.=C2=A0 Rejecting leading<=
br>
whitespace is good.=C2=A0 Rejecting trailing whitespace feels a bit pedanti=
c,<br>
and it might not extend to the related case I&#39;ll point out below.<br>
<br></blockquote><div><br></div><div>err&#39;d on the conservative side. Wa=
sn&#39;t sure how permissive we really wanted to be.<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Have you considered a regexp instead?=C2=A0 Say<br>
<br></blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D re.match(r&#39;(\s*)@([^=
:]*)(:?)(\s*)(.*)$&#39;, line)<br>
<br>
Then match.group(n) is<br>
<br>
=C2=A0 =C2=A0 =C2=A0n=3D1=C2=A0 leading whitespace, if any<br>
=C2=A0 =C2=A0 =C2=A0n=3D2=C2=A0 symbol<br>
=C2=A0 =C2=A0 =C2=A0n=3D3=C2=A0 trailing colon, if any<br>
=C2=A0 =C2=A0 =C2=A0n=3D4=C2=A0 trailing whitespace, if any<br>
=C2=A0 =C2=A0 =C2=A0n=3D5=C2=A0 trailing text, if any<br>
<br>
Omit the subgroups you don&#39;t need.<br>
<br></blockquote><div><br></div><div>Sensible, for a more comprehensive ref=
actoring.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.symbol =3D line[1=
:-1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME invalid names =
other than the empty string aren&#39;t flagged<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.symbol:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PIParseError(self._parser, &quot;invalid name&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.symbol:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is a definition=
 documentation block<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D line.split(&#39; &=
#39;, 1)[0]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.startswith(&#3=
9;@&#39;) and name.endswith(&#39;:&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ap=
pend_line =3D self._append_args_line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ap=
pend_args_line(line)<br>
<br>
Same issue here, and in _append_args_line().=C2=A0 To reproduce, I hacked u=
p<br>
doc-good.json like so<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-sch=
ema/doc-good.json<br>
=C2=A0 =C2=A0 index 86dc25d2bd..977fcbad48 100644<br>
=C2=A0 =C2=A0 --- a/tests/qapi-schema/doc-good.json<br>
=C2=A0 =C2=A0 +++ b/tests/qapi-schema/doc-good.json<br>
=C2=A0 =C2=A0 @@ -133,7 +133,7 @@<br>
=C2=A0 =C2=A0 =C2=A0##<br>
=C2=A0 =C2=A0 =C2=A0# @cmd:<br>
=C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 -# @arg1: the first argument<br>
=C2=A0 =C2=A0 +#=C2=A0 @arg1: the first argument<br>
=C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0# @arg2: the second<br>
=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 argument<br>
<br>
and got<br>
<br>
=C2=A0 =C2=A0 $ PYTHONPATH=3D/work/armbru/qemu/scripts python3 /work/armbru=
/qemu/tests/qapi-schema/test-qapi.py -d tests/qapi-schema doc-good.json<br>
=C2=A0 =C2=A0 doc-good FAIL<br>
=C2=A0 =C2=A0 --- tests/qapi-schema/doc-good.out<br>
=C2=A0 =C2=A0 +++ <br>
=C2=A0 =C2=A0 @@ -149,12 +149,12 @@<br>
=C2=A0 =C2=A0 =C2=A0=3D=3D Another subsection<br>
=C2=A0 =C2=A0 =C2=A0doc symbol=3Dcmd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0body=3D<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 arg=3Darg1<br>
=C2=A0 =C2=A0 -the first argument<br>
=C2=A0 =C2=A0 +@arg1: the first argument<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg=3Darg2<br>
=C2=A0 =C2=A0 =C2=A0the second<br>
=C2=A0 =C2=A0 =C2=A0argument<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 arg=3Darg1<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg=3Darg3<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feature=3Dcmd-feat1<br>
<br>
[...]<br>
<br></blockquote><div><br></div><div>OK, more time in the oven with this on=
e, and I will tackle it separately and later. Possibly as part of my sphinx=
-docs work I want to get to soon. We may drop it from this series to avoid =
holding it up.</div><div><br></div><div>(The FIXME again keeps me honest he=
re ... !)<br></div><div><br></div><div>Thanks for the reviews!</div><div>--=
js<br></div></div></div>

--00000000000074757c05cd39fdc2--


