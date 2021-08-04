Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1843DFCCD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:27:17 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCFA-0004sq-El
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBL-0003pa-D5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBJ-00030i-1D
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFp2yTesJsutUcG9xZ5TreZU1jJCKn9wlfGd4+glSH4=;
 b=b0dRBQzMAAJEBC3sXyqq0zMZ7TlOV2nwm6JQOPMcpBToB+iacqeVu6OlpzwoV33ybidNPC
 vtF5w3IhzU0bs0Sm2RdIQjTbhtUa4FUkCChYWvTq/Ossl5VALUej6iyQvAXDDBnTZp6n7U
 n+4HTLjQBF6cIissICvK6ob02oQF3v0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-59RVG0P4M3SIPBmIidGsJA-1; Wed, 04 Aug 2021 04:23:06 -0400
X-MC-Unique: 59RVG0P4M3SIPBmIidGsJA-1
Received: by mail-pj1-f70.google.com with SMTP id
 ep15-20020a17090ae64fb02901772983d308so1822874pjb.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFp2yTesJsutUcG9xZ5TreZU1jJCKn9wlfGd4+glSH4=;
 b=IvIzotZLdgrgQbqZ1lCkxZkbTHd+Jnscpb0b4qaXPhSfp/dDZYpwabI5qzbFF0nsu7
 BVy6PmbAP1edet5Qxprk2FG6arLC7i/xEiguu0R2b/4K3U/HdWZnQjFC/VROBPm5R9U/
 GSUhtcBNO32oWCPOR6qLJnE3P+fs1fQk7Z0NCBbFy5TYcbvW3TukkXmqng945brFrl+Z
 QwggC9CMvFDoV/DcSgju1xFb/g2oARSOOMOHBsivnykrI3E1d2CZ96WHGtv1cf2j514v
 GHWU6PP/c0ZLX5Ng4GMJTH6cqBbNV97ClCvjy4ppa9eaJe9hdIfviUlG9jPfsy5B7FmL
 0Kgw==
X-Gm-Message-State: AOAM531Ar1M0UiUCNL8aMsv2YMeB22PhU1L8ggS+BoO3VmaxS/u22SeM
 8qYY0wvCnSxckdneP+hz1dhWeCMtS2mfUhzYcquPii6zB3fA7yL4JoFm4GNZsHN/ydUk9CANP68
 tZ0Xp4pH23XXnSu+zjNkkAF4lV9ZNfNw=
X-Received: by 2002:a63:1155:: with SMTP id 21mr698962pgr.346.1628065385306;
 Wed, 04 Aug 2021 01:23:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmx7DCslU0R6OB8e60yEt2Ue3Jj3RraOQi/Z9BuPm91lhcI+BXyrcF3af/JThYvApG/0FcdqvOYJpM7oiZWFk=
X-Received: by 2002:a63:1155:: with SMTP id 21mr698948pgr.346.1628065385108;
 Wed, 04 Aug 2021 01:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-4-marcandre.lureau@redhat.com>
 <87pmuwrx5o.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmuwrx5o.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:22:53 +0400
Message-ID: <CAMxuvay-=fJjTmDHTpYKtN=mKK3yhQ_c3bD-jpPszC7ZKMOSYg@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] qapi: add QAPISchemaIfCond.is_present()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f37a6905c8b7828b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=ham autolearn_force=no
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

