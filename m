Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656841E016
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:23:28 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzmI-00035X-GF
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzkE-0001mX-Vz
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVzkA-0002Cb-4V
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633022472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=biaV+fDSeKoR3XFlMjo3WvN53073Uls9ThF0qIzDSAs=;
 b=GxUp9vn39u8EeyXrn2ot0RswlcbH2w9tyeVeGVi6tzVaab+fRE8efuoWk3Dlg7dIF4Qmnc
 hErRe56ehC7SuCPa4+lvUAFh0wdiC6H8SQtthxZ3Ty3/dHXkhR70LXfKq+SEbX5K+qIm3N
 +2jxHUA62rekKpaJnMpi/uMLRiAJ2M8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-q0nBtsCbNcqKepxHgaeKtQ-1; Thu, 30 Sep 2021 13:21:10 -0400
X-MC-Unique: q0nBtsCbNcqKepxHgaeKtQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 bi54-20020a05612218b600b0029578be32dfso2101004vkb.18
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 10:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biaV+fDSeKoR3XFlMjo3WvN53073Uls9ThF0qIzDSAs=;
 b=QFNzkCKVtj9i8VxWHtWi8osAjBhSA5aoP8gfOZgto9/+GkQ2qKWmXZgEC5Txp2hQDT
 dGxUCjO16uaOU8eh4+F9nngK4Se3Blq2Ujm9j4pYhwrQWlNgvdvQEGNpxPwCBF6Zt+1y
 lzlUeinIOJAAIe+SbZxpMMvyMHF6A8arZbNdj1ERE45D8gHSpVy/XfnPD2jhr98QeYLv
 V1jNz0m1JBbniPobPEsCQMeORv61HvG1JhMHT9TtntY76MG+HwycjRIZTYMMKSuWZ65D
 zQAqwRJ5Dc1nJ7NMgXUxX8Z+N9mQ//ZrhkqNCagAGeYQUIgj7HbXwJehv6LUAqylNJ+Q
 fWLg==
X-Gm-Message-State: AOAM531v1YSctLJ6Ed3SL4DMhToy9wDB0Xzi6GwkrMRzXu3oGWkpYklR
 DMP5Trg31FCoH6s5EiKY34pn8xCG2o4h+2VIaX46UiLZj/tMN0PkiAZQW6eI1N8Ot2u+B8HXFwQ
 jumV4HGmJHJ05oXNBpXNm138XG0lQXKE=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr500164vsu.13.1633022469782; 
 Thu, 30 Sep 2021 10:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxHGSVNU2K+Os/TzNLkoLQjAc+kEZJnk9Nlqtfs4ZpGtF/XIqRPkhGghWmjNn7I6eYUeMEmgmVO8aVvl868is=
X-Received: by 2002:a05:6102:3a0c:: with SMTP id
 b12mr500130vsu.13.1633022469599; 
 Thu, 30 Sep 2021 10:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-7-jsnow@redhat.com>
 <87y27eqwkz.fsf@dusky.pond.sub.org>
In-Reply-To: <87y27eqwkz.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Sep 2021 13:20:58 -0400
Message-ID: <CAFn=p-ZR=OXkisAJdYUapVPoQeUUcfs9fdwzwcHiq3KMHdk-wQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] qapi/parser: remove FIXME comment from
 _append_body_line
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003606ef05cd39acbe"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

