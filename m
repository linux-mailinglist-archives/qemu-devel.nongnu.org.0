Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED73A9806
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:46:05 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT3c-0008Ci-Co
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ltT1t-0006i1-Af
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:44:17 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ltT1r-0001rT-D3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:44:17 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t7so2040026edd.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7K440GnYxuQ/iaMhdf0d1bja+XfV53meHBWKMTNLl0=;
 b=T27lCSgTtX1lfXrbLPGTwOkkbghBB9kM/YbojEoALCrZaRXFEbKzCo3KfdkEa3RbqA
 zP1eAavf5tWgMBZ8X74HWtwDfTX0lvAp+t1IkRNE3RZnmUpqXHx/m9EIq5fIHz1b5wa1
 pK7BgGoTjtO2pdGaIBNaoPfx5JC55BjK0LInooFLtF75IusYcyTAI0uiYBhM12xlBFtM
 cjXt9To+OE8wrZPQDuQCVBhyGW6cZ5+NRj/YUmRXclFGliPGDnaCs1R1Q6zR7A5npP9H
 3VACFXLeMKd/ODaqLzD33EB67H0HmxqwdDqbrwquze4+Im/FzlGnkqOx6I+uqtSvSkIL
 5h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7K440GnYxuQ/iaMhdf0d1bja+XfV53meHBWKMTNLl0=;
 b=olMgMupmWwH5edKnvd7WHxuNR9YmJ8s3RuX92cOfU7VEFPjt+I/wN2Y5I0opWEWvnG
 Yq2IMlx4sNIBwcX6LQh1raafnZOCyzhQA6PuUJnuLK4EAvVN7wMEtMOXkiCyxLlQ5MdL
 IGKjfpHrUWhRH9Hh9FGvGWAUkIsl2XtVmOymnej6oAmQxCOgDNpL0VAW44H6yvpAQNX5
 pWiTggBCh5sCKsFr55F6lVh5lNoPvPvpjT2j/Af9aX/w+PjqXw08+YAXnMHu4w1qVUp0
 udHqD7KMDXKQ/KIYIMYK94z6FhQ2p3xgZPFh9qSrh9gIdoyJRDcTVoPOgNkA3LuRR/FO
 /KSg==
X-Gm-Message-State: AOAM530koR5njJNjpjqSfphEm1+uRrplbUmvdI+u1UZEhcNobEAeoeHS
 EhFY8xe9acojH8o0nTDtMEXdiptptsqbsiuUXGiqjy5R
X-Google-Smtp-Source: ABdhPJw7B1NFm5+Zd5CWVsiPyvblB/SMF+hD85auFIw60c69/3tRbKY5yIk57mXE4q1XwlofdbOOzEerwaeKbeUepAg=
X-Received: by 2002:aa7:cfd4:: with SMTP id r20mr3285732edy.237.1623840254175; 
 Wed, 16 Jun 2021 03:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-4-marcandre.lureau@redhat.com>
 <87zgvszkas.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgvszkas.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Jun 2021 14:44:02 +0400
Message-ID: <CAJ+F1CLtxBzK1WOqgepQC2iBWqfujaH4F5XM4rRzAuS5xWOnNg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] qapi: make gen_if/gen_endif take a simple string
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000085ad6e05c4dfc5cc"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000085ad6e05c4dfc5cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 14, 2021 at 4:48 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Instead of building prepocessor conditions from a list of string, use
> > the result generated from QAPISchemaIfCond.cgen().
>
> I understand why you're doing this, but only because I know where you're
> headed.  By itself, it is not an improvement: you move C generation out
> of common.py into schema.py.  You need to explain why that's useful.
>
>
What about?

In the following commits, QAPISchemaIfCond is going to hold an internal
tree structure. Moving cgen() there allows to abstract away the condition
representation.



> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index bc357ebbfa..aa4715c519 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
> >      def __init__(self, ifcond=3DNone):
> >          self.ifcond =3D ifcond or []
> >
> > +    def cgen(self):
> > +        return ' && '.join(self.ifcond)
>
> Fragile.  Better:
>
>            return '(' + ') && ('.join(self.ifcond) + ')'
>
>
This is an intermediary step, but ok.

If we want to keep C generation details out of schema.py, we need a
> helper mapping self.ifcond: Sequence[str] to C code, similar to how
> QAPISchemaEntity.c_name() works with helper c_name().
>

Leaving a FIXME.


> > +
> >      # Returns true if the condition is not void
> >      def __bool__(self):
> >          return bool(self.ifcond)
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 3673cf0f49..db9ff95bd1 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,
> >  ''',
> >                  c_name=3Dc_name(name))
> >      for memb in members:
> > -        ret +=3D gen_if(memb.ifcond.ifcond)
> > +        ret +=3D gen_if(memb.ifcond.cgen())
> >          index =3D c_enum_const(name, memb.name, prefix)
> >          ret +=3D mcgen('''
> >          [%(index)s] =3D "%(name)s",
> >  ''',
> >                       index=3Dindex, name=3Dmemb.name)
> > -        ret +=3D gen_endif(memb.ifcond.ifcond)
> > +        ret +=3D gen_endif(memb.ifcond.cgen())
> >
> >      ret +=3D mcgen('''
> >      },
> [More of the same snipped...]
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000085ad6e05c4dfc5cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 14, 2021 at 4:48 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Instead of building prepocessor conditions from a list of string, use<=
br>
&gt; the result generated from QAPISchemaIfCond.cgen().<br>
<br>
I understand why you&#39;re doing this, but only because I know where you&#=
39;re<br>
headed.=C2=A0 By itself, it is not an improvement: you move C generation ou=
t<br>
of common.py into schema.py.=C2=A0 You need to explain why that&#39;s usefu=
l.<br>
<br></blockquote><div><br></div><div>What about?</div><div><br></div><div>I=
n the following commits, QAPISchemaIfCond is going to hold an internal tree=
 structure. Moving cgen() there allows to abstract away the condition repre=
sentation.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index bc357ebbfa..aa4715c519 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -29,6 +29,9 @@ class QAPISchemaIfCond:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, ifcond=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ifcond =3D ifcond or []<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def cgen(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &amp;&amp; &#39;.join(self.i=
fcond)<br>
<br>
Fragile.=C2=A0 Better:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;(&#39; + &#39;) &amp;&=
amp; (&#39;.join(self.ifcond) + &#39;)&#39;<br>
<br></blockquote><div><br></div><div>This is an intermediary step, but ok.<=
/div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If we want to keep C generation details out of schema.py, we need a<br>
helper mapping self.ifcond: Sequence[str] to C code, similar to how<br>
QAPISchemaEntity.c_name() works with helper c_name().<br></blockquote><div>=
<br></div><div>Leaving a FIXME.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Returns true if the condition is not void<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __bool__(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(self.ifcond)<br>
&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt; index 3673cf0f49..db9ff95bd1 100644<br>
&gt; --- a/scripts/qapi/types.py<br>
&gt; +++ b/scripts/qapi/types.py<br>
&gt; @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name=
=3Dc_name(name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.ifcond)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_if(memb.ifcond.cgen())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D c_enum_const(name, <a href=
=3D"http://memb.name" rel=3D"noreferrer" target=3D"_blank">memb.name</a>, p=
refix)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D &quot;%(name)s&quot;=
,<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"nore=
ferrer" target=3D"_blank">memb.name</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.ifcond)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D gen_endif(memb.ifcond.cgen())<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
[More of the same snipped...]<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000085ad6e05c4dfc5cc--

