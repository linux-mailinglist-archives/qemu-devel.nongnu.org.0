Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23C4D2A6D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:15:54 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrU9-0008Kl-Dg
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:15:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrQa-00072I-2R
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:12:16 -0500
Received: from [2a00:1450:4864:20::429] (port=36538
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrQX-0001gV-Qw
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:12:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id r10so1738985wrp.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhnwxISR4lZKApeVAIMguxRjxiStHos7J6XXYSsnZXs=;
 b=n6UTaAhoye6elAKBdI8r79nkT9gAU+I0BtAvtDxSLZuz/qkI2EVPoeONQXZuY7ueGN
 55HJTbS/UbAoi+Fldv6bXwQb2zJ/EkHrFQ/F71C36K+NOooQLSJtUbLFzxsq4QDgdQEh
 j3HrW5WX+Ht9RSIbJD+8tpwz5KLqcOv4hGWxvg9osyDjdj37hC6EOih0g6J4KaJwoqqP
 Zd4Jd6ZgIFNatswtjsxK0L15/OH1uHtMjUgblTTuUqsnr+gjR1uQbk+GB/HJP+XGMdxa
 MtXYTabuUi9eC+5UFX3N3D606z4oA+wyOytxN8acC6K/3DB2w+EMJLqQnl+jUvb7nyGt
 Z43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhnwxISR4lZKApeVAIMguxRjxiStHos7J6XXYSsnZXs=;
 b=3JJTg5rEhYwoOZtIds1QYUY/c02Br7ZMdm3XzF7bKFDuM5mc/X/n25YBlOr6cV70mM
 iBUda2P7DOlhXgHrxPrhQzNuqRI3WE64HI/Vy5dZLfOOR4s3XRC0td5nVgefGjTaxd+0
 86jS2cLMW4kughqHwcuKUEHZNUi8VE3BuM0lmok/qkfiWNBFAGkD6fgeZw4cPIyQeETK
 Un2dWV66iWr8STTTnUzSP8L/gq5RKEO2tTh32pBuWt8RxqWaEtVMwWrEB3leGuIXtNBN
 Zr+vkXI6pni/9nBvDOwLrCvbmThD96UzcalAHPz1nKpA64QhYeyfiom8jPK+XRizopg4
 ut+w==
X-Gm-Message-State: AOAM530OC3XrrrVG3mnvM+H1c9f7aPhMb5JW7N7wf58nnfrZXznPvWWL
 iyUB4KHW4OqYhdZ0G/c9DBQmqo12KFwkc+O/6L4=
X-Google-Smtp-Source: ABdhPJwfRe9hOwkuGdlD2Ax2kiL5tGPh420YQeMvatag+thFEKCtL339/Usm8Nuvcv/6k+WyI5b+QHFrhiIRXJOhbgM=
X-Received: by 2002:a5d:4704:0:b0:1fb:768d:7b6 with SMTP id
 y4-20020a5d4704000000b001fb768d07b6mr8060133wrq.187.1646813526848; Wed, 09
 Mar 2022 00:12:06 -0800 (PST)
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
In-Reply-To: <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 12:11:53 +0400
Message-ID: <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000047793505d9c4a795"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
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

--00000000000047793505d9c4a795
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 12:05 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 17:02, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Mar 8, 2022 at 6:43 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/08 23:26, Marc-Andr=C3=A9 Lureau wrote:
> >      > Hi
> >      >
> >      > On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
> >      >>
> >      >
> >      > (taking notes, mostly for myself)
> >      >
> >      >>> Could you provide a failing test case or a more concrete
> >     suggestion on
> >      >>> what to do instead? I am all ears :)
> >      >>>
> >      >>> thanks
> >      >>>
> >      >>
> >      >> Let me describe a more concrete case. Think that egl-headless
> >     and vnc
> >      >> are enabled. The guest devices are serial virtio-gpu-gl. vnc
> selects
> >      >> serial at first.
> >      >
> >      > (I am not sure how you would select serial first, but let's
> >     assume you did)
> >      >
> >      >>
> >      >> vnc uses register_displaychangelistener and console_select to
> switch
> >      >> consoles.
> >      >>
> >      >> displaychangelistener_display_console does the actual switching=
,
> and
> >      >> calls dpy_gfx_switch and dpy_gfx_update if con->scanout.kind is
> >      >> SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or
> >      >> dpy_gl_scanout_dmabuf if con->scanout.kind is SCANOUT_TEXTURE o=
r
> >      >> SCANOUT_DMABUF. It works for a OpenGL display, but it doesn't
> vnc in
> >      >> combination with egl-headless.
> >      >
> >      > (hmm, what doesn't work? With this patch, the DisplaySurface is
> >     always
> >      > switched, no matter what con->scanout.kind is)
> >      >
> >      >>
> >      >> virtio-gpu-gl starts scanning out texture. It would happen in t=
he
> >      >> following sequence:
> >      >> 1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind
> >     will be
> >      >> SCANOUT_SURFACE.
> >      >> 2. qemu_console_resize calls dpy_gfx_switch, delivering
> >     DisplaySurface
> >      >> to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.
> >      >
> >      > (qemu_console_resize calls dpy_gfx_replace_surface.
> con.scanout.kind
> >      > is still SCANOUT_SURFACE)
> >      >
> >      > (It calls displaychangelistener_gfx_switch() which will call
> >      > egl_gfx_switch() and update the current surface)
> >      >
> >      >> 3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless
> starts
> >      >> rendering the texture to the DisplaySurface.
> >      >
> >      > (now con.scanout.kind becomes SCANOUT_TEXTURE)
> >      >
> >      >>
> >      >> In the end, the DisplaySurface will have the image rendered, an=
d
> >      >> con->scanout.kind will be SCANOUT_TEXTURE.
> >      >
> >      > (so far it works as expected, right?)
> >      >
> >      >
> >      >
> >      >>
> >      >> Now vnc switches to virtio-gpu-gl.
> >      >>
> >      >> 4. vnc calls console_select
> >      >> 5. displaychangelistener_display_console finds con->scanout.kin=
d
> is
> >      >> SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not
> >     an OpenGL
> >      >> display. It essentially becomes no-op and the display would be
> >     blank.
> >      >>
> >      >> This patch will change it to call dpy_gfx_switch but not to cal=
l
> >      >> dpy_gfx_update.
> >      >
> >      > Alright, I think I see what you mean. egl-headless is associated
> with
> >      > a specific con, and thus is not involved during vnc console
> >     switching.
> >      >
> >      > However, dpy_gfx_switch on vnc is not a no-op. It updates the
> >     surface,
> >      > resize the client and mark the area dirty. Because the
> con.surface is
> >      > kept updated by egl-headless, the client gets the updated conten=
t.
> >      > Iow, it still works.
> >      >
> >      > If we always called dpy_gfx_update() during
> >      > displaychangelistener_display_console(), it would mean for the
> >      > listener to display the surface content, even when the scanout
> >     kind is
> >      > set for a texture. Or we need to change the behaviour of
> >      > dpy_gfx_update() to depend on the current scanout kind.
> >
> >     vnc has to display the surface content so dpy_gfx_update should be
> >     called for vnc, but not for OpenGL displays.
> >
> >
> > VNC already marks the whole surface as dirty during vnc_dpy_switch().
> > This is like calling dpy_gfx_update().
>
> Then why does it call dpy_gfx_update for SCANOUT_SURFACE first place? It
> shouldn't call the function if it is not required to display the surface
> content.
>

