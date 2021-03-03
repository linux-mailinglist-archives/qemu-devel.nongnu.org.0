Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7C32B866
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:56:49 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRzc-0000BQ-Dp
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lHRy8-0006vF-DN
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:55:18 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lHRy6-0002fC-3E
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:55:16 -0500
Received: by mail-ej1-x636.google.com with SMTP id bm21so23517057ejb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjn/RUuFc8Q7ju5LfAT2mmpgGjchX9SNlAlolia90sw=;
 b=JaZdJpk15IoZ/cJrfYd4pnllcykVMKE9MBE6BR6RVVYBr0uCHbSu9tBYGbm6dYVcHK
 ppLlaVdoOb8Y9y2nvptqD51BUodTNzCXPb477cwUcMwcFANRQBq7WpN4ZAl3OJ8Kuudh
 qVfC7QWEbJ2NbDwSqpDYtLxmDzHhTPOfUzXTT4K43zkW5G9tEezdlSotE65Ce5cG2Hdy
 94lIL7Jbk1e14cwMHDC30O0qaO7JrCjgbuWmTNIXI49P2AWZj8JTGp8XUtzkvUqv+ezb
 aXrmbKBW6R8UNwAanJYwMvop4X5Hf7DPICovUOxLYoP3JJchjUmrdfTPjNEGkkW5J3WO
 wadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjn/RUuFc8Q7ju5LfAT2mmpgGjchX9SNlAlolia90sw=;
 b=JQOD+HKxUN1gefBgFDK/OmoPF61sMMyUgmwlE/ihSsmaaudylwAr9Z7Kw0DCmbpsYx
 12WF7buqZZi6TbOSPZ0HmK7kpfESoOqMhYauWV3pCrm4W25vnbEa5l1nw7+KDC8UwUgd
 6RTT+Mm/mkiiZ3zoSPUAYg4X5A48FapGSxcYKHfqXUnUhqTftMKJ1mSVbtB7YczpZe0A
 5cvUBDenXPpllPmkCklA29vCmURpLIWr6qnpGEw+Fg8MZ2hSPMz6nm7h5FJeXuMW+Jdx
 PnYh230yeOFYSfL0/4WGlJ19rLxAT/I++JGLhQ7pBLW8HiiyZoupIIqMYs0SvoD0kAgm
 hdwQ==
X-Gm-Message-State: AOAM530v7LgcbZkTMyaoOwpuZCT97rXGY88v40+wMZ7Yf53dIIn8trXl
 2bI7EQyc9yff8Gf+fdlRjeLVdXbvlYyaewhkSFE=
X-Google-Smtp-Source: ABdhPJzJQtYCXrRdUruAUoYYWIeD2wilGvFRP5kmW+mLDzdZ8uib5kIERiFI03NL0ADCWkIdpoJzQWTQrAH2fAPcT14=
X-Received: by 2002:a17:906:40c7:: with SMTP id
 a7mr19496159ejk.109.1614779711506; 
 Wed, 03 Mar 2021 05:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-8-kraxel@redhat.com>
 <CAJ+F1C+7aZyDOGB+CD2CubxzTexJ0kBkMx76Zk4zpHiQZuEx9Q@mail.gmail.com>
 <20210303122014.gmgfgz462aa5vuya@sirius.home.kraxel.org>
In-Reply-To: <20210303122014.gmgfgz462aa5vuya@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Mar 2021 17:54:59 +0400
Message-ID: <CAJ+F1CJV=BwYsZ70YVxQC+LXxzq_o3G3XCSa-nf=6V+MSqcQ4g@mail.gmail.com>
Subject: Re: [PATCH 7/7] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000184d2d05bca233d1"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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

--000000000000184d2d05bca233d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 3, 2021 at 4:20 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > +    if (info !=3D gd->cbinfo[s]) {
> > > +        qemu_clipboard_info_put(gd->cbinfo[s]);
> > > +        gd->cbinfo[s] =3D qemu_clipboard_info_get(info);
> > > +        gd->cbpending[s] =3D 0;
> > > +        if (!self_update) {
> > > +            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> > > +                qemu_clipboard_request(info,
> QEMU_CLIPBOARD_TYPE_TEXT);
> >
> > Always requesting the clipboard is a bit harsh, isn't it?
> >
> > +            }
> > > +        }
> > > +        return;
> > > +    }
> > > +
> > > +    if (self_update) {
> > > +        return;
> > > +    }
> > > +
> > > +    if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available &&
> > > +        info->types[QEMU_CLIPBOARD_TYPE_TEXT].data) {
> > > +        gtk_clipboard_set_text(gd->gtkcb[s],
> > > +
>  info->types[QEMU_CLIPBOARD_TYPE_TEXT].data,
>
> Well, I want gtk deal with the compatibility stuff like all the
> different target names we have for text ("STRING", "text/plain", ...),
> and using gtk_clipboard_set_text() seems to be the only way to do that.
>
> I'm open to better ideas.
>
>
Basically implement an async version of the Gtk function:
https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkclipboard.c#L850

Instead of "gtk_clipboard_set_with_data" taking a copy of the text,
implement the callbacks to request the data from the guest.

I am not sure about gtk_clipboard_set_can_store() interactions, it's
probably only when the application quits by default. I wouldn't worry about
it for now.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000184d2d05bca233d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 3, 2021 at 4:20 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
Hi,<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 if (info !=3D gd-&gt;cbinfo[s]) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(gd-&gt;cbinf=
o[s]);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbinfo[s] =3D qemu_clipboard_=
info_get(info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbpending[s] =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!self_update) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;types[QEM=
U_CLIPBOARD_TYPE_TEXT].available) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cli=
pboard_request(info, QEMU_CLIPBOARD_TYPE_TEXT);<br>
&gt; <br>
&gt; Always requesting the clipboard is a bit harsh, isn&#39;t it?<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (self_update) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (info-&gt;types[QEMU_CLIPBOARD_TYPE_TEXT].avail=
able &amp;&amp;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CLIPBOARD_TYPE_T=
EXT].data) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_set_text(gd-&gt;gtkcb[=
s],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[QEMU_CLIPBOA=
RD_TYPE_TEXT].data,<br>
<br>
Well, I want gtk deal with the compatibility stuff like all the<br>
different target names we have for text (&quot;STRING&quot;, &quot;text/pla=
in&quot;, ...),<br>
and using gtk_clipboard_set_text() seems to be the only way to do that.<br>
<br>
I&#39;m open to better ideas.<br clear=3D"all"><br></blockquote><div><br></=
div><div>Basically implement an async version of the Gtk function: <a href=
=3D"https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkclipboard.c#L=
850">https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkclipboard.c#=
L850</a></div><div><br></div><div>Instead of &quot;gtk_clipboard_set_with_d=
ata&quot; taking a copy of the text, implement the callbacks to request the=
 data from the guest.</div><div><br></div><div>I am not sure about gtk_clip=
board_set_can_store() interactions, it&#39;s probably only when the applica=
tion quits by default. I wouldn&#39;t worry about it for now.<br class=3D"g=
mail-Apple-interchange-newline"><br></div></div><br>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000184d2d05bca233d1--

