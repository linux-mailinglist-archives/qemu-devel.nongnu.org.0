Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F557E17F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:37:01 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErts-0004qy-HW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oErm3-0006z2-KF
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:28:55 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oErm1-0004JZ-Du
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:28:55 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so6109372fac.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fde+gEIU8lkxnVnZPLlQdrQiCDqPuYxSRBnVlUsjPKA=;
 b=WupNSk+qv5zAVAY0giIVcdOQNID+G7TesK7wkr/9WDgLde9V1PdmsSqognWMG5lvNI
 sYzZs3FkkX9y6PAWLjppC57uOnVfoSnHMjmDr4YV/Gq0zF3PqddN/nEhmyaG8p5YGR4P
 ZR5K0J1yDPMDjxezDjrJKcKR41QLFXKa6E3P/VfVvNUzr0ZstqwLlvrN2lCuceiXSSvX
 ze/Lu7bIFsgab0leCocZ7eRJkgLcBEdqAbQ6wzdvRRlBA0hoTEfZDKK+tNIQhJkLAGRV
 2IIkrvKErmGUvSe7XFa07zIOJXErwcLt81pEN6qR77g764QhrNayOGOPqwItNmcsE/2K
 +ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fde+gEIU8lkxnVnZPLlQdrQiCDqPuYxSRBnVlUsjPKA=;
 b=sDZ9E7sqrCkLAN32dgBLLwtU8XNbx4jfw8P4UvI9jYtc3HVBr11syG158ttvsTq+Ny
 ndif0E9mhK9jpnP22Hde7Bc1uV4hgGEnjFPEJTvsZasEQNUBmK+YPL3jpntb9mJyOYyS
 8axvJ8z1Wa/eYYswWCtO9lhSC680x3srBn9JpBtS2fRI71flYZCpHfiKpJJ+Sr7m4M0i
 Gs3E4ussTfxneckeTRyovhkTqlvH9hIkyWDIyPU3QJru2aFQwXj7X41nkngUGDPGQ8pl
 9pmqTdXrnv6pT8r3cENFCKqxlAl+G00MgSfYAJiE26ycaTsTROR2MVwW0Seyq4r/GQDi
 M66A==
X-Gm-Message-State: AJIora/RPOB15ro1R1sO0jxDBNKscjIEZSXr3nUxE0Ln7hm/DwOiNnO4
 n5Y0h+SDplZzb81fhpm5BRO39TnlNDHbfj1FrJg=
X-Google-Smtp-Source: AGRyM1stko1cngTzJ8cqzkIRXxPqGEyjjo2lZUuBHq398F4+J4tFGIHJmIh+bmoUdWPs9+YrKeKH3ktt72vYAdx4sH0=
X-Received: by 2002:a05:6870:c38e:b0:ed:f230:1494 with SMTP id
 g14-20020a056870c38e00b000edf2301494mr7674749oao.36.1658492931750; Fri, 22
 Jul 2022 05:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
 <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
 <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
 <CAMxuvawyO4uViOTUpji553dkqzRmvoL3YbDXXjd3Ca8SMmWxoA@mail.gmail.com>
