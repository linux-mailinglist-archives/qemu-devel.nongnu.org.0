Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4944D2D5B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:48:12 +0100 (CET)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtrX-0006b8-RH
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRton-0004Hx-1c
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:45:22 -0500
Received: from [2a00:1450:4864:20::329] (port=46065
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRtok-0001aD-7O
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:45:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so1177517wms.4
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWdKr5bj5F5jw0QR9vzDUavbb4B1HxGhO5vilwmZVKY=;
 b=mYnibZoLzZWQqQXgqpIlEBxxHHuP7YizKDRzPiFXMklLC8sbvw/SgdMEgBdgd78YDL
 eJy+8IiXokGUkj05MplBWUBcI9plSQrYlsxC/rsJxzFxp7P/szM3jUNrRtruLqaAKS5Z
 eIWUnmoxzXg1jZaGc2xpuX8gdjKVrvP2bptPw7J1+qrz7HLbKCpF7+unYgNxATkU8NOZ
 8pIFjNx2T666TvLZ7XdwGk0LqjYjKmDUuaZgwO4y61DTIhMIAgZj2lqFS5a2Q/V+RQbA
 aCz4XsQ6/oQEJCwd096YEomFQDB5vME3Is7jlOIDnorimwg+BcBy3p1D4f3dMkrGGAtA
 bKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWdKr5bj5F5jw0QR9vzDUavbb4B1HxGhO5vilwmZVKY=;
 b=Xc5Lrv2Pdg8pElc/AkOQKo+kNwhmZsvUeZlUqT+TFktJ7puGwjPgRFdKmhoD/Oaxjr
 wMUYhTwQlE60PsBUxsd6hZ/pBgr+AYhmUFzvsa1N4v23IxkUfqa1bwWdqFXUFt94oJgq
 O44AKCsfrvQaKFGKUh1x26/P56jq18WbQEV5x8qvfWH8+cfEwMOcZrYxT3C6KDzZL6+c
 UasdVV0cFdjjCX8WUNm9MlG8n+Hy8rgDuLsb4TOHNo6laYgBRyIKwfOtmrdr5TYJaV9D
 gPhawZ0/03zAjFqSZecScvA4R3X7R0t3IHV4ZQE294CMv/GSUwGVKRolStDLwg2xMbND
 TdCw==
X-Gm-Message-State: AOAM531ADSF5066SMzozBycWtwBApmHdGXTOVGZEaddpgmWzV8lQPtXe
 z7a66lYmNvxf09GkAwubvbqgR7BECVzFzIUUZLs=
X-Google-Smtp-Source: ABdhPJz2sPIE46zdJbI6tCWNTYEmvjGAcGP+Gw9Mi+NoKalj/v4IqzGUvquMJAon10zMa9xneStAYjVQrqcFbT7JQu8=
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr7026362wmk.24.1646822716396; Wed, 09
 Mar 2022 02:45:16 -0800 (PST)
MIME-Version: 1.0
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
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
 <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
 <750d1ed6-9c02-bd1b-3988-eb44665e8e5a@gmail.com>
 <CAJ+F1CJiLdmrZbfQ0z_ObC0_GveAc4jqcj9JYN8uBCpAJUhJXA@mail.gmail.com>
 <07871c4c-58bf-b0db-b8b2-da6f0f9acfe2@gmail.com>
 <CAJ+F1CK0mEZDLb45VpoLTTVLrsqdr5b=opzBfL0ZQ+pKvtNuGw@mail.gmail.com>
 <8963a1f3-ecbe-50e1-b1e5-922e4fe63b0e@gmail.com>
In-Reply-To: <8963a1f3-ecbe-50e1-b1e5-922e4fe63b0e@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 14:45:04 +0400
Message-ID: <CAJ+F1C+ynbnfSbWC6Wf4eo9EpwnKH=ytKarYd-MtgMn_D=PLig@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000004d87905d9c6cb7f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004d87905d9c6cb7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 2:38 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 19:27, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 9, 2022 at 2:20 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/09 19:07, Marc-Andr=C3=A9 Lureau wrote:
> >      > Hi
> >      >
> >      > On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >      > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>> wrote:
> >      >
> >      >     On 2022/03/09 18:53, Marc-Andr=C3=A9 Lureau wrote:
> >      >      > Hi
> >      >      >
> >      >      > On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki
> >      >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >     <mailto:akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>>
> >      >      > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>
> >      >     <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>>> wrote:
> >      >      >
> >      >      >     On 2022/03/09 18:26, Gerd Hoffmann wrote:
> >      >      >      >    Hi,
> >      >      >      >
> >      >      >      >> dpy_gfx_switch and dpy_gfx_update need to be
> called to
> >      >     finish the
> >      >      >      >> initialization or switching of the non-OpenGL
> display.
> >      >     However,
> >      >      >     the proposed
> >      >      >      >> patch only calls dpy_gfx_switch.
> >      >      >      >>
> >      >      >      >> vnc actually does not need dpy_gfx_update because
> >     the vnc
> >      >      >     implementation of
> >      >      >      >> dpy_gfx_switch implicitly does the work for
> >      >     dpy_gfx_update, but
> >      >      >     the model of
> >      >      >      >> ui/console expects the two of dpy_gfx_switch and
> >      >     dpy_gfx_update
> >      >      >     is separated
> >      >      >      >> and only calling dpy_gfx_switch violates the mode=
l.
> >      >      >     dpy_gfx_update used to
> >      >      >      >> be called even in such a case before and it is a
> >     regression.
> >      >      >      >
> >      >      >      > Well, no, the ->dpy_gfx_switch() callback is
> >     supposed to do
> >      >      >     everything
> >      >      >      > needed to bring the new surface to the screen.  vn=
c
> >     isn't
> >      >     alone here,
> >      >      >      > gtk for example does the same (see gd_switch()).
> >      >      >      >
> >      >      >
> >      >      >
> >      >      > If dpy_gfx_switch() implies a full dpy_gfx_update(), then
> we
> >      >     would need
> >      >      > another callback to just set the new surface. This would
> avoid
> >      >      > intermediary and useless switches to 2d/surface when the
> >     scanout
> >      >     is GL.
> >      >      >
> >      >      > For consistency, we should also declare that
> >     gl_scanout_texture and
> >      >      > gl_scanout_dmabuf imply full update as well.
> >      >      >
> >      >      >      > Yes, typically this is roughly the same an explici=
t
> >      >      >     dpy_gfx_update call
> >      >      >      > would do.  So this could be changed if it helps
> >     making the
> >      >     opengl
> >      >      >     code
> >      >      >      > paths less confusing, but that should be a separat=
e
> >     patch
> >      >     series and
> >      >      >      > separate discussion.
> >      >      >      >
> >      >      >      > take care,
> >      >      >      >    Gerd
> >      >      >      >
> >      >      >
> >      >      >     Then ui/cocoa is probably wrong. I don't think it doe=
s
> the
> >      >     update when
> >      >      >     dpy_gfx_switch is called.
> >      >      >
> >      >      >     Please tell me if you think dpy_gfx_switch shouldn't
> >     do the
> >      >     implicit
> >      >      >     update in the future. I'll write a patch to do the
> >     update in
> >      >     cocoa's
> >      >      >     dpy_gfx_switch implementation otherwise.
> >      >      >
> >      >      >
> >      >      > Can we ack this series first and iterate on top? It solve=
s
> a
> >      >     number of
> >      >      > issues already and is a better starting point.
> >      >      >
> >      >      > thanks
> >      >      >
> >      >      > --
> >      >      > Marc-Andr=C3=A9 Lureau
> >      >
> >      >     The call of dpy_gfx_update in
> >     displaychangelistener_display_console
> >      >     should be removed. It would simplify the patch.
> >      >
> >      >     Also it is still not shown that the series is a better
> >     alternative to:
> >      >
> >
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/
> >     <
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>
> >      >
> >       <
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/ <
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>>
> >      >
> >      >     The series "ui/dbus: Share one listener for a console" has
> >      >     significantly
> >      >     less code than this series and therefore needs some reasonin=
g
> >     for that.
> >      >
> >      >
> >      > At this point, your change is much larger than the proposed fixe=
s.
> >
> >     My change does not touch the common code except reverting and
> minimizes
> >     the risk of regression. It also results in the less code when
> >     applied to
> >     the tree.
> >
> >
> > The risk of regressions is proportional to the amount of code change.
> > Your change is larger (and may be even larger when updated and reviewed
> > properly). At this point in Qemu schedule, this is a greater risk.
>
> Possibly it can make dbus buggy, but it is not a regression as it is a
> new feature.
>

A regression is not necessarily against the last stable, but also on the
current master which is freezing as we speak.


>
> >
> >
> >      >
> >      > I already discussed the rationale for the current design. To
> >     summarize:
> >      > - dispatching DCL in the common code allows for greater reuse if
> an
> >      > alternative to dbus emerges, and should help making the code mor=
e
> >     dynamic
> >      > - the GL context split also is a separation of concerns and
> >     should help
> >      > for alternatives to EGL
> >      > - dbus code only handles dbus specifics
> >
> >     Let me summarize my counterargument:
> >     - The suggested reuse case is not emerged yet.
> >
> >
> > It doesn't mean the design isn't superior and wanted.
>
> It doesn't, but it does not mean the design is superior and wanted either=
.
>

But your suggestion would not help in this regard.


>
> >
> >     - The GL context split is not aligned with the reality where the
> >     display
> >     knows the graphics accelerator where the window resides and the
> context
> >     should be created. The alternative to EGL can be introduced in a
> >     similar
> >
> >
> > A GL context is not necessarily associated with a window.
>
> It still can happen. Even if it is not associated with a window, it
> still requires some code to know that and the user must be aware of that.
>
>
That's why we have compatibility checks now (which also help in other cases=
)


