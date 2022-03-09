Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E764D2ACB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:44:39 +0100 (CET)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrvx-0007Ah-MH
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:44:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrsT-0005gC-Q8
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:41:03 -0500
Received: from [2a00:1450:4864:20::42d] (port=43572
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrsS-0007VM-8i
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:41:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e24so1799028wrc.10
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3X6dm4xwJ4xHnM3RihZ6mkJcQkcSqH3VKovkqhQIvzI=;
 b=WXXgmLXXAOxMmyulZ0KGEDGQHVGjET6AWUP7E6mdvs86vfX48xsJ/P4VSKvi3WSO6A
 9oyZPzu/uQYHQHAAzzbjG2cCg9BQVYITNajHkVbZoo0/UNkCkbYvWQRByARCaAMZKiKJ
 h0OZmSjsL56fGckHgKctn0vrARD5TUXH7y/2Jxa9sO6VQ722HoXjavlSnObeh0TUaj3J
 wcqB98wlOcOvvHdxaypJ0ULuOF0w2iPfB+wTT0kEvEJYKxVWtG470RfaR2skrSegdAe2
 Uo8GBzdw5JSl7i/nN0D9N4V4LLDzIIXKW+TQTY1Va7bvCk1BL+g9bxE6ovQjD++2zDxr
 jKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3X6dm4xwJ4xHnM3RihZ6mkJcQkcSqH3VKovkqhQIvzI=;
 b=ZH5BLkscUEJycom+fQ0fV/a/uurxY7bWeO8/oT0AQ4mq3bdvcHjt+2LENYwURbiOIq
 cnX3UyMB5xuE28dJhFxxPNOfXELwIZCkdLj8Ts1RoZblw0rqZQnqzW/8pBHoSeKkbjTE
 /zr3H8hKjoJcloqUbtZfFBq10k5kf/2jIT+N9/K1qhw/NThiigkGXBBhCS/g0lzh9O0S
 TSA1CZIQDjprCsWMx6Mx+awBMJPdmIboxq3iGWL1dTQg+s/lmKj/NkFsuDRa+V2kAB3+
 ptMgMe12cZ7CpyCuj7LWVq2kyG67z57q/gLxvel/vM0eiEoaeyHpixxr0nhvb1ZzwWOv
 xH+A==
X-Gm-Message-State: AOAM530mLQKc5h6RroxvOw6Hj59d8yuLKldKY7IwQJRvvgqU62tM+R3R
 QYFOjr0vwRnau+gAVC1/M5EuScQ6jppQCVrwUHU=
X-Google-Smtp-Source: ABdhPJyKa2nVQT1dJwWwCmM9XV6TmprRPEBg5qG5f8KgLYEY1LoM6+KVUE6KliXybu/EVSld0Q5ZItviL8WXkXetYKk=
X-Received: by 2002:a5d:58d3:0:b0:1f1:dfb1:ab63 with SMTP id
 o19-20020a5d58d3000000b001f1dfb1ab63mr15020308wrf.326.1646815258873; Wed, 09
 Mar 2022 00:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
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
In-Reply-To: <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 12:40:46 +0400
Message-ID: <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000084142d05d9c50ea0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
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

--00000000000084142d05d9c50ea0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 12:34 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 17:33, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >
> >     If it is expected that dpy_gfx_update is required, it should call
> >     dpy_gfx_update. I agree it is not a right timing to fix vnc to remo=
ve
> >     the implicit update as it is pre-existing.
> >     However the lack of dpy_gfx_update call is a regression and should
> >     be fixed.
> >
> >
> > Calling dpy_gfx_update is done when the scanount.kind is SURFACE.
> >
> > dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
> egl-headless requires non-OpenGL to display the surface content even if
> scanout.kind is not SURFACE. Calling dpy_gfx_update is done when the
> scanount.kind is SURFACE is not enough.
>
>
We are going in circles... egl-headless call dpy_gfx_update on
dpy_gl_update.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000084142d05d9c50ea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 12:34 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 2022/03/09 17:33, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If it is expected that dpy_gfx_update is required, =
it should call<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update. I agree it is not a right timing to=
 fix vnc to remove<br>
&gt;=C2=A0 =C2=A0 =C2=A0the implicit update as it is pre-existing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0However the lack of dpy_gfx_update call is a regres=
sion and should<br>
&gt;=C2=A0 =C2=A0 =C2=A0be fixed.<br>
&gt; <br>
&gt; <br>
&gt; Calling dpy_gfx_update is done when the scanount.kind is SURFACE.<br>
&gt; <br>
&gt; dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.<br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
egl-headless requires non-OpenGL to display the surface content even if <br=
>
scanout.kind is not SURFACE. Calling dpy_gfx_update is done when the <br>
scanount.kind is SURFACE is not enough.<br><br></blockquote><div><br></div>=
<div>We are going in circles... egl-headless call dpy_gfx_update on dpy_gl_=
update.<br></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000084142d05d9c50ea0--

