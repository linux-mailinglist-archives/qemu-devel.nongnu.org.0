Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3503DFCBF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:24:40 +0200 (CEST)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCCd-0006Gq-2w
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBH-0003h3-7i
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBF-0002y1-9X
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nz3q4Z2QcKykYynd/nyDX0op074QkNbMClt78XwFMDg=;
 b=CsodQlt6Ua3ZOOVLJLg0NCdmSsZkoMyS+GUEB1yVHp0iPY2Wg/dnosA572X/xeTkHflsoX
 MMMTRbmjafIAEPRuR5E+6zi6taL4zkdyRpaTBhrOtGdtDCATp0/iH3XnZF+yppHLQvQsaZ
 36pNX6mps9MBXxQZyQmoYW+51Ub5Se4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-FaE0qMTFNcOOdrCjvX0qVA-1; Wed, 04 Aug 2021 04:23:10 -0400
X-MC-Unique: FaE0qMTFNcOOdrCjvX0qVA-1
Received: by mail-pl1-f198.google.com with SMTP id
 j5-20020a170902da85b029012c4287ea54so1547250plx.22
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nz3q4Z2QcKykYynd/nyDX0op074QkNbMClt78XwFMDg=;
 b=cMGbjWZvFPNUGkRl57iUNVztzng9kWAOILyGBYZYXRR4Aqnbku/au3EhLi2RT/Vfom
 gyX57IzI1UHIUTMrXW2tJwg5IKsYcVg/vzGdN/fmc4zGaWGq9zift5gacHyfqS3HBrKo
 LK7gkKvW6YHeZCkhRMrPHpls/esG5eNMXAGXU0nc2uVPRwKlXvK1K8mDwXM/9NnrVXV1
 bS3MIN1Vi7ioxDY33d3CmHCoI3Lm1L0SM+w97yPi4+C3mYMwNtnFm/gTx2lcwVqt2F1V
 OjgGxG+HLeWb0gsDk0yjFcc+u8Wj/wtqnp8qMxIHBgzq36htYRPgElGhFaIZgI6y9lwz
 B1qw==
X-Gm-Message-State: AOAM533p0Wr2mx1mowZ9ZKPdMlmu+Lz2QliefT5seSw+weeUa/aF3t65
 AKxYZEkuHFNcnQ2/YlI40j4bpmjUaEZqI44sPp1SGkFSY0aUACdW8W4jqlkp+gvod8TuRCTuQu3
 0sg1dWjYE00l/lFUJ378V+N/XdQ47p20=
X-Received: by 2002:a65:6a4c:: with SMTP id o12mr1161311pgu.108.1628065389897; 
 Wed, 04 Aug 2021 01:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7lwIaeO1S5OqEE+f7bxuVA26R+bmdQXcf8S2qE6UWiDlXgK4J6tEtzimyxZNDg86VPQIWZCuQuZ+Nuyj4lU=
X-Received: by 2002:a65:6a4c:: with SMTP id o12mr1161301pgu.108.1628065389738; 
 Wed, 04 Aug 2021 01:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-5-marcandre.lureau@redhat.com>
 <874kc8ruwn.fsf@dusky.pond.sub.org>
In-Reply-To: <874kc8ruwn.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:22:57 +0400
Message-ID: <CAMxuvawygxLd+xXKe-G6kiE9CkddVC_UtH54pgTRnEW4HjDT2A@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] qapi: _make_enum_members() to work with
 pre-built QAPISchemaIfCond
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003a157505c8b783c5"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003a157505c8b783c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 2, 2021 at 2:41 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Instead of lowering the expression back to its original form, and havin=
g
> > to convert it again, special-case the 'if' condition to be pre-built.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/schema.py | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index e3bd8f8720..c35fa3bf51 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -982,8 +982,13 @@ def _make_features(self, features, info):
> >                  for f in features]
> >
> >      def _make_enum_members(self, values, info):
> > -        return [QAPISchemaEnumMember(v['name'], info,
> > -                                     QAPISchemaIfCond(v.get('if')))
> > +        def _get_if(v):
> > +            ifcond =3D v.get('if')
> > +            if isinstance(ifcond, QAPISchemaIfCond):
> > +                return ifcond
> > +            else:
> > +                return QAPISchemaIfCond(ifcond)
> > +        return [QAPISchemaEnumMember(v['name'], info, _get_if(v))
> >                  for v in values]
> >
> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
> > @@ -1103,7 +1108,7 @@ def _def_union_type(self, expr, info, doc):
> >
> QAPISchemaIfCond(value.get('if')),
> >                                            info)
> >                  for (key, value) in data.items()]
> > -            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in
> variants]
> > +            enum =3D [{'name': v.name, 'if': v.ifcond} for v in varian=
ts]
> >              typ =3D self._make_implicit_enum_type(name, info, ifcond,
> enum)
> >              tag_member =3D QAPISchemaObjectTypeMember('type', info, ty=
p,
> False)
> >              members =3D [tag_member]
>
> I'm afraid I don't like this one.
>
> Mapping from QAPISchemaIfCond back to the AST happens to be easy with
> the current data structures, but you're right, it's not nice.
>
> Stuffing the QAPISchemaIfCond into the AST is (in my opinion) worse:
> it's a layering violation.
>
> Let's take a step back and review what needs to be done here:
>
>     for each simple union branch:
>         create a simple variant
>         create an implicit enum member
>     and
>         collect the variants in a list
>         collect the enum members in a list
>
> The code splits this work.  It first creates the list of variants from
> the AST's simple union branches in @data:
>
>             variants =3D [
>                 self._make_simple_variant(key, value['type'],
>
> QAPISchemaIfCond(value.get('if')),
>                                           info)
>                 for (key, value) in data.items()]
>
> It then creates the list of enum of enum members from the list of
> variants, *not* from the AST:
>
>             enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in
> variants]
>
> This dots into the QAPISchemaVariant.  Your patch makes this dotting
> less deep.
>
> Two solutions I'd dislike less:
>
> 1. Create the enum members from the AST, too.
>
> 2. Do nothing, and bank on the eventual removal of simple unions.
>
> Minimizing ripple effects on the remainder of the series is of course a
> concern.
>
>
I dropped the patch, I didn't realize it wasn't necessary anymore.