> >
> >     manner with ui/egl-context.c and ui/egl-helpers.c. If several conte=
xt
> >     providers need to be supported, the selection should be passed as a
> >     parameter, just as the current code does for EGL rendernode.
> >
> >
> > It's not just about where the code resides, but also about the type
> > design. It's cleaner to separate DisplayGLCtxt from
> DisplayChangeListener.
>
> It would add a new failure possibility where the compatibility check
> between DisplayGLCtx and DisplayChangeListener is flawed, which happened
> with egl-headless. Unified DisplayChangeListener is a cleaner approach
> to describe the compatibility.
>

Care to describe the flaw in detail?


>
> >
> >     - implementing the dispatching would allow dbus to share more thing=
s
> >     like e.g. textures converted from DisplaySurface and GunixFDList fo=
r
> >     DMA-BUF. They are not present in all displays and some are complete=
ly
> >     specific to dbus.
> >
> >
> > And the dbus specific code is within dbus modules.
>
> The code to share e.g. GunixFDList are not yet.
>
>
 ~/src/qemu =EE=82=B0 =EE=82=A0 master =EE=82=B0 git grep UnixFD
audio/dbusaudio.c:                             GUnixFDList *fd_list,
audio/dbusaudio.c:                                 GUnixFDList *fd_list,
audio/dbusaudio.c:                                GUnixFDList *fd_list,
tests/qtest/dbus-display-test.c:    g_autoptr(GUnixFDList) fd_list =3D NULL=
;
ui/dbus-chardev.c:    GUnixFDList *fd_list,
ui/dbus-console.c:                               GUnixFDList *fd_list,
ui/dbus-listener.c:    g_autoptr(GUnixFDList) fd_list =3D NULL;
..