--0000000000003606ef05cd39acbe
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 4:47 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > True, we do not check the validity of this symbol -- but we don't check
> > the validity of definition names during parse, either -- that happens
> > later, during the expr check. I don't want to introduce a dependency on
> > expr.py:check_name_str here and introduce a cycle.
> >
> > Instead, rest assured that a documentation block is required for each
> > definition. This requirement uses the names of each section to ensure
> > that we fulfilled this requirement.
> >
> > e.g., let's say that block-core.json has a comment block for
> > "Snapshot!Info" by accident. We'll see this error message:
> >
> > In file included from ../../qapi/block.json:8:
> > ../../qapi/block-core.json: In struct 'SnapshotInfo':
> > ../../qapi/block-core.json:38: documentation comment is for
> 'Snapshot!Info'
> >
> > That's a pretty decent error message.
> >
> > Now, let's say that we actually mangle it twice, identically:
> >
> > ../../qapi/block-core.json: In struct 'Snapshot!Info':
> > ../../qapi/block-core.json:38: struct has an invalid name
> >
> > That's also pretty decent. If we forget to fix it in both places, we'll
> > just be back to the first error.
> >
> > Therefore, let's just drop this FIXME and adjust the error message to
> > not imply a more thorough check than is actually performed.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py                 | 6 ++++--
> >  tests/qapi-schema/doc-empty-symbol.err | 2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 2f93a752f66..52748e8e462 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -558,9 +558,11 @@ def _append_body_line(self, line):
> >                  raise QAPIParseError(
> >                      self._parser, "extra whitespace around symbol
> declaration")
> >              self.symbol = line[1:-1]
> > -            # FIXME invalid names other than the empty string aren't
> flagged
> > +            # Invalid names are not checked here, but the name provided
> MUST
> > +            # match the following definition, which *is* validated.
> >              if not self.symbol:
> > -                raise QAPIParseError(self._parser, "invalid name")
> > +                raise QAPIParseError(
> > +                    self._parser, "doc symbol name cannot be blank")
>
> "blank" feels like "empty or just whitespace" to me.  We actually mean
> "empty".
>
> What about "name required after @"?
>
>
Sure, yeah. Updated.


> >          elif self.symbol:
> >              # This is a definition documentation block
> >              name = line.split(' ', 1)[0]
> > diff --git a/tests/qapi-schema/doc-empty-symbol.err
> b/tests/qapi-schema/doc-empty-symbol.err
> > index 81b90e882a7..a4981ee28ea 100644
> > --- a/tests/qapi-schema/doc-empty-symbol.err
> > +++ b/tests/qapi-schema/doc-empty-symbol.err
> > @@ -1 +1 @@
> > -doc-empty-symbol.json:4:1: invalid name
> > +doc-empty-symbol.json:4:1: doc symbol name cannot be blank
>
>

--0000000000003606ef05cd39acbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 4:47 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; True, we do not check the validity of this symbol -- but we don&#39;t =
check<br>
&gt; the validity of definition names during parse, either -- that happens<=
br>
&gt; later, during the expr check. I don&#39;t want to introduce a dependen=
cy on<br>
&gt; expr.py:check_name_str here and introduce a cycle.<br>
&gt;<br>
&gt; Instead, rest assured that a documentation block is required for each<=
br>
&gt; definition. This requirement uses the names of each section to ensure<=
br>
&gt; that we fulfilled this requirement.<br>
&gt;<br>
&gt; e.g., let&#39;s say that block-core.json has a comment block for<br>
&gt; &quot;Snapshot!Info&quot; by accident. We&#39;ll see this error messag=
e:<br>
&gt;<br>
&gt; In file included from ../../qapi/block.json:8:<br>
&gt; ../../qapi/block-core.json: In struct &#39;SnapshotInfo&#39;:<br>
&gt; ../../qapi/block-core.json:38: documentation comment is for &#39;Snaps=
hot!Info&#39;<br>
&gt;<br>
&gt; That&#39;s a pretty decent error message.<br>
&gt;<br>
&gt; Now, let&#39;s say that we actually mangle it twice, identically:<br>
&gt;<br>
&gt; ../../qapi/block-core.json: In struct &#39;Snapshot!Info&#39;:<br>
&gt; ../../qapi/block-core.json:38: struct has an invalid name<br>
&gt;<br>
&gt; That&#39;s also pretty decent. If we forget to fix it in both places, =
we&#39;ll<br>
&gt; just be back to the first error.<br>
&gt;<br>
&gt; Therefore, let&#39;s just drop this FIXME and adjust the error message=
 to<br>
&gt; not imply a more thorough check than is actually performed.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
&gt;=C2=A0 tests/qapi-schema/doc-empty-symbol.err | 2 +-<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 2f93a752f66..52748e8e462 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -558,9 +558,11 @@ def _append_body_line(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PIParseError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._parser, &quot;extra whitespace around symbol declaration&quot;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.symbol =3D line[1=
:-1]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME invalid names other=
 than the empty string aren&#39;t flagged<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Invalid names are not che=
cked here, but the name provided MUST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # match the following defin=
ition, which *is* validated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.symbol:<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIPar=
seError(self._parser, &quot;invalid name&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIPar=
seError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 self._parser, &quot;doc symbol name cannot be blank&quot;)<br>
<br>
&quot;blank&quot; feels like &quot;empty or just whitespace&quot; to me.=C2=
=A0 We actually mean<br>
&quot;empty&quot;.<br>
<br>
What about &quot;name required after @&quot;?<br>
<br></blockquote><div><br></div><div>Sure, yeah. Updated.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.symbol:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is a definition=
 documentation block<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D line.split(&#=
39; &#39;, 1)[0]<br>
&gt; diff --git a/tests/qapi-schema/doc-empty-symbol.err b/tests/qapi-schem=
a/doc-empty-symbol.err<br>
&gt; index 81b90e882a7..a4981ee28ea 100644<br>
&gt; --- a/tests/qapi-schema/doc-empty-symbol.err<br>
&gt; +++ b/tests/qapi-schema/doc-empty-symbol.err<br>
&gt; @@ -1 +1 @@<br>
&gt; -doc-empty-symbol.json:4:1: invalid name<br>
&gt; +doc-empty-symbol.json:4:1: doc symbol name cannot be blank<br>
<br>
</blockquote></div></div>

--0000000000003606ef05cd39acbe--


