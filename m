Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96F3E06FE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:55:13 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBL6m-0004gF-2W
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBIX3-0003rI-Br
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:10:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBIWx-0006QA-0f
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:10:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id ec13so4031405edb.0
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RtM5VBcsggB6gEfQAxcYrfUGYjD+YjO7pW5onE387w=;
 b=Qo0PKBUWZ3LauAXMporiUy8MgRSxdFR9FA3+GYmrcZnqhPHP5tfFXUqfAFHj+TlJd+
 KQOzHWVK31n47Sdfu7avmkecTpXB5dskGlsXMUd+wFBCS4SeoUx17tyjXTmRvZ5fdUfw
 xWsO3O29JRg+/prXQIVw3snHkqaFGRXxGHb9OY0+P6EooIZMBd92f0l1RJV45UHnJbGi
 8yGxQHWtGkHL0BCh6xoVhq6qCOTf8P104c+7gjyiEoxEU8PlIXIuS/MKeQoOyf9ipmDu
 NDTtBKgijy3Gxq0CqAa8171vEFoacnovJ1DqpnKV/pXA4jPqay3nhp7PMWgruEo3q9ou
 oaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RtM5VBcsggB6gEfQAxcYrfUGYjD+YjO7pW5onE387w=;
 b=ej2Lxo0sqthkaqy82RZfB5GfyjUK/SRHlnNXehPnH7mr8aw8HMFEGWxpNGms4paxJT
 tECmbDG7yULRTb34gVEDA7jqGJwmBOFosaTgcYhQiLEoVJDTLkDehbbdUT/Q9k4KZDHM
 akZ0C1Y5gAPZIywjm52Xh9dgWFSSzZ2nLNwL+274kpbtv58wphhcJXfD4qFWhOzjNRu6
 nP8ulKdaMAJDFOoxvvHCmh06Tam8VEOp9SqtlsxlXbePaZIXl4ZvWix+xMpdITfxrRy/
 c2uJsowfTCdRZHpcACxhl2J5R4MIQzCFJ5quPGM4sZ77CT6mMKfZY0GtqB4No+yeR9pZ
 FoVw==
X-Gm-Message-State: AOAM533V4bCkMDwZ+0L7JMmxxgaEVCgGmUsN/HU+var5d0Zu3Pk5gGPq
 J9ClxWO9S2Yp8gHMHn0C7XHQfJDFYDKQ/uQsgG0=
X-Google-Smtp-Source: ABdhPJxznINR5e+jLqGHAZNd33Cr+yc3e4O3IbvQa+DVXZNE+OYdjNqhUfTaldKGIx5MsQxNz3Et83HRw6+fzO/j7zs=
X-Received: by 2002:a50:a6d7:: with SMTP id f23mr246987edc.164.1628089801557; 
 Wed, 04 Aug 2021 08:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210803120229.3453699-1-marcandre.lureau@redhat.com>
 <YQlUyQivvYUfjXf/@redhat.com>
In-Reply-To: <YQlUyQivvYUfjXf/@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 4 Aug 2021 19:09:49 +0400
Message-ID: <CAJ+F1CLNopUEKSNDBVuxrNuDAWYtHjKxukMDFFcGF1pW4e49Ew@mail.gmail.com>
Subject: Re: [PATCH] chardev: give some context on chardev-add error
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000048c9cf05c8bd32ca"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000048c9cf05c8bd32ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 6:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Tue, Aug 03, 2021 at 04:02:29PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Related to:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1984721
>
> It is preferrable to describe the problem & approach in the comit
> message, rather than leaving people to read through countless bug
> comments to understand it.
>
>
I'll update the commit message with your comment.

The original code reported:
>
>  "attempt to add duplicate property 'char2' to object (type 'container')"
>
>
> Since adding yank support, the current code reports
>
>  "duplicate yank instance"
>
> With this patch applied it now reports:
>
>  "Failed to add chardev 'char2': duplicate yank instance"
>
> This is marginally better, but still not great, not that the original
> error was great either.
>
> It would be nice if we could report
>
>   "chardev with id 'char2' already exists"
>

I can add a patch for that.


> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

thanks