>
> >
> >      >
> >      > My understanding of your proposal is that you would rather see
> >     all this
> >      > done within the dbus code. I disagree for the reasons above. I
> >     may be
> >      > proven wrong, but so far, this works as expected minor the
> >     left-over and
> >      > regressions you pointed out that should be fixed. Going back to =
a
> >      > different design should be done in a next release if sufficientl=
y
> >     motivated.
> >
> >     Reverting the dbus change is the safest option if it does not settl=
e.
> >
> >
> > We have a different sense of safety.
>
> Can you elaborate?
>

See above.

Sorry, I'll slow down my reply, as I think we have made enough rumble and
not much progress.

thanks again for helping so far


--=20
Marc-Andr=C3=A9 Lureau

--00000000000004d87905d9c6cb7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 2:38 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/09 19:27, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 9, 2022 at 2:20 PM Akihiko Odaki &lt;<a href=3D"mailto:aki=
hiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 19:07, Marc-Andr=C3=A9 Lureau wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targ=
et=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gm=
ail.com" target=3D"_blank">akihiko.odaki@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 18:53, Marc-=
Andr=C3=A9 Lureau wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Mar 9, 2022 =
at 1:32 PM Akihiko Odaki<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mail=
to:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.oda=
ki@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mail=
to:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&g=
t;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=
=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0O=
n 2022/03/09 18:26, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; dpy_gfx_switch and dpy_gfx_update need to be called to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0finish the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; initialization or switching of the non-OpenGL display.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0t=
he proposed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; patch only calls dpy_gfx_switch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; vnc actually does not need dpy_gfx_update because<br>
&gt;=C2=A0 =C2=A0 =C2=A0the vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0i=
mplementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; dpy_gfx_switch implicitly does the work for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0t=
he model of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; ui/console expects the two of dpy_gfx_switch and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0i=
s separated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; and only calling dpy_gfx_switch violates the model.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
py_gfx_update used to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;&gt; be called even in such a case before and it is a<br>
&gt;=C2=A0 =C2=A0 =C2=A0regression.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Well, no, the -&gt;dpy_gfx_switch() callback is<br>
&gt;=C2=A0 =C2=A0 =C2=A0supposed to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0e=
verything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; needed to bring the new surface to the screen.=C2=A0 vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0isn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0alone here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; gtk for example does the same (see gd_switch()).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; If dpy_gfx_switch() =
implies a full dpy_gfx_update(), then we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0would need<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; another callback to =
just set the new surface. This would avoid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; intermediary and use=
less switches to 2d/surface when the<br>
&gt;=C2=A0 =C2=A0 =C2=A0scanout<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0is GL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; For consistency, we =
should also declare that<br>
&gt;=C2=A0 =C2=A0 =C2=A0gl_scanout_texture and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; gl_scanout_dmabuf im=
ply full update as well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Yes, typically this is roughly the same an explicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
py_gfx_update call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; would do.=C2=A0 So this could be changed if it helps<br>
&gt;=C2=A0 =C2=A0 =C2=A0making the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0opengl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
ode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; paths less confusing, but that should be a separate<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0series and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; separate discussion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; take care,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;=C2=A0 =C2=A0 Gerd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0T=
hen ui/cocoa is probably wrong. I don&#39;t think it does the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0update when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
py_gfx_switch is called.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0P=
lease tell me if you think dpy_gfx_switch shouldn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0do the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0implicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0u=
pdate in the future. I&#39;ll write a patch to do the<br>
&gt;=C2=A0 =C2=A0 =C2=A0update in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0cocoa&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
py_gfx_switch implementation otherwise.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can we ack this seri=
es first and iterate on top? It solves a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0number of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; issues already and i=
s a better starting point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Marc-Andr=C3=A9 Lure=
au<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0The call of dpy_gfx_update=
 in<br>