This is a pre-existing discrepancy. vnc handles switch with an implicit
update. Imho, we need to improve the code so that updates/display become
explicit.

But this is extra, not necessary to fix the regressions you pointed out.
I'd rather not mix concerns, and proceed step by step.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000047793505d9c4a795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 12:05 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 2022/03/09 17:02, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Mar 8, 2022 at 6:43 PM Akihiko Odaki &lt;<a href=3D"mailto:aki=
hiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/08 23:26, Marc-Andr=C3=A9 Lureau wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targ=
et=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt; =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (taking notes, mostly for myself)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Could you provide a failing test case=
 or a more concrete<br>
&gt;=C2=A0 =C2=A0 =C2=A0suggestion on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; what to do instead? I am all ears :)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Let me describe a more concrete case. Thi=
nk that egl-headless<br>
&gt;=C2=A0 =C2=A0 =C2=A0and vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; are enabled. The guest devices are serial=
 virtio-gpu-gl. vnc selects<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; serial at first.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (I am not sure how you would select serial fi=
rst, but let&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0assume you did)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; vnc uses register_displaychangelistener a=
nd console_select to switch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; consoles.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; displaychangelistener_display_console doe=
s the actual switching, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; calls dpy_gfx_switch and dpy_gfx_update i=
f con-&gt;scanout.kind is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; SCANOUT_SURFACE. It calls dpy_gl_scanout_=
texture or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gl_scanout_dmabuf if con-&gt;scanout.=
kind is SCANOUT_TEXTURE or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; SCANOUT_DMABUF. It works for a OpenGL dis=
play, but it doesn&#39;t vnc in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; combination with egl-headless.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (hmm, what doesn&#39;t work? With this patch,=
 the DisplaySurface is<br>