In-Reply-To: <CAMxuvawyO4uViOTUpji553dkqzRmvoL3YbDXXjd3Ca8SMmWxoA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 22 Jul 2022 14:28:39 +0200
Message-ID: <CABLmASGnjbqwueo9T-Ed7x3srS9BME+C18vSfOP955cZtf=i6w@mail.gmail.com>
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000f41dc05e463fa28"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f41dc05e463fa28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 2:38 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Fri, Jun 17, 2022 at 1:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit=
?
> > >
> > > Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it
> back in
> > > with the following diff on top then everything works again:
> >
> > Ah, the other way around.
> >
> > > diff --git a/ui/console.c b/ui/console.c
> > > index 365a2c14b8..decae4287f 100644
> > > --- a/ui/console.c
> > > +++ b/ui/console.c
> > > @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,
> > >
> > >  void qemu_console_resize(QemuConsole *s, int width, int height)
> > >  {
> > > -    DisplaySurface *surface;
> > > +    DisplaySurface *surface =3D qemu_console_surface(s);
> > >
> > >      assert(s->console_type =3D=3D GRAPHIC_CONSOLE);
> > >
> > > -    if (qemu_console_get_width(s, -1) =3D=3D width &&
> > > +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
> > > +        qemu_console_get_width(s, -1) =3D=3D width &&
> > >          qemu_console_get_height(s, -1) =3D=3D height) {
> > >          return;
> > >      }
> > >
> > > > Which depth changes triggers this?  Going from direct color to a
> > > > paletted mode?
> > >
> > > A quick test suggests anything that isn't 32-bit colour is affected.
> >
> > Hmm, I think the commit should simply be reverted.
> >
> > Short-cutting the qemu_console_resize() call is only valid in case the
> > current surface was created by qemu_console_resize() too.  When it is
> > something else -- typically a surface backed by vga vram -- it's not.
> > Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...
>
> Oh ok, it might be worth adding a comment to clarify that. By
> reverting, we are going back to the situation where
> qemu_console_resize() will create a needless surface when rendering
> with GL. As I tried to explain in the commit message, it will need
> more changes to prevent that. I can take a look later.
>
>
Hi Marc-Andr=C3=A9,

I wondered whether you've had a chance to look at this?

Best,
Howard

--0000000000000f41dc05e463fa28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 17, 2022 at 2:38 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi<br>
<br>
On Fri, Jun 17, 2022 at 1:56 PM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@=
redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt;<br>
&gt; &gt; &gt; Can you try ditch the QEMU_ALLOCATED_FLAG check added by the=
 commit?<br>
&gt; &gt;<br>
&gt; &gt; Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add i=
t back in<br>
&gt; &gt; with the following diff on top then everything works again:<br>
&gt;<br>
&gt; Ah, the other way around.<br>
&gt;<br>
&gt; &gt; diff --git a/ui/console.c b/ui/console.c<br>
&gt; &gt; index 365a2c14b8..decae4287f 100644<br>
&gt; &gt; --- a/ui/console.c<br>
&gt; &gt; +++ b/ui/console.c<br>
&gt; &gt; @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 void qemu_console_resize(QemuConsole *s, int width, int hei=
ght)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 DisplaySurface *surface;<br>
&gt; &gt; +=C2=A0 =C2=A0 DisplaySurface *surface =3D qemu_console_surface(s=
);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 assert(s-&gt;console_type =3D=3D GRAPHIC_CONS=
OLE);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 if (qemu_console_get_width(s, -1) =3D=3D width &am=
p;&amp;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (surface &amp;&amp; (surface-&gt;flags &amp; QE=
MU_ALLOCATED_FLAG) &amp;&amp;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_console_get_width(s, -1) =3D=3D=
 width &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_console_get_height(s, -1) =
=3D=3D height) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; &gt; Which depth changes triggers this?=C2=A0 Going from direct c=
olor to a<br>
&gt; &gt; &gt; paletted mode?<br>
&gt; &gt;<br>
&gt; &gt; A quick test suggests anything that isn&#39;t 32-bit colour is af=
fected.<br>
&gt;<br>
&gt; Hmm, I think the commit should simply be reverted.<br>
&gt;<br>
&gt; Short-cutting the qemu_console_resize() call is only valid in case the=
<br>
&gt; current surface was created by qemu_console_resize() too.=C2=A0 When i=
t is<br>
&gt; something else -- typically a surface backed by vga vram -- it&#39;s n=
ot.<br>
&gt; Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...<br>
<br>
Oh ok, it might be worth adding a comment to clarify that. By<br>
reverting, we are going back to the situation where<br>
qemu_console_resize() will create a needless surface when rendering<br>
with GL. As I tried to explain in the commit message, it will need<br>
more changes to prevent that. I can take a look later.<br>
<br></blockquote><div><br></div><div>Hi Marc-Andr=C3=A9,</div><div><br></di=
v><div>I wondered whether you&#39;ve had a chance to look at this?</div><di=
v><br></div><div>Best,</div><div>Howard<br></div><div><br></div><div>=C2=A0=
<br></div></div></div>

--0000000000000f41dc05e463fa28--

