Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C614D2C98
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:55:05 +0100 (CET)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRt28-0000ON-8w
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRt1C-00084z-9c
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:54:06 -0500
Received: from [2a00:1450:4864:20::429] (port=41910
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRt1A-0001bu-Ma
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:54:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id i8so2108908wrr.8
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ufQxDji9/VNOqVYXhuNCDRNO1uIy1+yS7UY4/hs9X8=;
 b=NEqfcSgWbKm/xaUBxqoIWLx6KeAnhwx/ORkNdsx/xWcZ/DSEz8oMvB355oaHoeBiI9
 Fqle/C4wxe7pUxsREUVClXvdsV5oFo2fDSu1fnai8TziGNc5MFoO5Yy2ZwB64B3283d/
 Bv8Rs5hxx964Qd3DkoTOWfiCiJeozgAReaCCZPuHEiGq5mHngLnK2VL545OWmBylh7Gz
 I88+WvtjKJLAAx9bTMcWvyW5d5E4W+yH72HwaNdNOl+22QTADP8xhkIIE/06YccuNsgj
 xGZKqJhkFPj4Jl+UjIb+L9jyKjFB8TUxh0UHVFX+5vL4cjgsAPdTQM7Rnr/SU4cE2Mjy
 0k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ufQxDji9/VNOqVYXhuNCDRNO1uIy1+yS7UY4/hs9X8=;
 b=dQxQnymRVJ1jbTMAE+bkqtxvfcBeEbNC+yRRlxmrJjyqbIT8bx6tRGhXHFdIUt40NO
 SA+26G5ex35jVlrelIu909N7119Hmyt0mZkwM6xk5uPlfUARGN3tUyBM8soo4WgQ3YiZ
 bFj/be23hy24uBwR5znOspdhLmfcadM0hHFkCK9p4xGp54gvl5jULSeNGKYwrwF9Z38M
 Y4ArpMdOnUeB7fvbbX//5CyD46ebh4t0TkCBnMXRiMOwQ6RmQoyHeLxb9Tkhbit2OPgm
 yJqAfFBdKrM7nqtuNDOZhsCflvnRqaM67svklaQ/3jruSiD0Qr/tu2DXbnCVzGB4+N4d
 bDEw==
X-Gm-Message-State: AOAM530k3mdKYVChloD5edXXGkaKg/ncszcxS4eWbDjr1jGETi0X9bUy
 cMfQHkQj7BgzgMzm01neIZ+ZWo7XRKxh2CGdTyk=
X-Google-Smtp-Source: ABdhPJzryRMBzlNhQXGfNvFLffUonXdont3OjN6skD0IURjPTRiKTZ8rwcfiAHOjK4iRVCHTAk47/SlDY0cUSfHOJuI=
X-Received: by 2002:a5d:58d3:0:b0:1f1:dfb1:ab63 with SMTP id
 o19-20020a5d58d3000000b001f1dfb1ab63mr15244798wrf.326.1646819643159; Wed, 09
 Mar 2022 01:54:03 -0800 (PST)
MIME-Version: 1.0
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
 <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
In-Reply-To: <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 13:53:51 +0400
Message-ID: <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d6f95505d9c61301"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d6f95505d9c61301
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 18:26, Gerd Hoffmann wrote:
> >    Hi,
> >
> >> dpy_gfx_switch and dpy_gfx_update need to be called to finish the
> >> initialization or switching of the non-OpenGL display. However, the
> proposed
> >> patch only calls dpy_gfx_switch.
> >>
> >> vnc actually does not need dpy_gfx_update because the vnc
> implementation of
> >> dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the
> model of
> >> ui/console expects the two of dpy_gfx_switch and dpy_gfx_update is
> separated
> >> and only calling dpy_gfx_switch violates the model. dpy_gfx_update use=
d
> to
> >> be called even in such a case before and it is a regression.
> >
> > Well, no, the ->dpy_gfx_switch() callback is supposed to do everything
> > needed to bring the new surface to the screen.  vnc isn't alone here,
> > gtk for example does the same (see gd_switch()).
> >
>

If dpy_gfx_switch() implies a full dpy_gfx_update(), then we would need
another callback to just set the new surface. This would avoid intermediary
and useless switches to 2d/surface when the scanout is GL.

For consistency, we should also declare that gl_scanout_texture and
gl_scanout_dmabuf imply full update as well.


> > Yes, typically this is roughly the same an explicit dpy_gfx_update call
> > would do.  So this could be changed if it helps making the opengl code
> > paths less confusing, but that should be a separate patch series and
> > separate discussion.
> >
> > take care,
> >    Gerd
> >
>
> Then ui/cocoa is probably wrong. I don't think it does the update when
> dpy_gfx_switch is called.
>
> Please tell me if you think dpy_gfx_switch shouldn't do the implicit
> update in the future. I'll write a patch to do the update in cocoa's
> dpy_gfx_switch implementation otherwise.
>
>
Can we ack this series first and iterate on top? It solves a number of
issues already and is a better starting point.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d6f95505d9c61301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 1:32 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/09 18:26, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0 Hi,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;&gt; dpy_gfx_switch and dpy_gfx_update need to be called to finish the<=
br>
&gt;&gt; initialization or switching of the non-OpenGL display. However, th=
e proposed<br>
&gt;&gt; patch only calls dpy_gfx_switch.<br>
&gt;&gt;<br>
&gt;&gt; vnc actually does not need dpy_gfx_update because the vnc implemen=
tation of<br>
&gt;&gt; dpy_gfx_switch implicitly does the work for dpy_gfx_update, but th=
e model of<br>
&gt;&gt; ui/console expects the two of dpy_gfx_switch and dpy_gfx_update is=
 separated<br>
&gt;&gt; and only calling dpy_gfx_switch violates the model. dpy_gfx_update=
 used to<br>
&gt;&gt; be called even in such a case before and it is a regression.<br>
&gt; <br>
&gt; Well, no, the -&gt;dpy_gfx_switch() callback is supposed to do everyth=
ing<br>
&gt; needed to bring the new surface to the screen.=C2=A0 vnc isn&#39;t alo=
ne here,<br>
&gt; gtk for example does the same (see gd_switch()).<br>
&gt; <br></blockquote><div><br></div><div>If dpy_gfx_switch() implies a ful=
l dpy_gfx_update(), then we would need another callback to just set the new=
 surface. This would avoid intermediary and useless switches to 2d/surface =
when the scanout is GL.<br></div><div><br></div><div>For consistency, we sh=
ould also declare that gl_scanout_texture and gl_scanout_dmabuf imply full =
update as well.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; Yes, typically this is roughly the same an explicit dpy_gfx_update cal=
l<br>
&gt; would do.=C2=A0 So this could be changed if it helps making the opengl=
 code<br>
&gt; paths less confusing, but that should be a separate patch series and<b=
r>
&gt; separate discussion.<br>
&gt; <br>
&gt; take care,<br>
&gt;=C2=A0 =C2=A0 Gerd<br>
&gt; <br>
<br>
Then ui/cocoa is probably wrong. I don&#39;t think it does the update when =
<br>
dpy_gfx_switch is called.<br>
<br>
Please tell me if you think dpy_gfx_switch shouldn&#39;t do the implicit <b=
r>
update in the future. I&#39;ll write a patch to do the update in cocoa&#39;=
s <br>
dpy_gfx_switch implementation otherwise.<br clear=3D"all"><br></blockquote>=
<div><br></div><div>Can we ack this series first and iterate on top? It sol=
ves a number of issues already and is a better starting point.</div><div><b=
r></div><div>thanks <br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d6f95505d9c61301--

