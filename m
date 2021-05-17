Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C53382B12
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:31:14 +0200 (CEST)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libSr-0005Wz-4a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libIQ-0006A9-0P
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libIM-0006Pm-BK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eFzU2pqEj5gXD6qVc+1ng4/0MfloOBdMWmBKErIQkb0=;
 b=KYTwFGnA74TCcmODPALJR7pBf7QQIk5mBtNf2bRHpvfsrXRL1f5U68ElD9NPk749/AsRY5
 JN/ljMVIz/4ANEkzvkJ3c4m3xBAXwUPrjWoUTmgznSqKM5GLdsVHvvkZpA4OgFPtPb08p9
 Bti9rfuxMl6lXhm+obQ/3q1uc22vGdE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-81WA_iHHPL6CloFDQZ_Zgw-1; Mon, 17 May 2021 07:20:14 -0400
X-MC-Unique: 81WA_iHHPL6CloFDQZ_Zgw-1
Received: by mail-pl1-f198.google.com with SMTP id
 31-20020a1709020022b02900eeddd708c8so1543615pla.11
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eFzU2pqEj5gXD6qVc+1ng4/0MfloOBdMWmBKErIQkb0=;
 b=WLhZ6wcBsX/LShDh4AuB213UiN9ZwWikAoGRp7no/teR6Z9/uJY3w7gLRFFVuaYePU
 WxkESct0VE4W8L5Q3jXEcPN4qUnSCstvcnWC9cQM4joutY1HoJaRVvRIo3FGwR26O/Y7
 aT4+F5PsWDhscmR//PckJoD1TcXgfo2HFH2ny1Mo9OY7GoMdHB3+U3Ii63ywJ8V4xKs/
 eNP96oMtBobUAuaqNS6LUCbxuVDg5S8nP4QsI6MOOMBdKHHbR3kpQuQH93J+q8kVPQy1
 5Gm1vBZAWLmr2Lwx54MZDxebE1umaGtY6NMYREDcpmt5BCARv4lea7A6Sqm7+U4iq/p2
 EJfQ==
X-Gm-Message-State: AOAM530XpzOpMH+qAMHio/+gu9bT2H5hcJysKmen42qOT6srI//+HgjJ
 HbTYhEz4eHSAGAU4a8GAEU+KT7JItjNVwOTYwWts5ma2GqkPWBVpFKCk47u7YIla8kbItApPk6q
 wITcCGqwJ91CIpheKh23azrHYM7QpSpw=
X-Received: by 2002:a17:90a:728f:: with SMTP id
 e15mr2789562pjg.137.1621250413189; 
 Mon, 17 May 2021 04:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJKYqlUNXfK6Cg9LTKFNKJ+3l/d/OB4r7GnsmCt+JozRCwCBlJtObNDsuVdzgKES2kmO3h0DC2Dv0Eh1dbr6k=
X-Received: by 2002:a17:90a:728f:: with SMTP id
 e15mr2789536pjg.137.1621250412924; 
 Mon, 17 May 2021 04:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-8-marcandre.lureau@redhat.com>
 <4ed66620-1e7a-fbc1-78c2-1919484a7ff2@redhat.com>
In-Reply-To: <4ed66620-1e7a-fbc1-78c2-1919484a7ff2@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:20:02 +0400
Message-ID: <CAMxuvawvLfhYcnR4Defbkymg94N560NqjeuonE-rft2GgVQA_g@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] qapi: convert 'if' C-expressions to the new syntax
 tree
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f46dc505c284c6ff"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f46dc505c284c6ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 3:51 AM John Snow <jsnow@redhat.com> wrote:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   qapi/machine-target.json | 20 ++++++++++++++++----
> >   qapi/misc-target.json    | 13 ++++++++++++-
> >   2 files changed, 28 insertions(+), 5 deletions(-)
> >
> > diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> > index e7811654b7..9b56b81bea 100644
> > --- a/qapi/machine-target.json
> > +++ b/qapi/machine-target.json
> > @@ -213,7 +213,9 @@
> >   ##
> >   { 'struct': 'CpuModelExpansionInfo',
> >     'data': { 'model': 'CpuModelInfo' },
> > -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) ||
> defined(TARGET_ARM)' }
> > +  'if': { 'any': [ 'defined(TARGET_S390X)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_ARM)'] } }
> >
> >   ##
> >   # @query-cpu-model-expansion:
> > @@ -252,7 +254,9 @@
> >     'data': { 'type': 'CpuModelExpansionType',
> >               'model': 'CpuModelInfo' },
> >     'returns': 'CpuModelExpansionInfo',
> > -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) ||
> defined(TARGET_ARM)' }
> > +  'if': { 'any': [ 'defined(TARGET_S390X)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_ARM)' ] } }
> >
> >   ##
> >   # @CpuDefinitionInfo:
> > @@ -316,7 +320,11 @@
> >               'typename': 'str',
> >               '*alias-of' : 'str',
> >               'deprecated' : 'bool' },
> > -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> > +  'if': { 'any': [ 'defined(TARGET_PPC)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_MIPS)' ] } }
> >
> >   ##
> >   # @query-cpu-definitions:
> > @@ -328,4 +336,8 @@
> >   # Since: 1.2
> >   ##
> >   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'=
],
> > -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> > +  'if': { 'any': [ 'defined(TARGET_PPC)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_MIPS)' ] } }
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 0c7491cd82..2891df6890 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -23,7 +23,18 @@
> >   ##
> >   { 'event': 'RTC_CHANGE',
> >     'data': { 'offset': 'int' },
> > -  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) ||
> defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) ||
> defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) ||
> defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) ||
> defined(TARGET_SPARC)' }
> > +  'if': { 'any': [ 'defined(TARGET_ALPHA)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_HPPA)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_MIPS)',
> > +                   'defined(TARGET_MIPS64)',
> > +                   'defined(TARGET_MOXIE)',
> > +                   'defined(TARGET_PPC)',
> > +                   'defined(TARGET_PPC64)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_SH4)',
> > +                   'defined(TARGET_SPARC)' ] } }
> >
> >   ##
> >   # @rtc-reset-reinjection:
> >
>
> I suppose these are necessary to convert because they were a single
> giant string, and not actually a list.
>
> If you're going to keep the list-of-strings sugar, is it worth just
> changing these to a list of strings?
>
> (How does your rust generator handle the defined(xxx) strings? does it
> strip the defined(...) off somehow?)
>

