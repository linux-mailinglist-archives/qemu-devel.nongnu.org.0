Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B334761A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:28:16 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0kJ-0006iv-5P
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP0ia-0006Eh-O3
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:26:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP0iW-0006bU-0e
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:26:28 -0400
Received: by mail-ej1-x635.google.com with SMTP id b7so31964871ejv.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKKn27vZ14/A55czGc82jsfliWNOiR+sbXhUIfwQcjI=;
 b=MhTQPY8sz4NCRWsEJRyN7dPtljc5RKr27REWuNp4+OqFm3+oQ3CIYi5B+S+zu0riQo
 Hsm7xCMMmGX0VfkFOxat67DodGGpHc+uDfi6UHUlBRRwsKJh6OqTJe5jZWdBiJ2qe7OU
 TdcOBE48enPEW815zCjz+v0SEyF6+kjjIYynY4gJzDjdr9cc29DVja8JMG+JEWgs1vbo
 XAzA+CacBSKjORFPBHZtl6gseebZOTPjcOWNUqYVi+edh9uhxYyqi3xR+TlRaO78C9UC
 2x8UN3oyi/YYGlt2AbpDokNAGRYxaUEElnhxLGJHUWznGfyqjdzCYdNXqTddtejaRzkK
 GW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKKn27vZ14/A55czGc82jsfliWNOiR+sbXhUIfwQcjI=;
 b=IMGiRBJ/x8d/zvNFsiEt0RCbx2PMZNDUt2SqaB1OcR93NptW/lxbhjFg1VQbi2r+CY
 uAda1fmvaEtv6mmqTAR6lKj1riWZeWthQCzmQOYGCWmobt5ljj+0XrArnngVFI5G/flc
 LjX+zFypwKXK3PdCLZQRyGgcxkz/Wx9r3Wv1Eh5ahshVrZ3vRHVkfA8/G3VaLcxvSi+1
 dYt3D05d0izkIi/weCanbUrxr5aqoDu4AVSVW/oFau2GdB5aBQ53lJ6AzNu86m5M+TFA
 CMIFeX+YUkQbkvxY6dT8skBatQzw2ldSbtErb39bDO04ah9Xue2z9efFCxdSTTAyDvt3
 haPw==
X-Gm-Message-State: AOAM533htZ/6+Fhu/rhu3iHB2nv1Rjmv4seX+DsoeGrdPL/yzF+q6OUX
 S+r2v0BlqgHXWah4jh5SG53OBhvqEVGbOiaIsQI=
X-Google-Smtp-Source: ABdhPJzQZZHiOg/HzoDQZbNFnEeISC5stcOhH7t5W6p4VMgB88FwZRIF/EmyMv4G2xWdObVuYOg/TKyV/TijYqaI7hk=
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr2855728eju.532.1616581581855; 
 Wed, 24 Mar 2021 03:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
 <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
 <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
In-Reply-To: <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 14:26:10 +0400
Message-ID: <CAJ+F1C+HKdo_MK4rgw4pOpVzRnUu3Pu8O9YrjwFu8ZxGQCP+3A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000efe08d05be45baed"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000efe08d05be45baed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 24, 2021 at 2:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > +    if (gd->cbowner[s]) {
> > > +        /* ignore notifications about our own grabs */
> > > +        return;
> > > +    }
> > > +
> > > +
> > > +    switch (event->owner_change.reason) {
> > > +    case GDK_SETTING_ACTION_NEW:
> > > +        info =3D qemu_clipboard_info_new(&gd->cbpeer, s);
> > > +        if (gtk_clipboard_wait_is_text_available(clipboard)) {
> > > +            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available =3D true=
;
> > > +        }
> > >
> >
> > Same comment as v1:
> > So after gtk_clipboard_set_text() the client side is actually taking
> > the ownership away from the guest clipboard I presume. That might have
> some
> > weird interaction issues. Hopefully the other side isn't playing the sa=
me
> > game...
>
> The cbowner check above should avoid that ...
>

I fail to see how that works, imagine the other end is the same code (qemu
in the guest), it will take clipboard ownership and it is in a endless
loop, isn't it?

>
> > > +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =3D
> > > +        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
> >
> > Why not use GDK_SELECTION_* ?
>
> So I don't have to worry about converting GDK_SELECTION_* to
> QEMU_CLIPBOARD_SELECTION_* ?
>
>
GDK_SELECTION* is gdk_atom_intern(*, FALSE)) afaik

--=20
Marc-Andr=C3=A9 Lureau

--000000000000efe08d05be45baed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 2:16 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi,<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 if (gd-&gt;cbowner[s]) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ignore notifications about our ow=
n grabs */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (event-&gt;owner_change.reason) {<br>
&gt; &gt; +=C2=A0 =C2=A0 case GDK_SETTING_ACTION_NEW:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D qemu_clipboard_info_new(&am=
p;gd-&gt;cbpeer, s);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gtk_clipboard_wait_is_text_avail=
able(clipboard)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CL=
IPBOARD_TYPE_TEXT].available =3D true;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; <br>
&gt; Same comment as v1:<br>
&gt; So after gtk_clipboard_set_text() the client side is actually taking<b=
r>
&gt; the ownership away from the guest clipboard I presume. That might have=
 some<br>
&gt; weird interaction issues. Hopefully the other side isn&#39;t playing t=
he same<br>
&gt; game...<br>
<br>
The cbowner check above should avoid that ...<br></blockquote><div><br></di=
v><div>I fail to see how that works, imagine the other end is the same code=
 (qemu in the guest), it will take clipboard ownership and it is in a endle=
ss loop, isn&#39;t it?<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; &gt; +=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =
=3D<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&q=
uot;CLIPBOARD&quot;, FALSE));<br>
&gt; <br>
&gt; Why not use GDK_SELECTION_* ?<br>
<br>
So I don&#39;t have to worry about converting GDK_SELECTION_* to<br>
QEMU_CLIPBOARD_SELECTION_* ?<br>
<br></blockquote><div><br></div>GDK_SELECTION* is gdk_atom_intern(*, FALSE)=
) afaik<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc=
-Andr=C3=A9 Lureau<br></div></div>

--000000000000efe08d05be45baed--

