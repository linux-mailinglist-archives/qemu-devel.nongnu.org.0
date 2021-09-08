Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2430403BA8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:35:02 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyfF-0007Kd-CV
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNydn-0006DG-Ev
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:33:33 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNydl-0001cd-Ac
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:33:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id g16so3658922wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajlqxR7fcR3BPrTimKIoAYOlEAuCqyNy6JxrQkuat5Y=;
 b=KijjXHsEb+ID+K2TDMwg3EmxDf4ky5q17zPTieUKBKuyitNMiYEymtcHUT+BRt/wcG
 ly930TOgPHovxwDscyMZCaVIMsqwB94Dm8sviSmYe6iENvhzKjWNPKJ6Z+9KbNvMU9U1
 ghUgkUM9yI1adP54+LVOB59g60bN/YLdux3R4tiHfhvdOWg5WN/f8dH5N4gzwmW0p+qz
 uo3AW6iksUS7UyyIy60hS3djPzI5sq/izlHANJEb0IU9krdRnsuWASuxJQh/Cscr91mc
 AqT3hUUvwdjHsU0YCnteeGPYKe1HspneCJvese0rmqOdyOUb7mVKcPDv3FBBGJ4nwzgv
 qPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajlqxR7fcR3BPrTimKIoAYOlEAuCqyNy6JxrQkuat5Y=;
 b=xfjRQkQo9N61TfAiz2NYNeyvxYZMWqYOJAlY/ZEWgcdwlc21GIaxzxY3tWzssANu+s
 cKv+XU2kSO5klIP8QjrgwXyL/r+IWrNzEsu6lA6nkjfOW6/LDQcfstPToSetHxZhx0MK
 edCHsTgl+kRebGfFlZ/Nq+fmcKXvUcuDvB/xiBVeLK5OWTAv3MiwVxH4Kr9UH0M+cU6J
 VeVhx7bUmZxi/V8WA+uZF7px9mfAed95DByFNMr21waV2LWWFQMy6VMb4/COlbgWMMdo
 VoUma9+HmTSeTSTZ73cfvKB+cWXOhZcHKVFO+sC+nBSTfID3THDy6j+p+UuCz6IFFmbk
 bsWA==
X-Gm-Message-State: AOAM530AzRbrvmIq2iPjr9OrxNG9szr9hV3p/DCvxMzjuscYBBEvF7+I
 j2BDuxzCl0rN38wG+Pfx23XbtxTppqBee9PVCnI=
X-Google-Smtp-Source: ABdhPJwxwmQoHuNh3imhmeLfphWRQ8IY0NA1h28dq09NEvcBbWjRJ9RqAup34bU/e4ChGkjdiTKysKLYuk9bKH2GCkk=
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr4414306wrx.70.1631111606483; 
 Wed, 08 Sep 2021 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-4-marcandre.lureau@redhat.com>
 <87v93bw9mc.fsf@dusky.pond.sub.org>
In-Reply-To: <87v93bw9mc.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 18:33:14 +0400
Message-ID: <CAJ+F1C+mPgWxGWgCogaPrcSg4AZUzqrim0-688EaMeEjhN_DvQ@mail.gmail.com>
Subject: Re: [RFC v3 03/32] scripts/qapi: teach c_param_type() to return const
 argument type
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e4beb105cb7cc355"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e4beb105cb7cc355
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 4:12 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The argument isn't owned by the callee, so it better be const.
> > But a lot of code in QEMU rely on non-const arguments to tweak it (stea=
l
> > values etc).
> >
> > Since Rust types / bindings are derived from the C version, we have to
> > be more accurate there to do correct ownership in the bindings.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/schema.py | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index 3d72c7dfc9..1f6301c394 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py
> > @@ -226,8 +226,15 @@ def c_type(self):
> >          pass
> >
> >      # Return the C type to be used in a parameter list.
> > -    def c_param_type(self):
> > -        return self.c_type()
> > +    #
> > +    # The argument should be considered const, since no ownership is
> given to
> > +    # the callee, but qemu C code frequently tweaks it. Set const=3DTr=
ue
> for a
> > +    # stricter declaration.
>
> This comment makes sense only if you're familiar with Rust, where "may
> change" is actually tied to ownership.
>
>
Arguably, this semantic can also apply to C.