&gt;=C2=A0 =C2=A0 =C2=A0displaychangelistener_display_console<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0should be removed. It woul=
d simplify the patch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Also it is still not shown=
 that the series is a better<br>
&gt;=C2=A0 =C2=A0 =C2=A0alternative to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchew.org/QEMU/20220213024222.=
3548-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https=
://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchew.org/QEMU/20220213024=
222.3548-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchew.org/QEMU/2022=
0213024222.3548-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.co=
m/</a> &lt;<a href=3D"https://patchew.org/QEMU/20220213024222.3548-1-akihik=
o.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.or=
g/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0The series &quot;ui/dbus: =
Share one listener for a console&quot; has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0significantly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0less code than this series=
 and therefore needs some reasoning<br>
&gt;=C2=A0 =C2=A0 =C2=A0for that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; At this point, your change is much larger tha=
n the proposed fixes.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0My change does not touch the common code except rev=
erting and minimizes<br>
&gt;=C2=A0 =C2=A0 =C2=A0the risk of regression. It also results in the less=
 code when<br>
&gt;=C2=A0 =C2=A0 =C2=A0applied to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the tree.<br>
&gt; <br>
&gt; <br>
&gt; The risk of regressions is proportional to the amount of code change. =
<br>
&gt; Your change is larger (and may be even larger when updated and reviewe=
d <br>
&gt; properly). At this point in Qemu schedule, this is a greater risk.<br>
<br>
Possibly it can make dbus buggy, but it is not a regression as it is a <br>
new feature.<br></blockquote><div><br></div><div>A regression is not necess=
arily against the last stable, but also on the current master which is free=
zing as we speak.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I already discussed the rationale for the cur=
rent design. To<br>
&gt;=C2=A0 =C2=A0 =C2=A0summarize:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - dispatching DCL in the common code allows f=
or greater reuse if an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; alternative to dbus emerges, and should help =
making the code more<br>
&gt;=C2=A0 =C2=A0 =C2=A0dynamic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - the GL context split also is a separation o=
f concerns and<br>
&gt;=C2=A0 =C2=A0 =C2=A0should help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for alternatives to EGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - dbus code only handles dbus specifics<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Let me summarize my counterargument:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- The suggested reuse case is not emerged yet.<br>
&gt; <br>
&gt; <br>
&gt; It doesn&#39;t mean the design isn&#39;t superior and wanted.<br>
<br>
It doesn&#39;t, but it does not mean the design is superior and wanted eith=
er.<br></blockquote><div><br></div><div>But your suggestion would not help =
in this regard.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- The GL context split is not aligned with the real=
ity where the<br>
&gt;=C2=A0 =C2=A0 =C2=A0display<br>
&gt;=C2=A0 =C2=A0 =C2=A0knows the graphics accelerator where the window res=
ides and the context<br>
&gt;=C2=A0 =C2=A0 =C2=A0should be created. The alternative to EGL can be in=
troduced in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0similar<br>
&gt; <br>
&gt; <br>
&gt; A GL context is not necessarily associated with a window.<br>
<br>
It still can happen. Even if it is not associated with a window, it <br>
still requires some code to know that and the user must be aware of that.<b=
r>
<br></blockquote><div><br></div><div>That&#39;s why we have compatibility c=
hecks now (which also help in other cases)<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0manner with ui/egl-context.c and ui/egl-helpers.c. =
If several context<br>
&gt;=C2=A0 =C2=A0 =C2=A0providers need to be supported, the selection shoul=
d be passed as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0parameter, just as the current code does for EGL re=
ndernode.<br>
&gt; <br>
&gt; <br>
&gt; It&#39;s not just about where the code resides, but also about the typ=
e <br>
&gt; design. It&#39;s cleaner to separate DisplayGLCtxt from DisplayChangeL=
istener.<br>
<br>
It would add a new failure possibility where the compatibility check <br>
between DisplayGLCtx and DisplayChangeListener is flawed, which happened <b=
r>
with egl-headless. Unified DisplayChangeListener is a cleaner approach <br>
to describe the compatibility.<br></blockquote><div><br></div><div>Care to =
describe the flaw in detail?</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- implementing the dispatching would allow dbus to =
share more things<br>
&gt;=C2=A0 =C2=A0 =C2=A0like e.g. textures converted from DisplaySurface an=
d GunixFDList for<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMA-BUF. They are not present in all displays and s=
ome are completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0specific to dbus.<br>
&gt; <br>
&gt; <br>
&gt; And the dbus specific code is within dbus modules.<br>
<br>
The code to share e.g. GunixFDList are not yet.<br>
<br></blockquote><div><br></div><div>=C2=A0~/src/qemu =EE=82=B0 =EE=82=A0 m=
aster =EE=82=B0 git grep UnixFD =C2=A0 =C2=A0 <br>audio/dbusaudio.c: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GUnixFDList *fd_list,<br>audio/dbusaudio.c: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 GUnixFDList *fd_list,<br>audio/dbusaudio.c: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUnixFDList *fd_list,<br>tests/qtest/dbus-di=
splay-test.c: =C2=A0 =C2=A0g_autoptr(GUnixFDList) fd_list =3D NULL;<br>ui/d=
bus-chardev.c: =C2=A0 =C2=A0GUnixFDList *fd_list,<br>ui/dbus-console.c: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GUnixFDList *fd_list,<br>ui/dbus-listener.c: =
=C2=A0 =C2=A0g_autoptr(GUnixFDList) fd_list =3D NULL;</div><div>..</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; My understanding of your proposal is that you=
 would rather see<br>
&gt;=C2=A0 =C2=A0 =C2=A0all this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; done within the dbus code. I disagree for the=
 reasons above. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0may be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; proven wrong, but so far, this works as expec=
ted minor the<br>
&gt;=C2=A0 =C2=A0 =C2=A0left-over and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; regressions you pointed out that should be fi=
xed. Going back to a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; different design should be done in a next rel=
ease if sufficiently<br>
&gt;=C2=A0 =C2=A0 =C2=A0motivated.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reverting the dbus change is the safest option if i=
t does not settle.<br>
&gt; <br>
&gt; <br>
&gt; We have a different sense of safety.<br>
<br>
Can you elaborate?<br></blockquote><div><br></div><div>See above. <br></div=
></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Sorr=
y, I&#39;ll slow down my reply, as I think we have made enough rumble and n=
ot much progress.</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">thanks again for helping so far<br></div><div class=3D"gmail_qu=
ote"><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000004d87905d9c6cb7f--

