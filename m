Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0842D2551
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:03:50 +0100 (CET)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXyO-0005tM-LU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmXx0-0005S6-Bs
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:02:22 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmXwx-0002kZ-Qy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:02:22 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so23357475ejk.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jq4IWX7m6dyYGopqISV8hPn9tv4rRwmEFj58Ije/uCo=;
 b=swQkeVldqVXOWZmwbnYi+N3OWqK7zuF2C1CL12AYmiJW1FAnW8IjI0sCw8PPfFltMK
 f4uWRDh3G6h7bi0HljaKMbPfx8eCxDmCwac7I82iple1NDyAz3nsvuo1+vuwlgdJhFKs
 u+Ra8juo1M6+ouNekQ0XMJw2mVwCd3fSAS9rgGeOtbnr7bHjVdeI5uDDtgg+LPQq+/gT
 AayqbRAk7+ccX/gK0Wz/LxNuhYx8vdgkVVUARuN/PK/H7nuXvzt6zHiN7U93Pv+sbudO
 yW7q7NoTyCp+uTDfqeabqXzVd6jqRFq4wm/8KXupFOlwrYm552lypA8gIAONhfgceWFG
 7rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jq4IWX7m6dyYGopqISV8hPn9tv4rRwmEFj58Ije/uCo=;
 b=N0UIb6rbMBQKBhyGwx4676Z/iCzcycuBkqxOQi7zOp2/IUvN5FxEhetSdaf8wAj3x9
 gub+losI27PXtPTDCvZ36vmsuTu2ukxPzIVENcAMMJD0GK/FDwZeStKZgqbzrLbXjK9c
 FWdpUtNABQmZEwkdmTFqzxNlGn//72HQPhQNOeK715hkS93/VigkADbIW1LmUzokyr7J
 bEbM2zJIrm4NGm5yJrEcgHvjwY32XezW7r3lFLROYkky3i3a/wo8H3JJjllzNkopoN4z
 h0Iq7w4dxR94EmgVanQ80kyGAJ90tMXhgt0lJ6uD6IuylLHOvboLc324sNxRy8PN5cgd
 PMEA==
X-Gm-Message-State: AOAM532kKjFKcoQ+m6k9dRew9LkvxIeAtT8hhDIIY6Vkt4gi1oXAkyoc
 ej88oIT7Kn7rxZB/adm7CbhdGYJqu6ADqOmKTOg=
X-Google-Smtp-Source: ABdhPJxVeK1Jt9HvpnKZaq2V5YVfnvELpU/dXolkB08nxpUVnm+0I+mRHdzVyzA5vlcFHfAWRHWMTOnDdNxe79RHRRw=
X-Received: by 2002:a17:906:3e02:: with SMTP id
 k2mr22584551eji.92.1607414537918; 
 Tue, 08 Dec 2020 00:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-8-kraxel@redhat.com>
 <CAJ+F1C+UFScS8_+fzRniYwKepxv4FQr0=TFTGsBhg22kfw7zRA@mail.gmail.com>
 <20201208065740.njrxpvnjkofhpmxg@sirius.home.kraxel.org>
In-Reply-To: <20201208065740.njrxpvnjkofhpmxg@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 12:02:04 +0400
Message-ID: <CAJ+F1CLW7Vxc81h8TOrkT6J_HMnes43Xyx47yVagjz=eCYepxA@mail.gmail.com>
Subject: Re: [PATCH 7/9] vnc: force initial resize message
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008a1e0f05b5ef5c1e"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a1e0f05b5ef5c1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 8, 2020 at 10:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Dec 04, 2020 at 03:57:23PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Dec 3, 2020 at 3:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > > The vnc server should send desktop resize notifications unconditional=
ly
> > > on a new client connect, for feature negotiation reasons.  Add a bool
> > > flag to vnc_desktop_resize() to force sending the message even in cas=
e
> > > there is no size change.
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > >
> >
> > In principle, this looks harmless. But the spec says:
> >
> > "The server should only send a *DesktopSize* pseudo-rectangle when an
> > actual change of the framebuffer dimensions has occurred. Some clients
> > respond to a *DesktopSize* pseudo-rectangle in a way that could send th=
e
> > system into an infinite loop if the server sent out the pseudo-rectangl=
e
> > for anything other than an actual change."
> > (
> >
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#server-sema=
ntics
> > )
> >
> > I can't say if sending desktop resize during the initial SetEncoding
> phase
> > is really compliant with the specification. Also, it's unclear to me if
> the
> > client is allowed to SetEncoding multiple times (in which there would b=
e
> no
> > dimension change occurring).
> >
> > What did you fix with this? Is it worth a clarification in the
> > specification?
>
> Well, for ExtendedDesktopResize the spec explicitly asked for this.
> But, yes, for DesktopResize this is not needed.  But it also shouldn't
> cause much trouble.  It is sent before any actual display updates, so
> concerns whenever the client should consider the screen content invalid
> or not are moot.
>
> I could squash this into patch #8 and do it for ExtendedDesktopResize
> only ...
>

Ok, it's probably fine (dunno), you could also capture that in the commit
message, or as code comment.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000008a1e0f05b5ef5c1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 8, 2020 at 10:57 AM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Dec 04, 2020 at 03:57:23PM +0400, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Dec 3, 2020 at 3:12 PM Gerd Hoffmann &lt;<a href=3D"mailto:kra=
xel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; The vnc server should send desktop resize notifications unconditi=
onally<br>
&gt; &gt; on a new client connect, for feature negotiation reasons.=C2=A0 A=
dd a bool<br>
&gt; &gt; flag to vnc_desktop_resize() to force sending the message even in=
 case<br>
&gt; &gt; there is no size change.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.=
com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; In principle, this looks harmless. But the spec says:<br>
&gt; <br>
&gt; &quot;The server should only send a *DesktopSize* pseudo-rectangle whe=
n an<br>
&gt; actual change of the framebuffer dimensions has occurred. Some clients=
<br>
&gt; respond to a *DesktopSize* pseudo-rectangle in a way that could send t=
he<br>
&gt; system into an infinite loop if the server sent out the pseudo-rectang=
le<br>
&gt; for anything other than an actual change.&quot;<br>
&gt; (<br>
&gt; <a href=3D"https://github.com/rfbproto/rfbproto/blob/master/rfbproto.r=
st#server-semantics" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/rfbproto/rfbproto/blob/master/rfbproto.rst#server-semantics</a><br>
&gt; )<br>
&gt; <br>
&gt; I can&#39;t say if sending desktop resize during the initial SetEncodi=
ng phase<br>
&gt; is really compliant with the specification. Also, it&#39;s unclear to =
me if the<br>
&gt; client is allowed to SetEncoding multiple times (in which there would =
be no<br>
&gt; dimension change occurring).<br>
&gt; <br>
&gt; What did you fix with this? Is it worth a clarification in the<br>
&gt; specification?<br>
<br>
Well, for ExtendedDesktopResize the spec explicitly asked for this.<br>
But, yes, for DesktopResize this is not needed.=C2=A0 But it also shouldn&#=
39;t<br>
cause much trouble.=C2=A0 It is sent before any actual display updates, so<=
br>
concerns whenever the client should consider the screen content invalid<br>
or not are moot.<br>
<br>
I could squash this into patch #8 and do it for ExtendedDesktopResize<br>
only ...<br></blockquote><div><br></div><div>Ok, it&#39;s probably fine (du=
nno), you could also capture that in the commit message, or as code comment=
.</div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008a1e0f05b5ef5c1e--