&gt;=C2=A0 =C2=A0 =C2=A0always<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; switched, no matter what con-&gt;scanout.kind=
 is)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; virtio-gpu-gl starts scanning out texture=
. It would happen in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; following sequence:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 1. virtio-gpu-gl calls qemu_console_resiz=
e. con-&gt;scanout.kind<br>
&gt;=C2=A0 =C2=A0 =C2=A0will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; SCANOUT_SURFACE.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2. qemu_console_resize calls dpy_gfx_swit=
ch, delivering<br>
&gt;=C2=A0 =C2=A0 =C2=A0DisplaySurface<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; to egl-headless. con-&gt;scanout.kind wil=
l be SCANOUT_TEXTURE.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (qemu_console_resize calls dpy_gfx_replace_su=
rface. con.scanout.kind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; is still SCANOUT_SURFACE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (It calls displaychangelistener_gfx_switch() =
which will call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; egl_gfx_switch() and update the current surfa=
ce)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 3. virtio-gpu-gl calls dpy_gl_scanout_tex=
ture. egl-headless starts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; rendering the texture to the DisplaySurfa=
ce.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (now con.scanout.kind becomes SCANOUT_TEXTURE=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; In the end, the DisplaySurface will have =
the image rendered, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; con-&gt;scanout.kind will be SCANOUT_TEXT=
URE.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (so far it works as expected, right?)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Now vnc switches to virtio-gpu-gl.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 4. vnc calls console_select<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 5. displaychangelistener_display_console =
finds con-&gt;scanout.kind is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; SCANOUT_TEXTURE so it tries to scanout te=
xture, but vnc is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0an OpenGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; display. It essentially becomes no-op and=
 the display would be<br>
&gt;=C2=A0 =C2=A0 =C2=A0blank.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; This patch will change it to call dpy_gfx=
_switch but not to call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gfx_update.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Alright, I think I see what you mean. egl-hea=
dless is associated with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; a specific con, and thus is not involved duri=
ng vnc console<br>
&gt;=C2=A0 =C2=A0 =C2=A0switching.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; However, dpy_gfx_switch on vnc is not a no-op=
. It updates the<br>
&gt;=C2=A0 =C2=A0 =C2=A0surface,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; resize the client and mark the area dirty. Be=
cause the con.surface is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; kept updated by egl-headless, the client gets=
 the updated content.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Iow, it still works.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; If we always called dpy_gfx_update() during<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; displaychangelistener_display_console(), it w=
ould mean for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; listener to display the surface content, even=
 when the scanout<br>
&gt;=C2=A0 =C2=A0 =C2=A0kind is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; set for a texture. Or we need to change the b=
ehaviour of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; dpy_gfx_update() to depend on the current sca=
nout kind.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0vnc has to display the surface content so dpy_gfx_u=
pdate should be<br>
&gt;=C2=A0 =C2=A0 =C2=A0called for vnc, but not for OpenGL displays.<br>
&gt; <br>
&gt; <br>
&gt; VNC already marks the whole surface as dirty during vnc_dpy_switch(). =
<br>
&gt; This is like calling dpy_gfx_update().<br>
<br>
Then why does it call dpy_gfx_update for SCANOUT_SURFACE first place? It <b=
r>
shouldn&#39;t call the function if it is not required to display the surfac=
e <br>
content.<br></blockquote><div><br></div><div>This is a pre-existing <span><=
span>discrepancy. vnc handles switch with an implicit update. Imho, we need=
 to improve the code so that updates/display become explicit.</span></span>=
</div><div><span><span><br></span></span></div><div><span><span>But this is=
 extra, not necessary to fix the regressions you pointed out. I&#39;d rathe=
r not mix concerns, and proceed step by step.<br></span></span></div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lurea=
u<br></div></div>

--00000000000047793505d9c4a795--