> ---
> >  chardev/char.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/chardev/char.c b/chardev/char.c
> > index d959eec522..f59a61774b 100644
> > --- a/chardev/char.c
> > +++ b/chardev/char.c
> > @@ -1031,27 +1031,26 @@ Chardev *qemu_chardev_new(const char *id, const
> char *typename,
> >  ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend=
,
> >                                 Error **errp)
> >  {
> > +    ERRP_GUARD();
> >      const ChardevClass *cc;
> >      ChardevReturn *ret;
> > -    Chardev *chr;
> > +    g_autoptr(Chardev) chr =3D NULL;
> >
> >      cc =3D char_get_class(ChardevBackendKind_str(backend->type), errp)=
;
> >      if (!cc) {
> > -        return NULL;
> > +        goto err;
> >      }
> >
> >      chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> >                        backend, NULL, false, errp);
> >      if (!chr) {
> > -        return NULL;
> > +        goto err;
> >      }
> >
> >      if (!object_property_try_add_child(get_chardevs_root(), id,
> OBJECT(chr),
> >                                         errp)) {
> > -        object_unref(OBJECT(chr));
> > -        return NULL;
> > +        goto err;
> >      }
> > -    object_unref(OBJECT(chr));
> >
> >      ret =3D g_new0(ChardevReturn, 1);
> >      if (CHARDEV_IS_PTY(chr)) {
> > @@ -1060,6 +1059,10 @@ ChardevReturn *qmp_chardev_add(const char *id,
> ChardevBackend *backend,
> >      }
> >
> >      return ret;
> > +
> > +err:
> > +    error_prepend(errp, "Failed to add chardev '%s': ", id);
>
> Lowercase 'f' perhaps ?
>

We generally start error messages with an uppercase in this unit, but it's
not very consistent.


> > +    return NULL;
> >  }
>
> A weak
>
>  Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> because it is not quite so bad as current code
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000048c9cf05c8bd32ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 6:39 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_b=
lank">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Aug 03, 2021 at 04:02:29PM +0400, <a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Related to:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1984721" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1984721</a><br>
<br>
It is preferrable to describe the problem &amp; approach in the comit<br>
message, rather than leaving people to read through countless bug<br>
comments to understand it.<br>
<br></blockquote><div><br></div><div>I&#39;ll update the commit message wit=
h your comment.</div><div> <br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
The original code reported:<br>
<br>
=C2=A0&quot;attempt to add duplicate property &#39;char2&#39; to object (ty=
pe &#39;container&#39;)&quot;<br>
<br>
<br>
Since adding yank support, the current code reports<br>
<br>
=C2=A0&quot;duplicate yank instance&quot;<br>
<br>
With this patch applied it now reports:<br>
<br>
=C2=A0&quot;Failed to add chardev &#39;char2&#39;: duplicate yank instance&=
quot;<br>
<br>
This is marginally better, but still not great, not that the original<br>
error was great either.<br>
<br>
It would be nice if we could report<br>
<br>
=C2=A0 &quot;chardev with id &#39;char2&#39; already exists&quot;<br></bloc=
kquote><div><br></div><div>I can add a patch for that.</div><div> <br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
></blockquote><div><br></div><div>thanks</div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 chardev/char.c | 15 +++++++++------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/chardev/char.c b/chardev/char.c<br>
&gt; index d959eec522..f59a61774b 100644<br>
&gt; --- a/chardev/char.c<br>
&gt; +++ b/chardev/char.c<br>
&gt; @@ -1031,27 +1031,26 @@ Chardev *qemu_chardev_new(const char *id, cons=
t char *typename,<br>
&gt;=C2=A0 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *b=
ackend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const ChardevClass *cc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ChardevReturn *ret;<br>
&gt; -=C2=A0 =C2=A0 Chardev *chr;<br>
&gt; +=C2=A0 =C2=A0 g_autoptr(Chardev) chr =3D NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 cc =3D char_get_class(ChardevBackendKind_str(backe=
nd-&gt;type), errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!cc) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 chr =3D chardev_new(id, object_class_get_name(OBJE=
CT_CLASS(cc)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 backend, NULL, false, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!chr) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!object_property_try_add_child(get_chardevs_ro=
ot(), id, OBJECT(chr),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0errp)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 object_unref(OBJECT(chr));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D g_new0(ChardevReturn, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (CHARDEV_IS_PTY(chr)) {<br>
&gt; @@ -1060,6 +1059,10 @@ ChardevReturn *qmp_chardev_add(const char *id, =
ChardevBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +<br>
&gt; +err:<br>
&gt; +=C2=A0 =C2=A0 error_prepend(errp, &quot;Failed to add chardev &#39;%s=
&#39;: &quot;, id);<br>
<br>
Lowercase &#39;f&#39; perhaps ?<br></blockquote><div><br></div><div>We gene=
rally start error messages with an uppercase in this unit, but it&#39;s not=
 very consistent.<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 }<br>
<br>
A weak<br>
<br>
=C2=A0Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@r=
edhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
because it is not quite so bad as current code<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000048c9cf05c8bd32ca--

