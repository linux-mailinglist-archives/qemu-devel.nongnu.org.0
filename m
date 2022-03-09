Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4C4D2B64
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:06:49 +0100 (CET)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRsHQ-0006PA-N7
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRs5e-0006cK-NN
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:54:40 -0500
Received: from [2a00:1450:4864:20::332] (port=34662
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRs5d-00012m-23
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:54:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso2269022wms.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=APt6xB9Cp6UxvfJQ+H21R36xfbo6912XxzyBl0zd7sY=;
 b=Cp5ISaYs8AVYIBmfBoD4CEbSFXxM/NzvUCTtVRhN732AMz0bl/vNHvw6JIGezrj8sG
 uU9XP3CmHqm+GdAI1k0TxQnXBA0nO+V5NjniFFvak19nLvEXf23LmW5s6zBw27LJ03nf
 mJsIv/XPBW4BUgwLja7kSdFEk5QzAtqWtKUvNxpiMh+MIM9YK2YBdoEiatOjEf/zg3mh
 dQmLuN4vjPqiax0dpSKwMILHxj+5C1JHJHUwteBOujqqcKIffiKLwJ/r11YNrBX3/rZ1
 iwqbCNrFHPXbun0VgCO7PVipKmfv+vQF07RlKMxpbsS/OcMTeYw11YuIDe0b3ZKe++rl
 00FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APt6xB9Cp6UxvfJQ+H21R36xfbo6912XxzyBl0zd7sY=;
 b=1dmtGMTzVofkEPvzexT3lhh7MsGdzg7dKnckqXPUXIoA0hoSiBn8nbbEL4Xg5qkCuj
 MFS943dzqaOfGMnpZA55GDOWDK3xxLQdkKnrzLi8rTNgPrSTdeUp7nqGS8hK4rblwOem
 sxdBXnV3GQ96s3SCxq8mqGdrvk7uiHPoRvUNzVtNthscnFPwr6uHoPe5Y0R68ZpoPBmW
 ktZoXlIpUxyxeKQupohzZuHaMF+eWCNnx4cjGFbEg3JphazDA3qeE8tItORwdQUaosBV
 nQBdeLWoY+dXX8wfak0ozLrHshiUJZceS1SMrgL6YBMsKoVFigNZ/0JnZqu7a+wjU3ao
 QVkQ==
X-Gm-Message-State: AOAM532Y0cJWi8N0FohmUV2v86aSJGUqnWyTrQqBCqRdSCo7tjH5mS8K
 em7hiEC3VzKMPfF0+AaH4J8wSuEtoCheCghYzpc=
X-Google-Smtp-Source: ABdhPJzQ7xJ2vaY+o62gohb1DdizGPy0Afmx++YiN0uir0gCBCxLdaNzezHb2jcgxrYtt5IZ/Dy4YM1J2KQZIhkX3us=
X-Received: by 2002:a7b:c759:0:b0:389:82c6:ac44 with SMTP id
 w25-20020a7bc759000000b0038982c6ac44mr6501985wmk.168.1646816075661; Wed, 09
 Mar 2022 00:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
In-Reply-To: <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 12:54:23 +0400
Message-ID: <CAJ+F1CKyic3u56Dz=3RWkVKXqqgN_i_yYcwme8VROLzCerYdEA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000033480705d9c53fbb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000033480705d9c53fbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 12:49 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 17:40, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 9, 2022 at 12:34 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/09 17:33, Marc-Andr=C3=A9 Lureau wrote:
> >      > Hi
> >      >
> >      > On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >      > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>> wrote:
> >      >
> >      >
> >      >     If it is expected that dpy_gfx_update is required, it should
> call
> >      >     dpy_gfx_update. I agree it is not a right timing to fix vnc
> >     to remove
> >      >     the implicit update as it is pre-existing.
> >      >     However the lack of dpy_gfx_update call is a regression and
> >     should
> >      >     be fixed.
> >      >
> >      >
> >      > Calling dpy_gfx_update is done when the scanount.kind is SURFACE=
.
> >      >
> >      > dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.
> >      >
> >      > --
> >      > Marc-Andr=C3=A9 Lureau
> >
> >     egl-headless requires non-OpenGL to display the surface content eve=
n
> if
> >     scanout.kind is not SURFACE. Calling dpy_gfx_update is done when th=
e
> >     scanount.kind is SURFACE is not enough.
> >
> >
> > We are going in circles... egl-headless call dpy_gfx_update on
> > dpy_gl_update.
> > --
> > Marc-Andr=C3=A9 Lureau
>
> Ok, let me summarize the situation.
>
> The problem occurs in the following condition.
> 1. register_displaychangelistener of console_select is called for a
> non-OpenGL display.
> 2. scanout.kind is SURFACE_TEXTURE or SURFACE_DMABUF.
>

You mean SCANOUT_TEXTURE or SCANOUT_DMABUF.


> 3. egl-headless is employed.
>
> dpy_gfx_switch and dpy_gfx_update need to be called to finish the
> initialization or switching of the non-OpenGL display. However, the
> proposed patch only calls dpy_gfx_switch.
>

dpy_gfx_update  is called for non-opengl (SCANOUT_SURFACE)


> vnc actually does not need dpy_gfx_update because the vnc implementation
> of dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the
> model of ui/console expects the two of dpy_gfx_switch and dpy_gfx_update
> is separated and only calling dpy_gfx_switch violates the model.
> dpy_gfx_update used to be called even in such a case before and it is a
> regression.
>

Sorry, I don't see a regression. Can you translate that to an actually user
visible regression?


--=20
Marc-Andr=C3=A9 Lureau

--00000000000033480705d9c53fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 12:49 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 2022/03/09 17:40, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 9, 2022 at 12:34 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 17:33, Marc-Andr=C3=A9 Lureau wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targ=
et=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gm=
ail.com" target=3D"_blank">akihiko.odaki@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0If it is expected that dpy=
_gfx_update is required, it should call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update. I agree it=
 is not a right timing to fix vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0to remove<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the implicit update as it =
is pre-existing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0However the lack of dpy_gf=
x_update call is a regression and<br>
&gt;=C2=A0 =C2=A0 =C2=A0should<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0be fixed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Calling dpy_gfx_update is done when the scano=
unt.kind is SURFACE.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; dpy_gfx_update is specific to SURFACE, GL use=
s dpy_gl_update.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Marc-Andr=C3=A9 Lureau<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0egl-headless requires non-OpenGL to display the sur=
face content even if<br>
&gt;=C2=A0 =C2=A0 =C2=A0scanout.kind is not SURFACE. Calling dpy_gfx_update=
 is done when the<br>
&gt;=C2=A0 =C2=A0 =C2=A0scanount.kind is SURFACE is not enough.<br>
&gt; <br>
&gt; <br>
&gt; We are going in circles... egl-headless call dpy_gfx_update on <br>
&gt; dpy_gl_update.<br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
Ok, let me summarize the situation.<br>
<br>
The problem occurs in the following condition.<br>
1. register_displaychangelistener of console_select is called for a <br>
non-OpenGL display.<br>
2. scanout.kind is SURFACE_TEXTURE or SURFACE_DMABUF.<br></blockquote><div>=
<br></div><div>You mean SCANOUT_TEXTURE or SCANOUT_DMABUF.</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
3. egl-headless is employed.<br>
<br>
dpy_gfx_switch and dpy_gfx_update need to be called to finish the <br>
initialization or switching of the non-OpenGL display. However, the <br>
proposed patch only calls dpy_gfx_switch.<br></blockquote><div><br></div><d=
iv>dpy_gfx_update=C2=A0 is called for non-opengl (SCANOUT_SURFACE)</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
vnc actually does not need dpy_gfx_update because the vnc implementation <b=
r>
of dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the <br>
model of ui/console expects the two of dpy_gfx_switch and dpy_gfx_update <b=
r>
is separated and only calling dpy_gfx_switch violates the model. <br>
dpy_gfx_update used to be called even in such a case before and it is a <br=
>
regression.<br></blockquote><div><br></div><div>Sorry, I don&#39;t see a re=
gression. Can you translate that to an actually user visible regression? <b=
r></div><div>=C2=A0</div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000033480705d9c53fbb--