--0000000000003a157505c8b783c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 2:41 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Instead of lowering the expression back to its original form, and havi=
ng<br>
&gt; to convert it again, special-case the &#39;if&#39; condition to be pre=
-built.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/schema.py | 11 ++++++++---<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index e3bd8f8720..c35fa3bf51 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -982,8 +982,13 @@ def _make_features(self, features, info):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in=
 features]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_enum_members(self, values, info):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIf=
Cond(v.get(&#39;if&#39;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _get_if(v):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifcond =3D v.get(&#39;if&#3=
9;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, QAPIS=
chemaIfCond):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return QAPISc=
hemaIfCond(ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&=
#39;], info, _get_if(v))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in=
 values]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _make_implicit_enum_type(self, name, info, ifc=
ond, values):<br>
&gt; @@ -1103,7 +1108,7 @@ def _def_union_type(self, expr, info, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 QAPISchemaIfCond(value.get(&#39;if&#39;)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key=
, value) in data.items()]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond.ifcond} for v in variants]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: =
<a href=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, =
&#39;if&#39;: v.ifcond} for v in variants]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typ =3D self._make_imp=
licit_enum_type(name, info, ifcond, enum)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag_member =3D QAPISch=
emaObjectTypeMember(&#39;type&#39;, info, typ, False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 members =3D [tag_membe=
r]<br>
<br>
I&#39;m afraid I don&#39;t like this one.<br>
<br>
Mapping from QAPISchemaIfCond back to the AST happens to be easy with<br>
the current data structures, but you&#39;re right, it&#39;s not nice.<br>
<br>
Stuffing the QAPISchemaIfCond into the AST is (in my opinion) worse:<br>
it&#39;s a layering violation.<br>
<br>
Let&#39;s take a step back and review what needs to be done here:<br>
<br>
=C2=A0 =C2=A0 for each simple union branch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 create a simple variant<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 create an implicit enum member<br>
=C2=A0 =C2=A0 and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collect the variants in a list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collect the enum members in a list<br>
<br>
The code splits this work.=C2=A0 It first creates the list of variants from=
<br>
the AST&#39;s simple union branches in @data:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variants =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_simple_v=
ariant(key, value[&#39;type&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Q=
APISchemaIfCond(value.get(&#39;if&#39;)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nfo)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (key, value) in=
 data.items()]<br>
<br>
It then creates the list of enum of enum members from the list of<br>
variants, *not* from the AST:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D [{&#39;name&#39;: <a hre=
f=3D"http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a>, &#39;i=
f&#39;: v.ifcond.ifcond} for v in variants]<br>
<br>
This dots into the QAPISchemaVariant.=C2=A0 Your patch makes this dotting<b=
r>
less deep.<br>
<br>
Two solutions I&#39;d dislike less:<br>
<br>
1. Create the enum members from the AST, too.<br>
<br>
2. Do nothing, and bank on the eventual removal of simple unions.<br>
<br>
Minimizing ripple effects on the remainder of the series is of course a<br>
concern.<br>
<br></blockquote><div><br></div><div>I dropped the patch, I didn&#39;t real=
ize it wasn&#39;t necessary anymore. <br></div></div></div>

--0000000000003a157505c8b783c5--