As you figured out, the next patch removes the C-ism (this is really the
purpose of this series)


>
> Tested-by: John Snow <jsnow@redhat.com>
>
> --js
>
>

--000000000000f46dc505c284c6ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 3:51 AM Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 4/29/21 9:40 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" ta=
rget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qapi/machine-target.json | 20 ++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0qapi/misc-target.json=C2=A0 =C2=A0 | 13 ++++++++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 28 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qapi/machine-target.json b/qapi/machine-target.json<br>
&gt; index e7811654b7..9b56b81bea 100644<br>
&gt; --- a/qapi/machine-target.json<br>
&gt; +++ b/qapi/machine-target.json<br>
&gt; @@ -213,7 +213,9 @@<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0{ &#39;struct&#39;: &#39;CpuModelExpansionInfo&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: { &#39;model&#39;: &#39;CpuModelInf=
o&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_S390X) || defined(TARGET_I38=
6) || defined(TARGET_ARM)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_S390X)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @query-cpu-model-expansion:<br>
&gt; @@ -252,7 +254,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: { &#39;type&#39;: &#39;CpuModelExpa=
nsionType&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;model&#39;:=
 &#39;CpuModelInfo&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;returns&#39;: &#39;CpuModelExpansionInfo&#39;,=
<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_S390X) || defined(TARGET_I38=
6) || defined(TARGET_ARM)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_S390X)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39; ] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @CpuDefinitionInfo:<br>
&gt; @@ -316,7 +320,11 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;typename&#3=
9;: &#39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*alias-of&#=
39; : &#39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;deprecated&=
#39; : &#39;bool&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_PPC) || defined(TARGET_ARM) =
|| defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)&#3=
9; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_PPC)&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39; ] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @query-cpu-definitions:<br>
&gt; @@ -328,4 +336,8 @@<br>
&gt;=C2=A0 =C2=A0# Since: 1.2<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0{ &#39;command&#39;: &#39;query-cpu-definitions&#39;, &#39=
;returns&#39;: [&#39;CpuDefinitionInfo&#39;],<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_PPC) || defined(TARGET_ARM) =
|| defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)&#3=
9; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_PPC)&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39; ] } }<br>
&gt; diff --git a/qapi/misc-target.json b/qapi/misc-target.json<br>
&gt; index 0c7491cd82..2891df6890 100644<br>
&gt; --- a/qapi/misc-target.json<br>
&gt; +++ b/qapi/misc-target.json<br>
&gt; @@ -23,7 +23,18 @@<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0{ &#39;event&#39;: &#39;RTC_CHANGE&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;data&#39;: { &#39;offset&#39;: &#39;int&#39; }=
,<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_ALPHA) || defined(TARGET_ARM=
) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) |=
| defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) ||=
 defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || d=
efined(TARGET_SPARC)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_ALPHA)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_HPPA)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS64)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MOXIE)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_PPC)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_PPC64)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_SH4)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_SPARC)&#39; ] } }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##<br>
&gt;=C2=A0 =C2=A0# @rtc-reset-reinjection:<br>
&gt; <br>
<br>
I suppose these are necessary to convert because they were a single <br>
giant string, and not actually a list.<br>
<br>
If you&#39;re going to keep the list-of-strings sugar, is it worth just <br=
>
changing these to a list of strings?<br>
<br>
(How does your rust generator handle the defined(xxx) strings? does it <br>
strip the defined(...) off somehow?)<br></blockquote><div><br></div><div>As=
 you figured out, the next patch removes the C-ism (this is really the purp=
ose of this series)<br></div><div>=C2=A0 <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_bla=
nk">jsnow@redhat.com</a>&gt;<br>
<br>
--js<br>
<br>
</blockquote></div></div>

--000000000000f46dc505c284c6ff--