--000000000000f37a6905c8b7828b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 2, 2021 at 1:52 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py         | 8 ++++----
> >  scripts/qapi/schema.py         | 7 +++++--
> >  tests/qapi-schema/test-qapi.py | 2 +-
> >  3 files changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index 0eac3308b2..511520f33f 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
> >              term.append(nodes.literal('', member.type.doc_type()))
> >          if member.optional:
> >              term.append(nodes.Text(' (optional)'))
> > -        if member.ifcond.ifcond:
> > +        if member.ifcond.is_present():
> >              term.extend(self._nodes_for_ifcond(member.ifcond))
> >          return term
> >
> > @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant=
):
> >                  nodes.literal('', variants.tag_member.name),
> >                  nodes.Text(' is '),
> >                  nodes.literal('', '"%s"' % variant.name)]
> > -        if variant.ifcond.ifcond:
> > +        if variant.ifcond.is_present():
> >              term.extend(self._nodes_for_ifcond(variant.ifcond))
> >          return term
> >
> > @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
> >          dlnode =3D nodes.definition_list()
> >          for section in doc.args.values():
> >              termtext =3D [nodes.literal('', section.member.name)]
> > -            if section.member.ifcond.ifcond:
> > +            if section.member.ifcond.is_present():
> >
> termtext.extend(self._nodes_for_ifcond(section.member.ifcond))
> >              # TODO drop fallbacks when undocumented members are outlaw=
ed
> >              if section.text:
> > @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
> >      def _nodes_for_if_section(self, ifcond):
> >          """Return list of doctree nodes for the "If" section"""
> >          nodelist =3D []
> > -        if ifcond.ifcond:
> > +        if ifcond.is_present():
> >              snode =3D self._make_section('If')
> >              snode +=3D nodes.paragraph(
> >                  '', '', *self._nodes_for_ifcond(ifcond, with_if=3DFals=
e)
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 5e44164bd1..e3bd8f8720 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> >          self.ifcond =3D ifcond or []
> >
> > +    def is_present(self):
> > +        return bool(self.ifcond)
> > +
> >
> >  class QAPISchemaEntity:
> >      meta: Optional[str] =3D None
> > @@ -599,7 +602,7 @@ def check(self, schema, seen):
> >                      self.info,
> >                      "discriminator member '%s' of %s must not be
> optional"
> >                      % (self._tag_name, base))
> > -            if self.tag_member.ifcond.ifcond:
> > +            if self.tag_member.ifcond.is_present():
> >                  raise QAPISemError(
> >                      self.info,
> >                      "discriminator member '%s' of %s must not be
> conditional"
> > @@ -607,7 +610,7 @@ def check(self, schema, seen):
> >          else:                   # simple union
> >              assert isinstance(self.tag_member.type, QAPISchemaEnumType=
)
> >              assert not self.tag_member.optional
> > -            assert self.tag_member.ifcond.ifcond =3D=3D []
> > +            assert not self.tag_member.ifcond.is_present()
> >          if self._tag_name:    # flat union
> >              # branches that are not explicitly covered get an empty ty=
pe
> >              cases =3D {v.name for v in self.variants}
> > diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> > index 7907b4ac3a..c92be2d086 100755
> > --- a/tests/qapi-schema/test-qapi.py
> > +++ b/tests/qapi-schema/test-qapi.py
> > @@ -94,7 +94,7 @@ def _print_variants(variants):
> >
> >      @staticmethod
> >      def _print_if(ifcond, indent=3D4):
> > -        if ifcond.ifcond:
> > +        if ifcond.is_present():
> >              print('%sif %s' % (' ' * indent, ifcond.ifcond))
> >
> >      @classmethod
>
> In introspect.py:
>
>         if obj.ifcond:
>             ret +=3D gen_if(obj.ifcond.ifcond)
>         ret +=3D _tree_to_qlit(obj.value, level)
>         if obj.ifcond:
>             ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>
> I believe the previous patch should change it to
>
>         if obj.ifcond.ifcond:
>             ret +=3D gen_if(obj.ifcond.ifcond)
>         ret +=3D _tree_to_qlit(obj.value, level)
>         if obj.ifcond.ifcond:
>             ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>
> and this one to
>
>         if obj.ifcond.is_present():
>             ret +=3D gen_if(obj.ifcond.ifcond)
>         ret +=3D _tree_to_qlit(obj.value, level)
>         if obj.ifcond.is_present():
>             ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>

done


> Other than that:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>

--000000000000f37a6905c8b7828b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 1:52 PM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">armb=
ru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blan=
k">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++=
----<br>
&gt;=C2=A0 scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 ++++=
+--<br>
&gt;=C2=A0 tests/qapi-schema/test-qapi.py | 2 +-<br>
&gt;=C2=A0 3 files changed, 10 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
&gt; index 0eac3308b2..511520f33f 100644<br>
&gt; --- a/docs/sphinx/qapidoc.py<br>
&gt; +++ b/docs/sphinx/qapidoc.py<br>
&gt; @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.append(nodes.lite=
ral(&#39;&#39;, member.type.doc_type()))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.optional:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.append(nodes.Text=
(&#39; (optional)&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.ifcond.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.ifcond.is_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.extend(self._node=
s_for_ifcond(member.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return term<br>
&gt;=C2=A0 <br>
&gt; @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, varian=
t):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.li=
teral(&#39;&#39;, <a href=3D"http://variants.tag_member.name" rel=3D"norefe=
rrer" target=3D"_blank">variants.tag_member.name</a>),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.Te=
xt(&#39; is &#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes.li=
teral(&#39;&#39;, &#39;&quot;%s&quot;&#39; % <a href=3D"http://variant.name=
" rel=3D"noreferrer" target=3D"_blank">variant.name</a>)]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if variant.ifcond.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if variant.ifcond.is_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 term.extend(self._node=
s_for_ifcond(variant.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return term<br>
&gt;=C2=A0 <br>
&gt; @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlnode =3D nodes.definition_list()<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for section in doc.args.values():<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 termtext =3D [nodes.li=
teral(&#39;&#39;, <a href=3D"http://section.member.name" rel=3D"noreferrer"=
 target=3D"_blank">section.member.name</a>)]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.member.ifcond.if=
cond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.member.ifcond.is=
_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 termtext=
.extend(self._nodes_for_ifcond(section.member.ifcond))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO drop fallbacks =
when undocumented members are outlawed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if section.text:<br>
&gt; @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _nodes_for_if_section(self, ifcond):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return list of doc=
tree nodes for the &quot;If&quot; section&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodelist =3D []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.is_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snode =3D self._make_s=
ection(&#39;If&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snode +=3D nodes.parag=
raph(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#3=
9;, &#39;&#39;, *self._nodes_for_ifcond(ifcond, with_if=3DFalse)<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 5e44164bd1..e3bd8f8720 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -29,6 +29,9 @@ class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def is_present(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPISchemaEntity:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta: Optional[str] =3D None<br>
&gt; @@ -599,7 +602,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">se=
lf.info</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;discriminator member &#39;%s&#39; of %s must not be optional&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 % (self._tag_name, base))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.tag_member.ifcond.i=
fcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.tag_member.ifcond.i=
s_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QA=
PISemError(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">se=
lf.info</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;discriminator member &#39;%s&#39; of %s must not be conditiona=
l&quot;<br>
&gt; @@ -607,7 +610,7 @@ def check(self, schema, seen):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# simple union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(self=
.tag_member.type, QAPISchemaEnumType)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_me=
mber.optional<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.tag_member.ifco=
nd.ifcond =3D=3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not self.tag_member.=
ifcond.is_present()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._tag_name:=C2=A0 =C2=A0 # fl=
at union<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # branches that are no=
t explicitly covered get an empty type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cases =3D {<a href=3D"=
http://v.name" rel=3D"noreferrer" target=3D"_blank">v.name</a> for v in sel=
f.variants}<br>
&gt; diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-q=
api.py<br>
&gt; index 7907b4ac3a..c92be2d086 100755<br>
&gt; --- a/tests/qapi-schema/test-qapi.py<br>
&gt; +++ b/tests/qapi-schema/test-qapi.py<br>
&gt; @@ -94,7 +94,7 @@ def _print_variants(variants):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _print_if(ifcond, indent=3D4):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.ifcond:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ifcond.is_present():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;%sif %s&#39=
; % (&#39; &#39; * indent, ifcond.ifcond))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
<br>
In introspect.py:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.ifcond=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, level)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen_endif=
(obj.ifcond.ifcond)<br>
<br>
I believe the previous patch should change it to<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond.ifcond:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.ifcond=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, level)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond.ifcond:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen_endif=
(obj.ifcond.ifcond)<br>
<br>
and this one to<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond.is_present():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(obj.ifcond.ifcond=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D _tree_to_qlit(obj.value, level)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj.ifcond.is_present():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;\n&#39; + gen_endif=
(obj.ifcond.ifcond)<br></blockquote><div><br></div><div>done</div><div> <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Other than that:<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000f37a6905c8b7828b--