> However, I can't see a use of .c_param_type(True).  Sure you need this
> patch in this series?
>
>
Indeed it looks like a leftover now. Let's drop it.

> +    def c_param_type(self, const: bool =3D False):
> > +        c_type =3D self.c_type()
> > +        if const and c_type.endswith(POINTER_SUFFIX):
> > +            c_type =3D 'const ' + c_type
> > +        return c_type
> >
> >      # Return the C type to be used where we suppress boxing.
> >      def c_unboxed_type(self):
> > @@ -280,10 +287,10 @@ def c_name(self):
> >      def c_type(self):
> >          return self._c_type_name
> >
> > -    def c_param_type(self):
> > +    def c_param_type(self, const: bool =3D False):
> >          if self.name =3D=3D 'str':
> >              return 'const ' + self._c_type_name
> > -        return self._c_type_name
> > +        return super().c_param_type(const)
>
> Would
>
>        def c_param_type(self, const: bool =3D False):
>            return super().c_param_type(const or self.name =3D=3D 'str')
>
> do?
>
> >
> >      def json_type(self):
> >          return self._json_type_name
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e4beb105cb7cc355
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 4:12 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The argument isn&#39;t owned by the callee, so it better be const.<br>
&gt; But a lot of code in QEMU rely on non-const arguments to tweak it (ste=
al<br>
&gt; values etc).<br>
&gt;<br>
&gt; Since Rust types / bindings are derived from the C version, we have to=
<br>
&gt; be more accurate there to do correct ownership in the bindings.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/schema.py | 15 +++++++++++----<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
&gt; index 3d72c7dfc9..1f6301c394 100644<br>
&gt; --- a/scripts/qapi/schema.py<br>
&gt; +++ b/scripts/qapi/schema.py<br>
&gt; @@ -226,8 +226,15 @@ def c_type(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Return the C type to be used in a parameter list=
.<br>
&gt; -=C2=A0 =C2=A0 def c_param_type(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.c_type()<br>
&gt; +=C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 # The argument should be considered const, since no own=
ership is given to<br>
&gt; +=C2=A0 =C2=A0 # the callee, but qemu C code frequently tweaks it. Set=
 const=3DTrue for a<br>
&gt; +=C2=A0 =C2=A0 # stricter declaration.<br>
<br>
This comment makes sense only if you&#39;re familiar with Rust, where &quot=
;may<br>
change&quot; is actually tied to ownership.<br>
<br></blockquote><div><br></div><div>Arguably, this semantic can also apply=
 to C.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
However, I can&#39;t see a use of .c_param_type(True).=C2=A0 Sure you need =
this<br>
patch in this series?<br>
<br></blockquote><div><br></div><div>Indeed it looks like a leftover now. L=
et&#39;s drop it.<br></div><div> <br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt; +=C2=A0 =C2=A0 def c_param_type(self, const: bool =3D False):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c_type =3D self.c_type()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if const and c_type.endswith(POINTER_SUFF=
IX):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_type =3D &#39;const &#39;=
 + c_type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return c_type<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Return the C type to be used where we suppress b=
oxing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def c_unboxed_type(self):<br>
&gt; @@ -280,10 +287,10 @@ def c_name(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def c_type(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._c_type_name<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def c_param_type(self):<br>
&gt; +=C2=A0 =C2=A0 def c_param_type(self, const: bool =3D False):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://self.name" rel=
=3D"noreferrer" target=3D"_blank">self.name</a> =3D=3D &#39;str&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;const &#39=
; + self._c_type_name<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._c_type_name<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return super().c_param_type(const)<br>
<br>
Would<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0def c_param_type(self, const: bool =3D False):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return super().c_param_type(const =
or <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.n=
ame</a> =3D=3D &#39;str&#39;)<br>
<br>
do?<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def json_type(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._json_type_name<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e4beb105cb7cc355--

